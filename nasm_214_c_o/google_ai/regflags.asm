; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY YAZMAÇ TABLO BAĞLANTI SÜRÜCÜSÜ (regflags.asm)
; `nasm386.asm` include zincirinin regvals.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_reg_flags_init

; extern nasm_reg_flags_ptr

section .text
align 4

; =========================================================================
; void nasm_reg_flags_init(void *table_addr)
; `data.asm` veya kütüphane içindeki yazmaç bayrak tablosunun ham adresini
; regs.asm katmanının okuyabilmesi için bss'deki ptr hücresine kilitler.
; =========================================================================
nasm_reg_flags_init:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = table_addr (Ham tablo adresi)
    test eax, eax
    jz .L_init_flags_done

    ; BSS segmentindeki merkezi işaretçi hücresini güncelle
    mov dword [nasm_reg_flags_ptr], eax

.L_init_flags_done:
    pop ebp
    ret
