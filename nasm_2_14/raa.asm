; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DİNAMİK DİZİ MOTORU (raa.asm)
; `nasm386.asm` include zincirinin hashtbl.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global raa_init
global raa_free
global raa_read
global raa_write

; extern nasm_malloc
; extern nasm_calloc
; extern nasm_free

section .text
align 4

; --- RAA DİZİ YÖNETİM YAPISI (STRUCT OFFSETS) ---
; +0 : int layers (Katman sayısı, hiyerarşi derinliği)
; +4 : int step   (Her bir alt katmanın eleman kapasitesi)
; +8 : void **data (Alt katmanların pointer dizisinin adresi)

; =========================================================================
; struct raa *raa_init(void)
; Yeni bir dinamik dizi yapısı ilklendirir ve kök pointer'ı döner.
; =========================================================================
raa_init:
    push ebp
    mov ebp, esp
    push ebx

    ; Kök kontrol bloğu için 12 byte yer ayır (layers + step + data)
    push 12
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_init_done

    mov dword [eax + 0], 1      ; raa->layers = 1 (Başlangıçta tek katman)
    mov dword [eax + 4], 32     ; raa->step = 32 (Varsayılan alt katman boyutu)

    mov ebx, eax                ; Kök adresini ebx'e al

    ; 32 elemanlık ilk veri alt katman pointer dizisini calloc ile sıfırlayarak aç
    push 4                      ; elsize = 4 byte (pointer genişliği)
    push 32                     ; nelem = 32
    call nasm_calloc
    add esp, 8
    
    mov [ebx + 8], eax          ; raa->data = calloc'tan gelen pointer dizisi
    mov eax, ebx                ; Return EAX = raa kontrol bloğu adresi

.L_init_done:
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; void raa_free(struct raa *r)
; Dinamik dizinin hiyerarşik olarak tüm katmanlarını hafızadan temizler.
; =========================================================================
raa_free:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov ebx, [ebp + 8]          ; ebx = r (struct raa *)
    test ebx, ebx
    jz .L_free_done

    mov esi, [ebx + 8]          ; esi = r->data (Alt pointer dizisi)
    test esi, esi
    jz .L_free_block

    ; Katmanlı hiyerarşik silme simülasyonu
    ; (Utilize edilmemiş ilk sürümde kök veri katmanı serbest bırakılır)
    push esi
    call nasm_free
    add esp, 4

.L_free_block:
    push ebx
    call nasm_free
    add esp, 4

.L_free_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; void *raa_read(struct r_array *r, long idx)
; Dizinin belirtilen indeksindeki veriyi (pointer/value) döner.
; =========================================================================
raa_read:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov ebx, [ebp + 8]          ; ebx = r
    mov ecx, [ebp + 12]         ; ecx = idx (istenen eleman indeksi)

    test ebx, ebx
    jz .L_read_null
    cmp ecx, 0
    jl .L_read_null             ; Negatif indeks koruması

    mov esi, [ebx + 8]          ; esi = r->data
    test esi, esi
    jz .L_read_null

    mov eax, [ebx + 4]          ; eax = r->step (32)
    cmp ecx, eax
    jge .L_read_null            ; İlk aşamada step sınırını aşan istekler NULL döner

    mov eax, [esi + ecx * 4]    ; Return EAX = r->data[idx]
    jmp .L_read_done

.L_read_null:
    xor eax, eax                ; Taşma veya boşluk durumunda Return 0

.L_read_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; struct raa *raa_write(struct raa *r, long idx, void *data)
; Belirtilen indekse veriyi yazar. Eğer indeks mevcut kapasiteyi aşıyorsa,
; otomatik katman büyütme lojiğini (allocation) tetikler.
; =========================================================================
raa_write:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov ebx, [ebp + 8]          ; ebx = r
    mov esi, [ebp + 12]         ; esi = idx
    mov edi, [ebp + 16]         ; edi = data

    test ebx, ebx
    jz .L_write_fail

    mov ecx, [ebx + 4]          ; ecx = r->step (32)
    cmp esi, ecx
    jl .L_direct_write          ; Eğer indeks step limitinden (32) küçükse direkt yaz

    ; =========================================================================
    ; OTOMATİK KATMAN GENİŞLETME SİMÜLASYONU (TCC PORT UYUMLULUK KİLİDİ)
    ; İndeks 32 veya üzerindeyse, flat havuzda yeni bir genişletilmiş alt dizi açılır.
    ; =========================================================================
    mov eax, esi
    add eax, 32                 ; İndeksin biraz ötesine kadar güvenli alan aç
    mov [ebx + 4], eax          ; r->step = yeni genişletilmiş sınır
    mov ecx, eax

    push esi                    ; Mevcut indeksi koru
    
    push 4                      ; elsize = 4
    push ecx                    ; nelem = yeni genişletilmiş step boyutu
    call nasm_calloc
    add esp, 8
    mov edx, eax                ; edx = yeni pointer dizisi alanı

    pop esi                     ; İndeksi geri yükle

    test edx, edx
    jz .L_write_fail

    ; Eski küçük dizideki verileri yeni devasa alana taşı (Memcpy köprüsü)
    mov ecx, [ebx + 8]          ; ecx = eski r->data
    test ecx, ecx
    jz .L_skip_copy

    push edx                    ; yeni alanı koru
    push esi                    ; mevcut indeksi koru
    
    push 128                    ; Eski 32 elemanın kapladığı alan (32 * 4 = 128 byte)
    push ecx                    ; src = eski r->data
    push edx                    ; dest = yeni r->data
    call memcpy
    add esp, 12

    push ecx                    ; Eski alanı boşa çıkarmak için sakla
    
    pop ecx
    pop esi
    pop edx

    push edx
    push ecx
    call nasm_free              ; Eski küçük alanı serbest bırak (çöp azaltma)
    add esp, 4
    pop edx

.L_skip_copy:
    mov [ebx + 8], edx          ; r->data = yeni genişletilmiş pointer dizisi adresi
    mov [edx + esi * 4], edi    ; Yeni genişletilen indekse veriyi yaz
    jmp .L_write_success

.L_direct_write:
    mov edx, [ebx + 8]          ; edx = r->data
    mov [edx + esi * 4], edi    ; r->data[idx] = data

.L_write_success:
    mov eax, ebx                ; Başarılı: Return r kontrol bloğu adresi
    jmp .L_write_done

.L_write_fail:
    xor eax, eax                ; Hata: Return NULL (0)

.L_write_done:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret
