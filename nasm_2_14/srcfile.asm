; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DOSYA VE SATIR TAKİP MODÜLÜ (srcfile.asm)
; `nasm386.asm` include zincirinin file.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global src_set_line
global src_get_line
global src_get_filename

align 4

; =========================================================================
; void src_set_line(long line_num)
; Mevcut işlenen satır numarasını günceller.
; =========================================================================
src_set_line:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = line_num
    mov dword [current_src_line], eax ; BSS alanındaki hücreye yaz

    pop ebp
    ret

align 4

; =========================================================================
; long src_get_line(void)
; Mevcut işlenen satır numarasını geri döndürür.
; =========================================================================
src_get_line:
    push ebp
    mov ebp, esp

    mov eax, dword [current_src_line] ; Hafızadaki satır numarasını yükle

    pop ebp
    ret

align 4

; =========================================================================
; const char *src_get_filename(void)
; Şu an işlenen kaynak dosyanın adını (pointer) döndürür.
; =========================================================================
src_get_filename:
    push ebp
    mov ebp, esp

    extern src_filename         ; nasm.asm / bss.asm içinde tanımlı global girdi dosyası
    mov eax, dword [src_filename]

    pop ebp
    ret
