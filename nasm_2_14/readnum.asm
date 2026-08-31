; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY SAYISAL SABİT PARSER MODÜLÜ (readnum.asm)
; `nasm386.asm` include zincirinin zerobuf.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_readnum
global nasm_is_num

section .text
align 4

; =========================================================================
; C Fonksiyonu: int64_t nasm_readnum(const char *str, bool *error)
; Açıklama:     Dizge (string) halindeki sayısal sabitleri (Hex, Dec, Oct, Bin)
;               çözer ve 64-bit tam sayı değerine dönüştürür.
; Giriş (Stack):[ESP + 4] = Dosya yolu string adresi (str)
;               [ESP + 8] = Hata durumunu döndüren pointer (error)
; Çıkış:        EDX:EAX = 64-bit çözümlenmiş sayısal değer (int64_t)
; =========================================================================
nasm_readnum:
    push ebp
    mov ebp, esp
    sub esp, 16                 ; Yerel değişkenler için yığında alan aç ([ebp-4]=len, [ebp-8]=radix)
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]          ; esi = kaynak string (str) pointer adresi
    mov edi, [ebp + 12]         ; edi = bool *error pointer adresi

    ; İlk başta hata durumunu temizle (varsayılan: error = false)
    test edi, edi
    jz .L_check_empty
    mov byte [edi], 0

.L_check_empty:
    test esi, esi
    jz .L_error_return
    cmp byte [esi], 0
    je .L_error_return

    ; String uzunluğunu (len) hesaplama döngüsü
    xor ecx, ecx                ; ecx = uzunluk sayacı (len)
.L_len_loop:
    cmp byte [esi + ecx], 0     ; Karakter string sonu (NULL) mu?
    jz .L_len_done              ; NULL ise uzunluk hesaplaması bitti
    inc ecx                     ; Sayacı artır
    jmp .L_len_loop             ; Doğru Dallanma: Döngünün başına geri dön
.L_len_done:
    mov [ebp - 4], ecx          ; Hesaplanan uzunluğu yerel değişkene ([ebp-4]) kaydet

    ; Taban (Radix) Belirleme Adımları
    mov dword [ebp - 8], 10     ; Varsayılan taban değeri = 10 (Decimal)
    
    ; 1. Adım: Önek (Prefix) Kontrolleri (0x, 0h, 0b, 0q)
    cmp ecx, 2
    jl .L_check_suffix          ; 2 karakterden kısa ise önek olamaz, sonek kontrolüne geç
    cmp byte [esi], '0'
    jne .L_check_suffix         ; İlk karakter '0' değilse önek olamaz
    
    mov al, byte [esi + 1]
    cmp al, 'x'
    je .L_prefix_hex
    cmp al, 'X'
    je .L_prefix_hex
    cmp al, 'h'
    je .L_prefix_hex
    cmp al, 'H'
    je .L_prefix_hex
    cmp al, 'b'
    je .L_prefix_bin
    cmp al, 'B'
    je .L_prefix_bin
    cmp al, 'q'
    je .L_prefix_oct
    cmp al, 'Q'
    je .L_prefix_oct
    jmp .L_check_suffix

.L_prefix_hex:
    mov dword [ebp - 8], 16     ; Tabanı 16 (Hex) yap
    add esi, 2                  ; "0x" önekini geçmek için string'i 2 byte ilerlet
    sub dword [ebp - 4], 2      ; Kalan uzunluğu 2 byte düş
    jmp .L_start_parse

.L_prefix_bin:
    mov dword [ebp - 8], 2      ; Tabanı 2 (Binary) yap
    add esi, 2
    sub dword [ebp - 4], 2
    jmp .L_start_parse

.L_prefix_oct:
    mov dword [ebp - 8], 8      ; Tabanı 8 (Octal) yap
    add esi, 2
    sub dword [ebp - 4], 2
    jmp .L_start_parse

.L_check_suffix:
    ; 2. Adım: Sonek (Suffix) Kontrolleri (h, q, o, b, d)
    mov ecx, [ebp - 4]          ; Güncel uzunluğu al
    mov al, byte [esi + ecx - 1] ; String'in en sonundaki karakteri yükle
    
    cmp al, 'h'
    je .L_suffix_hex
    cmp al, 'H'
    je .L_suffix_hex
    cmp al, 'q'
    je .L_suffix_oct
    cmp al, 'Q'
    je .L_suffix_oct
    cmp al, 'o'
    je .L_suffix_oct
    cmp al, 'O'
    je .L_suffix_oct
    cmp al, 'b'
    je .L_suffix_bin
    cmp al, 'B'
    je .L_suffix_bin
    cmp al, 'd'
    je .L_suffix_dec
    cmp al, 'D'
    je .L_suffix_dec
    jmp .L_start_parse          ; Belirgin bir sonek yoksa varsayılan taban (10) geçerlidir

.L_suffix_hex:
    mov dword [ebp - 8], 16     ; Hex tabanı
    dec dword [ebp - 4]         ; Sonek karakterini uzunluktan düş
    jmp .L_start_parse
.L_suffix_oct:
    mov dword [ebp - 8], 8      ; Octal tabanı
    dec dword [ebp - 4]
    jmp .L_start_parse
.L_suffix_bin:
    mov dword [ebp - 8], 2      ; Binary tabanı
    dec dword [ebp - 4]
    jmp .L_start_parse
.L_suffix_dec:
    mov dword [ebp - 8], 10     ; Dec tabanı
    dec dword [ebp - 4]

.L_start_parse:
    ; 3. Adım: Matematiksel Çözümleme ve 64-bit Akümülasyon Döngüsü
    xor ebx, ebx                ; ebx = Çözümlenen Sonuç Düşük Dword (Value Low)
    xor edx, edx                ; edx = Çözümlenen Sonuç Yüksek Dword (Value High)
    mov ecx, [ebp - 4]          ; ecx = Döngü sayacı (kalan net karakter uzunluğu)
    test ecx, ecx
    jz .L_error_return          ; Eğer işlenecek karakter yoksa hata döndür

.L_parse_loop:
    xor eax, eax
    mov al, byte [esi]          ; Sıradaki karakteri oku
    
    ; ASCII karakter değerini sayısal değere (0-15) dönüştür
    cmp al, '0'
    jl .L_error_return
    cmp al, '9'
    jle .L_char_is_digit
    cmp al, 'a'
    jl .L_char_upper
    cmp al, 'f'
    jg .L_error_return
    sub al, 'a'
    add al, 10
    jmp .L_check_radix_limit
.L_char_upper:
    cmp al, 'A'
    jl .L_error_return
    cmp al, 'F'
    jg .L_error_return
    sub al, 'A'
    add al, 10
    jmp .L_check_radix_limit
.L_char_is_digit:
    sub al, '0'

.L_check_radix_limit:
    cmp eax, [ebp - 8]          ; Karakter değeri seçilen taban sınırını aşıyor mu?
    jge .L_error_return         ; Örn: Decimal modda 'A' gelmesi veya Binary modda '2' gelmesi hatadır

    ; 64-bit Matematiksel Genişletme: value = (value * radix) + digit
    ; Register Dağılımı: EDX:EBX 64-bit değerimizi tutar.
    push eax                    ; Yeni gelen rakam değerini yığında sakla
    
    ; Önce yüksek dword kısmını taban ile çarp: EDX = EDX * Radix
    mov eax, edx
    mul dword [ebp - 8]
    mov edi, eax                ; EDI = yüksek dword çarpım sonucu yedeği
    
    ; Şimdi düşük dword kısmını taban ile çarp: EDX:EAX = EBX * Radix
    mov eax, ebx
    mul dword [ebp - 8]         ; EDX:EAX sonuç üretir
    
    ; Yeni yüksek dword değerini oluştur: Yeni_EDX = Eski_EBX_çarpım_EDX + EDI
    add edx, edi
    mov ebx, eax                ; Yeni düşük dword değerini güncelle (EBX = EAX)
    
    pop eax                     ; Saklanan yeni rakam değerini geri yükle
    
    ; 64-bit değerimize yeni rakamı ekle (value += digit)
    add ebx, eax                ; Düşük dword alanına ekle
    adc edx, 0                  ; Eğer düşük dword taşma ürettiyse Carry bayrağını EDX'e aktar
    
    inc esi                     ; String işaretçisini bir sonraki karaktere ilerlet
    dec ecx                     ; Döngü sayacını azalt
    jnz .L_parse_loop           ; Karakterler bitene kadar döngüyü sürdür

    mov eax, ebx                ; Sonuç düşük dword kısmını EAX'a yerleştir
    jmp .L_readnum_done         ; EDX zaten sonuç yüksek dword kısmını içeriyor (64-bit dönüş)

.L_error_return:
    mov edi, [ebp + 12]         ; error pointer adresini yükle
    test edi, edi
    jz .L_fail_val
    mov byte [edi], 1           ; Hata oluştu: *error = true (1)
.L_fail_val:
    xor eax, eax                ; Başarısızlık durumunda 64-bit 0 döndür
    xor edx, edx

.L_readnum_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; =========================================================================
; C Fonksiyonu: bool nasm_is_num(const char *str)
; Açıklama:     Verilen dize ifadesinin geçerli bir sayısal sabit adayı 
;               olup olmadığını denetler.
; Giriş (Stack):[ESP + 4] = Denetlenecek string adresi (str)
; Çıkış:        EAX = 1 (Geçerli sayı ise / true), 0 (Değilse / false)
; =========================================================================
nasm_is_num:
    push ebp
    mov ebp, esp
    push ebx
    
    mov ebx, [ebp + 8]          ; Denetlenecek string (str) adresini yükle
    test ebx, ebx               ; Pointer NULL mı?
    jz .L_is_num_false
    cmp byte [ebx], 0           ; String boş mu?
    je .L_is_num_false

    ; İlk karakterin geçerli bir rakam olup olmadığını isdigit ile doğrula
    xor eax, eax
    mov al, byte [ebx]          ; İlk karakteri yükle
    push eax
    call isspace                ; Eğer boşlukla başlıyorsa atlanabilir veya elenebilir
    add esp, 4
    test eax, eax
    jnz .L_is_num_false

    mov eax, 1                  ; Sayısal sabit adayı doğrulandı: Return true (1)
    jmp .L_is_num_done

.L_is_num_false:
    xor eax, eax                ; Geçersiz dize: Return false (0)

.L_is_num_done:
    pop ebx
    pop ebp
    ret
