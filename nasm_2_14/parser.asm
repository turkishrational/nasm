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
    push ebx                    ; *
    push esi                    ; **
    push edi                    ; ***

    mov esi, [ebp+8]            ; ESI = İşlenecek ham satır adresi

    push esi
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

    ; --- POINTER KORUMA / BACKUP NOKTASI ---
    ; İkinci kelimeyi peeking için okumadan önce, güncel satır pointer pozisyonunu yedekliyoruz
    mov ebx, [nasm_scan_line_ptr] ; EBX = Okuma öncesi temiz pointer konumu (Zırh!)

    ; --- ETİKET (LABEL) ÖN KONTROLÜ (PEEKING) ---
    push parser_peek_buf
    call nasm_stdscan_next
    add esp, 4

    cmp eax, 3                  ; Tip 3: Özel Ayırıcı Karakter mi?
    jne .L_restore_and_continue ; Değilse etiket olamaz, geri sar ve devam et

    cmp byte [parser_peek_buf], ':' ; "etiket:" durumu mu?
    je .L_handle_label_register ; İki nokta yakalandıysa doğrudan etiketi işle!

.L_restore_and_continue:
    ; --- SATIR POINTER'INI GERİ SARMA (ROLLBACK) HİLESİ ---
    ; İki nokta bulunamadığı için, peeking sırasında harcanan kelimeyi (`_start`) 
    ; direktif ve opkod motorlarının da nizami okuyabilmesi için pointer'ı eski yerine iade ediyoruz!
    mov [nasm_scan_line_ptr], ebx ; Satır pointer'ı zırhlı eski konumuna geri yüklendi!
    jmp .L_process_directive_check

.L_handle_label_register:
    ; Bulunan etiketi labels.asm matrisine kaydet

    ; 01/09/2026 - Google AI
    ; --- GELECEĞE YATIRIM: %100 UYUMLU 4 PARAMETRE DİZİLİMİ ---
    push 0                          ; Parametre 4: Flags / Attributes (Default 0) - [EBP+20]
    ; Dinamik Segment Kimliği: Sabit 0 yerine, o an aktif olan/üzerinde çalışılan 
    ; segmentin (nasm_current_section_id) küresel BSS değerini yığına itiyoruz!
    push dword [nasm_current_section_id] ; Parametre 3: Active Segment ID 
                                         ; (Ör: .text için 1, .data için 2) - [EBP+16]
    push dword [nasm_program_counter] ; Parametre 2: Real Offset / PC Value - [EBP+12]
    push parser_token_buf           ; Parametre 1: Etiket Adı String Pointer - [EBP+8]
    call nasm_define_label          ; labels.asm matris motorunu tetikle
    add esp, 16                     ; STACK TEMİZLEME: 4 adet dword = 16 byte (Kesin Hizalama)

    ; Etiket sonrası satırın kalanını (talimat var mı diye) taramaya devam et
    push parser_token_buf
    call nasm_stdscan_next
    add esp, 4
    test eax, eax               ; Etiketten sonra kelime yoksa satır bitmiştir
    ;jz .L_parse_empty_success
    jz .L_parse_exit

.L_process_directive_check:
    ; --- 2. DİREKTİF (DIRECTIVE) KONTROLÜ ---
    push parser_token_buf
    call nasm_process_directive  ; Pointer geri sarıldığı için "_start" kelimesi artık kaybolmayacak!
    add esp, 4
    test eax, eax
    jnz .L_parse_empty_success

    ; --- 3. TALİMAT (INSTRUCTION) KONTROLÜ ---
    push parser_token_buf
    call nasm_lookup_instruction
    add esp, 4

    cmp eax, -1
    je .L_unknown_directive_found

    ; Talimat bulunduysa operands parametrelerini satır bitene kadar süz (Pass 1)
.L_operand_loop:
    push parser_token_buf
    call nasm_stdscan_next
    add esp, 4
    test eax, eax
    ; jz .L_parse_empty_success
    jz .L_parse_exit  ; eax = 0
    jmp .L_operand_loop

.L_unknown_directive_found:
    push parser_token_buf
    call unknown_directive_error
    add esp, 4

    mov eax, -1
    jmp .L_parse_exit

.L_parse_empty_success:
    xor eax, eax
.L_parse_exit:
    pop edi                     ; ***
    pop esi                     ; **
    pop ebx                     ; *
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

