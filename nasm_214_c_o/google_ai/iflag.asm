; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY INSTRUCTION FLAGS SÜRÜCÜSÜ (iflag.asm)
; `nasm386.asm` include zincirinin disp8.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

nasm_iflag_cmp:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]          ; esi = insn_flags adresi
    mov edi, [ebp + 12]         ; edi = cpu_flags adresi

    test esi, esi
    jz .L_cmp_true
    test edi, edi
    jz .L_cmp_false

    ; 64-bitlik VE mantığı (Bitwise AND): (insn_flags & cpu_flags) == insn_flags
    mov eax, [esi + 0]          ; insn_low
    mov ebx, [edi + 0]          ; cpu_low
    and ebx, eax                ; ebx = insn_low & cpu_low
    cmp ebx, eax
    jne .L_cmp_false            ; Düşük dword uyuşmuyorsa elenir

    mov eax, [esi + 4]          ; insn_high
    mov ebx, [edi + 4]          ; cpu_high
    and ebx, eax
    cmp ebx, eax
    jne .L_cmp_false            ; Yüksek dword uyuşmuyorsa elenir

.L_cmp_true:
    mov eax, 1                  ; Uyumlu: Return true (1)
    jmp .L_cmp_done

.L_cmp_false:
    xor eax, eax                ; Uyumsuz komut: Return false (0)

.L_cmp_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; =========================================================================
; void nasm_iflag_set(void *dest_flags, int flag_bit_idx)
; =========================================================================
nasm_iflag_set:
    push ebp
    mov ebp, esp
    push ebx

    mov edx, [ebp + 8]          ; edx = dest_flags adresi
    mov ecx, [ebp + 12]         ; ecx = flag_bit_idx (0-63 arası bit indeksi)

    test edx, edx
    jz .L_set_done

    cmp ecx, 32
    jge .L_set_high             ; 30/08/2026

    ; Düşük Dword Alanına Set Et (0-31)
    mov eax, 1
    shl eax, cl                 ; cl içindeki bit indeksi kadar sola kaydır
    or [edx + 0], eax           ; dest_flags->low_flags |= (1 << idx)
    jmp .L_set_done

.L_set_high:
    sub ecx, 32                 ; Yüksek dword için biti 0-31 arasına normalize et
    mov eax, 1
    shl eax, cl
    or [edx + 4], eax           ; dest_flags->high_flags |= (1 << idx)

.L_set_done:
    pop ebx
    pop ebp
    ret
