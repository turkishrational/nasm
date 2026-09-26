; ===========================================================================
; NASM v2.14.02 - NETWIDE ASSEMBLER FOR TRDOS 386 - Erdogan Tan - 18/09/2026 
; Disassembled from NASM v2.14.02 (Windows) object files (Dissassembler: IDA)
; NASM Syntax: Erdogan Tan
; Last Update: 26/09/2026
; ===========================================================================
; nasm nasm386.asm -l nasm386.txt -o NASM.PRG -Z error.txt
; ---------------------------------------------------------------------------
; Source code derived from elf32 object files compiled with Tiny C Compiler

; target: NASM.PRG (flat binary)
; main assembly file: nasm386.asm
; library section: libnasm.asm
; TRDOS 386 functions: system.asm 
; data section: data.asm
; bss section: bss.asm
; launcher: crt0.asm

BITS 32
ORG 0x00000000 ; TRDOS 386 Flat Binary base/start address

; ===========================================================================
; CHAPTER 1: CRT0 ENTRY LAYER (ENTRY POINT)
; ===========================================================================
%include 'crt0.asm'            ; Startup preparer and "call main" launcher

; ===========================================================================
; CHAPTER 2: C-COMPATIBLE CODE MODULES (With Names Identical to the C Files)
; ===========================================================================
%include 'nasm.asm'            ; Main assembler engine (main function)
%include 'common.asm'
%include 'crc64.asm'
%include 'malloc.asm'          ; Memory management bridge
%include 'md5.asm'
%include 'string.asm'
%include 'file.asm'            ; High-level file wrappers (nasm_open_read, etc.)
%include 'ilog2.asm'
%include 'realpath.asm'
%include 'path.asm'
%include 'filename.asm'
%include 'srcfile.asm'
%include 'readnum.asm'
%include 'bsi.asm'
%include 'rbtree.asm'

; --- x86 Processor Specific Files ---
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

; --- Core Assembler Logic ---
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

; --- Output Format Files ---
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

; ===========================================================================
; CHAPTER 3: THE FINAL 4 STRATEGICALLY LOCKED FILES (ARCHITECTURAL BACKBONE)
; ===========================================================================
%include 'libnasm.asm'         ; Standard library wrappers (ctype, string, etc.)
%include 'system.asm'          ; OS-dependent lowest layer (Kernel calls)
%include 'data.asm'            ; Initialized data area (Global data)
%include 'bss.asm'             ; Uninitialized data area (BSS)
