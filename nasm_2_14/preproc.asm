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
    push ebx                    ; *
    push esi                    ; **
    push edi                    ; ***

    mov edi, nasm_line_buffer   ; EDI = Satır tamponu adresi
    xor esi, esi                ; ESI = Karakter sayacı (cc)

.L_char_loop:
    push 1                      ; count = 1 byte
    push nasm_char_temp         ; buffer ptr
    push dword [nasm_input_file_handle] ; LIBC FD
    call read
    add esp, 12                 ; Stack temizle

    cmp eax, 1                  ; 1 byte okundu mu?
    jne .L_check_eof_condition

    mov al, [nasm_char_temp]    ; AL = Okunan karakter

    cmp al, 13                  ; Carriage Return (\r) mu?
    je .L_char_loop             ; \r karakterini tampona yazma, direkt atla!

    cmp al, 10                  ; Line Feed (\n) mu?
    je .L_line_completed        ; \n gördüysen satır bitti demektir

    ; Normal karakterleri tampona yaz
    mov [edi], al
    inc edi
    inc esi

    cmp esi, 4095               ; Taşma koruması
    jae .L_line_completed
    jmp .L_char_loop

.L_check_eof_condition:
    test esi, esi               ; Hiç karakter okunmadan mı EOF oldu?
    jz .L_preproc_eof           ; Evet ise NULL dön

.L_line_completed:
    mov byte [edi], 0           ; Satırı temiz bir ASCIIZ string yap (CRLF'ten arındırıldı!)
    
    ; --- HATA VERSE BİLE SATIR SAYACINI KOŞULSUZ ARTIRMA KURALI ---
    inc dword [nasm_global_line_counter] ; Global satır sayacını (B) 1 artır
    
    mov eax, nasm_line_buffer   ; Geriye temiz satır pointer'ını döndür
    jmp .L_preproc_exit

.L_preproc_eof:
    xor eax, eax                ; EOF durumunda NULL dön

.L_preproc_exit:
    pop edi                     ; ***
    pop esi                     ; **
    pop ebx                     ; *
    mov esp, ebp
    pop ebp
    ret

