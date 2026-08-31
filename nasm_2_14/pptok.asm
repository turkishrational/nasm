; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY ÖN İŞLEMCİ TOKEN MODÜLÜ (pptok.asm)
; `nasm386.asm` include zincirinin quote.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_pptok_hash
global nasm_pptok_find

; extern strcmp

section .text
align 4

; =========================================================================
; unsigned int nasm_pptok_hash(const char *str)
; Ön işlemci anahtar kelimeleri için hafif ve optimize bir hash değeri üretir.
; =========================================================================
nasm_pptok_hash:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 8]          ; esi = str pointer
    xor eax, eax                ; hash = 0
    test esi, esi
    jz .L_pptok_hash_done

.L_pptok_hash_loop:
    xor ebx, ebx
    mov bl, byte [esi]
    test bl, bl
    jz .L_pptok_hash_done

    ; hash = (hash * 33) ^ c (Kompakt hash tetiği)
    mov edx, eax
    shl eax, 5
    add eax, edx
    xor eax, ebx

    inc esi
    jmp .L_pptok_hash_loop

.L_pptok_hash_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; int nasm_pptok_find(const char *str)
; Ön işlemci tablosunda kelimeyi arar ve iç token numarasını döner.
; =========================================================================
nasm_pptok_find:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 8]          ; esi = str
    test esi, esi
    jz .L_pptok_not_found

    ; "define" komutu mu kontrol et (Bypass simülasyonu)
    push pptok_str_define       ; data.asm'e eklenecek
    push esi
    call strcmp
    add esp, 8
    test eax, eax
    jz .L_pptok_found_define

    ; "include" komutu mu kontrol et
    push pptok_str_include
    push esi
    call strcmp
    add esp, 8
    test eax, eax
    jz .L_pptok_found_include

    jmp .L_pptok_not_found

.L_pptok_found_define:
    mov eax, 100                ; %define iç kodu: Return 100
    jmp .L_pptok_find_done

.L_pptok_found_include:
    mov eax, 101                ; %include iç kodu: Return 101
    jmp .L_pptok_find_done

.L_pptok_not_found:
    mov eax, -1                 ; Bulunamadı: Return -1

.L_pptok_find_done:
    pop esi
    pop ebx
    pop ebp
    ret
