; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY ELF32/64 NESNE ÇIKTI MOTORU (outelf.asm)
; `nasm386.asm` include zincirinin outcoff.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global outelf

; extern nasm_open_write
; extern nasm_write
; extern nasm_close
; extern nasm_error
; extern out_filename

section .text
align 4

; =========================================================================
; ELF SÜRÜCÜ İŞLEV KÖPRÜLERİ (C ÇAĞRI MODELLİ ARABİRİMLER)
; =========================================================================

; void elf_init(void)
elf_init:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, dword [out_filename]
    test eax, eax
    jz .L_elf_init_fail

    ; Küresel çıktı adını al ve diske yazma modunda aç (+3 LIBC FD zırhıyla)
    push 1                      ; NF_PANIC = 1
    push eax
    call nasm_open_write        ; file.asm yerel dosya oluşturma tetiği
    add esp, 8
    cmp eax, -1
    je .L_elf_init_fail
    
    mov dword [elf_file_handle], eax ; BSS segmentindeki aktif handle alanına kilitle
    
    ; ELF dahili sayaçlarını sıfırla
    mov dword [elf_shnum], 0
    mov dword [elf_symnum], 0
    jmp .L_elf_init_done

.L_elf_init_fail:
    push elf_init_err_msg       ; data.asm'e eklenecek
    push 2                      ; ERR_PANIC = 2
    call nasm_error
    add esp, 8

.L_elf_init_done:
    pop ebx
    pop ebp
    ret

align 4

; void elf_output(int32_t sect_id, const void *data, uint32_t len)
elf_output:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 12]         ; esi = data pointer
    mov ecx, [ebp + 16]         ; ecx = len
    mov ebx, dword [elf_file_handle]

    test ebx, ebx
    jz .L_elf_out_done
    test esi, esi
    jz .L_elf_out_done
    test ecx, ecx
    jz .L_elf_out_done

    ; write(handle, data, len) ile ELF bytecode emisyonunu diske mühürle
    push ebx                    ; fp (LIBC FD)
    push ecx                    ; size
    push esi                    ; buf ptr
    call nasm_write             ; file.asm içindeki +3 zırh uyumlu yazıcı
    add esp, 12

.L_elf_out_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; void elf_cleanup(void)
elf_cleanup:
    push ebp
    mov ebp, esp

    mov eax, dword [elf_file_handle]
    test eax, eax
    jz .L_elf_clean_done

    push eax
    call nasm_close             ; file.asm yerel dosya kapatıcısı
    add esp, 4
    mov dword [elf_file_handle], 0

.L_elf_clean_done:
    pop ebp
    ret
