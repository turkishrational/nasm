; NASM 2.14.02 port to TRDOS 386 (Beginning: 18/09/2026)
; ---------------------------------------------------------------------------
; NASM Syntax: Erdogan Tan
; Last Update: 07/10/2026
; ===========================================================================
; regdis.asm

; target: NASM.PRG (flat binary)
; main assembly file: nasm386.asm
; library section: libnasm.asm
; TRDOS 386 functions: system.asm 
; data section: data.asm
; bss section: bss.asm
; launcher: crt0.asm

; Source File : 'regdis.c'

; ===========================================================================
; DATA (initialized)
; ===========================================================================

; section .data

; const enum reg_enum nasm_rd_bndreg [ 4] = {R_BND0,R_BND1,R_BND2,R_BND3};

nasm_rd_bndreg:
    dd R_BND0	; 6
    dd R_BND1
    dd R_BND2
    dd R_BND3	; 9

nasm_rd_creg:
    dd R_CR0	; 15
    dd R_CR1
    dd R_CR2
    dd R_CR3	; 24
    dd R_CR4
    dd R_CR5
    dd R_CR6
    dd R_CR7
    dd R_CR8
    dd R_CR9	; 30
    dd R_CR10	; 17
    dd R_CR11
    dd R_CR12
    dd R_CR13
    dd R_CR14
    dd R_CR15	; 22

nasm_rd_dreg:
    dd R_DR0	; 37
    dd R_DR1
    dd R_DR2
    dd R_DR3
    dd R_DR4
    dd R_DR5
    dd R_DR6
    dd R_DR7
    dd R_DR8
    dd R_DR9	; 52
    dd R_DR10	; 39
    dd R_DR11
    dd R_DR12
    dd R_DR13
    dd R_DR14
    dd R_DR15	; 44

nasm_rd_fpureg:
    dd R_ST0	; 129
    dd R_ST1
    dd R_ST2
    dd R_ST3
    dd R_ST4
    dd R_ST5
    dd R_ST6
    dd R_ST7	; 136

nasm_rd_mmxreg:
    dd R_MM0	; 74
    dd R_MM1
    dd R_MM2
    dd R_MM3
    dd R_MM4
    dd R_MM5
    dd R_MM6
    dd R_MM7	; 81

nasm_rd_opmaskreg:
    dd R_K0	; 66
    dd R_K1
    dd R_K2
    dd R_K3
    dd R_K4
    dd R_K5
    dd R_K6
    dd R_K7	; 73

; const enum reg_enum nasm_rd_dreg [16] = 

nasm_rd_reg16:
    dd R_AX	; 3
    dd R_CX	; 32
    dd R_DX	; 54
    dd R_BX	; 12
    dd R_SP	; 126
    dd R_BP	; 10
    dd R_SI	; 124
    dd R_DI	; 34
    dd R_R8W	; 109
    dd R_R9W
    dd R_R10W
    dd R_R11W
    dd R_R12W
    dd R_R13W
    dd R_R14W
    dd R_R15W	; 105

; const enum reg_enum nasm_rd_reg32 [16] = 

nasm_rd_reg32:
    dd R_EAX	; 55
    dd R_ECX	; 58
    dd R_EDX	; 60 
    dd R_EBX	; 57
    dd R_ESP	; 63
    dd R_EBP	; 56
    dd R_ESI	; 62
    dd R_EDI	; 59
    dd R_R8D	; 108
    dd R_R9D
    dd R_R10D
    dd R_R11D
    dd R_R12D
    dd R_R13D
    dd R_R14D
    dd R_R15D	; 104

nasm_rd_reg64:
    dd R_RAX	; 114
    dd R_RCX	; 117
    dd R_RDX	; 119
    dd R_RBX	; 116
    dd R_RSP	; 121
    dd R_RBP	; 115
    dd R_RSI	; 120
    dd R_RDI	; 118
    dd R_R8	; 106
    dd R_R9
    dd R_R10
    dd R_R11
    dd R_R12
    dd R_R13
    dd R_R14
    dd R_R15	; 102

; const enum reg_enum nasm_rd_reg8 [8] = {R_AL,R_CL,R_DL,R_BL,R_AH,R_CH,R_DH,R_BH};

nasm_rd_reg8:
    dd R_AL	; 2
    dd R_CL	; 14
    dd R_DL	; 36
    dd R_BL	; 5
    dd R_AH	; 1
    dd R_CH	; 13
    dd R_DH	; 33
    dd R_BH	; 4

nasm_rd_reg8_rex:
    dd R_AL	; 2
    dd R_CL	; 14
    dd R_DL	; 36
    dd R_BL	; 5
    dd R_SPL	; 127
    dd R_BPL	; 11
    dd R_SIL	; 125
    dd R_DIL	; 35
    dd R_R8B	; 107
    dd R_R9B
    dd R_R10B
    dd R_R11B
    dd R_R12B
    dd R_R13B
    dd R_R14B
    dd R_R15B	; 103

nasm_rd_sreg:
    dd R_ES	; 61
    dd R_CS	; 31
    dd R_SS	; 128
    dd R_DS	; 53
    dd R_FS	; 64
    dd R_GS	; 65
    dd R_SEGR6	; 122
    dd R_SEGR7	; 123

nasm_rd_treg:
    dd R_TR0	; 137
    dd R_TR1
    dd R_TR2
    dd R_TR3
    dd R_TR4
    dd R_TR5
    dd R_TR6
    dd R_TR7	; 144

nasm_rd_xmmreg:
    dd R_XMM0	; 145
    dd R_XMM1	; 146
    dd R_XMM2	; 157
    dd R_XMM3	; 168
    dd R_XMM4
    dd R_XMM5
    dd R_XMM6
    dd R_XMM7
    dd R_XMM8
    dd R_XMM9	; 176
    dd R_XMM10	; 147
    dd R_XMM11
    dd R_XMM12
    dd R_XMM13
    dd R_XMM14
    dd R_XMM15	; 152
    dd R_XMM16
    dd R_XMM17
    dd R_XMM18
    dd R_XMM19
    dd R_XMM20
    dd R_XMM21
    dd R_XMM22
    dd R_XMM23
    dd R_XMM24
    dd R_XMM25
    dd R_XMM26
    dd R_XMM27
    dd R_XMM28
    dd R_XMM29
    dd R_XMM30
    dd R_XMM31	; 170

nasm_rd_ymmreg:
    dd R_YMM0	; 177
    dd R_YMM1	; 178
    dd R_YMM2	; 179
    dd R_YMM3	; 200
    dd R_YMM4
    dd R_YMM5
    dd R_YMM6
    dd R_YMM7
    dd R_YMM8
    dd R_YMM9	; 208
    dd R_YMM10	; 179
    dd R_YMM11
    dd R_YMM12
    dd R_YMM13
    dd R_YMM14
    dd R_YMM15
    dd R_YMM16
    dd R_YMM17
    dd R_YMM18
    dd R_YMM19	; 188
    dd R_YMM20
    dd R_YMM21
    dd R_YMM22
    dd R_YMM23
    dd R_YMM24
    dd R_YMM25
    dd R_YMM26
    dd R_YMM27
    dd R_YMM28
    dd R_YMM29
    dd R_YMM30
    dd R_YMM31	; 202

nasm_rd_zmmreg:
    dd R_ZMM0	; 209
    dd R_ZMM1	; 210
    dd R_ZMM2	; 221
    dd R_ZMM3	; 232
    dd R_ZMM4
    dd R_ZMM5
    dd R_ZMM6
    dd R_ZMM7
    dd R_ZMM8
    dd R_ZMM9	; 240
    dd R_ZMM10	; 211
    dd R_ZMM11
    dd R_ZMM12
    dd R_ZMM13
    dd R_ZMM14
    dd R_ZMM15
    dd R_ZMM16
    dd R_ZMM17
    dd R_ZMM18
    dd R_ZMM19	; 220
    dd R_ZMM20
    dd R_ZMM21
    dd R_ZMM22
    dd R_ZMM23
    dd R_ZMM24
    dd R_ZMM25
    dd R_ZMM26
    dd R_ZMM27
    dd R_ZMM28
    dd R_ZMM29
    dd R_ZMM30
    dd R_ZMM31	; 234


