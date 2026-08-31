; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY ÖN İŞLEMCİ MOTORU (preproc.asm)
; `nasm386.asm` include zincirinin parser.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global preproc_init
global preproc_getline

; extern nasm_malloc
; extern nasm_free
; extern open
; extern read
; extern close

section .text
align 4

; =========================================================================
; int preproc_init(void)
; Makro tablolarını sıfırlar ve ön işlemci katmanını hazır hale getirir.
; =========================================================================
preproc_init:
    push ebp
    mov ebp, esp

    ; BSS alanındaki makro ve include derinlik sayaçlarını sıfırla
    mov dword [nasm_macro_count], 0
    mov dword [nasm_include_depth], 0

    mov eax, 1                  ; Başarılı ilklendirme: Return 1
    pop ebp
    ret

align 4

; =========================================================================
; char *preproc_getline(void)
; Kaynak dosyadan ön işlemden geçirilmiş sıradaki temiz satırı okur.
; =========================================================================
preproc_getline:
    push ebp
    mov ebp, esp
    sub esp, 12                 ; Yerel hücreler (handle, byte_read)
    push ebx
    push esi

    extern src_filename         ; nasm.asm/bss.asm içindeki girdi dosyası adı
    mov esi, dword [src_filename]
    test esi, esi
    jz .L_preproc_eof

    ; Eğer aktif bir dosya handle'ı yoksa dosyayı aç (+3 LIBC FD zırhıyla)
    mov ebx, dword [active_file_handle]
    test ebx, ebx
    jnz .L_read_line_block

    push 0                      ; Mode = 0 (Read Only)
    push esi                    ; filename
    call open
    add esp, 8
    cmp eax, -1
    je .L_preproc_eof
    mov dword [active_file_handle], eax
    mov ebx, eax

.L_read_line_block:
    ; 1. Satır tamponu için 1024 byte bellek ayır (Dinamik satır hücresi)
    push 1024
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_preproc_eof
    mov [ebp - 4], eax          ; [ebp - 4] = line_buffer

    ; 2. Dosyadan 1 karakter 1 karakter tara (Satır sonu \n veya \r görene kadar)
    mov esi, [ebp - 4]          ; esi = buffer pointer
    xor ecx, ecx                ; ecx = char_count = 0

.L_char_loop:
    cmp ecx, 1023
    jge .L_line_done            ; Tampon dolduysa satırı bitir

    lea edx, [ebp - 8]          ; Geçici tek baytlık okuma adresi
    push 1                      ; 1 byte
    push edx
    push ebx                    ; active_file_handle
    call read                   ; libc.a read fonksiyonu
    add esp, 12
    test eax, eax
    jle .L_check_eof_condition  ; Okunan byte <= 0 ise EOF kontrolüne git

    mov al, byte [ebp - 8]      ; Okunan karakteri al
    mov byte [esi + ecx], al    ; Tampona yaz
    inc ecx

    cmp al, 10                  ; LF (\n) karakteri mi? (Satır sonu)
    je .L_line_done
    jmp .L_char_loop

.L_check_eof_condition:
    test ecx, ecx
    jz .L_close_and_eof         ; Hiç karakter okunmadıysa dosya tamamen bitmiştir

.L_line_done:
    mov byte [esi + ecx], 0     ; Satır dizesini null terminator ile kapat
    mov eax, esi                ; Return EAX = line_buffer adresi
    jmp .L_preproc_exit

.L_close_and_eof:
    ; Dosyayı kapat ve handle'ı sıfırla
    push dword [active_file_handle]
    call close
    add esp, 4
    mov dword [active_file_handle], 0
    
    ; Ayırılan boş tamponu temizle
    push dword [ebp - 4]
    call nasm_free
    add esp, 4

.L_preproc_eof:
    xor eax, eax                ; EOF veya Hata: Return NULL (0)

.L_preproc_exit:
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
