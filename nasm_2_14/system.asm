; =======================================================================
; NASM v2.14.02 - TRDOS 386 v2.0 SİSTEM BAĞIMLI ÇAĞRILAR (system.asm)
; Tamamen bağımsız en alt katman çekirdek kesme köprüsüdür.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global time
global abort
global getenv

; 30/08/2026
global exit
global open
global close
global read
global write
global lseek
global tell
global malloc

section .text
align 4

; time_t time(time_t *tloc)
time:
    push ebp
    mov ebp, esp
    push ebx

    ; Erdoğan Bey'in v2.0 dökümü uyarınca:
    ; EAX = 13 (_systime), BL = 0 girildiğinde EAX = Unix Epoch Seconds döner.
    mov eax, 13
    mov ebx, 0
    int 0x40                    ; TRDOS Kernel Kesmesi, EAX = saniyeler

    mov ecx, [ebp + 8]          ; ecx = tloc pointer adresi
    test ecx, ecx
    jz .L_time_done
    mov [ecx], eax              ; Eğer tloc NULL değilse değeri adrese yaz

.L_time_done:
    pop ebx
    pop ebp
    ret

align 4

; void abort(void)
abort:
    mov ebx, 1                  ; Exit code = 1
    mov eax, 1                  ; _exit sistem çağrısı
    int 0x40
.L_halt_loop:
    ; 30/08/2026  
    ; hlt                       ; İşlemciyi durdur (Emniyet kilidi)
    nop
    jmp .L_halt_loop

align 4

; char *getenv(const char *name)
getenv:
    xor eax, eax                ; TRDOS 386 flat binary ortamında çevresel değişkenler NULL (0)
    ret

; 30/08/2026 - Google AI

align 4

; =============================================================================
; C Fonksiyonu: void exit(int status)
; Açıklama:     Çalışan NASM programını sonlandırır ve kontrolü TRDOS 386 
;               işletim sistemi kabuğuna (shell) geri devreder.
; Giriş (Stack):[ESP + 4] = Çıkış kodu (status)
; Çıkış:        Sisteme geri dönüldüğü için fonksiyon geri dönmez.
; Mimarisi:     TRDOS 386 Kesme Servisi (Int 40h - Fonksiyon 1: Terminate)
; =============================================================================
exit:
    mov ebx, [esp + 4]      ; Çıkış durum kodunu (status) EBX'e al
    mov eax, 1              ; TRDOS 386: Programı Sonlandır fonksiyon kodu
    int 40h                 ; İşletim sistemi kesmesini çağır
   ;jmp $                   ; Güvenlik amacıyla sonsuz döngü (asla erişilmemeli)
.L_nop_loop:
    nop
    jmp .L_nop_loop

align 4

; 31/08/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: open (C Deklarasyonu: int open(const char *pathname, int flags))
; İşlev: sysopen (Fn 5) çağrısını tetikler. Sadece mevcut dosyaları açar.
; Girdi: [ESP+4] = pathname (EBX'e), [ESP+8] = flags/mode (ECX'e -> CL okunur)
; Çıktı: EAX = LIBC Handle (3-12 arası zırhlı) veya Hata durumunda -1
; -----------------------------------------------------------------------------
global open
open:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp+8]        ; EBX = pathname adresi (ASCIIZ)
    mov ecx, [ebp+12]       ; ECX = open mode (Kernel sadece CL kullanır)

    mov eax, 5              ; EAX = sysopen fonksiyon numarası
    int 0x40                ; TRDOS Çekirdek Kesmesi
    jc .L_open_err          ; CF=1 ise dosya bulunamadı veya erişim engellendi

    add eax, 3              ; Convert TRDOS FD (0-9) to LIBC FD (3-12)
    jmp .L_open_done

.L_open_err:
    mov eax, -1             ; Başarısızlık durumunda C uyumlu -1

.L_open_done:
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; -----------------------------------------------------------------------------
; Fonksiyon: close (C Deklarasyonu: int close(int fd))
; İşlev: sysclose (Fn 6) çağrısını tetikler. Standart I/O (0,1,2) kapatmalarını engeller.
; Girdi: [ESP+4] = fd (EBX'e aktarılır)
; Çıktı: EAX = 0 (Başarı) veya Hata durumunda -1
; -----------------------------------------------------------------------------
global close
close:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp+8]        ; EBX = LIBC FD (C dünyasından gelen)
    
    ; Zırh Koruması: Eğer gelen fd 0, 1 veya 2 ise (stdin, stdout, stderr)
    ; Çekirdeğin dosya kapatma sistemini yormamak için kapatma işlemini simüle et ve çık
    cmp ebx, 3
    jl .L_close_simulate_success

    sub ebx, 3              ; Zırh sarmalını kır (TRDOS ham FD: 0-9)
    mov eax, 6              ; EAX = sysclose fonksiyon numarası
    int 0x40
    jc .L_close_err
    
.L_close_simulate_success:
    xor eax, eax            ; Başarı durumunda EAX = 0 döndür
    jmp .L_close_done

.L_close_err:
    mov eax, -1

.L_close_done:
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; -----------------------------------------------------------------------------
; Fonksiyon: read (C Deklarasyonu: int read(int fd, void *buf, unsigned int count))
; İşlev: sysread (Fn 3) veya standard girdi durumunda konsol kesmesini tetikler.
; TRDOS Düzeni: EBX = FD, ECX = Buffer Adresi, EDX = 32-bit Count
; -----------------------------------------------------------------------------
global read
read:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp+8]       ; EBX = LIBC FD
    mov ecx, [ebp+12]      ; ECX = Buffer Adresi
    mov edx, [ebp+16]      ; EDX = 32-bit Byte Count

    ; Zırh Koruması: Girdi stdin (0) mi kontrol et
    cmp ebx, 0
    je .L_read_stdin       ; Eğer stdin ise doğrudan klavye/konsol okuma rutin sarmalına dallan

    sub ebx, 3             ; Convert to TRDOS ham FD (0-9)
    jb .L_read_err

    mov eax, 3             ; EAX = sysread fonksiyon numarası
    int 0x40
    jnc .L_read_done

.L_read_err:
    mov edx, -1 
.L_read_ok:
    ;mov eax, -1           ; Hata durumunda -1
    mov eax, edx

.L_read_done:
    pop ebx
    mov esp, ebp
    pop ebp
    ret

    ; Console Input (Keyboard) Read Loop (sys_stdio)
.L_read_stdin:
    xor edx, edx           ; Clear character counter

.L_read_stdin_next:
    mov eax, 46            ; TRDOS 386 sys_stdio (BL=0 for STDIN)
    int 0x40
    jc .L_read_ok

    mov [ecx], al
    and al, al
    jz .L_read_ok

    inc edx
    cmp edx, [ebp + 16]    ; Check against requested count limit
    jnb .L_read_ok

    inc ecx
    cmp al, 27             ; ESC check
    je .L_read_ok
    cmp al, 13             ; Enter check
    je .L_read_ok
    jmp .L_read_stdin_next

;.L_read_ok:
    ;mov eax, edx          ; Return total read count

;.L_read_done:
    ;pop ebx
    ;pop ebp
    ;ret

align 4

; =============================================================================
; C Fonksiyonu: ssize_t write(int fd, const void *buf, size_t count)
; Açıklama:     Belirtilen tampon bellekteki verileri dosyaya veya konsola yazar.
; Giriş (Stack):[ESP + 4] = Dosya Tanımlayıcı (fd - 1: stdout, 2: stderr için)
;               [ESP + 8] = Yazılacak verinin bellek adresi (buf)
;               [ESP + 12] = Yazılacak byte sayısı (count)
; Çıkış:        EAX = Yazılan byte sayısı veya Hata durumunda -1
; Mimarisi:     TRDOS 386 Kesme Servisi (Int 40h - Fonksiyon 0008h: Write File)
; =============================================================================
global write
write:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp+8]        ; EBX = LIBC FD (c_fd)
    mov ecx, [ebp+12]       ; ECX = Buffer Adresi
    mov edx, [ebp+16]       ; EDX = 32-bit Byte Count

    cmp ebx, 3              ; Zırhı kır (c_fd - 3)
    jb .L_write_stdio       ; c_fd < 3 ise (stdout/stderr), sysstdio çağrısına dallan
    sub	ebx, 3

    ; Gerçek dosya yazma adımı
    mov eax, 4              ; EAX = syswrite fonksiyon numarası
    int 0x40
    jnc .L_write_done

.L_write_error:
    mov eax, -1             ; Yazma hatası

.L_write_done:
    pop ebx
    mov esp, ebp
    pop ebp
    ret

    ; Console Output (TTY) Write Loop (sys_stdio)
.L_write_stdio:
    cmp ebx, 0
    je .L_write_error       ; Writing to stdin (fd=0) is invalid

    ; Map C-FD to TRDOS sys_stdio BL codes
    ; bl > 0 & bl < 3	    ; 1 = stdout, 2 = stderr	
    inc	ebx                 ; BL = 2 (stdout)
                            ; BL = 3 (stderr)
    push esi
    push edi
    mov esi, ecx
    mov edi, edx	    ; count
    xor edx, edx            ; EDX = Character counter (bytes written)

.L_stdio_w_loop:
    mov cl, [esi]           ; CL = ASCII character code
    test cl, cl             ; Check for ASCIIZ null terminator
    jz .L_skip_stdio_w

    cmp cl, 10              ; LF
    jne .L_skip_crlf
    cmp byte [_pchar_storage], 13 ; CR check
    je .L_skip_crlf

    mov ecx, 13
    mov eax, 46             ; EAX = 46 (TRDOS 386 sys_stdio)
    int 0x40                ; Call kernel to print a single character
    jc .L_stdio_w_error
    mov cl, 10

.L_skip_crlf:
    mov byte [_pchar_storage], cl

    mov ch, 0               ; CH = 0 (No CGA color attribute)
    mov eax, 46             ; EAX = 46 (TRDOS 386 sys_stdio)
    int 0x40                ; Call kernel to print a single character
    jc .L_stdio_w_error
.L_skip_stdio_w:
    inc edx                 ; Increment processed characters counter
    inc esi                 ; Advance buffer pointer to the next character
    cmp edx, edi            ; Sınır Kontrol : Sayaç (EDX) == İstenen byte (EDI) oldu mu?
    jb .L_stdio_w_loop

.L_stdio_loop_ok:
    mov eax, edx            ; Çağıran fonksiyona yazılan byte sayısını döndür

.L_stdio_w_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

.L_stdio_w_error:
    mov eax, -1             ; Return -1 on error
    jmp .L_stdio_w_done

; Previous Character - CRLF check statik hafıza hücresi
align 4
_pchar_storage: db 0

align 4

; =============================================================================
; C Fonksiyonu: off_t lseek(int fd, off_t offset, int whence)
; Açıklama:     Dosya okuma/yazma işaretçisinin (pointer) konumunu değiştirir.
; Giriş (Stack):[ESP + 4] = Dosya Tanımlayıcı (fd)
;               [ESP + 8] = Yeni konum offset değeri
;               [ESP + 12] = Arama modu (0: SEEK_SET, 1: SEEK_CUR, 2: SEEK_END)
; Çıkış:        EAX = Dosyanın başından itibaren oluşan yeni mutlak konum, Hata: -1
; Mimarisi:     TRDOS 386 Kesme Servisi (Int 40h - Fonksiyon 19: Seek File)
; =============================================================================
lseek:
    push ebx
    mov ebx, [esp + 8]      ; fd / handle
    mov ecx, [esp + 12]     ; offset
    mov edx, [esp + 16]     ; whence (0, 1, 2)

    ; 30/08/2026
    sub ebx, 3              ; C-FD (3,4..) -> TRDOS-FD (0,1..)
    jb .lseek_err           ; If fd < 3, it's an invalid regular file descriptor

    mov eax, 19             ; TRDOS 386: Dosya Konumu Değiştir fonksiyon kodu
    int 40h
    jnc .done
.lseek_err:
    mov eax, -1
.done:
    pop ebx
    ret

align 4

; =============================================================================
; C Fonksiyonu: off_t tell(int fd)
; Açıklama:     Dosya işaretçisinin mevcut anlık konumunu döndürür.
; Giriş (Stack):[ESP + 4] = Dosya Tanımlayıcı (fd)
; Çıkış:        EAX = Mevcut dosya konumu
; Mimarisi:     TRDOS 386 Kesme Servisi (Int 40h - Fonksiyon 20: sys_tell)
; =============================================================================
tell:
    ;mov eax, [esp + 4]     ; fd değerini al
    ;push 1                 ; SEEK_CUR (Mevcut konumu koru)
    ;push 0                 ; 0 byte ilerle
    ;push eax               ; fd'yi stack'e gönder
    ;call lseek             ; lseek(fd, 0, SEEK_CUR) mevcut konumu döndürür
    ;add esp, 12            ; Stack temizle
    ;ret
    
    ; 30/08/2026
    push ebx
    mov ebx, [esp + 4]      ; fd değerini al
    sub ebx, 3              ; Convert LIBC FD (3-12) to Kernel FD (0-9)
    jc .tell_err            ; If fd < 3 (stdin/out/err), it's invalid for tell

    mov edx, 1              ; EDX = 1 -> TRDOS kernel: return current file offset
    mov ecx, 0              ; ECX = 0 -> Ignored per TRDOS kernel design
    mov eax, 20             ; TRDOS 386 sys_tell system call number
    int 0x40                ; Call TRDOS 386 Kernel Interrupt
    jnc .done               ; If carry flag set, kernel returned an error
.tell_err:
    mov eax, -1             ; Return -1 on failure
.done:    
    pop	ebx
    ret

align 4

; =============================================================================
; C Fonksiyonu: void *malloc(size_t size)
; Açıklama:     NASM'ın dinamik bellek tahsis kalbidir. Heap alanını 
;               TRDOS 386 sysbreak / brk benzeri sistem çağrısıyla genişletir.
; Giriş (Stack):[ESP + 4] = Tahsis edilmek istenen byte boyutu (size)
; Çıkış:        EAX = Tahsis edilen bellek adresi veya Başarısızlıkta NULL (0)
; Veri Yapısı:  Fonksiyonun hemen altında flat model uyumlu yerel pointer'lar tutulur.
; =============================================================================
malloc:
    ; 30/08/2026
    push ebx
    push ecx
    mov ecx, [esp + 12]     ; İstenen boyut (size)
    test ecx, ecx           ; Boyut 0 mı?
    jz .err_null
    
    ; 4-byte flat hizalama (alignment) garantisi
    add ecx, 3
    ;and ecx, -4
    and cl, 0FCh

    mov ebx, [malloc_current_break]
    test ebx, ebx           ; İlk tahsis mi kontrol et
    jnz .set_new_break
    
    ; İlk çalıştırmada kernel'dan mevcut heap sınırını öğren (sys_break(-1))
    ;xor ebx, ebx
    dec	ebx		    ; EBX = -1 -> Mevcut u.break adresini ver
    mov eax, 17             ; TRDOS 386: sys_break fonksiyon kodu
    int 40h
    jc .malloc_failed       ; Hata varsa (CF=1) elenir

    ; Kernel'dan gelen [u.r0] (current_break) adresini 4-byte'a hizalayıp depola
    add eax, 3
    ;and eax, 0xFFFFFFFC
    and al, 0FCh

    mov [malloc_current_break], eax
    mov ebx, eax

.set_new_break:
    ; ebx = current_break, ecx = aligned_size
    add ebx, ecx            ; Yeni break adresi = mevcut + istenen boyut
    
    ; Kernel'a yeni heap sınırını set et (sys_break(new_break))
    mov eax, 17             ; sys_break
    int 40h
    jc .err_null            ; Sistem bellek ayıramadıysa Carry set olur, NULL dön
    
    ;mov [malloc_current_break], ebx ; Sınırı güncelle
    ;mov eax, edx            ; Eski sınırı (tahsis edilen alanın başlangıcını) döndür
    ; Bir sonraki malloc çağrısı için depomuzu kernel'ın döndüğü new_break ile güncelliyoruz
    xchg eax, [malloc_current_break]

    jmp .done

.malloc_failed:
.err_null:
    xor eax, eax            ; Başarısızlık veya geçersizlik durumunda NULL (0)
.done:
    pop ecx
    pop ebx
    ret

; --- Malloc İçin Yerel Değişken Alanı (İstisnai Flat Model Pointer Alanı) ---
align 4
malloc_current_break: dd 0  ; Mevcut heap sınır adresini izleyen yerel değişken

