; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DİZE TABANLI SAYI ÇÖZÜCÜ (rdstrnum.asm)
; `nasm386.asm` include zincirinin preproc-nop.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_read_string_num

; extern nasm_readnum

section .text
align 4

; =========================================================================
; int32_t nasm_read_string_num(const char *str)
; Dize biçimindeki numerik ifadeyi çözer. Hata durumlarını absorbe eder.
; =========================================================================
nasm_read_string_num:
    push ebp
    mov ebp, esp
    sub esp, 4                  ; Yerel hata bayrağı hücresi

    mov eax, [ebp + 8]          ; eax = str pointer adresi
    test eax, eax
    jz .L_rdstr_zero

    lea ecx, [ebp - 4]          ; ecx = bool *error adresi
    mov dword [ebp - 4], 0      ; error = false

    push ecx
    push eax
    call nasm_readnum           ; readnum.asm ana motorunu tetikle
    add esp, 8                  ; EAX = 32-bit düşük dword sonuç

    mov ecx, [ebp - 4]          ; Çözümleme hatası oluştu mu?
    test ecx, ecx
    jnz .L_rdstr_zero           ; Hata varsa 0 kabul et
    jmp .L_rdstr_done

.L_rdstr_zero:
    xor eax, eax                ; Geçersiz dize için Return 0

.L_rdstr_done:
    mov esp, ebp
    pop ebp
    ret
