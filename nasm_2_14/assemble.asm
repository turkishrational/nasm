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
; İşlev: Ön işlemciden satırları çeker ve parser (sözdizimi) katmanına bağlar.
; Girdi: [EBP+8] = fname, [EBP+12] = ofmt
; Çıktı: EAX = 0 (Başarı), EAX = -1 (Hata)
; Değişen Register'lar: EAX, ECX, EDX (Serbest Scratch)
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP
; -----------------------------------------------------------------------------
global assemble_file
assemble_file:
    push ebp
    mov ebp, esp
    push ebx                    ; * (EBX Koruma Altında)
    push esi                    ; ** (ESI Koruma Altında)
    push edi                    ; *** (EDI Koruma Altında)

    ; fopen(fname, "r") çağrısı - Sağdan sola parametre itimi
    push nasm_mode_read         ; Parametre 2: data.asm içindeki "r" string adresi
    push dword [ebp+8]          ; Parametre 1: Dosya adı string adresi
    call fopen
    add esp, 8                  ; Stack temizle

    test eax, eax               ; Dosya başarıyla açılabildi mi?
    jz .L_assemble_fail
    
    mov [nasm_input_file_handle], eax ; LIBC Handle değerini BSS'e kaydet

    ; Derleme başlangıcında Program Counter (PC) ve Pass durumlarını sıfırla
    mov dword [nasm_program_counter], 0

    mov eax, [ebp + 8]          ; EAX = fname string adresi ("crt0.asm")
    mov [nasm_current_src_filename], eax ; Küresel dosya adı pointer'ını güncelle!
    mov dword [nasm_global_line_counter], 0 ; Sayaç ilk satır öncesi sıfırlanır

.L_line_read_loop:
    ; preproc.asm katmanından bir satır oku
    call preproc_getline
    test eax, eax               ; EAX == NULL (EOF) oldu mu?
    jz .L_assemble_success      ; Dosya bittiyse başarıyla çıkışa git
    
    mov esi, eax                ; ESI = Okunan satırın bellek adresi

    ; --- GERÇEK ÇÖZÜMLEME KATMANI (PARSER) ENTEGRASYONU ---
    ; Okunan ham satır adresini doğrudan parser.asm motoruna gönderiyoruz
    push esi
    call nasm_parse_line        
    add esp, 4                  ; Stack temizleme

    ; Eğer parser sözdizimi hatası döndürdüyse derlemeyi durdurabiliriz
    ; cmp eax, -1
    ; je .L_assemble_fail

    jmp .L_line_read_loop

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

