; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY NÖTR ÇIKTI SÜRÜCÜSÜ (nullout.asm)
; `nasm386.asm` include zincirinin nulldbg.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global null_output_init
global null_output_write

section .text
align 4

; =========================================================================
; void null_output_init(void)
; =========================================================================
null_output_init:
    ret

align 4

; =========================================================================
; void null_output_write(int type, const void *data, size_t len)
; =========================================================================
null_output_write:
    push ebp
    mov ebp, esp
    
    ; Gelen ham bytecode verisini diske yazmadan nötr olarak yutar.
    mov eax, [ebp + 16]         ; eax = len (Okundu say ve uzunluğu dön)
    
    pop ebp
    ret
