; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY KENDİNİ MONTE ETME PROJESİ (SELF-ASSEMBLING)
; Dosya: nasm386.asm (Ana Taşıyıcı Çatı Klasörü)
; Geliştirici: Erdoğan Tan & Google AI - 29/08/2026
; =======================================================================

BITS 32
ORG 0x00000000 ; TRDOS 386 Flat Binary taban adresi

; =======================================================================
; 1. BÖLÜM: CRT0 GİRİŞ KATMANI (ENTRY POINT)
; =======================================================================
%include 'crt0.asm'            ; Başlangıç yığını (Stack) ve "call main" tetikleyicisi

; =======================================================================
; 2. BÖLÜM: C UYUMLU KOD MODÜLLERİ (C Dosyaları ile Birebir Aynı İsimde)
; =======================================================================
%include 'nasm.asm'            ; Ana assembler motoru (main fonksiyonu)
%include 'common.asm'
%include 'ver.asm'
%include 'malloc.asm'          ; Bellek yönetim köprüsü
%include 'file.asm'            ; Üst seviye dosya sarmalayıcıları (nasm_open_read vb.)
%include 'srcfile.asm'
%include 'zerobuf.asm'
%include 'readnum.asm'
%include 'bsi.asm'
%include 'rbtree.asm'
%include 'hashtbl.asm'
%include 'raa.asm'
%include 'saa.asm'
%include 'strlist.asm'
%include 'perfhash.asm'
%include 'badenum.asm'
;%include 'strlcpy.asm'        ; bu fonksiyonlar libnasm.asm dosyasına taşındı	
;%include 'strnlen.asm'
;%include 'strrchrnul.asm'

; --- x86 İşlemci Tanım Sürücüleri ---
%include 'insnsa.asm'
%include 'insnsb.asm'
%include 'insnsd.asm'
%include 'insnsn.asm'
%include 'regs.asm'
%include 'regvals.asm'
%include 'regflags.asm'
%include 'regdis.asm'
%include 'disp8.asm'
%include 'iflag.asm'

; --- Çekirdek Assembler Mantığı ---
%include 'error.asm'
%include 'float.asm'
%include 'directiv.asm'
%include 'directbl.asm'
%include 'pragma.asm'
%include 'assemble.asm'
%include 'labels.asm'
%include 'parser.asm'
%include 'preproc.asm'
%include 'quote.asm'
%include 'pptok.asm'
%include 'macros.asm'
%include 'listing.asm'
%include 'eval.asm'
%include 'exprlib.asm'
%include 'exprdump.asm'
%include 'stdscan.asm'
%include 'strfunc.asm'
%include 'tokhash.asm'
%include 'segalloc.asm'
%include 'preproc-nop.asm'
%include 'rdstrnum.asm'

; --- Çıktı Formatları Sürücüleri ---
%include 'outform.asm'
%include 'outlib.asm'
%include 'legacy.asm'
%include 'strtbl.asm'
%include 'nulldbg.asm'
%include 'nullout.asm'
%include 'outbin.asm'
%include 'outcoff.asm'
%include 'outelf.asm'
%include 'codeview.asm'

; =======================================================================
; 3. BÖLÜM: STRATEJİK OLARAK KİLİTLENEN SON 4 DOSYA (MİMARİ OMURGA)
; =======================================================================
%include 'libnasm.asm'         ; Standart kütüphane sarmalayıcıları (ctype, string vb.)
%include 'system.asm'          ; İŞLETİM SİSTEMİ BAĞIMLI EN ALT KATMAN (Kernel Çağrıları)
%include 'data.asm'            ; Global, Hizalanmış Tanımlı Veri Alanı (Initialized Data)
%include 'bss.asm'             ; Tanımlanmamış Veri Alanı (Uninitialized Data / BSS)
