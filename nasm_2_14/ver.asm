; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY SÜRÜM BİLGİ MODÜLÜ (ver.asm)
; `nasm386.asm` include zincirinin common.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global ver_print

; extern printf

section .text
align 4

; =========================================================================
; void ver_print(void)
; NASM derleyicisinin resmi sürüm ve jenerik imza metnini ekrana basar.
; =========================================================================
ver_print:
    push ebp
    mov ebp, esp
    push ebx

    ; printf(nasm_version_string) çağrısı
    push nasm_version_string    ; data.asm dosyasında tanımlanan etiket
    call printf
    add esp, 4                  ; Yığın temizliği

    pop ebx
    mov esp, ebp
    pop ebp
    ret
