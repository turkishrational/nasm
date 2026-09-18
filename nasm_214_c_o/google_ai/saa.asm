; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY SIRALI DİZİ MOTORU (saa.asm)
; `nasm386.asm` include zincirinin raa.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global saa_init
global saa_free
global saa_wbytes
global saa_rewind
global saa_rbytes

; extern nasm_malloc
; extern nasm_free
; extern memcpy
; extern memset

section .text
align 4

; --- SAA KONTROL VE BLOK YAPISI (STRUCT OFFSETS) ---
; Kontrol Bloğu (struct saa):
; +0  : size_t elem_size    (Her bir elemanın byte boyutu)
; +4  : size_t blk_size     (Bir bloktaki maksimum eleman sayısı)
; +8  : size_t total_size   (Toplam eklenen eleman sayısı)
; +12 : struct saa_block *head  (İlk bloğun adresi)
; +16 : struct saa_block *tail  (Mevcut aktif son bloğun adresi)
; +20 : struct saa_block *rptr  (Okuma işaretçisi/rewind takip hücresi)
; +24 : size_t roffset      (Mevcut blok içindeki okuma offseti)

; Veri Bloğu Yapısı (struct saa_block):
; +0  : struct saa_block *next  (Bir sonraki veri bloğunun adresi)
; +4  : char data[...]      (Ham veri alanı)

; =========================================================================
; struct saa *saa_init(size_t elem_size)
; Sıralı dizi yapısını ilklendirir ve kök kontrol bloğunu döner.
; =========================================================================
saa_init:
    push ebp
    mov ebp, esp

    ; Kök kontrol bloğu için 28 byte yer ayır (7 alan * 4 byte)
    push 28
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_init_done

    mov ecx, [ebp + 8]          ; ecx = elem_size
    mov [eax + 0], ecx          ; r->elem_size = elem_size
    mov dword [eax + 4], 1024   ; r->blk_size = 1024 (Varsayılan blok kapasitesi)
    mov dword [eax + 8], 0      ; r->total_size = 0
    mov dword [eax + 12], 0     ; r->head = NULL
    mov dword [eax + 16], 0     ; r->tail = NULL
    mov dword [eax + 20], 0     ; r->rptr = NULL
    mov dword [eax + 24], 0     ; r->roffset = 0

.L_init_done:
    pop ebp
    ret

align 4

; =========================================================================
; void saa_free(struct saa *s)
; Sıralı dizinin zincirlenmiş tüm veri bloklarını hafızadan temizler.
; =========================================================================
saa_free:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov ebx, [ebp + 8]          ; ebx = s (struct saa *)
    test ebx, ebx
    jz .L_free_done

    mov esi, [ebx + 12]         ; esi = s->head (İlk blok)

.L_free_loop:
    test esi, esi
    jz .L_free_root

    mov ebx, [esi + 0]          ; ebx = block->next (Sonraki bloğu yedekle)
    
    push esi
    call nasm_free              ; Veri bloğunu serbest bırak
    add esp, 4
    
    mov esi, ebx
    jmp .L_free_loop

.L_free_root:
    push dword [ebp + 8]        ; Kök kontrol bloğunu serbest bırak
    call nasm_free
    add esp, 4

.L_free_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; void *saa_wbytes(struct saa *s, const void *data, size_t size)
; Sıralı diziye ham byte bloğu ekler. Alan yetersizse otomatik yeni blok açar.
; =========================================================================
saa_wbytes:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov ebx, [ebp + 8]          ; ebx = s
    mov esi, [ebp + 12]         ; esi = data source pointer
    mov edi, [ebp + 16]         ; edi = size (yazılacak byte miktarı)

    test ebx, ebx
    jz .L_wbytes_fail

    mov ecx, [ebx + 16]         ; ecx = s->tail
    test ecx, ecx
    jnz .L_check_space          ; Eğer aktif bir kuyruk bloğu varsa boşluğu denetle

    ; =========================================================================
    ; İLK BLOK TAHSİSATI (Ağaç Boşken Tetiklenir)
    ; =========================================================================
    ; Blok Boyutu: 4 byte (next pointer) + r->blk_size (1024)
    mov eax, [ebx + 4]
    add eax, 4
    
    push eax
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_wbytes_fail
    
    mov dword [eax + 0], 0      ; block->next = NULL
    mov [ebx + 12], eax         ; s->head = new_block
    mov [ebx + 16], eax         ; s->tail = new_block
    mov [ebx + 20], eax         ; s->rptr = new_block
    mov dword [ebx + 24], 0     ; s->roffset = 0
    mov ecx, eax

.L_check_space:
    ; ecx = s->tail, edi = size
    mov edx, [ebx + 24]         ; edx = s->roffset (Aslında s->tail_offset olarak kullanılır)
    mov eax, [ebx + 4]          ; eax = s->blk_size (1024)
    sub eax, edx                ; eax = blokta kalan boş yer
    cmp eax, edi
    jae .L_do_copy              ; Boş yer yeterliyse doğrudan kopyala

    ; =========================================================================
    ; YENİ BLOK ENJEKSİYONU (Alan Dolduğunda Tetiklenir)
    ; =========================================================================
    mov eax, [ebx + 4]
    add eax, 4
    push ecx                    ; Eski kuyruğu koru
    push eax
    call nasm_malloc
    add esp, 4
    mov edx, eax                ; edx = yeni_blok
    pop ecx                     ; ecx = eski kuyruk
    test edx, edx
    jz .L_wbytes_fail

    mov dword [edx + 0], 0      ; yeni_blok->next = NULL
    mov [ecx + 0], edx          ; eski_kuyruk->next = yeni_blok
    mov [ebx + 16], edx         ; s->tail = yeni_blok
    mov dword [ebx + 24], 0     ; Sıfır offset ile başla
    mov ecx, edx                ; Aktif blok = yeni_blok

.L_do_copy:
    ; ecx = aktif_blok, edi = size, esi = data
    mov edx, [ebx + 24]         ; edx = current offset
    lea eax, [ecx + 4 + edx]    ; eax = hedef veri adresi (block->data + offset)
    
    test esi, esi
    jz .L_zero_fill             ; Eğer veri pointer'ı NULL ise sıfır dolgusu yap
    
    push edi                    ; size
    push esi                    ; src
    push eax                    ; dest
    call memcpy
    add esp, 12
    jmp .L_update_stats

.L_zero_fill:
    push edi                    ; size
    push 0                      ; value = 0
    push eax                    ; dest
    call memset
    add esp, 12

.L_update_stats:
    add [ebx + 24], edi         ; tail offsetini büyüt
    add [ebx + 8], edi          ; s->total_size += size
    mov eax, [ebx + 16]         ; Return EAX = s->tail adresi
    jmp .L_wbytes_done

.L_wbytes_fail:
    xor eax, eax

.L_wbytes_done:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; void saa_rewind(struct saa *s)
; Okuma işaretçisini (rptr) tekrar ağacın başına (head) sarar.
; =========================================================================
saa_rewind:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]          ; eax = s
    test eax, eax
    jz .L_rewind_done
    
    mov ecx, [eax + 12]         ; ecx = s->head
    mov [eax + 20], ecx         ; s->rptr = s->head
    mov dword [eax + 24], 0     ; s->roffset = 0

.L_rewind_done:
    pop ebp
    ret

align 4

; =========================================================================
; void *saa_rbytes(struct saa *s, size_t *size)
; Sıralı diziden ardışık okuma yapar ve okunan bloğun adresini döner.
; =========================================================================
saa_rbytes:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp + 8]          ; ebx = s
    mov ecx, [ebp + 12]         ; ecx = size * pointer (Geri dönen boyut hücresi)

    test ebx, ebx
    jz .L_rbytes_null

    mov eax, [ebx + 20]         ; eax = s->rptr (Mevcut okuma bloğu)
    test eax, eax
    jz .L_rbytes_null

    ; Bu utilize edilmemiş basit sürümde, blok genişliğini (1024) doğrudan dönüyoruz
    mov edx, [ebx + 4]          ; s->blk_size
    test ecx, ecx
    jz .L_set_rptr
    mov [ecx], edx              ; *size = s->blk_size

.L_set_rptr:
    lea edx, [eax + 4]          ; edx = block->data başlangıç adresi
    
    ; Bir sonraki çağrı için okuma işaretçisini kaydır
    mov eax, [eax + 0]          ; eax = block->next
    mov [ebx + 20], eax         ; s->rptr = block->next
    
    mov eax, edx                ; Return EAX = Okunan veri alanının adresi
    jmp .L_rbytes_done

.L_rbytes_null:
    xor eax, eax
    test ecx, ecx
    jz .L_rbytes_done
    mov dword [ecx], 0          ; *size = 0

.L_rbytes_done:
    pop ebx
    pop ebp
    ret
