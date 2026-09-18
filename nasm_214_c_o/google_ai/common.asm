; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY YARDIMCI MODÜLÜ (common.asm) - PARÇA 1 / 2
; `nasm386.asm` include zincirinin nasm.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_clean_string
global nasm_align_size
global nasm_get_extension

; extern strlen
; extern memcpy
; extern strrchr

section .text
align 4

; =========================================================================
; char *nasm_clean_string(char *dst, const char *src)
; Girdi stringindeki görünmeyen kontrol karakterlerini temizler.
; =========================================================================
nasm_clean_string:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov edi, [ebp + 8]          ; edi = dst (hedef)
    mov esi, [ebp + 12]         ; esi = src (kaynak)

    test esi, esi
    jz .L_clean_null

.L_clean_loop:
    mov al, byte [esi]
    test al, al
    jz .L_clean_done            ; Null terminator görünce çık

    ; Kontrol karakterlerini (ASCII < 32) boşluk ile temizle (Bypass simülasyonu)
    cmp al, 32
    jae .L_clean_store
    mov al, 32                  ; Boşluk karakteri ata

.L_clean_store:
    mov byte [edi], al
    inc esi
    inc edi
    jmp .L_clean_loop

.L_clean_null:
    xor eax, eax
    jmp .L_clean_exit

.L_clean_done:
    mov byte [edi], 0           ; Hedef dizeyi sonlandır
    mov eax, [ebp + 8]          ; Dönüş değeri: dst pointer

.L_clean_exit:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; =========================================================================
; size_t nasm_align_size(size_t size, size_t align_boundary)
; Belirtilen sınra göre adresi/boyutu hizalar (4, 16, 64 byte vb.)
; =========================================================================
nasm_align_size:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = size
    mov ebx, [ebp + 12]         ; ebx = align_boundary

    test ebx, ebx
    jz .L_align_done
    dec ebx                     ; mask = boundary - 1

    add eax, ebx
    not ebx
    and eax, ebx                ; eax = (size + mask) & ~mask

.L_align_done:
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; const char *nasm_get_extension(const char *filename)
; Dosya adının uzantısını (.s, .asm, .txt vb.) bulur ve döndürür.
; =========================================================================
nasm_get_extension:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = filename
    test eax, eax
    jz .L_ext_null

    ; Nokta (.) karakterini dize sonunda ara
    push 46                     ; '.' karakterinin ASCII kodu (46)
    push eax                    ; filename
    call strrchr                ; libc.a içindeki strrchr çağrısı
    add esp, 8
    
    test eax, eax
    jz .L_ext_not_found
    inc eax                     ; Noktayı geç, uzantının kendisine odaklan
    jmp .L_ext_done

.L_ext_not_found:
    xor eax, eax                ; Nokta bulunamadıysa NULL dön

.L_ext_null:
    xor eax, eax

.L_ext_done:
    pop ebp
    ret

    ; --- PARÇA 2 BU NOKTADAN İTİBAREN HATA VE LOGLAMA RUTİNLERİNİ İÇERECEK ---