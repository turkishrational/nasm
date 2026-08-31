; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY MÜKEMMEL HASH MOTORU (perfhash.asm)
; `nasm386.asm` include zincirinin strlist.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global perfhash_find

; =============================================================================
; C Fonksiyonu: int perfhash_find(const char *str)
; Açıklama:     İşlemci boru hattını (pipeline) en verimli şekilde kullanan,
;               lodsd ve movzx tabanlı ultra hızlı komut arama motoru.
; Giriş (Stack):[ESP + 4] = Aranan komut string adresi (str)
; Çıkış:        EAX = Token / Instruction ID (Bulunamazsa 0)
; =============================================================================
perfhash_find:
    ;push ebp
    ;mov ebp, esp
    push ebx
    push esi

    mov esi, nasm_insns_perfhash ; esi = Sıkıştırılmış Dword tablomuzun başlangıcı

.L_search_loop:
    lodsd                       ; EAX = [Token ID (16-bit) : Havuz Offset (16-bit)] (ESI otomatik +4 artar)
    test eax, eax               ; Tablo bitti mi veya boş mu? (EAX == 0 kontrolü)
    jz .L_not_found             ; EAX = 0 ise aramayı durdur

    movzx edx, ax               ; EDX = Sadece alt 16-bit (Havuz Offset mesafesi). Üstü otomatik sıfırlanır.
    shr eax, 16                 ; EAX = Sadece üst 16-bit (Mevcut komutun Token ID değeri)

    ; Gerçek string adresi hesaplama = nasm_insn_string_pool.start + EDX
    add edx, nasm_insn_string_pool.start

    ;mov ebx, [ebp + 8]         ; ebx = Aranan komut dizgesi adresi (Örn: "mov")
    mov	ebx, [esp+12]    

    ; Karakter karşılaştırma döngüsü (strcmp yükünü tamamen eler)
.L_compare_loop:
    mov cl, [ebx]               ; Aranan dizeden karakter oku
    mov ch, [edx]               ; Sözlük havuzundan karakter oku
    cmp cl, ch
    jne .L_search_loop          ; Eşleşme bozulduysa doğrudan sonraki Dword paketine geç
    test cl, cl                 ; String sonu (NULL) ulaşıldı mı?
    jz .L_done                  ; Karakterler %100 uyuştu ve string bitti!

    ; Karakterler aynıysa ve string bitmediyse devam et
    inc ebx
    inc edx
    jmp .L_compare_loop

.L_not_found:
    ; eax = 0
.L_done:
    pop esi
    pop ebx
    ;mov esp, ebp
    ;pop ebp
    ret

