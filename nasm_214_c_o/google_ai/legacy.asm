; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY GERİYE DÖNÜK UYUMLULUK KÖPRÜSÜ (legacy.asm)
; `nasm386.asm` include zincirinin outlib.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_legacy_output_wrapper

section .text
align 4

; =========================================================================
; void nasm_legacy_output_wrapper(void *param)
; Eski tip çıktı fonksiyon imzasını modern arayüze bağlayan nötr sarmalayıcı.
; =========================================================================
nasm_legacy_output_wrapper:
    push ebp
    mov ebp, esp

    ; Bu modül eski API kalıntılarını absorbe ettiği için nötr geçiş yapar.
    mov eax, [ebp + 8]          ; Gelen parametreyi bozmadan geri dön
    
    pop ebp
    ret
