; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY MERKEZİ ETİKET/SEMBOL MOTORU (labels.asm)
; `nasm386.asm` include zincirinin assemble.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_init_labels
global nasm_free_labels
global nasm_lookup_label
global nasm_define_label

; extern nasm_malloc
; extern nasm_free
; extern rbtree_find
; extern rbtree_insert
; extern strcmp
; extern strlen
; extern memcpy

section .text
align 4

; --- LABELS DÜĞÜM YAPISI (STRUCT LABEL_NODE OFFSETS) ---
; +0  : const char *label_name (Etiket adının adresi)
; +4  : int32_t segment        (Etiketin bulunduğu segment/section ID)
; +8  : int64_t offset         (Etiketin 64-bitlik adres/offset değeri)
; +16 : int flags              (Global, local veya debug bayrakları)

; =========================================================================
; void nasm_init_labels(void)
; Etiket ağacının kök gösterici hücresini sıfırlayarak ilklendirir.
; =========================================================================
nasm_init_labels:
    push ebp
    mov ebp, esp

    ; BSS segmentindeki merkezi kafa göstericiyi temizle
    mov dword [nasm_labels_root], 0

    pop ebp
    ret

align 4

; =========================================================================
; void nasm_free_labels(void)
; Bellekte biriken tüm etiket düğümlerini hiyerarşik olarak temizler.
; =========================================================================
nasm_free_labels:
    push ebp
    mov ebp, esp
    push ebx

    ; Utilize edilmemiş ilk aşamada, ağacın kök göstericisi sıfırlanır.
    ; (İleride rbtree_free sarmalayıcısıyla tam dikey temizliğe düzleştirilebilir)
    mov dword [nasm_labels_root], 0

    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; void *nasm_lookup_label(const char *name, int32_t *segment, int64_t *offset)
; Ağaç içinde etiketi arar. Bulursa segment ve offset değerlerini doldurur.
; =========================================================================
nasm_lookup_label:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]          ; esi = name (Aranan etiket adı)
    mov edi, [ebp + 12]         ; edi = segment pointer adresi
    mov ebx, [ebp + 16]         ; ebx = offset pointer adresi

    test esi, esi
    jz .L_lookup_fail

    ; Kırmızı-Siyah etiket ağacında arama yap: rbtree_find(root, name)
    push esi                    ; name
    push dword [nasm_labels_root] ; root node
    call rbtree_find            ; rbtree.asm içindeki arama motoru
    add esp, 8
    
    test eax, eax
    jz .L_lookup_fail           ; EAX == 0 ise etiket bulunamadı

    ; Düğüm bulundu! (EAX = struct label_node adresi)
    mov ecx, [eax + 4]          ; ecx = node->segment
    test edi, edi
    jz .L_load_offset
    mov [edi], ecx              ; *segment = node->segment

.L_load_offset:
    test ebx, ebx
    jz .L_lookup_success
    mov ecx, [eax + 8]          ; ecx = node->offset_low
    mov [ebx + 0], ecx          ; *offset_low
    mov ecx, [eax + 12]         ; ecx = node->offset_high
    mov [ebx + 4], ecx          ; *offset_high

.L_lookup_success:
    ; Başarılı durumda düğümün kendisini döner (C uyumluluğu)
    jmp .L_lookup_done

.L_lookup_fail:
    xor eax, eax                ; Bulunamadı: Return NULL (0)

.L_lookup_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; =========================================================================
; void nasm_define_label(const char *name, int32_t segment, int64_t offset, int flags)
; Yeni bir etiket tanımlar ve ağaç hiyerarşisine kaydeder.
; =========================================================================
nasm_define_label:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]          ; esi = name
    mov ecx, [ebp + 12]         ; ecx = segment
    mov edi, [ebp + 16]         ; edi = offset_low (ebp+20'de high var)
    mov ebx, [ebp + 24]         ; ebx = flags

    test esi, esi
    jz .L_define_done

    ; Önce bu etiket zaten tanımlanmış mı kontrol et (Mükerrer tanım zırhı)
    push 0                      ; offset_ptr = NULL
    push 0                      ; seg_ptr = NULL
    push esi                    ; name
    call nasm_lookup_label
    add esp, 12
    test eax, eax
    jnz .L_define_done          ; Etiket zaten varsa yeniden tanımlama yapma, çık

    ; 1. Yeni etiket düğümü için 24 byte bellek ayır
    push 24
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_define_done
    mov edx, eax                ; edx = new_node

    ; 2. Etiket ismini kopyalamak için alan ayır
    push esi
    call strlen
    add esp, 4
    inc eax                     ; len + 1
    mov ebx, eax                ; ebx = name_len

    push ebx
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_define_done
    
    mov [edx + 0], eax          ; node->label_name = allocated space
    
    ; İsmi kopyala
    push ebx                    ; length
    push esi                    ; src
    push eax                    ; dest
    call memcpy
    add esp, 12

    ; 3. Diğer matematiksel değerleri yapıya mühürle
    mov ecx, [ebp + 12]         ; segment
    mov [edx + 4], ecx          ; node->segment = segment
    
    mov ecx, [ebp + 16]         ; offset_low
    mov [edx + 8], ecx          ; node->offset_low = offset_low
    mov ecx, [ebp + 20]         ; offset_high
    mov [edx + 12], ecx         ; node->offset_high = offset_high
    
    mov ecx, [ebp + 24]         ; flags
    mov [edx + 16], ecx         ; node->flags = flags

    ; 4. Yeni düğümü Kırmızı-Siyah ağaca enjekte et
    push edx                    ; new_node
    push nasm_labels_root       ; void **root_ptr
    call rbtree_insert          ; rbtree.asm içindeki enjeksiyon motoru
    add esp, 8

.L_define_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
