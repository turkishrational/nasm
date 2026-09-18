; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY KOMUT FORMAT SÜRÜCÜSÜ (insnsd.asm)
; `nasm386.asm` include zincirinin insnsb.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_get_insn_format

; extern nasm_instructions_count
; extern nasm_instructions_ptr

section .text
align 4

; =========================================================================
; const char *nasm_get_insn_format(int insn_id)
; Komutun metinsel format/isim dizesinin adresini (pointer) döndürür.
; =========================================================================
nasm_get_insn_format:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = insn_id
    cmp eax, 0
    jl .L_format_null
    mov ecx, dword [nasm_instructions_count]
    cmp eax, ecx
    jge .L_format_null

    ; Format string pointer alanı yapıda +12. offsettedir.
    mov ecx, 20
    mul ecx
    
    mov ebx, dword [nasm_instructions_ptr]
    mov eax, [ebx + eax + 12]   ; Return EAX = node->format pointer adresi
    jmp .L_format_done

.L_format_null:
    xor eax, eax                ; Hata durumunda NULL (0) dön

.L_format_done:
    pop ebx
    pop ebp
    ret
