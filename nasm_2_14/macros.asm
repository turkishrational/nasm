; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY YERLEŞİK MAKRO MOTORU (macros.asm)
; `nasm386.asm` include zincirinin pptok.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_stdmac_init
global nasm_stdmac_free

; extern hash_add

section .text
align 4

; =========================================================================
; void nasm_stdmac_init(void)
; Standart sistem makrolarını ön işlemci hash tablosuna kilitler.
; =========================================================================
nasm_stdmac_init:
    push ebp
    mov ebp, esp

    ; __NASM_MAJOR__ makrosunu tanımla (Sürüm: 2)
    push mac_val_major          ; data.asm'e eklenecek "2" dizgesi
    push mac_str_major          ; "__NASM_MAJOR__"
    push 128                    ; Tablo boyutu
    extern directive_hash_table ; bss alanındaki merkezi direktif/makro tablosu
    push directive_hash_table
    call hash_add
    add esp, 16

    ; __NASM_MINOR__ makrosunu tanımla (Sürüm: 14)
    push mac_val_minor          ; "14"
    push mac_str_minor          ; "__NASM_MINOR__"
    push 128
    push directive_hash_table
    call hash_add
    add esp, 16

    pop ebp
    ret

align 4

; =========================================================================
; void nasm_stdmac_free(void)
; Makro havuzunu temizler.
; =========================================================================
nasm_stdmac_free:
    ret                         ; Havuz otomatik BSS temizliğine düzleştirilmiştir
