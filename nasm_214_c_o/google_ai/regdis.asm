; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY YAZMAÇ İSİM SÜRÜCÜSÜ (regdis.asm)
; `nasm386.asm` include zincirinin regflags.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_get_reg_name

; extern nasm_reg_flags_count

section .text
align 4

; =========================================================================
; const char *nasm_get_reg_name(int reg_id)
; Yazmaç kimlik numarasına göre string metin karşılığının adresini döner.
; =========================================================================
nasm_get_reg_name:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = reg_id
    cmp eax, 0
    jl .L_reg_name_null
    
    mov ecx, dword [nasm_reg_flags_count]
    cmp eax, ecx
    jge .L_reg_name_null

    ; Yazmaç isim dizge göstericileri tablosu (nasm_reg_names) adresi sorgusu.
    ; Her gösterici 4 byte dword genişliğindedir.
    mov ebx, dword [nasm_reg_names_table_ptr] ; bss.asm veya veri alanındaki hücre
    test ebx, ebx
    jz .L_reg_name_null

    mov eax, [ebx + eax * 4]    ; Return EAX = Yazmacın string metin adresi
    jmp .L_reg_name_done

.L_reg_name_null:
    xor eax, eax                ; Hata veya geçersiz ID: Return NULL (0)

.L_reg_name_done:
    pop ebx
    pop ebp
    ret
