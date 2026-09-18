; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY YAZMAÇ YÖNETİM MOTORU (regs.asm)
; `nasm386.asm` include zincirinin insnsn.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

global nasm_reg_flags
global nasm_reg_size
global nasm_reg_type

; extern nasm_reg_flags_count  ; data.asm/regvals.asm içinde tanımlanacak
; extern nasm_reg_flags_table  ; bss.asm veya ilgili veri katmanındaki tablo tabanı

section .text
align 4

; --- REGISTER FLAGS TABLO YAPISI (STRUCT REG_FLAGS OFFSETS) ---
; +0  : int reg_id            (Yazmacın iç kimlik numarası / enum)
; +4  : uint32_t flags        (Yazmaç tür ve boyut bayrakları maskesi)

; =========================================================================
; uint32_t nasm_reg_flags(int reg_id)
; Belirtilen yazmaç kimliğine ait tüm mimari ve boyut bayraklarını döner.
; =========================================================================
nasm_reg_flags:
    push ebp
    mov ebp, esp
    push ebx

    mov eax, [ebp + 8]          ; eax = reg_id
    cmp eax, 0
    jl .L_reg_flags_zero        ; Negatif indeks koruması

    mov ecx, dword [nasm_reg_flags_count]
    cmp eax, ecx
    jge .L_reg_flags_zero       ; Sınır taşma koruması

    ; Her bir reg_flags düğümü tam 8 byte (2 alan * 4 byte) genişliğindedir.
    ; Adres lojiği: target_node = nasm_reg_flags_table + (reg_id * 8)
    shl eax, 3                  ; eax = reg_id * 8 (En hızlı çarpma tetiği)
    
    mov ebx, dword [nasm_reg_flags_ptr] ; bss.asm içindeki tablo taban adresi
    mov eax, [ebx + eax + 4]    ; Return EAX = node->flags maskesi
    jmp .L_reg_flags_done

.L_reg_flags_zero:
    xor eax, eax                ; Hata veya geçersiz ID durumunda 0 dön

.L_reg_flags_done:
    pop ebx
    pop ebp
    ret

align 4

; =========================================================================
; int nasm_reg_size(int reg_id)
; Yazmacın bit/byte boyutunu (1: 8-bit, 2: 16-bit, 4: 32-bit vb.) hesaplar.
; =========================================================================
nasm_reg_size:
    push ebp
    mov ebp, esp

    push dword [ebp + 8]        ; reg_id
    call nasm_reg_flags         ; Önce yazmacın bayraklarını çek
    add esp, 4                  ; EAX = flags maskesi

    ; NASM iç mimarisindeki REG_SIZE maske filtreleme lojiği:
    ; (flags >> REG_SIZE_SHIFT) & REG_SIZE_MASK simülasyonu
    test eax, eax
    jz .L_reg_size_zero

    ; Basit utilize edilmemiş maskeleme (Genel x86 yazmaç boyut süzgeci):
    mov ecx, eax
    and ecx, 0x000000FF         ; İlk bayttaki boyut bitlerini süz
    mov eax, ecx
    jmp .L_reg_size_done

.L_reg_size_zero:
    xor eax, eax                ; Bilinmeyen veya hatallı: Return 0

.L_reg_size_done:
    pop ebp
    ret

align 4

; =========================================================================
; int nasm_reg_type(int reg_id)
; Yazmacın hiyerarşik sınıf türünü (GPR, Segment, FPU, CR, DR) döndürür.
; =========================================================================
nasm_reg_type:
    push ebp
    mov ebp, esp

    push dword [ebp + 8]        ; reg_id
    call nasm_reg_flags
    add esp, 4                  ; EAX = flags maskesi

    ; Tür bitlerini maskele (Örn: REG_TYPE_MASK = 0xFFFFFF00)
    and eax, 0xFFFFFF00         ; Üst bitlerdeki sınıf türü kimliğini koru
    
    pop ebp
    ret
