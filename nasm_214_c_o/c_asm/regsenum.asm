; NASM 2.14.02 port to TRDOS 386 (Beginning: 18/09/2026)
; ---------------------------------------------------------
; by Help of Google GEMINI (1/10/2026) - enumerator.py
; *********************************************************
; regs.h -> regsenum.asm

; regs.h
; -------------
; enum reg_enum {
;    R_zero = 0,
;    R_none = -1,
;    R_AH = EXPR_REG_START,
;    R_AL,
;    R_AX,
;    R_BH,
;    R_BL,
;    R_BND0,
;    R_BND1,
;    R_BND2,
;    R_BND3,
;    R_BP,
;    R_BPL,
;    R_BX,
;    R_CH,
;    R_CL,
;    R_CR0,
;    R_CR1,
;    R_CR10,
;    ......
;    R_ZMM30,
;    R_ZMM31,
;    R_ZMM4,
;    R_ZMM5,
;    R_ZMM6,
;    R_ZMM7,
;    R_ZMM8,
;    R_ZMM9,
;    REG_ENUM_LIMIT
; };

; #define EXPR_REG_END 240

; #define REG_NUM_AH 4
; #define REG_NUM_AL 0
; #define REG_NUM_AX 0
; #define REG_NUM_BH 7
; ........................
; #define REG_NUM_ZMM4 4
; #define REG_NUM_ZMM5 5
; #define REG_NUM_ZMM6 6
; #define REG_NUM_ZMM7 7
; #define REG_NUM_ZMM8 8
; #define REG_NUM_ZMM9 9

; --- Automatically Generated NASM Assignment Constants ---

%assign EXPR_REG_START 1
%assign R_zero 0
%assign R_none -1
%assign R_AH 1
%assign R_AL 2
%assign R_AX 3
%assign R_BH 4
%assign R_BL 5
%assign R_BND0 6
%assign R_BND1 7
%assign R_BND2 8
%assign R_BND3 9
%assign R_BP 10
%assign R_BPL 11
%assign R_BX 12
%assign R_CH 13
%assign R_CL 14
%assign R_CR0 15
%assign R_CR1 16
%assign R_CR10 17
%assign R_CR11 18
%assign R_CR12 19
%assign R_CR13 20
%assign R_CR14 21
%assign R_CR15 22
%assign R_CR2 23
%assign R_CR3 24
%assign R_CR4 25
%assign R_CR5 26
%assign R_CR6 27
%assign R_CR7 28
%assign R_CR8 29
%assign R_CR9 30
%assign R_CS 31
%assign R_CX 32
%assign R_DH 33
%assign R_DI 34
%assign R_DIL 35
%assign R_DL 36
%assign R_DR0 37
%assign R_DR1 38
%assign R_DR10 39
%assign R_DR11 40
%assign R_DR12 41
%assign R_DR13 42
%assign R_DR14 43
%assign R_DR15 44
%assign R_DR2 45
%assign R_DR3 46
%assign R_DR4 47
%assign R_DR5 48
%assign R_DR6 49
%assign R_DR7 50
%assign R_DR8 51
%assign R_DR9 52
%assign R_DS 53
%assign R_DX 54
%assign R_EAX 55
%assign R_EBP 56
%assign R_EBX 57
%assign R_ECX 58
%assign R_EDI 59
%assign R_EDX 60
%assign R_ES 61
%assign R_ESI 62
%assign R_ESP 63
%assign R_FS 64
%assign R_GS 65
%assign R_K0 66
%assign R_K1 67
%assign R_K2 68
%assign R_K3 69
%assign R_K4 70
%assign R_K5 71
%assign R_K6 72
%assign R_K7 73
%assign R_MM0 74
%assign R_MM1 75
%assign R_MM2 76
%assign R_MM3 77
%assign R_MM4 78
%assign R_MM5 79
%assign R_MM6 80
%assign R_MM7 81
%assign R_R10 82
%assign R_R10B 83
%assign R_R10D 84
%assign R_R10W 85
%assign R_R11 86
%assign R_R11B 87
%assign R_R11D 88
%assign R_R11W 89
%assign R_R12 90
%assign R_R12B 91
%assign R_R12D 92
%assign R_R12W 93
%assign R_R13 94
%assign R_R13B 95
%assign R_R13D 96
%assign R_R13W 97
%assign R_R14 98
%assign R_R14B 99
%assign R_R14D 100
%assign R_R14W 101
%assign R_R15 102
%assign R_R15B 103
%assign R_R15D 104
%assign R_R15W 105
%assign R_R8 106
%assign R_R8B 107
%assign R_R8D 108
%assign R_R8W 109
%assign R_R9 110
%assign R_R9B 111
%assign R_R9D 112
%assign R_R9W 113
%assign R_RAX 114
%assign R_RBP 115
%assign R_RBX 116
%assign R_RCX 117
%assign R_RDI 118
%assign R_RDX 119
%assign R_RSI 120
%assign R_RSP 121
%assign R_SEGR6 122
%assign R_SEGR7 123
%assign R_SI 124
%assign R_SIL 125
%assign R_SP 126
%assign R_SPL 127
%assign R_SS 128
%assign R_ST0 129
%assign R_ST1 130
%assign R_ST2 131
%assign R_ST3 132
%assign R_ST4 133
%assign R_ST5 134
%assign R_ST6 135
%assign R_ST7 136
%assign R_TR0 137
%assign R_TR1 138
%assign R_TR2 139
%assign R_TR3 140
%assign R_TR4 141
%assign R_TR5 142
%assign R_TR6 143
%assign R_TR7 144
%assign R_XMM0 145
%assign R_XMM1 146
%assign R_XMM10 147
%assign R_XMM11 148
%assign R_XMM12 149
%assign R_XMM13 150
%assign R_XMM14 151
%assign R_XMM15 152
%assign R_XMM16 153
%assign R_XMM17 154
%assign R_XMM18 155
%assign R_XMM19 156
%assign R_XMM2 157
%assign R_XMM20 158
%assign R_XMM21 159
%assign R_XMM22 160
%assign R_XMM23 161
%assign R_XMM24 162
%assign R_XMM25 163
%assign R_XMM26 164
%assign R_XMM27 165
%assign R_XMM28 166
%assign R_XMM29 167
%assign R_XMM3 168
%assign R_XMM30 169
%assign R_XMM31 170
%assign R_XMM4 171
%assign R_XMM5 172
%assign R_XMM6 173
%assign R_XMM7 174
%assign R_XMM8 175
%assign R_XMM9 176
%assign R_YMM0 177
%assign R_YMM1 178
%assign R_YMM10 179
%assign R_YMM11 180
%assign R_YMM12 181
%assign R_YMM13 182
%assign R_YMM14 183
%assign R_YMM15 184
%assign R_YMM16 185
%assign R_YMM17 186
%assign R_YMM18 187
%assign R_YMM19 188
%assign R_YMM2 189
%assign R_YMM20 190
%assign R_YMM21 191
%assign R_YMM22 192
%assign R_YMM23 193
%assign R_YMM24 194
%assign R_YMM25 195
%assign R_YMM26 196
%assign R_YMM27 197
%assign R_YMM28 198
%assign R_YMM29 199
%assign R_YMM3 200
%assign R_YMM30 201
%assign R_YMM31 202
%assign R_YMM4 203
%assign R_YMM5 204
%assign R_YMM6 205
%assign R_YMM7 206
%assign R_YMM8 207
%assign R_YMM9 208
%assign R_ZMM0 209
%assign R_ZMM1 210
%assign R_ZMM10 211
%assign R_ZMM11 212
%assign R_ZMM12 213
%assign R_ZMM13 214
%assign R_ZMM14 215
%assign R_ZMM15 216
%assign R_ZMM16 217
%assign R_ZMM17 218
%assign R_ZMM18 219
%assign R_ZMM19 220
%assign R_ZMM2 221
%assign R_ZMM20 222
%assign R_ZMM21 223
%assign R_ZMM22 224
%assign R_ZMM23 225
%assign R_ZMM24 226
%assign R_ZMM25 227
%assign R_ZMM26 228
%assign R_ZMM27 229
%assign R_ZMM28 230
%assign R_ZMM29 231
%assign R_ZMM3 232
%assign R_ZMM30 233
%assign R_ZMM31 234
%assign R_ZMM4 235
%assign R_ZMM5 236
%assign R_ZMM6 237
%assign R_ZMM7 238
%assign R_ZMM8 239
%assign R_ZMM9 240
%assign REG_ENUM_LIMIT 241

%assign EXPR_REG_END 240

%assign REG_NUM_AH 4
%assign REG_NUM_AL 0
%assign REG_NUM_AX 0
%assign REG_NUM_BH 7
%assign REG_NUM_BL 3
%assign REG_NUM_BND0 0
%assign REG_NUM_BND1 1
%assign REG_NUM_BND2 2
%assign REG_NUM_BND3 3
%assign REG_NUM_BP 5
%assign REG_NUM_BPL 5
%assign REG_NUM_BX 3
%assign REG_NUM_CH 5
%assign REG_NUM_CL 1
%assign REG_NUM_CR0 0
%assign REG_NUM_CR1 1
%assign REG_NUM_CR10 10
%assign REG_NUM_CR11 11
%assign REG_NUM_CR12 12
%assign REG_NUM_CR13 13
%assign REG_NUM_CR14 14
%assign REG_NUM_CR15 15
%assign REG_NUM_CR2 2
%assign REG_NUM_CR3 3
%assign REG_NUM_CR4 4
%assign REG_NUM_CR5 5
%assign REG_NUM_CR6 6
%assign REG_NUM_CR7 7
%assign REG_NUM_CR8 8
%assign REG_NUM_CR9 9
%assign REG_NUM_CS 1
%assign REG_NUM_CX 1
%assign REG_NUM_DH 6
%assign REG_NUM_DI 7
%assign REG_NUM_DIL 7
%assign REG_NUM_DL 2
%assign REG_NUM_DR0 0
%assign REG_NUM_DR1 1
%assign REG_NUM_DR10 10
%assign REG_NUM_DR11 11
%assign REG_NUM_DR12 12
%assign REG_NUM_DR13 13
%assign REG_NUM_DR14 14
%assign REG_NUM_DR15 15
%assign REG_NUM_DR2 2
%assign REG_NUM_DR3 3
%assign REG_NUM_DR4 4
%assign REG_NUM_DR5 5
%assign REG_NUM_DR6 6
%assign REG_NUM_DR7 7
%assign REG_NUM_DR8 8
%assign REG_NUM_DR9 9
%assign REG_NUM_DS 3
%assign REG_NUM_DX 2
%assign REG_NUM_EAX 0
%assign REG_NUM_EBP 5
%assign REG_NUM_EBX 3
%assign REG_NUM_ECX 1
%assign REG_NUM_EDI 7
%assign REG_NUM_EDX 2
%assign REG_NUM_ES 0
%assign REG_NUM_ESI 6
%assign REG_NUM_ESP 4
%assign REG_NUM_FS 4
%assign REG_NUM_GS 5
%assign REG_NUM_K0 0
%assign REG_NUM_K1 1
%assign REG_NUM_K2 2
%assign REG_NUM_K3 3
%assign REG_NUM_K4 4
%assign REG_NUM_K5 5
%assign REG_NUM_K6 6
%assign REG_NUM_K7 7
%assign REG_NUM_MM0 0
%assign REG_NUM_MM1 1
%assign REG_NUM_MM2 2
%assign REG_NUM_MM3 3
%assign REG_NUM_MM4 4
%assign REG_NUM_MM5 5
%assign REG_NUM_MM6 6
%assign REG_NUM_MM7 7
%assign REG_NUM_R10 10
%assign REG_NUM_R10B 10
%assign REG_NUM_R10D 10
%assign REG_NUM_R10W 10
%assign REG_NUM_R11 11
%assign REG_NUM_R11B 11
%assign REG_NUM_R11D 11
%assign REG_NUM_R11W 11
%assign REG_NUM_R12 12
%assign REG_NUM_R12B 12
%assign REG_NUM_R12D 12
%assign REG_NUM_R12W 12
%assign REG_NUM_R13 13
%assign REG_NUM_R13B 13
%assign REG_NUM_R13D 13
%assign REG_NUM_R13W 13
%assign REG_NUM_R14 14
%assign REG_NUM_R14B 14
%assign REG_NUM_R14D 14
%assign REG_NUM_R14W 14
%assign REG_NUM_R15 15
%assign REG_NUM_R15B 15
%assign REG_NUM_R15D 15
%assign REG_NUM_R15W 15
%assign REG_NUM_R8 8
%assign REG_NUM_R8B 8
%assign REG_NUM_R8D 8
%assign REG_NUM_R8W 8
%assign REG_NUM_R9 9
%assign REG_NUM_R9B 9
%assign REG_NUM_R9D 9
%assign REG_NUM_R9W 9
%assign REG_NUM_RAX 0
%assign REG_NUM_RBP 5
%assign REG_NUM_RBX 3
%assign REG_NUM_RCX 1
%assign REG_NUM_RDI 7
%assign REG_NUM_RDX 2
%assign REG_NUM_RSI 6
%assign REG_NUM_RSP 4
%assign REG_NUM_SEGR6 6
%assign REG_NUM_SEGR7 7
%assign REG_NUM_SI 6
%assign REG_NUM_SIL 6
%assign REG_NUM_SP 4
%assign REG_NUM_SPL 4
%assign REG_NUM_SS 2
%assign REG_NUM_ST0 0
%assign REG_NUM_ST1 1
%assign REG_NUM_ST2 2
%assign REG_NUM_ST3 3
%assign REG_NUM_ST4 4
%assign REG_NUM_ST5 5
%assign REG_NUM_ST6 6
%assign REG_NUM_ST7 7
%assign REG_NUM_TR0 0
%assign REG_NUM_TR1 1
%assign REG_NUM_TR2 2
%assign REG_NUM_TR3 3
%assign REG_NUM_TR4 4
%assign REG_NUM_TR5 5
%assign REG_NUM_TR6 6
%assign REG_NUM_TR7 7
%assign REG_NUM_XMM0 0
%assign REG_NUM_XMM1 1
%assign REG_NUM_XMM10 10
%assign REG_NUM_XMM11 11
%assign REG_NUM_XMM12 12
%assign REG_NUM_XMM13 13
%assign REG_NUM_XMM14 14
%assign REG_NUM_XMM15 15
%assign REG_NUM_XMM16 16
%assign REG_NUM_XMM17 17
%assign REG_NUM_XMM18 18
%assign REG_NUM_XMM19 19
%assign REG_NUM_XMM2 2
%assign REG_NUM_XMM20 20
%assign REG_NUM_XMM21 21
%assign REG_NUM_XMM22 22
%assign REG_NUM_XMM23 23
%assign REG_NUM_XMM24 24
%assign REG_NUM_XMM25 25
%assign REG_NUM_XMM26 26
%assign REG_NUM_XMM27 27
%assign REG_NUM_XMM28 28
%assign REG_NUM_XMM29 29
%assign REG_NUM_XMM3 3
%assign REG_NUM_XMM30 30
%assign REG_NUM_XMM31 31
%assign REG_NUM_XMM4 4
%assign REG_NUM_XMM5 5
%assign REG_NUM_XMM6 6
%assign REG_NUM_XMM7 7
%assign REG_NUM_XMM8 8
%assign REG_NUM_XMM9 9
%assign REG_NUM_YMM0 0
%assign REG_NUM_YMM1 1
%assign REG_NUM_YMM10 10
%assign REG_NUM_YMM11 11
%assign REG_NUM_YMM12 12
%assign REG_NUM_YMM13 13
%assign REG_NUM_YMM14 14
%assign REG_NUM_YMM15 15
%assign REG_NUM_YMM16 16
%assign REG_NUM_YMM17 17
%assign REG_NUM_YMM18 18
%assign REG_NUM_YMM19 19
%assign REG_NUM_YMM2 2
%assign REG_NUM_YMM20 20
%assign REG_NUM_YMM21 21
%assign REG_NUM_YMM22 22
%assign REG_NUM_YMM23 23
%assign REG_NUM_YMM24 24
%assign REG_NUM_YMM25 25
%assign REG_NUM_YMM26 26
%assign REG_NUM_YMM27 27
%assign REG_NUM_YMM28 28
%assign REG_NUM_YMM29 29
%assign REG_NUM_YMM3 3
%assign REG_NUM_YMM30 30
%assign REG_NUM_YMM31 31
%assign REG_NUM_YMM4 4
%assign REG_NUM_YMM5 5
%assign REG_NUM_YMM6 6
%assign REG_NUM_YMM7 7
%assign REG_NUM_YMM8 8
%assign REG_NUM_YMM9 9
%assign REG_NUM_ZMM0 0
%assign REG_NUM_ZMM1 1
%assign REG_NUM_ZMM10 10
%assign REG_NUM_ZMM11 11
%assign REG_NUM_ZMM12 12
%assign REG_NUM_ZMM13 13
%assign REG_NUM_ZMM14 14
%assign REG_NUM_ZMM15 15
%assign REG_NUM_ZMM16 16
%assign REG_NUM_ZMM17 17
%assign REG_NUM_ZMM18 18
%assign REG_NUM_ZMM19 19
%assign REG_NUM_ZMM2 2
%assign REG_NUM_ZMM20 20
%assign REG_NUM_ZMM21 21
%assign REG_NUM_ZMM22 22
%assign REG_NUM_ZMM23 23
%assign REG_NUM_ZMM24 24
%assign REG_NUM_ZMM25 25
%assign REG_NUM_ZMM26 26
%assign REG_NUM_ZMM27 27
%assign REG_NUM_ZMM28 28
%assign REG_NUM_ZMM29 29
%assign REG_NUM_ZMM3 3
%assign REG_NUM_ZMM30 30
%assign REG_NUM_ZMM31 31
%assign REG_NUM_ZMM4 4
%assign REG_NUM_ZMM5 5
%assign REG_NUM_ZMM6 6
%assign REG_NUM_ZMM7 7
%assign REG_NUM_ZMM8 8
%assign REG_NUM_ZMM9 9

