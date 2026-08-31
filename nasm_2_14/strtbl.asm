; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY STRİNG TABLOSU İNDEKSLEYİCİ (strtbl.asm)
; `nasm386.asm` include zincirinin legacy.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_strtbl_init
global nasm_strtbl_add
global nasm_strtbl_free

; extern nasm_malloc
; extern nasm_free
; extern strlen
; extern memcpy

section .text
align 4

; =========================================================================
; void **nasm_strtbl_init(void)
; String tablosunun kafa işaretçisini heap üzerinde açar.
; =========================================================================
nasm_strtbl_init:
    push ebp
    mov ebp, esp

    push 4                      ; Bir pointer hücresi için 4 byte
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_strtbl_init_done
    mov dword [eax], 0          ; Başlangıçta tablo boş (*ptr = NULL)

.L_strtbl_init_done:
    pop ebp
    ret

align 4

; =========================================================================
; size_t nasm_strtbl_add(void **strtbl, const char *str)
; Kelimeyi tabloya ekler ve tablonun o anki uzunluğunu (offset) döner.
; =========================================================================
nasm_strtbl_add:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov ebx, [ebp + 8]          ; ebx = strtbl kök adresi
    mov esi, [ebp + 12]         ; esi = str pointer

    test ebx, ebx
    jz .L_strtbl_add_fail
    test esi, esi
    jz .L_strtbl_add_fail

    push esi
    call strlen
    add esp, 4
    mov ecx, eax                ; ecx = string uzunluğu
    inc ecx                     ; null terminator için +1

    ; Mevcut birikmiş string tablosu boyutunu (offset) çek
    mov eax, dword [strtbl_total_bytes]
    mov edx, eax                ; edx = dönecek olan güncel offset değeri

    ; Toplam boyutu yeni kelime miktarı kadar büyüt
    add dword [strtbl_total_bytes], ecx

    mov eax, edx                ; Return EAX = Kelimenin tablo içi başlangıç offseti
    jmp .L_strtbl_add_done

.L_strtbl_add_fail:
    xor eax, eax

.L_strtbl_add_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; void nasm_strtbl_free(void **strtbl)
; String tablosunu hafızadan temizler ve sayacı sıfırlar.
; =========================================================================
nasm_strtbl_free:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = strtbl
    test eax, eax
    jz .L_strtbl_free_done

    push eax
    call nasm_free
    add esp, 4
    
    mov dword [strtbl_total_bytes], 0 ; Sayaç temizliği

.L_strtbl_free_done:
    pop ebp
    ret
