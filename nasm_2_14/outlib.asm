; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY FORMAT YARDIMCI KÜTÜPHANESİ (outlib.asm)
; `nasm386.asm` include zincirinin outform.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

global nasm_ofmt_section_attributes

; extern nasm_error

section .text
align 4

; =========================================================================
; uint32_t nasm_ofmt_section_attributes(const char *name, int *flags)
; Standart section isimlerine göre (.text, .data, .bss) jenerik öznitelik
; bayraklarını (read, write, execute) döndüren yardımcı süzgeçtir.
; =========================================================================
nasm_ofmt_section_attributes:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 8]          ; esi = name (Section adı)
    mov ebx, [ebp + 12]         ; ebx = flags pointer
    
    test esi, esi
    jz .L_attr_default

    ; Basit süzgeç: Karakter tabanlı hızlı kontrol (Kestirme yol)
    cmp byte [esi], '.'
    jne .L_attr_default
    
    mov al, byte [esi + 1]
    cmp al, 't'                 ; .text kontrolü
    je .L_attr_text
    cmp al, 'd'                 ; .data kontrolü
    je .L_attr_data
    cmp al, 'b'                 ; .bss kontrolü
    je .L_attr_bss
    jmp .L_attr_default

.L_attr_text:
    mov eax, 0x00000005         ; Örnek: RX (Read + Execute) bayrak maskesi
    jmp .L_attr_set

.L_attr_data:
    mov eax, 0x00000003         ; Örnek: RW (Read + Write) bayrak maskesi
    jmp .L_attr_set

.L_attr_bss:
    mov eax, 0x00000003         ; BSS için de RW geçerlidir

.L_attr_set:
    test ebx, ebx
    jz .L_attr_done
    mov [ebx], eax              ; Bayrakları adrese yaz

.L_attr_default:
    xor eax, eax                ; Jenerik dönüş: 0

.L_attr_done:
    pop esi
    pop ebx
    pop ebp
    ret

