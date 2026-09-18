; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY SIFIR TAMPON DOLGU MODÜLÜ (zerobuf.asm)
; `nasm386.asm` include zincirinin srcfile.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_zerobuf
global nasm_write_zeros

; extern nasm_write

align 4

; =========================================================================
; const void *nasm_zerobuf(size_t *len)
; İsteyen modüllere statik sıfır bloğunun adresini ve sabit boyutu döner.
; =========================================================================
nasm_zerobuf:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = size_t *len (gösterici adresi)
    test eax, eax
    jz .L_zerobuf_addr
    mov dword [eax], 256        ; Sıfır bloğumuzun sabit uzunluğu (256 byte)

.L_zerobuf_addr:
    lea eax, [nasm_static_zerobuf] ; data.asm içine yerleştireceğimiz saf sıfır alanı
    pop ebp
    ret

align 4

; =========================================================================
; void nasm_write_zeros(size_t bytes, FILE *fp)
; Çıktı dosyasına belirtilen miktar kadar sıfır (0x00) dolgusu yazar.
; =========================================================================
nasm_write_zeros:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 8]          ; esi = bytes (yazılacak toplam sıfır miktarı)
    mov ebx, [ebp + 12]         ; ebx = fp (dosya işaretçisi)

    test esi, esi
    jle .L_write_zeros_done

.L_write_loop:
    cmp esi, 256
    jbe .L_write_remainder

    ; Tek seferde 256 byte sıfır yaz (En optimize döngü tetiği)
    push ebx                    ; fp
    push 256                    ; size = 256
    push nasm_static_zerobuf    ; buf ptr
    call nasm_write             ; file.asm içindeki yerel yazıcı
    add esp, 12
    
    sub esi, 256
    jmp .L_write_loop

.L_write_remainder:
    ; Geriye kalan küsurat kadar sıfır yaz
    push ebx                    ; fp
    push esi                    ; kalan byte miktarı
    push nasm_static_zerobuf
    call nasm_write
    add esp, 12

.L_write_zeros_done:
    pop esi
    pop ebx
    mov esp, ebp
    pop ebp
    ret
