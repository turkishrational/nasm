; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY SÖZDİZİMİ ÇÖZÜMLEME MOTORU (parser.asm)
; `nasm386.asm` include zincirinin labels.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_parse_line

; extern nasm_malloc
; extern nasm_free
; extern nasm_error
; extern nasm_directive_find
; extern nasm_lookup_label
; extern perfhash_find
; extern isspace

section .text
align 4

; --- INSNTTOK YAPISI (STRUCT INSN_TOK OFFSETS) ---
; +0  : int type            (Token türü: T_INSN, T_LABEL, T_DIRECTIVE vb.)
; +4  : const char *text    (Kelimelerin ham metin adresi)
; +8  : void *value         (Eşleşen iç opkod veya direktif göstericisi)

; =========================================================================
; struct insn_tok *nasm_parse_line(const char *line_buffer)
; Satır dizesini ayrıştırır ve token'lara bölünmüş hiyerarşik yapıyı döner.
; =========================================================================
nasm_parse_line:
    push ebp
    mov ebp, esp
    sub esp, 24                 ; Yerel hücreler (token_type, loop_ptr vb.)
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]          ; esi = line_buffer string adresi
    test esi, esi
    jz .L_parse_null

    ; Önce baştaki boşlukları (whitespace) atla
.L_skip_ws:
    xor eax, eax
    mov al, byte [esi]
    test al, al
    jz .L_parse_null            ; Boş veya sadece newline içeren satırsa elenir
    
    push eax
    call isspace
    add esp, 4
    test eax, eax
    jz .L_check_comment
    inc esi
    jmp .L_skip_ws

.L_check_comment:
    mov al, byte [esi]
    cmp al, ';'                 ; Yorum satırı başlangıcı mı?
    je .L_parse_null
    cmp al, '%'                 ; Preprocessor makro kalıntısı mı?
    je .L_parse_null

    ; 1. Adım: Token kontrol bloğu için 12 byte bellek ayır (type + text + value)
    push 12
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_parse_null
    mov ebx, eax                ; ebx = new_token_node

    mov dword [ebx + 0], 0      ; default type = T_UNKNOWN (0)
    mov [ebx + 4], esi          ; node->text = kelimenin başlangıç adresi
    mov dword [ebx + 8], 0      ; node->value = NULL

    ; 2. Adım: İlk kelimenin sınırını bulmak için tara
    mov edi, esi                ; edi = kelime yürütücü işaretçi
.L_word_scan:
    mov al, byte [edi]
    test al, al
    jz .L_word_end
    cmp al, ' '
    je .L_word_end
    cmp al, 9                   ; \t
    je .L_word_end
    cmp al, ':'                 ; Etiket zırhı (:) var mı?
    je .L_found_label_colon
    inc edi
    jmp .L_word_scan

.L_found_label_colon:
    ; Eğer kelimenin sonunda iki nokta (:) varsa bu kesinlikle bir etikettir (T_LABEL = 1)
    mov dword [ebx + 0], 1      ; node->type = T_LABEL
    mov byte [edi], 0           ; İki noktayı null terminator ile ezerek ismi temizle
    jmp .L_parse_done

.L_word_end:
    ; Kelime sınırına gelindi (Boşluk veya satır sonu)
    ; Geçici olarak burayı null ile kapatıp arama motorlarına fırlatacağız
    mov cl, byte [edi]
    mov byte [edi], 0           ; Geçici sınır kapatma
    mov [ebp - 4], ecx          ; Orijinal karakteri yerel hücrede sakla

    ; 3. Adım: Kelime bir Direktif mi? (SECTION, GLOBAL vb.)
    push esi
    call nasm_directive_find    ; directiv.asm içindeki tablo arayıcı
    add esp, 4
    cmp eax, -1
    je .L_check_instruction     ; Direktif değilse opkod kontrolüne geç
    
    mov dword [ebx + 0], 2      ; node->type = T_DIRECTIVE (2)
    mov [ebx + 8], eax          ; node->value = direktif token kodu
    jmp .L_restore_char

.L_check_instruction:
    ; 4. Adım: Kelime bir İşlemci Komutu mu? (MOV, ADD, PUSH vb.)
    push esi
    ; extern nasm_insns_perfhash  ; insnsb/data katmanındaki mükemmel hash tablosu
    push nasm_insns_perfhash
    call perfhash_find          ; perfhash.asm içindeki çakışmasız hızlı arayıcı
    add esp, 8
    cmp eax, -1
    je .L_check_pure_label      ; Opkod da değilse düz bir etikettir (kolon içermeyen)

    mov dword [ebx + 0], 3      ; node->type = T_INSN (3)
    mov [ebx + 8], eax          ; node->value = insn_id
    jmp .L_restore_char

.L_check_pure_label:
    ; Eğer direktif veya komut değilse bu kolonsuz düz bir etikettir (T_LABEL = 1)
    mov dword [ebx + 0], 1      ; node->type = T_LABEL

.L_restore_char:
    ; Geçici olarak ezdiğimiz orijinal karakteri yerine geri mühürle (String bütünlüğü)
    mov ecx, [ebp - 4]
    mov byte [edi], cl

.L_parse_done:
    mov eax, ebx                ; Return EAX = struct insn_tok * pointer adresi
    jmp .L_parse_exit

.L_parse_null:
    xor eax, eax                ; Boş veya geçersiz satır: Return NULL (0)

.L_parse_exit:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
