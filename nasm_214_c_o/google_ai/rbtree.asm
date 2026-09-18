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

; 02/09/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: rbtree_insert
; C Standart Yapısı: struct rbtree *rb_insert(struct rbtree *tree, struct rbtree *node)
; Girdi (Stack): [EBP+8]  = tree (Mevcut alt ağaç kök pointer ADRESİ - Root/Parent Node)
;                [EBP+12] = node (labels.asm'in hazırladığı 16-byte'lık hazır yeni düğüm adresi)
; Çıktı:         EAX = Güncellenmiş / Dengelenmiş ağaç kök adresi
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP (Kusursuz Re-entry Emniyeti)
; -----------------------------------------------------------------------------
global rbtree_insert
rbtree_insert:
    push ebp
    mov ebp, esp
    push ebx                    ; *
    push esi                    ; **
    push edi                    ; ***

    mov edx, [ebp + 8]          ; EDX = tree (Mevcut düğüm adresi)
    mov edi, [ebp + 12]         ; EDI = node (Eklenecek hazır yeni düğüm adresi)

    ; --- KÖK / YAPRAK KONTROLÜ (İLK ADIM) ---
    test edx, edx               ; Eğer tree NULL (0) ise burası boş bir yapraktır!
    jnz .L_search_and_traverse  ; Boş değilse ağaçta doğrusal ilerlemeye geç

    ; C Kodu: if (!tree) { node->red = true; return node; }
    mov dword [edi + 12], 1     ; node->flags/color = 1 (RED olarak işaretle)
    mov eax, edi                ; Yeni kök olarak doğrudan 'node' adresini döndür
    jmp .L_rbtree_exit

.L_search_and_traverse:
    ; Karşılaştırma için string key adreslerini yükle
    mov esi, [edi + 0]          ; ESI = node->key (Yeni eklenecek etiketin dize adresi)
    mov ecx, [edx + 0]          ; ECX = tree->key (Mevcut düğümün etiket dize adresi)

    push edx                    ; Volatile EDX register'ını koruma altına al
    push ecx                    ; Arg 2: tree->key
    push esi                    ; Arg 1: node->key
    ;call strcmp                ; Stringleri karşılaştır
    call nasm_stricmp           ; Büyük/Küçük harf duyarsız string karşılaştırma 
    add esp, 8                  ; Stack temizle
    pop edx                     ; EDX'i noksansız geri yükle

    ; strcmp sonucuna göre bayrakları (SF, ZF) yeniden tetikleyen emniyet mührü
    test eax, eax               
    js .L_check_left_leaf       ; EAX < 0 ise yeni düğüm küçüktür -> Sola Git!
    jz .L_duplicate_node        ; EAX == 0 ise etiket zaten var, baypas et!

    ; --- SAĞ DALA ÖZYİNELEMELİ (RECURSIVE) EKLEME ---
.L_check_right_leaf:
    ; C Kodu: tree->right = rb_insert(&(tree->right), node);
    ; [edx+12] sağ dal pointer hücresidir.

    mov eax, [edx + 12]         ; EAX = tree->right (Sağ daldaki düğümün adresi)
    test eax, eax               ; Sağ dal boş mu (0 mu)?
    jnz .L_go_recursive_right   ; Doluysa mecburen bir katman daha aşağı in!

    ; SAĞ YAPRAK YAKALANDI
    mov dword [edi + 12], 1     ; Yeni düğümü RED yap
    mov [edx + 12], edi         ; Boş olan sağ dala yeni düğümün adresini direkt mühürle!
    jmp .L_balance_and_return   ; Yukarıya doğru dengeli çıkış yap!

.L_go_recursive_right:
    push edx ; +
    push edi                    ; Parametre 2: Eklenecek yeni node adresi
    push eax                    ; Parametre 1: Alt ağaç kök pointer adresi (&tree->right)
    call rbtree_insert          ; RE-ENTRY: Güvenle kendini tekrar çağır!
    add esp, 8                 ; Stack temizle
    pop edx ; +
    mov [edx + 12], eax         ; Dönen yeni alt kökü sağ dala bağla
    jmp .L_balance_and_return

    ; --- SOL DALA ÖZYİNELEMELİ (RECURSIVE) EKLEME ---
.L_check_left_leaf:
    ; C Kodu: tree->left = rb_insert(&(tree->left), node);
    ; EDX o anki aktif düğüm adresini tutuyor. [edx+8] ise sol dal pointer hücresidir.

    mov eax, [edx + 8]          ; EAX = tree->left (Sol daldaki düğümün adresi)
    test eax, eax               ; Sol dal boş mu (0 mu)?
    jnz .L_go_recursive_left    ; Doluysa mecburen bir katman daha aşağı in!

    ; SOL YAPRAK YAKALANDI
    mov dword [edi + 12], 1     ; Yeni düğümü RED yap
    mov [edx + 8], edi          ; Boş olan sol dala yeni düğümün adresini direkt mühürle!
    jmp .L_balance_and_return   ; Yukarıya doğru dengeli çıkış yap!

.L_go_recursive_left:
    push edx ; +
    push edi                    ; Parametre 2: Eklenecek yeni node adresi
    lea eax, [edx + 8]          ; Sol dal pointer'ının ADRESİNİ al!
    push eax                    ; Parametre 1: Alt ağaç kök pointer adresi (&tree->left)
    call rbtree_insert          ; RE-ENTRY: Güvenle kendini tekrar çağır!
    add esp, 8                 ; Stack temizle
    pop	edx ; +
    mov [edx + 8], eax          ; Dönen yeni alt kökü sol dala bağla
    jmp .L_balance_and_return

.L_duplicate_node:
    ; Eğer etiket zaten varsa (mükerrer), orijinal NASM algoritmasına uygun olarak 
    ; yeni açılan alanı fuzuli eklemiyoruz, mevcut yapıyı aynen koruyoruz.
    ; (İleride buraya redefine error log mekanizması eklenebilir)

.L_balance_and_return:
    ; (Şimdilik basit dengeli ikili arama ağacı şeklinde kökü yukarı akıtıyoruz)
    ; İleride rotate_left ve rotate_right fonksiyonları buraya entegre edilecektir.
    mov eax, edx                ; Mevcut güncel ağaç kök adresini EAX ile döndür

.L_rbtree_exit:
    pop edi                     ; ***
    pop esi                     ; **
    pop ebx                     ; *
    mov esp, ebp
    pop ebp
    ret
