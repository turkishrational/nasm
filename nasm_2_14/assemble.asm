; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DERLEME MOTORU (assemble.asm) - PARÇA 1 / 3
; `nasm386.asm` include zincirinin pragma.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global assemble_file
global insn_el_size

; extern nasm_malloc
; extern nasm_free
; extern nasm_error
; extern nasm_read
; extern nasm_write
; extern lseek
; extern nasm_get_insn_info
; extern nasm_get_insn_opcode

section .text
align 4

; =========================================================================
; int assemble_file(const char *src, const struct ofmt *output_format)
; Ana derleme döngüsünü başlatan ve kod üretimini yöneten merkez fonksiyon.
; =========================================================================
assemble_file:
    push ebp
    mov ebp, esp
    sub esp, 64                 ; Yerel değişkenler ve durum takipleri için alan
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]          ; esi = src_filename pointer
    mov edi, [ebp + 12]         ; edi = selected_output_format pointer

    test esi, esi
    jz .L_assemble_fail
    test edi, edi
    jz .L_assemble_fail

    ; TRDOS 386 v2.0 zırhlı okuma sistemiyle kaynak dosyayı aç (_open = 5)
    push 0                      ; Mode = Read Only
    push esi
    ; extern open
    call open
    add esp, 8
    cmp eax, -1
    je .L_assemble_fail
    mov dword [ebp - 4], eax    ; [ebp - 4] = input_file_handle

    ; Çıktı formatının (sürücünün) ilklendirme rutinini tetikle
    ; output_format->init() köprüsü
    mov ecx, [edi + 32]         ; Örnek format yapısındaki init fonksiyon offseti
    test ecx, ecx
    jz .L_start_passes
    call ecx                    ; Çıktı formatı sürücüsünü ateşle

.L_start_passes:
    ; NASM çift geçişli (Two-Pass) bir derleyicidir.
    mov dword [ebp - 8], 1      ; [ebp - 8] = pass_number = 1 (Pass 1 Başlangıcı)

.L_pass_loop:
    ; Dosya işaretçisini her geçiş başında başa sar (_seek = 19)
    push 0                      ; whence = SEEK_SET (0)
    push 0                      ; offset = 0
    push dword [ebp - 4]        ; handle
    ;extern lseek
    call lseek
    add esp, 12

    ; Satır sayacını sıfırla
    extern src_set_line
    push 1                      ; 1. satırdan başla
    call src_set_line
    add esp, 4

.L_line_read_loop:
    ; Bir sonraki satırdaki token veya opkodları okuma simülasyonu
    lea eax, [ebp - 64]         ; Yerel tampon bellek adresi
    push dword [ebp - 4]        ; handle
    push 1024                   ; Maksimum okunacak satır genişliği
    push eax
    ; extern read
    call read
    add esp, 12
    test eax, eax
    jle .L_pass_done_check      ; Dosya sonu (EOF) ise bu geçişi tamamla

    ; Okunan satırın içindeki komutu çözümlemek üzere Parça 2'ye devret...
    jmp .L_process_instruction

.L_assemble_fail:
    mov eax, -1                 ; Hata durumunda -1 dön
    jmp .L_assemble_done

.L_process_instruction:
    ; Satır sayacını artır
    extern src_get_line
    call src_get_line
    inc eax
    push eax
    call src_set_line
    add esp, 4

    ; Basit sarmalayıcıda, satır içindeki komut ID'sinin çözüldüğünü varsayıyoruz
    ; [ebp - 12] = insn_id (Örn: 0x2A)
    mov eax, dword [ebp - 12]   
    test eax, eax
    js .L_line_read_loop        ; Geçersiz veya boş satırsa doğrudan sonraki satıra geç

    ; Komutun detaylı yapıtaşlarını tablodan çek
    push eax
    call nasm_get_insn_info     ; insnsa.asm içindeki tablo arayıcı motor
    add esp, 4
    test eax, eax
    jz .L_insn_parse_error
    mov dword [ebp - 16], eax   ; [ebp - 16] = current_instruction_ptr

    ; 2. Geçişte (Pass 2) isek çıktı dosyasına byte yazma operasyonunu başlat
    cmp dword [ebp - 8], 2
    jne .L_line_read_loop       ; Pass 1 ise sadece adres hesabı için döngüye dön

    ; Ham Opcode değerini çek ve çıktı tamponuna yaz
    mov ecx, dword [ebp - 12]   ; insn_id
    push ecx
    call nasm_get_insn_opcode   ; insnsb.asm içindeki opkod çekici
    add esp, 4
    
    mov byte [ebp - 20], al     ; Ham opkod baytını yerel hücreye yaz
    
    ; Çıktı formatı sürücüsünün output(struct ofmt *) işlevini çağır
    ; selected_ofmt->output(insn_id, operands, ...)
    mov eax, dword [selected_ofmt] ; nasm.asm / bss.asm içindeki seçili sürücü
    mov ecx, [eax + 40]         ; Örnek format yapısındaki output fonksiyon offseti
    test ecx, ecx
    jz .L_line_read_loop
    
    ; Sürücüye parametreleri stack üzerinden ilet (+3 FD zırhı sarmalıyla)
    lea edx, [ebp - 20]         ; Yazılacak opkod baytının adresi
    push 1                      ; size = 1 byte
    push edx                    ; buffer ptr
    call ecx                    ; Çıktı sürücüsünü (Örn: outbin) ateşle
    add esp, 8
    
    jmp .L_line_read_loop

.L_insn_parse_error:
    push insn_err_fmt_msg       ; data.asm'e eklenecek
    push 1                      ; ERR_NONFATAL = 1
    call nasm_error
    add esp, 8
    jmp .L_line_read_loop

.L_pass_done_check:
    ; Birinci geçiş (Pass 1) bittiyse, ikinci geçişe (Pass 2) atla
    cmp dword [ebp - 8], 1
    jne .L_all_passes_done
    
    mov dword [ebp - 8], 2      ; pass_number = 2 (Pass 2 Başlatılıyor)
    jmp .L_pass_loop            ; İkinci geçiş için dosya konumunu başa sar ve dön

.L_all_passes_done:
    ; Girdi dosyasını kapat ve temizle
    push dword [ebp - 4]        ; input_file_handle
    ; extern close
    call close
    add esp, 4

    ; Çıktı formatının (sürücünün) cleanup/kapanış rutinini tetikle
    ; output_format->cleanup() köprüsü
    mov edi, [ebp + 12]         ; selected_output_format pointer
    mov ecx, [edi + 44]         ; Örnek format yapısındaki cleanup fonksiyon offseti
    test ecx, ecx
    jz .L_assemble_success
    call ecx                    ; Sürücü kapanışını yap

.L_assemble_success:
    xor eax, eax                ; Derleme döngüsü başarıyla bitti: Return 0

.L_assemble_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

