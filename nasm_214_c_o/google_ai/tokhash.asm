; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY TOKEN HASH SÜRÜCÜSÜ (tokhash.asm)
; `nasm386.asm` include zincirinin strfunc.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_token_hash

; extern nasm_hash

section .text
align 4

; =========================================================================
; unsigned int nasm_token_hash(const char *str, int *token_type)
; Kelimenin hash değerini hesaplar ve süzgeç tipini (type) belirler.
; =========================================================================
nasm_token_hash:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = str pointer adresi
    mov ecx, [ebp + 12]         ; ecx = token_type pointer adresi

    test ecx, ecx
    jz .L_tok_hash_calc
    mov dword [ecx], 1          ; default type = TOKEN_GENERIC (1)

.L_tok_hash_calc:
    push eax
    call nasm_hash              ; hashtbl.asm içindeki genel DJB2 motoru
    add esp, 4                  ; EAX = hesaplanan ham hash değeri

    pop ebp
    ret
