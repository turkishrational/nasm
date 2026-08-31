; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY MERKEZİ HASH TABLOSU MOTORU (hashtbl.asm)
; `nasm386.asm` include zincirinin rbtree.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_hash
global hash_find
global hash_add

; extern nasm_malloc
; extern strcmp

section .text
align 4

; --- HASH TABLOSU DÜĞÜM (NODE) YAPISI OFFSETS ---
; +0 : const char *key
; +4 : void *data
; +8 : struct hash_node *next

; =========================================================================
; unsigned int nasm_hash(const char *str)
; Ünlü Bernstein (DJB2) veya benzeri NASM hash algoritması sarmalıdır.
; Dizgeyi (string) 32-bitlik benzersiz bir hash değerine dönüştürür.
; =========================================================================
nasm_hash:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 8]          ; esi = str pointer
    mov eax, 5381               ; Magic number (Hash başlangıç değeri)
    test esi, esi
    jz .L_hash_done

.L_hash_loop:
    xor ebx, ebx
    mov bl, byte [esi]
    test bl, bl
    jz .L_hash_done             ; Null terminator görünce döngüden çık

    ; hash = ((hash << 5) + hash) + c
    mov edx, eax
    shl eax, 5
    add eax, edx
    add eax, ebx

    inc esi
    jmp .L_hash_loop

.L_hash_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; void *hash_find(void **table, unsigned int size, const char *key)
; Belirtilen boyuttaki hash tablosunda anahtar kelimeyi arar ve veriyi döner.
; =========================================================================
hash_find:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov edi, [ebp + 8]          ; edi = table pointer (dizi adresi)
    mov ecx, [ebp + 12]         ; ecx = table size (tablo eleman sayısı)
    mov esi, [ebp + 16]         ; esi = target key string adresi

    test edi, edi
    jz .L_find_fail
    test ecx, ecx
    jz .L_find_fail
    test esi, esi
    jz .L_find_fail

    ; Önce aranacak kelimenin hash değerini hesapla
    push esi
    call nasm_hash
    add esp, 4                  ; EAX = 32-bit hash değeri

    ; İndeksi bul: idx = hash % size
    xor edx, edx
    mov ecx, [ebp + 12]         ; ecx = size
    div ecx                     ; EDX = kalan (index)

    ; Tablodaki bağlı listenin (linked list) başına konumlan
    mov eax, [edi + edx * 4]    ; eax = table[idx] (struct hash_node *)
    mov ebx, eax

.L_find_node_loop:
    test ebx, ebx
    jz .L_find_fail             ; Bağlı listenin sonuna gelindiyse bulamadık

    mov ecx, [ebx + 0]          ; ecx = node->key
    push esi                    ; target key
    push ecx                    ; node key
    call strcmp
    add esp, 8
    test eax, eax
    jz .L_find_success          ; EAX == 0 ise aranan sembol bulundu!

    mov ebx, [ebx + 8]          ; ebx = node->next
    jmp .L_find_node_loop

.L_find_success:
    mov eax, [ebx + 4]          ; eax = node->data (Veriyi yükle)
    jmp .L_find_done

.L_find_fail:
    xor eax, eax                ; Bulunamadı: Return NULL (0)

.L_find_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; =========================================================================
; void hash_add(void **table, unsigned int size, const char *key, void *data)
; Tabloya yeni bir veri düğümü ekler (Zincirleme/Chaining yöntemiyle başa ekler).
; =========================================================================
hash_add:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov edi, [ebp + 8]          ; edi = table
    mov ecx, [ebp + 12]         ; ecx = size
    mov esi, [ebp + 16]         ; esi = key
    mov ebx, [ebp + 20]         ; ebx = data

    ; Yeni hash düğümü için 12 byte bellek ayır (key + data + next)
    push 12
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_add_done              ; Bellek yetersizse ekleme yapma, çık

    mov [eax + 0], esi          ; node->key = key
    mov [eax + 4], ebx          ; node->data = data

    ; Kelimenin hash değerini bulup indeksi hesapla
    push esi
    call nasm_hash
    add esp, 4
    
    xor edx, edx
    mov ecx, [ebp + 12]         ; size
    div ecx                     ; EDX = index

    ; Bağı Yeni Düğümün Başına Ekle (Chaining Lojiği)
    mov ecx, [edi + edx * 4]    ; ecx = table[index] (Mevcut eski kafa düğüm)
    mov [eax + 8], ecx          ; node->next = table[index]
    mov [edi + edx * 4], eax    ; table[index] = new_node

.L_add_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
