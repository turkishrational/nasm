; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY ANA MOTOR MODÜLÜ (nasm.asm) - PARÇA 1 / 3
; `nasm386.asm` include zincirinin crt0.asm'den sonraki ilk halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global main
global src_filename
global out_filename

; extern open
; extern close
; extern printf
; extern fprintf
; extern exit
;; extern nasm_malloc
;; extern nasm_free
;; extern ofmt_find
;; extern preproc_init
;; extern assemble_file
;; extern ver_print

section .text
align 4

; =========================================================================
; ANA GİRİŞ NOKTASI: main(int argc, char **argv)
; =========================================================================
main:
    push ebp
    mov ebp, esp
    sub esp, 32                 ; Yerel değişkenler için alan (flags, vb.)
    push ebx
    push esi
    push edi

    mov ecx, [ebp + 8]          ; ecx = argc
    mov esi, [ebp + 12]         ; esi = argv pointer dizi adresi

    cmp ecx, 2
    jl .L_show_usage            ; Argüman sayısı 2'den az ise kullanım bilgisini göster

    ; İlk argümanı (program adı) geç, gerçek parametrelere odaklan
    add esi, 4
    dec ecx
    mov dword [current_argc], ecx
    mov dword [current_argv], esi

.L_arg_loop:
    mov esi, dword [current_argv]
    mov edi, dword [esi]        ; edi = mevcut argüman string adresi
    test edi, edi
    jz .L_args_done

    cmp byte [edi], '-'         ; Parametre bayrağı mı? ('-')
    je .L_parse_option

    ; Eğer düz bir argümansa girdi dosyası olarak kabul et
    mov dword [src_filename], edi
    jmp .L_next_arg

.L_parse_option:
    inc edi                     ; '-' karakterini geç
    mov al, byte [edi]
    
    cmp al, 'v'                 ; Versiyon sorgusu mu? (-v)
    je .L_opt_version
    cmp al, 'h'                 ; Yardım sorgusu mu? (-h)
    je .L_show_usage
    cmp al, 'o'                 ; Çıktı dosyası belirleme mi? (-o)
    je .L_opt_output
    cmp al, 'f'                 ; Format belirleme mi? (-f)
    je .L_opt_format
    
    jmp .L_next_arg             ; Tanınmayan seçenekleri şimdilik geç

.L_opt_version:
    call ver_print              ; Sürüm bilgisini bas
    push 0
    call exit

.L_opt_output:
    ; -o parametresinden sonraki argüman çıktı dosyası adıdır
    mov ecx, dword [current_argc]
    cmp ecx, 1
    jle .L_missing_arg
    
    mov esi, dword [current_argv]
    add esi, 4                  ; Bir sonraki argümana kaydır
    mov eax, dword [esi]        ; eax = çıktı dosyası adı string adresi
    mov dword [out_filename], eax
    
    ; Argüman sayacını ve işaretçisini güncelle
    add dword [current_argv], 4
    dec dword [current_argc]
    jmp .L_next_arg

.L_opt_format:
    ; -f parametresinden sonraki argüman çıktı formatıdır (bin, elf32, coff)
    mov ecx, dword [current_argc]
    cmp ecx, 1
    jle .L_missing_arg
    
    mov esi, dword [current_argv]
    add esi, 4
    mov eax, dword [esi]        ; eax = format adı string adresi
    
    push eax
    call ofmt_find              ; output/outform.c içindeki format bulucu sürücü
    add esp, 4
    test eax, eax
    jz .L_invalid_format
    mov dword [selected_ofmt], eax ; Seçilen format yapısını kaydet
    
    add dword [current_argv], 4
    dec dword [current_argc]
    jmp .L_next_arg

.L_missing_arg:
    push missing_arg_msg
    push 2                      ; stderr = 2 (TRDOS +3 zırhı öncesi zemin)
    call fprintf
    add esp, 8
    push 1
    call exit

.L_invalid_format:
    push invalid_fmt_msg
    push 2
    call fprintf
    add esp, 8
    push 1
    call exit

.L_next_arg:
    add dword [current_argv], 4
    dec dword [current_argc]
    jg .L_arg_loop

.L_args_done:
    ; Girdi dosyası belirtilmiş mi kontrol et
    mov eax, dword [src_filename]
    test eax, eax
    jz .L_no_input_file

    ; Çıktı formatı seçilmemişse varsayılan formatı (ofmt_bin) ata
    mov eax, dword [selected_ofmt]
    test eax, eax
    jnz .L_validate_output
    
    ; extern ofmt_bin           ; outform.asm katmanındaki flat binary sürücüsü
    lea eax, [ofmt_bin]
    mov dword [selected_ofmt], eax

.L_validate_output:
    ; Çıktı dosyası adı belirtilmemişse varsayılan bir ad üret (örneğin "nasm.out")
    mov eax, dword [out_filename]
    test eax, eax
    jnz .L_init_assembler
    
    lea eax, [default_out_name]
    mov dword [out_filename], eax

.L_init_assembler:
    ; Girdi dosyasını okuma modunda test amaçlı aç (Zırh koruması için wrapper)
    push 0                      ; Mode = Okuma
    push dword [src_filename]
    call open
    add esp, 8
    cmp eax, -1
    je .L_input_open_error
    
    ; Test başarılı, dosyayı kapat (Gerçek okumayı preprocessor/assemble katmanı yapacak)
    push eax
    call close
    add esp, 4

    ; Ön İşlemci (Preprocessor) Motorunu İlklendir
    call preproc_init
    test eax, eax
    jz .L_preproc_failed

    ; Derleme aşamasına geçiş hazırlığı yapılıyor...
    jmp .L_goto_assemble

.L_no_input_file:
    push no_in_file_msg
    push 2                      ; stderr = 2
    call fprintf
    add esp, 8
    call .L_show_usage_stub
    push 1
    call exit

.L_input_open_error:
    push dword [src_filename]
    push in_open_err_msg
    push 2
    call fprintf
    add esp, 12
    push 1
    call exit

.L_preproc_failed:
    push preproc_err_msg
    push 2
    call fprintf
    add esp, 8
    push 1
    call exit

.L_show_usage:
    call .L_show_usage_stub
    push 0
    call exit

; İç yardımcı yordam (Stub) - Kullanım klavuzunu basar
.L_show_usage_stub:
    push usage_msg
    call printf
    add esp, 4
    retn

    ; --- PARÇA 3 BU NOKTADAN İTİBAREN ASSEMBLE MOTORUNU TETİKLEYECEK ---
.L_goto_assemble:
    ; Ana Assembling/Montaj Fonksiyonunu Çağır
    ; assemble_file(src_filename, selected_ofmt)
    push dword [selected_ofmt]
    push dword [src_filename]
    call assemble_file          ; asm/assemble.c içindeki ana işleyici motor
    add esp, 8
    
    mov ebx, eax                ; Dönüş kodunu (success/fail) ebx'e al

    ; Başarılı tamamlama kapanışı
    pop edi
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    xor eax, eax                ; main() başarılı: Return 0
    ret
