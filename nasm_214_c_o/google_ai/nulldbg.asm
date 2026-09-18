; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY PASİF DEBUG SÜRÜCÜSÜ (nulldbg.asm)
; `nasm386.asm` include zincirinin strtbl.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global null_debug_init
global null_debug_linnum

section .text
align 4

; =========================================================================
; void null_debug_init(void)
; =========================================================================
null_debug_init:
    ret                         ; Nötr geçiş, işlem yapma

align 4

; =========================================================================
; void null_debug_linnum(const char *filename, long line_num, int32_t seg)
; =========================================================================
null_debug_linnum:
    ret                         ; Debug satır numarası üretme isteklerini yutar
