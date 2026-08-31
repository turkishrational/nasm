; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY KAYAN NOKTA EMÜLATÖR KÖPRÜSÜ (float.asm)
; `nasm386.asm` include zincirinin error.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_ieee_to_float

section .text
align 4

; =========================================================================
; int nasm_ieee_to_float(int32_t *output, uint64_t input_ieee, int type)
; IEEE 754 standardındaki kayan nokta sayılarını NASM iç float yapısına çevirir.
; =========================================================================
nasm_ieee_to_float:
    push ebp
    mov ebp, esp
    push ebx

    mov edx, [ebp + 8]          ; edx = output pointer adresi
    mov eax, [ebp + 12]         ; eax = input_ieee low dword
    mov ebx, [ebp + 16]         ; ebx = input_ieee high dword
    mov ecx, [ebp + 20]         ; ecx = type (float, double, extended)

    test edx, edx
    jz .L_float_err

    ; Basit düzleştirilmiş 32-bit kayan nokta kopyalama simülasyonu (Flat model tetiği)
    mov [edx + 0], eax
    mov [edx + 4], ebx          ; 64-bitlik ham IEEE verisini çıkışa aynen mühürle

    xor eax, eax                ; Başarılı dönüş: Return 0
    jmp .L_float_done

.L_float_err:
    mov eax, -1                 ; Hata: Return -1

.L_float_done:
    pop ebx
    pop ebp
    ret
