; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY YAZMAÇ DEĞER SÜRÜCÜSÜ (regvals.asm)
; `nasm386.asm` include zincirinin regs.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_reg_val

; extern nasm_reg_flags_count
; extern nasm_reg_flags_ptr

section .text
align 4

; =========================================================================
; int nasm_reg_val(int reg_id)
; Belirtilen yazmacın işlemci mimarisindeki iç değer indeksini (0-7 arası) döner.
; =========================================================================
nasm_reg_val:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = reg_id
    cmp eax, 0
    jl .L_reg_val_err           ; Negatif indeks koruması

    mov ecx, dword [nasm_reg_flags_count]
    cmp eax, ecx
    jge .L_reg_val_err          ; Sınır taşma koruması

    ; Her düğüm 8 byte. reg_id alanı yapıda +0. offsettedir.
    shl eax, 3                  ; eax = reg_id * 8
    
    mov ebx, dword [nasm_reg_flags_ptr]
    mov eax, [ebx + eax + 0]    ; Return EAX = node->reg_id (iç değer)
    jmp .L_reg_val_done

.L_reg_val_err:
    mov eax, -1                 ; Hata durumunda -1 dön

.L_reg_val_done:
    pop ebx
    pop ebp
    ret
