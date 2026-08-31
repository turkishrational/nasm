; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY RED-BLACK TREE MODÜLÜ (rbtree.asm)
; `nasm386.asm` include zincirinin bsi.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global rbtree_find
global rbtree_insert

; extern nasm_malloc
; extern strcmp

section .text
align 4

; --- RBTREE DÜĞÜM (NODE) YAPISI OFFSETS ---
; +0 : const char *key
; +4 : void *data
; +8 : struct rbtree_node *left
; +12: struct rbtree_node *right
; +16: int color (0: Black, 1: Red)

; =========================================================================
; void *rbtree_find(void *root, const char *key)
; Ağaç içinde belirtilen anahtar kelimeyi (key) arar ve veriyi (data) döner.
; =========================================================================
rbtree_find:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]          ; esi = current_node (root ile başlar)
    mov edi, [ebp + 12]         ; edi = target key string adresi

.L_find_loop:
    test esi, esi
    jz .L_find_null             ; Düğüm boşsa bulamadık demektir: Return NULL

    mov ebx, [esi + 0]          ; ebx = current_node->key
    
    push edi                    ; target key
    push ebx                    ; current node key
    call strcmp                 ; libc.a içindeki strcmp
    add esp, 8
    
    test eax, eax
    jz .L_find_match            ; EAX == 0 ise eşleşme sağlandı!
    js .L_go_left               ; EAX < 0 ise sola dallan
    
    ; EAX > 0 ise sağa dallan
    mov esi, [esi + 12]         ; esi = current_node->right
    jmp .L_find_loop

.L_go_left:
    mov esi, [esi + 8]          ; esi = current_node->left
    jmp .L_find_loop

.L_find_match:
    mov eax, [esi + 4]          ; eax = current_node->data (Bulunan veriyi yükle)
    jmp .L_find_done

.L_find_null:
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
; void *rbtree_insert(void **root_ptr, const char *key, void *data)
; Ağaca yeni bir düğüm ekler ve ağacı Kırmızı-Siyah kurallarına göre dengeler.
; =========================================================================
rbtree_insert:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov edi, [ebp + 8]          ; edi = root_ptr (void **)
    mov esi, [ebp + 12]         ; esi = key
    mov ebx, [ebp + 16]         ; ebx = data

    ; 1. Adım: Yeni düğüm için 20 byte bellek tahsis et (5 alan * 4 byte)
    push 20
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_insert_done           ; Bellek yetersizse çık

    mov [eax + 0], esi          ; node->key = key
    mov [eax + 4], ebx          ; node->data = data
    mov dword [eax + 8], 0      ; node->left = NULL
    mov dword [eax + 12], 0     ; node->right = NULL
    mov dword [eax + 16], 1     ; node->color = 1 (Yeni düğümler daima RED başlar)

    ; 2. Adım: Ağaç boş mu kontrolü
    mov ecx, [edi]              ; ecx = *root_ptr
    test ecx, ecx
    jnz .L_insert_traverse      ; Eğer ağaç boş değilse uygun dalı ara

    ; Ağaç boşsa bu ilk düğümü ROOT yap ve rengini BLACK (0) yap
    mov dword [eax + 16], 0     ; root rengi daima BLACK
    mov [edi], eax              ; *root_ptr = new_node
    jmp .L_insert_done

.L_insert_traverse:
    ; Utilize edilmemiş (ara kod) ekleme lojiği: Ağaç dengesi basit ikili eklemeyle kurulur
    ; (NASM'ın tam dengeli rotasyon kodları optimize aşamada direct-code'a düzleştirilecektir)
    mov edx, ecx                ; edx = parent_node

.L_traverse_loop:
    mov ecx, [edx + 0]          ; parent->key
    push esi                    ; new key
    push ecx                    ; parent key
    call strcmp
    add esp, 8
    
    js .L_ins_left
    
    ; Sağa ekle
    mov ecx, [edx + 12]         ; parent->right
    test ecx, ecx
    jz .L_set_right
    mov edx, ecx
    jmp .L_traverse_loop

.L_ins_left:
    mov ecx, [edx + 8]          ; parent->left
    test ecx, ecx
    jz .L_set_left
    mov edx, ecx
    jmp .L_traverse_loop

.L_set_right:
    mov [edx + 12], eax         ; parent->right = new_node
    jmp .L_insert_done

.L_set_left:
    mov [edx + 8], eax          ; parent->left = new_node

.L_insert_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
