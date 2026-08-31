; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY ENUM HATA KONTROL MODÜLÜ (badenum.asm)
; `nasm386.asm` include zincirinin perfhash.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_bad_enum_check

; extern nasm_error

section .text
align 4

; =========================================================================
; void nasm_bad_enum_check(const char *file, int line, int value)
; Enum sınır taşmalarını yakalar ve kritik panic hatası tetikler.
; =========================================================================
nasm_bad_enum_check:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 8]          ; esi = file (Hatanın oluştuğu kaynak dosya adı)
    mov ecx, [ebp + 12]         ; ecx = line (Hatanın satır numarası)
    mov ebx, [ebp + 16]         ; ebx = value (Hatalı enum/sınır değeri)

    ; Kritik hata mesajını yığına dürüstçe dizip nasm_error katmanına fırlatıyoruz
    ; nasm_error(ERR_PANIC, "invalid enum value %d at %s:%d", value, file, line)
    
    ; NOT: Utilize edilmemiş ara kod aşamasında, doğrudan merkezi hata motorunu
    ; tetiklemek adına parametreleri hazırlarız.
    
    push ecx                    ; Arg 4: line
    push esi                    ; Arg 3: file
    push ebx                    ; Arg 2: value
    
    extern bad_enum_panic_msg   ; data.asm'e eklenecek
    push bad_enum_panic_msg     ; Arg 1: Biçimlendirilmiş dize
    push 2                      ; ERR_PANIC = 2 (Kritik çöküş kodu)
    
    call nasm_error
    add esp, 20                 ; 5 parametrelik yığın temizliği

    pop esi
    pop ebx
    pop ebp
    ret

