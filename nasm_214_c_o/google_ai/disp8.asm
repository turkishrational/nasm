; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DISPLACEMENT-8 SÜRÜCÜSÜ (disp8.asm)
; `nasm386.asm` include zincirinin regdis.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_get_disp8_scale

section .text
align 4

; =========================================================================
; int nasm_get_disp8_scale(uint32_t flags, int vector_len)
; İşlemci mod bayraklarına ve vektör uzunluğuna (128, 256, 512 bit) göre
; EVEX sıkıştırma ölçek çarpanını (scale factor) hesaplar ve döner.
; =========================================================================
nasm_get_disp8_scale:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = flags maskesi
    mov ecx, [ebp + 12]         ; ecx = vector_len (0: 128, 1: 256, 2: 512)

    ; NASM iç mimarisindeki DISP8_SHIFT ve maskeleme filtreleri:
    test eax, eax
    jz .L_scale_one             ; Bayrak yoksa varsayılan ölçek çarpanı = 1

    ; Basit süzgeç: Bayraklardan gelen disp8 tipini ayıkla
    mov ebx, eax
    shr ebx, 24                 ; Üst bayttaki DISP8_SHIFT alanına kaydır
    and ebx, 0x0000000F         ; Sadece disp8 hiyerarşi bitlerini koru
    jz .L_scale_one

    ; Vektör uzunluğuna bağlı ölçek kurgusu (AVX-512 simülasyon zırhı)
    cmp ebx, 1                  ; Sabit tip 1 mi? (Full vector)
    jne .L_check_type2
    
    ; scale = 16 << vector_len
    mov eax, 16
    shl eax, cl                 ; cl içinde vector_len var
    jmp .L_scale_done

.L_check_type2:
    cmp ebx, 2                  ; Sabit tip 2 mi? (Half vector)
    jne .L_scale_one
    
    mov eax, 8
    shl eax, cl
    jmp .L_scale_done

.L_scale_one:
    mov eax, 1                  ; Varsayılan ölçek çarpanı = 1 byte

.L_scale_done:
    pop ebx
    pop ebp
    ret
