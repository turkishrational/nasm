; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY STANDART KÜTÜPHANE SARMAYICI (libnasm.asm)
; TRDOS 386 libc.a fonksiyonları ile el sıkışan, IOB bağımsız ara katman.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

align 4

; =========================================================================
; 1. DOSYA SİSTEMİ KÖPRÜLERİ (+3 FD ZIRHI KORUNMUŞTUR)
; =========================================================================

fopen:
    push ebp
    mov ebp, esp
    push ebx
    push ecx

    mov ecx, [ebp + 12]         ; ecx = mode string pointer ("r", "w")
    mov ebx, [ebp + 8]          ; ebx = filename string pointer

    cmp byte [ecx], 114         ; 'r' karakteri mi?
    je .L_fopen_read
    cmp byte [ecx], 119         ; 'w' karakteri mi?
    je .L_fopen_write
    jmp .L_fopen_fail

.L_fopen_read:
    push 0                      ; Mode = 0 (Read)
    push ebx
    ; extern open
    call open
    add esp, 8
    jmp .L_fopen_check

.L_fopen_write:
    push 1                      ; Mode = 1 (Write)
    push ebx
    call open
    add esp, 8

.L_fopen_check:
    cmp eax, -1
    je .L_fopen_fail
    jmp .L_fopen_done

.L_fopen_fail:
    xor eax, eax                ; Hata durumunda Return NULL (0)

.L_fopen_done:
    pop ecx
    pop ebx
    pop ebp
    ret

align 4

fclose:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]          ; eax = stream (LIBC FD)
    cmp eax, 3
    jl .L_fclose_success        ; Stdio handles (0,1,2) kapatılamaz, güvenle dön
    
    push eax
    ; extern close
    call close
    add esp, 4
    jmp .L_fclose_done

.L_fclose_success:
    xor eax, eax

.L_fclose_done:
    pop ebp                     ; 30/08/2026
    ret

align 4

fread:
    push ebp
    mov ebp, esp
    push ebx
    push ecx

    mov eax, [ebp + 12]         ; size
    mov ecx, [ebp + 16]         ; count
    mul ecx                     ; eax = size * count
    mov edx, eax                ; edx = toplam byte

    mov ebx, [ebp + 20]         ; ebx = stream (LIBC FD)
    test ebx, ebx
    jz .L_fread_fail

    push edx                    ; count
    push dword [ebp + 8]        ; buf ptr
    push ebx                    ; fd
    ; extern read
    call read
    add esp, 12
    test eax, eax
    jle .L_fread_fail

    mov ecx, [ebp + 12]         ; ecx = size
    xor edx, edx
    div ecx                     ; eax = bytes_read / size
    jmp .L_fread_done

.L_fread_fail:
    xor eax, eax

.L_fread_done:
    pop ecx
    pop ebx
    pop ebp
    ret

align 4

fwrite:
    push ebp
    mov ebp, esp
    push ebx
    push ecx

    mov eax, [ebp + 12]         ; size
    mov ecx, [ebp + 16]         ; count
    mul ecx                     ; eax = size * count
    mov edx, eax                ; edx = toplam yazılacak byte

    mov ebx, [ebp + 20]         ; ebx = stream (LIBC FD)
    test ebx, ebx
    jz .L_fwrite_fail

    push edx                    ; count
    push dword [ebp + 8]        ; buf ptr
    push ebx                    ; fd
    ; extern write
    call write
    add esp, 12
    test eax, eax
    jle .L_fwrite_fail

    mov ecx, [ebp + 12]         ; ecx = size
    xor edx, edx
    div ecx                     ; eax = bytes_written / size
    jmp .L_fwrite_done

.L_fwrite_fail:
    xor eax, eax

.L_fwrite_done:
    pop ecx
    pop ebx
    pop ebp
    ret

align 4

fseek:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp + 8]          ; stream (LIBC FD)
    push dword [ebp + 16]       ; whence
    push dword [ebp + 12]       ; offset
    push ebx                    ; fd
    ; extern lseek
    call lseek
    add esp, 12
    cmp eax, -1
    je .L_fseek_err
    xor eax, eax                ; Başarılı: Return 0
    jmp .L_fseek_done

.L_fseek_err:
    mov eax, -1

.L_fseek_done:
    pop ebx
    pop ebp
    ret

align 4

ftell:
    push ebp
    mov ebp, esp
    push dword [ebp + 8]        ; stream (LIBC FD)
    ; extern tell
    call tell
    add esp, 4                  ; EAX = Mevcut dosya offset değeri
    pop ebp
    ret

align 4

; 30/08/2026
fgetc:
    push ebp
    mov ebp, esp
    sub esp, 4                  ; Yerel 1 byte char alanı
    
    push dword [ebp + 8]        ; stream
    push 1                      ; count = 1
    push 1                      ; size = 1
    lea eax, [ebp - 4]
    push eax                    ; ptr adresi
    call fread
    add esp, 16
    test eax, eax
    jz .L_fgetc_eof

    xor eax, eax
    mov al, [ebp - 4]           ; Okunan karakteri yükle
    jmp .L_fgetc_done

.L_fgetc_eof:
    mov eax, -1                 ; EOF: Return -1

.L_fgetc_done:
    mov esp, ebp
    pop ebp
    ret

align 4

fputc:
    push ebp
    mov ebp, esp
    push ebx
    
    mov bl, [ebp + 8]           ; character
    push dword [ebp + 12]       ; stream
    push 1                      ; count = 1
    push 1                      ; size = 1
    lea eax, [ebp + 8]          ; Yığındaki karakter adresini tampon göster
    push eax
    call fwrite
    add esp, 16
    test eax, eax
    jz .L_fputc_err
    
    xor eax, eax
    mov al, bl
    jmp .L_fputc_done

.L_fputc_err:
    mov eax, -1

.L_fputc_done:
    pop ebx
    pop ebp
    ret

align 4

strlcpy:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov edi, [ebp + 8]          ; edi = dst
    mov esi, [ebp + 12]         ; esi = src
    mov ecx, [ebp + 16]         ; ecx = siz

    push esi
    ; extern strlen
    call strlen
    add esp, 4
    mov ebx, eax                ; ebx = src_len (Dönecek değer)

    test ecx, ecx
    jz .L_slcpy_done            ; Eğer siz == 0 ise hiçbir şey kopyalama, direkt dön

    dec ecx                     ; null terminator için yer ayır (siz - 1)
    jz .L_slcpy_null_term       ; Eğer siz == 1 ise sadece null koy

.L_slcpy_loop:
    test ecx, ecx
    jz .L_slcpy_null_term
    mov al, byte [esi]
    test al, al
    jz .L_slcpy_null_term
    
    mov byte [edi], al
    inc esi
    inc edi
    dec ecx
    jmp .L_slcpy_loop

.L_slcpy_null_term:
    mov byte [edi], 0           ; dst dizesini güvenle kapat

.L_slcpy_done:
    mov eax, ebx                ; Return EAX = src_len
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret

align 4

strrchrnul:
    push ebp
    mov ebp, esp
    mov edx, [ebp + 8]          ; edx = s
    mov ecx, [ebp + 12]         ; ecx = c
    mov eax, edx                ; Varsayılan dönüş: string başı

.L_rchrnul_loop:
    mov bl, byte [edx]
    cmp bl, cl
    jne .L_rchrnul_next
    mov eax, edx                ; Son bulunan konumu kaydet
.L_rchrnul_next:
    test bl, bl
    jz .L_rchrnul_not_found     ; Son karakter sıfır ise bitir
    inc edx
    jmp .L_rchrnul_loop

.L_rchrnul_not_found:
    test eax, eax
    jnz .L_rchrnul_done
    mov eax, edx                ; Bulunamadıysa null terminator adresini dön

.L_rchrnul_done:
    pop ebp
    ret

; 30/08/2026 - Google AI */

; =============================================================================
; C Fonksiyonu: size_t strlen(const char *s)
; Açıklama:     Verilen null-terminated (0 ile biten) string katarının 
;               karakter uzunluğunu hesaplar (null karakteri hariç).
; Giriş (Stack):[ESP + 4] = String adresi (const char *)
; Çıkış:        EAX = Karakter sayısı (size_t)
; =============================================================================
strlen:
    mov eax, [esp + 4]      ; String başlangıç adresini EDX'e yükle
.loop:
    cmp byte [eax], 0	    ; Mevcut karakter NULL (0) mı?
    je .done                ; Eğer NULL ise döngüyü sonlandır
    inc eax                 ; Sayacı 1 artır
    jmp .loop               ; Bir sonraki karakteri kontrol et
.done:
    sub eax, [esp + 4]
    ret

; 01/09/2026 - Google AI

; =============================================================================
; C Fonksiyonu: int strcmp(const char *s1, const char *s2)
; Açıklama:     İki string katarını karakter karakter karşılaştırır.
;               EBX, ESI ve EDI register'larını cdecl standardına uygun korur.
; Giriş (Stack):[ESP + 4] = Birinci string adresi (s1)
;               [ESP + 8] = İkinci string adresi (s2)
; Çıktı:        EAX = 0 (Eşit), <0 (s1 < s2), >0 (s1 > s2)
; =============================================================================
global strcmp
strcmp:
    push ebx                ; *   (EBX Koruma Altına Alındı - HAYATİ!)
    push esi                ; **  (ESI Saklandı)
    push edi                ; *** (EDI Saklandı)
    
    ; Push operasyonları sebebiyle stack 12 byte aşağı kaydı (+12 ofset ayarı)
    mov esi, [esp + 16]     ; s1 adresi
    mov edi, [esp + 20]     ; s2 adresi

.loop:
    mov al, [esi]           ; s1'den 1 byte al
    mov bl, [edi]           ; s2'den 1 byte al (Artık EBX çıkışta pop edileceği için güvenli!)
    cmp al, bl              ; Karakterleri karşılaştır
    jne .diff               ; Farklılık varsa döngüden çık
    cmp al, 0               ; String'lerin sonuna (NULL) ulaşıldı mı?
    je .equal               ; Ulaşıldıysa string'ler tamamen eşittir
    inc esi                 ; s1 işaretçisini ilerlet
    inc edi                 ; s2 işaretçisini ilerlet
    jmp .loop

.diff:
    movzx eax, al           ; AL'yi 32-bit'e genişlet
    movzx ebx, bl           ; BL'yi 32-bit'e genişlet
    sub eax, ebx            ; s1 - s2 farkını hesapla
    jmp .done

.equal:
    xor eax, eax            ; Tam eşitlik durumunda EAX = 0

.done:
    pop edi                 ; *** (EDI Geri Yüklendi)
    pop esi                 ; **  (ESI Geri Yüklendi)
    pop ebx                 ; *   (EBX Orijinal Haliyle Kurtarıldı!)
    ret

; =============================================================================
; C Fonksiyonu: void *memcpy(void *dest, const void *src, size_t n)
; Açıklama:     Kaynak bellek bölgesindeki n byte'lık veriyi hedef bellek 
;               bölgesine kopyalar. Korumalı modda hızlı ardışık transfer yapar.
; Giriş (Stack):[ESP + 4] = Hedef bellek adresi (dest)
;               [ESP + 8] = Kaynak bellek adresi (src)
;               [ESP + 12] = Kopyalanacak byte sayısı (n)
; Çıkış:        EAX = Hedef bellek adresi (dest)
; =============================================================================
memcpy:
    push esi                ; String operasyon register'larını sakla
    push edi
    mov edi, [esp + 12]     ; Hedef (dest) adresi
    mov esi, [esp + 16]     ; Kaynak (src) adresi
    mov ecx, [esp + 20]     ; Kopyalanacak byte sayısı (n)
    mov eax, edi            ; C standardı gereği dönüş değeri dest olmalıdır
    
    push ecx                ; Orijinal byte sayısını koru
    shr ecx, 2              ; 4 byte'lık blok sayısını bul (n / 4)
    rep movsd               ; Dword (32-bit) bloklarını hızla taşı
    pop ecx                 ; Orijinal byte sayısını geri al
    and ecx, 3              ; 4'e bölünmeden kalan byte'ları hesapla (n % 4)
    rep movsb               ; Kalan byte'ları tek tek taşı
    
    pop edi                 ; Register'ları geri yükle
    pop esi
    ret

; =============================================================================
; C Fonksiyonu: void *memset(void *s, int c, size_t n)
; Açıklama:     Hedef bellek bölgesindeki n byte'lık alanı c karakteri ile doldurur.
; Giriş (Stack):[ESP + 4] = Hedef bellek adresi (s)
;               [ESP + 8] = Doldurulacak karakter değeri (c)
;               [ESP + 12] = Doldurulacak alanın byte boyutu (n)
; Çıkış:        EAX = Hedef bellek adresi (s)
; =============================================================================
memset:
    push edi                ; EDI register'ını korumak için sakla
    mov edi, [esp + 8]      ; Hedef (s) adresi
    mov eax, [esp + 12]     ; Doldurulacak byte değeri (c)
    mov ecx, [esp + 16]     ; Byte sayısı (n)
    mov edx, edi            ; Geri dönüş değeri (s) için adresi yedekle

    ; AL içerisindeki byte değerini EAX'ın tüm katmanlarına yay (Örn: 0xCC -> 0xCCCCCCCC)
    mov ah, al
    push eax
    shl eax, 16
    pop ax
    
    push ecx                ; Orijinal boyutu sakla
    shr ecx, 2              ; Dword blok sayısını hesapla (n / 4)
    rep stosd               ; Belleği 32-bit'lik bloklar halinde hızla doldur
    pop ecx                 ; Orijinal boyutu geri al
    and ecx, 3              ; Kalan byte sayısını hesapla (n % 4)
    rep stosb               ; Kalan alanları byte byte doldur
    
    mov eax, edx            ; Başlangıç adresini (s) dönüş değeri olarak ayarla
    pop edi                 ; EDI'yi geri yükle
    ret

; =============================================================================
; C Fonksiyonu: char *strrchr(const char *s, int c)
; Açıklama:     Bir string içinde belirtilen karakterin (c) sağdan sola doğru
;               tespit edilen ilk (yani string genelindeki son) konumunu arar.
; Giriş (Stack):[ESP + 4] = String adresi (s)
;               [ESP + 8] = Aranacak karakter (c)
; Çıkış:        EAX = Bulunan son karakterin adresi (Karakter yoksa NULL / 0)
; =============================================================================
strrchr:
    mov edx, [esp + 4]      ; String başlangıç adresi
    mov cl, [esp + 8]       ; Aranacak karakter değeri
    xor eax, eax            ; Sonuç adresini varsayılan olarak NULL (0) yap
.loop:
    mov bl, [edx]           ; Mevcut byte'ı oku
    cmp bl, 0               ; String sonu (NULL) ulaşıldı mı?
    je .done                ; Ulaşıldıysa aramayı bitir
    cmp bl, cl              ; Karakter aranan karakterle eşleşiyor mu?
    jne .next               ; Eşleşmiyorsa işaretçiyi ilerlet
    mov eax, edx            ; Eşleşme bulundu, güncel adresi EAX'ta sakla
.next:
    inc edx                 ; String işaretçisini bir sonraki byte'a geçir
    jmp .loop
.done:
    ret

; =============================================================================
; C Fonksiyonu: int isdigit(int c)
; Açıklama:     Verilen karakter değerinin bir rakam ('0'-'9') olup olmadığını doğrular.
; Giriş (Stack):[ESP + 4] = Kontrol edilecek karakter değeri (c)
; Çıkış:        EAX = 1 (Rakam ise), 0 (Rakam değilse)
; =============================================================================
isdigit:
    mov eax, [esp + 4]      ; Karakter değerini al
    cmp eax, '0'            ; '0' karakterinden küçük mü?
    jb .no
    cmp eax, '9'            ; '9' karakterinden büyük mü?
    ja .no
    mov eax, 1              ; Koşullar sağlandı, bu bir rakamdır
    ret
.no:
    xor eax, eax            ; Koşullar sağlanmadı, 0 döndür
    ret

; =============================================================================
; C Fonksiyonu: int isspace(int c)
; Açıklama:     Verilen karakterin standart C boşluk karakterlerinden (Boşluk, 
;               Tab, Satır Sonu, Satır Başı vb.) biri olup olmadığını kontrol eder.
; Giriş (Stack):[ESP + 4] = Kontrol edilecek karakter değeri (c)
; Çıkış:        EAX = 1 (Boşluk karakteri ise), 0 (Değilse)
; =============================================================================
isspace:
    mov eax, [esp + 4]      ; Karakter değerini al
    cmp eax, ' '            ; Standart boşluk karakteri (Space)
    je .yes
    cmp eax, 0x09           ; Yatay Tab (Horizontal Tab - \t)
    je .yes
    cmp eax, 0x0A           ; Satır Besleme (Line Feed - \n)
    je .yes
    cmp eax, 0x0D           ; Satır Başı (Carriage Return - \r)
    je .yes
    cmp eax, 0x0B           ; Dikey Tab (Vertical Tab - \v)
    je .yes
    cmp eax, 0x0C           ; Sayfa Besleme (Form Feed - \f)
    je .yes
    xor eax, eax            ; Tanımlı boşluk karakterlerinden biri değil
    ret
.yes:
    mov eax, 1              ; Boşluk karakteri doğrulandı
    ret

; =============================================================================
; C Fonksiyonu: size_t strnlen(const char *s, size_t maxlen)
; Açıklama:     Verilen string'in uzunluğunu maksimum maxlen sınırına kadar ölçer.
; Giriş (Stack):[ESP + 4] = String adresi, [ESP + 8] = Maksimum sınır (maxlen)
; Çıkış:        EAX = Ölçülen uzunluk değeri
; =============================================================================
strnlen:
    mov edx, [esp + 4]      ; String adresi
    mov ecx, [esp + 8]      ; maxlen
    xor eax, eax            ; Sayaç
.loop:
    test ecx, ecx           ; maxlen sınırına ulaşıldı mı?
    jz .done
    cmp byte [edx + eax], 0 ; NULL karakter mi?
    je .done
    inc eax
    dec ecx
    jmp .loop
.done:
    ret

; 30/08/2026 - Google AI */

align 4

; =============================================================================
; C Fonksiyonu: int printf(const char *format, ...)
; Açıklama:     Standart çıktı akışına (ekrana/konsola) biçimlendirilmiş 
;               string basar. İçeride güvenli __print motorunu tetikler.
; Giriş (Stack):[ESP + 4] = Biçimlendirilecek string format adresi (format)
; Çıkış:        EAX = Konsola yazılan toplam karakter/byte sayısı
; =============================================================================
printf:
    push ebp
    mov ebp, esp
    lea eax, [ebp + 12]     ; Değişken argüman listesinin başlangıç adresi (...)
    push eax                ; Parametre 3: argptr (ap)
    push dword [ebp + 8]    ; Parametre 2: format string pointer'ı
    push 1                  ; Parametre 1: Default STDOUT FD = 1
    call __print            ; Biçimlendirilmiş baskı motorunu çağır
    add esp, 12             ; Yığın alanını temizle
    pop ebp
    ret

align 4

; =============================================================================
; C Fonksiyonu: int fprintf(FILE *stream, const char *format, ...)
; Açıklama:     Belirtilen dosya akışına (dosyaya veya stderr/standart hataya) 
;               biçimlendirilmiş hata dökümü yazar. 
; Giriş (Stack):[ESP + 4] = Stream / Dosya Tanımlayıcı (FILE * / LIBC FD)
;               [ESP + 8] = Biçimlendirilecek hata format adresi (format)
; Çıkış:        EAX = Hedefe başarıyla yazılan karakter/byte sayısı
; =============================================================================
fprintf:
    push ebp
    mov ebp, esp
    lea eax, [ebp + 16]     ; Değişken argüman listesinin başlangıç adresi (...)
    push eax                ; Parametre 3: argptr (ap)
    push dword [ebp + 12]   ; Parametre 2: format string pointer'ı
    push dword [ebp + 8]    ; Parametre 1: Stream pointer veya FD numarası
    call __print            ; Biçimlendirilmiş baskı motorunu çağır
    add esp, 12             ; Yığın alanını temizle
    pop ebp
    ret

align 4

; =============================================================================
; Arka Plan Motoru: int __print(int fd, const char *format, va_list ap)
; Açıklama:     printf, fprintf ve türevlerinin arkasındaki biçimlendirme 
;               ve tampon yönlendirme motorudur. CRLF kontrolü kaldırılmış,
;               LF ve CR karakterleri doğrudan write'a devredilmiştir.
; Giriş (Stack):[ESP + 4] = File Descriptor, [ESP + 8] = format, [ESP + 12] = ap
; Çıkış:        EAX = Final yazılan karakter sayısı (cc)
; =============================================================================
__print:
    push ebp
    mov ebp, esp
    push ebx                  ; Register koruma kalkanları
    push esi
    push edi

    mov edx, [ebp + 8]        ; edx = File Descriptor (Handle)
    mov esi, [ebp + 12]       ; esi = format string pointer'ı
    mov edi, [ebp + 16]       ; edi = ap (değişken argüman yığın işaretçisi)
    xor ebx, ebx              ; ebx = cc (total output char counter - yazılan karakter sayacı)

.L_parse_loop:
    mov al, byte [esi]
    test al, al               ; Null karakter (string sonu) kontrolü
    jz .L_parse_done

    cmp al, '%'               ; Format belirteci başlangıcı mı?
    je .L_handle_format

    ; --- ARINDIRILMIŞ HAM METİN OKUYUCU (CRLF KONTROLÜ KALDIRILDI) ---
    mov ecx, esi
.L_scan_raw:
    mov al, byte [ecx]
    test al, al
    jz .L_write_chunk
    cmp al, '%'
    je .L_write_chunk         ; Sadece '%' görene kadar ham metni tarar (LF ve CR durdurmaz)
    inc ecx
    jmp .L_scan_raw

.L_write_chunk:
    sub ecx, esi              ; ecx = ham metin bloğunun uzunluğu
    jz .L_parse_loop

    push ecx
    push edx                  ; Bağlam register'larını koru

    push ecx                  ; Arg 3: count
    push esi                  ; Arg 2: buffer pointer
    push edx                  ; Arg 1: File Descriptor
    call write                ; system.asm içindeki write çağrılır (CRLF orada yönetilir)
    add esp, 12

    pop edx
    pop ecx

    add ebx, ecx              ; cc += yazılan blok uzunluğu
    add esi, ecx              ; format işaretçisini ilerlet
    jmp .L_parse_loop

.L_handle_format:
    inc esi                   ; '%' karakterini atla
    mov al, byte [esi]
    test al, al
    jz .L_parse_done

    mov ecx, 1

    cmp al, '%'
    je .L_write_escaped_percent

    ; Genişlik belirteç basamaklarını atla (Format hizalaması için)
    cmp al, '0'
    jl .L_check_specifiers
    cmp al, '9'
    jg .L_check_specifiers
.L_skip_width:
    inc esi
    mov al, byte [esi]
    cmp al, '0'
    jl .L_check_specifiers
    cmp al, '9'
    jle .L_skip_width

.L_check_specifiers:
    cmp al, 's'
    je .L_fmt_string
    cmp al, 'd'
    je .L_fmt_integer
    cmp al, 'c'
    je .L_fmt_char
    cmp al, 'x'
    je .L_fmt_hex
    cmp al, 'X'
    je .L_fmt_hex
    cmp al, 'u'
    je .L_fmt_unsigned

.L_unknown_format:
    mov ah, al
    mov al, '%'
    inc ecx                   ; mov ecx, 2

.L_write_escaped_percent:
.L_fmt_char_w:
    push eax                  ; Karakter verisini yığına it
    add ebx, ecx              ; Küresel sayacı güncelle
    lea eax, [esp]            ; Geçici yığın adresini al
    push edx
    push ecx
    push eax
    push edx
    call write
    add esp, 12
    pop edx
    add esp, 4
    inc esi
    jmp .L_parse_loop

.L_fmt_char:
    mov eax, [edi]            ; Karakter verisini ap'den yükle
    add edi, 4                ; Bir sonraki argümana geç
    jmp .L_fmt_char_w

align 4

.L_fmt_string:
    mov eax, [edi]
    add edi, 4
    test eax, eax
    jnz .L_str_valid
    mov eax, .L_null_str      ; NULL dize koruması
.L_str_valid:
    push edx ; *
    push eax
    call strlen               ; libnasm.asm içindeki strlen çağrılır
    ;add esp, 4
    ; 31/08/2026
    pop	edx
    pop	edx ; *

    test eax, eax
    jz .L_fmt_str_done

    push ebx
    push eax                  ; Arg 3: Toplam string uzunluğu
    mov ecx, [edi - 4]        ; String işaretçisini ap'den güvenle yeniden yükle
    test ecx, ecx
    jnz .L_str_reload_ok
    mov ecx, .L_null_str
.L_str_reload_ok:
    push ecx                  ; Arg 2: string tamponu
    push edx  ; *             ; Arg 1: FD
    call write
    ;add esp, 12
    ; 31/08/2026
    pop	edx ; *
    add	esp, 8	 
    pop ebx
    add ebx, eax              ; Accumulate cc
.L_fmt_str_done:
    ;pop edx ; *
    inc esi
    jmp .L_parse_loop

align 4

.L_fmt_integer:
    sub esp, 32               ; Geçici yerel çizim alanı tahsis et
    mov eax, [edi]
    add edi, 4
    lea ecx, [esp]
    push edx                  ; FD koru

    push ecx                  ; tampon adresi
    push eax                  ; tam sayı değeri
    call itoa                 ; libnasm.asm veya data.asm içindeki itoa
    add esp, 8

.L_fmt_w_digits:              ; Stack tepesi = edx (FD)
    lea eax, [esp + 4]        ; Tampon başlangıcı
    push eax
    call strlen
    pop edx                   
    pop edx                   ; FD'yi kurtar

    push ebx                  ; Karakter sayısını sakla
    push edx

    push eax
    lea ecx, [esp + 12]       ; Tampon adresi
    push ecx
    push edx
    call write
    add esp, 12

    pop edx
    pop ebx
    add ebx, eax
    add esp, 32
    inc esi
    jmp .L_parse_loop

align 4

.L_fmt_hex:
    mov eax, 16               ; Onaltılık taban
.L_fmt_hex_u:
    sub esp, 32
    lea ecx, [esp]
    push edx                  ; FD koru
    push eax                  ; Taban değeri (16 veya 10)
    push ecx
    mov eax, [edi]
    add edi, 4
    push eax
    call itoab                ; libnasm.asm veya data.asm içindeki itoab
    add esp, 12

    jmp .L_fmt_w_digits

align 4

.L_fmt_unsigned:
    mov eax, 10               ; Onluk taban (Unsigned)
    jmp .L_fmt_hex_u

.L_parse_done:
    mov eax, ebx              ; EAX = Yazılan final karakter sayısı
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

; --- Gömülü Statik String Verileri (Flat Çalışma Zamanı İçin Kod Segmentinde) ---
align 4
.L_null_str:
    db "(null)", 0

align 4

; =============================================================================
; C Fonksiyonu: void itoa(int value, char *str)
; Açıklama:     İşaretli 32-bit bir tam sayıyı (int) 10 tabanında null ile
;               biten bir dizeye (string) dönüştürür.
; Giriş (Stack):[ESP + 4] = İşaretli sayı değeri (value)
;               [ESP + 8] = Hedef karakter tampon adresi (str)
; Çıkış:        Yok (Veri doğrudan tampona yazılır)
; =============================================================================
itoa:
    push ebp
    mov ebp, esp
    push ebx                ; cdecl kuralları gereği EBX register'ını koru
    push esi                ; Tersten sıralama sınırı için ESI'yi koru
    push edi                ; Tampon gezintisi için EDI'yi koru

    mov eax, [ebp + 8]      ; eax = işlenecek tam sayı değeri
    mov edi, [ebp + 12]     ; edi = hedef karakter tamponu işaretçisi
    mov esi, edi            ; esi = geri dönüş sınırı için tampon başı yedeği

    test eax, eax
    jns .L_itoa_positive    ; Sayı pozitifse eksi işareti ekleme adımını atla
    
    ; Sayı negatif: eksi karakterini yerleştir ve sayıyı pozitife çevir
    mov byte [edi], '-'
    inc edi
    inc esi                 ; Geri döndürme sınırını eksi işaretinin önüne kaydır
    neg eax                 ; Sayıyı mutlak değerine ulaştır

.L_itoa_positive:
    mov ebx, 10             ; Bölen taban değeri = 10

.L_itoa_loop:
    xor edx, edx            ; 32-bit bölme öncesi EDX üst kısmını temizle
    div ebx                 ; eax = bölüm, edx = kalan (rakam)
    add dl, '0'             ; Kalan rakamı ASCII karakter koduna dönüştür
    mov [edi], dl           ; Karakteri tampona yaz
    inc edi                 ; Tampon işaretçisini ilerlet
    test eax, eax           ; Bölüm sıfıra ulaştı mı?
    jnz .L_itoa_loop        ; Kalan basamaklar varsa döngüye devam et

    mov byte [edi], 0       ; String sonuna null terminator ekle
    dec edi                 ; edi artık son geçerli rakam karakterini gösterir

    ; Tersten üretilen basamakları bellek üzerinde yerinde (in-place) düzelt
.L_itoa_reverse:
    cmp esi, edi            ; İşaretçiler karşılaştı mı veya çakıştı mı?
    jge .L_itoa_done        ; Sıralama tamamlandı
    mov al, [esi]           ; Sol taraftaki karakteri al
    mov bl, [edi]           ; Sağ taraftaki karakteri al
    mov [esi], bl           ; Sağdakini sola yaz
    mov [edi], al           ; Soldakini sağa yaz
    inc esi                 ; Sol işaretçiyi ileri kaydır
    dec edi                 ; Sağ işaretçiyi geri kaydır
    jmp .L_itoa_reverse

.L_itoa_done:
    pop edi                 ; Register durumlarını geri yükle
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; =============================================================================
; C Fonksiyonu: void itoab(unsigned int value, char *str, int base)
; Açıklama:     İşaretsiz bir tam sayıyı 2 ile 16 arasındaki herhangi bir 
;               tabanda null ile biten alphanumeric bir string dizesine çevirir.
; Giriş (Stack):[ESP + 4] = İşaretsiz sayı değeri (value)
;               [ESP + 8] = Hedef karakter tampon adresi (str)
;               [ESP + 12] = Dönüştürülecek taban değeri (base: 2..16)
; Çıkış:        Yok
; =============================================================================
itoab:
    push ebp
    mov ebp, esp
    push ebx                ; EBX register'ını cdecl uyarınca koru
    push esi                ; ESI sıralama sınır register'ını koru
    push edi                ; EDI tampon yordam register'ını koru

    mov eax, [ebp + 8]      ; eax = işaretsiz tam sayı değeri
    mov edi, [ebp + 12]     ; edi = hedef karakter tampon işaretçisi
    mov ecx, [ebp + 16]     ; ecx = taban / radiks değeri (Örn: 2, 8, 10, 16)
    mov esi, edi            ; esi = tampon başlangıç adresi yedeği

    ; Taban doğruluğu sınır emniyet kontrolleri
    cmp ecx, 2
    jl .L_itoab_invalid     ; Taban 2'den küçükse varsayılan tabana zorla
    cmp ecx, 16
    jg .L_itoab_invalid     ; Taban 16'dan büyükse varsayılan tabana zorla
    jmp .L_itoab_loop

.L_itoab_invalid:
    mov ecx, 10             ; Hata durumunda güvenli taban olarak 10'u dayat

.L_itoab_loop:
    xor edx, edx            ; Üst bölünen register'ını temizle
    div ecx                 ; eax = bölüm, edx = kalan
    
    ; Kalanı alphanumeric (0-9, a-f) hex karakter aralığına eşle
    cmp dl, 9
    ja .L_itoab_alpha       ; Eğer kalan 9'dan büyükse harf basamağına (a-f) dallan
    add dl, '0'             ; 0-9 aralığını ASCII '0'-'9' aralığına taşı
    jmp .L_itoab_store

.L_itoab_alpha:
    add dl, 'a' - 10        ; 10-15 aralığını küçük harf ASCII 'a'-'f' aralığına taşı

.L_itoab_store:
    mov [edi], dl           ; Üretilen alphanumeric sembolü tampona yaz
    inc edi                 ; İşaretçiyi ilerlet
    test eax, eax           ; Bölüm mutlak sıfıra ulaştı mı?
    jnz .L_itoab_loop

    mov byte [edi], 0       ; Dize sonuna null terminator iliştir
    dec edi                 ; edi artık son geçerli alphanumeric karakteri gösterir

    ; Tersten doldurulan tampon dizesini yerinde yönsel olarak düzelt
.L_itoab_reverse:
    cmp esi, edi            ; İşaretçilerin çakışma durumunu doğrula
    jge .L_itoab_done
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    inc esi
    dec edi
    jmp .L_itoab_reverse

.L_itoab_done:
    pop edi                 ; Orijinal register durumlarını kurtar
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; =============================================================================
; C Fonksiyonu: int sprintf(char *str, const char *format, ...)
; Açıklama:     Hedef bellek tamponuna (str) biçimlendirilmiş dize yazar.
; Giriş (Stack):[ESP + 4] = Hedef tampon bellek adresi (str)
;               [ESP + 8] = Biçimlendirme format dizesi (format)
; Çıkış:        EAX = Tampona yazılan toplam karakter sayısı
; =============================================================================
sprintf:
    push ebp
    mov ebp, esp
    lea eax, [ebp + 16]     ; Değişken argüman listesinin başlangıç adresi (...)
    push eax                ; Parametre 3: format listesi (ap)
    push dword [ebp + 12]   ; Parametre 2: format dizesi
    push dword [ebp + 8]    ; Parametre 1: hedef bellek tamponu (str)
    call _sprint            ; Boyut sınır korumalı dize yazım motorunu tetikle
    add esp, 12             ; Yığın alanını temizle
    pop ebp
    ret

align 4

; =============================================================================
; C Fonksiyonu: int snprintf(char *str, size_t size, const char *format, ...)
; Açıklama:     Maksimum size sınırı korumasıyla hedef bellek tamponuna 
;               biçimlendirilmiş dize yazar, taşmaları (buffer overflow) önler.
; Giriş (Stack):[ESP + 4] = Hedef tampon bellek adresi (str)
;               [ESP + 8] = Maksimum yazılacak alan boyutu (size)
;               [ESP + 12] = Biçimlendirme format dizesi (format)
; Çıkış:        EAX = Sınır dahilinde tampona yazılan karakter sayısı
; =============================================================================
snprintf:
    push ebp
    mov ebp, esp
    push edi
    push esi
    push ebx

    lea eax, [ebp + 20]     ; Değişken argüman listesi başı (...)
    push eax                ; 4. Parametre: args listesi (ap)
    push dword [ebp + 16]   ; 3. Parametre: fmt (Format String)
    push dword [ebp + 12]   ; 2. Parametre: size (Maksimum Sınır Değeri)
    push dword [ebp + 8]    ; 1. Parametre: buf (Hedef Tampon Bellek)
    
    call _sprint            ; Güvenli dize motoruna pasla
    add esp, 16             ; Yığın temizliği
    
    pop ebx
    pop esi
    pop edi
    pop ebp
    ret

align 4

; =============================================================================
; İç Motor: int _sprint(char *buf, size_t size, const char *fmt, va_list ap)
; Açıklama:     sprintf ve snprintf fonksiyonlarının bellek taşma korumalı 
;               ana dize biçimlendirme düzeneğidir.
; =============================================================================
_sprint:
    push ebp
    mov ebp, esp
    push edi
    push esi
    push ebx
    push ecx
    push edx

    mov edi, [ebp + 8]        ; EDI = Hedef Tampon Adresi (buf)
    mov edx, [ebp + 12]       ; EDX = Maksimum Boyut Sınırı (size)
    mov esi, [ebp + 16]       ; ESI = Biçimlendirme Format String'i
    mov ebx, [ebp + 20]       ; EBX = Argüman listesi pointer yedeği
    xor ecx, ecx              ; ECX = Tampona yazılan anlık karakter sayacı

    test edx, edx
    jz .L_s_done              ; Eğer sınır boyutu 0 ise hiçbir işlem yapmadan çık
    dec edx                   ; Son null terminator için 1 byte'lık emniyet marjı ayır

.L_s_char_loop:
    cmp ecx, edx              ; Emniyet Kalkanı: Sınır doldu mu?
    jae .L_s_done             ; Dolduysa karakter yazmayı durdur ve kapatmaya git

    lodsb                     ; AL = *ESI++ (Format string'inden oku)
    test al, al
    jz .L_s_done              ; Null-terminator (0) ise string bitti demektir, çık

    cmp al, '%'               ; Biçimlendirme belirteci kontrolü
    je .L_s_parse_specifier

.L_s_write_char:
    stosb                     ; *EDI++ = AL (Karakteri tampona aktar)
    inc ecx
    jmp .L_s_char_loop

align 4

.L_s_parse_specifier:
    lodsb                     ; '%' sembolünden sonraki asıl belirteci oku
    test al, al
    jz .L_s_done

    cmp al, 's'               ; String belirteci
    je .L_s_fmt_string
    cmp al, 'd'               ; Signed Integer belirteci
    je .L_s_fmt_integer
    cmp al, 'x'               ; Küçük harf Hex belirteci
    je .L_s_fmt_hex_lower
    cmp al, 'X'               ; Büyük harf Hex belirteci
    je .L_s_fmt_hex_upper
    cmp al, '%'               ; '%%' -> Kaçış senaryosu
    je .L_s_write_char

    cmp al, 'u'               ; Unsigned Integer belirteci
    je .L_s_fmt_integer

.L_s_unknown_format:
    ; Tanımlanamayan belirteçlerde taşma korumalı ham geri yazım adımı
    cmp ecx, edx
    jae .L_s_done
    mov byte [edi], '%'       ; '%' işaretini tampona iade et
    inc edi
    inc ecx
    
    cmp ecx, edx
    jae .L_s_done
    stosb                     ; Bilinmeyen karakteri bas (Örn: '%0')
    inc ecx
    add ebx, 4                ; Argüman yığınını hizalı tutmak için ilerlet
    jmp .L_s_char_loop

align 4

.L_s_fmt_string:
    push esi
    mov esi, [ebx]            ; ESI = İlgili string parametresinin gerçek adresi
    add ebx, 4                ; Bir sonraki argümana geç
    test esi, esi
    jnz .L_s_copy_str_loop
.L_s_fmt_str_end:
    pop esi
    jmp .L_s_char_loop
.L_s_copy_str_loop:
    cmp ecx, edx              ; Karakter kopyalama esnasında taşma kalkanı
    jae .L_s_fmt_str_end
    lodsb
    test al, al
    jz .L_s_fmt_str_end
    stosb
    inc ecx
    jmp .L_s_copy_str_loop

align 4

.L_s_fmt_integer:
    push eax
    push edx
    mov eax, [ebx]            ; Integer değerini yükle
    add ebx, 4                ; Argüman pointer'ını ilerlet

    cmp eax, 0
    jge .L_s_pos_int

    cmp byte [esp + 4], 'u'   ; Unsigned integer kontrolü (esp+4 üzerinden korunan EAX)
    je .L_s_pos_int

    ; Negatif sayı yazım taşma koruması
    cmp ecx, [ebp + 12]       ; EBP üzerinden orijinal edx/size sınırını kontrol et
    jae .L_s_int_overflow_skip

    neg eax
    mov byte [edi], '-'       ; Negatif işaretini tampona ekle
    inc edi
    inc ecx

.L_s_pos_int:
    push ecx                  ; Genel karakter sayacını koru
    xor ecx, ecx              ; Basamak sayacı

.L_s_div_loop:
    xor edx, edx
    push ebx
    mov ebx, 10
    div ebx                   ; EAX = Bölüm, EDX = Kalan
    pop ebx
    push edx                  ; Kalan rakamı yığına it
    inc ecx
    test eax, eax
    jnz .L_s_div_loop

    mov edx, ecx

.L_s_pop_int_loop:
    pop eax

    ; Tampon sınırı kontrolü yaparak rakamları bas
    push ebx
    mov ebx, [esp + 8]        ; Yığından korunan genel sayacı çek (+offset ayarı)
    add ebx, ecx
    cmp ebx, [ebp + 12]       ; Sınır aşıldı mı?
    pop ebx
    jae .L_s_skip_digit

    add al, 48                ; '0' karakterine dönüştür
    stosb

.L_s_skip_digit:
    dec edx
    jnz .L_s_pop_int_loop

    pop edx                   ; Genel sayacı geri yükle
    add ecx, edx

.L_s_int_overflow_skip:
    pop edx
    pop eax
    jmp .L_s_char_loop

align 4

.L_s_fmt_hex_lower:
    push 0		      ; Küçük harf bayrağı
    jmp .L_s_process_hex

.L_s_fmt_hex_upper:
    push 1                    ; Büyük harf bayrağı

.L_s_process_hex:
    push eax
    push ecx
    mov eax, [ebx]
    add ebx, 4
    mov ecx, 8                ; 32-bit hex için en çok 8 basamak

.L_s_hex_loop:
    rol eax, 4
    push eax

    and al, 15
    cmp al, 10
    jae .L_s_hex_alpha
    add al, 48
    jmp .L_s_hex_write

.L_s_hex_alpha:
    sub al, 10
    mov edx, [esp + 12]
    test edx, edx
    jz .L_s_hex_low_alpha
    add al, 'A'	              ; Büyük harf hex (A-F)
    jmp .L_s_hex_write
.L_s_hex_low_alpha:
    add al, 'a'               ; Küçük harf hex (a-f) 

.L_s_hex_write:
    ; Hex basarken taşma kontrolü
    push ebx
    mov ebx, [esp + 12]       ; Güncel sayacı oku
    cmp ebx, [ebp + 12]       ; Sınır kontrolü
    pop ebx
    jae .L_s_hex_skip_store

    stosb
    inc dword [esp + 4]       ; Yığındaki ECX sayacını güncelle

.L_s_hex_skip_store:
    pop eax
    dec ecx
    jnz .L_s_hex_loop

    pop ecx
    pop eax
    add esp, 4
    jmp .L_s_char_loop

.L_s_done:
    mov byte [edi], 0         ; Güvenli ve kesin NULL sonlandırma
    mov eax, ecx              ; Yazılan karakter sayısını döndür

    pop edx
    pop ecx
    pop ebx
    pop esi
    pop edi
    pop ebp
    ret

