; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY KOMUT BAYRAK SÜRÜCÜSÜ (insnsn.asm)
; `nasm386.asm` include zincirinin insnsd.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_get_insn_flags

; extern nasm_instructions_count
; extern nasm_instructions_ptr

section .text
align 4

; =========================================================================
; uint32_t nasm_get_insn_flags(int insn_id)
; Komutun işlemci yetenek/mimarisi bayrak maskesini (flags) döndürür.
; =========================================================================
nasm_get_insn_flags:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = insn_id
    cmp eax, 0
    jl .L_flags_zero
    mov ecx, dword [nasm_instructions_count]
    cmp eax, ecx
    jge .L_flags_zero

    ; Flags alanı yapıda +16. offsettedir.
    mov ecx, 20
    mul ecx
    
    mov ebx, dword [nasm_instructions_ptr]
    mov eax, [ebx + eax + 16]   ; Return EAX = node->flags maskesi
    jmp .L_flags_done

.L_flags_zero:
    xor eax, eax                ; Hata durumunda 0 bayrağı dön (nötr mimari)

.L_flags_done:
    pop ebx
    pop ebp
    ret
