; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY BIT SCAN INVERSE MODÜLÜ (bsi.asm)
; `nasm386.asm` include zincirinin readnum.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_bsi32
global nasm_bsi64

section .text
align 4

; =========================================================================
; int nasm_bsi32(uint32_t v)
; 32-bitlik bir tam sayı içindeki en yüksek bit indeksini (MSB) bulur.
; =========================================================================
nasm_bsi32:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = v
    test eax, eax
    jz .L_bsi32_zero            ; Eğer değer 0 ise -1 dön (hata/bulunamadı)

    ; BSR (Bit Scan Reverse) komutu TCC ve TRDOS 386 için en hızlı kestirmedir.
    bsr eax, eax                ; eax = en yüksek set edilmiş bitin indeksi
    jmp .L_bsi32_done

.L_bsi32_zero:
    mov eax, -1                 ; 0 için indeks tanımsızdır

.L_bsi32_done:
    pop ebp
    ret

align 4

; =========================================================================
; int nasm_bsi64(uint64_t v)
; 64-bitlik bir tam sayı içindeki en yüksek bit indeksini bulur.
; Girdi yığında yan yana iki dword olarak (düşük: [ebp+8], yüksek: [ebp+12]) durur.
; =========================================================================
nasm_bsi64:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 12]         ; eax = v_high (Yüksek 32-bit)
    test eax, eax
    jz .L_bsi64_low             ; Eğer yüksek kısım 0 ise düşük kısma bak

    bsr eax, eax
    add eax, 32                 ; Yüksek kısımda bulundu, indekse 32 ekle
    jmp .L_bsi64_done

.L_bsi64_low:
    mov eax, [ebp + 8]          ; eax = v_low (Düşük 32-bit)
    test eax, eax
    jz .L_bsi64_zero

    bsr eax, eax
    jmp .L_bsi64_done

.L_bsi64_zero:
    mov eax, -1

.L_bsi64_done:
    pop ebp
    ret
