; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY KOMUT BİLGİ TABLO MOTORU (insnsa.asm)
; `nasm386.asm` include zincirinin badenum.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_instructions
global nasm_get_insn_info

; extern nasm_instructions_count ; data.asm/insnsb.asm içinde tanımlanacak

section .text
align 4

; --- INSTRUCTION YAPISI (STRUCT INSTRUCTION OFFSETS) ---
; +0  : int opcode          (Komutun iç opkod numarası / enum)
; +4  : int operands        (İzin verilen operand sayısı)
; +8  : const unsigned char *opd (Operand tiplerini barındıran dizi adresi)
; +12 : const char *format  (Çıktı biçimlendirme dizesi adresi)
; +16 : uint32_t flags      (İşlemci mod ve mimari bayrakları: 16-bit, 32-bit, 64-bit vb.)

; =========================================================================
; const struct instruction *nasm_get_insn_info(int insn_id)
; Belirtilen iç komut numarasına göre tablodan ilgili düğüm adresini döner.
; =========================================================================
nasm_get_insn_info:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = insn_id (İstenen iç komut numarası)
    
    cmp eax, 0
    jl .L_insn_info_null        ; Negatif indeks koruması
    
    ; Toplam komut sayısını kontrol et (insnsb.asm veya data.asm'den gelen sınır)
    mov ecx, dword [nasm_instructions_count]
    cmp eax, ecx
    jge .L_insn_info_null       ; Sınır taşma koruması

    ; Her bir instruction düğümü tam 20 byte (5 alan * 4 byte) genişliğindedir.
    ; Adres hesaplama lojiği: target_node = nasm_instructions + (insn_id * 20)
    mov ecx, 20
    mul ecx                     ; edx:eax = insn_id * 20
    
    mov ebx, dword [nasm_instructions_ptr] ; bss.asm içindeki ana tablo taban adresi
    add eax, ebx                ; eax = target_node adresi
    jmp .L_insn_info_done

.L_insn_info_null:
    xor eax, eax                ; Geçersiz indeks durumunda Return NULL (0)

.L_insn_info_done:
    pop ebx
    pop ebp
    ret

