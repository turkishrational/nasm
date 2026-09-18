; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY FORMAT DAĞITICI SÜRÜCÜSÜ (outform.asm)
; `nasm386.asm` include zincirinin rdstrnum.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 31/08/2026
; =======================================================================

global ofmt_find
global nasm_layout_ofmt_list

section .text
align 4

; =============================================================================
; C Fonksiyonu: struct ofmt *ofmt_find(const char *name)
; Açıklama:     Komut satırından girilen format adını sözlük listesinde arar.
;               Bulamazsa kilitlenmeden güvenle NULL (0) döndürür.
; Giriş (Stack):[ESP + 12] = Aranan format adı string adresi (name)
; Çıkış:        EAX = Sürücü yapı adresi (struct ofmt *) veya Bulunamazsa hazır 0
; =============================================================================
ofmt_find:
    push ebx
    push esi

    mov esi, nasm_ofmt_list     ; esi = data.asm içindeki sürücü listesi adresi [struct ofmt * list]

.L_find_loop:
    lodsd                       ; EAX = Sıradaki sürücü yapısının mutlak adresi (ESI otomatik +4 ilerler)
    test eax, eax               ; Listenin sonundaki NULL (dd 0) sınırına gelindi mi?
    jz .L_done                  ; Bulunamazsa direkt çık, EAX zaten 0 durumundadır!

    mov edx, [eax]              ; edx = struct ofmt yapısının ilk elemanı (+0: kısa ad pointer'ı, örn: "bin")

    ; Taze başlangıç adresi yükle (Pushlar sebebiyle aranan dize adresi ESP+12 konumundadır)
    mov ebx, [esp + 12]    

    ; Karakter karşılaştırma döngüsü (strcmp yükünü tamamen eler)
.L_strcmp_loop:
    mov cl, [ebx]               ; Aranan dizeden karakter oku
    mov ch, [edx]               ; Sürücü isminden karakter oku
    cmp cl, ch
    jne .L_find_loop            ; Eşleşme bozulduysa doğrudan sonraki sürücü paketine geç (EAX adresini korur)
    test cl, cl                 ; String sonu (NULL) ulaşıldı mı?
    jz .L_done                  ; Karakterler %100 uyuştu ve string bitti! (EAX = Bulunan struct ofmt * kalır)

    ; Karakterler aynıysa ve string bitmediyse adresleri ilerlet
    inc ebx
    inc edx
    jmp .L_strcmp_loop

.L_done:
    pop esi
    pop ebx
    ret

align 4

; =============================================================================
; C Fonksiyonu: void nasm_layout_ofmt_list(void)
; Açıklama:     Mevcut port yapısında liste statik hazırlandığından stub'dır.
; =============================================================================
nasm_layout_ofmt_list:
    ret

