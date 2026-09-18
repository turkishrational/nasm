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
    push ebx
    push esi
    push edi

    mov esi, [nasm_scan_line_ptr] ; ESI = Satır okuma pointer konumu
    mov edi, [ebp+8]            ; EDI = parser_token_buf adresi
    xor ecx, ecx                ; ECX = Taşma sayacı

.L_skip_ws:
    mov al, [esi]
    test al, al
    jz .L_scan_eof              ; Satır bitti

    cmp al, ' '                 ; Boşluk mu?
    je .L_advance_ws
    cmp al, 9                   ; Tab mı?
    je .L_advance_ws
    cmp al, ';'                 ; Yorum mu?
    je .L_scan_eof
    jmp .L_start_copy           ; Kelime başladı!

.L_advance_ws:
    inc esi
    jmp .L_skip_ws

.L_start_copy:
    ; --- MİKRO BÖLÜCÜLER (ÖZEL KARAKTERLER) ---
    ; Bu karakterler görüldüğü an kelime araması durur ve tekil basılırlar
    cmp al, ','
    je .L_special
    cmp al, ':'
    je .L_special
    cmp al, '['                 ; Köşeli parantez açılışı kelimeyi böler!
    je .L_special
    cmp al, ']'                 ; Köşeli parantez kapanışı kelimeyi böler!
    je .L_special

.L_copy_loop:
    cmp ecx, 254                ; BSS Taşma Kalkanı
    jae .L_copy_done

    mov [edi], al               ; Karakteri kopyala
    inc edi
    inc esi
    inc ecx
    
    mov al, [esi]
    test al, al
    jz .L_copy_done

    ; Sınır İşaretleri: Yeni karakter bir boşluk veya bölücü ise anlık kelime biter
    cmp al, ' '
    je .L_copy_done
    cmp al, 9
    je .L_copy_done
    cmp al, ','
    je .L_copy_done
    cmp al, ':'
    je .L_copy_done
    cmp al, '['                 ; Sonraki karakter parantez ise kelimeyi kes!
    je .L_copy_done
    cmp al, ']'                 ; Sonraki karakter parantez ise kelimeyi kes!
    je .L_copy_done
    cmp al, ';'                 ; Sonraki karakter yorum ise kes!
    jne .L_copy_loop

.L_copy_done:
    mov byte [edi], 0           ; Kesin Null Sonlandırma
    mov [nasm_scan_line_ptr], esi
    mov eax, 1                  ; Tip 1: Kelime / Mnemonic / Register
    jmp .L_exit

.L_special:
    mov [edi], al               ; Karakterin kendisini kopyala ([, ], , vs.)
    mov byte [edi+1], 0         ; ASCIIZ yap
    inc esi
    mov [nasm_scan_line_ptr], esi
    mov eax, 3                  ; Tip 3: Özel Ayırıcı / Separatör
    jmp .L_exit

.L_scan_eof:
    mov [nasm_scan_line_ptr], esi
    xor eax, eax                ; Tip 0: Satır Sonu

.L_exit:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

