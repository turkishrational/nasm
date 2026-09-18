; =======================================================================
; NASM v2.14.02 - TANIMLANMIŞ VERİ ALANI (data.asm)
; Projedeki tüm modüllerin statik verileri burada ardışık birleşecektir.
; =======================================================================
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026

section .data

align 4

; --- nasm.asm Modülü Sabitleri (Orijinal İngilizce Mesajlar) ---
default_out_name:  db "nasm.out", 0
missing_arg_msg:   db "nasm: error: option requires an argument", 10, 0
invalid_fmt_msg:   db "nasm: error: unrecognised output format", 10, 0
no_in_file_msg:    db "nasm: error: no input file specified", 10, 0
in_open_err_msg:   db "nasm: error: unable to open input file '%s'", 10, 0
preproc_err_msg:   db "nasm: error: preprocessor initialization failed", 10, 0

usage_msg:
    db "usage: nasm386 [-o outfile] [-f format] [-v] [-h] file", 10
    db "options:", 10
    db "  -o outfile     specifies the output file name", 10
    db "  -f format      selects the output file format (bin, elf32, coff)", 10
    db "  -v             displays the version information", 10
    db "  -h             displays this help text", 10, 0

; --- common.asm Modülü Sabitleri ---
invalid_fmt_panic_msg: db "nasm: panic: fatal error, output format structure is null", 10, 0

; --- ver.asm Modülü Sabitleri ---
nasm_version_string: 
    db "NASM version 2.14.02 compiled on Sep 1 2026 (TRDOS 386 Port)", 10, 0

; --- zerobuf.asm Modülü Sabitleri ---
align 4
nasm_static_zerobuf: times 256 db 0

; --- badenum.asm Modülü Sabitleri ---
bad_enum_panic_msg: db "nasm: panic: invalid enum value %d at %s:%d", 10, 0

; --- insnsa.asm Modülü Sabitleri ---
align 4
nasm_instructions_count: dd 1846  ; NASM 2.14.02 sürümündeki toplam x86 komut çeşidi sayısı (Orijinal gperf sınırı)

; --- regs.asm Modülü Sabitleri ---
align 4
nasm_reg_flags_count: dd 174    ; NASM 2.14.02 mimarisindeki toplam x86 register/yazmaç tanım sayısı

; --- error.asm Modülü Sabitleri ---
err_prefix_fmt:      db "%s:%d: ", 0
err_lf_str:          db 10, 0

; --- directbl.asm Modülü Sabitleri (Orijinal İngilizce Direktif Dizgeleri) ---
dir_str_section:    db "section", 0
dir_str_segment:    db "segment", 0
dir_str_equ:        db "equ", 0
dir_str_global:     db "global", 0
dir_str_extern:     db "extern", 0

; --- pragma.asm Modülü Sabitleri ---
pragma_str_pack:     db "pack", 0

; --- assemble.asm Modülü Sabitleri ---
insn_err_fmt_msg:  db "nasm: error: parser failed to decode instruction or operands", 10, 0
insn_el_size:      dd 20        ; Her bir instruction yapısının byte boyutu (Sabit)

; --- pptok.asm Modülü Sabitleri ---
pptok_str_define:    db "define", 0
pptok_str_include:   db "include", 0

; --- macros.asm Modülü Sabitleri ---
mac_str_major:       db "__NASM_MAJOR__", 0
mac_val_major:       db "2", 0
mac_str_minor:       db "__NASM_MINOR__", 0
mac_val_minor:       db "14", 0

; --- listing.asm Modülü Sabitleri ---
list_output_fmt:     db "%08X %s", 0

; --- exprdump.asm Modülü Sabitleri ---
expr_dump_fmt:       db "nasm_debug: expr type=%d value=0x%08X%08X", 10, 0

; --- outform.asm Modülü Sabitleri ---
align 4
extern ofmt_bin
extern outcoff
extern outelf

nasm_ofmt_list:
    dd ofmt_bin                 ; Flat binary / PRG çıktı sürücü yapısının adresi
    dd outcoff                  ; Win32/64 COFF nesne sürücü yapısının adresi
    dd outelf                   ; ELF32/64 nesne sürücü yapısının adresi
    dd 0                        ; Listenin sonunu belirten NULL sınır kilidi


; --- outbin.asm Modülü Sabitleri ---
align 4

ofmt_bin:
    dd bin_shortname_str        ; +0  : format kısa adı pointer'ı ("bin")
    dd bin_longname_str         ; +4  : format uzun adı pointer'ı
    dd 0                        ; +8  : flags bayrakları
    dd 0                        ; +12 : debug format sürücü bağ adresi (NULL)
    dd 0                        ; +16 : current_section_id_ptr
    dd 0                        ; +20 : section_attributes_func
    dd 0                        ; +24 : map_creation_func
    dd 0                        ; +28 : locate_symbol_func
    dd bin_init                 ; +32 : init() fonksiyon gösterici adresi
    dd 0                        ; +36 : set_text_section_func
    dd bin_output               ; +40 : output() fonksiyon gösterici adresi
    dd bin_cleanup              ; +44 : cleanup() fonksiyon gösterici adresi

bin_shortname_str:  db "bin", 0
bin_longname_str:   db "flat binary (TRDOS 386 executable .PRG format)", 0
bin_init_err_msg:   db "nasm: fatal: outbin driver failed to open output binary file", 10, 0

; --- outcoff.asm Modülü Sabitleri ---
align 4

outcoff:
    dd coff_shortname_str       ; +0  : format kısa adı pointer'ı ("coff")
    dd coff_longname_str        ; +4  : format uzun adı pointer'ı
    dd 0                        ; +8  : flags bayrakları
    dd 0                        ; +12 : debug format sürücü bağ adresi (NULL)
    dd 0                        ; +16 : current_section_id_ptr
    dd 0                        ; +20 : section_attributes_func
    dd 0                        ; +24 : map_creation_func
    dd 0                        ; +28 : locate_symbol_func
    dd coff_init                ; +32 : init() fonksiyon gösterici adresi
    dd 0                        ; +36 : set_text_section_func
    dd coff_output              ; +40 : output() fonksiyon gösterici adresi
    dd coff_cleanup             ; +44 : cleanup() fonksiyon gösterici adresi

; --- outcoff.asm Modülü Sabitleri ---
coff_shortname_str: db "coff", 0
coff_longname_str:  db "COFF i386/x64 (Microsoft Windows Object Format)", 0
coff_init_err_msg:  db "nasm: fatal: outcoff driver failed to open output object file", 10, 0

; --- outelf.asm Modülü Sabitleri ---
align 4

outelf:
    dd elf_shortname_str        ; +0  : format kısa adı pointer'ı ("elf32"/"elf64")
    dd elf_longname_str         ; +4  : format uzun adı pointer'ı
    dd 0                        ; +8  : flags bayrakları
    dd 0                        ; +12 : debug format sürücü bağ adresi (NULL)
    dd 0                        ; +16 : current_section_id_ptr
    dd 0                        ; +20 : section_attributes_func
    dd 0                        ; +24 : map_creation_func
    dd 0                        ; +28 : locate_symbol_func
    dd elf_init                 ; +32 : init() fonksiyon gösterici adresi
    dd 0                        ; +36 : set_text_section_func
    dd elf_output               ; +40 : output() fonksiyon gösterici adresi
    dd elf_cleanup              ; +44 : cleanup() fonksiyon gösterici adresi

elf_shortname_str:  db "elf32", 0
elf_longname_str:   db "ELF32/64 (Linux/Retro UNIX Object Format)", 0
elf_init_err_msg:   db "nasm: fatal: outelf driver failed to open output ELF file", 10, 0

; 30/08/2026 - Google AI

; =============================================================================
; --- parser.asm / perfhash.c Ultra Sıkıştırılmış Dword Arama Sözlüğü ---
; Açıklama:    Erdoğan Tan'ın önerdiği 4-byte'lık (Dword) paket yapısıdır.
;              [Üst 16-bit: Token ID] | [Alt 16-bit: String Havuz Offset]
; =============================================================================
align 4
nasm_insns_perfhash:
    dd (1  << 16) | ((nasm_insn_string_pool.insn_mov  - nasm_insn_string_pool.start))
    dd (2  << 16) | ((nasm_insn_string_pool.insn_add  - nasm_insn_string_pool.start))
    dd (3  << 16) | ((nasm_insn_string_pool.insn_sub  - nasm_insn_string_pool.start))
    dd (4  << 16) | ((nasm_insn_string_pool.insn_mul  - nasm_insn_string_pool.start))
    dd (5  << 16) | ((nasm_insn_string_pool.insn_div  - nasm_insn_string_pool.start))
    dd (6  << 16) | ((nasm_insn_string_pool.insn_jmp  - nasm_insn_string_pool.start))
    dd (7  << 16) | ((nasm_insn_string_pool.insn_call - nasm_insn_string_pool.start))
    dd (8  << 16) | ((nasm_insn_string_pool.insn_push - nasm_insn_string_pool.start))
    dd (9  << 16) | ((nasm_insn_string_pool.insn_pop  - nasm_insn_string_pool.start))
    dd (10 << 16) | ((nasm_insn_string_pool.insn_xor  - nasm_insn_string_pool.start))
    dd (11 << 16) | ((nasm_insn_string_pool.insn_cmp  - nasm_insn_string_pool.start))
    dd (12 << 16) | ((nasm_insn_string_pool.insn_je   - nasm_insn_string_pool.start))
    dd (13 << 16) | ((nasm_insn_string_pool.insn_jne  - nasm_insn_string_pool.start))
    dd (14 << 16) | ((nasm_insn_string_pool.insn_inc  - nasm_insn_string_pool.start))
    dd (15 << 16) | ((nasm_insn_string_pool.insn_dec  - nasm_insn_string_pool.start))
    dd (16 << 16) | ((nasm_insn_string_pool.insn_ret  - nasm_insn_string_pool.start))
    dd (17 << 16) | ((nasm_insn_string_pool.insn_nop  - nasm_insn_string_pool.start))
    dd 0 ; Tablo sonu sınır kilidi (NULL)

; --- String Havuzu Yapısı (Etiketli Sürüm) ---
align 4
nasm_insn_string_pool:
.start:
.insn_mov:  db "mov", 0
.insn_add:  db "add", 0
.insn_sub:  db "sub", 0
.insn_mul:  db "mul", 0
.insn_div:  db "div", 0
.insn_jmp:  db "jmp", 0
.insn_call: db "call", 0
.insn_push: db "push", 0
.insn_pop:  db "pop", 0
.insn_xor:  db "xor", 0
.insn_cmp:  db "cmp", 0
.insn_je:   db "je", 0
.insn_jne:  db "jne", 0
.insn_inc:  db "inc", 0
.insn_dec:  db "dec", 0
.insn_ret:  db "ret", 0
.insn_nop:  db "nop", 0

; =============================================================================
; --- insnsa.asm / insnsb.asm / insnsd.asm Yapısal Komut Tablosu ---
; Açıklama:    Orijinal C kodlarındaki (insnsa.c, insnsb.c, insnsd.c) 
;              toplam 1846 adet komut çeşidinin (nasm_instructions_count)
;              özelliklerini, bit bayraklarını ve opcode şablonlarını tutan
;              sabit boyutlu (eleman başına 20 byte) devasa statik dizidir.
;              Assembly'de pointer yerine düz offset ile bellek tasarrufu sağlar.
; =============================================================================
; 31/08/2026 - Google AI
; =============================================================================
; TRDOS 386 - NASM Portu: Temel ve Çekirdek x86 Opkod Matrisi (data.asm)
; =============================================================================
align 4
global nasm_instructions_table
nasm_instructions_table:
; 02/09/2026 - Erdogan Tan & Google AI
; --- 26 Elemanlı Kompakt Harf Vektör Tablosu (4 * 26 = 104 Byte) ---
    dd ins_bucket_A             ; 0:  'a' (add, and...)
    dd ins_bucket_empty         ; 1:  'b'
    dd ins_bucket_C             ; 2:  'c' (call, cli...)
    dd ins_bucket_empty         ; 3:  'd'
    dd ins_bucket_empty         ; 4:  'e'
    dd ins_bucket_empty         ; 5:  'f'
    dd ins_bucket_empty         ; 6:  'g'
    dd ins_bucket_empty         ; 7:  'h'
    dd ins_bucket_I             ; 8:  'i'
    dd ins_bucket_J             ; 9:  'j' (jmp...)
    dd ins_bucket_empty         ; 10: 'k'
    dd ins_bucket_empty         ; 11: 'l'
    dd ins_bucket_M             ; 12: 'm' (mov...)
    dd ins_bucket_empty         ; 13: 'n'
    dd ins_bucket_empty         ; 14: 'o'
    dd ins_bucket_P             ; 15: 'p' (push, pop...)
    dd ins_bucket_empty         ; 16: 'q'
    dd ins_bucket_R             ; 17: 'r' (ret...)
    dd ins_bucket_S             ; 18: 's' (sti...)
    dd ins_bucket_empty         ; 19: 't'
    times 7 dd ins_bucket_empty ; 20 - 25: 'u' ile 'z' arası kalan boş harf slotları

    ; Yapı Tasarımı: 
    ; dd Mnemonic_String_Address (4 Byte)
    ; dd Operand_Type_Flags     (4 Byte)
    ; dw Base_Opcode_Bytes      (2 Byte)
    ; db Flags_and_Extension    (1 Byte)
    ; db Opcode_Length_Bytes    (1 Byte)
    ; Toplam = Kayıt başına 12 Byte (Sabit İndeksleme İçin İdeal)

ins_bucket_M:
    dd op_str_mov,   0x0000000C, (0x8900 | (0x00 << 16) | (2 << 24))
    dd 0, 0, 0
ins_bucket_A:
    dd op_str_add,   0x0000000C, (0x0100 | (0x00 << 16) | (2 << 24))
    dd op_str_and,   0x0000000C, (0x2100 | (0x00 << 16) | (2 << 24))
    dd 0, 0, 0
ins_bucket_J: 
    dd op_str_jmp,   0x00000001, (0xE900 | (0x00 << 16) | (1 << 24))
    dd 0, 0, 0
ins_bucket_I: 
    dd op_str_int,   0x00000002, (0xCD00 | (0x00 << 16) | (1 << 24))
    dd 0, 0, 0
ins_bucket_P: 
    dd op_str_push,  0x00000004, (0x5000 | (0x00 << 16) | (1 << 24))
    dd op_str_pop,   0x00000004, (0x5800 | (0x00 << 16) | (1 << 24))
    dd 0, 0, 0
ins_bucket_C:
    dd op_str_call,  0x00000001, (0xE800 | (0x00 << 16) | (1 << 24))
    dd op_str_cli,   0x00000000, (0xFA00 | (0x00 << 16) | (1 << 24))
    dd 0, 0, 0
ins_bucket_R:  
    dd op_str_ret,   0x00000000, (0xC300 | (0x00 << 16) | (1 << 24))
    dd 0, 0, 0
ins_bucket_S:
    dd op_str_sub,   0x0000000C, (0x2900 | (0x00 << 16) | (2 << 24))
    dd op_str_sti,   0x00000000, (0xFB00 | (0x00 << 16) | (1 << 24))
ins_bucket_empty:
    dd 0, 0, 0                              ; <-- 3x DWORD STOP MARKER!

align 4
; --- nasm_lookup_instruction - Mnemonic String Katar Havuzu ---
op_str_mov:   db 'mov', 0
op_str_add:   db 'add', 0
op_str_sub:   db 'sub', 0
op_str_and:   db 'and', 0
op_str_jmp:   db 'jmp', 0
op_str_int:   db 'int', 0
op_str_push:  db 'push', 0
op_str_pop:   db 'pop', 0
op_str_call:  db 'call', 0
op_str_ret:   db 'ret', 0
op_str_cli:   db 'cli', 0
op_str_sti:   db 'sti', 0
; .....................

; 31/08/2026
; =============================================================================
; --- directiv.asm'de 'nasm_process_directive' fonksiyonu için ---

; Preprocessor Direktif Eşleşme Tablosu
align 4
global nasm_directive_table
nasm_directive_table:
    dd dir_bits,      1 ; BITS direktif kodu
    dd dir_section,   2 ; SECTION direktif kodu
    dd dir_segment,   2 ; SEGMENT (SECTION ile aynı)
    dd dir_global,    3 ; GLOBAL
    dd dir_extern,    4 ; EXTERN
    dd dir_str_db,    5 ; DB (Define Byte) kodu
    dd dir_str_dw,    6 ; DW (Define Word) kodu
    dd dir_str_dd,    7 ; DD (Define Doubleword) kodu
    dd 0

dir_bits:      db 'bits', 0
dir_section:   db 'section', 0
dir_segment:   db 'segment', 0
dir_global:    db 'global', 0
dir_extern:    db 'extern', 0
dir_str_db:    db 'db', 0
dir_str_dw:    db 'dw', 0
dir_str_dd:    db 'dd', 0

; 01/09/2026 - Google AI

; --- directiv.asm 'nasm_process_directive' fonksiyonu ---
; --- unknown_directive_error - Standart NASM Hata Formatı ---
nasm_err_fmt: db '%s:%d: error: unknown or unimplemented directive "%s"', 0x0D, 0x0A, 0

; --- fopen - okuma modu dizesi ---
nasm_mode_read: db 'r', 0

; --- parser.asm - Bilinmeyen Token Teşhis Formatı ---
;parser_unknown_fmt: db '>>> BILINMEYEN TOKEN NE?: [%s]', 0x0D, 0x0A, 0

; --- parse_section_name - Standart Nesne Dosyası Segment Katar İsimleri ---
section_str_text: db '.text', 0
section_str_data: db '.data', 0
section_str_bss:  db '.bss', 0

; 03/09/2026 - Google AI

; --- bin_init - fopen ANSI C Yazma Mod Belirteci ---
mode_str_w:  db 'w', 0

; 03/09/2026
; --- preproc.asm 'preproc_getline' fonksiyonu ---
nasm_read_error: db '%s: file read error', 0x0D, 0x0A, 0
; --- preproc.asm 'preproc_getline' fonksiyonu ---
nasm_write_error: db '%s: file write error', 0x0D, 0x0A, 0

