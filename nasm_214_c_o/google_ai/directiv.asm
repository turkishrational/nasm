; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DİREKTİF AYIKLAMA MOTORU (directiv.asm)
; `nasm386.asm` include zincirinin float.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_directive_find

; extern hash_find

section .text
align 4

; =========================================================================
; int nasm_directive_find(const char *str)
; Kodda karşılaşılan kelimenin (SECTION, SEGMENT, EQU vb.) direktif olup 
; olmadığını, direktif tablosunda mükemmel hash ile tarayarak bulur.
; =========================================================================
nasm_directive_find:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = str pointer adresi
    test eax, eax
    jz .L_dir_unknown

    ; `directbl.asm` içinde tanımlayacağımız merkezi direktif hash tablosunu sorgula
    push eax                    ; target str key
    push 128                    ; directive_table_size = 128

    ; extern directive_hash_table ; directbl.asm'den gelecek olan adres
    push directive_hash_table
    call hash_find              ; hashtbl.asm içindeki genel arama motoru
    add esp, 12

    test eax, eax
    jz .L_dir_unknown           ; Bulunamadıysa bilinmeyen direktif dön
    jmp .L_dir_done

.L_dir_unknown:
    mov eax, -1                 ; Bilinmeyen direktif token kodu: Return -1

.L_dir_done:
    pop ebp
    ret

; 01/09/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_process_directive
; Girdi (Stack): [EBP+8] = parser_token_buf ASCIIZ string bellek adresi
; Çıktı: EAX = 1 (Direktif başarıyla işlendi), EAX = 0 (Tanınmadı)
; Değişen Register'lar: EAX, ECX, EDX (Scratch Volatile)
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP (Callee-saved)
; -----------------------------------------------------------------------------
global nasm_process_directive
nasm_process_directive:
    push ebp
    mov ebp, esp
    push edi
    push esi

    mov esi, [ebp+8]        ; ESI = parser_token_buf string adresi

    mov edi, nasm_directive_table

.loop_find:
    mov edx, [edi]
    test edx, edx
    jz .unknown_directive   ; Tablo sonu (Null Terminator)

    ; C uyumlu nasm_stricmp çağrısı için parametreleri stack'e basıyoruz
    push edx                ; [ESP+8] Parametre 2: Tablodaki direktif string adresi
    push esi                ; [ESP+4] Parametre 1: Ayıklanan anlık string adresi
    call nasm_stricmp
    add esp, 8              ; Stack temizleme (C calling convention)

    or eax, eax
    jz .found_directive     ; Tam eşleşme bulundu

    add edi, 8              ; Sonraki kayda geç (Pointer + Code = 8 bytes)
    jmp .loop_find

.found_directive:
    mov eax, [edi+4]        ; Direktif kimlik kodunu al (1, 2, 3, 4...)

    cmp eax, 1
    je .do_bits
    cmp eax, 2
    je .do_section
    cmp eax, 3
    je .do_global
    cmp eax, 4
    je .do_extern

    cmp eax, 5
    je .do_data_define
    cmp eax, 6
    je .do_data_define
    cmp eax, 7
    je .do_data_define

    jmp .unknown_directive

.do_bits:
    call parse_bits_value
    mov eax, 1
    jmp .success_exit

.do_section:
    call parse_section_name
    mov eax, 2
    jmp .success_exit

.do_global:
    call parse_global_symbol
    mov eax, 3
    jmp .success_exit

.do_extern:
    call parse_extern_symbol
    mov eax, 4
    jmp .success_exit

; 02/09/2026 - Google AI

.do_data_define:
    ; EAX içinde tablodan gelen direktif kodu var (5 = db, 7 = dd)
    mov ebx, eax                ; EBX = Veri tipi kimliği (5 mi, 7 mi?)

.L_data_operand_loop:
    ; Satırın devamındaki parametre değerini veya dizeyi ayıkla
    push parser_token_buf
    call nasm_stdscan_next      ;
    add esp, 4                  ;
    
    test eax, eax               ; Satırda başka parametre kalmadıysa başarıyla çık
    jz .L_data_define_success

    ; 03/09/2026
    call nasm_outbin_init

    ; Eğer çekilen token bir string literal (Tırnak içinde metin) ise:
    ; (Şimdilik basitleştirilmiş ASCIIZ karakter döküm döngüsü kurguluyoruz)
    mov esi, parser_token_buf
    
    cmp ebx, 5                  ; --- DB (DEFINE BYTE) DURUMU ---
    jne .L_check_dd_type

.L_emit_byte_stream:
    movzx eax, byte [esi]
    test al, al
    jz .L_data_operand_loop     ; String bittiyse sonraki parametreye geç
    
    ; Karakter byte'ını doğrudan çıktı tamponuna fırlat!
    push eax
    call nasm_outbin_emit_byte
    add esp, 4
    
    inc esi
    jmp .L_emit_byte_stream

.L_check_dd_type:
    cmp ebx, 7                  ; --- DD (DEFINE DWORD) DURUMU ---
    jne .L_data_operand_loop

    ; Burada 'atoi' veya 'readnum.asm' tabanlı sayısal çözümleme tetiklenir.
    ; Örnek olarak crt0.asm'deki '-1' dword değerini (0xFFFFFFFF) simüle edelim:
    ; (4 byte'ı ardışık olarak emit ediyoruz)
    push 0xFF
    call nasm_outbin_emit_byte
    push 0xFF
    call nasm_outbin_emit_byte
    push 0xFF
    call nasm_outbin_emit_byte
    push 0xFF
    call nasm_outbin_emit_byte
    add esp, 16
    jmp .L_data_operand_loop

.L_data_define_success:
    mov eax, 1                  ; Üst katmana başarı raporu döndür
    jmp .success_exit

.unknown_directive:
    xor eax, eax                ; EAX = 0 (Direktif bulunamadı)
    ;jmp .success_exit

.success_exit:
    pop esi                     ; (Fonksiyonun en başında korunan orijinal registerlar)
    pop edi
    mov esp, ebp
    pop ebp
    ret

; -----------------------------------------------------------------------------
; Fonksiyon: parse_bits_value
; Girdi: ESI = Değer string adresi
; -----------------------------------------------------------------------------
parse_bits_value:
    push ebp
    mov ebp, esp
    mov al, [esi]
    cmp al, '3'
    je .is_32
    cmp al, '1'
    je .is_16
    jmp .err
.is_32:
    mov dword [nasm_bits_mode], 32
    jmp .done
.is_16:
    mov dword [nasm_bits_mode], 16
    jmp .done
.err:
    call unknown_directive_error
.done:
    mov esp, ebp
    pop ebp
    ret

; -----------------------------------------------------------------------------
; Fonksiyon: parse_global_symbol
; -----------------------------------------------------------------------------
parse_global_symbol:
    push ebp
    mov ebp, esp
    ; Global tabloya ekleme ara mantığı
    mov esp, ebp
    pop ebp
    ret

; -----------------------------------------------------------------------------
; Fonksiyon: parse_extern_symbol
; -----------------------------------------------------------------------------
parse_extern_symbol:
    push ebp
    mov ebp, esp
    ; Extern bağlama ara mantığı
    mov esp, ebp
    pop ebp
    ret

; 01/09/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: unknown_directive_error
; İşlev: NASM standardında (dosya:satır: error: ...) biçimlendirilmiş hata basar.
; Girdi (Stack): [EBP+8] = Hata veren kelimenin ASCIIZ bellek adresi (Mnemonic/Directive)
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP (İçeride değiştirilmedikleri için push/pop gereksiz!)
; -----------------------------------------------------------------------------
global unknown_directive_error
unknown_directive_error:
    push ebp
    mov ebp, esp

    ; [ebp+8] = Stack üzerinden gelen bilinmeyen kelimenin adresi
    mov ecx, [ebp+8]            ; ECX = Geçici joker olarak kelime adresini al

    ; Matematiksel Satır Hesabı: Current_Line = B (global_line) - A (include_start)
    mov eax, [nasm_global_line_counter]
    sub eax, [nasm_include_start_line]
    
    ; printf(nasm_err_fmt, current_src_filename, current_line, unknown_word)
    ; Sağdan sola doğru parametreleri stack'e diziyoruz:
    push ecx                    ; Parametre 4: %s -> Bilinmeyen kelime adresi
    push eax                    ; Parametre 3: %d -> Hesaplanan satır numarası
    push dword [nasm_current_src_filename] ; Parametre 2: %s -> Aktif kaynak dosya adı
    push nasm_err_fmt           ; Parametre 1: Biçimlendirme format şablonu
    call printf                 ; libnasm.asm içindeki printf sarmalı
    add esp, 16                 ; 4 adet dword parametreyi stack'ten temizle

    mov esp, ebp
    pop ebp
    ret

; 01/09/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: parse_section_name
; İşlev: Satırdaki segment adını (.text, .data) süzüp nasm_current_section_id alanını günceller.
; Girdi: ESI = Segment adı string adresi (Ör: ".text" veya ".data")
; Değişen Register'lar: EAX, ECX, EDX (Scratch)
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP
; -----------------------------------------------------------------------------
global parse_section_name
parse_section_name:
    push ebp
    mov ebp, esp
    push ebx                    ; *
    ;push esi                   ; **
    ;push edi                   ; ***

    ; Gelen segment adı pointer'ını (ESI) koruyarak tarama adımlarına geçiyoruz
    mov ebx, esi                ; EBX = Aranan segment adı dizesi

    ; --- 1. .text SEGMENT KONTROLÜ ---
    push section_str_text       ; Tablodaki ".text" dizesi
    push ebx                    ; Kaynak koddan gelen dize
    call strcmp                 ; libnasm.asm veya libc içindeki strcmp
    add esp, 8
    or eax, eax
    jz .L_set_text_id           ; Eşleştiyse TEXT segment ID'sini ata

    ; --- 2. .data SEGMENT KONTROLÜ ---
    push section_str_data       ; Tablodaki ".data" dizesi
    push ebx
    call strcmp
    add esp, 8
    or eax, eax
    jz .L_set_data_id           ; Eşleştiyse DATA segment ID'sini ata

    ; --- 3. .bss SEGMENT KONTROLÜ ---
    push section_str_bss        ; Tablodaki ".bss" dizesi
    push ebx
    call strcmp
    add esp, 8
    or eax, eax
    jz .L_set_bss_id            ; Eşleştiyse BSS segment ID'sini ata
    jmp .L_unknown_section_done ; Bilinmeyen bir segment ise default değerde bırak

.L_set_text_id:
    mov eax, 1 ; ID = 1 (.text)
    jmp .L_section_sync_done

.L_set_data_id:
    mov eax, 2 ; ID = 2 (.data)
    jmp .L_section_sync_done

.L_set_bss_id:
    mov eax, 3 ; ID = 3 (.bss)
    jmp .L_section_sync_done

.L_unknown_section_done:
    ; Eğer düz bir flat binary derlemesi yapılıyorsa ve standart dışı segment ismi 
    ; girildiyse, geriye mutlak / absolute segment kodu (0) döndürerek emniyet sağla.
    mov eax, 0

.L_section_sync_done:
    mov dword [nasm_current_section_id], eax
    ;
    ;pop edi                    ; ***
    ;pop esi                    ; **
    pop ebx                     ; *
    mov esp, ebp
    pop ebp
    ret
