; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY İFADE DÖKÜM MODÜLÜ (exprdump.asm)
; `nasm386.asm` include zincirinin exprlib.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_expr_dump

; extern printf

section .text
align 4

; =========================================================================
; void nasm_expr_dump(const struct expr *e)
; Çözümlenen ifadenin numerik değerlerini debug loglarına basar.
; =========================================================================
nasm_expr_dump:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp + 8]          ; ebx = e (struct expr *)
    test ebx, ebx
    jz .L_dump_done

    mov eax, [ebx + 0]          ; eax = value_low
    mov edx, [ebx + 4]          ; edx = value_high
    mov ecx, [ebx + 8]          ; ecx = type

    ; printf(expr_dump_fmt, type, value_high, value_low) çağrısı
    push eax                    ; value_low
    push edx                    ; value_high
    push ecx                    ; type
    push expr_dump_fmt          ; data.asm'e eklenecek biçim dizesi
    call printf
    add esp, 16

.L_dump_done:
    pop ebx
    mov esp, ebp
    pop ebp
    ret
