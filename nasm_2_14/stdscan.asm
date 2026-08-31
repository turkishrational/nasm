; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY STANDART KELİME TARAYICI (stdscan.asm)
; `nasm386.asm` include zincirinin exprdump.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_stdscan_init
global nasm_stdscan_next

; extern isspace
; extern isdigit
; extern isalpha

section .text
align 4

; =========================================================================
; void nasm_stdscan_init(const char *str)
; Tarayıcı motorun okuma imlecini dizgenin başlangıcına odaklar.
; =========================================================================
nasm_stdscan_init:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp + 8]          ; eax = str pointer adresi
    mov dword [scan_ptr_storage], eax ; BSS alanındaki imleç hücresine mühürle

    pop ebp
    ret

align 4

; =========================================================================
; int nasm_stdscan_next(void)
; Sıradaki simgeyi (token) tarar, türünü veya ASCII kodunu geri döner.
; =========================================================================
nasm_stdscan_next:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, dword [scan_ptr_storage] ; ebx = mevcut tarama imleci
    test ebx, ebx
    jz .L_scan_eof

.L_scan_skip_ws:
    xor eax, eax
    mov al, byte [ebx]
    test al, al
    jz .L_scan_eof_clear        ; Null terminator geldiyse dosya/satır sonudur

    push eax
    call isspace                ; Boşlukları atla
    add esp, 4
    test eax, eax
    jz .L_check_special_chars
    inc ebx
    jmp .L_scan_skip_ws

.L_check_special_chars:
    mov al, byte [ebx]
    inc ebx                     ; İmleci bir sonraki karakter için şimdiden kaydır
    mov dword [scan_ptr_storage], ebx

    ; Özel karakter denetimleri (Virgül, köşeli parantez, vb.)
    cmp al, ','
    je .L_return_char
    cmp al, '['
    je .L_return_char
    cmp al, ']'
    je .L_return_char
    cmp al, '+'
    je .L_return_char
    cmp al, '-'
    je .L_return_char
    cmp al, '*'
    je .L_return_char
    cmp al, '/'
    je .L_return_char

    ; Eğer düz bir harf veya rakamsa genel bir simge kodu dön (TOKEN_ID = 999)
    mov eax, 999
    jmp .L_scan_done

.L_return_char:
    xor edx, edx
    mov dl, al
    mov eax, edx                ; Karakterin kendi ASCII kodunu dön (Kestirme yol)
    jmp .L_scan_done

.L_scan_eof_clear:
    mov dword [scan_ptr_storage], 0
.L_scan_eof:
    mov eax, -1                 ; Tarama sonu (EOF): Return -1

.L_scan_done:
    pop ebx
    pop ebp
    ret
