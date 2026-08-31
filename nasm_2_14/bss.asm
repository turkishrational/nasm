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
nasm_macro_count:   resd 1
nasm_include_depth: resd 1

; --- listing.asm Modülü Değişkenleri ---
alignb 4
list_file_ptr:       resd 1     ; Listeleme dosyasının LIBC FD değerini tutan hücre

; --- eval.asm Modülü Değişkenleri ---
alignb 4
eval_expr_result:    resb 12    ; 12 byte'lık statik ifade sarmal hücresi

; --- stdscan.asm Modülü Değişkenleri ---
alignb 4
scan_ptr_storage:  resd 1       ; Kelime tarayıcının imleç (pointer) hücresi

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
nasm_line_buffer:   resb 4096   ; Preprocessor için 4KB'lık satır okuma alanı
nasm_token_buffer:  resb 1024   ; Parser token ayrıştırma alanı

; =======================================================================
; NİHAİ BSS SINIRI (crt0.asm katmanına u.break kaydı için iletilir)
; =======================================================================
alignb 4
bss_end:
