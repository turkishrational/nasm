; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DERLEME MOTORU (assemble.asm)
; `nasm386.asm` include zincirinin pragma.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

; 03/09/2026 - Google AI

section .text
align 4

; -----------------------------------------------------------------------------
; Fonksiyon: assemble_file
; İşlev: Kaynak dosyayı satır satır işler, giriş ve çıkışta outbin zırhını tetikler.
; Girdi: ESI = Giriş kaynak dosyası adı string adresi (Ör: "crt0.asm")
; -----------------------------------------------------------------------------
global assemble_file
assemble_file:
    push ebp
    mov ebp, esp
    push ebx                    ; *
    push esi                    ; **
    push edi                    ; ***

    mov esi, [ebp + 8]          ; ESI = Giriş dosya adı dize adresi

    ; =============================================================================
    ; 1. ADIM: KAYNAK DOSYASININ AÇILMASI
    ; =============================================================================

    ; fopen(fname, "r") çağrısı - Sağdan sola parametre itimi
    push nasm_mode_read         ; Parametre 2: data.asm içindeki "r" string adresi
    push esi	                ; Parametre 1: Dosya adı string adresi
    call fopen
    add esp, 8                  ; Stack temizle

    test eax, eax               ; Dosya başarıyla açılabildi mi?
    jz .L_assemble_failed
    
    mov [nasm_input_file_handle], eax ; LIBC Handle değerini BSS'e kaydet

    ; =============================================================================
    ; 2. ADIM: ÇIKTI DOSYASININ OLUŞTURULMASI 
    ; =============================================================================

    ; Çıktı dosyasını fopen("w") ile sıfırdan yaratıyoruz!
    call bin_init               ; outbin.asm içeriği tetiklenir
    ; 03/09/2026
    cmp eax, -1
    je .L_assemble_out_fail	; Error opening output binary file

    ; =============================================================================
    ; 3. ADIM: DERLEME BAŞLANGIÇ ZIRHI (KÜRESEL SAYAÇLAR VE ÇIKTI DOSYASI İLKLEME)
    ; =============================================================================

    mov dword [nasm_global_line_counter], 0 ; Satır sayacını sıfırla
    mov dword [nasm_program_counter], 0     ; Konum Sayacını (PC) sıfırla
    mov dword [nasm_current_section_id], 1  ; Varsayılan olarak .text (Kod) segmentiyle başla

    ; =============================================================================
    ; 4. ADIM: SATIR OKUMA VE PARSER DÖNGÜSÜ (MAIN ASSEMBLY LOOP)
    ; =============================================================================
.L_main_assembly_loop:
    ; Kaynak dosyadan bir satır oku
    ; Her başarılı satır okunduğunda nasm_global_line_counter otomatik artar.
    call preproc_getline
    test eax, eax               ; EAX == NULL (EOF) oldu mu?
    jz .L_assemble_success      ; Dosya bittiyse başarıyla çıkışa git
    ; 03/09/2026
    js .L_assemble_out_fail 
    
    ; Satırı parser.asm süzgecine gönderiyoruz
    push eax                    ; Okunan satırın bellek adresi
    call nasm_parse_line        ; parser.asm ana sıralı hiyerarşi motoru
    test eax, eax               ; EAX == -1 ise ölümcül bir hata veya taşma olmuştur!
    ;js .L_loop_eof_break       ; Hata durumunda döngüyü güvenle kır
    ;jmp .L_main_assembly_loop
    jns .L_main_assembly_loop

.L_assemble_success:
    ; =============================================================================
    ; 5. ADIM: KAYNAK DOSYASININ KAPATILMASI
    ; =============================================================================

    push dword [nasm_input_file_handle]
    call close
    add esp, 4

    ; =============================================================================
    ; 6. ADIM: DERLEME BİTİŞ MÜHRÜ (EOF KALINTI DÖKÜMÜ VE ARŞİVLEME)
    ; =============================================================================
    ; Tüm satırlar başarıyla tarandı ve bitti! Şimdi tamponda biriken 
    ; o son kalıntı byte'ları diske mühürlemesi için bitiş motorunu çağırıyoruz:
    call bin_output             ; outbin.asm son kalıntıları basar ve dosyayı kapatır!

    mov eax, 1                  ; Derleme başarı kodu (1)
    jmp .L_assemble_exit

.L_assemble_failed:
    call bin_cleanup            ; Hata durumunda çıktı tampon sayaçlarını temizle

.L_assemble_out_fail:
    xor eax, eax                ; Başarısızlık kodu (0)

.L_assemble_exit:
    pop edi                     ; ***
    pop esi                     ; **
    pop ebx                     ; *
    mov esp, ebp
    pop ebp
    ret

