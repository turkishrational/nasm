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

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_lookup_instruction
; İşlev: Verilen kelimeyi nasm_instructions_table içinde arar.
; Girdi: [ESP+4] = mnemonic_str (Aranan komut adı string pointer'ı)
; Çıktı: EAX = Tablodaki indeks numarası, Bulunamazsa -1
; -----------------------------------------------------------------------------
global nasm_lookup_instruction
nasm_lookup_instruction:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp+8]            ; ESI = Aranan talimat adı (Ör: "mov")
    mov edi, nasm_instructions_table ; EDI = data.asm içindeki matris başlangıcı
    xor ecx, ecx                ; ECX = Döngü/İndeks sayacı

.L_search_loop:
    mov edx, [edi]              ; EDX = Tablodaki kaydın string pointer adresi
    test edx, edx
    jz .L_not_found             ; Tablo sonu (Null Terminator)

    push ecx                    ; Sayaçları koru
    push edx                    ; Parametre 2: Tablodaki string
    push esi                    ; Parametre 1: Aranan string
    call strcmp                 ; libnasm.asm içindeki strcmp
    add esp, 8                  ;
    pop ecx                     ;

    or eax, eax
    jz .L_found                 ; EAX == 0 ise tam eşleşme bulundu!

    add edi, 12                 ; Sonraki 12-byte'lık kayda geç
    inc ecx
    jmp .L_search_loop

.L_found:
    mov eax, ecx                ; Bulunan indeks numarasını döndür
    jmp .L_exit

.L_not_found:
    mov eax, -1                 ; Bulunamadıysa -1 dön

.L_exit:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

