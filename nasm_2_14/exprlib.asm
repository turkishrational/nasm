; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY İFADE KÜTÜPHANE MODÜLÜ (exprlib.asm)
; `nasm386.asm` include zincirinin eval.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_expr_copy
global nasm_expr_free

; extern nasm_malloc
; extern nasm_free
; extern memcpy

section .text
align 4

; --- EXPR STRUCT OFFSETS ---
; +0 : int64_t value
; +8 : int type

; =========================================================================
; struct expr *nasm_expr_copy(const struct expr *src)
; Bir matematiksel ifade yapısını kopyalayıp heap üzerinde çoğaltır.
; =========================================================================
nasm_expr_copy:
    push ebp
    mov ebp, esp
    push esi

    mov esi, [ebp + 8]          ; esi = src pointer adresi
    test esi, esi
    jz .L_copy_null

    ; struct expr için 12 byte (value_low + value_high + type) yer ayır
    push 12
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_copy_null

    ; Veriyi kopyala
    push 12                     ; size = 12
    push esi                    ; src
    push eax                    ; dest (yeni ayrılan alan)
    call memcpy
    add esp, 12
    jmp .L_copy_done

.L_copy_null:
    xor eax, eax                ; Return NULL (0)

.L_copy_done:
    pop esi
    pop ebp
    ret

align 4

; =========================================================================
; void nasm_expr_free(struct expr *e)
; Dinamik olarak oluşturulan ifade hücrelerini hafızadan temizler.
; =========================================================================
nasm_expr_free:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = e
    test eax, eax
    jz .L_free_done

    push eax
    call nasm_free              ; yerel bellek temizleyici köprüsü
    add esp, 4

.L_free_done:
    pop ebp
    ret
