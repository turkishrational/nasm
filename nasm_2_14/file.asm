; =======================================================================
; NASM v2.14.02 - C UYUMLU SAF ASSEMBLY DOSYA I/O KATMANI (file.asm)
; `libc.a` içindeki +3 FD korumalı fonksiyonları doğrudan çağırır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_open_read
global nasm_open_write
global nasm_read
global nasm_write
global nasm_close
global nasm_seek
global nasm_tell

; extern open
; extern read
; extern write
; extern close
; extern lseek
; extern nasm_malloc
; extern nasm_free

section .text
align 4

; FILE *nasm_open_read(const char *filename, enum file_flags flags)
nasm_open_read:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp + 8]          ; ebx = filename

    ; open(filename, 0) -> 0: Read Mode
    push 0                      ; Mode = 0
    push ebx                    ; Filename
    call open
    add esp, 8                  ; EAX = Handle (+3 zırhlı)
    cmp eax, -1
    je .L_open_read_fail

    mov ebx, eax                ; Gelen handle değerini sakla

    ; struct trdos_file için bellek tahsis et (12 byte: handle+offset+eof)
    push 12
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_open_read_fail

    mov [eax + 0], ebx          ; file->handle = handle
    mov dword [eax + 4], 0      ; file->offset = 0
    mov dword [eax + 8], 0      ; file->eof = 0
    jmp .L_open_read_done

.L_open_read_fail:
    xor eax, eax                ; Başarısızlık durumunda Return NULL

.L_open_read_done:
    pop ebx
    pop ebp
    ret

align 4

; FILE *nasm_open_write(const char *filename, enum file_flags flags)
nasm_open_write:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp + 8]          ; ebx = filename

    ; open(filename, 1) -> 1: Write Mode (Sizin libc open.asm içindeki sys_creat tetiği)
    push 1                      ; Mode = 1
    push ebx                    ; Filename
    call open
    add esp, 8                  ; EAX = Handle (+3 zırhlı)
    cmp eax, -1
    je .L_open_write_fail

    mov ebx, eax

    push 12
    call nasm_malloc
    add esp, 4
    test eax, eax
    jz .L_open_write_fail

    mov [eax + 0], ebx          ; file->handle = handle
    mov dword [eax + 4], 0      ; file->offset = 0
    mov dword [eax + 8], 0      ; file->eof = 0
    jmp .L_open_write_done

.L_open_write_fail:
    xor eax, eax

.L_open_write_done:
    pop ebx
    pop ebp
    ret

align 4

; void nasm_read(void *buf, size_t size, FILE *fp)
nasm_read:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]          ; buf
    mov edi, [ebp + 12]         ; size
    mov ebx, [ebp + 16]         ; fp (struct trdos_file pointer)

    test ebx, ebx
    jz .L_read_done
    mov edx, [ebx + 0]          ; edx = file->handle
    cmp edx, -1
    je .L_read_done

    ; read(handle, buf, size) çağrısı
    push edi                    ; count
    push esi                    ; buffer pointer
    push edx                    ; handle
    call read
    add esp, 12

    test eax, eax
    jle .L_read_eof

    ; lseek(handle, 0, 1) ile güncel konumu çek (SEEK_CUR = 1)
    mov edx, [ebx + 0]
    push 1                      ; whence = 1
    push 0                      ; offset = 0
    push edx                    ; handle
    call lseek
    add esp, 12
    mov [ebx + 4], eax          ; file->offset = yeni konum
    jmp .L_read_done

.L_read_eof:
    mov dword [ebx + 8], 1      ; file->eof = 1

.L_read_done:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; void nasm_write(const void *buf, size_t size, FILE *fp)
nasm_write:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov esi, [ebp + 8]          ; buf
    mov edi, [ebp + 12]         ; size
    mov ebx, [ebp + 16]         ; fp

    test ebx, ebx
    jz .L_write_done
    mov edx, [ebx + 0]          ; edx = file->handle
    cmp edx, -1
    je .L_write_done

    ; write(handle, buf, size) çağrısı
    push edi                    ; count
    push esi                    ; buffer pointer
    push edx                    ; handle
    call write
    add esp, 12

    test eax, eax
    jle .L_write_done

    ; lseek ile offseti tazele
    mov edx, [ebx + 0]
    push 1                      ; whence = 1
    push 0                      ; offset = 0
    push edx                    ; handle
    call lseek
    add esp, 12
    mov [ebx + 4], eax          ; file->offset = yeni konum

.L_write_done:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; int nasm_close(FILE *fp)
nasm_close:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx, [ebp + 8]          ; fp
    test ebx, ebx
    jz .L_close_done
    mov edx, [ebx + 0]          ; handle
    cmp edx, -1
    je .L_close_done

    push edx
    call close
    add esp, 4

    push ebx
    call nasm_free
    add esp, 4

.L_close_done:
    xor eax, eax                ; Return 0
    pop ebx
    pop ebp
    ret

align 4

; int nasm_seek(FILE *fp, long offset, int whence)
nasm_seek:
    push ebp
    mov ebp, esp
    push ebx
    push esi
    push edi

    mov ebx, [ebp + 8]          ; fp
    mov esi, [ebp + 12]         ; offset
    mov edi, [ebp + 16]         ; whence

    test ebx, ebx
    jz .L_seek_err
    mov edx, [ebx + 0]          ; handle
    cmp edx, -1
    je .L_seek_err

    ; lseek(handle, offset, whence) çağrısı
    push edi                    ; whence
    push esi                    ; offset
    push edx                    ; handle
    call lseek
    add esp, 12
    cmp eax, -1
    je .L_seek_err

    mov [ebx + 4], eax          ; file->offset = res
    mov dword [ebx + 8], 0      ; file->eof = 0
    xor eax, eax                ; Başarılı: Return 0
    jmp .L_seek_done

.L_seek_err:
    mov eax, -1

.L_seek_done:
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; long nasm_tell(FILE *fp)
nasm_tell:
    push ebp
    mov ebp, esp
    mov eax, [ebp + 8]          ; fp
    test eax, eax
    jz .L_tell_err
    mov eax, [eax + 4]          ; return file->offset
    jmp .L_tell_done

.L_tell_err:
    mov eax, -1

.L_tell_done:
    pop ebp
    ret
