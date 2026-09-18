; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY PASİF ÖN İŞLEMCİ MODÜLÜ (preproc-nop.asm)
; `nasm386.asm` include zincirinin segalloc.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_preproc_nop_getline

; extern preproc_getline

section .text
align 4

; =========================================================================
; char *nasm_preproc_nop_getline(void)
; Ön işlemci makro süzgeçlerini tamamen baypas ederek ham satırı çeker.
; =========================================================================
nasm_preproc_nop_getline:
    push ebp
    mov ebp, esp

    ; Doğrudan preproc.asm içindeki ham satır okuyucu motoru tetikle
    call preproc_getline        ; EAX = okunan dize adresi (veya NULL)

    pop ebp
    ret
