; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DİREKTİF SABİT TABLOSU (directbl.asm)
; `nasm386.asm` include zincirinin directiv.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global directive_hash_table
global directive_init_table

; extern hash_add

section .text
align 4

; =========================================================================
; void directive_init_table(void)
; NASM'ın tanıdığı "SECTION", "SEGMENT", "EQU", "GLOBAL" gibi anahtar kelimeleri
; çalışma dizinindeki hash tablosuna sırasıyla ekler (İlklendirme zinciri).
; =========================================================================
directive_init_table:
    push ebp
    mov ebp, esp

    ; 1. SECTION Direktifi (Token ID = 10)
    push 15                     ; data = 15 (İç token karşılığı)
    push dir_str_section        ; key = "section"
    push 128                    ; size = 128
    push directive_hash_table   ; yerel bss hücresi
    call hash_add
    add esp, 16

    ; 2. SEGMENT Direktifi (Token ID = 15)
    push 15                     ; segment ile section iç yapıda aynı işlenir
    push dir_str_segment
    push 128
    push directive_hash_table
    call hash_add
    add esp, 16

    ; 3. EQU Direktifi (Token ID = 20)
    push 20
    push dir_str_equ
    push 128
    push directive_hash_table
    call hash_add
    add esp, 16

    ; 4. GLOBAL Direktifi (Token ID = 25)
    push 25
    push dir_str_global
    push 128
    push directive_hash_table
    call hash_add
    add esp, 16

    pop ebp
    ret
