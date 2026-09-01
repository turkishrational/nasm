; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DERLEME MOTORU (assemble.asm)
; `nasm386.asm` include zincirinin pragma.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

; 01/09/2026 - Google AI

section .text
align 4

; -----------------------------------------------------------------------------
; Fonksiyon: assemble_file
; C Deklarasyonu: int assemble_file(const char *fname, void *ofmt)
; İşlev: Ön işlemciden satırları çeker ve parser/output katmanlarına dağıtır.
; Girdi: [EBP+8] = fname, [EBP+12] = ofmt
; Çıktı: EAX = 0 (Başarı), EAX = -1 (Hata)
; -----------------------------------------------------------------------------
global assemble_file
assemble_file:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    ; Kaynak dosyayı preprocessor katmanında işlemek üzere okuma modunda açıyoruz
    ; fopen(fname, "r") -> Sağdan sola doğru stack'e itilir.
    push nasm_mode_read         ; Parametre 2: mode string pointer ("r")
    push dword [ebp+8]          ; fname string adresi
    call fopen                  ; libnasm.asm fopen köprüsü
    add esp, 8
    
    test eax, eax               ; Dosya handle pointer'ı geçerli mi?
    jz .L_assemble_fail
    
    ; Dönen handle değerini BSS üzerindeki genel izleme alanına kaydet
    mov [nasm_input_file_handle], eax ; Geçerli LIBC FD (3-12) BSS alanına yazılıyor

.L_pass_loop:
    ; --- Birinci ve İkinci Pass Adımları Döngüsü ---

.L_line_read_loop:
    call preproc_getline        ; preproc.asm üzerinden bir satır oku
    test eax, eax               ; EAX == NULL (EOF) oldu mu?
    jz .L_assemble_success      ; Dosya bittiyse pass kontrolüne git
    
    mov esi, eax                ; ESI = Okunan satırın bellek adresi

    ; Kelime tarayıcıyı (Tokenizer) bu satır adresiyle ilklendir
    push esi
    call nasm_stdscan_init
    add esp, 4

.L_token_parse_loop:
    ; Her kelimeyi geçici olarak 'token_temp_buffer' içine ayıkla
    push token_temp_buffer
    call nasm_stdscan_next
    add esp, 4

    test eax, eax               ; EAX == 0 (Satır bitti mi?)
    jz .L_line_read_loop        ; Bittiyse bir sonraki satıra geç

    ; --- Canlı Görsel Test Baskısı ---
    ; Ayıklanan her kelimeyi/token'ı tip koduyla birlikte ekrana alt alta bas
    push token_temp_buffer      ; %s için kelime adresi
    push eax                    ; %d için token tip kodu (1, 2 veya 3)
    push token_print_fmt        ; Format string adresi
    call printf
    add esp, 12                 ; Stack temizle

    jmp .L_token_parse_loop

.L_assemble_success:
    ; Açık olan kaynak dosyayı kapat
    push dword [nasm_input_file_handle]
    call fclose
    add esp, 4
    xor eax, eax                ; Return 0 (Success)
    jmp .L_assemble_done

.L_assemble_fail:
    mov eax, -1                 ; Return -1 (Fail)

.L_assemble_done:
    pop edi                     ; *** (EDI Kurtarıldı)
    pop esi                     ; ** (ESI Kurtarıldı)
    pop ebx                     ; * (EBX Kurtarıldı)
    mov esp, ebp
    pop ebp
    ret

