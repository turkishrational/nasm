; =======================================================================
; NASM v2.14.02 - C UYUMLU SAF ASSEMBLY BELLEK MODÜLÜ (malloc.asm)
; TRDOS 386 yerel 'malloc' kütüphane fonksiyonuna doğrudan köprü kurar.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_malloc
global nasm_realloc
global nasm_free
global nasm_calloc
global nasm_strdup
global nasm_strndup

; extern malloc
; extern memcpy
; extern memset
; extern strlen
; extern strnlen

align 4

; void *nasm_malloc(size_t size)
nasm_malloc:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp + 8]          ; ebx = size
    test ebx, ebx
    jz .L_malloc_null

    ; 4-Byte Dword Hizalama Zırhı: (size + 3) & ~3
    add ebx, 3
    and ebx, 0xFFFFFFFC

    ; libc.a içindeki gerçek malloc fonksiyonunu çağırıyoruz
    push ebx
    call malloc
    add esp, 4                  ; Yığın temizliği, EAX = Tahsis edilen alan
    test eax, eax
    jnz .L_malloc_done

.L_malloc_null:
    xor eax, eax                ; Bellek hatası veya size=0 ise Return NULL

.L_malloc_done:
    pop ebx
    pop ebp
    ret

align 4

; void *nasm_realloc(void *q, size_t size)
nasm_realloc:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 8]          ; esi = old_ptr (q)
    mov ebx, [ebp + 12]         ; ebx = new_size

    test esi, esi
    jz .L_realloc_as_malloc     ; Eğer eski pointer NULL ise doğrudan malloc gibi davran

    test ebx, ebx
    jz .L_realloc_as_free       ; Eğer yeni boyut 0 ise free gibi davran

    ; Kontrollü Yeni Malloc Tahsisatı (TCC Port Prosedürü)
    push ebx
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_realloc_done

    ; Eski veriyi yeni alana kopyala (Eski alan çöp olarak kalır, MAT koruması)
    push ebx                    ; count = new_size
    push esi                    ; src = old_ptr
    push eax                    ; dest = new_ptr
    call memcpy
    add esp, 12
    jmp .L_realloc_done

.L_realloc_as_malloc:
    push ebx
    call nasm_malloc
    add esp, 4
    jmp .L_realloc_done

.L_realloc_as_free:
    push esi
    call nasm_free
    add esp, 4
    xor eax, eax

.L_realloc_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; void nasm_free(void *q)
nasm_free:
    ret                         ; TRDOS dikey/flat havuz yapısı nedeniyle boştur

align 4

; void *nasm_calloc(size_t nelem, size_t elsize)
nasm_calloc:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; nelem
    mov ebx, [ebp + 12]         ; elsize
    mul ebx                     ; eax = nelem * elsize (Genişlik)
    mov ebx, eax

    push ebx
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_calloc_done

    ; Belleği sıfırla
    push ebx                    ; size
    push 0                      ; value = 0
    push eax                    ; dest pointer
    call memset
    add esp, 12

.L_calloc_done:
    pop ebx
    pop ebp
    ret

align 4

; char *nasm_strdup(const char *s)
nasm_strdup:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp + 8]          ; ebx = string pointer (s)
    test ebx, ebx
    jz .L_strdup_null

    push ebx
    call strlen
    add esp, 4
    inc eax                     ; len + 1 (null terminator için)
    mov edx, eax

    push edx
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_strdup_done

    ; Veriyi kopyala
    push edx                    ; length
    push ebx                    ; src
    push eax                    ; dest
    call memcpy
    add esp, 12
    jmp .L_strdup_done

.L_strdup_null:
    xor eax, eax

.L_strdup_done:
    pop ebx
    pop ebp
    ret

align 4

; char *nasm_strndup(const char *s, size_t n)
nasm_strndup:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov ebx, [ebp + 8]          ; ebx = string (s)
    mov esi, [ebp + 12]         ; esi = max_len (n)
    test ebx, ebx
    jz .L_strndup_null

    push esi
    push ebx
    call strnlen
    add esp, 8
    mov edx, eax                ; edx = gerçek kopya boyutu

    inc eax                     ; len + 1
    push eax
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_strndup_done

    ; Veriyi kopyala ve sonlandır
    push edx                    ; length
    push ebx                    ; src
    push eax                    ; dest
    call memcpy
    add esp, 12
    
    mov byte [eax + edx], 0     ; null terminator zorlaması

.L_strndup_null:
    xor eax, eax

.L_strndup_done:
    pop esi
    pop ebx
    pop ebp
    ret
