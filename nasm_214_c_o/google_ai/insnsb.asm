; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY KOMUT TABLO DETAY SÜRÜCÜSÜ (insnsb.asm)
; `nasm386.asm` include zincirinin insnsa.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_get_insn_opcode
global nasm_get_insn_operands

; extern nasm_instructions_count

section .text
align 4

; =========================================================================
; int nasm_get_insn_opcode(int insn_id)
; Belirtilen komut kimliğinin (ID) ham opkod değerini döndürür.
; =========================================================================
nasm_get_insn_opcode:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = insn_id
    cmp eax, 0
    jl .L_opcode_err
    mov ecx, dword [nasm_instructions_count]
    cmp eax, ecx
    jge .L_opcode_err

    ; Her düğüm 20 byte. Opcode alanı tam +0. offsettedir.
    mov ecx, 20
    mul ecx
    
    extern nasm_instructions_ptr ; bss.asm'deki taban hücre
    mov ebx, dword [nasm_instructions_ptr]
    mov eax, [ebx + eax + 0]    ; Return EAX = node->opcode
    jmp .L_opcode_done

.L_opcode_err:
    mov eax, -1                 ; Hata veya geçersiz ID durumunda -1 dön

.L_opcode_done:
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; int nasm_get_insn_operands(int insn_id)
; Komutun kaç adet operand kabul ettiğini (0, 1, 2, 3, 4) döndürür.
; =========================================================================
nasm_get_insn_operands:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = insn_id
    cmp eax, 0
    jl .L_operands_err
    mov ecx, dword [nasm_instructions_count]
    cmp eax, ecx
    jge .L_operands_err

    ; Operands alanı yapıda +4. offsettedir.
    mov ecx, 20
    mul ecx
    
    mov ebx, dword [nasm_instructions_ptr]
    mov eax, [ebx + eax + 4]    ; Return EAX = node->operands
    jmp .L_operands_done

.L_operands_err:
    xor eax, eax                ; Hata durumunda 0 operand kabul et (güvenlik kilidi)

.L_operands_done:
    pop ebx
    pop ebp
    ret
