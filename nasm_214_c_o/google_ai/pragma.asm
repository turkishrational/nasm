; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY PRAGMA KOMUT SÜZGEÇ KATMANI (pragma.asm)
; `nasm386.asm` include zincirinin directbl.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_handle_pragma

; extern strcmp

section .text
align 4

; =========================================================================
; int nasm_handle_pragma(const char *pragma_str)
; Kodun içindeki "%pragma" komutlarını (Örn: pragma pack) ayıklar.
; =========================================================================
nasm_handle_pragma:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]          ; eax = pragma_str pointer
    test eax, eax
    jz .L_pragma_ignored

    ; "pack" pragma komutu mu kontrol et
    push pragma_str_pack        ; data.asm'e eklenecek
    push eax
    call strcmp
    add esp, 8
    test eax, eax
    jz .L_pragma_pack_found

    ; Tanınmayan pragmaları güvenle es geç (Bypass koruması)
    jmp .L_pragma_ignored

.L_pragma_pack_found:
    mov eax, 1                  ; Pack pragma bulundu ve onaylandı: Return 1
    jmp .L_pragma_done

.L_pragma_ignored:
    xor eax, eax                ; İşlem yapılmadı/Yoksayıldı: Return 0

.L_pragma_done:
    pop ebp
    ret
