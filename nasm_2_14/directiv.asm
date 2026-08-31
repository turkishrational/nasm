; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY DİREKTİF AYIKLAMA MOTORU (directiv.asm)
; `nasm386.asm` include zincirinin float.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_directive_find

; extern hash_find

section .text
align 4

; =========================================================================
; int nasm_directive_find(const char *str)
; Kodda karşılaşılan kelimenin (SECTION, SEGMENT, EQU vb.) direktif olup 
; olmadığını, direktif tablosunda mükemmel hash ile tarayarak bulur.
; =========================================================================
nasm_directive_find:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = str pointer adresi
    test eax, eax
    jz .L_dir_unknown

    ; `directbl.asm` içinde tanımlayacağımız merkezi direktif hash tablosunu sorgula
    push eax                    ; target str key
    push 128                    ; directive_table_size = 128
    
    ; extern directive_hash_table ; directbl.asm'den gelecek olan adres
    push directive_hash_table
    call hash_find              ; hashtbl.asm içindeki genel arama motoru
    add esp, 12
    
    test eax, eax
    jz .L_dir_unknown           ; Bulunamadıysa bilinmeyen direktif dön
    jmp .L_dir_done

.L_dir_unknown:
    mov eax, -1                 ; Bilinmeyen direktif token kodu: Return -1

.L_dir_done:
    pop ebp
    ret
