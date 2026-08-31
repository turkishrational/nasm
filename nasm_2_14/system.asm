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

; =============================================================================
; C Fonksiyonu: int open(const char *pathname, int flags, ...)
; Açıklama:     Belirtilen yoldaki dosyayı okuma/yazma modunda açar.
; Giriş (Stack):[ESP + 4] = Dosya yolu string adresi (pathname)
;               [ESP + 8] = Açılış bayrakları (flags - O_RDONLY, O_WRONLY vb.)
; Çıkış:        EAX = Dosya Tanımlayıcı (File Descriptor / Handle) veya Hata durumunda -1
; Mimarisi:     TRDOS 386 Kesme Servisi (Int 40h - 5: Open File)
; =============================================================================
open:
    push ebx
    push esi
    mov esi, [esp + 12]     ; pathname adresi (Push'lar sebebiyle +8 kaydı)
    mov ecx, [esp + 16]     ; flags
    ; TRDOS 386 Open dosya açma register standartları:
    ; ESI = Dosya adı adresi, ECX = Erişim modu
    mov eax, 5              ; TRDOS 386: Dosya Aç fonksiyon kodu
    int 40h                 ; Kernel çağrısı
    jnc .success            ; Carry bayrağı temizse (hata yoksa) ilerle
    mov eax, -1             ; Hata durumunda C uyumlu -1 döndür
    jmp .done
.success:
    ; EAX zaten dönen geçerli handle değerini içerir
    ; 30/08/2026
    add eax, 3              ; Convert TRDOS FD (0-9) to LIBC FD (3-12)
.done:
    pop esi
    pop ebx
    ret

align 4

; =============================================================================
; C Fonksiyonu: int close(int fd)
; Açıklama:     Açık olan bir dosya tanımlayıcısını (handle) kapatır.
; Giriş (Stack):[ESP + 4] = Dosya Tanımlayıcı (fd)
; Çıkış:        EAX = 0 (Başarılı), -1 (Hata)
; Mimarisi:     TRDOS 386 Kesme Servisi (Int 40h - Fonksiyon 6: Close File)
; =============================================================================
close:
    push ebx
    mov ebx, [esp + 8]      ; fd / handle değerini al (+4 kaydı)

    ; 30/08/2026
    sub ebx, 3              ; Convert LIBC FD (3-12) to Kernel FD (0-9)
    jb .fail                ; If fd < 3, it's a stdio handle, ignore or fail

    mov eax, 6              ; TRDOS 386: Dosya Kapat fonksiyon kodu
    int 40h
    jnc .success
.fail:
    mov eax, -1
    jmp .done
.success:
    xor eax, eax            ; Başarı durumunda 0 döndür
.done:
    pop ebx
    ret

align 4

; =============================================================================
; C Fonksiyonu: ssize_t read(int fd, void *buf, size_t count)
; Açıklama:     Dosyadan belirtilen miktarda veriyi bellek tamponuna okur.
; Giriş (Stack):[ESP + 4] = Dosya Tanımlayıcı (fd)
;               [ESP + 8] = Verinin yazılacağı tampon bellek adresi (buf)
;               [ESP + 12] = Okunacak byte sayısı (count)
; Çıkış:        EAX = Okunan byte sayısı, EOF durumunda 0, Hata durumunda -1
; Mimarisi:     TRDOS 386 Kesme Servisi (Int 40h - Fonksiyon 3: Read File)
; =============================================================================
read:
    ; 30/08/2026	
    push ebx
    mov ebx, [esp + 8]      ; fd / handle
    mov ecx, [esp + 12]     ; buf adresi

    cmp ebx, 3
    jb .read_stdio          ; If fd < 3, route to sys_stdio
    sub ebx, 3              ; Convert to Kernel FD

    mov edx, [esp + 16]     ; count

    mov eax, 3              ; TRDOS 386: Dosyadan Oku fonksiyon kodu
    int 40h
    jnc .done
.read_fail:
    mov eax, -1             ; Kesme carry döndürdüyse hata oluşmuştur
.done:
    pop ebx
    ret

align 4

    ; Console Input (Keyboard) Read Loop (sys_stdio)
.read_stdio:
    cmp bl, 1              ; Check if fd is stdout(1) or stderr(2)
    cmc
    jc .read_fail          ; If fd >= 1, abort with error (-1)

    xor edx, edx           ; Clear character counter
    
.read_stdio_next:
    mov eax, 46            ; TRDOS 386 sys_stdio (BL=0 for STDIN)
    int 40h
    jc .read_ok

    mov [ecx], al
    and al, al
    jz .read_ok
    
    inc edx
    cmp edx, [ebp + 16]    ; Check against requested count limit
    jnb .read_ok
    
    inc ecx
    cmp al, 27             ; ESC check
    je .read_ok
    cmp al, 13             ; Enter check
    jne .read_stdio_next

.read_ok:
    mov eax, edx           ; Return total read count
.read_done:
    pop ebx
    ret

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
write:
    ; 30/08/2026 
    push ebx
    mov ebx, [esp + 8]      ; fd / handle (TRDOS konsol veya dosya handle)
    mov ecx, [esp + 12]     ; buf adresi
    mov edx, [esp + 16]     ; count

    cmp ebx, 3
    jb .write_stdio         ; If fd < 3 (0, 1, 2), route to console sys_stdio
    sub ebx, 3              ; Convert C-FD to TRDOS-FD

    mov eax, 4              ; TRDOS 386: Dosyaya Yaz fonksiyon kodu
    int 40h
    jnc .done
.write_fail:
    mov eax, -1
.done:
    pop ebx
    ret

align 4

    ; Console Output (TTY) Write Loop (sys_stdio)
.write_stdio:
    cmp ebx, 0
    je .write_fail        ; Writing to stdin (fd=0) is invalid

    ; Map C-FD to TRDOS sys_stdio BL codes
    cmp ebx, 2
    je .set_stderr
    mov bl, 2             ; BL = 2 (stdout)
    jmp .init_loop
.set_stderr:
    mov bl, 3             ; BL = 3 (stderr)

.init_loop:
    push esi
    push edi
    mov esi, ecx
    mov edi, edx	  ; count
    xor edx, edx          ; EDX = Character counter (bytes written)

.stdio_loop_next:
    mov cl, [esi]         ; CL = ASCII character code
    test cl, cl           ; Check for ASCIIZ null terminator
    jz .skip_stdio_w

    cmp cl, 10            ; LF
    jne .skip_crlf
    cmp byte [_pchar_storage], 13 ; CR check
    je .skip_crlf

    mov ecx, 13
    mov eax, 46           ; EAX = 46 (TRDOS 386 sys_stdio)
    int 0x40              ; Call kernel to print a single character
    jc .write_error
    mov cl, 10

.skip_crlf:
    mov byte [_pchar_storage], cl

    mov ch, 0             ; CH = 0 (No CGA color attribute)
    mov eax, 46           ; EAX = 46 (TRDOS 386 sys_stdio)
    int 0x40              ; Call kernel to print a single character
    jc .write_error
.skip_stdio_w:
    inc edx               ; Increment processed characters counter
    inc esi               ; Advance buffer pointer to the next character
    cmp edx, edi          ; Sınır Kontrol : Sayaç (EDX) == İstenen byte (EDI) oldu mu?
    jb .stdio_loop_next

.stdio_loop_ok:
    mov eax, edx          ; Çağıran fonksiyona yazılan byte sayısını döndür
    jmp .write_done

.write_error:
    mov eax, -1           ; Return -1 on error

.write_done:
    pop edi
    pop esi
    pop ebx
    ret

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

