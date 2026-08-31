; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY COFF NESNE ÇIKTI MOTORU (outcoff.asm)
; `nasm386.asm` include zincirinin outbin.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global outcoff

; extern nasm_open_write
; extern nasm_write
; extern nasm_close
; extern nasm_error
; extern out_filename

section .text
align 4

; =========================================================================
; COFF SÜRÜCÜ İŞLEV KÖPRÜLERİ (C ÇAĞRI MODELLİ ARABİRİMLER)
; =========================================================================

; void coff_init(void)
coff_init:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, dword [out_filename]
    test eax, eax
    jz .L_coff_init_fail

    ; Küresel çıktı adını al ve diske yazma modunda aç (+3 LIBC FD zırhıyla)
    push 1                      ; NF_PANIC = 1
    push eax
    call nasm_open_write        ; file.asm yerel dosya oluşturma tetiği
    add esp, 8
    cmp eax, -1
    je .L_coff_init_fail
    
    mov dword [coff_file_handle], eax ; BSS segmentindeki aktif handle alanına kilitle
    
    ; COFF dahili sayaçlarını sıfırla
    mov dword [coff_sect_count], 0
    mov dword [coff_sym_count], 0
    jmp .L_coff_init_done

.L_coff_init_fail:
    push coff_init_err_msg      ; data.asm'e eklenecek
    push 2                      ; ERR_PANIC = 2
    call nasm_error
    add esp, 8

.L_coff_init_done:
    pop ebx
    pop ebp
    ret

align 4

; void coff_output(int32_t sect_id, const void *data, uint32_t len)
coff_output:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 12]         ; esi = data pointer
    mov ecx, [ebp + 16]         ; ecx = len
    mov ebx, dword [coff_file_handle]

    test ebx, ebx
    jz .L_coff_out_done
    test esi, esi
    jz .L_coff_out_done
    test ecx, ecx
    jz .L_coff_out_done

    ; write(handle, data, len) ile COFF bytecode emisyonunu diske mühürle
    push ebx                    ; fp (LIBC FD)
    push ecx                    ; size
    push esi                    ; buf ptr
    call nasm_write             ; file.asm içindeki +3 zırh uyumlu yazıcı
    add esp, 12

.L_coff_out_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; void coff_cleanup(void)
coff_cleanup:
    push ebp
    mov ebp, esp

    mov eax, dword [coff_file_handle]
    test eax, eax
    jz .L_coff_clean_done

    push eax
    call nasm_close             ; file.asm yerel dosya kapatıcısı
    add esp, 4
    mov dword [coff_file_handle], 0

.L_coff_clean_done:
    pop ebp
    ret
