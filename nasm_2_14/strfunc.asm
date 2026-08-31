; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY METİN MANİPÜLASYON MODÜLÜ (strfunc.asm)
; `nasm386.asm` include zincirinin stdscan.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

nasm_stricmp:
    push ebp
    mov ebp, esp
    push esi
    push edi

    mov esi, [ebp + 8]          ; s1
    mov edi, [ebp + 12]         ; s2

.L_stricmp_loop:
    mov al, byte [esi]
    mov cl, byte [edi]
    
    ; s1 karakterini tolower/küçük harf yap
    cmp al, 'A'
    jl .L_lower_s2
    cmp al, 'Z'
    jg .L_lower_s2
    add al, 32

.L_lower_s2:
    ; s2 karakterini tolower/küçük harf yap
    cmp cl, 'A'
    jl .L_cmp_chars
    cmp cl, 'Z'
    jg .L_cmp_chars
    add cl, 32

.L_cmp_chars:
    cmp al, cl                  ; 30/08/2026 - HATA DÜZELTİLDİ: "if al != cl" yorum hatası silindi
    jne .L_stricmp_diff
    
    test al, al
    jz .L_stricmp_equal         ; İkisi de null ise ve buraya kadar eşit geldiyse tam eşittir

    inc esi
    inc edi
    jmp .L_stricmp_loop

.L_stricmp_diff:
    xor edx, edx
    xor ebx, ebx                ; 30/08/2026 - HATA DÜZELTİLDİ: b_reg -> ebx yapıldı
    mov dl, al
    mov bl, cl
    sub edx, ebx
    mov eax, edx                ; Return fark değeri
    jmp .L_stricmp_done

.L_stricmp_equal:
    xor eax, eax                ; Tam EBIT: Return 0

.L_stricmp_done:
    pop edi
    pop esi
    pop ebp
    ret

align 4

nasm_strnicmp:
    push ebp
    mov ebp, esp
    push esi
    push edi
    push ebx

    mov esi, [ebp + 8]          ; s1
    mov edi, [ebp + 12]         ; s2
    mov edx, [ebp + 16]         ; edx = n (karşılaştırma sınırı)

.L_strnicmp_loop:
    test edx, edx
    jz .L_strnicmp_equal        ; Sınıra ulaşıldıysa fark yok demektir, çık
    
    mov al, byte [esi]
    mov cl, byte [edi]

    cmp al, 'A'
    jl .L_nicmp_s2
    cmp al, 'Z'
    jg .L_nicmp_s2
    add al, 32

.L_nicmp_s2:
    cmp cl, 'A'
    jl .L_nicmp_cmp
    cmp cl, 'Z'
    jg .L_nicmp_cmp
    add cl, 32

.L_nicmp_cmp:
    cmp al, cl
    jne .L_strnicmp_diff

    test al, al
    jz .L_strnicmp_equal

    inc esi
    inc edi
    dec edx
    jmp .L_strnicmp_loop

.L_strnicmp_diff:
    xor ecx, ecx
    mov cl, byte [edi]
    cmp cl, 'A'
    jl .L_diff_calc
    cmp cl, 'Z'
    jg .L_diff_calc
    add cl, 32                  ; S2 fark düzeltmesi
.L_diff_calc:
    xor edx, edx
    mov dl, al
    xor ebx, ebx
    mov bl, cl
    sub edx, ebx
    mov eax, edx
    jmp .L_strnicmp_done

.L_strnicmp_equal:
    xor eax, eax

.L_strnicmp_done:
    pop ebx
    pop edi
    pop esi
    pop ebp
    ret
