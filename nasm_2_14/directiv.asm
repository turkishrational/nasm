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

; 31/08/2026 - Google AI

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_process_directive
; İşlev: ESI içindeki ayıklanan direktif string'ini tabloyla tarar ve dallanır.
; Girdi: ESI = Ayıklanan direktif kelimesinin bellek adresi
; Değişen Register'lar: EAX, ECX, EDX
; Korunan Register'lar: EBX, ESI, EDI, EBP, ESP
; -----------------------------------------------------------------------------
global nasm_process_directive
nasm_process_directive:
    push ebp
    mov ebp, esp
    push edi
    push esi

    mov edi, nasm_directive_table

.loop_find:
    mov edx, [edi]
    test edx, edx
    jz .unknown_directive   ; Tablo sonu (Null Terminator)

    ; C uyumlu nasm_stricmp çağrısı için parametreleri stack'e basıyoruz
    push edx                ; [ESP+8] Parametre 2: Tablodaki direktif string adresi
    push ESI                ; [ESP+4] Parametre 1: Ayıklanan anlık string adresi
    call nasm_stricmp
    add esp, 8              ; Stack temizleme (C calling convention)

    or eax, eax
    jz .found_directive     ; Tam eşleşme bulundu

    add edi, 8              ; Sonraki kayda geç (Pointer + Code = 8 bytes)
    jmp .loop_find

.found_directive:
    mov eax, [edi+4]        ; Direktif kimlik kodunu al (1, 2, 3, 4...)

    cmp eax, 1
    je .do_bits
    cmp eax, 2
    je .do_section
    cmp eax, 3
    je .do_global
    cmp eax, 4
    je .do_extern

    jmp .unknown_directive

.do_bits:
    call parse_bits_value
    jmp .success_exit

.do_section:
    call parse_section_name
    jmp .success_exit

.do_global:
    call parse_global_symbol
    jmp .success_exit

.do_extern:
    call parse_extern_symbol
    jmp .success_exit

.unknown_directive:
    call unknown_directive_error
    jmp .success_exit

.success_exit:
    pop esi
    pop edi
    mov esp, ebp
    pop ebp
    ret

; -----------------------------------------------------------------------------
; Fonksiyon: parse_bits_value
; Girdi: ESI = Değer string adresi
; -----------------------------------------------------------------------------
parse_bits_value:
    push ebp
    mov ebp, esp
    mov al, [esi]
    cmp al, '3'
    je .is_32
    cmp al, '1'
    je .is_16
    jmp .err
.is_32:
    mov dword [nasm_bits_mode], 32
    jmp .done
.is_16:
    mov dword [nasm_bits_mode], 16
    jmp .done
.err:
    call unknown_directive_error
.done:
    mov esp, ebp
    pop ebp
    ret

; -----------------------------------------------------------------------------
; Fonksiyon: parse_section_name
; İşlev: Aktif segmenti (text, data, bss) bss alanına kaydeder (Çıktı formatları için)
; -----------------------------------------------------------------------------
parse_section_name:
    push ebp
    mov ebp, esp
    ; İleride ELF ve COFF/PE için genişletilecek olan aktif segment adresi kaydı
    mov [nasm_current_section_ptr], esi
    mov esp, ebp
    pop ebp
    ret

; -----------------------------------------------------------------------------
; Fonksiyon: parse_global_symbol
; -----------------------------------------------------------------------------
parse_global_symbol:
    push ebp
    mov ebp, esp
    ; Global tabloya ekleme ara mantığı
    mov esp, ebp
    pop ebp
    ret

; -----------------------------------------------------------------------------
; Fonksiyon: parse_extern_symbol
; -----------------------------------------------------------------------------
parse_extern_symbol:
    push ebp
    mov ebp, esp
    ; Extern bağlama ara mantığı
    mov esp, ebp
    pop ebp
    ret

; -----------------------------------------------------------------------------
; Fonksiyon: unknown_directive_error
; İşlev: İstediğiniz gibi C tipi printf ve hata mesajı sarmalına bağlandı.
; -----------------------------------------------------------------------------
unknown_directive_error:
    push ebp
    mov ebp, esp
    push unknown_directive_msg
    call printf
    add esp, 4
    mov esp, ebp
    pop ebp
    ret
