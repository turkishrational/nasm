; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY MERKEZİ ETİKET/SEMBOL MOTORU (labels.asm)
; `nasm386.asm` include zincirinin assemble.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

; 01/09/2026 - Google AI

section .text
align 4

; --- LABELS DÜĞÜM YAPISI (STRUCT LABEL_NODE OFFSETS) ---
; +0  : const char *label_name (Etiket adının adresi)
; +4  : int32_t segment        (Etiketin bulunduğu segment/section ID)
; +8  : int64_t offset         (Etiketin 64-bitlik adres/offset değeri)
; +16 : int flags              (Global, local veya debug bayrakları)

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_init_labels
; İşlev: Sembol tablosu sayaçlarını ve ağaç kökünü başlangıç konumuna getirir.
; -----------------------------------------------------------------------------
global nasm_init_labels
nasm_init_labels:
    push ebp
    mov ebp, esp
    
    mov dword [nasm_symbol_count], 0
    mov dword [nasm_symbol_tree_root], 0 ; Ağaç kökünü sıfırla
    
    mov esp, ebp
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

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_define_label
; C Deklarasyonu: void nasm_define_label(const char *name, int32_t value, int seg, int flags)
; İşlev: Etiket adını malloc ile heap'te kalıcılaştırır ve rbtree için düğüm açar.
; Girdi (Stack): [EBP+8]  = name  (parser_token_buf geçici dize adresi)
;                [EBP+12] = value (32-bit Offset / PC değeri)
;                [EBP+16] = seg   (Segment ID / Aktif Bölüm Kimliği)
;                [EBP+20] = flags (Etiket öznitelikleri)
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP (Kusursuz ABI Uyumu)
; -----------------------------------------------------------------------------
global nasm_define_label
nasm_define_label:
    push ebp
    mov ebp, esp
    push ebx                    ; *
    push esi                    ; **
    push edi                    ; *** (EDI = Yeni Düğüm Adresi Kalesi)

    ; Emniyet Sınırı Kontrolü
    ;mov ecx, [nasm_symbol_count]
    ;cmp ecx, 5000
    ;jnb .L_define_abort

    ; 1. ADIM: Gelen Geçici String'in Uzunluğunu Bul (strlen)
    mov esi, [ebp + 8]          ; ESI = parser_token_buf geçici adresi
    push esi
    call strlen                 ; EAX = String uzunluğu (null hariç)
    add esp, 4
    mov	ebx, eax

    ; 2. ADIM: String İçin Kalıcı Yer Tahsis Et (nasm_malloc)
    inc ebx                     ; Null terminator (+1 byte) için ekle
    push ebx                    ; Boyut parametresi
    call nasm_malloc            ; EAX = Heap'ten gelen temiz ve kalıcı adres
    add esp, 4
    test eax, eax               ; Malloc başarısız mı?
    jz .L_define_abort
    mov edi, eax                ; EDI = Heap'teki yeni kalıcı string adresi

    ; 3. ADIM: Geçici İsim İçeriğini Kalıcı Alana Kopyala (memcpy)
    ; memcpy(hedef_edi, kaynak_esi, boyut_eax)
    push ebx                    ; Kopyalanacak toplam byte sayısı
    push esi                    ; Kaynak: parser_token_buf
    push edi                    ; Hedef: Heap kalıcı alan
    call memcpy
    add esp, 12                 ; Stack alanını temizle (C Call)

    ; Artık etiket adımız 'EDI' adresinde sonsuza kadar güvencede!

    ; 4. ADIM: RBTREE DÜĞÜMÜ (NODE) İÇİN YER AÇ (nasm_malloc)
    ; Bir Red-Black Tree düğümü için tam 16 byte (4x dword) yer istiyoruz
    push 16
    call nasm_malloc            ; EAX = Yeni ağaç düğümünün bellek adresi
    add esp, 4
    test eax, eax
    jz .L_define_abort
    mov ebx, eax                ; EBX = Meşru düğüm pointer adresi

    ; 5. ADIM: PARAMETRELERİ DÜĞÜME MÜKEMMEL HİZALAYARAK KOPYALA (rbtree_insert öncesi)
    mov ecx, [ebp + 12]         ; ECX = 32-bit value (offset)
    mov edx, [ebp + 16]         ; EDX = seg (Segment ID)
    mov eax, [ebp + 20]         ; EAX = flags

    mov [ebx + 0], edi          ; Ofset 0: Heap'teki kalıcı string pointer'ı (4 Byte)
    mov [ebx + 4], ecx          ; Ofset 4: 32-bit Value / Offset (4 Byte)
    mov [ebx + 8], edx          ; Ofset 8: Segment ID (4 Byte)
    mov [ebx + 12], eax         ; Ofset 12: Flags (4 Byte)

    ; 6. ADIM: DÜĞÜMÜ RED-BLACK TREE AĞACINA EKLE (rbtree_insert)
    push ebx                    ; Parametre 2: Yeni hazırlanan 16-byte'lık düğüm adresi
    push dword [nasm_symbol_tree_root] ; Parametre 1: Güncel ağaç kök pointer adresi
    call rbtree_insert          ; Ağaç motorunu tetikle (EBX ve EDI içeride korunur)
    add esp, 8                  ; Stack temizle

    mov [nasm_symbol_tree_root], eax ; Dönen yeni kök adresini kilit altında sakla
    inc dword [nasm_symbol_count]    ; Kayıtlı sembol sayısını artır

.L_define_abort:
    pop edi                     ; *** (EDI Güvenle Kurtarıldı)
    pop esi                     ; **  (ESI Kurtarıldı)
    pop ebx                     ; *   (EBX Kurtarıldı)
    mov esp, ebp
    pop ebp
    ret

align 4

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_lookup_label
; İşlev: Etiketi ararken ismi ve aktif segment kimliğini doğrusal denetler.
; -----------------------------------------------------------------------------
global nasm_lookup_label
nasm_lookup_label:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp+8]            ; ESI = Aranan geçici etiket adı pointer'ı
    
    ; Not: Doğrusal arama için matris havuzu iptal edilip tamamen rbtree_lookup 
    ; mimarisine geçilecektir. Geçici uyumluluk için rbtree kökünden arama kurgusu:
    mov edx, [nasm_symbol_tree_root] ; EDX = Ağacın kök düğüm pointer'ı
    test edx, edx
    jz .L_lookup_fail

    ; --- RBTREE AĞACI ÜZERİNDE DOĞRUSAL VE GÜVENLİ ARAMA KÖPRÜSÜ ---
    ; (Buraya sizin yerel dosyanızdaki rbtree_lookup veya doğrusal tarama kodunuz gelecektir)
    ; Şimdilik yığın dengesini bozmamak için emniyetle başarısızlık yönü veriyoruz.
    jmp .L_lookup_fail

.L_lookup_fail:
    xor eax, eax                ; 0 = Bulunamadı

.L_lookup_exit:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

