; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY FLAT BINARY / PRG ÇIKTI MOTORU (outbin.asm)
; `nasm386.asm` include zincirinin nullout.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

; 02/09/2026 - Google AI

section .text
align 4

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_outbin_init
; İşlev: Çıktı tamponunu ve binary üretim konum sayaçlarını sıfırlar.
; -----------------------------------------------------------------------------
global nasm_outbin_init
nasm_outbin_init:
    push ebp
    mov ebp, esp
    
    mov dword [nasm_out_buf_ptr], nasm_output_buffer
    mov dword [nasm_out_total_bytes], 0
    
    mov esp, ebp
    pop ebp
    ret

align 4

; 03/09/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_outbin_emit_byte (putbyte mantığı)
; İşlev: Ham byte'ı 512 byte'lık yastığa yazar, dolunca otomatik diske boşaltır.
; Girdi (Stack): [EBP+8] = emit_char (Yazılacak 1 byte ham veri)
; -----------------------------------------------------------------------------
global nasm_outbin_emit_byte
nasm_outbin_emit_byte:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; AL = Yazılacak ham byte verisi
    mov ebx, [nasm_out_buf_ptr] ; EBX = Güncel mikro tampon yazma adresi
    
    mov [ebx], al               ; Byte'ı 512 baytlık yastığa fiziksel olarak işle
    inc ebx                     ; Yazma pointer'ını 1 byte ilerlet
    mov [nasm_out_buf_ptr], ebx

    ; Sayaçları güncelle
    inc dword [nasm_out_sector_bytes] ; Anlık sektör içi byte sayacı
    inc dword [nasm_out_total_bytes]  ; Dosya geneli birikimli toplam byte sayacı
    inc dword [nasm_program_counter]  ; Derleme Konum Sayacı (PC)

    ; --- 512 BYTE SEKTÖR DOLULUK KONTROLÜ (FULL BUFFER) ---
    cmp dword [nasm_out_sector_bytes], 512
    jb .L_emit_exit             ; 512 byte dolmadıysa sessizce çık

    ; Tampon tam 512 byte oldu! Sektörü donanım hızında diske boşaltıyoruz:
    ;mov ebx, [bin_file_handle] ; EBX = Dosya handle (FD)
    ;mov edx, 512               ; EDX = Tam 512 byte (Sektör boyutu)
    ;mov ecx, nasm_output_buffer ; ECX = Tamponun başlangıç adresi
    ;mov eax, 4                 ; EAX = 4 (sys_write)
    ;int 0x40                   ; TRDOS Ring 0 Bağımsız Tamponuna Akıt!

    ; 03/09/2026
    push 512                    ; 32-bit Byte Count
    push nasm_output_buffer     ; Buffer Adresi
    push dword [bin_file_handle] ; LIBC FD (c_fd)
    call write

    ; Bir sonraki sektör akışı için yastık pointer'ını ve sayacını resetle
    mov dword [nasm_out_buf_ptr], nasm_output_buffer
    mov dword [nasm_out_sector_bytes], 0

.L_emit_exit:
    pop ebx
    mov esp, ebp
    pop ebp
    ret

; 03/09/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: bin_init
; İşlev: Çıktı dosyasını fopen(filename, "w") nizamı ile ilklendirir.
; -----------------------------------------------------------------------------
global bin_init
bin_init:
    push ebp
    mov ebp, esp

    ; 1. Tampon yastık pointer'ını ve sayaçları sıfırla
    mov dword [nasm_out_buf_ptr], nasm_output_buffer
    mov dword [nasm_out_sector_bytes], 0
    mov dword [nasm_out_total_bytes], 0

    ; 2. Çıktı dosya adını hazırla
    mov edx, [out_filename]     ; argv'den süzülen çıktı dosya adı
    test edx, edx
    jnz .L_call_fopen
    mov edx, default_out_name   ; Yoksa varsayılan ad: "nasm.out"
    ; 03/09/2026
    mov [out_filename], edx 

.L_call_fopen:
    ; === ANSI C STANDARDINDA FOPEN("w") ÇAĞRISI ===
    push mode_str_w             ; Parametre 2: "w" dize adresi (Write/Create modu)
    push edx                    ; Parametre 1: Dosya adı string adresi
    call fopen                  ; libnasm.asm fopen fonksiyonunu çağır!
    add esp, 8                  ; Yığın temizle

    cmp eax, -1                 ; LIBC FD hatası var mı?
    je .L_init_file_error
    mov [bin_file_handle], eax  ; Dönen LIBC FD numarasını BSS'e kilitle
    jmp .L_init_exit

.L_init_file_error:
    push bin_init_err_msg       ;
    call printf                 ;
    ;add esp, 4                 ;
    ; 03/09/2026
    mov eax, -1	

.L_init_exit:
    mov esp, ebp
    pop ebp
    ret

align 4

; -----------------------------------------------------------------------------
; Fonksiyon: bin_output (EOF - Derleme Sonu Kalıntı Mühürleme Rutini)
; İşlev: Sektörden arta kalan son geçerli byte sayısı kadar 'write' çağırır ve kapatır.
; -----------------------------------------------------------------------------
global bin_output
bin_output:
    push ebp
    mov ebp, esp
    ;push ebx
    ;push ecx
    ;push edx

    ; Sektör içinde birikmiş arta kalan kalıntı byte sayısını kontrol et
    mov ecx, [nasm_out_sector_bytes]
    test ecx, ecx
    jz .L_close_file            ; Kalıntı byte yoksa direkt kapatmaya git

    ; --- EOF KALINTI EMİT MÜHRÜ (VALID BYTE COUNT) ---
    ; Tamponda biriken o son geçerli byte sayısı kadar (ecx) kütüphane write çağırıyoruz!
    push ecx                    ; Parametre 3: count (Kalan gerçek kalıntı byte sayısı)
    push nasm_output_buffer     ; Parametre 2: buf
    push dword [bin_file_handle] ; Parametre 1: fd
    call write                  ; system.asm write api
    add esp, 12                 ; Stack temizle

    ; 03/09/2026
    test eax, eax
    jns	.L_close_file    

    ; print (file write) error message to stdout (screen)
    push dword [out_filename] 
    push nasm_write_error
    call printf
    add esp, 8
    ; 03/09/2026
    mov eax, -1	

.L_close_file:
    ; Dosyayı system.asm apisi ile emniyetle kapat
    mov eax, [bin_file_handle]
    call close

.L_output_done:
    ;pop edx
    ;pop ecx
    ;pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; void bin_cleanup(void)
; Çıktı dosyasını güvenle kapatır ve handle'ı sıfırlar.
bin_cleanup:
    push ebp
    mov ebp, esp

    mov eax, [bin_file_handle]
    test eax, eax
    jz .L_bin_clean_done

    push eax
    call close
    add esp, 4
    mov dword [bin_file_handle], 0 ; Kullanım sonrası sıfırla

.L_bin_clean_done:
    pop ebp
    ret

; 03/09/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_emit_instruction
; İşlev: parser.asm'den gelen 32-bit opkod paketini byte seviyesinde tampona işler.
; Girdi (Stack): [EBP+8] = ins_packet (32-bit Opcode / Flags dword verisi)
; -----------------------------------------------------------------------------
global nasm_emit_instruction
nasm_emit_instruction:
    push ebp
    mov ebp, esp
    push ebx
    ;push esi
    ;push edi

    mov ecx, [ebp + 8]          ; ECX = 32-bitlik ham komut paket verisi

    ; 1. ADIM: Talimatın Kaç Byte Yer Kapladığını Çöz (Bits 24-31)
    mov edx, ecx
    shr edx, 24                 ; DL = Talimat Uzunluğu (1, 2 veya 3 byte)
    and edx, 0xFF               ; EDX = Saf uzunluk sayacı

    ; 2. ADIM: Ana Opcode Byte'ını Ayıkla (Bits 0-15)
    mov eax, ecx
    and eax, 0xFFFF             ; EAX = Saf x86 Opcode verisi (Ör: 0xFA, 0xE9 vb.)

    ; --- UZUNLUK TABANLI BYTE DÖKÜM MOTORU (EMIT STREAM) ---
    cmp edx, 1
    je .L_emit_1_byte           ; 1 byte'lık komutlar (cli, sti, ret vb.)
    cmp edx, 2
    je .L_emit_2_byte           ; 2 byte'lık komutlar (int 0x40, short jmp vb.)
    cmp edx, 3
    je .L_emit_3_byte
    jmp .L_emit_5_byte          ; Geniş 32-bit adres barındıran komutlar (mov, jmp near)

.L_emit_1_byte:
    ; Tekil opkodu (AL) doğrudan çıktı yastığına fırlat!
    push eax
    call nasm_outbin_emit_byte  ;
    add esp, 4                  ;
    jmp .L_emit_done

.L_emit_2_byte:
    ; Örnek: 'int 0x40' -> İlk byte 0xCD (int opkodu), ikinci byte 0x40 (vektör)
    ; Veya 'mov' / 'jmp' short modları için ön opkodu basıyoruz:
    push eax                    ; Ana opkodu bas (Ör: 0xCD)
    call nasm_outbin_emit_byte  ;
    pop	eax

    ; Satırın devamındaki operand değerini (Ör: 0x40 veya ofset farkını) tokenizer ile çek:
    ; (Şimdilik test adına paket içindeki ikincil ModRM/Prefix verisini simüle ediyoruz)
    shr eax, 8
    ;and eax, 0xFF              ; AL = İkinci byte verisi (Operand / Vector)

    push eax
    call nasm_outbin_emit_byte  ;
    add esp, 4                  ;
    jmp .L_emit_done

.L_emit_3_byte:
    ; 3 byte'lık yakın atlama (`jmp near`) veya geniş dword yüklemeleri için akış:
    push eax                    ; 1. Byte (Opcode)
    call nasm_outbin_emit_byte  ;
    pop eax                     ;

    shr eax, 8
    push eax
    call nasm_outbin_emit_byte  ;
    add esp, 4                  ;

    ; Satırın devamındaki 3. byte verisini basıyoruz
    push 0x00                   ; Geçici operand tampon dolgusu
    call nasm_outbin_emit_byte  ;
    add esp, 4                  ;
    jmp .L_emit_done

    ; DİNAMİK ETİKET ADRESİ ÇÖZÜMLEYEN 5-BYTE EMIT MOTORU (mov, jmp near)
.L_emit_5_byte:
    ; Örnek: 'jmp L_INIT_RUNTIME' -> 1 byte 0xE9 + 4 byte Relative Distance
    push eax                    ; İlk byte'ı bas (Ör: 0xE9 veya mov opkodu)
    call nasm_outbin_emit_byte  ;
    add esp, 4                  ;

    ; --- DINAMIK ETİKET OFSET HESAPLAMA MOTORU ---
    ; Satırın devamındaki kelimeyi (Etiket adını) tokenizer ile çekiyoruz
    push parser_peek_buf
    call nasm_stdscan_next      ; Satır sonundaki hedef etiketi oku (Ör: "L_INIT_RUNTIME")
    add esp, 4
    test eax, eax
    jz .L_emit_null_dword       ; Etiket yoksa default 00000000 bas

    ; Sembol ağacımızdan etiket adresini sorguluyoruz (Geleceğe tam yatırım!)
    push target_label_addr_tmp  ; Bulunan 32-bit ofsetin yazılacağı geçici bellek hücresi
    push parser_peek_buf        ; Aranan etiket adı string pointer'ı
    call nasm_lookup_label      ; labels.asm içindeki meşru arama motoru
    add esp, 8

    test eax, eax               ; Etiket ağaçta bulundu mu?
    jz .L_emit_null_dword       ; Pass 1 aşamasında henüz tanımlanmadıysa 0 bas (Pass 2'de dolacak)

    ; --- OFSET ARİTMETİĞİ SARMALI ---
    mov eax, [target_label_addr_tmp] ; EAX = Hedef etiketin gerçek adresi

    ; Eğer komut bir JMP/CALL ise, adresi göreli (Relative) yapmak için 
    ; anlık nasm_program_counter değerini ve komutun kalan boyunu (4) çıkartıyoruz!
    sub eax, [nasm_program_counter]
    sub eax, 4                  ; EAX = x86 standardına uygun tam relative mesafe!

    ;jmp .L_write_dword_stream

.L_emit_null_dword:
    ;xor eax, eax               ; Adres çözülemediyse şimdilik saf 0 dök

.L_write_dword_stream:
    ; 32-bitlik adresi/mesafeyi küçük-sonlu (Little-Endian) nizamda ardışık 4 byte olarak döküyoruz:
    mov ebx, eax                ; EBX içinde 32-bitlik adres taptaze duruyor

    and eax, 0xFF 
    push eax
    call nasm_outbin_emit_byte
    add esp, 4
    ;mov eax, ebx \ shr eax, 8  \ and eax, 0xFF \ push eax \ call nasm_outbin_emit_byte \ add esp, 4
    shr ebx, 8
    mov eax, ebx
    and eax, 0xFF
    push eax
    call nasm_outbin_emit_byte
    add esp, 4
    ;mov eax, ebx \ shr eax, 16 \ and eax, 0xFF \ push eax \ call nasm_outbin_emit_byte \ add esp, 4
    shr ebx, 8
    mov eax, ebx
    and eax, 0xFF
    push eax
    call nasm_outbin_emit_byte
    add esp, 4
    ;mov eax, ebx \ shr eax, 24 \ and eax, 0xFF \ push eax \ call nasm_outbin_emit_byte \ add esp, 4
    shr ebx, 8
    mov eax, ebx
    push eax
    call nasm_outbin_emit_byte
    add esp, 4

.L_emit_done:
    ;pop edi
    ;pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
