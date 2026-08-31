; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY STRİNG LİSTE MOTORU (strlist.asm)
; `nasm386.asm` include zincirinin saa.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_strlist_init
global nasm_strlist_free
global nasm_strlist_add

; extern nasm_malloc
; extern nasm_free
; extern strcmp
; extern strlen
; extern memcpy

section .text
align 4

; --- STR LİST DÜĞÜM (NODE) YAPISI OFFSETS ---
; +0 : const char *str  (Ham metin verisinin adresi)
; +4 : struct strlist_node *next (Bir sonraki liste düğümünün adresi)

; =========================================================================
; void **nasm_strlist_init(void)
; Yeni bir string liste kök pointer'ı tahsis eder ve adresini döner.
; =========================================================================
nasm_strlist_init:
    push ebp
    mov ebp, esp

    ; Kök pointer hücresi için 4 byte (bir dword) yer ayır
    push 4
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_init_done

    mov dword [eax], 0          ; *root_ptr = NULL (Başlangıçta liste boş)

.L_init_done:
    pop ebp
    ret

align 4

; =========================================================================
; void nasm_strlist_free(void **root_ptr)
; String listesinin tüm düğümlerini ve içindeki metin alanlarını temizler.
; =========================================================================
nasm_strlist_free:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov ebx, [ebp + 8]          ; ebx = root_ptr (void **)
    test ebx, ebx
    jz .L_free_done

    mov esi, [ebx]              ; esi = *root_ptr (İlk düğüm adresi)

.L_free_loop:
    test esi, esi
    jz .L_free_root

    mov ebx, [esi + 4]          ; ebx = node->next (Sonraki düğümü yedekle)

    ; Önce düğümün içindeki ham metin verisini (str) serbest bırak
    mov eax, [esi + 0]          ; eax = node->str
    test eax, eax
    jz .L_free_node
    push eax
    call nasm_free
    add esp, 4

.L_free_node:
    ; Şimdi düğümün kendisini serbest bırak
    push esi
    call nasm_free
    add esp, 4

    mov esi, ebx
    jmp .L_free_loop

.L_free_root:
    push dword [ebp + 8]        ; Kök pointer hücresini serbest bırak
    call nasm_free
    add esp, 4

.L_free_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; const char *nasm_strlist_add(void **root_ptr, const char *str)
; Metni listeye ekler. Eğer metin listede zaten mevcutsa, mükerrer bellek
; harcamamak için mevcut olan metnin bellek adresini (pointer) döndürür.
; =========================================================================
nasm_strlist_add:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov edi, [ebp + 8]          ; edi = root_ptr (void **)
    mov esi, [ebp + 12]         ; esi = eklenmek istenen metin (str)

    test edi, edi
    jz .L_add_fail
    test esi, esi
    jz .L_add_fail

    mov ebx, [edi]              ; ebx = *root_ptr (Döngü için ilk düğüm)

.L_search_loop:
    test ebx, ebx
    jz .L_allocate_node         ; Listenin sonuna gelindiyse metin listede yok, yeni düğüm aç

    mov ecx, [ebx + 0]          ; ecx = node->str
    push esi                    ; yeni eklenmek istenen dize
    push ecx                    ; mevcut düğümdeki dize
    call strcmp
    add esp, 8
    test eax, eax
    jz .L_found_existing        ; EAX == 0 ise metin listede zaten var! Direkt adresini dön.

    mov ebx, [ebx + 4]          ; ebx = node->next
    jmp .L_search_loop

.L_found_existing:
    mov eax, [ebx + 0]          ; Mevcut metnin pointer'ını döndür (Deduplication)
    jmp .L_add_done

.L_allocate_node:
    ; 1. Liste düğümü için 8 byte bellek ayır (str + next)
    push 8
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_add_fail
    mov ebx, eax                ; ebx = yeni_düğüm

    ; 2. Metnin kendisini kopyalamak için alan ayır
    push esi
    call strlen
    add esp, 4
    inc eax                     ; len + 1 (null terminator)
    mov edx, eax                ; edx = toplam metin boyutu

    push edx
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_alloc_fail            ; Bellek bittiyse düğümü de kurtar, çık

    mov [ebx + 0], eax          ; node->str = ayrılan metin alanı adresi

    ; Metni yeni alana kopyala
    push edx                    ; length
    push esi                    ; src
    push eax                    ; dest
    call memcpy
    add esp, 12

    ; 3. Düğümü listenin BAŞINA enjekte et (Chaining / LIFO mantığı)
    mov ecx, [edi]              ; ecx = *root_ptr (Eski kafa düğüm)
    mov [ebx + 4], ecx          ; new_node->next = eski_kafa
    mov [edi], ebx              ; *root_ptr = new_node

    mov eax, [ebx + 0]          ; Return EAX = Yeni kopyalanan metnin adresi
    jmp .L_add_done

.L_alloc_fail:
    push ebx
    call nasm_free              ; Düğümü temizle
    add esp, 4

.L_add_fail:
    xor eax, eax                ; Hata durumunda Return NULL

.L_add_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
