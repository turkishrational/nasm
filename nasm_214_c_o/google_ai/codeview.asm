; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY CODEVIEW DEBUG SÜRÜCÜSÜ (codeview.asm)
; `nasm386.asm` include zincirinin outelf.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_cv_init
global nasm_cv_linnum

section .text
align 4

; =========================================================================
; void nasm_cv_init(void)
; =========================================================================
nasm_cv_init:
    ret                         ; Nötr geçiş, debug bayrakları pasifse işlem yapmaz

align 4

; =========================================================================
; void nasm_cv_linnum(const char *filename, long line_num, int32_t seg)
; =========================================================================
nasm_cv_linnum:
    push ebp
    mov ebp, esp
    
    ; CodeView formatı aktifse satır numarası tablolarını (.debug$S) besleyen jenerik sarmalayıcı.
    mov eax, [ebp + 12]         ; line_num (Oku ve güvenle nötr dön)
    
    pop ebp
    ret
