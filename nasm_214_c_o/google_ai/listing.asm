; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY LİSTELEME SÜRÜCÜSÜ (listing.asm)
; `nasm386.asm` include zincirinin macros.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_list_init
global nasm_list_output
global nasm_list_close

; extern nasm_open_write
; extern nasm_write
; extern nasm_close
; extern sprintf

section .text
align 4

; =========================================================================
; void nasm_list_init(const char *list_filename)
; Belirtilen isimde listeleme dosyasını (+3 FD zırhıyla) oluşturup açar.
; =========================================================================
nasm_list_init:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = list_filename
    test eax, eax
    jz .L_list_init_done

    push 1                      ; NF_PANIC = 1
    push eax
    call nasm_open_write        ; file.asm içindeki korumalı oluşturucu tetiği
    add esp, 8
    mov dword [list_file_ptr], eax ; BSS alanındaki kütüphane işaretçisine yaz

.L_list_init_done:
    pop ebp
    ret

align 4

; =========================================================================
; void nasm_list_output(long offset, const void *bytes, int len, const char *line)
; Adres ve bytecode verilerini biçimlendirerek listeleme dosyasına yazar.
; =========================================================================
nasm_list_output:
    push ebp
    mov ebp, esp
    sub esp, 512                ; 512 byte'lık yerel satır formatlama alanı
    push ebx
    push esi

    mov ebx, dword [list_file_ptr]
    test ebx, ebx
    jz .L_list_out_done         ; Eğer liste dosyası açık değilse işlem yapma, çık

    mov eax, [ebp + 8]          ; offset
    mov esi, [ebp + 20]         ; line (orijinal kaynak kod satırı)

    ; sprintf(local_buf, "%08X %s", offset, line) ile listeleme satırını biçimlendir
    push esi
    push eax
    push list_output_fmt        ; data.asm'e eklenecek
    lea ecx, [ebp - 512]
    push ecx                    ; dest buffer
    call sprintf
    add esp, 16

    ; Oluşan biçimli satırı dosyaya yaz: nasm_write(local_buf, len, fp)
    lea ecx, [ebp - 512]
    push ecx
    ; extern strlen
    push ecx
    call strlen
    add esp, 4                  ; EAX = oluşan satır uzunluğu

    push ebx                    ; fp (LIBC FD)
    push eax                    ; size
    push ecx                    ; buf ptr
    call nasm_write             ; file.asm yerel yazıcısı
    add esp, 12

.L_list_out_done:
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

align 4

; =========================================================================
; void nasm_list_close(void)
; Açık olan listeleme dosyasını güvenle kapatır.
; =========================================================================
nasm_list_close:
    push ebp
    mov ebp, esp

    mov eax, dword [list_file_ptr]
    test eax, eax
    jz .L_list_close_done

    push eax
    call nasm_close             ; file.asm yerel kapatıcısı
    add esp, 4
    mov dword [list_file_ptr], 0 ; İşaretçiyi sıfırla

.L_list_close_done:
    pop ebp
    ret