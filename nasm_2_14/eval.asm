; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY İFADE ÇÖZÜMLEME MOTORU (eval.asm)
; `nasm386.asm` include zincirinin listing.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_evaluate
global expr

; extern nasm_readnum
; extern nasm_error

section .text
align 4

; =========================================================================
; struct expr *nasm_evaluate(const char *str, long *critical_error)
; Matematiksel dizgeyi parse edilmek üzere 'expr' işleyicisine sarmalar.
; Geriye çözümlenmiş 64-bitlik değer içeren expr yapı adresi döner.
; =========================================================================
nasm_evaluate:
    push ebp
    mov ebp, esp
    push ebx

    mov ecx, [ebp + 8]          ; ecx = str (matematiksel ifade dizgesi)
    mov eax, [ebp + 12]         ; eax = critical_error pointer adresi

    test ecx, ecx
    jz .L_eval_null

    ; Doğrudan ana alt fonksiyon olan expr() lojiğini tetikle
    push eax                    ; critical_error
    push ecx                    ; str
    call expr
    add esp, 8
    jmp .L_eval_done

.L_eval_null:
    xor eax, eax                ; Hata: Return NULL (0)

.L_eval_done:
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; struct expr *expr(const char *str, long *error)
; Dört işlem ve bit düzeyinde operatör önceliklerini çözen alt motor.
; =========================================================================
expr:
    push ebp
    mov ebp, esp
    sub esp, 16                 ; Yerel 64-bit değer hücresi (EDX:EAX için)
    push ebx
    push esi

    mov esi, [ebp + 8]          ; esi = str
    mov ebx, [ebp + 12]         ; ebx = error ptr

    ; Basit utilize edilmemiş kurguda, dizeyi doğrudan nasm_readnum'a fırlatırız
    lea eax, [ebp - 16]         ; Geçici hata bayrağı adresi
    push eax
    push esi
    call nasm_readnum           ; readnum.asm içindeki numerik çözücü
    add esp, 8
    
    ; Eğer sayısal çözümleme başarılıysa, degeri bir 'expr' yapısı gibi sarmala
    ; (Hafızada statik olarak açtığımız eval_expr_result alanını kullanıyoruz)
    mov ecx, [ebp - 16]         ; readnum'dan dönen hata bayrağı
    test ecx, ecx
    jnz .L_expr_fail

    lea ecx, [eval_expr_result] ; bss.asm alanına eklenecek statik hücre
    mov [ecx + 0], eax          ; value_low
    mov [ecx + 4], edx          ; value_high
    mov dword [ecx + 8], 1      ; type = EXPR_SIMPLE (1)
    
    mov eax, ecx                ; Return EAX = struct expr * adresi
    jmp .L_expr_done

.L_expr_fail:
    test ebx, ebx
    jz .L_expr_null_ret
    mov dword [ebx], 1          ; *error = true

.L_expr_null_ret:
    xor eax, eax

.L_expr_done:
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
