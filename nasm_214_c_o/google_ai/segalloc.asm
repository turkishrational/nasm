; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY SEGMENT TAHSİSAT SÜRÜCÜSÜ (segalloc.asm)
; `nasm386.asm` include zincirinin tokhash.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_seg_alloc

; extern nasm_malloc

section .text
align 4

; =========================================================================
; void *nasm_seg_alloc(size_t *seg_size, size_t alignment)
; Belirtilen hizalama kuralına göre heap üzerinde güvenli segment alanı açar.
; =========================================================================
nasm_seg_alloc:
    push ebp
    mov ebp, esp
    push ebx

    mov ecx, [ebp + 8]          ; ecx = seg_size pointer adresi
    mov ebx, [ebp + 12]         ; ebx = alignment (1, 4, 16, 64 vb.)

    test ecx, ecx
    jz .L_seg_alloc_null

    mov eax, [ecx]              ; eax = istenir ham segment boyutu
    test eax, eax
    jz .L_seg_alloc_null

    ; Hizalama payını boyuta ekle: size = (size + alignment - 1) & ~(alignment - 1)
    test ebx, ebx
    jz .L_do_malloc
    dec ebx                     ; mask = alignment - 1
    add eax, ebx
    not ebx
    and eax, ebx                ; eax = hizalanmış yeni boyut
    mov [ecx], eax              ; Güncellenmiş boyutu adrese geri yaz

.L_do_malloc:
    push eax
    call nasm_malloc            ; malloc.asm içindeki hizalamalı bellek tetiği
    add esp, 4
    jmp .L_seg_alloc_done

.L_seg_alloc_null:
    xor eax, eax                ; Hata: Return NULL (0)

.L_seg_alloc_done:
    pop ebx
    pop ebp
    ret
