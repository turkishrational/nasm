; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY STANDART KELİME TARAYICI (stdscan.asm)
; `nasm386.asm` include zincirinin exprdump.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

; 01/09/2026 - Google AI

section .text
align 4

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_stdscan_init
; C Deklarasyonu: void nasm_stdscan_init(const char *line)
; İşlev: Kelime tarayıcının anlık işleyeceği satır işaretçisini ayarlar.
; Girdi: [ESP+4] = line (İşlenecek ASCIIZ satır adresi)
; -----------------------------------------------------------------------------
global nasm_stdscan_init
nasm_stdscan_init:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp+8]            ; Satır pointer adresini al
    mov [nasm_scan_line_ptr], eax ; BSS alanına kaydet
    
    mov esp, ebp
    pop ebp
    ret

align 4

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_stdscan_next
; C Deklarasyonu: int nasm_stdscan_next(char *token_buf)
; İşlev: Satırdaki bir sonraki kelimeyi/token'ı ayıklar ve tipini döndürür.
; Girdi: [ESP+4] = token_buf (Ayıklanan kelimenin yazılacağı geçici tampon)
; Çıktı: EAX = Token Tipi (1=Kelime/Mnemonic, 2=Sayı, 3=Özel Karakter, 0=Satır Sonu)
; Değişen Register'lar: EAX, ECX, EDX
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP
; -----------------------------------------------------------------------------
global nasm_stdscan_next
nasm_stdscan_next:
    push ebp
    mov ebp, esp
    push ebx                    ; * (EBX Koruma Altında)
    push esi                    ; ** (ESI Koruma Altında)
    push edi                    ; *** (EDI Koruma Altında)

    mov esi, [nasm_scan_line_ptr] ; ESI = Güncel satır okuma konumu
    mov edi, [ebp+8]            ; EDI = Kelimenin kopyalanacağı hedef tampon

.L_skip_whitespace:
    mov al, [esi]
    test al, al
    jz .L_scan_eof              ; Null karakter, satır bitti
    
    ; Boşluk (Space = 32) veya Tab (9) ayıklama
    cmp al, 32
    je .L_next_char_ws
    cmp al, 9
    je .L_next_char_ws
    
    ; Yorum satırı (';') kontrolü. Satırın kalanını ıskarta et.
    cmp al, ';'
    je .L_scan_eof
    jmp .L_determine_type

.L_next_char_ws:
    inc esi
    jmp .L_skip_whitespace

.L_determine_type:
    ; Özel ayırıcı karakter kontrolleri (',', ':', '[', ']')
    cmp al, ','
    je .L_special_char
    cmp al, ':'
    je .L_special_char
    cmp al, '['
    je .L_special_char
    cmp al, ']'
    je .L_special_char

    ; Rakam kontrolü (0-9) -> Sayısal token işleme
    cmp al, '0'
    jl .L_alpha_token
    cmp al, '9'
    jle .L_numeric_token

.L_alpha_token:
    ; Alfanumerik kelime / etiket ayıklama döngüsü
    mov [edi], al
    inc edi
    inc esi
    
    mov al, [esi]
    test al, al
    jz .L_alpha_done
    
    ; Boşluk veya özel karakter görene kadar kelimeyi kopyalamaya devam et
    cmp al, 32
    je .L_alpha_done
    cmp al, 9
    je .L_alpha_done
    cmp al, ','
    je .L_alpha_done
    cmp al, ':'
    je .L_alpha_done
    jmp .L_alpha_token

.L_alpha_done:
    mov byte [edi], 0           ; Token stringini ASCIIZ yap
    mov dword [nasm_scan_line_ptr], esi ; Güncel konumu güncelle
    mov eax, 1                  ; TİP 1: Word / Identifier / Mnemonic
    jmp .L_scan_exit

.L_numeric_token:
    ; Basit sayısal değer yakalama döngüsü
    mov [edi], al
    inc edi
    inc esi
    mov al, [esi]
    cmp al, '0'
    jl .L_numeric_done
    cmp al, '9'
    jle .L_numeric_token

.L_numeric_done:
    mov byte [edi], 0
    mov dword [nasm_scan_line_ptr], esi
    mov eax, 2                  ; TİP 2: Number / Numeric Constant
    jmp .L_scan_exit

.L_special_char:
    mov [edi], al
    mov byte [edi+1], 0         ; Tekil karakter ASCIIZ yap
    inc esi
    mov dword [nasm_scan_line_ptr], esi
    mov eax, 3                  ; TİP 3: Special Character (Separator)
    jmp .L_scan_exit

.L_scan_eof:
    mov dword [nasm_scan_line_ptr], esi
    xor eax, eax                ; TİP 0: End of Line / EOF

.L_scan_exit:
    pop edi                     ; *** (EDI Kurtarıldı)
    pop esi                     ; ** (ESI Kurtarıldı)
    pop ebx                     ; * (EBX Kurtarıldı)
    mov esp, ebp
    pop ebp
    ret
