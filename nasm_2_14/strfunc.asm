; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY METİN MANİPÜLASYON MODÜLÜ (strfunc.asm)
; `nasm386.asm` include zincirinin stdscan.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

; 31/08/2026 - Google AI
; Güvenli String Karşılaştırma (strfunc.asm)

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_stricmp (C Deklarasyonu: int nasm_stricmp(const char *s1, const char *s2))
; İşlev: İki string'i büyük/küçük harf duyarsız olarak karşılaştırır.
; Girdi: [ESP+4] = s1 (Kaynak string pointer), [ESP+8] = s2 (Hedef direktif string pointer)
; Çıktı: EAX = 0 (Eşit), EAX < 0 (s1 < s2), EAX > 0 (s1 > s2)
; Değişen Register'lar: EAX, ECX, EDX (C standardı gereği serbestçe değiştirilebilir)
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP
; -----------------------------------------------------------------------------
global nasm_stricmp
nasm_stricmp:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp+8]   ; s1 adresini al
    mov edx, [ebp+12]  ; s2 adresini al (Burası nasm_directive_table'dan gelen pointer)

.loop_char:
    mov al, [esi]
    mov bl, [edx]

    ; s1 karakterini küçük harfe standardize et
    cmp al, 'A'
    jl .lower_s2
    cmp al, 'Z'
    jg .lower_s2
    add al, 32

.lower_s2:
    ; s2 karakterini küçük harfe standardize et
    cmp bl, 'A'
    jl .cmp_ready
    cmp bl, 'Z'
    jg .cmp_ready
    add bl, 32

.cmp_ready:
    cmp al, bl
    jne .diff_found

    test al, al
    jz .equal_exit     ; Null terminator ulaşıldı, stringler eşit

    inc esi
    inc edx
    jmp .loop_char

.diff_found:
    movzx eax, al
    movzx ebx, bl
    sub eax, ebx       ; Fark EAX'e aktarılıyor (Çıktı register'ı)
    jmp .exit_func

.equal_exit:
    xor eax, eax       ; Tam eşleşme durumunda EAX = 0

.exit_func:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

