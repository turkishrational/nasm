; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY KAÇIŞ KARAKTERİ ÇÖZÜMLEME MODÜLÜ (quote.asm)
; `nasm386.asm` include zincirinin preproc.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_quote_string

section .text
align 4

; =========================================================================
; size_t nasm_quote_string(char *dst, const char *src)
; src içindeki tırnaklı ve kaçışlı dizeyi çözer, dst içine yazar.
; Geriye çözülen yeni dizgenin net byte uzunluğunu (length) döner.
; =========================================================================
nasm_quote_string:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov edi, [ebp + 8]          ; edi = dst (hedef)
    mov esi, [ebp + 12]         ; esi = src (kaynak)
    xor ecx, ecx                ; ecx = out_len = 0 (karakter sayacı)

    test esi, esi
    jz .L_quote_done
    mov al, byte [esi]
    test al, al
    jz .L_quote_done

    ; Başlangıç karakteri telt tırnak mı çift tırnak mı hafızaya al
    mov bl, al                  ; bl = quote_char ('"' veya '\'')
    cmp bl, '"'
    je .L_skip_start_quote
    cmp bl, "'"
    je .L_skip_start_quote
    
    ; Eğer tırnakla başlamıyorsa kaçış işlemini düz dize gibi yap
    mov bl, 0                   ; bl = 0 (tırnaksız ham dize)
    jmp .L_process_char

.L_skip_start_quote:
    inc esi                     ; Başlangıç tırnağını hesaptan düş, ilerle

.L_process_char:
    mov al, byte [esi]
    test al, al
    jz .L_finalize_string       ; Dize sonu (null) ise kapat ve çık

    cmp al, bl
    je .L_finalize_string       ; Kapanış tırnağını gördüysek dizeyi başarıyla bitir

    cmp al, '\'                 ; Kaçış (escape) karakteri mi? ('\')
    je .L_handle_escape
    
    ; Düz karakter, aynen hedefe yaz
    mov byte [edi], al
    inc esi
    inc edi
    inc ecx
    jmp .L_process_char

.L_handle_escape:
    inc esi                     ; '\' karakterini geç, sonrasındaki harfe bak
    mov al, byte [esi]
    test al, al
    jz .L_finalize_string       ; Eğer ters slaş ile string bittiyse emniyetli çık

    cmp al, 'n'
    je .L_esc_newline
    cmp al, 't'
    je .L_esc_tab
    cmp al, 'r'
    je .L_esc_carriage
    cmp al, '0'
    je .L_esc_null
    
    ; Tanınmayan veya direkt \', \", \\ durumlarında karakterin kendisini yaz
    jmp .L_write_esc_char

.L_esc_newline:
    mov al, 10                  ; LF (\n)
    jmp .L_write_esc_char

.L_esc_tab:
    mov al, 9                   ; TAB (\t)
    jmp .L_write_esc_char

.L_esc_carriage:
    mov al, 13                  ; CR (\r)
    jmp .L_write_esc_char

.L_esc_null:
    mov al, 0                   ; Null byte (\0)

.L_write_esc_char:
    mov byte [edi], al
    inc esi
    inc edi
    inc ecx
    jmp .L_process_char

.L_finalize_string:
    mov byte [edi], 0           ; Hedef string dizesini null terminator ile mühürle
    mov eax, ecx                ; Return EAX = out_len (Net çözülen dize uzunluğu)

.L_quote_done:
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
