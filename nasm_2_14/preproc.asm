; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY ÖN İŞLEMCİ MOTORU (preproc.asm)
; `nasm386.asm` include zincirinin parser.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

; 01/09/2026 - Google AI

section .text
align 4

; -----------------------------------------------------------------------------
; Fonksiyon: preproc_init
; C Deklarasyonu: int preproc_init(void)
; İşlev: Ön işlemci makro havuzunu ve durum sayaçlarını hazırlar.
; Çıktı: EAX = 1 (Başarı)
; Değişen Register'lar: EAX, ECX, EDX
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP
; -----------------------------------------------------------------------------
global preproc_init
preproc_init:
    push ebp
    mov ebp, esp
    
    mov dword [nasm_macro_pool_ptr], nasm_macro_pool_buffer
    mov dword [nasm_macro_count], 0
    
    mov eax, 1                  ; Geriye başarı (1) döndür
    mov esp, ebp
    pop ebp
    ret

align 4

; -----------------------------------------------------------------------------
; Fonksiyon: preproc_getline
; C Deklarasyonu: char *preproc_getline(void)
; İşlev: Aktif kaynak dosyadan bir satır okur ve ASCIIZ tamponuna yazar.
; Çıktı: EAX = Okunan satırın bellek adresi (Pointer), EOF ise NULL (0)
; Değişen Register'lar: EAX, ECX, EDX
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP
; -----------------------------------------------------------------------------
global preproc_getline
preproc_getline:
    push ebp
    mov ebp, esp
    push ebx                    ; * (EBX Koruma Altında)
    push esi                    ; ** (ESI Koruma Altında)
    push edi                    ; *** (EDI Koruma Altında)

    mov edi, nasm_line_buffer   ; EDI = Satırın yazılacağı BSS adresi
    xor esi, esi                ; ESI = Okunan anlık karakter sayacı (cc)

.L_char_loop:
    ; read(nasm_input_file_handle, &nasm_char_temp, 1) sarmal çağrısı
    push 1                      ; Parametre 3: count = 1 byte
    push nasm_char_temp         ; Parametre 2: buffer adresi
    push dword [nasm_input_file_handle] ; Parametre 1: LIBC FD (3-12)
    call read                   ; system.asm içindeki zırhlı ve optimize read
    add esp, 12                 ; Stack temizle

    cmp eax, 1                  ; 1 byte okunabildi mi?
    jne .L_check_eof_condition  ; Okunamadıysa dosya sonu (EOF) kontrolüne git

    mov al, [nasm_char_temp]    ; Okunan karakteri AL'ye al
    mov [edi], al               ; Karakteri satır tamponuna yaz
    inc edi
    inc esi                     ; Sayaç artır

    cmp al, 10                  ; Satır sonu (Line Feed / \n) ulaşıldı mı?
    je .L_line_done

    cmp esi, 4095               ; 4 KB tampon bellek taşma sınır koruması
    jae .L_line_done
    jmp .L_char_loop

.L_check_eof_condition:
    test esi, esi               ; Hiç karakter okunmadan mı EOF oldu?
    jz .L_preproc_eof           ; Evet ise doğrudan NULL dön

.L_line_done:
    mov byte [edi], 0           ; Satır sonuna kesin ASCIIZ Null Terminator ekle
    mov eax, nasm_line_buffer   ; Başarı durumunda EAX = Okunan satır pointer'ı
    jmp .L_preproc_exit

.L_preproc_eof:
    xor eax, eax                ; EOF/Hata durumunda C standardına uygun NULL (0) dön

.L_preproc_exit:
    pop edi                     ; *** (EDI Kurtarıldı)
    pop esi                     ; ** (ESI Kurtarıldı)
    pop ebx                     ; * (EBX Kurtarıldı)
    mov esp, ebp
    pop ebp
    ret
