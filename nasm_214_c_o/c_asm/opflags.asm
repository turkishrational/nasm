; NASM 2.14.02 port to TRDOS 386 (Beginning: 18/09/2026)
; ---------------------------------------------------------------------------
; NASM Syntax: Erdogan Tan
; Last Update: 07/10/2026
; ===========================================================================
; opflags.asm
; ----------
; This file will be included in the "nasm386.asm" file
; Inclusion order: 26

; target: NASM.PRG (flat binary)
; main assembly file: nasm386.asm
; library section: libnasm.asm
; TRDOS 386 functions: system.asm 
; data section: data.asm
; bss section: bss.asm
; launcher: crt0.asm

; Source File : 'opflags.h'

; /*
; * opflags.h - operand flags
; */

; /*
; * Bits distribution (counted from 0)
; *
; *    6         5         4         3         2         1
; * 3210987654321098765432109876543210987654321098765432109876543210
; *                                 |
; *                                 + dword bound
; *
; * ............................................................1111 optypes          ; GEN_OPTYPE(?)   
; * .........................................................111.... modifiers        ; GEN_MODIFIER(?)
; * ...............................................1111111111....... register classes ; GEN_REG_CLASS(?)    
; * .......................................11111111................. subclasses       ; GEN_SUBCLASS(?)     
; * ................................1111111......................... specials         ; GEN_SPECIAL(?)
; * .....................11111111111................................ sizes            ; GEN_SIZE(?)  
; * ................11111........................................... regset count     ; GEN_REGSET(?) 
; */

; /*
; * Type of operand: memory reference, register, etc.
; * Bits: 0 - 3
; */

; %assign REGISTER              1       ; 1 << 0        ; /* register number in 'basereg' */
; %assign IMMEDIATE             2       ; 1 << 1 
; %assign REGMEM                4       ; 1 << 2        ; /* for r/m, ie EA, operands */
; %assign MEMORY                12      ; (1 << 3) + REGMEM

; /*
; * Sizes of the operands and attributes.
; *
; * Bits: 32 - 42
; */

; %assign BITS8                 0100000000h ; 1 << 32   ; /*   8 bits (BYTE) */
; %assign BITS16                0200000000h ; 1 << 33   ; /*  16 bits (WORD) */
; %assign BITS32                0400000000h ; 1 << 34   ; /*  32 bits (DWORD) */
; %assign BITS64                0800000000h ; 1 << 35   ; /*  64 bits (QWORD), x64 and FPU only */
; %assign BITS80                1000000000h ; 1 << 36   ; /*  80 bits (TWORD), FPU only */
; %assign BITS128               2000000000h ; 1 << 37   ; /* 128 bits (OWORD) */
; %assign BITS256               4000000000h ; 1 << 38   ; /* 256 bits (YWORD) */
; %assign BITS512               8000000000h ; 1 << 39   ; /* 512 bits (ZWORD) */
; %assign FAR                   10000000000h ; 1 << 40  ; /* grotty: this means 16:16 or 16:32, like in CALL/JMP */
; %assign NEAR                  20000000000h ; 1 << 41  
; %assign SHORT                 40000000000h ; 1 << 42  ; /* and this means what it says :) */

; /*
; * Modifiers.
; *
; * Bits: 4 - 6
; */

; %assign TO                    10h     ; 1 << 4   ; /* reverse effect in FADD, FSUB &c */
; %assign COLON                 20h     ; 1 << 5   ; /* operand is followed by a colon */
; %assign STRICT                40h     ; 1 << 6   ; /* do not optimize this operand */

; /*
; * Register classes.
; *
; * Bits: 7 - 16
; */

%assign REG_CLASS_CDT           80h
%assign REG_CLASS_GPR           100h
%assign REG_CLASS_SREG          200h
%assign REG_CLASS_FPUREG        400h
%assign REG_CLASS_RM_MMX        800h
%assign REG_CLASS_RM_XMM        1000h
%assign REG_CLASS_RM_YMM        2000h
%assign REG_CLASS_RM_ZMM        4000h
%assign REG_CLASS_OPMASK        8000h
%assign REG_CLASS_BND           10000h

; ===========================================================================
; CODE
; ===========================================================================

; section .text

; =============== S U B R O U T I N E =======================================

; static inline bool is_class(opflags_t class, opflags_t op)
; {
;	return !(class & ~op);
; }

%assign class   8
%assign class_h 0Ch
%assign op      10h
%assign op_h    14h

is_class:
                push    ebp
                mov     ebp, esp
                sub     esp, 0
                nop
                mov     eax, [ebp+op]   ; return !(class & ~op);
                xor     eax, 0FFFFFFFFh
                mov     ecx, [ebp+op_h]
                xor     ecx, 0FFFFFFFFh
                mov     edx, [ebp+class]
                and     edx, eax
                mov     eax, [ebp+class_h]
                and     eax, ecx
                cmp     eax, 0
                jnz     iscl_1
                cmp     edx, 0
                jz      iscl_2

iscl_1:                                 ; ...
                mov     eax, 0          ; false
                jmp     short iscl_3
; ---------------------------------------------------------------------------

iscl_2:                                 ; ...
                mov     eax, 1          ; true

iscl_3:                                 ; ...
                leave
                retn


; =============== S U B R O U T I N E =======================================

; static inline bool is_reg_class(opflags_t class, opflags_t reg)
; {
;	if (reg >= EXPR_REG_START && reg <= EXPR_REG_END)
;		return is_class(class, nasm_reg_flags[reg]);
;	return false;
; }

%assign class   8
%assign class_h 0Ch
%assign reg     10h
%assign reg_h   14h

is_reg_class:
                push    ebp
                mov     ebp, esp
                sub     esp, 0          ; #define EXPR_REG_START 1
                nop                     ; #define EXPR_REG_END 240
                mov     eax, [ebp+reg_h] ; if (reg >= EXPR_REG_START && reg <= EXPR_REG_END)
                cmp     eax, 0
                ;jb     ircl_3
                ;jnz    ircl_1
                ja      ircl_3
                mov     eax, [ebp+reg]
                cmp     eax, 1
                ;jb     ircl_3
                jb	ircl_4 ; eax = 0
ircl_1:                                 ; ...
                ;mov    eax, [ebp+reg_h]
                ;cmp    eax, 0
                ;ja     ircl_3
                ;jnz    ircl_2
                
                ;mov    eax, [ebp+reg]
                cmp     eax, 240
                ja      ircl_3

ircl_2:                                 ; ...
                mov     eax, [ebp+reg]  ; return is_class(class, nasm_reg_flags[reg]);
                shl     eax, 3
                mov     ecx, nasm_reg_flags
                add     ecx, eax
                mov     eax, [ecx]
                add     ecx, 4
                mov     edx, [ecx]
                push    edx
                push    eax
                mov     eax, [ebp+class]
                mov     ecx, [ebp+class_h]
                push    ecx
                push    eax
                call    is_class
                add     esp, 16
                jmp     ircl_4
; ---------------------------------------------------------------------------

ircl_3:                                 ; ...
                mov     eax, 0          ; return false;

ircl_4:                                 ; ...
                leave
                retn


; /* Register classes */
%assign REG_EA                  (4h + 1h)                    ; /* 'normal' reg, qualifies as EA */
%assign RM_GPR                  (100h + 000000000h + 0h + 4h)      ; /* integer operand */
%assign REG_GPR                 (100h + 000000000h + 4h + 1h)      ; /* integer register */
%assign REG8                    (100h + 100000000h + 4h + 1h)      ; /*  8-bit GPR  */
%assign REG16                   (100h + 200000000h + 4h + 1h)      ; /* 16-bit GPR */
%assign REG32                   (100h + 400000000h + 4h + 1h)      ; /* 32-bit GPR */
%assign REG64                   (100h + 800000000h + 4h + 1h)      ; /* 64-bit GPR */
%assign FPUREG                  (00000h + 400h + 1h)         ; /* floating point stack registers */
%assign FPU0                    (40000h + 400h + 1h)         ; /* FPU stack register zero */
%assign RM_MMX                  (0800h + 4h)                 ; /* MMX operand */
%assign MMXREG                  (0800h + 4h + 1h)            ; /* MMX register */
%assign RM_XMM                  (1000h + 4h)                 ; /* XMM (SSE) operand */
%assign XMMREG                  (1000h + 4h + 1h)            ; /* XMM (SSE) register */
%assign RM_YMM                  (2000h + 4h)                 ; /* YMM (AVX) operand */
%assign YMMREG                  (2000h + 4h + 1h)            ; /* YMM (AVX) register */
%assign RM_ZMM                  (4000h + 4h)                 ; /* ZMM (AVX512) operand */
%assign ZMMREG                  (4000h + 4h + 1h)            ; /* ZMM (AVX512) register */
%assign RM_OPMASK               (8000h + 4h)                 ; /* Opmask operand */
%assign OPMASKREG               (8000h + 4h + 1h)            ; /* Opmask register */
%assign OPMASK0                 (40000h + 8000h + 4h + 1h)   ; /* Opmask register zero (k0) */
%assign RM_K                    8004h
%assign KREG                    80005h
%assign RM_BND                  (10000h + 4h)                         ; /* Bounds operand */
%assign BNDREG                  (10000h + 4h + 1h)                    ; /* Bounds register */
%assign REG_CDT                 (80h + 400000000h + 1h)               ; /* CRn, DRn and TRn */
%assign REG_CREG                (040000h + 80h + 400000000h + 1h)     ; /* CRn */
%assign REG_DREG                (080000h + 80h + 400000000h + 1h)     ; /* DRn */
%assign REG_TREG                (100000h + 80h + 400000000h + 1h)     ; /* TRn */
%assign REG_SREG                (200h + 200000000h + 1h)              ; /* any segment register */

; /* Segment registers */
%assign REG_ES                  (20000h + 080000h + 200h + 200000000h + 1h)      ; /* ES */
%assign REG_CS                  (40000h + 080000h + 200h + 200000000h + 1h)      ; /* CS */
%assign REG_SS                  (20000h + 100000h + 200h + 200000000h + 1h)      ; /* SS */
%assign REG_DS                  (40000h + 100000h + 200h + 200000000h + 1h)      ; /* DS */
%assign REG_FS                  (20000h + 200000h + 200h + 200000000h + 1h)      ; /* FS */
%assign REG_GS                  (40000h + 200000h + 200h + 200000000h + 1h)      ; /* GS */
%assign REG_FSGS                (00000h + 200000h + 200h + 200000000h + 1h)      ; /* FS or GS */
%assign REG_SEG67               (00000h + 400000h + 200h + 200000000h + 1h)      ; /* Unimplemented segment registers */

; /* Special GPRs */
%assign REG_SMASK               1FE00000h            ; /* a mask for the following */
%assign REG_ACCUM               (040000h + 000000h + 100h + 000000000h + 4h + 1h)    ; /* accumulator: AL, AX, EAX, RAX */
%assign REG_AL                  (040000h + 000000h + 100h + 100000000h + 4h + 1h)
%assign REG_AX                  (040000h + 000000h + 100h + 200000000h + 4h + 1h)
%assign REG_EAX                 (040000h + 000000h + 100h + 400000000h + 4h + 1h)
%assign REG_RAX                 (040000h + 000000h + 100h + 800000000h + 4h + 1h)
%assign REG_COUNT               (400000h + 080000h + 100h + 000000000h + 4h + 1h)    ; /* counter: CL, CX, ECX, RCX */
%assign REG_CL                  (400000h + 080000h + 100h + 100000000h + 4h + 1h)
%assign REG_CX                  (400000h + 080000h + 100h + 200000000h + 4h + 1h)
%assign REG_ECX                 (400000h + 080000h + 100h + 400000000h + 4h + 1h)
%assign REG_RCX                 (400000h + 080000h + 100h + 800000000h + 4h + 1h)
%assign REG_DL                  (400000h + 100000h + 100h + 100000000h + 4h + 1h)    ; /* data: DL, DX, EDX, RDX */
%assign REG_DX                  (400000h + 100000h + 100h + 200000000h + 4h + 1h)
%assign REG_EDX                 (400000h + 100000h + 100h + 400000000h + 4h + 1h)
%assign REG_RDX                 (400000h + 100000h + 100h + 800000000h + 4h + 1h)
%assign REG_HIGH                (400000h + 200000h + 100h + 100000000h + 4h + 1h)    ; /* high regs: AH, CH, DH, BH */
%assign REG_NOTACC               400000h                                             ; /* non-accumulator register */
%assign REG8NA                  (400000h + 000000h + 100h + 100000000h + 4h + 1h)    ; /*  8-bit non-acc GPR  */
%assign REG16NA                 (400000h + 000000h + 100h + 200000000h + 4h + 1h)    ; /* 16-bit non-acc GPR */
%assign REG32NA                 (400000h + 000000h + 100h + 400000000h + 4h + 1h)    ; /* 32-bit non-acc GPR */
%assign REG64NA                 (400000h + 000000h + 100h + 800000000h + 4h + 1h)    ; /* 64-bit non-acc GPR */

; /* special types of EAs */
%assign MEM_OFFS                (040000h + 0Ch)      ; /* simple [address] offset - absolute! */
%assign IP_REL                  (080000h + 0Ch)      ; /* IP-relative offset */
%assign XMEM                    (100000h + 0Ch)      ; /* 128-bit vector SIB */
%assign YMEM                    (200000h + 0Ch)      ; /* 256-bit vector SIB */
%assign ZMEM                    (400000h + 0Ch)      ; /* 512-bit vector SIB */

; /* memory which matches any type of r/m operand */
%assign MEMORY_ANY              (0Ch + 104h + 804h + 801004h + 802004h + 804004h + 8004h + 10004h)

; /* special immediate values */
%assign UNITY                   (020000h + 2h)   ; /* operand equals 1 */
%assign SBYTEWORD               (040000h + 2h)   ; /* operand is in the range -128..127 mod 2^16 */
%assign SBYTEDWORD              (080000h + 2h)   ; /* operand is in the range -128..127 mod 2^32 */
%assign SDWORD                  (100000h + 2h)   ; /* operand is in the range -0x80000000..0x7FFFFFFF */
%assign UDWORD                  (200000h + 2h)   ; /* operand is in the range 0..0xFFFFFFFF */

; /*
; * Subset of vector registers: register 0 only and registers 0-15.
; * Avoid conflicts in subclass bitfield with any of special EA types!
; */
%assign RM_XMM_L16              (800000h + 1004h)                     ; /* XMM r/m operand  0 ~ 15 */
%assign XMM0                    (040000h + 800000h + 1005h)           ; /* XMM register   zero  */
%assign XMM_L16                 (000000h + 800000h + 1005h)           ; /* XMM register  0 ~ 15 */

%assign RM_YMM_L16              (800000h + 2004h)                     ; /* YMM r/m operand  0 ~ 15 */
%assign YMM0                    (040000h + 800000h + 2005h)           ; /* YMM register   zero  */
%assign YMM_L16                 (000000h + 800000h + 2005h)           ; /* YMM register  0 ~ 15 */

%assign RM_ZMM_L16              (800000h + 4004h)                     ; /* ZMM r/m operand  0 ~ 15 */
%assign ZMM0                    (040000h + 800000h + 4005h)           ; /* ZMM register   zero  */
%assign ZMM_L16                 (000000h + 800000h + 4005h)           ; /* ZMM register  0 ~ 15 */

; /* Register set sizes */
%assign RS2                     080000000000h
%assign RS4                     100000000000h
%assign RS8                     200000000000h
%assign RS16                    400000000000h
%assign RS32                    800000000000h

; =============== S U B R O U T I N E =======================================

; #define IS_SREG(reg)          is_reg_class(REG_SREG, (reg))

IS_REG:
		; esp+4 = reg 
                ;mov    eax, REG_SREG
                ;push   eax
                push    REG_SREG
                jmp     is_reg_class


; =============== S U B R O U T I N E =======================================

; #define IS_FSGS(reg)          is_reg_class(REG_FSGS, (reg))

IS_FSGS:
		; esp+4 = reg 
                ;mov    eax, REG_FSGS
                ;push   eax
                push    REG_FSGS
                jmp     is_reg_class
