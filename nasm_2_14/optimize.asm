 ; =============================================================================
; OPTİMİZASYON AŞAMASI: Ring 3 Tamponlu Okuma Motoru (İleride preproc.asm'e eklenecek)
; =============================================================================
; Geliştirici: Erdoğan Tan & Google AI - 01/09/2026

section .text
align 4

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_buffered_getbyte
; İşlev: Kernel'ı yormadan Ring 3 buffer'ından 1 byte okur. Buffer bitince tazeler.
; Çıktı: AL = Okunan ASCII karakter, CF = 0 (Başarı), CF = 1 (EOF / Dosya Sonu)
; -----------------------------------------------------------------------------
nasm_buffered_getbyte:
    push ebx
    push ecx
    push edx

    mov ecx, [nasm_r3_buf_available] ; ECX = Buffer'da kalan hazır/okunabilir byte sayısı
    test ecx, ecx
    jnz .L_read_from_cache          ; Eğer tamponda veri varsa direkt bellekten oku

    ; --- TAMPON BOŞALDI: KERNEL'DAN YENİ BLOK ÇEK (Tek bir Interrupt!) ---
    push 4096                       ; Parametre 3: Count = 4 KB (Büyük blok okuma)
    push nasm_r3_io_buffer          ; Parametre 2: Ring 3 Buffer adresi
    push dword [nasm_input_file_handle] ; Parametre 1: Dosya handle'ı
    call read                       ; system.asm içindeki zırhlı read
    add esp, 12                     ; Stack temizle

    test eax, eax
    jle .L_getbyte_eof              ; EAX <= 0 ise dosya gerçekten bitmiştir, EOF'a git

    mov [nasm_r3_buf_available], eax ; Kernel'ın getirdiği gerçek byte sayısını sayaca yaz
    mov dword [nasm_r3_buf_ptr], nasm_r3_io_buffer ; Pointer'ı tampon başına restore et
    mov ecx, eax                    ; Döngü için ECX'i güncelle

.L_read_from_cache:
    mov edx, [nasm_r3_buf_ptr]      ; EDX = Anlık buffer okuma adresi
    mov al, [edx]                   ; AL = Karakteri bellekten ışık hızında çek!
    
    inc edx                         ; Pointer'ı 1 byte ilerlet
    mov [nasm_r3_buf_ptr], edx      ; Yeni adresi kaydet
    
    dec ecx                         ; Hazır byte sayısını 1 eksilt
    mov [nasm_r3_buf_available], ecx ; Sayacı güncelle

    clc                             ; CF = 0 (Başarı)
    jmp .L_getbyte_done

.L_getbyte_eof:
    mov dword [nasm_r3_buf_available], 0
    stc                             ; CF = 1 (Zekice EOF işareti!)

.L_getbyte_done:
    pop edx
    pop ecx
    pop ebx
    ret

; =============================================================================
; İLERİDE BSS.ASM İÇİNE EKLENECEK ALANLAR
; =============================================================================
section .bss
align 4
nasm_r3_buf_ptr:       resd 1       ; Tampon içi anlık okuma işaretçisi
nasm_r3_buf_available: resd 1       ; Tamponda kalan hazır byte sayısı
nasm_r3_io_buffer:     resb 4096    ; 4 KB'lık devasa Ring 3 I/O yastığı

