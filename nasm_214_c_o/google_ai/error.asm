; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY MERKEZİ HATA YÖNETİM MODÜLÜ (error.asm)
; `nasm386.asm` include zincirinin iflag.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_error
global nasm_verror

; extern fprintf
; extern src_get_line
; extern src_get_filename
; extern exit
;; extern abort

section .text
align 4

; =========================================================================
; void nasm_error(int severity, const char *fmt, ...)
; Merkezi hata dağıtıcı yordamıdır. Hataları konsola ve loglara yönlendirir.
; =========================================================================
nasm_error:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp + 8]          ; ebx = severity (Hatanın ciddiyet derecesi)
    
    ; İlk önce dosya adı ve satır numarasını ekrana basma hazırlığı yapalım
    call src_get_filename
    mov ecx, eax                ; ecx = mevcut dosya adı string adresi
    test ecx, ecx
    jz .L_err_no_file

    call src_get_line
    mov edx, eax                ; edx = mevcut satır numarası

    ; fprintf(stderr, "%s:%d: ", filename, line) simülasyonu
    push edx
    push ecx
    push err_prefix_fmt         ; data.asm'e eklenecek
    push 2                      ; stderr FD = 2 (+3 zırhı öncesi düz libc FD'si)
    call fprintf
    add esp, 16

.L_err_no_file:
    ; Hatanın asıl gövdesini (fmt ve dinamik argümanları) stderr'e fırlat
    lea eax, [ebp + 12]         ; eax = fmt ve ardışık va_list argümanlarının başlangıcı
    
    ; Basit utilize edilmemiş sarmalda fmt dizesini doğrudan yazdırıyoruz
    mov ecx, [ebp + 12]         ; ecx = fmt string adresi
    push ecx
    push 2                      ; stderr
    call fprintf
    add esp, 8

    ; Yeni satır zorlaması
    push err_lf_str
    push 2
    call fprintf
    add esp, 8

    ; Eğer hata fatal (ERR_FATAL = 1) veya panic (ERR_PANIC = 2) ise süreci durdur
    cmp ebx, 1
    je .L_err_exit
    cmp ebx, 2
    je .L_err_abort
    jmp .L_error_done

.L_err_exit:
    push 1
    call exit

.L_err_abort:
    call abort

.L_error_done:
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; =========================================================================
; void nasm_verror(int severity, const char *fmt, va_list ap)
; Va_list biçimli hata raporlama köprüsüdür.
; =========================================================================
nasm_verror:
    push ebp
    mov ebp, esp
    
    ; Argümanları doğrudan ana nasm_error motoruna aktarıyoruz
    push dword [ebp + 16]       ; ap
    push dword [ebp + 12]       ; fmt
    push dword [ebp + 8]        ; severity
    call nasm_error
    add esp, 12

    pop ebp
    ret
