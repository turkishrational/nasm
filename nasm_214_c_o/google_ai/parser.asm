; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY SÖZDİZİMİ ÇÖZÜMLEME MOTORU (parser.asm)
; `nasm386.asm` include zincirinin labels.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

section .text
align 4

; --- INSNTTOK YAPISI (STRUCT INSN_TOK OFFSETS) ---
; +0  : int type            (Token türü: T_INSN, T_LABEL, T_DIRECTIVE vb.)
; +4  : const char *text    (Kelimelerin ham metin adresi)
; +8  : void *value         (Eşleşen iç opkod veya direktif göstericisi)

; 01/09/2026 - Google AI
; 03/09/2026

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_parse_line
; C Deklarasyonu: int nasm_parse_line(const char *line)
; İşlev: Okunan satırı token'larına ayırır, etiket, direktif veya opkod olarak işler.
; Girdi: [ESP+4] = line (Çözümlenecek ASCIIZ satır adresi)
; Çıktı: EAX = 0 (Başarı), EAX = -1 (Sözdizimi Hatası)
; Değişen Register'lar: EAX, ECX, EDX (Serbest Scratch)
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP (Callee-saved)
; -----------------------------------------------------------------------------
global nasm_parse_line
nasm_parse_line:
    push ebp
    mov ebp, esp
    ;push ebx                   ; *
    ;push esi                   ; **
    ;push edi                   ; ***

    mov eax, [ebp+8]            ; EAX = İşlenecek ham satır adresi

    push eax
    call nasm_stdscan_init      ; Tokenizer satır pointer'ını ilklendir
    add esp, 4

    ; 1. İLK KELİMEYİ ÇEK (parser_token_buf)
    push parser_token_buf
    call nasm_stdscan_next
    add esp, 4

    test eax, eax               ; EAX == 0 ise boş veya yorum satırıdır
    ;jz .L_parse_empty_success
    jz .L_parse_exit 

    cmp eax, 1                  ; Tip 1: Temiz Kelime mi?
    jne .L_unknown_directive_found

    ; 03/09/2026 - Google AI

    ; --- 1. ADIM: PEEKING / ÖNİZLEME İLE ETİKET (LABEL) TEŞHİSİ ---
    ; Satır pointer konumunu (nasm_scan_line_ptr) yedekliyoruz
    mov ebx, [nasm_scan_line_ptr] ; EBX = Okuma öncesi temiz pointer konumu (Zırh!)

    push parser_peek_buf
    call nasm_stdscan_next      ; İkinci parçayı önizliyoruz (Token 2)
    add esp, 4

    cmp eax, 3                  ; Tip 3: Özel Ayırıcı Karakter mi? (':', ',' vb.)
    jne .L_no_label_checkpoint  ; Değilse etiket değildir, direkt checkpoints alanına zıpla!
    
    cmp byte [parser_peek_buf], ':' ; "etiket:" durumu mu?
    jne .L_no_label_checkpoint  ; Değilse yine etiket değildir

    ; === TAM İSABET: ETİKET (LABEL) TESCİLLENDİ! ===
    ; Örn: 'L_INIT_RUNTIME:' yakalandı. labels.asm motoruna dinamik parametrelerle push ediyoruz:
    push 0                          ; Parametre 4: Flags (0)
    push dword [nasm_current_section_id] ; Parametre 3: Aktif Segment ID (.text, .data vb.)
    push dword [nasm_program_counter] ; Parametre 2: Anlık derleme Konum Sayacı (Offset)
    push parser_token_buf           ; Parametre 1: Etiket adı string pointer'ı
    call nasm_define_label          ; Sembol ağacına (rbtree) donanım kesinliğiyle kaydet!
    add esp, 16                     ; Stack frame'i tam 16 byte (4 dword) tertemiz süpür!

    ; --- ETİKET ERİTİLDİ. ŞİMDİ SATIRIN KALANINI TARAMAYA DEVAM EDİYORUZ ---
    ; Satırdaki bir sonraki asıl kelimeyi emiyoruz (Örn: 'mov' veya 'dd')
    push parser_token_buf
    call nasm_stdscan_next
    add esp, 4
    test eax, eax
    jz .L_parse_empty_success      ; Etiket sonrası satır bittiyse (Örn: '_start:') temiz çık!
    jmp .L_process_directive_check ; Bittiyse doğrudan hiyerarşi taramasına ak!

.L_no_label_checkpoint:
    ; Eğer etiket değilse, tokenizer'ı peeking öncesindeki o temiz konuma geri sarıyoruz!
    mov [nasm_scan_line_ptr], ebx

.L_process_directive_check:
    ; --- 2. ADIM: DİREKTİF HİYERARŞİ KONTROLÜ (bits, section, global, db, dd vb.) ---
    push parser_token_buf
    call nasm_process_directive ; directiv.asm altındaki tablo arama motorunu tetikle
    add esp, 4
    test eax, eax               ; EAX sıfırdan büyükse direktif bulunmuş ve işlenmiştir!
    jnz .L_parse_empty_success  ; O halde satırı başarıyla kapat, sonraki satıra geç!

    ; --- 3. ADIM: CPU TALİMAT HİYERARŞİ KONTROLÜ (mov, jmp, push, pop vb.) ---
    push parser_token_buf
    call nasm_lookup_instruction
    add esp, 4

    cmp eax, -1                 ; Komut tablosunda da yoksa, o meşhur "mox" hatasını fırlat!
    je .L_unknown_directive_found

    ; === TAM İSABET: CPU TALİMATI ÇÖZÜMLENDİ! ===
    ; Paketi byte seviyesinde outbin tamponuna döşemesi için dökümcüye paslıyoruz:.L_operand_loop:
    push eax
    call nasm_emit_instruction  ; outbin.asm içerisindeki çözücü ve emit motoru
    add esp, 4
    jmp .L_parse_empty_success

.L_unknown_directive_found:
    push parser_token_buf
    call unknown_directive_error
    add esp, 4

    mov eax, -1
    jmp .L_parse_exit

.L_parse_empty_success:
    xor eax, eax
.L_parse_exit:
    ;pop edi                    ; ***
    ;pop esi                    ; **
    ;pop ebx                    ; *
    mov esp, ebp
    pop ebp
    ret 

align 4

; 02/09/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_lookup_instruction
; İşlev: Verilen kelimeyi nasm_instructions_table içinde arar.
; Girdi (Stack): [ESP+4] = parser_token_buf adresi (Ör: "mov", "MOV", "laBEL")
; -----------------------------------------------------------------------------
global nasm_lookup_instruction
nasm_lookup_instruction:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp+8]            ; ESI = Orijinal harf nizamlı ham dize adresi
    
    ; =============================================================================
    ; ANLIK REGISTER FİLTRESİ (BELLEKTEKİ STRING ASLA VE KAT'İYEN DEĞİŞMEZ!)
    ; =============================================================================
    xor ebx, ebx
    mov bl, byte [esi]          ; BL = İlk karakterin saf ASCII kodu
    test bl, bl
    jz .not_a_valid_instruction ; Boş string emniyeti

    ; --- BÜYÜK HARF SINIR DENETİMİ VE İNDEKSLEME ---
    cmp bl, 'A'
    jl .not_a_valid_instruction ; 'A' dan küçükse kesinlikle talimat olamaz
    cmp bl, 'Z'
    jg .L_check_lower           ; 'Z' den büyükse küçük harf kontrol alanına zıpla
    
    ; Karakter 'A' ile 'Z' arasında yakalandı!
    sub bl, 'A'                 ; BL = 'M' (77) - 'A' (65) = 12 (Temiz İndeks!)
    jmp .L_get_bucket_addr      ; Doğrudan matris adresleme alanına uç!

.L_check_lower:
    ; --- KÜÇÜK HARF SINIR DENETİMİ VE İNDEKSLEME ---
    cmp bl, 'a'
    jl .not_a_valid_instruction ; 'a' dan küçükse kesinlikle talimat olamaz
    cmp bl, 'z'
    jg .not_a_valid_instruction ; 'z' den büyükse kesinlikle talimat olamaz

   ; Karakter 'a' ile 'z' arasında yakalandı!
    sub bl, 'a'                 ; BL = 'm' (109) - 'a' (97) = 12 (Temiz İndeks!)

.L_get_bucket_addr:
    shl ebx, 2                  ; EBX = Harf İndeksi (0-25) * 4 (Dword indeks çarpanı)
    
    ; MOV ile doğrudan 104-byte'lık kompakt matristeki kova pointer'ını ECX'e emiyoruz!
    mov ecx, [nasm_instructions_table + ebx] 
    
    ; ECX sıfır (0) ise bu harfle başlayan hiçbir talimat yoktur, anında çık!
    jecxz .not_a_valid_instruction

    ; Meşru kova adresi tescillendi! Şimdi döngü için ESI register'ına aktarıyoruz
    mov esi, ecx                ; ESI = Kovayı işaret eden meşru dize grubu adresi

.L_bucket_search:
    mov edx, [esi]              ; EDX = Kovadaki kayıtlı küçük harfli komut adı pointerı
    test edx, edx               ; Kova sonu (0) veya stop marker yakalandı mı?
    jz .not_a_valid_instruction ; Sıfır gördüysen bu harf grubunda bu komut yoktur!

    push edx                    ; Arg 2: Tablodaki küçük harfli ad (Ör: "mov")
    push dword [ebp+8]          ; Arg 1: Kullanıcının yazdığı orijinal kelime (Ör: "MoV")
    call nasm_stricmp           ; Büyük-küçük harf duyarsız karşılaştırma
    add esp, 8                  ; Yığın temizleme

    or eax, eax
    jz .L_ins_matched           ; Sıfır fark bulundu, talimat tam isabetle yakalandı!

    add esi, 12                 ; Stride: Sonraki 12-byte'lık kayda geç
    jmp .L_bucket_search

.L_ins_matched:
    mov eax, [esi+8]            ; EAX = Bulunan talimatın Opkod / Flags dword paketi
    jmp .L_exit

.not_a_valid_instruction:
    mov eax, -1                 ; Talimat değil veya bulunamadı kodu (-1)

.L_exit:
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

