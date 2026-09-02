; =======================================================================
; NASM v2.14.02 - TANIMLANMAMIŞ VERİ ALANI (bss.asm)
; TRDOS 386 v2.0 Çekirdek BSS_END sayfa zırhı ile kilitlenmiştir.
; =======================================================================
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026

global bss_start
global bss_end 

section .bss

bss_start:

ABSOLUTE bss_start

alignb 4

; --- nasm.asm Modülü Değişkenleri ---
current_argc:      resd 1
current_argv:      resd 1
src_filename:      resd 1
out_filename:      resd 1
selected_ofmt:     resd 1

; 30/08/2026 - Google AI
; --- nasm.asm / main.c Global Değişkenleri ---
nasm_error_count:   resd 1      ; Toplam derleme hata sayısı
nasm_in_file_ptr:   resd 1      ; Giriş dosyası string pointer adresi
nasm_out_file_ptr:  resd 1      ; Çıkış dosyası string pointer adresi

; --- common.asm Modülü Değişkenleri ---
; (Bu modülde şu an için statik uninitialized/BSS değişkene ihtiyaç kalmamıştır)

; --- srcfile.asm Modülü Değişkenleri ---
current_src_line:  resd 1

; --- insnsa.asm Modülü Değişkenleri ---
alignb 4
nasm_instructions_ptr:   resd 1   ; Sürücü blokları yüklendiğinde taban adresi buraya kilitlenir

; --- regs.asm Modülü Değişkenleri ---
alignb 4
nasm_reg_flags_ptr:   resd 1    ; Yazmaç bayrak tablosunun taban adresi buraya kilitlenecektir

; --- regdis.asm Modülü Değişkenleri ---
alignb 4
nasm_reg_names_table_ptr: resd 1   ; Sürücü ilklendiğinde string isim tablosu buraya kilitlenir

; --- directbl.asm Modülü Değişkenleri ---
alignb 4
directive_hash_table: resd 128   ; 128 elemanlık dword bağlı liste kafa pointer dizisi havuzu

; --- labels.asm Modülü Değişkenleri ---
alignb 4
nasm_labels_root:  resd 1       ; Kırmızı-Siyah etiket ağacının kafa pointer hücresi

; --- preproc.asm Modülü Değişkenleri ---
alignb 4
active_file_handle: resd 1
;nasm_macro_count:  resd 1
nasm_include_depth: resd 1

; --- listing.asm Modülü Değişkenleri ---
alignb 4
list_file_ptr:       resd 1     ; Listeleme dosyasının LIBC FD değerini tutan hücre

; --- eval.asm Modülü Değişkenleri ---
alignb 4
eval_expr_result:    resb 12    ; 12 byte'lık statik ifade sarmal hücresi

; --- stdscan.asm Modülü Değişkenleri ---
alignb 4
;scan_ptr_storage:  resd 1      ; Kelime tarayıcının imleç (pointer) hücresi
; --- nasm_stdscan_init - Tokenizer Anlık Satır Pozisyon Pointer'ı ---
nasm_scan_line_ptr:  resd 1

; --- strtbl.asm Modülü Değişkenleri ---
alignb 4
strtbl_total_bytes:  resd 1     ; String tablosunun anlık birikimli boyutunu tutan sayaç

; --- outbin.asm Modülü Değişkenleri ---
alignb 4
bin_file_handle:    resd 1      ; Nihai ikili çıktı dosyasının LIBC FD zırh numarasını tutan alan

; --- outcoff.asm Modülü Değişkenleri ---
alignb 4
coff_file_handle:   resd 1      ; Çıktı dosyasının LIBC FD numarasını tutan alan
coff_sect_count:    resd 1      ; Oluşturulan COFF section sayısı sayacı
coff_sym_count:     resd 1      ; Eklenen COFF sembol tablosu girdisi sayısı

; --- outelf.asm Modülü Değişkenleri ---
alignb 4
elf_file_handle:    resd 1      ; Çıktı dosyasının LIBC FD numarasını tutan alan
elf_shnum:          resd 1      ; ELF Section Header tablo eleman sayısı sayacı
elf_symnum:         resd 1      ; ELF Sembol tablosu girdi sayısı

; 30/08/2026 - Google AI
; --- preproc.asm / preproc.c Geçici Satır Tamponları ---
;nasm_line_buffer:   resb 4096  ; Preprocessor için 4KB'lık satır okuma alanı
nasm_token_buffer:  resb 1024   ; Parser token ayrıştırma alanı

; 31/08/2026 - Google AI
alignb 4

; NASM'nin derleme esnasında kullanacağı global durum değişkenleri
global_bits:         resd 1      ; 16, 32 veya 64 bit modu bilgisi
current_pass:        resd 1      ; Pass 1 veya Pass 2 bilgisi

; Maksimum sembol sınırı için statik bellek (Hız için dinamik malloc yerine)
; alignb 4
; symbol_table_start:  resb (16 * 10000) ; 10.000 sembol için yer (Her biri 16 byte: 4 byte ad, 4 byte değer...)
; symbol_count:        resd 1

; Preprocessor makro tampon belleği
;alignb 4
;macro_buffer_pool:   resb 65536  ; 64 KB makro depolama alanı
;macro_pool_ptr:      resd 1

alignb 4
; --- parse_bits_value - Seçilen Mimari Mod Kayıt Alanı (16/32) ---
global nasm_bits_mode
nasm_global_state:   resd 1      ; Derleyicinin anlık durumu (Pass 1 / Pass 2)
nasm_bits_mode:      resd 1      ; 16 veya 32 bit modu saklayıcı veri alanı

; Tokenizer Buffer (stdscan.c işlevselliği için)
alignb 4
token_buffer:        resb 4096   ; Karakter analiz tamponu
token_ptr:           resd 1

; Sembol Tablosu Havuzu (labels.c işlevselliği için)
; Dinamik malloc yerine 20.000 sembol kapasiteli statik bellek bloğu
alignb 4
symbol_pool_start:   resb (24 * 20000) ; Her sembol 24 byte (Ad pointer, değer, nitelikler)
symbol_pool_end:
symbol_pool_ptr:     resd 1
symbol_count:        resd 1

; Preprocessor Makro Depolama Alanı (preproc.c işlevselliği için)
alignb 4
macro_storage_pool:  resb 131072 ; 128 KB statik makro depolama tamponu
macro_storage_ptr:   resd 1

; 01/09/2026 - Google AI

; --- preproc_init - Makro Havuz Bilgisi ve Sayaç Alanları ---
alignb 4
nasm_macro_pool_ptr:   resd 1
nasm_macro_count:      resd 1
nasm_macro_pool_buffer: resb 65536  ; 64 KB statik makro isim/değer deposu

; --- preproc_getline - Karakter Okuma Hücresi ve Satır Tamponu ---
alignb 4
nasm_char_temp:        resb 4      ; Tekil karakter okuma tamponu
alignb 4
nasm_line_buffer:      resb 4096   ; 4 KB'lık anlık işlenen aktif satır havuzu

; --- assemble_file - Giriş Dosyası LIBC FD Numarası ---
alignb 4
global nasm_input_file_handle
nasm_input_file_handle: resd 1

; --- nasm_parse_line - Parser Geçici Token İzleme Tamponları ---
alignb 4
parser_token_buf:      resb 256    ; İlk kelime için tampon
alignb 4
parser_peek_buf:       resb 256    ; İki nokta üst üste önizleme tamponu

; --- nasm_parse_line - Anlık Derleme Konum Sayacı (Program Counter) ---
alignb 4
global nasm_program_counter
nasm_program_counter:  resd 1      ; Derlenen kodun anlık offset/PC değeri

; --- preproc_getline - Küresel Satır Sayacı (B) ---
alignb 4
global nasm_global_line_counter
nasm_global_line_counter: resd 1

; --- preproc_getline - Include Başlangıç Satır Kilidi (A) ---
alignb 4
global nasm_include_start_line
nasm_include_start_line:  resd 1

; --- assemble_file - Anlık Aktif Kaynak Dosya Adı Pointer'ı ---
alignb 4
global nasm_current_src_filename
nasm_current_src_filename: resd 1

; --- parse_section_name - Aktif Çalışılan Segment/Section Kimlik Numarası ---
alignb 4
global nasm_current_section_id
nasm_current_section_id: resd 1    ; 1 = .text, 2 = .data, 3 = .bss vb.

; --- nasm_init_labels - Toplam Kayıtlı Sembol Sayacı ---
alignb 4
global nasm_symbol_count
nasm_symbol_count:     resd 1

; --- nasm_init_labels - Red-Black Tree Sembol Ağacı Kök Pointer Hücresi ---
alignb 4
global nasm_symbol_tree_root
nasm_symbol_tree_root: resd 1

; =======================================================================
; NİHAİ BSS SINIRI (crt0.asm katmanına u.break kaydı için iletilir)
; =======================================================================
alignb 4
bss_end:
