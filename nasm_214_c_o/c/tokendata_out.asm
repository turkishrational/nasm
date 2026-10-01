; --- Otomatik Uretilen NASM Tablosu ---
section .data

%macro TOK 5
    dd %1
    dw %2
    db %3
    db %4
    dd %5
%endmacro

; --- 1. String Tanımları (Ayrı Bölge) ---
    t_db: db "db", 0
    t_dw: db "dw", 0
    t_dd: db "dd", 0
    t_dq: db "dq", 0
    t_dt: db "dt", 0
    t_do: db "do", 0
    t_dy: db "dy", 0
    t_dz: db "dz", 0
    t_resb: db "resb", 0
    t_resw: db "resw", 0
    t_resd: db "resd", 0
    t_resq: db "resq", 0
    t_rest: db "rest", 0
    t_reso: db "reso", 0
    t_resy: db "resy", 0
    t_resz: db "resz", 0
    t_incbin: db "incbin", 0
    t_aaa: db "aaa", 0
    t_aad: db "aad", 0
    t_aam: db "aam", 0
    t_aas: db "aas", 0
    t_adc: db "adc", 0
    t_add: db "add", 0
    t_and: db "and", 0
    t_arpl: db "arpl", 0
    t_bb0_reset: db "bb0_reset", 0
    t_bb1_reset: db "bb1_reset", 0
    t_bound: db "bound", 0
    t_bsf: db "bsf", 0
    t_bsr: db "bsr", 0
    t_bswap: db "bswap", 0
    t_bt: db "bt", 0
    t_btc: db "btc", 0
    t_btr: db "btr", 0
    t_bts: db "bts", 0
    t_call: db "call", 0
    t_cbw: db "cbw", 0
    t_cdq: db "cdq", 0
    t_cdqe: db "cdqe", 0
    t_clc: db "clc", 0
    t_cld: db "cld", 0
    t_cli: db "cli", 0
    t_clts: db "clts", 0
    t_cmc: db "cmc", 0
    t_cmp: db "cmp", 0
    t_cmpsb: db "cmpsb", 0
    t_cmpsd: db "cmpsd", 0
    t_cmpsq: db "cmpsq", 0
    t_cmpsw: db "cmpsw", 0
    t_cmpxchg: db "cmpxchg", 0
    t_cmpxchg486: db "cmpxchg486", 0
    t_cmpxchg8b: db "cmpxchg8b", 0
    t_cmpxchg16b: db "cmpxchg16b", 0
    t_cpuid: db "cpuid", 0
    t_cpu_read: db "cpu_read", 0
    t_cpu_write: db "cpu_write", 0
    t_cqo: db "cqo", 0
    t_cwd: db "cwd", 0
    t_cwde: db "cwde", 0
    t_daa: db "daa", 0
    t_das: db "das", 0
    t_dec: db "dec", 0
    t_div: db "div", 0
    t_dmint: db "dmint", 0
    t_emms: db "emms", 0
    t_enter: db "enter", 0
    t_equ: db "equ", 0
    t_f2xm1: db "f2xm1", 0
    t_fabs: db "fabs", 0
    t_fadd: db "fadd", 0
    t_faddp: db "faddp", 0
    t_fbld: db "fbld", 0
    t_fbstp: db "fbstp", 0
    t_fchs: db "fchs", 0
    t_fclex: db "fclex", 0
    t_fcmovb: db "fcmovb", 0
    t_fcmovbe: db "fcmovbe", 0
    t_fcmove: db "fcmove", 0
    t_fcmovnb: db "fcmovnb", 0
    t_fcmovnbe: db "fcmovnbe", 0
    t_fcmovne: db "fcmovne", 0
    t_fcmovnu: db "fcmovnu", 0
    t_fcmovu: db "fcmovu", 0
    t_fcom: db "fcom", 0
    t_fcomi: db "fcomi", 0
    t_fcomip: db "fcomip", 0
    t_fcomp: db "fcomp", 0
    t_fcompp: db "fcompp", 0
    t_fcos: db "fcos", 0
    t_fdecstp: db "fdecstp", 0
    t_fdisi: db "fdisi", 0
    t_fdiv: db "fdiv", 0
    t_fdivp: db "fdivp", 0
    t_fdivr: db "fdivr", 0
    t_fdivrp: db "fdivrp", 0
    t_femms: db "femms", 0
    t_feni: db "feni", 0
    t_ffree: db "ffree", 0
    t_ffreep: db "ffreep", 0
    t_fiadd: db "fiadd", 0
    t_ficom: db "ficom", 0
    t_ficomp: db "ficomp", 0
    t_fidiv: db "fidiv", 0
    t_fidivr: db "fidivr", 0
    t_fild: db "fild", 0
    t_fimul: db "fimul", 0
    t_fincstp: db "fincstp", 0
    t_finit: db "finit", 0
    t_fist: db "fist", 0
    t_fistp: db "fistp", 0
    t_fisttp: db "fisttp", 0
    t_fisub: db "fisub", 0
    t_fisubr: db "fisubr", 0
    t_fld: db "fld", 0
    t_fld1: db "fld1", 0
    t_fldcw: db "fldcw", 0
    t_fldenv: db "fldenv", 0
    t_fldl2e: db "fldl2e", 0
    t_fldl2t: db "fldl2t", 0
    t_fldlg2: db "fldlg2", 0
    t_fldln2: db "fldln2", 0
    t_fldpi: db "fldpi", 0
    t_fldz: db "fldz", 0
    t_fmul: db "fmul", 0
    t_fmulp: db "fmulp", 0
    t_fnclex: db "fnclex", 0
    t_fndisi: db "fndisi", 0
    t_fneni: db "fneni", 0
    t_fninit: db "fninit", 0
    t_fnop: db "fnop", 0
    t_fnsave: db "fnsave", 0
    t_fnstcw: db "fnstcw", 0
    t_fnstenv: db "fnstenv", 0
    t_fnstsw: db "fnstsw", 0
    t_fpatan: db "fpatan", 0
    t_fprem: db "fprem", 0
    t_fprem1: db "fprem1", 0
    t_fptan: db "fptan", 0
    t_frndint: db "frndint", 0
    t_frstor: db "frstor", 0
    t_fsave: db "fsave", 0
    t_fscale: db "fscale", 0
    t_fsetpm: db "fsetpm", 0
    t_fsin: db "fsin", 0
    t_fsincos: db "fsincos", 0
    t_fsqrt: db "fsqrt", 0
    t_fst: db "fst", 0
    t_fstcw: db "fstcw", 0
    t_fstenv: db "fstenv", 0
    t_fstp: db "fstp", 0
    t_fstsw: db "fstsw", 0
    t_fsub: db "fsub", 0
    t_fsubp: db "fsubp", 0
    t_fsubr: db "fsubr", 0
    t_fsubrp: db "fsubrp", 0
    t_ftst: db "ftst", 0
    t_fucom: db "fucom", 0
    t_fucomi: db "fucomi", 0
    t_fucomip: db "fucomip", 0
    t_fucomp: db "fucomp", 0
    t_fucompp: db "fucompp", 0
    t_fxam: db "fxam", 0
    t_fxch: db "fxch", 0
    t_fxtract: db "fxtract", 0
    t_fyl2x: db "fyl2x", 0
    t_fyl2xp1: db "fyl2xp1", 0
    t_hlt: db "hlt", 0
    t_ibts: db "ibts", 0
    t_icebp: db "icebp", 0
    t_idiv: db "idiv", 0
    t_imul: db "imul", 0
    t_in: db "in", 0
    t_inc: db "inc", 0
    t_insb: db "insb", 0
    t_insd: db "insd", 0
    t_insw: db "insw", 0
    t_int: db "int", 0
    t_int01: db "int01", 0
    t_int1: db "int1", 0
    t_int03: db "int03", 0
    t_int3: db "int3", 0
    t_into: db "into", 0
    t_invd: db "invd", 0
    t_invpcid: db "invpcid", 0
    t_invlpg: db "invlpg", 0
    t_invlpga: db "invlpga", 0
    t_iret: db "iret", 0
    t_iretd: db "iretd", 0
    t_iretq: db "iretq", 0
    t_iretw: db "iretw", 0
    t_jcxz: db "jcxz", 0
    t_jecxz: db "jecxz", 0
    t_jrcxz: db "jrcxz", 0
    t_jmp: db "jmp", 0
    t_jmpe: db "jmpe", 0
    t_lahf: db "lahf", 0
    t_lar: db "lar", 0
    t_lds: db "lds", 0
    t_lea: db "lea", 0
    t_leave: db "leave", 0
    t_les: db "les", 0
    t_lfence: db "lfence", 0
    t_lfs: db "lfs", 0
    t_lgdt: db "lgdt", 0
    t_lgs: db "lgs", 0
    t_lidt: db "lidt", 0
    t_lldt: db "lldt", 0
    t_lmsw: db "lmsw", 0
    t_loadall: db "loadall", 0
    t_loadall286: db "loadall286", 0
    t_lodsb: db "lodsb", 0
    t_lodsd: db "lodsd", 0
    t_lodsq: db "lodsq", 0
    t_lodsw: db "lodsw", 0
    t_loop: db "loop", 0
    t_loope: db "loope", 0
    t_loopne: db "loopne", 0
    t_loopnz: db "loopnz", 0
    t_loopz: db "loopz", 0
    t_lsl: db "lsl", 0
    t_lss: db "lss", 0
    t_ltr: db "ltr", 0
    t_mfence: db "mfence", 0
    t_monitor: db "monitor", 0
    t_monitorx: db "monitorx", 0
    t_mov: db "mov", 0
    t_movd: db "movd", 0
    t_movq: db "movq", 0
    t_movsb: db "movsb", 0
    t_movsd: db "movsd", 0
    t_movsq: db "movsq", 0
    t_movsw: db "movsw", 0
    t_movsx: db "movsx", 0
    t_movsxd: db "movsxd", 0
    t_movzx: db "movzx", 0
    t_mul: db "mul", 0
    t_mwait: db "mwait", 0
    t_mwaitx: db "mwaitx", 0
    t_neg: db "neg", 0
    t_nop: db "nop", 0
    t_not: db "not", 0
    t_or: db "or", 0
    t_out: db "out", 0
    t_outsb: db "outsb", 0
    t_outsd: db "outsd", 0
    t_outsw: db "outsw", 0
    t_packssdw: db "packssdw", 0
    t_packsswb: db "packsswb", 0
    t_packuswb: db "packuswb", 0
    t_paddb: db "paddb", 0
    t_paddd: db "paddd", 0
    t_paddsb: db "paddsb", 0
    t_paddsiw: db "paddsiw", 0
    t_paddsw: db "paddsw", 0
    t_paddusb: db "paddusb", 0
    t_paddusw: db "paddusw", 0
    t_paddw: db "paddw", 0
    t_pand: db "pand", 0
    t_pandn: db "pandn", 0
    t_pause: db "pause", 0
    t_paveb: db "paveb", 0
    t_pavgusb: db "pavgusb", 0
    t_pcmpeqb: db "pcmpeqb", 0
    t_pcmpeqd: db "pcmpeqd", 0
    t_pcmpeqw: db "pcmpeqw", 0
    t_pcmpgtb: db "pcmpgtb", 0
    t_pcmpgtd: db "pcmpgtd", 0
    t_pcmpgtw: db "pcmpgtw", 0
    t_pdistib: db "pdistib", 0
    t_pf2id: db "pf2id", 0
    t_pfacc: db "pfacc", 0
    t_pfadd: db "pfadd", 0
    t_pfcmpeq: db "pfcmpeq", 0
    t_pfcmpge: db "pfcmpge", 0
    t_pfcmpgt: db "pfcmpgt", 0
    t_pfmax: db "pfmax", 0
    t_pfmin: db "pfmin", 0
    t_pfmul: db "pfmul", 0
    t_pfrcp: db "pfrcp", 0
    t_pfrcpit1: db "pfrcpit1", 0
    t_pfrcpit2: db "pfrcpit2", 0
    t_pfrsqit1: db "pfrsqit1", 0
    t_pfrsqrt: db "pfrsqrt", 0
    t_pfsub: db "pfsub", 0
    t_pfsubr: db "pfsubr", 0
    t_pi2fd: db "pi2fd", 0
    t_pmachriw: db "pmachriw", 0
    t_pmaddwd: db "pmaddwd", 0
    t_pmagw: db "pmagw", 0
    t_pmulhriw: db "pmulhriw", 0
    t_pmulhrwa: db "pmulhrwa", 0
    t_pmulhrwc: db "pmulhrwc", 0
    t_pmulhw: db "pmulhw", 0
    t_pmullw: db "pmullw", 0
    t_pmvgezb: db "pmvgezb", 0
    t_pmvlzb: db "pmvlzb", 0
    t_pmvnzb: db "pmvnzb", 0
    t_pmvzb: db "pmvzb", 0
    t_pop: db "pop", 0
    t_popa: db "popa", 0
    t_popad: db "popad", 0
    t_popaw: db "popaw", 0
    t_popf: db "popf", 0
    t_popfd: db "popfd", 0
    t_popfq: db "popfq", 0
    t_popfw: db "popfw", 0
    t_por: db "por", 0
    t_prefetch: db "prefetch", 0
    t_prefetchw: db "prefetchw", 0
    t_pslld: db "pslld", 0
    t_psllq: db "psllq", 0
    t_psllw: db "psllw", 0
    t_psrad: db "psrad", 0
    t_psraw: db "psraw", 0
    t_psrld: db "psrld", 0
    t_psrlq: db "psrlq", 0
    t_psrlw: db "psrlw", 0
    t_psubb: db "psubb", 0
    t_psubd: db "psubd", 0
    t_psubsb: db "psubsb", 0
    t_psubsiw: db "psubsiw", 0
    t_psubsw: db "psubsw", 0
    t_psubusb: db "psubusb", 0
    t_psubusw: db "psubusw", 0
    t_psubw: db "psubw", 0
    t_punpckhbw: db "punpckhbw", 0
    t_punpckhdq: db "punpckhdq", 0
    t_punpckhwd: db "punpckhwd", 0
    t_punpcklbw: db "punpcklbw", 0
    t_punpckldq: db "punpckldq", 0
    t_punpcklwd: db "punpcklwd", 0
    t_push: db "push", 0
    t_pusha: db "pusha", 0
    t_pushad: db "pushad", 0
    t_pushaw: db "pushaw", 0
    t_pushf: db "pushf", 0
    t_pushfd: db "pushfd", 0
    t_pushfq: db "pushfq", 0
    t_pushfw: db "pushfw", 0
    t_pxor: db "pxor", 0
    t_rcl: db "rcl", 0
    t_rcr: db "rcr", 0
    t_rdshr: db "rdshr", 0
    t_rdmsr: db "rdmsr", 0
    t_rdpmc: db "rdpmc", 0
    t_rdtsc: db "rdtsc", 0
    t_rdtscp: db "rdtscp", 0
    t_ret: db "ret", 0
    t_retf: db "retf", 0
    t_retn: db "retn", 0
    t_retw: db "retw", 0
    t_retfw: db "retfw", 0
    t_retnw: db "retnw", 0
    t_retd: db "retd", 0
    t_retfd: db "retfd", 0
    t_retnd: db "retnd", 0
    t_retq: db "retq", 0
    t_retfq: db "retfq", 0
    t_retnq: db "retnq", 0
    t_rol: db "rol", 0
    t_ror: db "ror", 0
    t_rdm: db "rdm", 0
    t_rsdc: db "rsdc", 0
    t_rsldt: db "rsldt", 0
    t_rsm: db "rsm", 0
    t_rsts: db "rsts", 0
    t_sahf: db "sahf", 0
    t_sal: db "sal", 0
    t_salc: db "salc", 0
    t_sar: db "sar", 0
    t_sbb: db "sbb", 0
    t_scasb: db "scasb", 0
    t_scasd: db "scasd", 0
    t_scasq: db "scasq", 0
    t_scasw: db "scasw", 0
    t_sfence: db "sfence", 0
    t_sgdt: db "sgdt", 0
    t_shl: db "shl", 0
    t_shld: db "shld", 0
    t_shr: db "shr", 0
    t_shrd: db "shrd", 0
    t_sidt: db "sidt", 0
    t_sldt: db "sldt", 0
    t_skinit: db "skinit", 0
    t_smi: db "smi", 0
    t_smint: db "smint", 0
    t_smintold: db "smintold", 0
    t_smsw: db "smsw", 0
    t_stc: db "stc", 0
    t_std: db "std", 0
    t_sti: db "sti", 0
    t_stosb: db "stosb", 0
    t_stosd: db "stosd", 0
    t_stosq: db "stosq", 0
    t_stosw: db "stosw", 0
    t_str: db "str", 0
    t_sub: db "sub", 0
    t_svdc: db "svdc", 0
    t_svldt: db "svldt", 0
    t_svts: db "svts", 0
    t_swapgs: db "swapgs", 0
    t_syscall: db "syscall", 0
    t_sysenter: db "sysenter", 0
    t_sysexit: db "sysexit", 0
    t_sysret: db "sysret", 0
    t_test: db "test", 0
    t_ud0: db "ud0", 0
    t_ud1: db "ud1", 0
    t_ud2b: db "ud2b", 0
    t_ud2: db "ud2", 0
    t_ud2a: db "ud2a", 0
    t_umov: db "umov", 0
    t_verr: db "verr", 0
    t_verw: db "verw", 0
    t_fwait: db "fwait", 0
    t_wbinvd: db "wbinvd", 0
    t_wrshr: db "wrshr", 0
    t_wrmsr: db "wrmsr", 0
    t_xadd: db "xadd", 0
    t_xbts: db "xbts", 0
    t_xchg: db "xchg", 0
    t_xlatb: db "xlatb", 0
    t_xlat: db "xlat", 0
    t_xor: db "xor", 0
    t_cmova: db "cmova", 0
    t_cmovae: db "cmovae", 0
    t_cmovb: db "cmovb", 0
    t_cmovbe: db "cmovbe", 0
    t_cmovc: db "cmovc", 0
    t_cmove: db "cmove", 0
    t_cmovg: db "cmovg", 0
    t_cmovge: db "cmovge", 0
    t_cmovl: db "cmovl", 0
    t_cmovle: db "cmovle", 0
    t_cmovna: db "cmovna", 0
    t_cmovnae: db "cmovnae", 0
    t_cmovnb: db "cmovnb", 0
    t_cmovnbe: db "cmovnbe", 0
    t_cmovnc: db "cmovnc", 0
    t_cmovne: db "cmovne", 0
    t_cmovng: db "cmovng", 0
    t_cmovnge: db "cmovnge", 0
    t_cmovnl: db "cmovnl", 0
    t_cmovnle: db "cmovnle", 0
    t_cmovno: db "cmovno", 0
    t_cmovnp: db "cmovnp", 0
    t_cmovns: db "cmovns", 0
    t_cmovnz: db "cmovnz", 0
    t_cmovo: db "cmovo", 0
    t_cmovp: db "cmovp", 0
    t_cmovpe: db "cmovpe", 0
    t_cmovpo: db "cmovpo", 0
    t_cmovs: db "cmovs", 0
    t_cmovz: db "cmovz", 0
    t_ja: db "ja", 0
    t_jae: db "jae", 0
    t_jb: db "jb", 0
    t_jbe: db "jbe", 0
    t_jc: db "jc", 0
    t_je: db "je", 0
    t_jg: db "jg", 0
    t_jge: db "jge", 0
    t_jl: db "jl", 0
    t_jle: db "jle", 0
    t_jna: db "jna", 0
    t_jnae: db "jnae", 0
    t_jnb: db "jnb", 0
    t_jnbe: db "jnbe", 0
    t_jnc: db "jnc", 0
    t_jne: db "jne", 0
    t_jng: db "jng", 0
    t_jnge: db "jnge", 0
    t_jnl: db "jnl", 0
    t_jnle: db "jnle", 0
    t_jno: db "jno", 0
    t_jnp: db "jnp", 0
    t_jns: db "jns", 0
    t_jnz: db "jnz", 0
    t_jo: db "jo", 0
    t_jp: db "jp", 0
    t_jpe: db "jpe", 0
    t_jpo: db "jpo", 0
    t_js: db "js", 0
    t_jz: db "jz", 0
    t_seta: db "seta", 0
    t_setae: db "setae", 0
    t_setb: db "setb", 0
    t_setbe: db "setbe", 0
    t_setc: db "setc", 0
    t_sete: db "sete", 0
    t_setg: db "setg", 0
    t_setge: db "setge", 0
    t_setl: db "setl", 0
    t_setle: db "setle", 0
    t_setna: db "setna", 0
    t_setnae: db "setnae", 0
    t_setnb: db "setnb", 0
    t_setnbe: db "setnbe", 0
    t_setnc: db "setnc", 0
    t_setne: db "setne", 0
    t_setng: db "setng", 0
    t_setnge: db "setnge", 0
    t_setnl: db "setnl", 0
    t_setnle: db "setnle", 0
    t_setno: db "setno", 0
    t_setnp: db "setnp", 0
    t_setns: db "setns", 0
    t_setnz: db "setnz", 0
    t_seto: db "seto", 0
    t_setp: db "setp", 0
    t_setpe: db "setpe", 0
    t_setpo: db "setpo", 0
    t_sets: db "sets", 0
    t_setz: db "setz", 0
    t_addps: db "addps", 0
    t_addss: db "addss", 0
    t_andnps: db "andnps", 0
    t_andps: db "andps", 0
    t_cmpeqps: db "cmpeqps", 0
    t_cmpeqss: db "cmpeqss", 0
    t_cmpleps: db "cmpleps", 0
    t_cmpless: db "cmpless", 0
    t_cmpltps: db "cmpltps", 0
    t_cmpltss: db "cmpltss", 0
    t_cmpneqps: db "cmpneqps", 0
    t_cmpneqss: db "cmpneqss", 0
    t_cmpnleps: db "cmpnleps", 0
    t_cmpnless: db "cmpnless", 0
    t_cmpnltps: db "cmpnltps", 0
    t_cmpnltss: db "cmpnltss", 0
    t_cmpordps: db "cmpordps", 0
    t_cmpordss: db "cmpordss", 0
    t_cmpunordps: db "cmpunordps", 0
    t_cmpunordss: db "cmpunordss", 0
    t_cmpps: db "cmpps", 0
    t_cmpss: db "cmpss", 0
    t_comiss: db "comiss", 0
    t_cvtpi2ps: db "cvtpi2ps", 0
    t_cvtps2pi: db "cvtps2pi", 0
    t_cvtsi2ss: db "cvtsi2ss", 0
    t_cvtss2si: db "cvtss2si", 0
    t_cvttps2pi: db "cvttps2pi", 0
    t_cvttss2si: db "cvttss2si", 0
    t_divps: db "divps", 0
    t_divss: db "divss", 0
    t_ldmxcsr: db "ldmxcsr", 0
    t_maxps: db "maxps", 0
    t_maxss: db "maxss", 0
    t_minps: db "minps", 0
    t_minss: db "minss", 0
    t_movaps: db "movaps", 0
    t_movhps: db "movhps", 0
    t_movlhps: db "movlhps", 0
    t_movlps: db "movlps", 0
    t_movhlps: db "movhlps", 0
    t_movmskps: db "movmskps", 0
    t_movntps: db "movntps", 0
    t_movss: db "movss", 0
    t_movups: db "movups", 0
    t_mulps: db "mulps", 0
    t_mulss: db "mulss", 0
    t_orps: db "orps", 0
    t_rcpps: db "rcpps", 0
    t_rcpss: db "rcpss", 0
    t_rsqrtps: db "rsqrtps", 0
    t_rsqrtss: db "rsqrtss", 0
    t_shufps: db "shufps", 0
    t_sqrtps: db "sqrtps", 0
    t_sqrtss: db "sqrtss", 0
    t_stmxcsr: db "stmxcsr", 0
    t_subps: db "subps", 0
    t_subss: db "subss", 0
    t_ucomiss: db "ucomiss", 0
    t_unpckhps: db "unpckhps", 0
    t_unpcklps: db "unpcklps", 0
    t_xorps: db "xorps", 0
    t_fxrstor: db "fxrstor", 0
    t_fxrstor64: db "fxrstor64", 0
    t_fxsave: db "fxsave", 0
    t_fxsave64: db "fxsave64", 0
    t_xgetbv: db "xgetbv", 0
    t_xsetbv: db "xsetbv", 0
    t_xsave: db "xsave", 0
    t_xsave64: db "xsave64", 0
    t_xsavec: db "xsavec", 0
    t_xsavec64: db "xsavec64", 0
    t_xsaveopt: db "xsaveopt", 0
    t_xsaveopt64: db "xsaveopt64", 0
    t_xsaves: db "xsaves", 0
    t_xsaves64: db "xsaves64", 0
    t_xrstor: db "xrstor", 0
    t_xrstor64: db "xrstor64", 0
    t_xrstors: db "xrstors", 0
    t_xrstors64: db "xrstors64", 0
    t_prefetchnta: db "prefetchnta", 0
    t_prefetcht0: db "prefetcht0", 0
    t_prefetcht1: db "prefetcht1", 0
    t_prefetcht2: db "prefetcht2", 0
    t_maskmovq: db "maskmovq", 0
    t_movntq: db "movntq", 0
    t_pavgb: db "pavgb", 0
    t_pavgw: db "pavgw", 0
    t_pextrw: db "pextrw", 0
    t_pinsrw: db "pinsrw", 0
    t_pmaxsw: db "pmaxsw", 0
    t_pmaxub: db "pmaxub", 0
    t_pminsw: db "pminsw", 0
    t_pminub: db "pminub", 0
    t_pmovmskb: db "pmovmskb", 0
    t_pmulhuw: db "pmulhuw", 0
    t_psadbw: db "psadbw", 0
    t_pshufw: db "pshufw", 0
    t_pf2iw: db "pf2iw", 0
    t_pfnacc: db "pfnacc", 0
    t_pfpnacc: db "pfpnacc", 0
    t_pi2fw: db "pi2fw", 0
    t_pswapd: db "pswapd", 0
    t_maskmovdqu: db "maskmovdqu", 0
    t_clflush: db "clflush", 0
    t_movntdq: db "movntdq", 0
    t_movnti: db "movnti", 0
    t_movntpd: db "movntpd", 0
    t_movdqa: db "movdqa", 0
    t_movdqu: db "movdqu", 0
    t_movdq2q: db "movdq2q", 0
    t_movq2dq: db "movq2dq", 0
    t_paddq: db "paddq", 0
    t_pmuludq: db "pmuludq", 0
    t_pshufd: db "pshufd", 0
    t_pshufhw: db "pshufhw", 0
    t_pshuflw: db "pshuflw", 0
    t_pslldq: db "pslldq", 0
    t_psrldq: db "psrldq", 0
    t_psubq: db "psubq", 0
    t_punpckhqdq: db "punpckhqdq", 0
    t_punpcklqdq: db "punpcklqdq", 0
    t_addpd: db "addpd", 0
    t_addsd: db "addsd", 0
    t_andnpd: db "andnpd", 0
    t_andpd: db "andpd", 0
    t_cmpeqpd: db "cmpeqpd", 0
    t_cmpeqsd: db "cmpeqsd", 0
    t_cmplepd: db "cmplepd", 0
    t_cmplesd: db "cmplesd", 0
    t_cmpltpd: db "cmpltpd", 0
    t_cmpltsd: db "cmpltsd", 0
    t_cmpneqpd: db "cmpneqpd", 0
    t_cmpneqsd: db "cmpneqsd", 0
    t_cmpnlepd: db "cmpnlepd", 0
    t_cmpnlesd: db "cmpnlesd", 0
    t_cmpnltpd: db "cmpnltpd", 0
    t_cmpnltsd: db "cmpnltsd", 0
    t_cmpordpd: db "cmpordpd", 0
    t_cmpordsd: db "cmpordsd", 0
    t_cmpunordpd: db "cmpunordpd", 0
    t_cmpunordsd: db "cmpunordsd", 0
    t_cmppd: db "cmppd", 0
    t_comisd: db "comisd", 0
    t_cvtdq2pd: db "cvtdq2pd", 0
    t_cvtdq2ps: db "cvtdq2ps", 0
    t_cvtpd2dq: db "cvtpd2dq", 0
    t_cvtpd2pi: db "cvtpd2pi", 0
    t_cvtpd2ps: db "cvtpd2ps", 0
    t_cvtpi2pd: db "cvtpi2pd", 0
    t_cvtps2dq: db "cvtps2dq", 0
    t_cvtps2pd: db "cvtps2pd", 0
    t_cvtsd2si: db "cvtsd2si", 0
    t_cvtsd2ss: db "cvtsd2ss", 0
    t_cvtsi2sd: db "cvtsi2sd", 0
    t_cvtss2sd: db "cvtss2sd", 0
    t_cvttpd2pi: db "cvttpd2pi", 0
    t_cvttpd2dq: db "cvttpd2dq", 0
    t_cvttps2dq: db "cvttps2dq", 0
    t_cvttsd2si: db "cvttsd2si", 0
    t_divpd: db "divpd", 0
    t_divsd: db "divsd", 0
    t_maxpd: db "maxpd", 0
    t_maxsd: db "maxsd", 0
    t_minpd: db "minpd", 0
    t_minsd: db "minsd", 0
    t_movapd: db "movapd", 0
    t_movhpd: db "movhpd", 0
    t_movlpd: db "movlpd", 0
    t_movmskpd: db "movmskpd", 0
    t_movupd: db "movupd", 0
    t_mulpd: db "mulpd", 0
    t_mulsd: db "mulsd", 0
    t_orpd: db "orpd", 0
    t_shufpd: db "shufpd", 0
    t_sqrtpd: db "sqrtpd", 0
    t_sqrtsd: db "sqrtsd", 0
    t_subpd: db "subpd", 0
    t_subsd: db "subsd", 0
    t_ucomisd: db "ucomisd", 0
    t_unpckhpd: db "unpckhpd", 0
    t_unpcklpd: db "unpcklpd", 0
    t_xorpd: db "xorpd", 0
    t_addsubpd: db "addsubpd", 0
    t_addsubps: db "addsubps", 0
    t_haddpd: db "haddpd", 0
    t_haddps: db "haddps", 0
    t_hsubpd: db "hsubpd", 0
    t_hsubps: db "hsubps", 0
    t_lddqu: db "lddqu", 0
    t_movddup: db "movddup", 0
    t_movshdup: db "movshdup", 0
    t_movsldup: db "movsldup", 0
    t_clgi: db "clgi", 0
    t_stgi: db "stgi", 0
    t_vmcall: db "vmcall", 0
    t_vmclear: db "vmclear", 0
    t_vmfunc: db "vmfunc", 0
    t_vmlaunch: db "vmlaunch", 0
    t_vmload: db "vmload", 0
    t_vmmcall: db "vmmcall", 0
    t_vmptrld: db "vmptrld", 0
    t_vmptrst: db "vmptrst", 0
    t_vmread: db "vmread", 0
    t_vmresume: db "vmresume", 0
    t_vmrun: db "vmrun", 0
    t_vmsave: db "vmsave", 0
    t_vmwrite: db "vmwrite", 0
    t_vmxoff: db "vmxoff", 0
    t_vmxon: db "vmxon", 0
    t_invept: db "invept", 0
    t_invvpid: db "invvpid", 0
    t_pabsb: db "pabsb", 0
    t_pabsw: db "pabsw", 0
    t_pabsd: db "pabsd", 0
    t_palignr: db "palignr", 0
    t_phaddw: db "phaddw", 0
    t_phaddd: db "phaddd", 0
    t_phaddsw: db "phaddsw", 0
    t_phsubw: db "phsubw", 0
    t_phsubd: db "phsubd", 0
    t_phsubsw: db "phsubsw", 0
    t_pmaddubsw: db "pmaddubsw", 0
    t_pmulhrsw: db "pmulhrsw", 0
    t_pshufb: db "pshufb", 0
    t_psignb: db "psignb", 0
    t_psignw: db "psignw", 0
    t_psignd: db "psignd", 0
    t_extrq: db "extrq", 0
    t_insertq: db "insertq", 0
    t_movntsd: db "movntsd", 0
    t_movntss: db "movntss", 0
    t_lzcnt: db "lzcnt", 0
    t_blendpd: db "blendpd", 0
    t_blendps: db "blendps", 0
    t_blendvpd: db "blendvpd", 0
    t_blendvps: db "blendvps", 0
    t_dppd: db "dppd", 0
    t_dpps: db "dpps", 0
    t_extractps: db "extractps", 0
    t_insertps: db "insertps", 0
    t_movntdqa: db "movntdqa", 0
    t_mpsadbw: db "mpsadbw", 0
    t_packusdw: db "packusdw", 0
    t_pblendvb: db "pblendvb", 0
    t_pblendw: db "pblendw", 0
    t_pcmpeqq: db "pcmpeqq", 0
    t_pextrb: db "pextrb", 0
    t_pextrd: db "pextrd", 0
    t_pextrq: db "pextrq", 0
    t_phminposuw: db "phminposuw", 0
    t_pinsrb: db "pinsrb", 0
    t_pinsrd: db "pinsrd", 0
    t_pinsrq: db "pinsrq", 0
    t_pmaxsb: db "pmaxsb", 0
    t_pmaxsd: db "pmaxsd", 0
    t_pmaxud: db "pmaxud", 0
    t_pmaxuw: db "pmaxuw", 0
    t_pminsb: db "pminsb", 0
    t_pminsd: db "pminsd", 0
    t_pminud: db "pminud", 0
    t_pminuw: db "pminuw", 0
    t_pmovsxbw: db "pmovsxbw", 0
    t_pmovsxbd: db "pmovsxbd", 0
    t_pmovsxbq: db "pmovsxbq", 0
    t_pmovsxwd: db "pmovsxwd", 0
    t_pmovsxwq: db "pmovsxwq", 0
    t_pmovsxdq: db "pmovsxdq", 0
    t_pmovzxbw: db "pmovzxbw", 0
    t_pmovzxbd: db "pmovzxbd", 0
    t_pmovzxbq: db "pmovzxbq", 0
    t_pmovzxwd: db "pmovzxwd", 0
    t_pmovzxwq: db "pmovzxwq", 0
    t_pmovzxdq: db "pmovzxdq", 0
    t_pmuldq: db "pmuldq", 0
    t_pmulld: db "pmulld", 0
    t_ptest: db "ptest", 0
    t_roundpd: db "roundpd", 0
    t_roundps: db "roundps", 0
    t_roundsd: db "roundsd", 0
    t_roundss: db "roundss", 0
    t_crc32: db "crc32", 0
    t_pcmpestri: db "pcmpestri", 0
    t_pcmpestrm: db "pcmpestrm", 0
    t_pcmpistri: db "pcmpistri", 0
    t_pcmpistrm: db "pcmpistrm", 0
    t_pcmpgtq: db "pcmpgtq", 0
    t_popcnt: db "popcnt", 0
    t_getsec: db "getsec", 0
    t_pfrcpv: db "pfrcpv", 0
    t_pfrsqrtv: db "pfrsqrtv", 0
    t_movbe: db "movbe", 0
    t_aesenc: db "aesenc", 0
    t_aesenclast: db "aesenclast", 0
    t_aesdec: db "aesdec", 0
    t_aesdeclast: db "aesdeclast", 0
    t_aesimc: db "aesimc", 0
    t_aeskeygenassist: db "aeskeygenassist", 0
    t_vaesenc: db "vaesenc", 0
    t_vaesenclast: db "vaesenclast", 0
    t_vaesdec: db "vaesdec", 0
    t_vaesdeclast: db "vaesdeclast", 0
    t_vaesimc: db "vaesimc", 0
    t_vaeskeygenassist: db "vaeskeygenassist", 0
    t_vaddpd: db "vaddpd", 0
    t_vaddps: db "vaddps", 0
    t_vaddsd: db "vaddsd", 0
    t_vaddss: db "vaddss", 0
    t_vaddsubpd: db "vaddsubpd", 0
    t_vaddsubps: db "vaddsubps", 0
    t_vandpd: db "vandpd", 0
    t_vandps: db "vandps", 0
    t_vandnpd: db "vandnpd", 0
    t_vandnps: db "vandnps", 0
    t_vblendpd: db "vblendpd", 0
    t_vblendps: db "vblendps", 0
    t_vblendvpd: db "vblendvpd", 0
    t_vblendvps: db "vblendvps", 0
    t_vbroadcastss: db "vbroadcastss", 0
    t_vbroadcastsd: db "vbroadcastsd", 0
    t_vbroadcastf128: db "vbroadcastf128", 0
    t_vcmpeq_ospd: db "vcmpeq_ospd", 0
    t_vcmpeqpd: db "vcmpeqpd", 0
    t_vcmplt_ospd: db "vcmplt_ospd", 0
    t_vcmpltpd: db "vcmpltpd", 0
    t_vcmple_ospd: db "vcmple_ospd", 0
    t_vcmplepd: db "vcmplepd", 0
    t_vcmpunord_qpd: db "vcmpunord_qpd", 0
    t_vcmpunordpd: db "vcmpunordpd", 0
    t_vcmpneq_uqpd: db "vcmpneq_uqpd", 0
    t_vcmpneqpd: db "vcmpneqpd", 0
    t_vcmpnlt_uspd: db "vcmpnlt_uspd", 0
    t_vcmpnltpd: db "vcmpnltpd", 0
    t_vcmpnle_uspd: db "vcmpnle_uspd", 0
    t_vcmpnlepd: db "vcmpnlepd", 0
    t_vcmpord_qpd: db "vcmpord_qpd", 0
    t_vcmpordpd: db "vcmpordpd", 0
    t_vcmpeq_uqpd: db "vcmpeq_uqpd", 0
    t_vcmpnge_uspd: db "vcmpnge_uspd", 0
    t_vcmpngepd: db "vcmpngepd", 0
    t_vcmpngt_uspd: db "vcmpngt_uspd", 0
    t_vcmpngtpd: db "vcmpngtpd", 0
    t_vcmpfalse_oqpd: db "vcmpfalse_oqpd", 0
    t_vcmpfalsepd: db "vcmpfalsepd", 0
    t_vcmpneq_oqpd: db "vcmpneq_oqpd", 0
    t_vcmpge_ospd: db "vcmpge_ospd", 0
    t_vcmpgepd: db "vcmpgepd", 0
    t_vcmpgt_ospd: db "vcmpgt_ospd", 0
    t_vcmpgtpd: db "vcmpgtpd", 0
    t_vcmptrue_uqpd: db "vcmptrue_uqpd", 0
    t_vcmptruepd: db "vcmptruepd", 0
    t_vcmplt_oqpd: db "vcmplt_oqpd", 0
    t_vcmple_oqpd: db "vcmple_oqpd", 0
    t_vcmpunord_spd: db "vcmpunord_spd", 0
    t_vcmpneq_uspd: db "vcmpneq_uspd", 0
    t_vcmpnlt_uqpd: db "vcmpnlt_uqpd", 0
    t_vcmpnle_uqpd: db "vcmpnle_uqpd", 0
    t_vcmpord_spd: db "vcmpord_spd", 0
    t_vcmpeq_uspd: db "vcmpeq_uspd", 0
    t_vcmpnge_uqpd: db "vcmpnge_uqpd", 0
    t_vcmpngt_uqpd: db "vcmpngt_uqpd", 0
    t_vcmpfalse_ospd: db "vcmpfalse_ospd", 0
    t_vcmpneq_ospd: db "vcmpneq_ospd", 0
    t_vcmpge_oqpd: db "vcmpge_oqpd", 0
    t_vcmpgt_oqpd: db "vcmpgt_oqpd", 0
    t_vcmptrue_uspd: db "vcmptrue_uspd", 0
    t_vcmppd: db "vcmppd", 0
    t_vcmpeq_osps: db "vcmpeq_osps", 0
    t_vcmpeqps: db "vcmpeqps", 0
    t_vcmplt_osps: db "vcmplt_osps", 0
    t_vcmpltps: db "vcmpltps", 0
    t_vcmple_osps: db "vcmple_osps", 0
    t_vcmpleps: db "vcmpleps", 0
    t_vcmpunord_qps: db "vcmpunord_qps", 0
    t_vcmpunordps: db "vcmpunordps", 0
    t_vcmpneq_uqps: db "vcmpneq_uqps", 0
    t_vcmpneqps: db "vcmpneqps", 0
    t_vcmpnlt_usps: db "vcmpnlt_usps", 0
    t_vcmpnltps: db "vcmpnltps", 0
    t_vcmpnle_usps: db "vcmpnle_usps", 0
    t_vcmpnleps: db "vcmpnleps", 0
    t_vcmpord_qps: db "vcmpord_qps", 0
    t_vcmpordps: db "vcmpordps", 0
    t_vcmpeq_uqps: db "vcmpeq_uqps", 0
    t_vcmpnge_usps: db "vcmpnge_usps", 0
    t_vcmpngeps: db "vcmpngeps", 0
    t_vcmpngt_usps: db "vcmpngt_usps", 0
    t_vcmpngtps: db "vcmpngtps", 0
    t_vcmpfalse_oqps: db "vcmpfalse_oqps", 0
    t_vcmpfalseps: db "vcmpfalseps", 0
    t_vcmpneq_oqps: db "vcmpneq_oqps", 0
    t_vcmpge_osps: db "vcmpge_osps", 0
    t_vcmpgeps: db "vcmpgeps", 0
    t_vcmpgt_osps: db "vcmpgt_osps", 0
    t_vcmpgtps: db "vcmpgtps", 0
    t_vcmptrue_uqps: db "vcmptrue_uqps", 0
    t_vcmptrueps: db "vcmptrueps", 0
    t_vcmplt_oqps: db "vcmplt_oqps", 0
    t_vcmple_oqps: db "vcmple_oqps", 0
    t_vcmpunord_sps: db "vcmpunord_sps", 0
    t_vcmpneq_usps: db "vcmpneq_usps", 0
    t_vcmpnlt_uqps: db "vcmpnlt_uqps", 0
    t_vcmpnle_uqps: db "vcmpnle_uqps", 0
    t_vcmpord_sps: db "vcmpord_sps", 0
    t_vcmpeq_usps: db "vcmpeq_usps", 0
    t_vcmpnge_uqps: db "vcmpnge_uqps", 0
    t_vcmpngt_uqps: db "vcmpngt_uqps", 0
    t_vcmpfalse_osps: db "vcmpfalse_osps", 0
    t_vcmpneq_osps: db "vcmpneq_osps", 0
    t_vcmpge_oqps: db "vcmpge_oqps", 0
    t_vcmpgt_oqps: db "vcmpgt_oqps", 0
    t_vcmptrue_usps: db "vcmptrue_usps", 0
    t_vcmpps: db "vcmpps", 0
    t_vcmpeq_ossd: db "vcmpeq_ossd", 0
    t_vcmpeqsd: db "vcmpeqsd", 0
    t_vcmplt_ossd: db "vcmplt_ossd", 0
    t_vcmpltsd: db "vcmpltsd", 0
    t_vcmple_ossd: db "vcmple_ossd", 0
    t_vcmplesd: db "vcmplesd", 0
    t_vcmpunord_qsd: db "vcmpunord_qsd", 0
    t_vcmpunordsd: db "vcmpunordsd", 0
    t_vcmpneq_uqsd: db "vcmpneq_uqsd", 0
    t_vcmpneqsd: db "vcmpneqsd", 0
    t_vcmpnlt_ussd: db "vcmpnlt_ussd", 0
    t_vcmpnltsd: db "vcmpnltsd", 0
    t_vcmpnle_ussd: db "vcmpnle_ussd", 0
    t_vcmpnlesd: db "vcmpnlesd", 0
    t_vcmpord_qsd: db "vcmpord_qsd", 0
    t_vcmpordsd: db "vcmpordsd", 0
    t_vcmpeq_uqsd: db "vcmpeq_uqsd", 0
    t_vcmpnge_ussd: db "vcmpnge_ussd", 0
    t_vcmpngesd: db "vcmpngesd", 0
    t_vcmpngt_ussd: db "vcmpngt_ussd", 0
    t_vcmpngtsd: db "vcmpngtsd", 0
    t_vcmpfalse_oqsd: db "vcmpfalse_oqsd", 0
    t_vcmpfalsesd: db "vcmpfalsesd", 0
    t_vcmpneq_oqsd: db "vcmpneq_oqsd", 0
    t_vcmpge_ossd: db "vcmpge_ossd", 0
    t_vcmpgesd: db "vcmpgesd", 0
    t_vcmpgt_ossd: db "vcmpgt_ossd", 0
    t_vcmpgtsd: db "vcmpgtsd", 0
    t_vcmptrue_uqsd: db "vcmptrue_uqsd", 0
    t_vcmptruesd: db "vcmptruesd", 0
    t_vcmplt_oqsd: db "vcmplt_oqsd", 0
    t_vcmple_oqsd: db "vcmple_oqsd", 0
    t_vcmpunord_ssd: db "vcmpunord_ssd", 0
    t_vcmpneq_ussd: db "vcmpneq_ussd", 0
    t_vcmpnlt_uqsd: db "vcmpnlt_uqsd", 0
    t_vcmpnle_uqsd: db "vcmpnle_uqsd", 0
    t_vcmpord_ssd: db "vcmpord_ssd", 0
    t_vcmpeq_ussd: db "vcmpeq_ussd", 0
    t_vcmpnge_uqsd: db "vcmpnge_uqsd", 0
    t_vcmpngt_uqsd: db "vcmpngt_uqsd", 0
    t_vcmpfalse_ossd: db "vcmpfalse_ossd", 0
    t_vcmpneq_ossd: db "vcmpneq_ossd", 0
    t_vcmpge_oqsd: db "vcmpge_oqsd", 0
    t_vcmpgt_oqsd: db "vcmpgt_oqsd", 0
    t_vcmptrue_ussd: db "vcmptrue_ussd", 0
    t_vcmpsd: db "vcmpsd", 0
    t_vcmpeq_osss: db "vcmpeq_osss", 0
    t_vcmpeqss: db "vcmpeqss", 0
    t_vcmplt_osss: db "vcmplt_osss", 0
    t_vcmpltss: db "vcmpltss", 0
    t_vcmple_osss: db "vcmple_osss", 0
    t_vcmpless: db "vcmpless", 0
    t_vcmpunord_qss: db "vcmpunord_qss", 0
    t_vcmpunordss: db "vcmpunordss", 0
    t_vcmpneq_uqss: db "vcmpneq_uqss", 0
    t_vcmpneqss: db "vcmpneqss", 0
    t_vcmpnlt_usss: db "vcmpnlt_usss", 0
    t_vcmpnltss: db "vcmpnltss", 0
    t_vcmpnle_usss: db "vcmpnle_usss", 0
    t_vcmpnless: db "vcmpnless", 0
    t_vcmpord_qss: db "vcmpord_qss", 0
    t_vcmpordss: db "vcmpordss", 0
    t_vcmpeq_uqss: db "vcmpeq_uqss", 0
    t_vcmpnge_usss: db "vcmpnge_usss", 0
    t_vcmpngess: db "vcmpngess", 0
    t_vcmpngt_usss: db "vcmpngt_usss", 0
    t_vcmpngtss: db "vcmpngtss", 0
    t_vcmpfalse_oqss: db "vcmpfalse_oqss", 0
    t_vcmpfalsess: db "vcmpfalsess", 0
    t_vcmpneq_oqss: db "vcmpneq_oqss", 0
    t_vcmpge_osss: db "vcmpge_osss", 0
    t_vcmpgess: db "vcmpgess", 0
    t_vcmpgt_osss: db "vcmpgt_osss", 0
    t_vcmpgtss: db "vcmpgtss", 0
    t_vcmptrue_uqss: db "vcmptrue_uqss", 0
    t_vcmptruess: db "vcmptruess", 0
    t_vcmplt_oqss: db "vcmplt_oqss", 0
    t_vcmple_oqss: db "vcmple_oqss", 0
    t_vcmpunord_sss: db "vcmpunord_sss", 0
    t_vcmpneq_usss: db "vcmpneq_usss", 0
    t_vcmpnlt_uqss: db "vcmpnlt_uqss", 0
    t_vcmpnle_uqss: db "vcmpnle_uqss", 0
    t_vcmpord_sss: db "vcmpord_sss", 0
    t_vcmpeq_usss: db "vcmpeq_usss", 0
    t_vcmpnge_uqss: db "vcmpnge_uqss", 0
    t_vcmpngt_uqss: db "vcmpngt_uqss", 0
    t_vcmpfalse_osss: db "vcmpfalse_osss", 0
    t_vcmpneq_osss: db "vcmpneq_osss", 0
    t_vcmpge_oqss: db "vcmpge_oqss", 0
    t_vcmpgt_oqss: db "vcmpgt_oqss", 0
    t_vcmptrue_usss: db "vcmptrue_usss", 0
    t_vcmpss: db "vcmpss", 0
    t_vcomisd: db "vcomisd", 0
    t_vcomiss: db "vcomiss", 0
    t_vcvtdq2pd: db "vcvtdq2pd", 0
    t_vcvtdq2ps: db "vcvtdq2ps", 0
    t_vcvtpd2dq: db "vcvtpd2dq", 0
    t_vcvtpd2ps: db "vcvtpd2ps", 0
    t_vcvtps2dq: db "vcvtps2dq", 0
    t_vcvtps2pd: db "vcvtps2pd", 0
    t_vcvtsd2si: db "vcvtsd2si", 0
    t_vcvtsd2ss: db "vcvtsd2ss", 0
    t_vcvtsi2sd: db "vcvtsi2sd", 0
    t_vcvtsi2ss: db "vcvtsi2ss", 0
    t_vcvtss2sd: db "vcvtss2sd", 0
    t_vcvtss2si: db "vcvtss2si", 0
    t_vcvttpd2dq: db "vcvttpd2dq", 0
    t_vcvttps2dq: db "vcvttps2dq", 0
    t_vcvttsd2si: db "vcvttsd2si", 0
    t_vcvttss2si: db "vcvttss2si", 0
    t_vdivpd: db "vdivpd", 0
    t_vdivps: db "vdivps", 0
    t_vdivsd: db "vdivsd", 0
    t_vdivss: db "vdivss", 0
    t_vdppd: db "vdppd", 0
    t_vdpps: db "vdpps", 0
    t_vextractf128: db "vextractf128", 0
    t_vextractps: db "vextractps", 0
    t_vhaddpd: db "vhaddpd", 0
    t_vhaddps: db "vhaddps", 0
    t_vhsubpd: db "vhsubpd", 0
    t_vhsubps: db "vhsubps", 0
    t_vinsertf128: db "vinsertf128", 0
    t_vinsertps: db "vinsertps", 0
    t_vlddqu: db "vlddqu", 0
    t_vldqqu: db "vldqqu", 0
    t_vldmxcsr: db "vldmxcsr", 0
    t_vmaskmovdqu: db "vmaskmovdqu", 0
    t_vmaskmovps: db "vmaskmovps", 0
    t_vmaskmovpd: db "vmaskmovpd", 0
    t_vmaxpd: db "vmaxpd", 0
    t_vmaxps: db "vmaxps", 0
    t_vmaxsd: db "vmaxsd", 0
    t_vmaxss: db "vmaxss", 0
    t_vminpd: db "vminpd", 0
    t_vminps: db "vminps", 0
    t_vminsd: db "vminsd", 0
    t_vminss: db "vminss", 0
    t_vmovapd: db "vmovapd", 0
    t_vmovaps: db "vmovaps", 0
    t_vmovd: db "vmovd", 0
    t_vmovq: db "vmovq", 0
    t_vmovddup: db "vmovddup", 0
    t_vmovdqa: db "vmovdqa", 0
    t_vmovqqa: db "vmovqqa", 0
    t_vmovdqu: db "vmovdqu", 0
    t_vmovqqu: db "vmovqqu", 0
    t_vmovhlps: db "vmovhlps", 0
    t_vmovhpd: db "vmovhpd", 0
    t_vmovhps: db "vmovhps", 0
    t_vmovlhps: db "vmovlhps", 0
    t_vmovlpd: db "vmovlpd", 0
    t_vmovlps: db "vmovlps", 0
    t_vmovmskpd: db "vmovmskpd", 0
    t_vmovmskps: db "vmovmskps", 0
    t_vmovntdq: db "vmovntdq", 0
    t_vmovntqq: db "vmovntqq", 0
    t_vmovntdqa: db "vmovntdqa", 0
    t_vmovntpd: db "vmovntpd", 0
    t_vmovntps: db "vmovntps", 0
    t_vmovsd: db "vmovsd", 0
    t_vmovshdup: db "vmovshdup", 0
    t_vmovsldup: db "vmovsldup", 0
    t_vmovss: db "vmovss", 0
    t_vmovupd: db "vmovupd", 0
    t_vmovups: db "vmovups", 0
    t_vmpsadbw: db "vmpsadbw", 0
    t_vmulpd: db "vmulpd", 0
    t_vmulps: db "vmulps", 0
    t_vmulsd: db "vmulsd", 0
    t_vmulss: db "vmulss", 0
    t_vorpd: db "vorpd", 0
    t_vorps: db "vorps", 0
    t_vpabsb: db "vpabsb", 0
    t_vpabsw: db "vpabsw", 0
    t_vpabsd: db "vpabsd", 0
    t_vpacksswb: db "vpacksswb", 0
    t_vpackssdw: db "vpackssdw", 0
    t_vpackuswb: db "vpackuswb", 0
    t_vpackusdw: db "vpackusdw", 0
    t_vpaddb: db "vpaddb", 0
    t_vpaddw: db "vpaddw", 0
    t_vpaddd: db "vpaddd", 0
    t_vpaddq: db "vpaddq", 0
    t_vpaddsb: db "vpaddsb", 0
    t_vpaddsw: db "vpaddsw", 0
    t_vpaddusb: db "vpaddusb", 0
    t_vpaddusw: db "vpaddusw", 0
    t_vpalignr: db "vpalignr", 0
    t_vpand: db "vpand", 0
    t_vpandn: db "vpandn", 0
    t_vpavgb: db "vpavgb", 0
    t_vpavgw: db "vpavgw", 0
    t_vpblendvb: db "vpblendvb", 0
    t_vpblendw: db "vpblendw", 0
    t_vpcmpestri: db "vpcmpestri", 0
    t_vpcmpestrm: db "vpcmpestrm", 0
    t_vpcmpistri: db "vpcmpistri", 0
    t_vpcmpistrm: db "vpcmpistrm", 0
    t_vpcmpeqb: db "vpcmpeqb", 0
    t_vpcmpeqw: db "vpcmpeqw", 0
    t_vpcmpeqd: db "vpcmpeqd", 0
    t_vpcmpeqq: db "vpcmpeqq", 0
    t_vpcmpgtb: db "vpcmpgtb", 0
    t_vpcmpgtw: db "vpcmpgtw", 0
    t_vpcmpgtd: db "vpcmpgtd", 0
    t_vpcmpgtq: db "vpcmpgtq", 0
    t_vpermilpd: db "vpermilpd", 0
    t_vpermilps: db "vpermilps", 0
    t_vperm2f128: db "vperm2f128", 0
    t_vpextrb: db "vpextrb", 0
    t_vpextrw: db "vpextrw", 0
    t_vpextrd: db "vpextrd", 0
    t_vpextrq: db "vpextrq", 0
    t_vphaddw: db "vphaddw", 0
    t_vphaddd: db "vphaddd", 0
    t_vphaddsw: db "vphaddsw", 0
    t_vphminposuw: db "vphminposuw", 0
    t_vphsubw: db "vphsubw", 0
    t_vphsubd: db "vphsubd", 0
    t_vphsubsw: db "vphsubsw", 0
    t_vpinsrb: db "vpinsrb", 0
    t_vpinsrw: db "vpinsrw", 0
    t_vpinsrd: db "vpinsrd", 0
    t_vpinsrq: db "vpinsrq", 0
    t_vpmaddwd: db "vpmaddwd", 0
    t_vpmaddubsw: db "vpmaddubsw", 0
    t_vpmaxsb: db "vpmaxsb", 0
    t_vpmaxsw: db "vpmaxsw", 0
    t_vpmaxsd: db "vpmaxsd", 0
    t_vpmaxub: db "vpmaxub", 0
    t_vpmaxuw: db "vpmaxuw", 0
    t_vpmaxud: db "vpmaxud", 0
    t_vpminsb: db "vpminsb", 0
    t_vpminsw: db "vpminsw", 0
    t_vpminsd: db "vpminsd", 0
    t_vpminub: db "vpminub", 0
    t_vpminuw: db "vpminuw", 0
    t_vpminud: db "vpminud", 0
    t_vpmovmskb: db "vpmovmskb", 0
    t_vpmovsxbw: db "vpmovsxbw", 0
    t_vpmovsxbd: db "vpmovsxbd", 0
    t_vpmovsxbq: db "vpmovsxbq", 0
    t_vpmovsxwd: db "vpmovsxwd", 0
    t_vpmovsxwq: db "vpmovsxwq", 0
    t_vpmovsxdq: db "vpmovsxdq", 0
    t_vpmovzxbw: db "vpmovzxbw", 0
    t_vpmovzxbd: db "vpmovzxbd", 0
    t_vpmovzxbq: db "vpmovzxbq", 0
    t_vpmovzxwd: db "vpmovzxwd", 0
    t_vpmovzxwq: db "vpmovzxwq", 0
    t_vpmovzxdq: db "vpmovzxdq", 0
    t_vpmulhuw: db "vpmulhuw", 0
    t_vpmulhrsw: db "vpmulhrsw", 0
    t_vpmulhw: db "vpmulhw", 0
    t_vpmullw: db "vpmullw", 0
    t_vpmulld: db "vpmulld", 0
    t_vpmuludq: db "vpmuludq", 0
    t_vpmuldq: db "vpmuldq", 0
    t_vpor: db "vpor", 0
    t_vpsadbw: db "vpsadbw", 0
    t_vpshufb: db "vpshufb", 0
    t_vpshufd: db "vpshufd", 0
    t_vpshufhw: db "vpshufhw", 0
    t_vpshuflw: db "vpshuflw", 0
    t_vpsignb: db "vpsignb", 0
    t_vpsignw: db "vpsignw", 0
    t_vpsignd: db "vpsignd", 0
    t_vpslldq: db "vpslldq", 0
    t_vpsrldq: db "vpsrldq", 0
    t_vpsllw: db "vpsllw", 0
    t_vpslld: db "vpslld", 0
    t_vpsllq: db "vpsllq", 0
    t_vpsraw: db "vpsraw", 0
    t_vpsrad: db "vpsrad", 0
    t_vpsrlw: db "vpsrlw", 0
    t_vpsrld: db "vpsrld", 0
    t_vpsrlq: db "vpsrlq", 0
    t_vptest: db "vptest", 0
    t_vpsubb: db "vpsubb", 0
    t_vpsubw: db "vpsubw", 0
    t_vpsubd: db "vpsubd", 0
    t_vpsubq: db "vpsubq", 0
    t_vpsubsb: db "vpsubsb", 0
    t_vpsubsw: db "vpsubsw", 0
    t_vpsubusb: db "vpsubusb", 0
    t_vpsubusw: db "vpsubusw", 0
    t_vpunpckhbw: db "vpunpckhbw", 0
    t_vpunpckhwd: db "vpunpckhwd", 0
    t_vpunpckhdq: db "vpunpckhdq", 0
    t_vpunpckhqdq: db "vpunpckhqdq", 0
    t_vpunpcklbw: db "vpunpcklbw", 0
    t_vpunpcklwd: db "vpunpcklwd", 0
    t_vpunpckldq: db "vpunpckldq", 0
    t_vpunpcklqdq: db "vpunpcklqdq", 0
    t_vpxor: db "vpxor", 0
    t_vrcpps: db "vrcpps", 0
    t_vrcpss: db "vrcpss", 0
    t_vrsqrtps: db "vrsqrtps", 0
    t_vrsqrtss: db "vrsqrtss", 0
    t_vroundpd: db "vroundpd", 0
    t_vroundps: db "vroundps", 0
    t_vroundsd: db "vroundsd", 0
    t_vroundss: db "vroundss", 0
    t_vshufpd: db "vshufpd", 0
    t_vshufps: db "vshufps", 0
    t_vsqrtpd: db "vsqrtpd", 0
    t_vsqrtps: db "vsqrtps", 0
    t_vsqrtsd: db "vsqrtsd", 0
    t_vsqrtss: db "vsqrtss", 0
    t_vstmxcsr: db "vstmxcsr", 0
    t_vsubpd: db "vsubpd", 0
    t_vsubps: db "vsubps", 0
    t_vsubsd: db "vsubsd", 0
    t_vsubss: db "vsubss", 0
    t_vtestps: db "vtestps", 0
    t_vtestpd: db "vtestpd", 0
    t_vucomisd: db "vucomisd", 0
    t_vucomiss: db "vucomiss", 0
    t_vunpckhpd: db "vunpckhpd", 0
    t_vunpckhps: db "vunpckhps", 0
    t_vunpcklpd: db "vunpcklpd", 0
    t_vunpcklps: db "vunpcklps", 0
    t_vxorpd: db "vxorpd", 0
    t_vxorps: db "vxorps", 0
    t_vzeroall: db "vzeroall", 0
    t_vzeroupper: db "vzeroupper", 0
    t_pclmullqlqdq: db "pclmullqlqdq", 0
    t_pclmulhqlqdq: db "pclmulhqlqdq", 0
    t_pclmullqhqdq: db "pclmullqhqdq", 0
    t_pclmulhqhqdq: db "pclmulhqhqdq", 0
    t_pclmulqdq: db "pclmulqdq", 0
    t_vpclmullqlqdq: db "vpclmullqlqdq", 0
    t_vpclmulhqlqdq: db "vpclmulhqlqdq", 0
    t_vpclmullqhqdq: db "vpclmullqhqdq", 0
    t_vpclmulhqhqdq: db "vpclmulhqhqdq", 0
    t_vpclmulqdq: db "vpclmulqdq", 0
    t_vfmadd132ps: db "vfmadd132ps", 0
    t_vfmadd132pd: db "vfmadd132pd", 0
    t_vfmadd312ps: db "vfmadd312ps", 0
    t_vfmadd312pd: db "vfmadd312pd", 0
    t_vfmadd213ps: db "vfmadd213ps", 0
    t_vfmadd213pd: db "vfmadd213pd", 0
    t_vfmadd123ps: db "vfmadd123ps", 0
    t_vfmadd123pd: db "vfmadd123pd", 0
    t_vfmadd231ps: db "vfmadd231ps", 0
    t_vfmadd231pd: db "vfmadd231pd", 0
    t_vfmadd321ps: db "vfmadd321ps", 0
    t_vfmadd321pd: db "vfmadd321pd", 0
    t_vfmaddsub132ps: db "vfmaddsub132ps", 0
    t_vfmaddsub132pd: db "vfmaddsub132pd", 0
    t_vfmaddsub312ps: db "vfmaddsub312ps", 0
    t_vfmaddsub312pd: db "vfmaddsub312pd", 0
    t_vfmaddsub213ps: db "vfmaddsub213ps", 0
    t_vfmaddsub213pd: db "vfmaddsub213pd", 0
    t_vfmaddsub123ps: db "vfmaddsub123ps", 0
    t_vfmaddsub123pd: db "vfmaddsub123pd", 0
    t_vfmaddsub231ps: db "vfmaddsub231ps", 0
    t_vfmaddsub231pd: db "vfmaddsub231pd", 0
    t_vfmaddsub321ps: db "vfmaddsub321ps", 0
    t_vfmaddsub321pd: db "vfmaddsub321pd", 0
    t_vfmsub132ps: db "vfmsub132ps", 0
    t_vfmsub132pd: db "vfmsub132pd", 0
    t_vfmsub312ps: db "vfmsub312ps", 0
    t_vfmsub312pd: db "vfmsub312pd", 0
    t_vfmsub213ps: db "vfmsub213ps", 0
    t_vfmsub213pd: db "vfmsub213pd", 0
    t_vfmsub123ps: db "vfmsub123ps", 0
    t_vfmsub123pd: db "vfmsub123pd", 0
    t_vfmsub231ps: db "vfmsub231ps", 0
    t_vfmsub231pd: db "vfmsub231pd", 0
    t_vfmsub321ps: db "vfmsub321ps", 0
    t_vfmsub321pd: db "vfmsub321pd", 0
    t_vfmsubadd132ps: db "vfmsubadd132ps", 0
    t_vfmsubadd132pd: db "vfmsubadd132pd", 0
    t_vfmsubadd312ps: db "vfmsubadd312ps", 0
    t_vfmsubadd312pd: db "vfmsubadd312pd", 0
    t_vfmsubadd213ps: db "vfmsubadd213ps", 0
    t_vfmsubadd213pd: db "vfmsubadd213pd", 0
    t_vfmsubadd123ps: db "vfmsubadd123ps", 0
    t_vfmsubadd123pd: db "vfmsubadd123pd", 0
    t_vfmsubadd231ps: db "vfmsubadd231ps", 0
    t_vfmsubadd231pd: db "vfmsubadd231pd", 0
    t_vfmsubadd321ps: db "vfmsubadd321ps", 0
    t_vfmsubadd321pd: db "vfmsubadd321pd", 0
    t_vfnmadd132ps: db "vfnmadd132ps", 0
    t_vfnmadd132pd: db "vfnmadd132pd", 0
    t_vfnmadd312ps: db "vfnmadd312ps", 0
    t_vfnmadd312pd: db "vfnmadd312pd", 0
    t_vfnmadd213ps: db "vfnmadd213ps", 0
    t_vfnmadd213pd: db "vfnmadd213pd", 0
    t_vfnmadd123ps: db "vfnmadd123ps", 0
    t_vfnmadd123pd: db "vfnmadd123pd", 0
    t_vfnmadd231ps: db "vfnmadd231ps", 0
    t_vfnmadd231pd: db "vfnmadd231pd", 0
    t_vfnmadd321ps: db "vfnmadd321ps", 0
    t_vfnmadd321pd: db "vfnmadd321pd", 0
    t_vfnmsub132ps: db "vfnmsub132ps", 0
    t_vfnmsub132pd: db "vfnmsub132pd", 0
    t_vfnmsub312ps: db "vfnmsub312ps", 0
    t_vfnmsub312pd: db "vfnmsub312pd", 0
    t_vfnmsub213ps: db "vfnmsub213ps", 0
    t_vfnmsub213pd: db "vfnmsub213pd", 0
    t_vfnmsub123ps: db "vfnmsub123ps", 0
    t_vfnmsub123pd: db "vfnmsub123pd", 0
    t_vfnmsub231ps: db "vfnmsub231ps", 0
    t_vfnmsub231pd: db "vfnmsub231pd", 0
    t_vfnmsub321ps: db "vfnmsub321ps", 0
    t_vfnmsub321pd: db "vfnmsub321pd", 0
    t_vfmadd132ss: db "vfmadd132ss", 0
    t_vfmadd132sd: db "vfmadd132sd", 0
    t_vfmadd312ss: db "vfmadd312ss", 0
    t_vfmadd312sd: db "vfmadd312sd", 0
    t_vfmadd213ss: db "vfmadd213ss", 0
    t_vfmadd213sd: db "vfmadd213sd", 0
    t_vfmadd123ss: db "vfmadd123ss", 0
    t_vfmadd123sd: db "vfmadd123sd", 0
    t_vfmadd231ss: db "vfmadd231ss", 0
    t_vfmadd231sd: db "vfmadd231sd", 0
    t_vfmadd321ss: db "vfmadd321ss", 0
    t_vfmadd321sd: db "vfmadd321sd", 0
    t_vfmsub132ss: db "vfmsub132ss", 0
    t_vfmsub132sd: db "vfmsub132sd", 0
    t_vfmsub312ss: db "vfmsub312ss", 0
    t_vfmsub312sd: db "vfmsub312sd", 0
    t_vfmsub213ss: db "vfmsub213ss", 0
    t_vfmsub213sd: db "vfmsub213sd", 0
    t_vfmsub123ss: db "vfmsub123ss", 0
    t_vfmsub123sd: db "vfmsub123sd", 0
    t_vfmsub231ss: db "vfmsub231ss", 0
    t_vfmsub231sd: db "vfmsub231sd", 0
    t_vfmsub321ss: db "vfmsub321ss", 0
    t_vfmsub321sd: db "vfmsub321sd", 0
    t_vfnmadd132ss: db "vfnmadd132ss", 0
    t_vfnmadd132sd: db "vfnmadd132sd", 0
    t_vfnmadd312ss: db "vfnmadd312ss", 0
    t_vfnmadd312sd: db "vfnmadd312sd", 0
    t_vfnmadd213ss: db "vfnmadd213ss", 0
    t_vfnmadd213sd: db "vfnmadd213sd", 0
    t_vfnmadd123ss: db "vfnmadd123ss", 0
    t_vfnmadd123sd: db "vfnmadd123sd", 0
    t_vfnmadd231ss: db "vfnmadd231ss", 0
    t_vfnmadd231sd: db "vfnmadd231sd", 0
    t_vfnmadd321ss: db "vfnmadd321ss", 0
    t_vfnmadd321sd: db "vfnmadd321sd", 0
    t_vfnmsub132ss: db "vfnmsub132ss", 0
    t_vfnmsub132sd: db "vfnmsub132sd", 0
    t_vfnmsub312ss: db "vfnmsub312ss", 0
    t_vfnmsub312sd: db "vfnmsub312sd", 0
    t_vfnmsub213ss: db "vfnmsub213ss", 0
    t_vfnmsub213sd: db "vfnmsub213sd", 0
    t_vfnmsub123ss: db "vfnmsub123ss", 0
    t_vfnmsub123sd: db "vfnmsub123sd", 0
    t_vfnmsub231ss: db "vfnmsub231ss", 0
    t_vfnmsub231sd: db "vfnmsub231sd", 0
    t_vfnmsub321ss: db "vfnmsub321ss", 0
    t_vfnmsub321sd: db "vfnmsub321sd", 0
    t_rdfsbase: db "rdfsbase", 0
    t_rdgsbase: db "rdgsbase", 0
    t_rdrand: db "rdrand", 0
    t_wrfsbase: db "wrfsbase", 0
    t_wrgsbase: db "wrgsbase", 0
    t_vcvtph2ps: db "vcvtph2ps", 0
    t_vcvtps2ph: db "vcvtps2ph", 0
    t_adcx: db "adcx", 0
    t_adox: db "adox", 0
    t_rdseed: db "rdseed", 0
    t_clac: db "clac", 0
    t_stac: db "stac", 0
    t_xstore: db "xstore", 0
    t_xcryptecb: db "xcryptecb", 0
    t_xcryptcbc: db "xcryptcbc", 0
    t_xcryptctr: db "xcryptctr", 0
    t_xcryptcfb: db "xcryptcfb", 0
    t_xcryptofb: db "xcryptofb", 0
    t_montmul: db "montmul", 0
    t_xsha1: db "xsha1", 0
    t_xsha256: db "xsha256", 0
    t_llwpcb: db "llwpcb", 0
    t_slwpcb: db "slwpcb", 0
    t_lwpval: db "lwpval", 0
    t_lwpins: db "lwpins", 0
    t_vfmaddpd: db "vfmaddpd", 0
    t_vfmaddps: db "vfmaddps", 0
    t_vfmaddsd: db "vfmaddsd", 0
    t_vfmaddss: db "vfmaddss", 0
    t_vfmaddsubpd: db "vfmaddsubpd", 0
    t_vfmaddsubps: db "vfmaddsubps", 0
    t_vfmsubaddpd: db "vfmsubaddpd", 0
    t_vfmsubaddps: db "vfmsubaddps", 0
    t_vfmsubpd: db "vfmsubpd", 0
    t_vfmsubps: db "vfmsubps", 0
    t_vfmsubsd: db "vfmsubsd", 0
    t_vfmsubss: db "vfmsubss", 0
    t_vfnmaddpd: db "vfnmaddpd", 0
    t_vfnmaddps: db "vfnmaddps", 0
    t_vfnmaddsd: db "vfnmaddsd", 0
    t_vfnmaddss: db "vfnmaddss", 0
    t_vfnmsubpd: db "vfnmsubpd", 0
    t_vfnmsubps: db "vfnmsubps", 0
    t_vfnmsubsd: db "vfnmsubsd", 0
    t_vfnmsubss: db "vfnmsubss", 0
    t_vfrczpd: db "vfrczpd", 0
    t_vfrczps: db "vfrczps", 0
    t_vfrczsd: db "vfrczsd", 0
    t_vfrczss: db "vfrczss", 0
    t_vpcmov: db "vpcmov", 0
    t_vpcomb: db "vpcomb", 0
    t_vpcomd: db "vpcomd", 0
    t_vpcomq: db "vpcomq", 0
    t_vpcomub: db "vpcomub", 0
    t_vpcomud: db "vpcomud", 0
    t_vpcomuq: db "vpcomuq", 0
    t_vpcomuw: db "vpcomuw", 0
    t_vpcomw: db "vpcomw", 0
    t_vphaddbd: db "vphaddbd", 0
    t_vphaddbq: db "vphaddbq", 0
    t_vphaddbw: db "vphaddbw", 0
    t_vphadddq: db "vphadddq", 0
    t_vphaddubd: db "vphaddubd", 0
    t_vphaddubq: db "vphaddubq", 0
    t_vphaddubw: db "vphaddubw", 0
    t_vphaddudq: db "vphaddudq", 0
    t_vphadduwd: db "vphadduwd", 0
    t_vphadduwq: db "vphadduwq", 0
    t_vphaddwd: db "vphaddwd", 0
    t_vphaddwq: db "vphaddwq", 0
    t_vphsubbw: db "vphsubbw", 0
    t_vphsubdq: db "vphsubdq", 0
    t_vphsubwd: db "vphsubwd", 0
    t_vpmacsdd: db "vpmacsdd", 0
    t_vpmacsdqh: db "vpmacsdqh", 0
    t_vpmacsdql: db "vpmacsdql", 0
    t_vpmacssdd: db "vpmacssdd", 0
    t_vpmacssdqh: db "vpmacssdqh", 0
    t_vpmacssdql: db "vpmacssdql", 0
    t_vpmacsswd: db "vpmacsswd", 0
    t_vpmacssww: db "vpmacssww", 0
    t_vpmacswd: db "vpmacswd", 0
    t_vpmacsww: db "vpmacsww", 0
    t_vpmadcsswd: db "vpmadcsswd", 0
    t_vpmadcswd: db "vpmadcswd", 0
    t_vpperm: db "vpperm", 0
    t_vprotb: db "vprotb", 0
    t_vprotd: db "vprotd", 0
    t_vprotq: db "vprotq", 0
    t_vprotw: db "vprotw", 0
    t_vpshab: db "vpshab", 0
    t_vpshad: db "vpshad", 0
    t_vpshaq: db "vpshaq", 0
    t_vpshaw: db "vpshaw", 0
    t_vpshlb: db "vpshlb", 0
    t_vpshld: db "vpshld", 0
    t_vpshlq: db "vpshlq", 0
    t_vpshlw: db "vpshlw", 0
    t_vbroadcasti128: db "vbroadcasti128", 0
    t_vpblendd: db "vpblendd", 0
    t_vpbroadcastb: db "vpbroadcastb", 0
    t_vpbroadcastw: db "vpbroadcastw", 0
    t_vpbroadcastd: db "vpbroadcastd", 0
    t_vpbroadcastq: db "vpbroadcastq", 0
    t_vpermd: db "vpermd", 0
    t_vpermpd: db "vpermpd", 0
    t_vpermps: db "vpermps", 0
    t_vpermq: db "vpermq", 0
    t_vperm2i128: db "vperm2i128", 0
    t_vextracti128: db "vextracti128", 0
    t_vinserti128: db "vinserti128", 0
    t_vpmaskmovd: db "vpmaskmovd", 0
    t_vpmaskmovq: db "vpmaskmovq", 0
    t_vpsllvd: db "vpsllvd", 0
    t_vpsllvq: db "vpsllvq", 0
    t_vpsravd: db "vpsravd", 0
    t_vpsrlvd: db "vpsrlvd", 0
    t_vpsrlvq: db "vpsrlvq", 0
    t_vgatherdpd: db "vgatherdpd", 0
    t_vgatherqpd: db "vgatherqpd", 0
    t_vgatherdps: db "vgatherdps", 0
    t_vgatherqps: db "vgatherqps", 0
    t_vpgatherdd: db "vpgatherdd", 0
    t_vpgatherqd: db "vpgatherqd", 0
    t_vpgatherdq: db "vpgatherdq", 0
    t_vpgatherqq: db "vpgatherqq", 0
    t_xabort: db "xabort", 0
    t_xbegin: db "xbegin", 0
    t_xend: db "xend", 0
    t_xtest: db "xtest", 0
    t_andn: db "andn", 0
    t_bextr: db "bextr", 0
    t_blci: db "blci", 0
    t_blcic: db "blcic", 0
    t_blsi: db "blsi", 0
    t_blsic: db "blsic", 0
    t_blcfill: db "blcfill", 0
    t_blsfill: db "blsfill", 0
    t_blcmsk: db "blcmsk", 0
    t_blsmsk: db "blsmsk", 0
    t_blsr: db "blsr", 0
    t_blcs: db "blcs", 0
    t_bzhi: db "bzhi", 0
    t_mulx: db "mulx", 0
    t_pdep: db "pdep", 0
    t_pext: db "pext", 0
    t_rorx: db "rorx", 0
    t_sarx: db "sarx", 0
    t_shlx: db "shlx", 0
    t_shrx: db "shrx", 0
    t_tzcnt: db "tzcnt", 0
    t_tzmsk: db "tzmsk", 0
    t_t1mskc: db "t1mskc", 0
    t_prefetchwt1: db "prefetchwt1", 0
    t_bndmk: db "bndmk", 0
    t_bndcl: db "bndcl", 0
    t_bndcu: db "bndcu", 0
    t_bndcn: db "bndcn", 0
    t_bndmov: db "bndmov", 0
    t_bndldx: db "bndldx", 0
    t_bndstx: db "bndstx", 0
    t_sha1msg1: db "sha1msg1", 0
    t_sha1msg2: db "sha1msg2", 0
    t_sha1nexte: db "sha1nexte", 0
    t_sha1rnds4: db "sha1rnds4", 0
    t_sha256msg1: db "sha256msg1", 0
    t_sha256msg2: db "sha256msg2", 0
    t_sha256rnds2: db "sha256rnds2", 0
    t_kaddb: db "kaddb", 0
    t_kaddd: db "kaddd", 0
    t_kaddq: db "kaddq", 0
    t_kaddw: db "kaddw", 0
    t_kandb: db "kandb", 0
    t_kandd: db "kandd", 0
    t_kandnb: db "kandnb", 0
    t_kandnd: db "kandnd", 0
    t_kandnq: db "kandnq", 0
    t_kandnw: db "kandnw", 0
    t_kandq: db "kandq", 0
    t_kandw: db "kandw", 0
    t_kmovb: db "kmovb", 0
    t_kmovd: db "kmovd", 0
    t_kmovq: db "kmovq", 0
    t_kmovw: db "kmovw", 0
    t_knotb: db "knotb", 0
    t_knotd: db "knotd", 0
    t_knotq: db "knotq", 0
    t_knotw: db "knotw", 0
    t_korb: db "korb", 0
    t_kord: db "kord", 0
    t_korq: db "korq", 0
    t_kortestb: db "kortestb", 0
    t_kortestd: db "kortestd", 0
    t_kortestq: db "kortestq", 0
    t_kortestw: db "kortestw", 0
    t_korw: db "korw", 0
    t_kshiftlb: db "kshiftlb", 0
    t_kshiftld: db "kshiftld", 0
    t_kshiftlq: db "kshiftlq", 0
    t_kshiftlw: db "kshiftlw", 0
    t_kshiftrb: db "kshiftrb", 0
    t_kshiftrd: db "kshiftrd", 0
    t_kshiftrq: db "kshiftrq", 0
    t_kshiftrw: db "kshiftrw", 0
    t_ktestb: db "ktestb", 0
    t_ktestd: db "ktestd", 0
    t_ktestq: db "ktestq", 0
    t_ktestw: db "ktestw", 0
    t_kunpckbw: db "kunpckbw", 0
    t_kunpckdq: db "kunpckdq", 0
    t_kunpckwd: db "kunpckwd", 0
    t_kxnorb: db "kxnorb", 0
    t_kxnord: db "kxnord", 0
    t_kxnorq: db "kxnorq", 0
    t_kxnorw: db "kxnorw", 0
    t_kxorb: db "kxorb", 0
    t_kxord: db "kxord", 0
    t_kxorq: db "kxorq", 0
    t_kxorw: db "kxorw", 0
    t_valignd: db "valignd", 0
    t_valignq: db "valignq", 0
    t_vblendmpd: db "vblendmpd", 0
    t_vblendmps: db "vblendmps", 0
    t_vbroadcastf32x2: db "vbroadcastf32x2", 0
    t_vbroadcastf32x4: db "vbroadcastf32x4", 0
    t_vbroadcastf32x8: db "vbroadcastf32x8", 0
    t_vbroadcastf64x2: db "vbroadcastf64x2", 0
    t_vbroadcastf64x4: db "vbroadcastf64x4", 0
    t_vbroadcasti32x2: db "vbroadcasti32x2", 0
    t_vbroadcasti32x4: db "vbroadcasti32x4", 0
    t_vbroadcasti32x8: db "vbroadcasti32x8", 0
    t_vbroadcasti64x2: db "vbroadcasti64x2", 0
    t_vbroadcasti64x4: db "vbroadcasti64x4", 0
    t_vcompresspd: db "vcompresspd", 0
    t_vcompressps: db "vcompressps", 0
    t_vcvtpd2qq: db "vcvtpd2qq", 0
    t_vcvtpd2udq: db "vcvtpd2udq", 0
    t_vcvtpd2uqq: db "vcvtpd2uqq", 0
    t_vcvtps2qq: db "vcvtps2qq", 0
    t_vcvtps2udq: db "vcvtps2udq", 0
    t_vcvtps2uqq: db "vcvtps2uqq", 0
    t_vcvtqq2pd: db "vcvtqq2pd", 0
    t_vcvtqq2ps: db "vcvtqq2ps", 0
    t_vcvtsd2usi: db "vcvtsd2usi", 0
    t_vcvtss2usi: db "vcvtss2usi", 0
    t_vcvttpd2qq: db "vcvttpd2qq", 0
    t_vcvttpd2udq: db "vcvttpd2udq", 0
    t_vcvttpd2uqq: db "vcvttpd2uqq", 0
    t_vcvttps2qq: db "vcvttps2qq", 0
    t_vcvttps2udq: db "vcvttps2udq", 0
    t_vcvttps2uqq: db "vcvttps2uqq", 0
    t_vcvttsd2usi: db "vcvttsd2usi", 0
    t_vcvttss2usi: db "vcvttss2usi", 0
    t_vcvtudq2pd: db "vcvtudq2pd", 0
    t_vcvtudq2ps: db "vcvtudq2ps", 0
    t_vcvtuqq2pd: db "vcvtuqq2pd", 0
    t_vcvtuqq2ps: db "vcvtuqq2ps", 0
    t_vcvtusi2sd: db "vcvtusi2sd", 0
    t_vcvtusi2ss: db "vcvtusi2ss", 0
    t_vdbpsadbw: db "vdbpsadbw", 0
    t_vexp2pd: db "vexp2pd", 0
    t_vexp2ps: db "vexp2ps", 0
    t_vexpandpd: db "vexpandpd", 0
    t_vexpandps: db "vexpandps", 0
    t_vextractf32x4: db "vextractf32x4", 0
    t_vextractf32x8: db "vextractf32x8", 0
    t_vextractf64x2: db "vextractf64x2", 0
    t_vextractf64x4: db "vextractf64x4", 0
    t_vextracti32x4: db "vextracti32x4", 0
    t_vextracti32x8: db "vextracti32x8", 0
    t_vextracti64x2: db "vextracti64x2", 0
    t_vextracti64x4: db "vextracti64x4", 0
    t_vfixupimmpd: db "vfixupimmpd", 0
    t_vfixupimmps: db "vfixupimmps", 0
    t_vfixupimmsd: db "vfixupimmsd", 0
    t_vfixupimmss: db "vfixupimmss", 0
    t_vfpclasspd: db "vfpclasspd", 0
    t_vfpclassps: db "vfpclassps", 0
    t_vfpclasssd: db "vfpclasssd", 0
    t_vfpclassss: db "vfpclassss", 0
    t_vgatherpf0dpd: db "vgatherpf0dpd", 0
    t_vgatherpf0dps: db "vgatherpf0dps", 0
    t_vgatherpf0qpd: db "vgatherpf0qpd", 0
    t_vgatherpf0qps: db "vgatherpf0qps", 0
    t_vgatherpf1dpd: db "vgatherpf1dpd", 0
    t_vgatherpf1dps: db "vgatherpf1dps", 0
    t_vgatherpf1qpd: db "vgatherpf1qpd", 0
    t_vgatherpf1qps: db "vgatherpf1qps", 0
    t_vgetexppd: db "vgetexppd", 0
    t_vgetexpps: db "vgetexpps", 0
    t_vgetexpsd: db "vgetexpsd", 0
    t_vgetexpss: db "vgetexpss", 0
    t_vgetmantpd: db "vgetmantpd", 0
    t_vgetmantps: db "vgetmantps", 0
    t_vgetmantsd: db "vgetmantsd", 0
    t_vgetmantss: db "vgetmantss", 0
    t_vinsertf32x4: db "vinsertf32x4", 0
    t_vinsertf32x8: db "vinsertf32x8", 0
    t_vinsertf64x2: db "vinsertf64x2", 0
    t_vinsertf64x4: db "vinsertf64x4", 0
    t_vinserti32x4: db "vinserti32x4", 0
    t_vinserti32x8: db "vinserti32x8", 0
    t_vinserti64x2: db "vinserti64x2", 0
    t_vinserti64x4: db "vinserti64x4", 0
    t_vmovdqa32: db "vmovdqa32", 0
    t_vmovdqa64: db "vmovdqa64", 0
    t_vmovdqu16: db "vmovdqu16", 0
    t_vmovdqu32: db "vmovdqu32", 0
    t_vmovdqu64: db "vmovdqu64", 0
    t_vmovdqu8: db "vmovdqu8", 0
    t_vpabsq: db "vpabsq", 0
    t_vpandd: db "vpandd", 0
    t_vpandnd: db "vpandnd", 0
    t_vpandnq: db "vpandnq", 0
    t_vpandq: db "vpandq", 0
    t_vpblendmb: db "vpblendmb", 0
    t_vpblendmd: db "vpblendmd", 0
    t_vpblendmq: db "vpblendmq", 0
    t_vpblendmw: db "vpblendmw", 0
    t_vpbroadcastmb2q: db "vpbroadcastmb2q", 0
    t_vpbroadcastmw2d: db "vpbroadcastmw2d", 0
    t_vpcmpb: db "vpcmpb", 0
    t_vpcmpd: db "vpcmpd", 0
    t_vpcmpq: db "vpcmpq", 0
    t_vpcmpub: db "vpcmpub", 0
    t_vpcmpud: db "vpcmpud", 0
    t_vpcmpuq: db "vpcmpuq", 0
    t_vpcmpuw: db "vpcmpuw", 0
    t_vpcmpw: db "vpcmpw", 0
    t_vpcompressd: db "vpcompressd", 0
    t_vpcompressq: db "vpcompressq", 0
    t_vpconflictd: db "vpconflictd", 0
    t_vpconflictq: db "vpconflictq", 0
    t_vpermb: db "vpermb", 0
    t_vpermi2b: db "vpermi2b", 0
    t_vpermi2d: db "vpermi2d", 0
    t_vpermi2pd: db "vpermi2pd", 0
    t_vpermi2ps: db "vpermi2ps", 0
    t_vpermi2q: db "vpermi2q", 0
    t_vpermi2w: db "vpermi2w", 0
    t_vpermt2b: db "vpermt2b", 0
    t_vpermt2d: db "vpermt2d", 0
    t_vpermt2pd: db "vpermt2pd", 0
    t_vpermt2ps: db "vpermt2ps", 0
    t_vpermt2q: db "vpermt2q", 0
    t_vpermt2w: db "vpermt2w", 0
    t_vpermw: db "vpermw", 0
    t_vpexpandd: db "vpexpandd", 0
    t_vpexpandq: db "vpexpandq", 0
    t_vplzcntd: db "vplzcntd", 0
    t_vplzcntq: db "vplzcntq", 0
    t_vpmadd52huq: db "vpmadd52huq", 0
    t_vpmadd52luq: db "vpmadd52luq", 0
    t_vpmaxsq: db "vpmaxsq", 0
    t_vpmaxuq: db "vpmaxuq", 0
    t_vpminsq: db "vpminsq", 0
    t_vpminuq: db "vpminuq", 0
    t_vpmovb2m: db "vpmovb2m", 0
    t_vpmovd2m: db "vpmovd2m", 0
    t_vpmovdb: db "vpmovdb", 0
    t_vpmovdw: db "vpmovdw", 0
    t_vpmovm2b: db "vpmovm2b", 0
    t_vpmovm2d: db "vpmovm2d", 0
    t_vpmovm2q: db "vpmovm2q", 0
    t_vpmovm2w: db "vpmovm2w", 0
    t_vpmovq2m: db "vpmovq2m", 0
    t_vpmovqb: db "vpmovqb", 0
    t_vpmovqd: db "vpmovqd", 0
    t_vpmovqw: db "vpmovqw", 0
    t_vpmovsdb: db "vpmovsdb", 0
    t_vpmovsdw: db "vpmovsdw", 0
    t_vpmovsqb: db "vpmovsqb", 0
    t_vpmovsqd: db "vpmovsqd", 0
    t_vpmovsqw: db "vpmovsqw", 0
    t_vpmovswb: db "vpmovswb", 0
    t_vpmovusdb: db "vpmovusdb", 0
    t_vpmovusdw: db "vpmovusdw", 0
    t_vpmovusqb: db "vpmovusqb", 0
    t_vpmovusqd: db "vpmovusqd", 0
    t_vpmovusqw: db "vpmovusqw", 0
    t_vpmovuswb: db "vpmovuswb", 0
    t_vpmovw2m: db "vpmovw2m", 0
    t_vpmovwb: db "vpmovwb", 0
    t_vpmullq: db "vpmullq", 0
    t_vpmultishiftqb: db "vpmultishiftqb", 0
    t_vpord: db "vpord", 0
    t_vporq: db "vporq", 0
    t_vprold: db "vprold", 0
    t_vprolq: db "vprolq", 0
    t_vprolvd: db "vprolvd", 0
    t_vprolvq: db "vprolvq", 0
    t_vprord: db "vprord", 0
    t_vprorq: db "vprorq", 0
    t_vprorvd: db "vprorvd", 0
    t_vprorvq: db "vprorvq", 0
    t_vpscatterdd: db "vpscatterdd", 0
    t_vpscatterdq: db "vpscatterdq", 0
    t_vpscatterqd: db "vpscatterqd", 0
    t_vpscatterqq: db "vpscatterqq", 0
    t_vpsllvw: db "vpsllvw", 0
    t_vpsraq: db "vpsraq", 0
    t_vpsravq: db "vpsravq", 0
    t_vpsravw: db "vpsravw", 0
    t_vpsrlvw: db "vpsrlvw", 0
    t_vpternlogd: db "vpternlogd", 0
    t_vpternlogq: db "vpternlogq", 0
    t_vptestmb: db "vptestmb", 0
    t_vptestmd: db "vptestmd", 0
    t_vptestmq: db "vptestmq", 0
    t_vptestmw: db "vptestmw", 0
    t_vptestnmb: db "vptestnmb", 0
    t_vptestnmd: db "vptestnmd", 0
    t_vptestnmq: db "vptestnmq", 0
    t_vptestnmw: db "vptestnmw", 0
    t_vpxord: db "vpxord", 0
    t_vpxorq: db "vpxorq", 0
    t_vrangepd: db "vrangepd", 0
    t_vrangeps: db "vrangeps", 0
    t_vrangesd: db "vrangesd", 0
    t_vrangess: db "vrangess", 0
    t_vrcp14pd: db "vrcp14pd", 0
    t_vrcp14ps: db "vrcp14ps", 0
    t_vrcp14sd: db "vrcp14sd", 0
    t_vrcp14ss: db "vrcp14ss", 0
    t_vrcp28pd: db "vrcp28pd", 0
    t_vrcp28ps: db "vrcp28ps", 0
    t_vrcp28sd: db "vrcp28sd", 0
    t_vrcp28ss: db "vrcp28ss", 0
    t_vreducepd: db "vreducepd", 0
    t_vreduceps: db "vreduceps", 0
    t_vreducesd: db "vreducesd", 0
    t_vreducess: db "vreducess", 0
    t_vrndscalepd: db "vrndscalepd", 0
    t_vrndscaleps: db "vrndscaleps", 0
    t_vrndscalesd: db "vrndscalesd", 0
    t_vrndscaless: db "vrndscaless", 0
    t_vrsqrt14pd: db "vrsqrt14pd", 0
    t_vrsqrt14ps: db "vrsqrt14ps", 0
    t_vrsqrt14sd: db "vrsqrt14sd", 0
    t_vrsqrt14ss: db "vrsqrt14ss", 0
    t_vrsqrt28pd: db "vrsqrt28pd", 0
    t_vrsqrt28ps: db "vrsqrt28ps", 0
    t_vrsqrt28sd: db "vrsqrt28sd", 0
    t_vrsqrt28ss: db "vrsqrt28ss", 0
    t_vscalefpd: db "vscalefpd", 0
    t_vscalefps: db "vscalefps", 0
    t_vscalefsd: db "vscalefsd", 0
    t_vscalefss: db "vscalefss", 0
    t_vscatterdpd: db "vscatterdpd", 0
    t_vscatterdps: db "vscatterdps", 0
    t_vscatterpf0dpd: db "vscatterpf0dpd", 0
    t_vscatterpf0dps: db "vscatterpf0dps", 0
    t_vscatterpf0qpd: db "vscatterpf0qpd", 0
    t_vscatterpf0qps: db "vscatterpf0qps", 0
    t_vscatterpf1dpd: db "vscatterpf1dpd", 0
    t_vscatterpf1dps: db "vscatterpf1dps", 0
    t_vscatterpf1qpd: db "vscatterpf1qpd", 0
    t_vscatterpf1qps: db "vscatterpf1qps", 0
    t_vscatterqpd: db "vscatterqpd", 0
    t_vscatterqps: db "vscatterqps", 0
    t_vshuff32x4: db "vshuff32x4", 0
    t_vshuff64x2: db "vshuff64x2", 0
    t_vshufi32x4: db "vshufi32x4", 0
    t_vshufi64x2: db "vshufi64x2", 0
    t_rdpkru: db "rdpkru", 0
    t_wrpkru: db "wrpkru", 0
    t_rdpid: db "rdpid", 0
    t_clflushopt: db "clflushopt", 0
    t_clwb: db "clwb", 0
    t_pcommit: db "pcommit", 0
    t_clzero: db "clzero", 0
    t_ptwrite: db "ptwrite", 0
    t_cldemote: db "cldemote", 0
    t_movdiri: db "movdiri", 0
    t_movdir64b: db "movdir64b", 0
    t_pconfig: db "pconfig", 0
    t_tpause: db "tpause", 0
    t_umonitor: db "umonitor", 0
    t_umwait: db "umwait", 0
    t_wbnoinvd: db "wbnoinvd", 0
    t_gf2p8affineinvqb: db "gf2p8affineinvqb", 0
    t_vgf2p8affineinvqb: db "vgf2p8affineinvqb", 0
    t_gf2p8affineqb: db "gf2p8affineqb", 0
    t_vgf2p8affineqb: db "vgf2p8affineqb", 0
    t_gf2p8mulb: db "gf2p8mulb", 0
    t_vgf2p8mulb: db "vgf2p8mulb", 0
    t_vpcompressb: db "vpcompressb", 0
    t_vpcompressw: db "vpcompressw", 0
    t_vpexpandb: db "vpexpandb", 0
    t_vpexpandw: db "vpexpandw", 0
    t_vpshldw: db "vpshldw", 0
    t_vpshldd: db "vpshldd", 0
    t_vpshldq: db "vpshldq", 0
    t_vpshldvw: db "vpshldvw", 0
    t_vpshldvd: db "vpshldvd", 0
    t_vpshldvq: db "vpshldvq", 0
    t_vpshrdw: db "vpshrdw", 0
    t_vpshrdd: db "vpshrdd", 0
    t_vpshrdq: db "vpshrdq", 0
    t_vpshrdvw: db "vpshrdvw", 0
    t_vpshrdvd: db "vpshrdvd", 0
    t_vpshrdvq: db "vpshrdvq", 0
    t_vpdpbusd: db "vpdpbusd", 0
    t_vpdpbusds: db "vpdpbusds", 0
    t_vpdpwssd: db "vpdpwssd", 0
    t_vpdpwssds: db "vpdpwssds", 0
    t_vpopcntb: db "vpopcntb", 0
    t_vpopcntw: db "vpopcntw", 0
    t_vpopcntd: db "vpopcntd", 0
    t_vpopcntq: db "vpopcntq", 0
    t_vpshufbitqmb: db "vpshufbitqmb", 0
    t_v4fmaddps: db "v4fmaddps", 0
    t_v4fnmaddps: db "v4fnmaddps", 0
    t_v4fmaddss: db "v4fmaddss", 0
    t_v4fnmaddss: db "v4fnmaddss", 0
    t_v4dpwssds: db "v4dpwssds", 0
    t_v4dpwssd: db "v4dpwssd", 0
    t_encls: db "encls", 0
    t_enclu: db "enclu", 0
    t_enclv: db "enclv", 0
    t_hint_nop0: db "hint_nop0", 0
    t_hint_nop1: db "hint_nop1", 0
    t_hint_nop2: db "hint_nop2", 0
    t_hint_nop3: db "hint_nop3", 0
    t_hint_nop4: db "hint_nop4", 0
    t_hint_nop5: db "hint_nop5", 0
    t_hint_nop6: db "hint_nop6", 0
    t_hint_nop7: db "hint_nop7", 0
    t_hint_nop8: db "hint_nop8", 0
    t_hint_nop9: db "hint_nop9", 0
    t_hint_nop10: db "hint_nop10", 0
    t_hint_nop11: db "hint_nop11", 0
    t_hint_nop12: db "hint_nop12", 0
    t_hint_nop13: db "hint_nop13", 0
    t_hint_nop14: db "hint_nop14", 0
    t_hint_nop15: db "hint_nop15", 0
    t_hint_nop16: db "hint_nop16", 0
    t_hint_nop17: db "hint_nop17", 0
    t_hint_nop18: db "hint_nop18", 0
    t_hint_nop19: db "hint_nop19", 0
    t_hint_nop20: db "hint_nop20", 0
    t_hint_nop21: db "hint_nop21", 0
    t_hint_nop22: db "hint_nop22", 0
    t_hint_nop23: db "hint_nop23", 0
    t_hint_nop24: db "hint_nop24", 0
    t_hint_nop25: db "hint_nop25", 0
    t_hint_nop26: db "hint_nop26", 0
    t_hint_nop27: db "hint_nop27", 0
    t_hint_nop28: db "hint_nop28", 0
    t_hint_nop29: db "hint_nop29", 0
    t_hint_nop30: db "hint_nop30", 0
    t_hint_nop31: db "hint_nop31", 0
    t_hint_nop32: db "hint_nop32", 0
    t_hint_nop33: db "hint_nop33", 0
    t_hint_nop34: db "hint_nop34", 0
    t_hint_nop35: db "hint_nop35", 0
    t_hint_nop36: db "hint_nop36", 0
    t_hint_nop37: db "hint_nop37", 0
    t_hint_nop38: db "hint_nop38", 0
    t_hint_nop39: db "hint_nop39", 0
    t_hint_nop40: db "hint_nop40", 0
    t_hint_nop41: db "hint_nop41", 0
    t_hint_nop42: db "hint_nop42", 0
    t_hint_nop43: db "hint_nop43", 0
    t_hint_nop44: db "hint_nop44", 0
    t_hint_nop45: db "hint_nop45", 0
    t_hint_nop46: db "hint_nop46", 0
    t_hint_nop47: db "hint_nop47", 0
    t_hint_nop48: db "hint_nop48", 0
    t_hint_nop49: db "hint_nop49", 0
    t_hint_nop50: db "hint_nop50", 0
    t_hint_nop51: db "hint_nop51", 0
    t_hint_nop52: db "hint_nop52", 0
    t_hint_nop53: db "hint_nop53", 0
    t_hint_nop54: db "hint_nop54", 0
    t_hint_nop55: db "hint_nop55", 0
    t_hint_nop56: db "hint_nop56", 0
    t_hint_nop57: db "hint_nop57", 0
    t_hint_nop58: db "hint_nop58", 0
    t_hint_nop59: db "hint_nop59", 0
    t_hint_nop60: db "hint_nop60", 0
    t_hint_nop61: db "hint_nop61", 0
    t_hint_nop62: db "hint_nop62", 0
    t_hint_nop63: db "hint_nop63", 0
    t_al: db "al", 0
    t_ah: db "ah", 0
    t_ax: db "ax", 0
    t_eax: db "eax", 0
    t_rax: db "rax", 0
    t_bl: db "bl", 0
    t_bh: db "bh", 0
    t_bx: db "bx", 0
    t_ebx: db "ebx", 0
    t_rbx: db "rbx", 0
    t_cl: db "cl", 0
    t_ch: db "ch", 0
    t_cx: db "cx", 0
    t_ecx: db "ecx", 0
    t_rcx: db "rcx", 0
    t_dl: db "dl", 0
    t_dh: db "dh", 0
    t_dx: db "dx", 0
    t_edx: db "edx", 0
    t_rdx: db "rdx", 0
    t_spl: db "spl", 0
    t_sp: db "sp", 0
    t_esp: db "esp", 0
    t_rsp: db "rsp", 0
    t_bpl: db "bpl", 0
    t_bp: db "bp", 0
    t_ebp: db "ebp", 0
    t_rbp: db "rbp", 0
    t_sil: db "sil", 0
    t_si: db "si", 0
    t_esi: db "esi", 0
    t_rsi: db "rsi", 0
    t_dil: db "dil", 0
    t_di: db "di", 0
    t_edi: db "edi", 0
    t_rdi: db "rdi", 0
    t_r8b: db "r8b", 0
    t_r9b: db "r9b", 0
    t_r10b: db "r10b", 0
    t_r11b: db "r11b", 0
    t_r12b: db "r12b", 0
    t_r13b: db "r13b", 0
    t_r14b: db "r14b", 0
    t_r15b: db "r15b", 0
    t_r8w: db "r8w", 0
    t_r9w: db "r9w", 0
    t_r10w: db "r10w", 0
    t_r11w: db "r11w", 0
    t_r12w: db "r12w", 0
    t_r13w: db "r13w", 0
    t_r14w: db "r14w", 0
    t_r15w: db "r15w", 0
    t_r8d: db "r8d", 0
    t_r9d: db "r9d", 0
    t_r10d: db "r10d", 0
    t_r11d: db "r11d", 0
    t_r12d: db "r12d", 0
    t_r13d: db "r13d", 0
    t_r14d: db "r14d", 0
    t_r15d: db "r15d", 0
    t_r8: db "r8", 0
    t_r9: db "r9", 0
    t_r10: db "r10", 0
    t_r11: db "r11", 0
    t_r12: db "r12", 0
    t_r13: db "r13", 0
    t_r14: db "r14", 0
    t_r15: db "r15", 0
    t_es: db "es", 0
    t_cs: db "cs", 0
    t_ss: db "ss", 0
    t_ds: db "ds", 0
    t_fs: db "fs", 0
    t_gs: db "gs", 0
    t_segr6: db "segr6", 0
    t_segr7: db "segr7", 0
    t_cr0: db "cr0", 0
    t_cr1: db "cr1", 0
    t_cr2: db "cr2", 0
    t_cr3: db "cr3", 0
    t_cr4: db "cr4", 0
    t_cr5: db "cr5", 0
    t_cr6: db "cr6", 0
    t_cr7: db "cr7", 0
    t_cr8: db "cr8", 0
    t_cr9: db "cr9", 0
    t_cr10: db "cr10", 0
    t_cr11: db "cr11", 0
    t_cr12: db "cr12", 0
    t_cr13: db "cr13", 0
    t_cr14: db "cr14", 0
    t_cr15: db "cr15", 0
    t_dr0: db "dr0", 0
    t_dr1: db "dr1", 0
    t_dr2: db "dr2", 0
    t_dr3: db "dr3", 0
    t_dr4: db "dr4", 0
    t_dr5: db "dr5", 0
    t_dr6: db "dr6", 0
    t_dr7: db "dr7", 0
    t_dr8: db "dr8", 0
    t_dr9: db "dr9", 0
    t_dr10: db "dr10", 0
    t_dr11: db "dr11", 0
    t_dr12: db "dr12", 0
    t_dr13: db "dr13", 0
    t_dr14: db "dr14", 0
    t_dr15: db "dr15", 0
    t_tr0: db "tr0", 0
    t_tr1: db "tr1", 0
    t_tr2: db "tr2", 0
    t_tr3: db "tr3", 0
    t_tr4: db "tr4", 0
    t_tr5: db "tr5", 0
    t_tr6: db "tr6", 0
    t_tr7: db "tr7", 0
    t_st0: db "st0", 0
    t_st1: db "st1", 0
    t_st2: db "st2", 0
    t_st3: db "st3", 0
    t_st4: db "st4", 0
    t_st5: db "st5", 0
    t_st6: db "st6", 0
    t_st7: db "st7", 0
    t_mm0: db "mm0", 0
    t_mm1: db "mm1", 0
    t_mm2: db "mm2", 0
    t_mm3: db "mm3", 0
    t_mm4: db "mm4", 0
    t_mm5: db "mm5", 0
    t_mm6: db "mm6", 0
    t_mm7: db "mm7", 0
    t_xmm0: db "xmm0", 0
    t_xmm1: db "xmm1", 0
    t_xmm2: db "xmm2", 0
    t_xmm3: db "xmm3", 0
    t_xmm4: db "xmm4", 0
    t_xmm5: db "xmm5", 0
    t_xmm6: db "xmm6", 0
    t_xmm7: db "xmm7", 0
    t_xmm8: db "xmm8", 0
    t_xmm9: db "xmm9", 0
    t_xmm10: db "xmm10", 0
    t_xmm11: db "xmm11", 0
    t_xmm12: db "xmm12", 0
    t_xmm13: db "xmm13", 0
    t_xmm14: db "xmm14", 0
    t_xmm15: db "xmm15", 0
    t_xmm16: db "xmm16", 0
    t_xmm17: db "xmm17", 0
    t_xmm18: db "xmm18", 0
    t_xmm19: db "xmm19", 0
    t_xmm20: db "xmm20", 0
    t_xmm21: db "xmm21", 0
    t_xmm22: db "xmm22", 0
    t_xmm23: db "xmm23", 0
    t_xmm24: db "xmm24", 0
    t_xmm25: db "xmm25", 0
    t_xmm26: db "xmm26", 0
    t_xmm27: db "xmm27", 0
    t_xmm28: db "xmm28", 0
    t_xmm29: db "xmm29", 0
    t_xmm30: db "xmm30", 0
    t_xmm31: db "xmm31", 0
    t_ymm0: db "ymm0", 0
    t_ymm1: db "ymm1", 0
    t_ymm2: db "ymm2", 0
    t_ymm3: db "ymm3", 0
    t_ymm4: db "ymm4", 0
    t_ymm5: db "ymm5", 0
    t_ymm6: db "ymm6", 0
    t_ymm7: db "ymm7", 0
    t_ymm8: db "ymm8", 0
    t_ymm9: db "ymm9", 0
    t_ymm10: db "ymm10", 0
    t_ymm11: db "ymm11", 0
    t_ymm12: db "ymm12", 0
    t_ymm13: db "ymm13", 0
    t_ymm14: db "ymm14", 0
    t_ymm15: db "ymm15", 0
    t_ymm16: db "ymm16", 0
    t_ymm17: db "ymm17", 0
    t_ymm18: db "ymm18", 0
    t_ymm19: db "ymm19", 0
    t_ymm20: db "ymm20", 0
    t_ymm21: db "ymm21", 0
    t_ymm22: db "ymm22", 0
    t_ymm23: db "ymm23", 0
    t_ymm24: db "ymm24", 0
    t_ymm25: db "ymm25", 0
    t_ymm26: db "ymm26", 0
    t_ymm27: db "ymm27", 0
    t_ymm28: db "ymm28", 0
    t_ymm29: db "ymm29", 0
    t_ymm30: db "ymm30", 0
    t_ymm31: db "ymm31", 0
    t_zmm0: db "zmm0", 0
    t_zmm1: db "zmm1", 0
    t_zmm2: db "zmm2", 0
    t_zmm3: db "zmm3", 0
    t_zmm4: db "zmm4", 0
    t_zmm5: db "zmm5", 0
    t_zmm6: db "zmm6", 0
    t_zmm7: db "zmm7", 0
    t_zmm8: db "zmm8", 0
    t_zmm9: db "zmm9", 0
    t_zmm10: db "zmm10", 0
    t_zmm11: db "zmm11", 0
    t_zmm12: db "zmm12", 0
    t_zmm13: db "zmm13", 0
    t_zmm14: db "zmm14", 0
    t_zmm15: db "zmm15", 0
    t_zmm16: db "zmm16", 0
    t_zmm17: db "zmm17", 0
    t_zmm18: db "zmm18", 0
    t_zmm19: db "zmm19", 0
    t_zmm20: db "zmm20", 0
    t_zmm21: db "zmm21", 0
    t_zmm22: db "zmm22", 0
    t_zmm23: db "zmm23", 0
    t_zmm24: db "zmm24", 0
    t_zmm25: db "zmm25", 0
    t_zmm26: db "zmm26", 0
    t_zmm27: db "zmm27", 0
    t_zmm28: db "zmm28", 0
    t_zmm29: db "zmm29", 0
    t_zmm30: db "zmm30", 0
    t_zmm31: db "zmm31", 0
    t_k0: db "k0", 0
    t_k1: db "k1", 0
    t_k2: db "k2", 0
    t_k3: db "k3", 0
    t_k4: db "k4", 0
    t_k5: db "k5", 0
    t_k6: db "k6", 0
    t_k7: db "k7", 0
    t_bnd0: db "bnd0", 0
    t_bnd1: db "bnd1", 0
    t_bnd2: db "bnd2", 0
    t_bnd3: db "bnd3", 0
    t_a16: db "a16", 0
    t_a32: db "a32", 0
    t_a64: db "a64", 0
    t_asp: db "asp", 0
    t_lock: db "lock", 0
    t_o16: db "o16", 0
    t_o32: db "o32", 0
    t_o64: db "o64", 0
    t_osp: db "osp", 0
    t_rep: db "rep", 0
    t_repe: db "repe", 0
    t_repne: db "repne", 0
    t_repnz: db "repnz", 0
    t_repz: db "repz", 0
    t_times: db "times", 0
    t_wait: db "wait", 0
    t_xacquire: db "xacquire", 0
    t_xrelease: db "xrelease", 0
    t_bnd: db "bnd", 0
    t_nobnd: db "nobnd", 0
    t_abs: db "abs", 0
    t_byte: db "byte", 0
    t_dword: db "dword", 0
    t_far: db "far", 0
    t_long: db "long", 0
    t_near: db "near", 0
    t_nosplit: db "nosplit", 0
    t_oword: db "oword", 0
    t_qword: db "qword", 0
    t_rel: db "rel", 0
    t_short: db "short", 0
    t_strict: db "strict", 0
    t_to: db "to", 0
    t_tword: db "tword", 0
    t_word: db "word", 0
    t_yword: db "yword", 0
    t_zword: db "zword", 0
    t_ptr: db "ptr", 0
    t___infinity__: db "__infinity__", 0
    t___nan__: db "__nan__", 0
    t___qnan__: db "__qnan__", 0
    t___snan__: db "__snan__", 0
    t___float8__: db "__float8__", 0
    t___float16__: db "__float16__", 0
    t___float32__: db "__float32__", 0
    t___float64__: db "__float64__", 0
    t___float80m__: db "__float80m__", 0
    t___float80e__: db "__float80e__", 0
    t___float128l__: db "__float128l__", 0
    t___float128h__: db "__float128h__", 0
    t___utf16__: db "__utf16__", 0
    t___utf16le__: db "__utf16le__", 0
    t___utf16be__: db "__utf16be__", 0
    t___utf32__: db "__utf32__", 0
    t___utf32le__: db "__utf32le__", 0
    t___utf32be__: db "__utf32be__", 0
    t___ilog2e__: db "__ilog2e__", 0
    t___ilog2w__: db "__ilog2w__", 0
    t___ilog2f__: db "__ilog2f__", 0
    t___ilog2c__: db "__ilog2c__", 0
    t_seg: db "seg", 0
    t_wrt: db "wrt", 0
    t_1to2: db "1to2", 0
    t_1to4: db "1to4", 0
    t_1to8: db "1to8", 0
    t_1to16: db "1to16", 0
    t_rn_sae: db "rn-sae", 0
    t_rd_sae: db "rd-sae", 0
    t_ru_sae: db "ru-sae", 0
    t_rz_sae: db "rz-sae", 0
    t_sae: db "sae", 0
    t_z: db "z", 0
    t_evex: db "evex", 0
    t_vex3: db "vex3", 0
    t_vex2: db "vex2", 0

; --- 2. Kesintisiz Tokendata Dizisi (12-byte struct array) ---
tokendata:
    ; { "db", TOKEN_INSN, C_none, 0, I_DB },
    TOK t_db, TOKEN_INSN, C_none, 0, I_DB

    ; { "dw", TOKEN_INSN, C_none, 0, I_DW },
    TOK t_dw, TOKEN_INSN, C_none, 0, I_DW

    ; { "dd", TOKEN_INSN, C_none, 0, I_DD },
    TOK t_dd, TOKEN_INSN, C_none, 0, I_DD

    ; { "dq", TOKEN_INSN, C_none, 0, I_DQ },
    TOK t_dq, TOKEN_INSN, C_none, 0, I_DQ

    ; { "dt", TOKEN_INSN, C_none, 0, I_DT },
    TOK t_dt, TOKEN_INSN, C_none, 0, I_DT

    ; { "do", TOKEN_INSN, C_none, 0, I_DO },
    TOK t_do, TOKEN_INSN, C_none, 0, I_DO

    ; { "dy", TOKEN_INSN, C_none, 0, I_DY },
    TOK t_dy, TOKEN_INSN, C_none, 0, I_DY

    ; { "dz", TOKEN_INSN, C_none, 0, I_DZ },
    TOK t_dz, TOKEN_INSN, C_none, 0, I_DZ

    ; { "resb", TOKEN_INSN, C_none, 0, I_RESB },
    TOK t_resb, TOKEN_INSN, C_none, 0, I_RESB

    ; { "resw", TOKEN_INSN, C_none, 0, I_RESW },
    TOK t_resw, TOKEN_INSN, C_none, 0, I_RESW

    ; { "resd", TOKEN_INSN, C_none, 0, I_RESD },
    TOK t_resd, TOKEN_INSN, C_none, 0, I_RESD

    ; { "resq", TOKEN_INSN, C_none, 0, I_RESQ },
    TOK t_resq, TOKEN_INSN, C_none, 0, I_RESQ

    ; { "rest", TOKEN_INSN, C_none, 0, I_REST },
    TOK t_rest, TOKEN_INSN, C_none, 0, I_REST

    ; { "reso", TOKEN_INSN, C_none, 0, I_RESO },
    TOK t_reso, TOKEN_INSN, C_none, 0, I_RESO

    ; { "resy", TOKEN_INSN, C_none, 0, I_RESY },
    TOK t_resy, TOKEN_INSN, C_none, 0, I_RESY

    ; { "resz", TOKEN_INSN, C_none, 0, I_RESZ },
    TOK t_resz, TOKEN_INSN, C_none, 0, I_RESZ

    ; { "incbin", TOKEN_INSN, C_none, 0, I_INCBIN },
    TOK t_incbin, TOKEN_INSN, C_none, 0, I_INCBIN

    ; { "aaa", TOKEN_INSN, C_none, 0, I_AAA },
    TOK t_aaa, TOKEN_INSN, C_none, 0, I_AAA

    ; { "aad", TOKEN_INSN, C_none, 0, I_AAD },
    TOK t_aad, TOKEN_INSN, C_none, 0, I_AAD

    ; { "aam", TOKEN_INSN, C_none, 0, I_AAM },
    TOK t_aam, TOKEN_INSN, C_none, 0, I_AAM

    ; { "aas", TOKEN_INSN, C_none, 0, I_AAS },
    TOK t_aas, TOKEN_INSN, C_none, 0, I_AAS

    ; { "adc", TOKEN_INSN, C_none, 0, I_ADC },
    TOK t_adc, TOKEN_INSN, C_none, 0, I_ADC

    ; { "add", TOKEN_INSN, C_none, 0, I_ADD },
    TOK t_add, TOKEN_INSN, C_none, 0, I_ADD

    ; { "and", TOKEN_INSN, C_none, 0, I_AND },
    TOK t_and, TOKEN_INSN, C_none, 0, I_AND

    ; { "arpl", TOKEN_INSN, C_none, 0, I_ARPL },
    TOK t_arpl, TOKEN_INSN, C_none, 0, I_ARPL

    ; { "bb0_reset", TOKEN_INSN, C_none, 0, I_BB0_RESET },
    TOK t_bb0_reset, TOKEN_INSN, C_none, 0, I_BB0_RESET

    ; { "bb1_reset", TOKEN_INSN, C_none, 0, I_BB1_RESET },
    TOK t_bb1_reset, TOKEN_INSN, C_none, 0, I_BB1_RESET

    ; { "bound", TOKEN_INSN, C_none, 0, I_BOUND },
    TOK t_bound, TOKEN_INSN, C_none, 0, I_BOUND

    ; { "bsf", TOKEN_INSN, C_none, 0, I_BSF },
    TOK t_bsf, TOKEN_INSN, C_none, 0, I_BSF

    ; { "bsr", TOKEN_INSN, C_none, 0, I_BSR },
    TOK t_bsr, TOKEN_INSN, C_none, 0, I_BSR

    ; { "bswap", TOKEN_INSN, C_none, 0, I_BSWAP },
    TOK t_bswap, TOKEN_INSN, C_none, 0, I_BSWAP

    ; { "bt", TOKEN_INSN, C_none, 0, I_BT },
    TOK t_bt, TOKEN_INSN, C_none, 0, I_BT

    ; { "btc", TOKEN_INSN, C_none, 0, I_BTC },
    TOK t_btc, TOKEN_INSN, C_none, 0, I_BTC

    ; { "btr", TOKEN_INSN, C_none, 0, I_BTR },
    TOK t_btr, TOKEN_INSN, C_none, 0, I_BTR

    ; { "bts", TOKEN_INSN, C_none, 0, I_BTS },
    TOK t_bts, TOKEN_INSN, C_none, 0, I_BTS

    ; { "call", TOKEN_INSN, C_none, 0, I_CALL },
    TOK t_call, TOKEN_INSN, C_none, 0, I_CALL

    ; { "cbw", TOKEN_INSN, C_none, 0, I_CBW },
    TOK t_cbw, TOKEN_INSN, C_none, 0, I_CBW

    ; { "cdq", TOKEN_INSN, C_none, 0, I_CDQ },
    TOK t_cdq, TOKEN_INSN, C_none, 0, I_CDQ

    ; { "cdqe", TOKEN_INSN, C_none, 0, I_CDQE },
    TOK t_cdqe, TOKEN_INSN, C_none, 0, I_CDQE

    ; { "clc", TOKEN_INSN, C_none, 0, I_CLC },
    TOK t_clc, TOKEN_INSN, C_none, 0, I_CLC

    ; { "cld", TOKEN_INSN, C_none, 0, I_CLD },
    TOK t_cld, TOKEN_INSN, C_none, 0, I_CLD

    ; { "cli", TOKEN_INSN, C_none, 0, I_CLI },
    TOK t_cli, TOKEN_INSN, C_none, 0, I_CLI

    ; { "clts", TOKEN_INSN, C_none, 0, I_CLTS },
    TOK t_clts, TOKEN_INSN, C_none, 0, I_CLTS

    ; { "cmc", TOKEN_INSN, C_none, 0, I_CMC },
    TOK t_cmc, TOKEN_INSN, C_none, 0, I_CMC

    ; { "cmp", TOKEN_INSN, C_none, 0, I_CMP },
    TOK t_cmp, TOKEN_INSN, C_none, 0, I_CMP

    ; { "cmpsb", TOKEN_INSN, C_none, 0, I_CMPSB },
    TOK t_cmpsb, TOKEN_INSN, C_none, 0, I_CMPSB

    ; { "cmpsd", TOKEN_INSN, C_none, 0, I_CMPSD },
    TOK t_cmpsd, TOKEN_INSN, C_none, 0, I_CMPSD

    ; { "cmpsq", TOKEN_INSN, C_none, 0, I_CMPSQ },
    TOK t_cmpsq, TOKEN_INSN, C_none, 0, I_CMPSQ

    ; { "cmpsw", TOKEN_INSN, C_none, 0, I_CMPSW },
    TOK t_cmpsw, TOKEN_INSN, C_none, 0, I_CMPSW

    ; { "cmpxchg", TOKEN_INSN, C_none, 0, I_CMPXCHG },
    TOK t_cmpxchg, TOKEN_INSN, C_none, 0, I_CMPXCHG

    ; { "cmpxchg486", TOKEN_INSN, C_none, 0, I_CMPXCHG486 },
    TOK t_cmpxchg486, TOKEN_INSN, C_none, 0, I_CMPXCHG486

    ; { "cmpxchg8b", TOKEN_INSN, C_none, 0, I_CMPXCHG8B },
    TOK t_cmpxchg8b, TOKEN_INSN, C_none, 0, I_CMPXCHG8B

    ; { "cmpxchg16b", TOKEN_INSN, C_none, 0, I_CMPXCHG16B },
    TOK t_cmpxchg16b, TOKEN_INSN, C_none, 0, I_CMPXCHG16B

    ; { "cpuid", TOKEN_INSN, C_none, 0, I_CPUID },
    TOK t_cpuid, TOKEN_INSN, C_none, 0, I_CPUID

    ; { "cpu_read", TOKEN_INSN, C_none, 0, I_CPU_READ },
    TOK t_cpu_read, TOKEN_INSN, C_none, 0, I_CPU_READ

    ; { "cpu_write", TOKEN_INSN, C_none, 0, I_CPU_WRITE },
    TOK t_cpu_write, TOKEN_INSN, C_none, 0, I_CPU_WRITE

    ; { "cqo", TOKEN_INSN, C_none, 0, I_CQO },
    TOK t_cqo, TOKEN_INSN, C_none, 0, I_CQO

    ; { "cwd", TOKEN_INSN, C_none, 0, I_CWD },
    TOK t_cwd, TOKEN_INSN, C_none, 0, I_CWD

    ; { "cwde", TOKEN_INSN, C_none, 0, I_CWDE },
    TOK t_cwde, TOKEN_INSN, C_none, 0, I_CWDE

    ; { "daa", TOKEN_INSN, C_none, 0, I_DAA },
    TOK t_daa, TOKEN_INSN, C_none, 0, I_DAA

    ; { "das", TOKEN_INSN, C_none, 0, I_DAS },
    TOK t_das, TOKEN_INSN, C_none, 0, I_DAS

    ; { "dec", TOKEN_INSN, C_none, 0, I_DEC },
    TOK t_dec, TOKEN_INSN, C_none, 0, I_DEC

    ; { "div", TOKEN_INSN, C_none, 0, I_DIV },
    TOK t_div, TOKEN_INSN, C_none, 0, I_DIV

    ; { "dmint", TOKEN_INSN, C_none, 0, I_DMINT },
    TOK t_dmint, TOKEN_INSN, C_none, 0, I_DMINT

    ; { "emms", TOKEN_INSN, C_none, 0, I_EMMS },
    TOK t_emms, TOKEN_INSN, C_none, 0, I_EMMS

    ; { "enter", TOKEN_INSN, C_none, 0, I_ENTER },
    TOK t_enter, TOKEN_INSN, C_none, 0, I_ENTER

    ; { "equ", TOKEN_INSN, C_none, 0, I_EQU },
    TOK t_equ, TOKEN_INSN, C_none, 0, I_EQU

    ; { "f2xm1", TOKEN_INSN, C_none, 0, I_F2XM1 },
    TOK t_f2xm1, TOKEN_INSN, C_none, 0, I_F2XM1

    ; { "fabs", TOKEN_INSN, C_none, 0, I_FABS },
    TOK t_fabs, TOKEN_INSN, C_none, 0, I_FABS

    ; { "fadd", TOKEN_INSN, C_none, 0, I_FADD },
    TOK t_fadd, TOKEN_INSN, C_none, 0, I_FADD

    ; { "faddp", TOKEN_INSN, C_none, 0, I_FADDP },
    TOK t_faddp, TOKEN_INSN, C_none, 0, I_FADDP

    ; { "fbld", TOKEN_INSN, C_none, 0, I_FBLD },
    TOK t_fbld, TOKEN_INSN, C_none, 0, I_FBLD

    ; { "fbstp", TOKEN_INSN, C_none, 0, I_FBSTP },
    TOK t_fbstp, TOKEN_INSN, C_none, 0, I_FBSTP

    ; { "fchs", TOKEN_INSN, C_none, 0, I_FCHS },
    TOK t_fchs, TOKEN_INSN, C_none, 0, I_FCHS

    ; { "fclex", TOKEN_INSN, C_none, 0, I_FCLEX },
    TOK t_fclex, TOKEN_INSN, C_none, 0, I_FCLEX

    ; { "fcmovb", TOKEN_INSN, C_none, 0, I_FCMOVB },
    TOK t_fcmovb, TOKEN_INSN, C_none, 0, I_FCMOVB

    ; { "fcmovbe", TOKEN_INSN, C_none, 0, I_FCMOVBE },
    TOK t_fcmovbe, TOKEN_INSN, C_none, 0, I_FCMOVBE

    ; { "fcmove", TOKEN_INSN, C_none, 0, I_FCMOVE },
    TOK t_fcmove, TOKEN_INSN, C_none, 0, I_FCMOVE

    ; { "fcmovnb", TOKEN_INSN, C_none, 0, I_FCMOVNB },
    TOK t_fcmovnb, TOKEN_INSN, C_none, 0, I_FCMOVNB

    ; { "fcmovnbe", TOKEN_INSN, C_none, 0, I_FCMOVNBE },
    TOK t_fcmovnbe, TOKEN_INSN, C_none, 0, I_FCMOVNBE

    ; { "fcmovne", TOKEN_INSN, C_none, 0, I_FCMOVNE },
    TOK t_fcmovne, TOKEN_INSN, C_none, 0, I_FCMOVNE

    ; { "fcmovnu", TOKEN_INSN, C_none, 0, I_FCMOVNU },
    TOK t_fcmovnu, TOKEN_INSN, C_none, 0, I_FCMOVNU

    ; { "fcmovu", TOKEN_INSN, C_none, 0, I_FCMOVU },
    TOK t_fcmovu, TOKEN_INSN, C_none, 0, I_FCMOVU

    ; { "fcom", TOKEN_INSN, C_none, 0, I_FCOM },
    TOK t_fcom, TOKEN_INSN, C_none, 0, I_FCOM

    ; { "fcomi", TOKEN_INSN, C_none, 0, I_FCOMI },
    TOK t_fcomi, TOKEN_INSN, C_none, 0, I_FCOMI

    ; { "fcomip", TOKEN_INSN, C_none, 0, I_FCOMIP },
    TOK t_fcomip, TOKEN_INSN, C_none, 0, I_FCOMIP

    ; { "fcomp", TOKEN_INSN, C_none, 0, I_FCOMP },
    TOK t_fcomp, TOKEN_INSN, C_none, 0, I_FCOMP

    ; { "fcompp", TOKEN_INSN, C_none, 0, I_FCOMPP },
    TOK t_fcompp, TOKEN_INSN, C_none, 0, I_FCOMPP

    ; { "fcos", TOKEN_INSN, C_none, 0, I_FCOS },
    TOK t_fcos, TOKEN_INSN, C_none, 0, I_FCOS

    ; { "fdecstp", TOKEN_INSN, C_none, 0, I_FDECSTP },
    TOK t_fdecstp, TOKEN_INSN, C_none, 0, I_FDECSTP

    ; { "fdisi", TOKEN_INSN, C_none, 0, I_FDISI },
    TOK t_fdisi, TOKEN_INSN, C_none, 0, I_FDISI

    ; { "fdiv", TOKEN_INSN, C_none, 0, I_FDIV },
    TOK t_fdiv, TOKEN_INSN, C_none, 0, I_FDIV

    ; { "fdivp", TOKEN_INSN, C_none, 0, I_FDIVP },
    TOK t_fdivp, TOKEN_INSN, C_none, 0, I_FDIVP

    ; { "fdivr", TOKEN_INSN, C_none, 0, I_FDIVR },
    TOK t_fdivr, TOKEN_INSN, C_none, 0, I_FDIVR

    ; { "fdivrp", TOKEN_INSN, C_none, 0, I_FDIVRP },
    TOK t_fdivrp, TOKEN_INSN, C_none, 0, I_FDIVRP

    ; { "femms", TOKEN_INSN, C_none, 0, I_FEMMS },
    TOK t_femms, TOKEN_INSN, C_none, 0, I_FEMMS

    ; { "feni", TOKEN_INSN, C_none, 0, I_FENI },
    TOK t_feni, TOKEN_INSN, C_none, 0, I_FENI

    ; { "ffree", TOKEN_INSN, C_none, 0, I_FFREE },
    TOK t_ffree, TOKEN_INSN, C_none, 0, I_FFREE

    ; { "ffreep", TOKEN_INSN, C_none, 0, I_FFREEP },
    TOK t_ffreep, TOKEN_INSN, C_none, 0, I_FFREEP

    ; { "fiadd", TOKEN_INSN, C_none, 0, I_FIADD },
    TOK t_fiadd, TOKEN_INSN, C_none, 0, I_FIADD

    ; { "ficom", TOKEN_INSN, C_none, 0, I_FICOM },
    TOK t_ficom, TOKEN_INSN, C_none, 0, I_FICOM

    ; { "ficomp", TOKEN_INSN, C_none, 0, I_FICOMP },
    TOK t_ficomp, TOKEN_INSN, C_none, 0, I_FICOMP

    ; { "fidiv", TOKEN_INSN, C_none, 0, I_FIDIV },
    TOK t_fidiv, TOKEN_INSN, C_none, 0, I_FIDIV

    ; { "fidivr", TOKEN_INSN, C_none, 0, I_FIDIVR },
    TOK t_fidivr, TOKEN_INSN, C_none, 0, I_FIDIVR

    ; { "fild", TOKEN_INSN, C_none, 0, I_FILD },
    TOK t_fild, TOKEN_INSN, C_none, 0, I_FILD

    ; { "fimul", TOKEN_INSN, C_none, 0, I_FIMUL },
    TOK t_fimul, TOKEN_INSN, C_none, 0, I_FIMUL

    ; { "fincstp", TOKEN_INSN, C_none, 0, I_FINCSTP },
    TOK t_fincstp, TOKEN_INSN, C_none, 0, I_FINCSTP

    ; { "finit", TOKEN_INSN, C_none, 0, I_FINIT },
    TOK t_finit, TOKEN_INSN, C_none, 0, I_FINIT

    ; { "fist", TOKEN_INSN, C_none, 0, I_FIST },
    TOK t_fist, TOKEN_INSN, C_none, 0, I_FIST

    ; { "fistp", TOKEN_INSN, C_none, 0, I_FISTP },
    TOK t_fistp, TOKEN_INSN, C_none, 0, I_FISTP

    ; { "fisttp", TOKEN_INSN, C_none, 0, I_FISTTP },
    TOK t_fisttp, TOKEN_INSN, C_none, 0, I_FISTTP

    ; { "fisub", TOKEN_INSN, C_none, 0, I_FISUB },
    TOK t_fisub, TOKEN_INSN, C_none, 0, I_FISUB

    ; { "fisubr", TOKEN_INSN, C_none, 0, I_FISUBR },
    TOK t_fisubr, TOKEN_INSN, C_none, 0, I_FISUBR

    ; { "fld", TOKEN_INSN, C_none, 0, I_FLD },
    TOK t_fld, TOKEN_INSN, C_none, 0, I_FLD

    ; { "fld1", TOKEN_INSN, C_none, 0, I_FLD1 },
    TOK t_fld1, TOKEN_INSN, C_none, 0, I_FLD1

    ; { "fldcw", TOKEN_INSN, C_none, 0, I_FLDCW },
    TOK t_fldcw, TOKEN_INSN, C_none, 0, I_FLDCW

    ; { "fldenv", TOKEN_INSN, C_none, 0, I_FLDENV },
    TOK t_fldenv, TOKEN_INSN, C_none, 0, I_FLDENV

    ; { "fldl2e", TOKEN_INSN, C_none, 0, I_FLDL2E },
    TOK t_fldl2e, TOKEN_INSN, C_none, 0, I_FLDL2E

    ; { "fldl2t", TOKEN_INSN, C_none, 0, I_FLDL2T },
    TOK t_fldl2t, TOKEN_INSN, C_none, 0, I_FLDL2T

    ; { "fldlg2", TOKEN_INSN, C_none, 0, I_FLDLG2 },
    TOK t_fldlg2, TOKEN_INSN, C_none, 0, I_FLDLG2

    ; { "fldln2", TOKEN_INSN, C_none, 0, I_FLDLN2 },
    TOK t_fldln2, TOKEN_INSN, C_none, 0, I_FLDLN2

    ; { "fldpi", TOKEN_INSN, C_none, 0, I_FLDPI },
    TOK t_fldpi, TOKEN_INSN, C_none, 0, I_FLDPI

    ; { "fldz", TOKEN_INSN, C_none, 0, I_FLDZ },
    TOK t_fldz, TOKEN_INSN, C_none, 0, I_FLDZ

    ; { "fmul", TOKEN_INSN, C_none, 0, I_FMUL },
    TOK t_fmul, TOKEN_INSN, C_none, 0, I_FMUL

    ; { "fmulp", TOKEN_INSN, C_none, 0, I_FMULP },
    TOK t_fmulp, TOKEN_INSN, C_none, 0, I_FMULP

    ; { "fnclex", TOKEN_INSN, C_none, 0, I_FNCLEX },
    TOK t_fnclex, TOKEN_INSN, C_none, 0, I_FNCLEX

    ; { "fndisi", TOKEN_INSN, C_none, 0, I_FNDISI },
    TOK t_fndisi, TOKEN_INSN, C_none, 0, I_FNDISI

    ; { "fneni", TOKEN_INSN, C_none, 0, I_FNENI },
    TOK t_fneni, TOKEN_INSN, C_none, 0, I_FNENI

    ; { "fninit", TOKEN_INSN, C_none, 0, I_FNINIT },
    TOK t_fninit, TOKEN_INSN, C_none, 0, I_FNINIT

    ; { "fnop", TOKEN_INSN, C_none, 0, I_FNOP },
    TOK t_fnop, TOKEN_INSN, C_none, 0, I_FNOP

    ; { "fnsave", TOKEN_INSN, C_none, 0, I_FNSAVE },
    TOK t_fnsave, TOKEN_INSN, C_none, 0, I_FNSAVE

    ; { "fnstcw", TOKEN_INSN, C_none, 0, I_FNSTCW },
    TOK t_fnstcw, TOKEN_INSN, C_none, 0, I_FNSTCW

    ; { "fnstenv", TOKEN_INSN, C_none, 0, I_FNSTENV },
    TOK t_fnstenv, TOKEN_INSN, C_none, 0, I_FNSTENV

    ; { "fnstsw", TOKEN_INSN, C_none, 0, I_FNSTSW },
    TOK t_fnstsw, TOKEN_INSN, C_none, 0, I_FNSTSW

    ; { "fpatan", TOKEN_INSN, C_none, 0, I_FPATAN },
    TOK t_fpatan, TOKEN_INSN, C_none, 0, I_FPATAN

    ; { "fprem", TOKEN_INSN, C_none, 0, I_FPREM },
    TOK t_fprem, TOKEN_INSN, C_none, 0, I_FPREM

    ; { "fprem1", TOKEN_INSN, C_none, 0, I_FPREM1 },
    TOK t_fprem1, TOKEN_INSN, C_none, 0, I_FPREM1

    ; { "fptan", TOKEN_INSN, C_none, 0, I_FPTAN },
    TOK t_fptan, TOKEN_INSN, C_none, 0, I_FPTAN

    ; { "frndint", TOKEN_INSN, C_none, 0, I_FRNDINT },
    TOK t_frndint, TOKEN_INSN, C_none, 0, I_FRNDINT

    ; { "frstor", TOKEN_INSN, C_none, 0, I_FRSTOR },
    TOK t_frstor, TOKEN_INSN, C_none, 0, I_FRSTOR

    ; { "fsave", TOKEN_INSN, C_none, 0, I_FSAVE },
    TOK t_fsave, TOKEN_INSN, C_none, 0, I_FSAVE

    ; { "fscale", TOKEN_INSN, C_none, 0, I_FSCALE },
    TOK t_fscale, TOKEN_INSN, C_none, 0, I_FSCALE

    ; { "fsetpm", TOKEN_INSN, C_none, 0, I_FSETPM },
    TOK t_fsetpm, TOKEN_INSN, C_none, 0, I_FSETPM

    ; { "fsin", TOKEN_INSN, C_none, 0, I_FSIN },
    TOK t_fsin, TOKEN_INSN, C_none, 0, I_FSIN

    ; { "fsincos", TOKEN_INSN, C_none, 0, I_FSINCOS },
    TOK t_fsincos, TOKEN_INSN, C_none, 0, I_FSINCOS

    ; { "fsqrt", TOKEN_INSN, C_none, 0, I_FSQRT },
    TOK t_fsqrt, TOKEN_INSN, C_none, 0, I_FSQRT

    ; { "fst", TOKEN_INSN, C_none, 0, I_FST },
    TOK t_fst, TOKEN_INSN, C_none, 0, I_FST

    ; { "fstcw", TOKEN_INSN, C_none, 0, I_FSTCW },
    TOK t_fstcw, TOKEN_INSN, C_none, 0, I_FSTCW

    ; { "fstenv", TOKEN_INSN, C_none, 0, I_FSTENV },
    TOK t_fstenv, TOKEN_INSN, C_none, 0, I_FSTENV

    ; { "fstp", TOKEN_INSN, C_none, 0, I_FSTP },
    TOK t_fstp, TOKEN_INSN, C_none, 0, I_FSTP

    ; { "fstsw", TOKEN_INSN, C_none, 0, I_FSTSW },
    TOK t_fstsw, TOKEN_INSN, C_none, 0, I_FSTSW

    ; { "fsub", TOKEN_INSN, C_none, 0, I_FSUB },
    TOK t_fsub, TOKEN_INSN, C_none, 0, I_FSUB

    ; { "fsubp", TOKEN_INSN, C_none, 0, I_FSUBP },
    TOK t_fsubp, TOKEN_INSN, C_none, 0, I_FSUBP

    ; { "fsubr", TOKEN_INSN, C_none, 0, I_FSUBR },
    TOK t_fsubr, TOKEN_INSN, C_none, 0, I_FSUBR

    ; { "fsubrp", TOKEN_INSN, C_none, 0, I_FSUBRP },
    TOK t_fsubrp, TOKEN_INSN, C_none, 0, I_FSUBRP

    ; { "ftst", TOKEN_INSN, C_none, 0, I_FTST },
    TOK t_ftst, TOKEN_INSN, C_none, 0, I_FTST

    ; { "fucom", TOKEN_INSN, C_none, 0, I_FUCOM },
    TOK t_fucom, TOKEN_INSN, C_none, 0, I_FUCOM

    ; { "fucomi", TOKEN_INSN, C_none, 0, I_FUCOMI },
    TOK t_fucomi, TOKEN_INSN, C_none, 0, I_FUCOMI

    ; { "fucomip", TOKEN_INSN, C_none, 0, I_FUCOMIP },
    TOK t_fucomip, TOKEN_INSN, C_none, 0, I_FUCOMIP

    ; { "fucomp", TOKEN_INSN, C_none, 0, I_FUCOMP },
    TOK t_fucomp, TOKEN_INSN, C_none, 0, I_FUCOMP

    ; { "fucompp", TOKEN_INSN, C_none, 0, I_FUCOMPP },
    TOK t_fucompp, TOKEN_INSN, C_none, 0, I_FUCOMPP

    ; { "fxam", TOKEN_INSN, C_none, 0, I_FXAM },
    TOK t_fxam, TOKEN_INSN, C_none, 0, I_FXAM

    ; { "fxch", TOKEN_INSN, C_none, 0, I_FXCH },
    TOK t_fxch, TOKEN_INSN, C_none, 0, I_FXCH

    ; { "fxtract", TOKEN_INSN, C_none, 0, I_FXTRACT },
    TOK t_fxtract, TOKEN_INSN, C_none, 0, I_FXTRACT

    ; { "fyl2x", TOKEN_INSN, C_none, 0, I_FYL2X },
    TOK t_fyl2x, TOKEN_INSN, C_none, 0, I_FYL2X

    ; { "fyl2xp1", TOKEN_INSN, C_none, 0, I_FYL2XP1 },
    TOK t_fyl2xp1, TOKEN_INSN, C_none, 0, I_FYL2XP1

    ; { "hlt", TOKEN_INSN, C_none, 0, I_HLT },
    TOK t_hlt, TOKEN_INSN, C_none, 0, I_HLT

    ; { "ibts", TOKEN_INSN, C_none, 0, I_IBTS },
    TOK t_ibts, TOKEN_INSN, C_none, 0, I_IBTS

    ; { "icebp", TOKEN_INSN, C_none, 0, I_ICEBP },
    TOK t_icebp, TOKEN_INSN, C_none, 0, I_ICEBP

    ; { "idiv", TOKEN_INSN, C_none, 0, I_IDIV },
    TOK t_idiv, TOKEN_INSN, C_none, 0, I_IDIV

    ; { "imul", TOKEN_INSN, C_none, 0, I_IMUL },
    TOK t_imul, TOKEN_INSN, C_none, 0, I_IMUL

    ; { "in", TOKEN_INSN, C_none, 0, I_IN },
    TOK t_in, TOKEN_INSN, C_none, 0, I_IN

    ; { "inc", TOKEN_INSN, C_none, 0, I_INC },
    TOK t_inc, TOKEN_INSN, C_none, 0, I_INC

    ; { "insb", TOKEN_INSN, C_none, 0, I_INSB },
    TOK t_insb, TOKEN_INSN, C_none, 0, I_INSB

    ; { "insd", TOKEN_INSN, C_none, 0, I_INSD },
    TOK t_insd, TOKEN_INSN, C_none, 0, I_INSD

    ; { "insw", TOKEN_INSN, C_none, 0, I_INSW },
    TOK t_insw, TOKEN_INSN, C_none, 0, I_INSW

    ; { "int", TOKEN_INSN, C_none, 0, I_INT },
    TOK t_int, TOKEN_INSN, C_none, 0, I_INT

    ; { "int01", TOKEN_INSN, C_none, 0, I_INT01 },
    TOK t_int01, TOKEN_INSN, C_none, 0, I_INT01

    ; { "int1", TOKEN_INSN, C_none, 0, I_INT1 },
    TOK t_int1, TOKEN_INSN, C_none, 0, I_INT1

    ; { "int03", TOKEN_INSN, C_none, 0, I_INT03 },
    TOK t_int03, TOKEN_INSN, C_none, 0, I_INT03

    ; { "int3", TOKEN_INSN, C_none, 0, I_INT3 },
    TOK t_int3, TOKEN_INSN, C_none, 0, I_INT3

    ; { "into", TOKEN_INSN, C_none, 0, I_INTO },
    TOK t_into, TOKEN_INSN, C_none, 0, I_INTO

    ; { "invd", TOKEN_INSN, C_none, 0, I_INVD },
    TOK t_invd, TOKEN_INSN, C_none, 0, I_INVD

    ; { "invpcid", TOKEN_INSN, C_none, 0, I_INVPCID },
    TOK t_invpcid, TOKEN_INSN, C_none, 0, I_INVPCID

    ; { "invlpg", TOKEN_INSN, C_none, 0, I_INVLPG },
    TOK t_invlpg, TOKEN_INSN, C_none, 0, I_INVLPG

    ; { "invlpga", TOKEN_INSN, C_none, 0, I_INVLPGA },
    TOK t_invlpga, TOKEN_INSN, C_none, 0, I_INVLPGA

    ; { "iret", TOKEN_INSN, C_none, 0, I_IRET },
    TOK t_iret, TOKEN_INSN, C_none, 0, I_IRET

    ; { "iretd", TOKEN_INSN, C_none, 0, I_IRETD },
    TOK t_iretd, TOKEN_INSN, C_none, 0, I_IRETD

    ; { "iretq", TOKEN_INSN, C_none, 0, I_IRETQ },
    TOK t_iretq, TOKEN_INSN, C_none, 0, I_IRETQ

    ; { "iretw", TOKEN_INSN, C_none, 0, I_IRETW },
    TOK t_iretw, TOKEN_INSN, C_none, 0, I_IRETW

    ; { "jcxz", TOKEN_INSN, C_none, 0, I_JCXZ },
    TOK t_jcxz, TOKEN_INSN, C_none, 0, I_JCXZ

    ; { "jecxz", TOKEN_INSN, C_none, 0, I_JECXZ },
    TOK t_jecxz, TOKEN_INSN, C_none, 0, I_JECXZ

    ; { "jrcxz", TOKEN_INSN, C_none, 0, I_JRCXZ },
    TOK t_jrcxz, TOKEN_INSN, C_none, 0, I_JRCXZ

    ; { "jmp", TOKEN_INSN, C_none, 0, I_JMP },
    TOK t_jmp, TOKEN_INSN, C_none, 0, I_JMP

    ; { "jmpe", TOKEN_INSN, C_none, 0, I_JMPE },
    TOK t_jmpe, TOKEN_INSN, C_none, 0, I_JMPE

    ; { "lahf", TOKEN_INSN, C_none, 0, I_LAHF },
    TOK t_lahf, TOKEN_INSN, C_none, 0, I_LAHF

    ; { "lar", TOKEN_INSN, C_none, 0, I_LAR },
    TOK t_lar, TOKEN_INSN, C_none, 0, I_LAR

    ; { "lds", TOKEN_INSN, C_none, 0, I_LDS },
    TOK t_lds, TOKEN_INSN, C_none, 0, I_LDS

    ; { "lea", TOKEN_INSN, C_none, 0, I_LEA },
    TOK t_lea, TOKEN_INSN, C_none, 0, I_LEA

    ; { "leave", TOKEN_INSN, C_none, 0, I_LEAVE },
    TOK t_leave, TOKEN_INSN, C_none, 0, I_LEAVE

    ; { "les", TOKEN_INSN, C_none, 0, I_LES },
    TOK t_les, TOKEN_INSN, C_none, 0, I_LES

    ; { "lfence", TOKEN_INSN, C_none, 0, I_LFENCE },
    TOK t_lfence, TOKEN_INSN, C_none, 0, I_LFENCE

    ; { "lfs", TOKEN_INSN, C_none, 0, I_LFS },
    TOK t_lfs, TOKEN_INSN, C_none, 0, I_LFS

    ; { "lgdt", TOKEN_INSN, C_none, 0, I_LGDT },
    TOK t_lgdt, TOKEN_INSN, C_none, 0, I_LGDT

    ; { "lgs", TOKEN_INSN, C_none, 0, I_LGS },
    TOK t_lgs, TOKEN_INSN, C_none, 0, I_LGS

    ; { "lidt", TOKEN_INSN, C_none, 0, I_LIDT },
    TOK t_lidt, TOKEN_INSN, C_none, 0, I_LIDT

    ; { "lldt", TOKEN_INSN, C_none, 0, I_LLDT },
    TOK t_lldt, TOKEN_INSN, C_none, 0, I_LLDT

    ; { "lmsw", TOKEN_INSN, C_none, 0, I_LMSW },
    TOK t_lmsw, TOKEN_INSN, C_none, 0, I_LMSW

    ; { "loadall", TOKEN_INSN, C_none, 0, I_LOADALL },
    TOK t_loadall, TOKEN_INSN, C_none, 0, I_LOADALL

    ; { "loadall286", TOKEN_INSN, C_none, 0, I_LOADALL286 },
    TOK t_loadall286, TOKEN_INSN, C_none, 0, I_LOADALL286

    ; { "lodsb", TOKEN_INSN, C_none, 0, I_LODSB },
    TOK t_lodsb, TOKEN_INSN, C_none, 0, I_LODSB

    ; { "lodsd", TOKEN_INSN, C_none, 0, I_LODSD },
    TOK t_lodsd, TOKEN_INSN, C_none, 0, I_LODSD

    ; { "lodsq", TOKEN_INSN, C_none, 0, I_LODSQ },
    TOK t_lodsq, TOKEN_INSN, C_none, 0, I_LODSQ

    ; { "lodsw", TOKEN_INSN, C_none, 0, I_LODSW },
    TOK t_lodsw, TOKEN_INSN, C_none, 0, I_LODSW

    ; { "loop", TOKEN_INSN, C_none, 0, I_LOOP },
    TOK t_loop, TOKEN_INSN, C_none, 0, I_LOOP

    ; { "loope", TOKEN_INSN, C_none, 0, I_LOOPE },
    TOK t_loope, TOKEN_INSN, C_none, 0, I_LOOPE

    ; { "loopne", TOKEN_INSN, C_none, 0, I_LOOPNE },
    TOK t_loopne, TOKEN_INSN, C_none, 0, I_LOOPNE

    ; { "loopnz", TOKEN_INSN, C_none, 0, I_LOOPNZ },
    TOK t_loopnz, TOKEN_INSN, C_none, 0, I_LOOPNZ

    ; { "loopz", TOKEN_INSN, C_none, 0, I_LOOPZ },
    TOK t_loopz, TOKEN_INSN, C_none, 0, I_LOOPZ

    ; { "lsl", TOKEN_INSN, C_none, 0, I_LSL },
    TOK t_lsl, TOKEN_INSN, C_none, 0, I_LSL

    ; { "lss", TOKEN_INSN, C_none, 0, I_LSS },
    TOK t_lss, TOKEN_INSN, C_none, 0, I_LSS

    ; { "ltr", TOKEN_INSN, C_none, 0, I_LTR },
    TOK t_ltr, TOKEN_INSN, C_none, 0, I_LTR

    ; { "mfence", TOKEN_INSN, C_none, 0, I_MFENCE },
    TOK t_mfence, TOKEN_INSN, C_none, 0, I_MFENCE

    ; { "monitor", TOKEN_INSN, C_none, 0, I_MONITOR },
    TOK t_monitor, TOKEN_INSN, C_none, 0, I_MONITOR

    ; { "monitorx", TOKEN_INSN, C_none, 0, I_MONITORX },
    TOK t_monitorx, TOKEN_INSN, C_none, 0, I_MONITORX

    ; { "mov", TOKEN_INSN, C_none, 0, I_MOV },
    TOK t_mov, TOKEN_INSN, C_none, 0, I_MOV

    ; { "movd", TOKEN_INSN, C_none, 0, I_MOVD },
    TOK t_movd, TOKEN_INSN, C_none, 0, I_MOVD

    ; { "movq", TOKEN_INSN, C_none, 0, I_MOVQ },
    TOK t_movq, TOKEN_INSN, C_none, 0, I_MOVQ

    ; { "movsb", TOKEN_INSN, C_none, 0, I_MOVSB },
    TOK t_movsb, TOKEN_INSN, C_none, 0, I_MOVSB

    ; { "movsd", TOKEN_INSN, C_none, 0, I_MOVSD },
    TOK t_movsd, TOKEN_INSN, C_none, 0, I_MOVSD

    ; { "movsq", TOKEN_INSN, C_none, 0, I_MOVSQ },
    TOK t_movsq, TOKEN_INSN, C_none, 0, I_MOVSQ

    ; { "movsw", TOKEN_INSN, C_none, 0, I_MOVSW },
    TOK t_movsw, TOKEN_INSN, C_none, 0, I_MOVSW

    ; { "movsx", TOKEN_INSN, C_none, 0, I_MOVSX },
    TOK t_movsx, TOKEN_INSN, C_none, 0, I_MOVSX

    ; { "movsxd", TOKEN_INSN, C_none, 0, I_MOVSXD },
    TOK t_movsxd, TOKEN_INSN, C_none, 0, I_MOVSXD

    ; { "movzx", TOKEN_INSN, C_none, 0, I_MOVZX },
    TOK t_movzx, TOKEN_INSN, C_none, 0, I_MOVZX

    ; { "mul", TOKEN_INSN, C_none, 0, I_MUL },
    TOK t_mul, TOKEN_INSN, C_none, 0, I_MUL

    ; { "mwait", TOKEN_INSN, C_none, 0, I_MWAIT },
    TOK t_mwait, TOKEN_INSN, C_none, 0, I_MWAIT

    ; { "mwaitx", TOKEN_INSN, C_none, 0, I_MWAITX },
    TOK t_mwaitx, TOKEN_INSN, C_none, 0, I_MWAITX

    ; { "neg", TOKEN_INSN, C_none, 0, I_NEG },
    TOK t_neg, TOKEN_INSN, C_none, 0, I_NEG

    ; { "nop", TOKEN_INSN, C_none, 0, I_NOP },
    TOK t_nop, TOKEN_INSN, C_none, 0, I_NOP

    ; { "not", TOKEN_INSN, C_none, 0, I_NOT },
    TOK t_not, TOKEN_INSN, C_none, 0, I_NOT

    ; { "or", TOKEN_INSN, C_none, 0, I_OR },
    TOK t_or, TOKEN_INSN, C_none, 0, I_OR

    ; { "out", TOKEN_INSN, C_none, 0, I_OUT },
    TOK t_out, TOKEN_INSN, C_none, 0, I_OUT

    ; { "outsb", TOKEN_INSN, C_none, 0, I_OUTSB },
    TOK t_outsb, TOKEN_INSN, C_none, 0, I_OUTSB

    ; { "outsd", TOKEN_INSN, C_none, 0, I_OUTSD },
    TOK t_outsd, TOKEN_INSN, C_none, 0, I_OUTSD

    ; { "outsw", TOKEN_INSN, C_none, 0, I_OUTSW },
    TOK t_outsw, TOKEN_INSN, C_none, 0, I_OUTSW

    ; { "packssdw", TOKEN_INSN, C_none, 0, I_PACKSSDW },
    TOK t_packssdw, TOKEN_INSN, C_none, 0, I_PACKSSDW

    ; { "packsswb", TOKEN_INSN, C_none, 0, I_PACKSSWB },
    TOK t_packsswb, TOKEN_INSN, C_none, 0, I_PACKSSWB

    ; { "packuswb", TOKEN_INSN, C_none, 0, I_PACKUSWB },
    TOK t_packuswb, TOKEN_INSN, C_none, 0, I_PACKUSWB

    ; { "paddb", TOKEN_INSN, C_none, 0, I_PADDB },
    TOK t_paddb, TOKEN_INSN, C_none, 0, I_PADDB

    ; { "paddd", TOKEN_INSN, C_none, 0, I_PADDD },
    TOK t_paddd, TOKEN_INSN, C_none, 0, I_PADDD

    ; { "paddsb", TOKEN_INSN, C_none, 0, I_PADDSB },
    TOK t_paddsb, TOKEN_INSN, C_none, 0, I_PADDSB

    ; { "paddsiw", TOKEN_INSN, C_none, 0, I_PADDSIW },
    TOK t_paddsiw, TOKEN_INSN, C_none, 0, I_PADDSIW

    ; { "paddsw", TOKEN_INSN, C_none, 0, I_PADDSW },
    TOK t_paddsw, TOKEN_INSN, C_none, 0, I_PADDSW

    ; { "paddusb", TOKEN_INSN, C_none, 0, I_PADDUSB },
    TOK t_paddusb, TOKEN_INSN, C_none, 0, I_PADDUSB

    ; { "paddusw", TOKEN_INSN, C_none, 0, I_PADDUSW },
    TOK t_paddusw, TOKEN_INSN, C_none, 0, I_PADDUSW

    ; { "paddw", TOKEN_INSN, C_none, 0, I_PADDW },
    TOK t_paddw, TOKEN_INSN, C_none, 0, I_PADDW

    ; { "pand", TOKEN_INSN, C_none, 0, I_PAND },
    TOK t_pand, TOKEN_INSN, C_none, 0, I_PAND

    ; { "pandn", TOKEN_INSN, C_none, 0, I_PANDN },
    TOK t_pandn, TOKEN_INSN, C_none, 0, I_PANDN

    ; { "pause", TOKEN_INSN, C_none, 0, I_PAUSE },
    TOK t_pause, TOKEN_INSN, C_none, 0, I_PAUSE

    ; { "paveb", TOKEN_INSN, C_none, 0, I_PAVEB },
    TOK t_paveb, TOKEN_INSN, C_none, 0, I_PAVEB

    ; { "pavgusb", TOKEN_INSN, C_none, 0, I_PAVGUSB },
    TOK t_pavgusb, TOKEN_INSN, C_none, 0, I_PAVGUSB

    ; { "pcmpeqb", TOKEN_INSN, C_none, 0, I_PCMPEQB },
    TOK t_pcmpeqb, TOKEN_INSN, C_none, 0, I_PCMPEQB

    ; { "pcmpeqd", TOKEN_INSN, C_none, 0, I_PCMPEQD },
    TOK t_pcmpeqd, TOKEN_INSN, C_none, 0, I_PCMPEQD

    ; { "pcmpeqw", TOKEN_INSN, C_none, 0, I_PCMPEQW },
    TOK t_pcmpeqw, TOKEN_INSN, C_none, 0, I_PCMPEQW

    ; { "pcmpgtb", TOKEN_INSN, C_none, 0, I_PCMPGTB },
    TOK t_pcmpgtb, TOKEN_INSN, C_none, 0, I_PCMPGTB

    ; { "pcmpgtd", TOKEN_INSN, C_none, 0, I_PCMPGTD },
    TOK t_pcmpgtd, TOKEN_INSN, C_none, 0, I_PCMPGTD

    ; { "pcmpgtw", TOKEN_INSN, C_none, 0, I_PCMPGTW },
    TOK t_pcmpgtw, TOKEN_INSN, C_none, 0, I_PCMPGTW

    ; { "pdistib", TOKEN_INSN, C_none, 0, I_PDISTIB },
    TOK t_pdistib, TOKEN_INSN, C_none, 0, I_PDISTIB

    ; { "pf2id", TOKEN_INSN, C_none, 0, I_PF2ID },
    TOK t_pf2id, TOKEN_INSN, C_none, 0, I_PF2ID

    ; { "pfacc", TOKEN_INSN, C_none, 0, I_PFACC },
    TOK t_pfacc, TOKEN_INSN, C_none, 0, I_PFACC

    ; { "pfadd", TOKEN_INSN, C_none, 0, I_PFADD },
    TOK t_pfadd, TOKEN_INSN, C_none, 0, I_PFADD

    ; { "pfcmpeq", TOKEN_INSN, C_none, 0, I_PFCMPEQ },
    TOK t_pfcmpeq, TOKEN_INSN, C_none, 0, I_PFCMPEQ

    ; { "pfcmpge", TOKEN_INSN, C_none, 0, I_PFCMPGE },
    TOK t_pfcmpge, TOKEN_INSN, C_none, 0, I_PFCMPGE

    ; { "pfcmpgt", TOKEN_INSN, C_none, 0, I_PFCMPGT },
    TOK t_pfcmpgt, TOKEN_INSN, C_none, 0, I_PFCMPGT

    ; { "pfmax", TOKEN_INSN, C_none, 0, I_PFMAX },
    TOK t_pfmax, TOKEN_INSN, C_none, 0, I_PFMAX

    ; { "pfmin", TOKEN_INSN, C_none, 0, I_PFMIN },
    TOK t_pfmin, TOKEN_INSN, C_none, 0, I_PFMIN

    ; { "pfmul", TOKEN_INSN, C_none, 0, I_PFMUL },
    TOK t_pfmul, TOKEN_INSN, C_none, 0, I_PFMUL

    ; { "pfrcp", TOKEN_INSN, C_none, 0, I_PFRCP },
    TOK t_pfrcp, TOKEN_INSN, C_none, 0, I_PFRCP

    ; { "pfrcpit1", TOKEN_INSN, C_none, 0, I_PFRCPIT1 },
    TOK t_pfrcpit1, TOKEN_INSN, C_none, 0, I_PFRCPIT1

    ; { "pfrcpit2", TOKEN_INSN, C_none, 0, I_PFRCPIT2 },
    TOK t_pfrcpit2, TOKEN_INSN, C_none, 0, I_PFRCPIT2

    ; { "pfrsqit1", TOKEN_INSN, C_none, 0, I_PFRSQIT1 },
    TOK t_pfrsqit1, TOKEN_INSN, C_none, 0, I_PFRSQIT1

    ; { "pfrsqrt", TOKEN_INSN, C_none, 0, I_PFRSQRT },
    TOK t_pfrsqrt, TOKEN_INSN, C_none, 0, I_PFRSQRT

    ; { "pfsub", TOKEN_INSN, C_none, 0, I_PFSUB },
    TOK t_pfsub, TOKEN_INSN, C_none, 0, I_PFSUB

    ; { "pfsubr", TOKEN_INSN, C_none, 0, I_PFSUBR },
    TOK t_pfsubr, TOKEN_INSN, C_none, 0, I_PFSUBR

    ; { "pi2fd", TOKEN_INSN, C_none, 0, I_PI2FD },
    TOK t_pi2fd, TOKEN_INSN, C_none, 0, I_PI2FD

    ; { "pmachriw", TOKEN_INSN, C_none, 0, I_PMACHRIW },
    TOK t_pmachriw, TOKEN_INSN, C_none, 0, I_PMACHRIW

    ; { "pmaddwd", TOKEN_INSN, C_none, 0, I_PMADDWD },
    TOK t_pmaddwd, TOKEN_INSN, C_none, 0, I_PMADDWD

    ; { "pmagw", TOKEN_INSN, C_none, 0, I_PMAGW },
    TOK t_pmagw, TOKEN_INSN, C_none, 0, I_PMAGW

    ; { "pmulhriw", TOKEN_INSN, C_none, 0, I_PMULHRIW },
    TOK t_pmulhriw, TOKEN_INSN, C_none, 0, I_PMULHRIW

    ; { "pmulhrwa", TOKEN_INSN, C_none, 0, I_PMULHRWA },
    TOK t_pmulhrwa, TOKEN_INSN, C_none, 0, I_PMULHRWA

    ; { "pmulhrwc", TOKEN_INSN, C_none, 0, I_PMULHRWC },
    TOK t_pmulhrwc, TOKEN_INSN, C_none, 0, I_PMULHRWC

    ; { "pmulhw", TOKEN_INSN, C_none, 0, I_PMULHW },
    TOK t_pmulhw, TOKEN_INSN, C_none, 0, I_PMULHW

    ; { "pmullw", TOKEN_INSN, C_none, 0, I_PMULLW },
    TOK t_pmullw, TOKEN_INSN, C_none, 0, I_PMULLW

    ; { "pmvgezb", TOKEN_INSN, C_none, 0, I_PMVGEZB },
    TOK t_pmvgezb, TOKEN_INSN, C_none, 0, I_PMVGEZB

    ; { "pmvlzb", TOKEN_INSN, C_none, 0, I_PMVLZB },
    TOK t_pmvlzb, TOKEN_INSN, C_none, 0, I_PMVLZB

    ; { "pmvnzb", TOKEN_INSN, C_none, 0, I_PMVNZB },
    TOK t_pmvnzb, TOKEN_INSN, C_none, 0, I_PMVNZB

    ; { "pmvzb", TOKEN_INSN, C_none, 0, I_PMVZB },
    TOK t_pmvzb, TOKEN_INSN, C_none, 0, I_PMVZB

    ; { "pop", TOKEN_INSN, C_none, 0, I_POP },
    TOK t_pop, TOKEN_INSN, C_none, 0, I_POP

    ; { "popa", TOKEN_INSN, C_none, 0, I_POPA },
    TOK t_popa, TOKEN_INSN, C_none, 0, I_POPA

    ; { "popad", TOKEN_INSN, C_none, 0, I_POPAD },
    TOK t_popad, TOKEN_INSN, C_none, 0, I_POPAD

    ; { "popaw", TOKEN_INSN, C_none, 0, I_POPAW },
    TOK t_popaw, TOKEN_INSN, C_none, 0, I_POPAW

    ; { "popf", TOKEN_INSN, C_none, 0, I_POPF },
    TOK t_popf, TOKEN_INSN, C_none, 0, I_POPF

    ; { "popfd", TOKEN_INSN, C_none, 0, I_POPFD },
    TOK t_popfd, TOKEN_INSN, C_none, 0, I_POPFD

    ; { "popfq", TOKEN_INSN, C_none, 0, I_POPFQ },
    TOK t_popfq, TOKEN_INSN, C_none, 0, I_POPFQ

    ; { "popfw", TOKEN_INSN, C_none, 0, I_POPFW },
    TOK t_popfw, TOKEN_INSN, C_none, 0, I_POPFW

    ; { "por", TOKEN_INSN, C_none, 0, I_POR },
    TOK t_por, TOKEN_INSN, C_none, 0, I_POR

    ; { "prefetch", TOKEN_INSN, C_none, 0, I_PREFETCH },
    TOK t_prefetch, TOKEN_INSN, C_none, 0, I_PREFETCH

    ; { "prefetchw", TOKEN_INSN, C_none, 0, I_PREFETCHW },
    TOK t_prefetchw, TOKEN_INSN, C_none, 0, I_PREFETCHW

    ; { "pslld", TOKEN_INSN, C_none, 0, I_PSLLD },
    TOK t_pslld, TOKEN_INSN, C_none, 0, I_PSLLD

    ; { "psllq", TOKEN_INSN, C_none, 0, I_PSLLQ },
    TOK t_psllq, TOKEN_INSN, C_none, 0, I_PSLLQ

    ; { "psllw", TOKEN_INSN, C_none, 0, I_PSLLW },
    TOK t_psllw, TOKEN_INSN, C_none, 0, I_PSLLW

    ; { "psrad", TOKEN_INSN, C_none, 0, I_PSRAD },
    TOK t_psrad, TOKEN_INSN, C_none, 0, I_PSRAD

    ; { "psraw", TOKEN_INSN, C_none, 0, I_PSRAW },
    TOK t_psraw, TOKEN_INSN, C_none, 0, I_PSRAW

    ; { "psrld", TOKEN_INSN, C_none, 0, I_PSRLD },
    TOK t_psrld, TOKEN_INSN, C_none, 0, I_PSRLD

    ; { "psrlq", TOKEN_INSN, C_none, 0, I_PSRLQ },
    TOK t_psrlq, TOKEN_INSN, C_none, 0, I_PSRLQ

    ; { "psrlw", TOKEN_INSN, C_none, 0, I_PSRLW },
    TOK t_psrlw, TOKEN_INSN, C_none, 0, I_PSRLW

    ; { "psubb", TOKEN_INSN, C_none, 0, I_PSUBB },
    TOK t_psubb, TOKEN_INSN, C_none, 0, I_PSUBB

    ; { "psubd", TOKEN_INSN, C_none, 0, I_PSUBD },
    TOK t_psubd, TOKEN_INSN, C_none, 0, I_PSUBD

    ; { "psubsb", TOKEN_INSN, C_none, 0, I_PSUBSB },
    TOK t_psubsb, TOKEN_INSN, C_none, 0, I_PSUBSB

    ; { "psubsiw", TOKEN_INSN, C_none, 0, I_PSUBSIW },
    TOK t_psubsiw, TOKEN_INSN, C_none, 0, I_PSUBSIW

    ; { "psubsw", TOKEN_INSN, C_none, 0, I_PSUBSW },
    TOK t_psubsw, TOKEN_INSN, C_none, 0, I_PSUBSW

    ; { "psubusb", TOKEN_INSN, C_none, 0, I_PSUBUSB },
    TOK t_psubusb, TOKEN_INSN, C_none, 0, I_PSUBUSB

    ; { "psubusw", TOKEN_INSN, C_none, 0, I_PSUBUSW },
    TOK t_psubusw, TOKEN_INSN, C_none, 0, I_PSUBUSW

    ; { "psubw", TOKEN_INSN, C_none, 0, I_PSUBW },
    TOK t_psubw, TOKEN_INSN, C_none, 0, I_PSUBW

    ; { "punpckhbw", TOKEN_INSN, C_none, 0, I_PUNPCKHBW },
    TOK t_punpckhbw, TOKEN_INSN, C_none, 0, I_PUNPCKHBW

    ; { "punpckhdq", TOKEN_INSN, C_none, 0, I_PUNPCKHDQ },
    TOK t_punpckhdq, TOKEN_INSN, C_none, 0, I_PUNPCKHDQ

    ; { "punpckhwd", TOKEN_INSN, C_none, 0, I_PUNPCKHWD },
    TOK t_punpckhwd, TOKEN_INSN, C_none, 0, I_PUNPCKHWD

    ; { "punpcklbw", TOKEN_INSN, C_none, 0, I_PUNPCKLBW },
    TOK t_punpcklbw, TOKEN_INSN, C_none, 0, I_PUNPCKLBW

    ; { "punpckldq", TOKEN_INSN, C_none, 0, I_PUNPCKLDQ },
    TOK t_punpckldq, TOKEN_INSN, C_none, 0, I_PUNPCKLDQ

    ; { "punpcklwd", TOKEN_INSN, C_none, 0, I_PUNPCKLWD },
    TOK t_punpcklwd, TOKEN_INSN, C_none, 0, I_PUNPCKLWD

    ; { "push", TOKEN_INSN, C_none, 0, I_PUSH },
    TOK t_push, TOKEN_INSN, C_none, 0, I_PUSH

    ; { "pusha", TOKEN_INSN, C_none, 0, I_PUSHA },
    TOK t_pusha, TOKEN_INSN, C_none, 0, I_PUSHA

    ; { "pushad", TOKEN_INSN, C_none, 0, I_PUSHAD },
    TOK t_pushad, TOKEN_INSN, C_none, 0, I_PUSHAD

    ; { "pushaw", TOKEN_INSN, C_none, 0, I_PUSHAW },
    TOK t_pushaw, TOKEN_INSN, C_none, 0, I_PUSHAW

    ; { "pushf", TOKEN_INSN, C_none, 0, I_PUSHF },
    TOK t_pushf, TOKEN_INSN, C_none, 0, I_PUSHF

    ; { "pushfd", TOKEN_INSN, C_none, 0, I_PUSHFD },
    TOK t_pushfd, TOKEN_INSN, C_none, 0, I_PUSHFD

    ; { "pushfq", TOKEN_INSN, C_none, 0, I_PUSHFQ },
    TOK t_pushfq, TOKEN_INSN, C_none, 0, I_PUSHFQ

    ; { "pushfw", TOKEN_INSN, C_none, 0, I_PUSHFW },
    TOK t_pushfw, TOKEN_INSN, C_none, 0, I_PUSHFW

    ; { "pxor", TOKEN_INSN, C_none, 0, I_PXOR },
    TOK t_pxor, TOKEN_INSN, C_none, 0, I_PXOR

    ; { "rcl", TOKEN_INSN, C_none, 0, I_RCL },
    TOK t_rcl, TOKEN_INSN, C_none, 0, I_RCL

    ; { "rcr", TOKEN_INSN, C_none, 0, I_RCR },
    TOK t_rcr, TOKEN_INSN, C_none, 0, I_RCR

    ; { "rdshr", TOKEN_INSN, C_none, 0, I_RDSHR },
    TOK t_rdshr, TOKEN_INSN, C_none, 0, I_RDSHR

    ; { "rdmsr", TOKEN_INSN, C_none, 0, I_RDMSR },
    TOK t_rdmsr, TOKEN_INSN, C_none, 0, I_RDMSR

    ; { "rdpmc", TOKEN_INSN, C_none, 0, I_RDPMC },
    TOK t_rdpmc, TOKEN_INSN, C_none, 0, I_RDPMC

    ; { "rdtsc", TOKEN_INSN, C_none, 0, I_RDTSC },
    TOK t_rdtsc, TOKEN_INSN, C_none, 0, I_RDTSC

    ; { "rdtscp", TOKEN_INSN, C_none, 0, I_RDTSCP },
    TOK t_rdtscp, TOKEN_INSN, C_none, 0, I_RDTSCP

    ; { "ret", TOKEN_INSN, C_none, 0, I_RET },
    TOK t_ret, TOKEN_INSN, C_none, 0, I_RET

    ; { "retf", TOKEN_INSN, C_none, 0, I_RETF },
    TOK t_retf, TOKEN_INSN, C_none, 0, I_RETF

    ; { "retn", TOKEN_INSN, C_none, 0, I_RETN },
    TOK t_retn, TOKEN_INSN, C_none, 0, I_RETN

    ; { "retw", TOKEN_INSN, C_none, 0, I_RETW },
    TOK t_retw, TOKEN_INSN, C_none, 0, I_RETW

    ; { "retfw", TOKEN_INSN, C_none, 0, I_RETFW },
    TOK t_retfw, TOKEN_INSN, C_none, 0, I_RETFW

    ; { "retnw", TOKEN_INSN, C_none, 0, I_RETNW },
    TOK t_retnw, TOKEN_INSN, C_none, 0, I_RETNW

    ; { "retd", TOKEN_INSN, C_none, 0, I_RETD },
    TOK t_retd, TOKEN_INSN, C_none, 0, I_RETD

    ; { "retfd", TOKEN_INSN, C_none, 0, I_RETFD },
    TOK t_retfd, TOKEN_INSN, C_none, 0, I_RETFD

    ; { "retnd", TOKEN_INSN, C_none, 0, I_RETND },
    TOK t_retnd, TOKEN_INSN, C_none, 0, I_RETND

    ; { "retq", TOKEN_INSN, C_none, 0, I_RETQ },
    TOK t_retq, TOKEN_INSN, C_none, 0, I_RETQ

    ; { "retfq", TOKEN_INSN, C_none, 0, I_RETFQ },
    TOK t_retfq, TOKEN_INSN, C_none, 0, I_RETFQ

    ; { "retnq", TOKEN_INSN, C_none, 0, I_RETNQ },
    TOK t_retnq, TOKEN_INSN, C_none, 0, I_RETNQ

    ; { "rol", TOKEN_INSN, C_none, 0, I_ROL },
    TOK t_rol, TOKEN_INSN, C_none, 0, I_ROL

    ; { "ror", TOKEN_INSN, C_none, 0, I_ROR },
    TOK t_ror, TOKEN_INSN, C_none, 0, I_ROR

    ; { "rdm", TOKEN_INSN, C_none, 0, I_RDM },
    TOK t_rdm, TOKEN_INSN, C_none, 0, I_RDM

    ; { "rsdc", TOKEN_INSN, C_none, 0, I_RSDC },
    TOK t_rsdc, TOKEN_INSN, C_none, 0, I_RSDC

    ; { "rsldt", TOKEN_INSN, C_none, 0, I_RSLDT },
    TOK t_rsldt, TOKEN_INSN, C_none, 0, I_RSLDT

    ; { "rsm", TOKEN_INSN, C_none, 0, I_RSM },
    TOK t_rsm, TOKEN_INSN, C_none, 0, I_RSM

    ; { "rsts", TOKEN_INSN, C_none, 0, I_RSTS },
    TOK t_rsts, TOKEN_INSN, C_none, 0, I_RSTS

    ; { "sahf", TOKEN_INSN, C_none, 0, I_SAHF },
    TOK t_sahf, TOKEN_INSN, C_none, 0, I_SAHF

    ; { "sal", TOKEN_INSN, C_none, 0, I_SAL },
    TOK t_sal, TOKEN_INSN, C_none, 0, I_SAL

    ; { "salc", TOKEN_INSN, C_none, 0, I_SALC },
    TOK t_salc, TOKEN_INSN, C_none, 0, I_SALC

    ; { "sar", TOKEN_INSN, C_none, 0, I_SAR },
    TOK t_sar, TOKEN_INSN, C_none, 0, I_SAR

    ; { "sbb", TOKEN_INSN, C_none, 0, I_SBB },
    TOK t_sbb, TOKEN_INSN, C_none, 0, I_SBB

    ; { "scasb", TOKEN_INSN, C_none, 0, I_SCASB },
    TOK t_scasb, TOKEN_INSN, C_none, 0, I_SCASB

    ; { "scasd", TOKEN_INSN, C_none, 0, I_SCASD },
    TOK t_scasd, TOKEN_INSN, C_none, 0, I_SCASD

    ; { "scasq", TOKEN_INSN, C_none, 0, I_SCASQ },
    TOK t_scasq, TOKEN_INSN, C_none, 0, I_SCASQ

    ; { "scasw", TOKEN_INSN, C_none, 0, I_SCASW },
    TOK t_scasw, TOKEN_INSN, C_none, 0, I_SCASW

    ; { "sfence", TOKEN_INSN, C_none, 0, I_SFENCE },
    TOK t_sfence, TOKEN_INSN, C_none, 0, I_SFENCE

    ; { "sgdt", TOKEN_INSN, C_none, 0, I_SGDT },
    TOK t_sgdt, TOKEN_INSN, C_none, 0, I_SGDT

    ; { "shl", TOKEN_INSN, C_none, 0, I_SHL },
    TOK t_shl, TOKEN_INSN, C_none, 0, I_SHL

    ; { "shld", TOKEN_INSN, C_none, 0, I_SHLD },
    TOK t_shld, TOKEN_INSN, C_none, 0, I_SHLD

    ; { "shr", TOKEN_INSN, C_none, 0, I_SHR },
    TOK t_shr, TOKEN_INSN, C_none, 0, I_SHR

    ; { "shrd", TOKEN_INSN, C_none, 0, I_SHRD },
    TOK t_shrd, TOKEN_INSN, C_none, 0, I_SHRD

    ; { "sidt", TOKEN_INSN, C_none, 0, I_SIDT },
    TOK t_sidt, TOKEN_INSN, C_none, 0, I_SIDT

    ; { "sldt", TOKEN_INSN, C_none, 0, I_SLDT },
    TOK t_sldt, TOKEN_INSN, C_none, 0, I_SLDT

    ; { "skinit", TOKEN_INSN, C_none, 0, I_SKINIT },
    TOK t_skinit, TOKEN_INSN, C_none, 0, I_SKINIT

    ; { "smi", TOKEN_INSN, C_none, 0, I_SMI },
    TOK t_smi, TOKEN_INSN, C_none, 0, I_SMI

    ; { "smint", TOKEN_INSN, C_none, 0, I_SMINT },
    TOK t_smint, TOKEN_INSN, C_none, 0, I_SMINT

    ; { "smintold", TOKEN_INSN, C_none, 0, I_SMINTOLD },
    TOK t_smintold, TOKEN_INSN, C_none, 0, I_SMINTOLD

    ; { "smsw", TOKEN_INSN, C_none, 0, I_SMSW },
    TOK t_smsw, TOKEN_INSN, C_none, 0, I_SMSW

    ; { "stc", TOKEN_INSN, C_none, 0, I_STC },
    TOK t_stc, TOKEN_INSN, C_none, 0, I_STC

    ; { "std", TOKEN_INSN, C_none, 0, I_STD },
    TOK t_std, TOKEN_INSN, C_none, 0, I_STD

    ; { "sti", TOKEN_INSN, C_none, 0, I_STI },
    TOK t_sti, TOKEN_INSN, C_none, 0, I_STI

    ; { "stosb", TOKEN_INSN, C_none, 0, I_STOSB },
    TOK t_stosb, TOKEN_INSN, C_none, 0, I_STOSB

    ; { "stosd", TOKEN_INSN, C_none, 0, I_STOSD },
    TOK t_stosd, TOKEN_INSN, C_none, 0, I_STOSD

    ; { "stosq", TOKEN_INSN, C_none, 0, I_STOSQ },
    TOK t_stosq, TOKEN_INSN, C_none, 0, I_STOSQ

    ; { "stosw", TOKEN_INSN, C_none, 0, I_STOSW },
    TOK t_stosw, TOKEN_INSN, C_none, 0, I_STOSW

    ; { "str", TOKEN_INSN, C_none, 0, I_STR },
    TOK t_str, TOKEN_INSN, C_none, 0, I_STR

    ; { "sub", TOKEN_INSN, C_none, 0, I_SUB },
    TOK t_sub, TOKEN_INSN, C_none, 0, I_SUB

    ; { "svdc", TOKEN_INSN, C_none, 0, I_SVDC },
    TOK t_svdc, TOKEN_INSN, C_none, 0, I_SVDC

    ; { "svldt", TOKEN_INSN, C_none, 0, I_SVLDT },
    TOK t_svldt, TOKEN_INSN, C_none, 0, I_SVLDT

    ; { "svts", TOKEN_INSN, C_none, 0, I_SVTS },
    TOK t_svts, TOKEN_INSN, C_none, 0, I_SVTS

    ; { "swapgs", TOKEN_INSN, C_none, 0, I_SWAPGS },
    TOK t_swapgs, TOKEN_INSN, C_none, 0, I_SWAPGS

    ; { "syscall", TOKEN_INSN, C_none, 0, I_SYSCALL },
    TOK t_syscall, TOKEN_INSN, C_none, 0, I_SYSCALL

    ; { "sysenter", TOKEN_INSN, C_none, 0, I_SYSENTER },
    TOK t_sysenter, TOKEN_INSN, C_none, 0, I_SYSENTER

    ; { "sysexit", TOKEN_INSN, C_none, 0, I_SYSEXIT },
    TOK t_sysexit, TOKEN_INSN, C_none, 0, I_SYSEXIT

    ; { "sysret", TOKEN_INSN, C_none, 0, I_SYSRET },
    TOK t_sysret, TOKEN_INSN, C_none, 0, I_SYSRET

    ; { "test", TOKEN_INSN, C_none, 0, I_TEST },
    TOK t_test, TOKEN_INSN, C_none, 0, I_TEST

    ; { "ud0", TOKEN_INSN, C_none, 0, I_UD0 },
    TOK t_ud0, TOKEN_INSN, C_none, 0, I_UD0

    ; { "ud1", TOKEN_INSN, C_none, 0, I_UD1 },
    TOK t_ud1, TOKEN_INSN, C_none, 0, I_UD1

    ; { "ud2b", TOKEN_INSN, C_none, 0, I_UD2B },
    TOK t_ud2b, TOKEN_INSN, C_none, 0, I_UD2B

    ; { "ud2", TOKEN_INSN, C_none, 0, I_UD2 },
    TOK t_ud2, TOKEN_INSN, C_none, 0, I_UD2

    ; { "ud2a", TOKEN_INSN, C_none, 0, I_UD2A },
    TOK t_ud2a, TOKEN_INSN, C_none, 0, I_UD2A

    ; { "umov", TOKEN_INSN, C_none, 0, I_UMOV },
    TOK t_umov, TOKEN_INSN, C_none, 0, I_UMOV

    ; { "verr", TOKEN_INSN, C_none, 0, I_VERR },
    TOK t_verr, TOKEN_INSN, C_none, 0, I_VERR

    ; { "verw", TOKEN_INSN, C_none, 0, I_VERW },
    TOK t_verw, TOKEN_INSN, C_none, 0, I_VERW

    ; { "fwait", TOKEN_INSN, C_none, 0, I_FWAIT },
    TOK t_fwait, TOKEN_INSN, C_none, 0, I_FWAIT

    ; { "wbinvd", TOKEN_INSN, C_none, 0, I_WBINVD },
    TOK t_wbinvd, TOKEN_INSN, C_none, 0, I_WBINVD

    ; { "wrshr", TOKEN_INSN, C_none, 0, I_WRSHR },
    TOK t_wrshr, TOKEN_INSN, C_none, 0, I_WRSHR

    ; { "wrmsr", TOKEN_INSN, C_none, 0, I_WRMSR },
    TOK t_wrmsr, TOKEN_INSN, C_none, 0, I_WRMSR

    ; { "xadd", TOKEN_INSN, C_none, 0, I_XADD },
    TOK t_xadd, TOKEN_INSN, C_none, 0, I_XADD

    ; { "xbts", TOKEN_INSN, C_none, 0, I_XBTS },
    TOK t_xbts, TOKEN_INSN, C_none, 0, I_XBTS

    ; { "xchg", TOKEN_INSN, C_none, 0, I_XCHG },
    TOK t_xchg, TOKEN_INSN, C_none, 0, I_XCHG

    ; { "xlatb", TOKEN_INSN, C_none, 0, I_XLATB },
    TOK t_xlatb, TOKEN_INSN, C_none, 0, I_XLATB

    ; { "xlat", TOKEN_INSN, C_none, 0, I_XLAT },
    TOK t_xlat, TOKEN_INSN, C_none, 0, I_XLAT

    ; { "xor", TOKEN_INSN, C_none, 0, I_XOR },
    TOK t_xor, TOKEN_INSN, C_none, 0, I_XOR

    ; { "cmova", TOKEN_INSN, C_A, 0, I_CMOVcc },
    TOK t_cmova, TOKEN_INSN, C_A, 0, I_CMOVcc

    ; { "cmovae", TOKEN_INSN, C_AE, 0, I_CMOVcc },
    TOK t_cmovae, TOKEN_INSN, C_AE, 0, I_CMOVcc

    ; { "cmovb", TOKEN_INSN, C_B, 0, I_CMOVcc },
    TOK t_cmovb, TOKEN_INSN, C_B, 0, I_CMOVcc

    ; { "cmovbe", TOKEN_INSN, C_BE, 0, I_CMOVcc },
    TOK t_cmovbe, TOKEN_INSN, C_BE, 0, I_CMOVcc

    ; { "cmovc", TOKEN_INSN, C_C, 0, I_CMOVcc },
    TOK t_cmovc, TOKEN_INSN, C_C, 0, I_CMOVcc

    ; { "cmove", TOKEN_INSN, C_E, 0, I_CMOVcc },
    TOK t_cmove, TOKEN_INSN, C_E, 0, I_CMOVcc

    ; { "cmovg", TOKEN_INSN, C_G, 0, I_CMOVcc },
    TOK t_cmovg, TOKEN_INSN, C_G, 0, I_CMOVcc

    ; { "cmovge", TOKEN_INSN, C_GE, 0, I_CMOVcc },
    TOK t_cmovge, TOKEN_INSN, C_GE, 0, I_CMOVcc

    ; { "cmovl", TOKEN_INSN, C_L, 0, I_CMOVcc },
    TOK t_cmovl, TOKEN_INSN, C_L, 0, I_CMOVcc

    ; { "cmovle", TOKEN_INSN, C_LE, 0, I_CMOVcc },
    TOK t_cmovle, TOKEN_INSN, C_LE, 0, I_CMOVcc

    ; { "cmovna", TOKEN_INSN, C_NA, 0, I_CMOVcc },
    TOK t_cmovna, TOKEN_INSN, C_NA, 0, I_CMOVcc

    ; { "cmovnae", TOKEN_INSN, C_NAE, 0, I_CMOVcc },
    TOK t_cmovnae, TOKEN_INSN, C_NAE, 0, I_CMOVcc

    ; { "cmovnb", TOKEN_INSN, C_NB, 0, I_CMOVcc },
    TOK t_cmovnb, TOKEN_INSN, C_NB, 0, I_CMOVcc

    ; { "cmovnbe", TOKEN_INSN, C_NBE, 0, I_CMOVcc },
    TOK t_cmovnbe, TOKEN_INSN, C_NBE, 0, I_CMOVcc

    ; { "cmovnc", TOKEN_INSN, C_NC, 0, I_CMOVcc },
    TOK t_cmovnc, TOKEN_INSN, C_NC, 0, I_CMOVcc

    ; { "cmovne", TOKEN_INSN, C_NE, 0, I_CMOVcc },
    TOK t_cmovne, TOKEN_INSN, C_NE, 0, I_CMOVcc

    ; { "cmovng", TOKEN_INSN, C_NG, 0, I_CMOVcc },
    TOK t_cmovng, TOKEN_INSN, C_NG, 0, I_CMOVcc

    ; { "cmovnge", TOKEN_INSN, C_NGE, 0, I_CMOVcc },
    TOK t_cmovnge, TOKEN_INSN, C_NGE, 0, I_CMOVcc

    ; { "cmovnl", TOKEN_INSN, C_NL, 0, I_CMOVcc },
    TOK t_cmovnl, TOKEN_INSN, C_NL, 0, I_CMOVcc

    ; { "cmovnle", TOKEN_INSN, C_NLE, 0, I_CMOVcc },
    TOK t_cmovnle, TOKEN_INSN, C_NLE, 0, I_CMOVcc

    ; { "cmovno", TOKEN_INSN, C_NO, 0, I_CMOVcc },
    TOK t_cmovno, TOKEN_INSN, C_NO, 0, I_CMOVcc

    ; { "cmovnp", TOKEN_INSN, C_NP, 0, I_CMOVcc },
    TOK t_cmovnp, TOKEN_INSN, C_NP, 0, I_CMOVcc

    ; { "cmovns", TOKEN_INSN, C_NS, 0, I_CMOVcc },
    TOK t_cmovns, TOKEN_INSN, C_NS, 0, I_CMOVcc

    ; { "cmovnz", TOKEN_INSN, C_NZ, 0, I_CMOVcc },
    TOK t_cmovnz, TOKEN_INSN, C_NZ, 0, I_CMOVcc

    ; { "cmovo", TOKEN_INSN, C_O, 0, I_CMOVcc },
    TOK t_cmovo, TOKEN_INSN, C_O, 0, I_CMOVcc

    ; { "cmovp", TOKEN_INSN, C_P, 0, I_CMOVcc },
    TOK t_cmovp, TOKEN_INSN, C_P, 0, I_CMOVcc

    ; { "cmovpe", TOKEN_INSN, C_PE, 0, I_CMOVcc },
    TOK t_cmovpe, TOKEN_INSN, C_PE, 0, I_CMOVcc

    ; { "cmovpo", TOKEN_INSN, C_PO, 0, I_CMOVcc },
    TOK t_cmovpo, TOKEN_INSN, C_PO, 0, I_CMOVcc

    ; { "cmovs", TOKEN_INSN, C_S, 0, I_CMOVcc },
    TOK t_cmovs, TOKEN_INSN, C_S, 0, I_CMOVcc

    ; { "cmovz", TOKEN_INSN, C_Z, 0, I_CMOVcc },
    TOK t_cmovz, TOKEN_INSN, C_Z, 0, I_CMOVcc

    ; { "ja", TOKEN_INSN, C_A, 0, I_Jcc },
    TOK t_ja, TOKEN_INSN, C_A, 0, I_Jcc

    ; { "jae", TOKEN_INSN, C_AE, 0, I_Jcc },
    TOK t_jae, TOKEN_INSN, C_AE, 0, I_Jcc

    ; { "jb", TOKEN_INSN, C_B, 0, I_Jcc },
    TOK t_jb, TOKEN_INSN, C_B, 0, I_Jcc

    ; { "jbe", TOKEN_INSN, C_BE, 0, I_Jcc },
    TOK t_jbe, TOKEN_INSN, C_BE, 0, I_Jcc

    ; { "jc", TOKEN_INSN, C_C, 0, I_Jcc },
    TOK t_jc, TOKEN_INSN, C_C, 0, I_Jcc

    ; { "je", TOKEN_INSN, C_E, 0, I_Jcc },
    TOK t_je, TOKEN_INSN, C_E, 0, I_Jcc

    ; { "jg", TOKEN_INSN, C_G, 0, I_Jcc },
    TOK t_jg, TOKEN_INSN, C_G, 0, I_Jcc

    ; { "jge", TOKEN_INSN, C_GE, 0, I_Jcc },
    TOK t_jge, TOKEN_INSN, C_GE, 0, I_Jcc

    ; { "jl", TOKEN_INSN, C_L, 0, I_Jcc },
    TOK t_jl, TOKEN_INSN, C_L, 0, I_Jcc

    ; { "jle", TOKEN_INSN, C_LE, 0, I_Jcc },
    TOK t_jle, TOKEN_INSN, C_LE, 0, I_Jcc

    ; { "jna", TOKEN_INSN, C_NA, 0, I_Jcc },
    TOK t_jna, TOKEN_INSN, C_NA, 0, I_Jcc

    ; { "jnae", TOKEN_INSN, C_NAE, 0, I_Jcc },
    TOK t_jnae, TOKEN_INSN, C_NAE, 0, I_Jcc

    ; { "jnb", TOKEN_INSN, C_NB, 0, I_Jcc },
    TOK t_jnb, TOKEN_INSN, C_NB, 0, I_Jcc

    ; { "jnbe", TOKEN_INSN, C_NBE, 0, I_Jcc },
    TOK t_jnbe, TOKEN_INSN, C_NBE, 0, I_Jcc

    ; { "jnc", TOKEN_INSN, C_NC, 0, I_Jcc },
    TOK t_jnc, TOKEN_INSN, C_NC, 0, I_Jcc

    ; { "jne", TOKEN_INSN, C_NE, 0, I_Jcc },
    TOK t_jne, TOKEN_INSN, C_NE, 0, I_Jcc

    ; { "jng", TOKEN_INSN, C_NG, 0, I_Jcc },
    TOK t_jng, TOKEN_INSN, C_NG, 0, I_Jcc

    ; { "jnge", TOKEN_INSN, C_NGE, 0, I_Jcc },
    TOK t_jnge, TOKEN_INSN, C_NGE, 0, I_Jcc

    ; { "jnl", TOKEN_INSN, C_NL, 0, I_Jcc },
    TOK t_jnl, TOKEN_INSN, C_NL, 0, I_Jcc

    ; { "jnle", TOKEN_INSN, C_NLE, 0, I_Jcc },
    TOK t_jnle, TOKEN_INSN, C_NLE, 0, I_Jcc

    ; { "jno", TOKEN_INSN, C_NO, 0, I_Jcc },
    TOK t_jno, TOKEN_INSN, C_NO, 0, I_Jcc

    ; { "jnp", TOKEN_INSN, C_NP, 0, I_Jcc },
    TOK t_jnp, TOKEN_INSN, C_NP, 0, I_Jcc

    ; { "jns", TOKEN_INSN, C_NS, 0, I_Jcc },
    TOK t_jns, TOKEN_INSN, C_NS, 0, I_Jcc

    ; { "jnz", TOKEN_INSN, C_NZ, 0, I_Jcc },
    TOK t_jnz, TOKEN_INSN, C_NZ, 0, I_Jcc

    ; { "jo", TOKEN_INSN, C_O, 0, I_Jcc },
    TOK t_jo, TOKEN_INSN, C_O, 0, I_Jcc

    ; { "jp", TOKEN_INSN, C_P, 0, I_Jcc },
    TOK t_jp, TOKEN_INSN, C_P, 0, I_Jcc

    ; { "jpe", TOKEN_INSN, C_PE, 0, I_Jcc },
    TOK t_jpe, TOKEN_INSN, C_PE, 0, I_Jcc

    ; { "jpo", TOKEN_INSN, C_PO, 0, I_Jcc },
    TOK t_jpo, TOKEN_INSN, C_PO, 0, I_Jcc

    ; { "js", TOKEN_INSN, C_S, 0, I_Jcc },
    TOK t_js, TOKEN_INSN, C_S, 0, I_Jcc

    ; { "jz", TOKEN_INSN, C_Z, 0, I_Jcc },
    TOK t_jz, TOKEN_INSN, C_Z, 0, I_Jcc

    ; { "seta", TOKEN_INSN, C_A, 0, I_SETcc },
    TOK t_seta, TOKEN_INSN, C_A, 0, I_SETcc

    ; { "setae", TOKEN_INSN, C_AE, 0, I_SETcc },
    TOK t_setae, TOKEN_INSN, C_AE, 0, I_SETcc

    ; { "setb", TOKEN_INSN, C_B, 0, I_SETcc },
    TOK t_setb, TOKEN_INSN, C_B, 0, I_SETcc

    ; { "setbe", TOKEN_INSN, C_BE, 0, I_SETcc },
    TOK t_setbe, TOKEN_INSN, C_BE, 0, I_SETcc

    ; { "setc", TOKEN_INSN, C_C, 0, I_SETcc },
    TOK t_setc, TOKEN_INSN, C_C, 0, I_SETcc

    ; { "sete", TOKEN_INSN, C_E, 0, I_SETcc },
    TOK t_sete, TOKEN_INSN, C_E, 0, I_SETcc

    ; { "setg", TOKEN_INSN, C_G, 0, I_SETcc },
    TOK t_setg, TOKEN_INSN, C_G, 0, I_SETcc

    ; { "setge", TOKEN_INSN, C_GE, 0, I_SETcc },
    TOK t_setge, TOKEN_INSN, C_GE, 0, I_SETcc

    ; { "setl", TOKEN_INSN, C_L, 0, I_SETcc },
    TOK t_setl, TOKEN_INSN, C_L, 0, I_SETcc

    ; { "setle", TOKEN_INSN, C_LE, 0, I_SETcc },
    TOK t_setle, TOKEN_INSN, C_LE, 0, I_SETcc

    ; { "setna", TOKEN_INSN, C_NA, 0, I_SETcc },
    TOK t_setna, TOKEN_INSN, C_NA, 0, I_SETcc

    ; { "setnae", TOKEN_INSN, C_NAE, 0, I_SETcc },
    TOK t_setnae, TOKEN_INSN, C_NAE, 0, I_SETcc

    ; { "setnb", TOKEN_INSN, C_NB, 0, I_SETcc },
    TOK t_setnb, TOKEN_INSN, C_NB, 0, I_SETcc

    ; { "setnbe", TOKEN_INSN, C_NBE, 0, I_SETcc },
    TOK t_setnbe, TOKEN_INSN, C_NBE, 0, I_SETcc

    ; { "setnc", TOKEN_INSN, C_NC, 0, I_SETcc },
    TOK t_setnc, TOKEN_INSN, C_NC, 0, I_SETcc

    ; { "setne", TOKEN_INSN, C_NE, 0, I_SETcc },
    TOK t_setne, TOKEN_INSN, C_NE, 0, I_SETcc

    ; { "setng", TOKEN_INSN, C_NG, 0, I_SETcc },
    TOK t_setng, TOKEN_INSN, C_NG, 0, I_SETcc

    ; { "setnge", TOKEN_INSN, C_NGE, 0, I_SETcc },
    TOK t_setnge, TOKEN_INSN, C_NGE, 0, I_SETcc

    ; { "setnl", TOKEN_INSN, C_NL, 0, I_SETcc },
    TOK t_setnl, TOKEN_INSN, C_NL, 0, I_SETcc

    ; { "setnle", TOKEN_INSN, C_NLE, 0, I_SETcc },
    TOK t_setnle, TOKEN_INSN, C_NLE, 0, I_SETcc

    ; { "setno", TOKEN_INSN, C_NO, 0, I_SETcc },
    TOK t_setno, TOKEN_INSN, C_NO, 0, I_SETcc

    ; { "setnp", TOKEN_INSN, C_NP, 0, I_SETcc },
    TOK t_setnp, TOKEN_INSN, C_NP, 0, I_SETcc

    ; { "setns", TOKEN_INSN, C_NS, 0, I_SETcc },
    TOK t_setns, TOKEN_INSN, C_NS, 0, I_SETcc

    ; { "setnz", TOKEN_INSN, C_NZ, 0, I_SETcc },
    TOK t_setnz, TOKEN_INSN, C_NZ, 0, I_SETcc

    ; { "seto", TOKEN_INSN, C_O, 0, I_SETcc },
    TOK t_seto, TOKEN_INSN, C_O, 0, I_SETcc

    ; { "setp", TOKEN_INSN, C_P, 0, I_SETcc },
    TOK t_setp, TOKEN_INSN, C_P, 0, I_SETcc

    ; { "setpe", TOKEN_INSN, C_PE, 0, I_SETcc },
    TOK t_setpe, TOKEN_INSN, C_PE, 0, I_SETcc

    ; { "setpo", TOKEN_INSN, C_PO, 0, I_SETcc },
    TOK t_setpo, TOKEN_INSN, C_PO, 0, I_SETcc

    ; { "sets", TOKEN_INSN, C_S, 0, I_SETcc },
    TOK t_sets, TOKEN_INSN, C_S, 0, I_SETcc

    ; { "setz", TOKEN_INSN, C_Z, 0, I_SETcc },
    TOK t_setz, TOKEN_INSN, C_Z, 0, I_SETcc

    ; { "addps", TOKEN_INSN, C_none, 0, I_ADDPS },
    TOK t_addps, TOKEN_INSN, C_none, 0, I_ADDPS

    ; { "addss", TOKEN_INSN, C_none, 0, I_ADDSS },
    TOK t_addss, TOKEN_INSN, C_none, 0, I_ADDSS

    ; { "andnps", TOKEN_INSN, C_none, 0, I_ANDNPS },
    TOK t_andnps, TOKEN_INSN, C_none, 0, I_ANDNPS

    ; { "andps", TOKEN_INSN, C_none, 0, I_ANDPS },
    TOK t_andps, TOKEN_INSN, C_none, 0, I_ANDPS

    ; { "cmpeqps", TOKEN_INSN, C_none, 0, I_CMPEQPS },
    TOK t_cmpeqps, TOKEN_INSN, C_none, 0, I_CMPEQPS

    ; { "cmpeqss", TOKEN_INSN, C_none, 0, I_CMPEQSS },
    TOK t_cmpeqss, TOKEN_INSN, C_none, 0, I_CMPEQSS

    ; { "cmpleps", TOKEN_INSN, C_none, 0, I_CMPLEPS },
    TOK t_cmpleps, TOKEN_INSN, C_none, 0, I_CMPLEPS

    ; { "cmpless", TOKEN_INSN, C_none, 0, I_CMPLESS },
    TOK t_cmpless, TOKEN_INSN, C_none, 0, I_CMPLESS

    ; { "cmpltps", TOKEN_INSN, C_none, 0, I_CMPLTPS },
    TOK t_cmpltps, TOKEN_INSN, C_none, 0, I_CMPLTPS

    ; { "cmpltss", TOKEN_INSN, C_none, 0, I_CMPLTSS },
    TOK t_cmpltss, TOKEN_INSN, C_none, 0, I_CMPLTSS

    ; { "cmpneqps", TOKEN_INSN, C_none, 0, I_CMPNEQPS },
    TOK t_cmpneqps, TOKEN_INSN, C_none, 0, I_CMPNEQPS

    ; { "cmpneqss", TOKEN_INSN, C_none, 0, I_CMPNEQSS },
    TOK t_cmpneqss, TOKEN_INSN, C_none, 0, I_CMPNEQSS

    ; { "cmpnleps", TOKEN_INSN, C_none, 0, I_CMPNLEPS },
    TOK t_cmpnleps, TOKEN_INSN, C_none, 0, I_CMPNLEPS

    ; { "cmpnless", TOKEN_INSN, C_none, 0, I_CMPNLESS },
    TOK t_cmpnless, TOKEN_INSN, C_none, 0, I_CMPNLESS

    ; { "cmpnltps", TOKEN_INSN, C_none, 0, I_CMPNLTPS },
    TOK t_cmpnltps, TOKEN_INSN, C_none, 0, I_CMPNLTPS

    ; { "cmpnltss", TOKEN_INSN, C_none, 0, I_CMPNLTSS },
    TOK t_cmpnltss, TOKEN_INSN, C_none, 0, I_CMPNLTSS

    ; { "cmpordps", TOKEN_INSN, C_none, 0, I_CMPORDPS },
    TOK t_cmpordps, TOKEN_INSN, C_none, 0, I_CMPORDPS

    ; { "cmpordss", TOKEN_INSN, C_none, 0, I_CMPORDSS },
    TOK t_cmpordss, TOKEN_INSN, C_none, 0, I_CMPORDSS

    ; { "cmpunordps", TOKEN_INSN, C_none, 0, I_CMPUNORDPS },
    TOK t_cmpunordps, TOKEN_INSN, C_none, 0, I_CMPUNORDPS

    ; { "cmpunordss", TOKEN_INSN, C_none, 0, I_CMPUNORDSS },
    TOK t_cmpunordss, TOKEN_INSN, C_none, 0, I_CMPUNORDSS

    ; { "cmpps", TOKEN_INSN, C_none, 0, I_CMPPS },
    TOK t_cmpps, TOKEN_INSN, C_none, 0, I_CMPPS

    ; { "cmpss", TOKEN_INSN, C_none, 0, I_CMPSS },
    TOK t_cmpss, TOKEN_INSN, C_none, 0, I_CMPSS

    ; { "comiss", TOKEN_INSN, C_none, 0, I_COMISS },
    TOK t_comiss, TOKEN_INSN, C_none, 0, I_COMISS

    ; { "cvtpi2ps", TOKEN_INSN, C_none, 0, I_CVTPI2PS },
    TOK t_cvtpi2ps, TOKEN_INSN, C_none, 0, I_CVTPI2PS

    ; { "cvtps2pi", TOKEN_INSN, C_none, 0, I_CVTPS2PI },
    TOK t_cvtps2pi, TOKEN_INSN, C_none, 0, I_CVTPS2PI

    ; { "cvtsi2ss", TOKEN_INSN, C_none, 0, I_CVTSI2SS },
    TOK t_cvtsi2ss, TOKEN_INSN, C_none, 0, I_CVTSI2SS

    ; { "cvtss2si", TOKEN_INSN, C_none, 0, I_CVTSS2SI },
    TOK t_cvtss2si, TOKEN_INSN, C_none, 0, I_CVTSS2SI

    ; { "cvttps2pi", TOKEN_INSN, C_none, 0, I_CVTTPS2PI },
    TOK t_cvttps2pi, TOKEN_INSN, C_none, 0, I_CVTTPS2PI

    ; { "cvttss2si", TOKEN_INSN, C_none, 0, I_CVTTSS2SI },
    TOK t_cvttss2si, TOKEN_INSN, C_none, 0, I_CVTTSS2SI

    ; { "divps", TOKEN_INSN, C_none, 0, I_DIVPS },
    TOK t_divps, TOKEN_INSN, C_none, 0, I_DIVPS

    ; { "divss", TOKEN_INSN, C_none, 0, I_DIVSS },
    TOK t_divss, TOKEN_INSN, C_none, 0, I_DIVSS

    ; { "ldmxcsr", TOKEN_INSN, C_none, 0, I_LDMXCSR },
    TOK t_ldmxcsr, TOKEN_INSN, C_none, 0, I_LDMXCSR

    ; { "maxps", TOKEN_INSN, C_none, 0, I_MAXPS },
    TOK t_maxps, TOKEN_INSN, C_none, 0, I_MAXPS

    ; { "maxss", TOKEN_INSN, C_none, 0, I_MAXSS },
    TOK t_maxss, TOKEN_INSN, C_none, 0, I_MAXSS

    ; { "minps", TOKEN_INSN, C_none, 0, I_MINPS },
    TOK t_minps, TOKEN_INSN, C_none, 0, I_MINPS

    ; { "minss", TOKEN_INSN, C_none, 0, I_MINSS },
    TOK t_minss, TOKEN_INSN, C_none, 0, I_MINSS

    ; { "movaps", TOKEN_INSN, C_none, 0, I_MOVAPS },
    TOK t_movaps, TOKEN_INSN, C_none, 0, I_MOVAPS

    ; { "movhps", TOKEN_INSN, C_none, 0, I_MOVHPS },
    TOK t_movhps, TOKEN_INSN, C_none, 0, I_MOVHPS

    ; { "movlhps", TOKEN_INSN, C_none, 0, I_MOVLHPS },
    TOK t_movlhps, TOKEN_INSN, C_none, 0, I_MOVLHPS

    ; { "movlps", TOKEN_INSN, C_none, 0, I_MOVLPS },
    TOK t_movlps, TOKEN_INSN, C_none, 0, I_MOVLPS

    ; { "movhlps", TOKEN_INSN, C_none, 0, I_MOVHLPS },
    TOK t_movhlps, TOKEN_INSN, C_none, 0, I_MOVHLPS

    ; { "movmskps", TOKEN_INSN, C_none, 0, I_MOVMSKPS },
    TOK t_movmskps, TOKEN_INSN, C_none, 0, I_MOVMSKPS

    ; { "movntps", TOKEN_INSN, C_none, 0, I_MOVNTPS },
    TOK t_movntps, TOKEN_INSN, C_none, 0, I_MOVNTPS

    ; { "movss", TOKEN_INSN, C_none, 0, I_MOVSS },
    TOK t_movss, TOKEN_INSN, C_none, 0, I_MOVSS

    ; { "movups", TOKEN_INSN, C_none, 0, I_MOVUPS },
    TOK t_movups, TOKEN_INSN, C_none, 0, I_MOVUPS

    ; { "mulps", TOKEN_INSN, C_none, 0, I_MULPS },
    TOK t_mulps, TOKEN_INSN, C_none, 0, I_MULPS

    ; { "mulss", TOKEN_INSN, C_none, 0, I_MULSS },
    TOK t_mulss, TOKEN_INSN, C_none, 0, I_MULSS

    ; { "orps", TOKEN_INSN, C_none, 0, I_ORPS },
    TOK t_orps, TOKEN_INSN, C_none, 0, I_ORPS

    ; { "rcpps", TOKEN_INSN, C_none, 0, I_RCPPS },
    TOK t_rcpps, TOKEN_INSN, C_none, 0, I_RCPPS

    ; { "rcpss", TOKEN_INSN, C_none, 0, I_RCPSS },
    TOK t_rcpss, TOKEN_INSN, C_none, 0, I_RCPSS

    ; { "rsqrtps", TOKEN_INSN, C_none, 0, I_RSQRTPS },
    TOK t_rsqrtps, TOKEN_INSN, C_none, 0, I_RSQRTPS

    ; { "rsqrtss", TOKEN_INSN, C_none, 0, I_RSQRTSS },
    TOK t_rsqrtss, TOKEN_INSN, C_none, 0, I_RSQRTSS

    ; { "shufps", TOKEN_INSN, C_none, 0, I_SHUFPS },
    TOK t_shufps, TOKEN_INSN, C_none, 0, I_SHUFPS

    ; { "sqrtps", TOKEN_INSN, C_none, 0, I_SQRTPS },
    TOK t_sqrtps, TOKEN_INSN, C_none, 0, I_SQRTPS

    ; { "sqrtss", TOKEN_INSN, C_none, 0, I_SQRTSS },
    TOK t_sqrtss, TOKEN_INSN, C_none, 0, I_SQRTSS

    ; { "stmxcsr", TOKEN_INSN, C_none, 0, I_STMXCSR },
    TOK t_stmxcsr, TOKEN_INSN, C_none, 0, I_STMXCSR

    ; { "subps", TOKEN_INSN, C_none, 0, I_SUBPS },
    TOK t_subps, TOKEN_INSN, C_none, 0, I_SUBPS

    ; { "subss", TOKEN_INSN, C_none, 0, I_SUBSS },
    TOK t_subss, TOKEN_INSN, C_none, 0, I_SUBSS

    ; { "ucomiss", TOKEN_INSN, C_none, 0, I_UCOMISS },
    TOK t_ucomiss, TOKEN_INSN, C_none, 0, I_UCOMISS

    ; { "unpckhps", TOKEN_INSN, C_none, 0, I_UNPCKHPS },
    TOK t_unpckhps, TOKEN_INSN, C_none, 0, I_UNPCKHPS

    ; { "unpcklps", TOKEN_INSN, C_none, 0, I_UNPCKLPS },
    TOK t_unpcklps, TOKEN_INSN, C_none, 0, I_UNPCKLPS

    ; { "xorps", TOKEN_INSN, C_none, 0, I_XORPS },
    TOK t_xorps, TOKEN_INSN, C_none, 0, I_XORPS

    ; { "fxrstor", TOKEN_INSN, C_none, 0, I_FXRSTOR },
    TOK t_fxrstor, TOKEN_INSN, C_none, 0, I_FXRSTOR

    ; { "fxrstor64", TOKEN_INSN, C_none, 0, I_FXRSTOR64 },
    TOK t_fxrstor64, TOKEN_INSN, C_none, 0, I_FXRSTOR64

    ; { "fxsave", TOKEN_INSN, C_none, 0, I_FXSAVE },
    TOK t_fxsave, TOKEN_INSN, C_none, 0, I_FXSAVE

    ; { "fxsave64", TOKEN_INSN, C_none, 0, I_FXSAVE64 },
    TOK t_fxsave64, TOKEN_INSN, C_none, 0, I_FXSAVE64

    ; { "xgetbv", TOKEN_INSN, C_none, 0, I_XGETBV },
    TOK t_xgetbv, TOKEN_INSN, C_none, 0, I_XGETBV

    ; { "xsetbv", TOKEN_INSN, C_none, 0, I_XSETBV },
    TOK t_xsetbv, TOKEN_INSN, C_none, 0, I_XSETBV

    ; { "xsave", TOKEN_INSN, C_none, 0, I_XSAVE },
    TOK t_xsave, TOKEN_INSN, C_none, 0, I_XSAVE

    ; { "xsave64", TOKEN_INSN, C_none, 0, I_XSAVE64 },
    TOK t_xsave64, TOKEN_INSN, C_none, 0, I_XSAVE64

    ; { "xsavec", TOKEN_INSN, C_none, 0, I_XSAVEC },
    TOK t_xsavec, TOKEN_INSN, C_none, 0, I_XSAVEC

    ; { "xsavec64", TOKEN_INSN, C_none, 0, I_XSAVEC64 },
    TOK t_xsavec64, TOKEN_INSN, C_none, 0, I_XSAVEC64

    ; { "xsaveopt", TOKEN_INSN, C_none, 0, I_XSAVEOPT },
    TOK t_xsaveopt, TOKEN_INSN, C_none, 0, I_XSAVEOPT

    ; { "xsaveopt64", TOKEN_INSN, C_none, 0, I_XSAVEOPT64 },
    TOK t_xsaveopt64, TOKEN_INSN, C_none, 0, I_XSAVEOPT64

    ; { "xsaves", TOKEN_INSN, C_none, 0, I_XSAVES },
    TOK t_xsaves, TOKEN_INSN, C_none, 0, I_XSAVES

    ; { "xsaves64", TOKEN_INSN, C_none, 0, I_XSAVES64 },
    TOK t_xsaves64, TOKEN_INSN, C_none, 0, I_XSAVES64

    ; { "xrstor", TOKEN_INSN, C_none, 0, I_XRSTOR },
    TOK t_xrstor, TOKEN_INSN, C_none, 0, I_XRSTOR

    ; { "xrstor64", TOKEN_INSN, C_none, 0, I_XRSTOR64 },
    TOK t_xrstor64, TOKEN_INSN, C_none, 0, I_XRSTOR64

    ; { "xrstors", TOKEN_INSN, C_none, 0, I_XRSTORS },
    TOK t_xrstors, TOKEN_INSN, C_none, 0, I_XRSTORS

    ; { "xrstors64", TOKEN_INSN, C_none, 0, I_XRSTORS64 },
    TOK t_xrstors64, TOKEN_INSN, C_none, 0, I_XRSTORS64

    ; { "prefetchnta", TOKEN_INSN, C_none, 0, I_PREFETCHNTA },
    TOK t_prefetchnta, TOKEN_INSN, C_none, 0, I_PREFETCHNTA

    ; { "prefetcht0", TOKEN_INSN, C_none, 0, I_PREFETCHT0 },
    TOK t_prefetcht0, TOKEN_INSN, C_none, 0, I_PREFETCHT0

    ; { "prefetcht1", TOKEN_INSN, C_none, 0, I_PREFETCHT1 },
    TOK t_prefetcht1, TOKEN_INSN, C_none, 0, I_PREFETCHT1

    ; { "prefetcht2", TOKEN_INSN, C_none, 0, I_PREFETCHT2 },
    TOK t_prefetcht2, TOKEN_INSN, C_none, 0, I_PREFETCHT2

    ; { "maskmovq", TOKEN_INSN, C_none, 0, I_MASKMOVQ },
    TOK t_maskmovq, TOKEN_INSN, C_none, 0, I_MASKMOVQ

    ; { "movntq", TOKEN_INSN, C_none, 0, I_MOVNTQ },
    TOK t_movntq, TOKEN_INSN, C_none, 0, I_MOVNTQ

    ; { "pavgb", TOKEN_INSN, C_none, 0, I_PAVGB },
    TOK t_pavgb, TOKEN_INSN, C_none, 0, I_PAVGB

    ; { "pavgw", TOKEN_INSN, C_none, 0, I_PAVGW },
    TOK t_pavgw, TOKEN_INSN, C_none, 0, I_PAVGW

    ; { "pextrw", TOKEN_INSN, C_none, 0, I_PEXTRW },
    TOK t_pextrw, TOKEN_INSN, C_none, 0, I_PEXTRW

    ; { "pinsrw", TOKEN_INSN, C_none, 0, I_PINSRW },
    TOK t_pinsrw, TOKEN_INSN, C_none, 0, I_PINSRW

    ; { "pmaxsw", TOKEN_INSN, C_none, 0, I_PMAXSW },
    TOK t_pmaxsw, TOKEN_INSN, C_none, 0, I_PMAXSW

    ; { "pmaxub", TOKEN_INSN, C_none, 0, I_PMAXUB },
    TOK t_pmaxub, TOKEN_INSN, C_none, 0, I_PMAXUB

    ; { "pminsw", TOKEN_INSN, C_none, 0, I_PMINSW },
    TOK t_pminsw, TOKEN_INSN, C_none, 0, I_PMINSW

    ; { "pminub", TOKEN_INSN, C_none, 0, I_PMINUB },
    TOK t_pminub, TOKEN_INSN, C_none, 0, I_PMINUB

    ; { "pmovmskb", TOKEN_INSN, C_none, 0, I_PMOVMSKB },
    TOK t_pmovmskb, TOKEN_INSN, C_none, 0, I_PMOVMSKB

    ; { "pmulhuw", TOKEN_INSN, C_none, 0, I_PMULHUW },
    TOK t_pmulhuw, TOKEN_INSN, C_none, 0, I_PMULHUW

    ; { "psadbw", TOKEN_INSN, C_none, 0, I_PSADBW },
    TOK t_psadbw, TOKEN_INSN, C_none, 0, I_PSADBW

    ; { "pshufw", TOKEN_INSN, C_none, 0, I_PSHUFW },
    TOK t_pshufw, TOKEN_INSN, C_none, 0, I_PSHUFW

    ; { "pf2iw", TOKEN_INSN, C_none, 0, I_PF2IW },
    TOK t_pf2iw, TOKEN_INSN, C_none, 0, I_PF2IW

    ; { "pfnacc", TOKEN_INSN, C_none, 0, I_PFNACC },
    TOK t_pfnacc, TOKEN_INSN, C_none, 0, I_PFNACC

    ; { "pfpnacc", TOKEN_INSN, C_none, 0, I_PFPNACC },
    TOK t_pfpnacc, TOKEN_INSN, C_none, 0, I_PFPNACC

    ; { "pi2fw", TOKEN_INSN, C_none, 0, I_PI2FW },
    TOK t_pi2fw, TOKEN_INSN, C_none, 0, I_PI2FW

    ; { "pswapd", TOKEN_INSN, C_none, 0, I_PSWAPD },
    TOK t_pswapd, TOKEN_INSN, C_none, 0, I_PSWAPD

    ; { "maskmovdqu", TOKEN_INSN, C_none, 0, I_MASKMOVDQU },
    TOK t_maskmovdqu, TOKEN_INSN, C_none, 0, I_MASKMOVDQU

    ; { "clflush", TOKEN_INSN, C_none, 0, I_CLFLUSH },
    TOK t_clflush, TOKEN_INSN, C_none, 0, I_CLFLUSH

    ; { "movntdq", TOKEN_INSN, C_none, 0, I_MOVNTDQ },
    TOK t_movntdq, TOKEN_INSN, C_none, 0, I_MOVNTDQ

    ; { "movnti", TOKEN_INSN, C_none, 0, I_MOVNTI },
    TOK t_movnti, TOKEN_INSN, C_none, 0, I_MOVNTI

    ; { "movntpd", TOKEN_INSN, C_none, 0, I_MOVNTPD },
    TOK t_movntpd, TOKEN_INSN, C_none, 0, I_MOVNTPD

    ; { "movdqa", TOKEN_INSN, C_none, 0, I_MOVDQA },
    TOK t_movdqa, TOKEN_INSN, C_none, 0, I_MOVDQA

    ; { "movdqu", TOKEN_INSN, C_none, 0, I_MOVDQU },
    TOK t_movdqu, TOKEN_INSN, C_none, 0, I_MOVDQU

    ; { "movdq2q", TOKEN_INSN, C_none, 0, I_MOVDQ2Q },
    TOK t_movdq2q, TOKEN_INSN, C_none, 0, I_MOVDQ2Q

    ; { "movq2dq", TOKEN_INSN, C_none, 0, I_MOVQ2DQ },
    TOK t_movq2dq, TOKEN_INSN, C_none, 0, I_MOVQ2DQ

    ; { "paddq", TOKEN_INSN, C_none, 0, I_PADDQ },
    TOK t_paddq, TOKEN_INSN, C_none, 0, I_PADDQ

    ; { "pmuludq", TOKEN_INSN, C_none, 0, I_PMULUDQ },
    TOK t_pmuludq, TOKEN_INSN, C_none, 0, I_PMULUDQ

    ; { "pshufd", TOKEN_INSN, C_none, 0, I_PSHUFD },
    TOK t_pshufd, TOKEN_INSN, C_none, 0, I_PSHUFD

    ; { "pshufhw", TOKEN_INSN, C_none, 0, I_PSHUFHW },
    TOK t_pshufhw, TOKEN_INSN, C_none, 0, I_PSHUFHW

    ; { "pshuflw", TOKEN_INSN, C_none, 0, I_PSHUFLW },
    TOK t_pshuflw, TOKEN_INSN, C_none, 0, I_PSHUFLW

    ; { "pslldq", TOKEN_INSN, C_none, 0, I_PSLLDQ },
    TOK t_pslldq, TOKEN_INSN, C_none, 0, I_PSLLDQ

    ; { "psrldq", TOKEN_INSN, C_none, 0, I_PSRLDQ },
    TOK t_psrldq, TOKEN_INSN, C_none, 0, I_PSRLDQ

    ; { "psubq", TOKEN_INSN, C_none, 0, I_PSUBQ },
    TOK t_psubq, TOKEN_INSN, C_none, 0, I_PSUBQ

    ; { "punpckhqdq", TOKEN_INSN, C_none, 0, I_PUNPCKHQDQ },
    TOK t_punpckhqdq, TOKEN_INSN, C_none, 0, I_PUNPCKHQDQ

    ; { "punpcklqdq", TOKEN_INSN, C_none, 0, I_PUNPCKLQDQ },
    TOK t_punpcklqdq, TOKEN_INSN, C_none, 0, I_PUNPCKLQDQ

    ; { "addpd", TOKEN_INSN, C_none, 0, I_ADDPD },
    TOK t_addpd, TOKEN_INSN, C_none, 0, I_ADDPD

    ; { "addsd", TOKEN_INSN, C_none, 0, I_ADDSD },
    TOK t_addsd, TOKEN_INSN, C_none, 0, I_ADDSD

    ; { "andnpd", TOKEN_INSN, C_none, 0, I_ANDNPD },
    TOK t_andnpd, TOKEN_INSN, C_none, 0, I_ANDNPD

    ; { "andpd", TOKEN_INSN, C_none, 0, I_ANDPD },
    TOK t_andpd, TOKEN_INSN, C_none, 0, I_ANDPD

    ; { "cmpeqpd", TOKEN_INSN, C_none, 0, I_CMPEQPD },
    TOK t_cmpeqpd, TOKEN_INSN, C_none, 0, I_CMPEQPD

    ; { "cmpeqsd", TOKEN_INSN, C_none, 0, I_CMPEQSD },
    TOK t_cmpeqsd, TOKEN_INSN, C_none, 0, I_CMPEQSD

    ; { "cmplepd", TOKEN_INSN, C_none, 0, I_CMPLEPD },
    TOK t_cmplepd, TOKEN_INSN, C_none, 0, I_CMPLEPD

    ; { "cmplesd", TOKEN_INSN, C_none, 0, I_CMPLESD },
    TOK t_cmplesd, TOKEN_INSN, C_none, 0, I_CMPLESD

    ; { "cmpltpd", TOKEN_INSN, C_none, 0, I_CMPLTPD },
    TOK t_cmpltpd, TOKEN_INSN, C_none, 0, I_CMPLTPD

    ; { "cmpltsd", TOKEN_INSN, C_none, 0, I_CMPLTSD },
    TOK t_cmpltsd, TOKEN_INSN, C_none, 0, I_CMPLTSD

    ; { "cmpneqpd", TOKEN_INSN, C_none, 0, I_CMPNEQPD },
    TOK t_cmpneqpd, TOKEN_INSN, C_none, 0, I_CMPNEQPD

    ; { "cmpneqsd", TOKEN_INSN, C_none, 0, I_CMPNEQSD },
    TOK t_cmpneqsd, TOKEN_INSN, C_none, 0, I_CMPNEQSD

    ; { "cmpnlepd", TOKEN_INSN, C_none, 0, I_CMPNLEPD },
    TOK t_cmpnlepd, TOKEN_INSN, C_none, 0, I_CMPNLEPD

    ; { "cmpnlesd", TOKEN_INSN, C_none, 0, I_CMPNLESD },
    TOK t_cmpnlesd, TOKEN_INSN, C_none, 0, I_CMPNLESD

    ; { "cmpnltpd", TOKEN_INSN, C_none, 0, I_CMPNLTPD },
    TOK t_cmpnltpd, TOKEN_INSN, C_none, 0, I_CMPNLTPD

    ; { "cmpnltsd", TOKEN_INSN, C_none, 0, I_CMPNLTSD },
    TOK t_cmpnltsd, TOKEN_INSN, C_none, 0, I_CMPNLTSD

    ; { "cmpordpd", TOKEN_INSN, C_none, 0, I_CMPORDPD },
    TOK t_cmpordpd, TOKEN_INSN, C_none, 0, I_CMPORDPD

    ; { "cmpordsd", TOKEN_INSN, C_none, 0, I_CMPORDSD },
    TOK t_cmpordsd, TOKEN_INSN, C_none, 0, I_CMPORDSD

    ; { "cmpunordpd", TOKEN_INSN, C_none, 0, I_CMPUNORDPD },
    TOK t_cmpunordpd, TOKEN_INSN, C_none, 0, I_CMPUNORDPD

    ; { "cmpunordsd", TOKEN_INSN, C_none, 0, I_CMPUNORDSD },
    TOK t_cmpunordsd, TOKEN_INSN, C_none, 0, I_CMPUNORDSD

    ; { "cmppd", TOKEN_INSN, C_none, 0, I_CMPPD },
    TOK t_cmppd, TOKEN_INSN, C_none, 0, I_CMPPD

    ; { "comisd", TOKEN_INSN, C_none, 0, I_COMISD },
    TOK t_comisd, TOKEN_INSN, C_none, 0, I_COMISD

    ; { "cvtdq2pd", TOKEN_INSN, C_none, 0, I_CVTDQ2PD },
    TOK t_cvtdq2pd, TOKEN_INSN, C_none, 0, I_CVTDQ2PD

    ; { "cvtdq2ps", TOKEN_INSN, C_none, 0, I_CVTDQ2PS },
    TOK t_cvtdq2ps, TOKEN_INSN, C_none, 0, I_CVTDQ2PS

    ; { "cvtpd2dq", TOKEN_INSN, C_none, 0, I_CVTPD2DQ },
    TOK t_cvtpd2dq, TOKEN_INSN, C_none, 0, I_CVTPD2DQ

    ; { "cvtpd2pi", TOKEN_INSN, C_none, 0, I_CVTPD2PI },
    TOK t_cvtpd2pi, TOKEN_INSN, C_none, 0, I_CVTPD2PI

    ; { "cvtpd2ps", TOKEN_INSN, C_none, 0, I_CVTPD2PS },
    TOK t_cvtpd2ps, TOKEN_INSN, C_none, 0, I_CVTPD2PS

    ; { "cvtpi2pd", TOKEN_INSN, C_none, 0, I_CVTPI2PD },
    TOK t_cvtpi2pd, TOKEN_INSN, C_none, 0, I_CVTPI2PD

    ; { "cvtps2dq", TOKEN_INSN, C_none, 0, I_CVTPS2DQ },
    TOK t_cvtps2dq, TOKEN_INSN, C_none, 0, I_CVTPS2DQ

    ; { "cvtps2pd", TOKEN_INSN, C_none, 0, I_CVTPS2PD },
    TOK t_cvtps2pd, TOKEN_INSN, C_none, 0, I_CVTPS2PD

    ; { "cvtsd2si", TOKEN_INSN, C_none, 0, I_CVTSD2SI },
    TOK t_cvtsd2si, TOKEN_INSN, C_none, 0, I_CVTSD2SI

    ; { "cvtsd2ss", TOKEN_INSN, C_none, 0, I_CVTSD2SS },
    TOK t_cvtsd2ss, TOKEN_INSN, C_none, 0, I_CVTSD2SS

    ; { "cvtsi2sd", TOKEN_INSN, C_none, 0, I_CVTSI2SD },
    TOK t_cvtsi2sd, TOKEN_INSN, C_none, 0, I_CVTSI2SD

    ; { "cvtss2sd", TOKEN_INSN, C_none, 0, I_CVTSS2SD },
    TOK t_cvtss2sd, TOKEN_INSN, C_none, 0, I_CVTSS2SD

    ; { "cvttpd2pi", TOKEN_INSN, C_none, 0, I_CVTTPD2PI },
    TOK t_cvttpd2pi, TOKEN_INSN, C_none, 0, I_CVTTPD2PI

    ; { "cvttpd2dq", TOKEN_INSN, C_none, 0, I_CVTTPD2DQ },
    TOK t_cvttpd2dq, TOKEN_INSN, C_none, 0, I_CVTTPD2DQ

    ; { "cvttps2dq", TOKEN_INSN, C_none, 0, I_CVTTPS2DQ },
    TOK t_cvttps2dq, TOKEN_INSN, C_none, 0, I_CVTTPS2DQ

    ; { "cvttsd2si", TOKEN_INSN, C_none, 0, I_CVTTSD2SI },
    TOK t_cvttsd2si, TOKEN_INSN, C_none, 0, I_CVTTSD2SI

    ; { "divpd", TOKEN_INSN, C_none, 0, I_DIVPD },
    TOK t_divpd, TOKEN_INSN, C_none, 0, I_DIVPD

    ; { "divsd", TOKEN_INSN, C_none, 0, I_DIVSD },
    TOK t_divsd, TOKEN_INSN, C_none, 0, I_DIVSD

    ; { "maxpd", TOKEN_INSN, C_none, 0, I_MAXPD },
    TOK t_maxpd, TOKEN_INSN, C_none, 0, I_MAXPD

    ; { "maxsd", TOKEN_INSN, C_none, 0, I_MAXSD },
    TOK t_maxsd, TOKEN_INSN, C_none, 0, I_MAXSD

    ; { "minpd", TOKEN_INSN, C_none, 0, I_MINPD },
    TOK t_minpd, TOKEN_INSN, C_none, 0, I_MINPD

    ; { "minsd", TOKEN_INSN, C_none, 0, I_MINSD },
    TOK t_minsd, TOKEN_INSN, C_none, 0, I_MINSD

    ; { "movapd", TOKEN_INSN, C_none, 0, I_MOVAPD },
    TOK t_movapd, TOKEN_INSN, C_none, 0, I_MOVAPD

    ; { "movhpd", TOKEN_INSN, C_none, 0, I_MOVHPD },
    TOK t_movhpd, TOKEN_INSN, C_none, 0, I_MOVHPD

    ; { "movlpd", TOKEN_INSN, C_none, 0, I_MOVLPD },
    TOK t_movlpd, TOKEN_INSN, C_none, 0, I_MOVLPD

    ; { "movmskpd", TOKEN_INSN, C_none, 0, I_MOVMSKPD },
    TOK t_movmskpd, TOKEN_INSN, C_none, 0, I_MOVMSKPD

    ; { "movupd", TOKEN_INSN, C_none, 0, I_MOVUPD },
    TOK t_movupd, TOKEN_INSN, C_none, 0, I_MOVUPD

    ; { "mulpd", TOKEN_INSN, C_none, 0, I_MULPD },
    TOK t_mulpd, TOKEN_INSN, C_none, 0, I_MULPD

    ; { "mulsd", TOKEN_INSN, C_none, 0, I_MULSD },
    TOK t_mulsd, TOKEN_INSN, C_none, 0, I_MULSD

    ; { "orpd", TOKEN_INSN, C_none, 0, I_ORPD },
    TOK t_orpd, TOKEN_INSN, C_none, 0, I_ORPD

    ; { "shufpd", TOKEN_INSN, C_none, 0, I_SHUFPD },
    TOK t_shufpd, TOKEN_INSN, C_none, 0, I_SHUFPD

    ; { "sqrtpd", TOKEN_INSN, C_none, 0, I_SQRTPD },
    TOK t_sqrtpd, TOKEN_INSN, C_none, 0, I_SQRTPD

    ; { "sqrtsd", TOKEN_INSN, C_none, 0, I_SQRTSD },
    TOK t_sqrtsd, TOKEN_INSN, C_none, 0, I_SQRTSD

    ; { "subpd", TOKEN_INSN, C_none, 0, I_SUBPD },
    TOK t_subpd, TOKEN_INSN, C_none, 0, I_SUBPD

    ; { "subsd", TOKEN_INSN, C_none, 0, I_SUBSD },
    TOK t_subsd, TOKEN_INSN, C_none, 0, I_SUBSD

    ; { "ucomisd", TOKEN_INSN, C_none, 0, I_UCOMISD },
    TOK t_ucomisd, TOKEN_INSN, C_none, 0, I_UCOMISD

    ; { "unpckhpd", TOKEN_INSN, C_none, 0, I_UNPCKHPD },
    TOK t_unpckhpd, TOKEN_INSN, C_none, 0, I_UNPCKHPD

    ; { "unpcklpd", TOKEN_INSN, C_none, 0, I_UNPCKLPD },
    TOK t_unpcklpd, TOKEN_INSN, C_none, 0, I_UNPCKLPD

    ; { "xorpd", TOKEN_INSN, C_none, 0, I_XORPD },
    TOK t_xorpd, TOKEN_INSN, C_none, 0, I_XORPD

    ; { "addsubpd", TOKEN_INSN, C_none, 0, I_ADDSUBPD },
    TOK t_addsubpd, TOKEN_INSN, C_none, 0, I_ADDSUBPD

    ; { "addsubps", TOKEN_INSN, C_none, 0, I_ADDSUBPS },
    TOK t_addsubps, TOKEN_INSN, C_none, 0, I_ADDSUBPS

    ; { "haddpd", TOKEN_INSN, C_none, 0, I_HADDPD },
    TOK t_haddpd, TOKEN_INSN, C_none, 0, I_HADDPD

    ; { "haddps", TOKEN_INSN, C_none, 0, I_HADDPS },
    TOK t_haddps, TOKEN_INSN, C_none, 0, I_HADDPS

    ; { "hsubpd", TOKEN_INSN, C_none, 0, I_HSUBPD },
    TOK t_hsubpd, TOKEN_INSN, C_none, 0, I_HSUBPD

    ; { "hsubps", TOKEN_INSN, C_none, 0, I_HSUBPS },
    TOK t_hsubps, TOKEN_INSN, C_none, 0, I_HSUBPS

    ; { "lddqu", TOKEN_INSN, C_none, 0, I_LDDQU },
    TOK t_lddqu, TOKEN_INSN, C_none, 0, I_LDDQU

    ; { "movddup", TOKEN_INSN, C_none, 0, I_MOVDDUP },
    TOK t_movddup, TOKEN_INSN, C_none, 0, I_MOVDDUP

    ; { "movshdup", TOKEN_INSN, C_none, 0, I_MOVSHDUP },
    TOK t_movshdup, TOKEN_INSN, C_none, 0, I_MOVSHDUP

    ; { "movsldup", TOKEN_INSN, C_none, 0, I_MOVSLDUP },
    TOK t_movsldup, TOKEN_INSN, C_none, 0, I_MOVSLDUP

    ; { "clgi", TOKEN_INSN, C_none, 0, I_CLGI },
    TOK t_clgi, TOKEN_INSN, C_none, 0, I_CLGI

    ; { "stgi", TOKEN_INSN, C_none, 0, I_STGI },
    TOK t_stgi, TOKEN_INSN, C_none, 0, I_STGI

    ; { "vmcall", TOKEN_INSN, C_none, 0, I_VMCALL },
    TOK t_vmcall, TOKEN_INSN, C_none, 0, I_VMCALL

    ; { "vmclear", TOKEN_INSN, C_none, 0, I_VMCLEAR },
    TOK t_vmclear, TOKEN_INSN, C_none, 0, I_VMCLEAR

    ; { "vmfunc", TOKEN_INSN, C_none, 0, I_VMFUNC },
    TOK t_vmfunc, TOKEN_INSN, C_none, 0, I_VMFUNC

    ; { "vmlaunch", TOKEN_INSN, C_none, 0, I_VMLAUNCH },
    TOK t_vmlaunch, TOKEN_INSN, C_none, 0, I_VMLAUNCH

    ; { "vmload", TOKEN_INSN, C_none, 0, I_VMLOAD },
    TOK t_vmload, TOKEN_INSN, C_none, 0, I_VMLOAD

    ; { "vmmcall", TOKEN_INSN, C_none, 0, I_VMMCALL },
    TOK t_vmmcall, TOKEN_INSN, C_none, 0, I_VMMCALL

    ; { "vmptrld", TOKEN_INSN, C_none, 0, I_VMPTRLD },
    TOK t_vmptrld, TOKEN_INSN, C_none, 0, I_VMPTRLD

    ; { "vmptrst", TOKEN_INSN, C_none, 0, I_VMPTRST },
    TOK t_vmptrst, TOKEN_INSN, C_none, 0, I_VMPTRST

    ; { "vmread", TOKEN_INSN, C_none, 0, I_VMREAD },
    TOK t_vmread, TOKEN_INSN, C_none, 0, I_VMREAD

    ; { "vmresume", TOKEN_INSN, C_none, 0, I_VMRESUME },
    TOK t_vmresume, TOKEN_INSN, C_none, 0, I_VMRESUME

    ; { "vmrun", TOKEN_INSN, C_none, 0, I_VMRUN },
    TOK t_vmrun, TOKEN_INSN, C_none, 0, I_VMRUN

    ; { "vmsave", TOKEN_INSN, C_none, 0, I_VMSAVE },
    TOK t_vmsave, TOKEN_INSN, C_none, 0, I_VMSAVE

    ; { "vmwrite", TOKEN_INSN, C_none, 0, I_VMWRITE },
    TOK t_vmwrite, TOKEN_INSN, C_none, 0, I_VMWRITE

    ; { "vmxoff", TOKEN_INSN, C_none, 0, I_VMXOFF },
    TOK t_vmxoff, TOKEN_INSN, C_none, 0, I_VMXOFF

    ; { "vmxon", TOKEN_INSN, C_none, 0, I_VMXON },
    TOK t_vmxon, TOKEN_INSN, C_none, 0, I_VMXON

    ; { "invept", TOKEN_INSN, C_none, 0, I_INVEPT },
    TOK t_invept, TOKEN_INSN, C_none, 0, I_INVEPT

    ; { "invvpid", TOKEN_INSN, C_none, 0, I_INVVPID },
    TOK t_invvpid, TOKEN_INSN, C_none, 0, I_INVVPID

    ; { "pabsb", TOKEN_INSN, C_none, 0, I_PABSB },
    TOK t_pabsb, TOKEN_INSN, C_none, 0, I_PABSB

    ; { "pabsw", TOKEN_INSN, C_none, 0, I_PABSW },
    TOK t_pabsw, TOKEN_INSN, C_none, 0, I_PABSW

    ; { "pabsd", TOKEN_INSN, C_none, 0, I_PABSD },
    TOK t_pabsd, TOKEN_INSN, C_none, 0, I_PABSD

    ; { "palignr", TOKEN_INSN, C_none, 0, I_PALIGNR },
    TOK t_palignr, TOKEN_INSN, C_none, 0, I_PALIGNR

    ; { "phaddw", TOKEN_INSN, C_none, 0, I_PHADDW },
    TOK t_phaddw, TOKEN_INSN, C_none, 0, I_PHADDW

    ; { "phaddd", TOKEN_INSN, C_none, 0, I_PHADDD },
    TOK t_phaddd, TOKEN_INSN, C_none, 0, I_PHADDD

    ; { "phaddsw", TOKEN_INSN, C_none, 0, I_PHADDSW },
    TOK t_phaddsw, TOKEN_INSN, C_none, 0, I_PHADDSW

    ; { "phsubw", TOKEN_INSN, C_none, 0, I_PHSUBW },
    TOK t_phsubw, TOKEN_INSN, C_none, 0, I_PHSUBW

    ; { "phsubd", TOKEN_INSN, C_none, 0, I_PHSUBD },
    TOK t_phsubd, TOKEN_INSN, C_none, 0, I_PHSUBD

    ; { "phsubsw", TOKEN_INSN, C_none, 0, I_PHSUBSW },
    TOK t_phsubsw, TOKEN_INSN, C_none, 0, I_PHSUBSW

    ; { "pmaddubsw", TOKEN_INSN, C_none, 0, I_PMADDUBSW },
    TOK t_pmaddubsw, TOKEN_INSN, C_none, 0, I_PMADDUBSW

    ; { "pmulhrsw", TOKEN_INSN, C_none, 0, I_PMULHRSW },
    TOK t_pmulhrsw, TOKEN_INSN, C_none, 0, I_PMULHRSW

    ; { "pshufb", TOKEN_INSN, C_none, 0, I_PSHUFB },
    TOK t_pshufb, TOKEN_INSN, C_none, 0, I_PSHUFB

    ; { "psignb", TOKEN_INSN, C_none, 0, I_PSIGNB },
    TOK t_psignb, TOKEN_INSN, C_none, 0, I_PSIGNB

    ; { "psignw", TOKEN_INSN, C_none, 0, I_PSIGNW },
    TOK t_psignw, TOKEN_INSN, C_none, 0, I_PSIGNW

    ; { "psignd", TOKEN_INSN, C_none, 0, I_PSIGND },
    TOK t_psignd, TOKEN_INSN, C_none, 0, I_PSIGND

    ; { "extrq", TOKEN_INSN, C_none, 0, I_EXTRQ },
    TOK t_extrq, TOKEN_INSN, C_none, 0, I_EXTRQ

    ; { "insertq", TOKEN_INSN, C_none, 0, I_INSERTQ },
    TOK t_insertq, TOKEN_INSN, C_none, 0, I_INSERTQ

    ; { "movntsd", TOKEN_INSN, C_none, 0, I_MOVNTSD },
    TOK t_movntsd, TOKEN_INSN, C_none, 0, I_MOVNTSD

    ; { "movntss", TOKEN_INSN, C_none, 0, I_MOVNTSS },
    TOK t_movntss, TOKEN_INSN, C_none, 0, I_MOVNTSS

    ; { "lzcnt", TOKEN_INSN, C_none, 0, I_LZCNT },
    TOK t_lzcnt, TOKEN_INSN, C_none, 0, I_LZCNT

    ; { "blendpd", TOKEN_INSN, C_none, 0, I_BLENDPD },
    TOK t_blendpd, TOKEN_INSN, C_none, 0, I_BLENDPD

    ; { "blendps", TOKEN_INSN, C_none, 0, I_BLENDPS },
    TOK t_blendps, TOKEN_INSN, C_none, 0, I_BLENDPS

    ; { "blendvpd", TOKEN_INSN, C_none, 0, I_BLENDVPD },
    TOK t_blendvpd, TOKEN_INSN, C_none, 0, I_BLENDVPD

    ; { "blendvps", TOKEN_INSN, C_none, 0, I_BLENDVPS },
    TOK t_blendvps, TOKEN_INSN, C_none, 0, I_BLENDVPS

    ; { "dppd", TOKEN_INSN, C_none, 0, I_DPPD },
    TOK t_dppd, TOKEN_INSN, C_none, 0, I_DPPD

    ; { "dpps", TOKEN_INSN, C_none, 0, I_DPPS },
    TOK t_dpps, TOKEN_INSN, C_none, 0, I_DPPS

    ; { "extractps", TOKEN_INSN, C_none, 0, I_EXTRACTPS },
    TOK t_extractps, TOKEN_INSN, C_none, 0, I_EXTRACTPS

    ; { "insertps", TOKEN_INSN, C_none, 0, I_INSERTPS },
    TOK t_insertps, TOKEN_INSN, C_none, 0, I_INSERTPS

    ; { "movntdqa", TOKEN_INSN, C_none, 0, I_MOVNTDQA },
    TOK t_movntdqa, TOKEN_INSN, C_none, 0, I_MOVNTDQA

    ; { "mpsadbw", TOKEN_INSN, C_none, 0, I_MPSADBW },
    TOK t_mpsadbw, TOKEN_INSN, C_none, 0, I_MPSADBW

    ; { "packusdw", TOKEN_INSN, C_none, 0, I_PACKUSDW },
    TOK t_packusdw, TOKEN_INSN, C_none, 0, I_PACKUSDW

    ; { "pblendvb", TOKEN_INSN, C_none, 0, I_PBLENDVB },
    TOK t_pblendvb, TOKEN_INSN, C_none, 0, I_PBLENDVB

    ; { "pblendw", TOKEN_INSN, C_none, 0, I_PBLENDW },
    TOK t_pblendw, TOKEN_INSN, C_none, 0, I_PBLENDW

    ; { "pcmpeqq", TOKEN_INSN, C_none, 0, I_PCMPEQQ },
    TOK t_pcmpeqq, TOKEN_INSN, C_none, 0, I_PCMPEQQ

    ; { "pextrb", TOKEN_INSN, C_none, 0, I_PEXTRB },
    TOK t_pextrb, TOKEN_INSN, C_none, 0, I_PEXTRB

    ; { "pextrd", TOKEN_INSN, C_none, 0, I_PEXTRD },
    TOK t_pextrd, TOKEN_INSN, C_none, 0, I_PEXTRD

    ; { "pextrq", TOKEN_INSN, C_none, 0, I_PEXTRQ },
    TOK t_pextrq, TOKEN_INSN, C_none, 0, I_PEXTRQ

    ; { "phminposuw", TOKEN_INSN, C_none, 0, I_PHMINPOSUW },
    TOK t_phminposuw, TOKEN_INSN, C_none, 0, I_PHMINPOSUW

    ; { "pinsrb", TOKEN_INSN, C_none, 0, I_PINSRB },
    TOK t_pinsrb, TOKEN_INSN, C_none, 0, I_PINSRB

    ; { "pinsrd", TOKEN_INSN, C_none, 0, I_PINSRD },
    TOK t_pinsrd, TOKEN_INSN, C_none, 0, I_PINSRD

    ; { "pinsrq", TOKEN_INSN, C_none, 0, I_PINSRQ },
    TOK t_pinsrq, TOKEN_INSN, C_none, 0, I_PINSRQ

    ; { "pmaxsb", TOKEN_INSN, C_none, 0, I_PMAXSB },
    TOK t_pmaxsb, TOKEN_INSN, C_none, 0, I_PMAXSB

    ; { "pmaxsd", TOKEN_INSN, C_none, 0, I_PMAXSD },
    TOK t_pmaxsd, TOKEN_INSN, C_none, 0, I_PMAXSD

    ; { "pmaxud", TOKEN_INSN, C_none, 0, I_PMAXUD },
    TOK t_pmaxud, TOKEN_INSN, C_none, 0, I_PMAXUD

    ; { "pmaxuw", TOKEN_INSN, C_none, 0, I_PMAXUW },
    TOK t_pmaxuw, TOKEN_INSN, C_none, 0, I_PMAXUW

    ; { "pminsb", TOKEN_INSN, C_none, 0, I_PMINSB },
    TOK t_pminsb, TOKEN_INSN, C_none, 0, I_PMINSB

    ; { "pminsd", TOKEN_INSN, C_none, 0, I_PMINSD },
    TOK t_pminsd, TOKEN_INSN, C_none, 0, I_PMINSD

    ; { "pminud", TOKEN_INSN, C_none, 0, I_PMINUD },
    TOK t_pminud, TOKEN_INSN, C_none, 0, I_PMINUD

    ; { "pminuw", TOKEN_INSN, C_none, 0, I_PMINUW },
    TOK t_pminuw, TOKEN_INSN, C_none, 0, I_PMINUW

    ; { "pmovsxbw", TOKEN_INSN, C_none, 0, I_PMOVSXBW },
    TOK t_pmovsxbw, TOKEN_INSN, C_none, 0, I_PMOVSXBW

    ; { "pmovsxbd", TOKEN_INSN, C_none, 0, I_PMOVSXBD },
    TOK t_pmovsxbd, TOKEN_INSN, C_none, 0, I_PMOVSXBD

    ; { "pmovsxbq", TOKEN_INSN, C_none, 0, I_PMOVSXBQ },
    TOK t_pmovsxbq, TOKEN_INSN, C_none, 0, I_PMOVSXBQ

    ; { "pmovsxwd", TOKEN_INSN, C_none, 0, I_PMOVSXWD },
    TOK t_pmovsxwd, TOKEN_INSN, C_none, 0, I_PMOVSXWD

    ; { "pmovsxwq", TOKEN_INSN, C_none, 0, I_PMOVSXWQ },
    TOK t_pmovsxwq, TOKEN_INSN, C_none, 0, I_PMOVSXWQ

    ; { "pmovsxdq", TOKEN_INSN, C_none, 0, I_PMOVSXDQ },
    TOK t_pmovsxdq, TOKEN_INSN, C_none, 0, I_PMOVSXDQ

    ; { "pmovzxbw", TOKEN_INSN, C_none, 0, I_PMOVZXBW },
    TOK t_pmovzxbw, TOKEN_INSN, C_none, 0, I_PMOVZXBW

    ; { "pmovzxbd", TOKEN_INSN, C_none, 0, I_PMOVZXBD },
    TOK t_pmovzxbd, TOKEN_INSN, C_none, 0, I_PMOVZXBD

    ; { "pmovzxbq", TOKEN_INSN, C_none, 0, I_PMOVZXBQ },
    TOK t_pmovzxbq, TOKEN_INSN, C_none, 0, I_PMOVZXBQ

    ; { "pmovzxwd", TOKEN_INSN, C_none, 0, I_PMOVZXWD },
    TOK t_pmovzxwd, TOKEN_INSN, C_none, 0, I_PMOVZXWD

    ; { "pmovzxwq", TOKEN_INSN, C_none, 0, I_PMOVZXWQ },
    TOK t_pmovzxwq, TOKEN_INSN, C_none, 0, I_PMOVZXWQ

    ; { "pmovzxdq", TOKEN_INSN, C_none, 0, I_PMOVZXDQ },
    TOK t_pmovzxdq, TOKEN_INSN, C_none, 0, I_PMOVZXDQ

    ; { "pmuldq", TOKEN_INSN, C_none, 0, I_PMULDQ },
    TOK t_pmuldq, TOKEN_INSN, C_none, 0, I_PMULDQ

    ; { "pmulld", TOKEN_INSN, C_none, 0, I_PMULLD },
    TOK t_pmulld, TOKEN_INSN, C_none, 0, I_PMULLD

    ; { "ptest", TOKEN_INSN, C_none, 0, I_PTEST },
    TOK t_ptest, TOKEN_INSN, C_none, 0, I_PTEST

    ; { "roundpd", TOKEN_INSN, C_none, 0, I_ROUNDPD },
    TOK t_roundpd, TOKEN_INSN, C_none, 0, I_ROUNDPD

    ; { "roundps", TOKEN_INSN, C_none, 0, I_ROUNDPS },
    TOK t_roundps, TOKEN_INSN, C_none, 0, I_ROUNDPS

    ; { "roundsd", TOKEN_INSN, C_none, 0, I_ROUNDSD },
    TOK t_roundsd, TOKEN_INSN, C_none, 0, I_ROUNDSD

    ; { "roundss", TOKEN_INSN, C_none, 0, I_ROUNDSS },
    TOK t_roundss, TOKEN_INSN, C_none, 0, I_ROUNDSS

    ; { "crc32", TOKEN_INSN, C_none, 0, I_CRC32 },
    TOK t_crc32, TOKEN_INSN, C_none, 0, I_CRC32

    ; { "pcmpestri", TOKEN_INSN, C_none, 0, I_PCMPESTRI },
    TOK t_pcmpestri, TOKEN_INSN, C_none, 0, I_PCMPESTRI

    ; { "pcmpestrm", TOKEN_INSN, C_none, 0, I_PCMPESTRM },
    TOK t_pcmpestrm, TOKEN_INSN, C_none, 0, I_PCMPESTRM

    ; { "pcmpistri", TOKEN_INSN, C_none, 0, I_PCMPISTRI },
    TOK t_pcmpistri, TOKEN_INSN, C_none, 0, I_PCMPISTRI

    ; { "pcmpistrm", TOKEN_INSN, C_none, 0, I_PCMPISTRM },
    TOK t_pcmpistrm, TOKEN_INSN, C_none, 0, I_PCMPISTRM

    ; { "pcmpgtq", TOKEN_INSN, C_none, 0, I_PCMPGTQ },
    TOK t_pcmpgtq, TOKEN_INSN, C_none, 0, I_PCMPGTQ

    ; { "popcnt", TOKEN_INSN, C_none, 0, I_POPCNT },
    TOK t_popcnt, TOKEN_INSN, C_none, 0, I_POPCNT

    ; { "getsec", TOKEN_INSN, C_none, 0, I_GETSEC },
    TOK t_getsec, TOKEN_INSN, C_none, 0, I_GETSEC

    ; { "pfrcpv", TOKEN_INSN, C_none, 0, I_PFRCPV },
    TOK t_pfrcpv, TOKEN_INSN, C_none, 0, I_PFRCPV

    ; { "pfrsqrtv", TOKEN_INSN, C_none, 0, I_PFRSQRTV },
    TOK t_pfrsqrtv, TOKEN_INSN, C_none, 0, I_PFRSQRTV

    ; { "movbe", TOKEN_INSN, C_none, 0, I_MOVBE },
    TOK t_movbe, TOKEN_INSN, C_none, 0, I_MOVBE

    ; { "aesenc", TOKEN_INSN, C_none, 0, I_AESENC },
    TOK t_aesenc, TOKEN_INSN, C_none, 0, I_AESENC

    ; { "aesenclast", TOKEN_INSN, C_none, 0, I_AESENCLAST },
    TOK t_aesenclast, TOKEN_INSN, C_none, 0, I_AESENCLAST

    ; { "aesdec", TOKEN_INSN, C_none, 0, I_AESDEC },
    TOK t_aesdec, TOKEN_INSN, C_none, 0, I_AESDEC

    ; { "aesdeclast", TOKEN_INSN, C_none, 0, I_AESDECLAST },
    TOK t_aesdeclast, TOKEN_INSN, C_none, 0, I_AESDECLAST

    ; { "aesimc", TOKEN_INSN, C_none, 0, I_AESIMC },
    TOK t_aesimc, TOKEN_INSN, C_none, 0, I_AESIMC

    ; { "aeskeygenassist", TOKEN_INSN, C_none, 0, I_AESKEYGENASSIST },
    TOK t_aeskeygenassist, TOKEN_INSN, C_none, 0, I_AESKEYGENASSIST

    ; { "vaesenc", TOKEN_INSN, C_none, 0, I_VAESENC },
    TOK t_vaesenc, TOKEN_INSN, C_none, 0, I_VAESENC

    ; { "vaesenclast", TOKEN_INSN, C_none, 0, I_VAESENCLAST },
    TOK t_vaesenclast, TOKEN_INSN, C_none, 0, I_VAESENCLAST

    ; { "vaesdec", TOKEN_INSN, C_none, 0, I_VAESDEC },
    TOK t_vaesdec, TOKEN_INSN, C_none, 0, I_VAESDEC

    ; { "vaesdeclast", TOKEN_INSN, C_none, 0, I_VAESDECLAST },
    TOK t_vaesdeclast, TOKEN_INSN, C_none, 0, I_VAESDECLAST

    ; { "vaesimc", TOKEN_INSN, C_none, 0, I_VAESIMC },
    TOK t_vaesimc, TOKEN_INSN, C_none, 0, I_VAESIMC

    ; { "vaeskeygenassist", TOKEN_INSN, C_none, 0, I_VAESKEYGENASSIST },
    TOK t_vaeskeygenassist, TOKEN_INSN, C_none, 0, I_VAESKEYGENASSIST

    ; { "vaddpd", TOKEN_INSN, C_none, 0, I_VADDPD },
    TOK t_vaddpd, TOKEN_INSN, C_none, 0, I_VADDPD

    ; { "vaddps", TOKEN_INSN, C_none, 0, I_VADDPS },
    TOK t_vaddps, TOKEN_INSN, C_none, 0, I_VADDPS

    ; { "vaddsd", TOKEN_INSN, C_none, 0, I_VADDSD },
    TOK t_vaddsd, TOKEN_INSN, C_none, 0, I_VADDSD

    ; { "vaddss", TOKEN_INSN, C_none, 0, I_VADDSS },
    TOK t_vaddss, TOKEN_INSN, C_none, 0, I_VADDSS

    ; { "vaddsubpd", TOKEN_INSN, C_none, 0, I_VADDSUBPD },
    TOK t_vaddsubpd, TOKEN_INSN, C_none, 0, I_VADDSUBPD

    ; { "vaddsubps", TOKEN_INSN, C_none, 0, I_VADDSUBPS },
    TOK t_vaddsubps, TOKEN_INSN, C_none, 0, I_VADDSUBPS

    ; { "vandpd", TOKEN_INSN, C_none, 0, I_VANDPD },
    TOK t_vandpd, TOKEN_INSN, C_none, 0, I_VANDPD

    ; { "vandps", TOKEN_INSN, C_none, 0, I_VANDPS },
    TOK t_vandps, TOKEN_INSN, C_none, 0, I_VANDPS

    ; { "vandnpd", TOKEN_INSN, C_none, 0, I_VANDNPD },
    TOK t_vandnpd, TOKEN_INSN, C_none, 0, I_VANDNPD

    ; { "vandnps", TOKEN_INSN, C_none, 0, I_VANDNPS },
    TOK t_vandnps, TOKEN_INSN, C_none, 0, I_VANDNPS

    ; { "vblendpd", TOKEN_INSN, C_none, 0, I_VBLENDPD },
    TOK t_vblendpd, TOKEN_INSN, C_none, 0, I_VBLENDPD

    ; { "vblendps", TOKEN_INSN, C_none, 0, I_VBLENDPS },
    TOK t_vblendps, TOKEN_INSN, C_none, 0, I_VBLENDPS

    ; { "vblendvpd", TOKEN_INSN, C_none, 0, I_VBLENDVPD },
    TOK t_vblendvpd, TOKEN_INSN, C_none, 0, I_VBLENDVPD

    ; { "vblendvps", TOKEN_INSN, C_none, 0, I_VBLENDVPS },
    TOK t_vblendvps, TOKEN_INSN, C_none, 0, I_VBLENDVPS

    ; { "vbroadcastss", TOKEN_INSN, C_none, 0, I_VBROADCASTSS },
    TOK t_vbroadcastss, TOKEN_INSN, C_none, 0, I_VBROADCASTSS

    ; { "vbroadcastsd", TOKEN_INSN, C_none, 0, I_VBROADCASTSD },
    TOK t_vbroadcastsd, TOKEN_INSN, C_none, 0, I_VBROADCASTSD

    ; { "vbroadcastf128", TOKEN_INSN, C_none, 0, I_VBROADCASTF128 },
    TOK t_vbroadcastf128, TOKEN_INSN, C_none, 0, I_VBROADCASTF128

    ; { "vcmpeq_ospd", TOKEN_INSN, C_none, 0, I_VCMPEQ_OSPD },
    TOK t_vcmpeq_ospd, TOKEN_INSN, C_none, 0, I_VCMPEQ_OSPD

    ; { "vcmpeqpd", TOKEN_INSN, C_none, 0, I_VCMPEQPD },
    TOK t_vcmpeqpd, TOKEN_INSN, C_none, 0, I_VCMPEQPD

    ; { "vcmplt_ospd", TOKEN_INSN, C_none, 0, I_VCMPLT_OSPD },
    TOK t_vcmplt_ospd, TOKEN_INSN, C_none, 0, I_VCMPLT_OSPD

    ; { "vcmpltpd", TOKEN_INSN, C_none, 0, I_VCMPLTPD },
    TOK t_vcmpltpd, TOKEN_INSN, C_none, 0, I_VCMPLTPD

    ; { "vcmple_ospd", TOKEN_INSN, C_none, 0, I_VCMPLE_OSPD },
    TOK t_vcmple_ospd, TOKEN_INSN, C_none, 0, I_VCMPLE_OSPD

    ; { "vcmplepd", TOKEN_INSN, C_none, 0, I_VCMPLEPD },
    TOK t_vcmplepd, TOKEN_INSN, C_none, 0, I_VCMPLEPD

    ; { "vcmpunord_qpd", TOKEN_INSN, C_none, 0, I_VCMPUNORD_QPD },
    TOK t_vcmpunord_qpd, TOKEN_INSN, C_none, 0, I_VCMPUNORD_QPD

    ; { "vcmpunordpd", TOKEN_INSN, C_none, 0, I_VCMPUNORDPD },
    TOK t_vcmpunordpd, TOKEN_INSN, C_none, 0, I_VCMPUNORDPD

    ; { "vcmpneq_uqpd", TOKEN_INSN, C_none, 0, I_VCMPNEQ_UQPD },
    TOK t_vcmpneq_uqpd, TOKEN_INSN, C_none, 0, I_VCMPNEQ_UQPD

    ; { "vcmpneqpd", TOKEN_INSN, C_none, 0, I_VCMPNEQPD },
    TOK t_vcmpneqpd, TOKEN_INSN, C_none, 0, I_VCMPNEQPD

    ; { "vcmpnlt_uspd", TOKEN_INSN, C_none, 0, I_VCMPNLT_USPD },
    TOK t_vcmpnlt_uspd, TOKEN_INSN, C_none, 0, I_VCMPNLT_USPD

    ; { "vcmpnltpd", TOKEN_INSN, C_none, 0, I_VCMPNLTPD },
    TOK t_vcmpnltpd, TOKEN_INSN, C_none, 0, I_VCMPNLTPD

    ; { "vcmpnle_uspd", TOKEN_INSN, C_none, 0, I_VCMPNLE_USPD },
    TOK t_vcmpnle_uspd, TOKEN_INSN, C_none, 0, I_VCMPNLE_USPD

    ; { "vcmpnlepd", TOKEN_INSN, C_none, 0, I_VCMPNLEPD },
    TOK t_vcmpnlepd, TOKEN_INSN, C_none, 0, I_VCMPNLEPD

    ; { "vcmpord_qpd", TOKEN_INSN, C_none, 0, I_VCMPORD_QPD },
    TOK t_vcmpord_qpd, TOKEN_INSN, C_none, 0, I_VCMPORD_QPD

    ; { "vcmpordpd", TOKEN_INSN, C_none, 0, I_VCMPORDPD },
    TOK t_vcmpordpd, TOKEN_INSN, C_none, 0, I_VCMPORDPD

    ; { "vcmpeq_uqpd", TOKEN_INSN, C_none, 0, I_VCMPEQ_UQPD },
    TOK t_vcmpeq_uqpd, TOKEN_INSN, C_none, 0, I_VCMPEQ_UQPD

    ; { "vcmpnge_uspd", TOKEN_INSN, C_none, 0, I_VCMPNGE_USPD },
    TOK t_vcmpnge_uspd, TOKEN_INSN, C_none, 0, I_VCMPNGE_USPD

    ; { "vcmpngepd", TOKEN_INSN, C_none, 0, I_VCMPNGEPD },
    TOK t_vcmpngepd, TOKEN_INSN, C_none, 0, I_VCMPNGEPD

    ; { "vcmpngt_uspd", TOKEN_INSN, C_none, 0, I_VCMPNGT_USPD },
    TOK t_vcmpngt_uspd, TOKEN_INSN, C_none, 0, I_VCMPNGT_USPD

    ; { "vcmpngtpd", TOKEN_INSN, C_none, 0, I_VCMPNGTPD },
    TOK t_vcmpngtpd, TOKEN_INSN, C_none, 0, I_VCMPNGTPD

    ; { "vcmpfalse_oqpd", TOKEN_INSN, C_none, 0, I_VCMPFALSE_OQPD },
    TOK t_vcmpfalse_oqpd, TOKEN_INSN, C_none, 0, I_VCMPFALSE_OQPD

    ; { "vcmpfalsepd", TOKEN_INSN, C_none, 0, I_VCMPFALSEPD },
    TOK t_vcmpfalsepd, TOKEN_INSN, C_none, 0, I_VCMPFALSEPD

    ; { "vcmpneq_oqpd", TOKEN_INSN, C_none, 0, I_VCMPNEQ_OQPD },
    TOK t_vcmpneq_oqpd, TOKEN_INSN, C_none, 0, I_VCMPNEQ_OQPD

    ; { "vcmpge_ospd", TOKEN_INSN, C_none, 0, I_VCMPGE_OSPD },
    TOK t_vcmpge_ospd, TOKEN_INSN, C_none, 0, I_VCMPGE_OSPD

    ; { "vcmpgepd", TOKEN_INSN, C_none, 0, I_VCMPGEPD },
    TOK t_vcmpgepd, TOKEN_INSN, C_none, 0, I_VCMPGEPD

    ; { "vcmpgt_ospd", TOKEN_INSN, C_none, 0, I_VCMPGT_OSPD },
    TOK t_vcmpgt_ospd, TOKEN_INSN, C_none, 0, I_VCMPGT_OSPD

    ; { "vcmpgtpd", TOKEN_INSN, C_none, 0, I_VCMPGTPD },
    TOK t_vcmpgtpd, TOKEN_INSN, C_none, 0, I_VCMPGTPD

    ; { "vcmptrue_uqpd", TOKEN_INSN, C_none, 0, I_VCMPTRUE_UQPD },
    TOK t_vcmptrue_uqpd, TOKEN_INSN, C_none, 0, I_VCMPTRUE_UQPD

    ; { "vcmptruepd", TOKEN_INSN, C_none, 0, I_VCMPTRUEPD },
    TOK t_vcmptruepd, TOKEN_INSN, C_none, 0, I_VCMPTRUEPD

    ; { "vcmplt_oqpd", TOKEN_INSN, C_none, 0, I_VCMPLT_OQPD },
    TOK t_vcmplt_oqpd, TOKEN_INSN, C_none, 0, I_VCMPLT_OQPD

    ; { "vcmple_oqpd", TOKEN_INSN, C_none, 0, I_VCMPLE_OQPD },
    TOK t_vcmple_oqpd, TOKEN_INSN, C_none, 0, I_VCMPLE_OQPD

    ; { "vcmpunord_spd", TOKEN_INSN, C_none, 0, I_VCMPUNORD_SPD },
    TOK t_vcmpunord_spd, TOKEN_INSN, C_none, 0, I_VCMPUNORD_SPD

    ; { "vcmpneq_uspd", TOKEN_INSN, C_none, 0, I_VCMPNEQ_USPD },
    TOK t_vcmpneq_uspd, TOKEN_INSN, C_none, 0, I_VCMPNEQ_USPD

    ; { "vcmpnlt_uqpd", TOKEN_INSN, C_none, 0, I_VCMPNLT_UQPD },
    TOK t_vcmpnlt_uqpd, TOKEN_INSN, C_none, 0, I_VCMPNLT_UQPD

    ; { "vcmpnle_uqpd", TOKEN_INSN, C_none, 0, I_VCMPNLE_UQPD },
    TOK t_vcmpnle_uqpd, TOKEN_INSN, C_none, 0, I_VCMPNLE_UQPD

    ; { "vcmpord_spd", TOKEN_INSN, C_none, 0, I_VCMPORD_SPD },
    TOK t_vcmpord_spd, TOKEN_INSN, C_none, 0, I_VCMPORD_SPD

    ; { "vcmpeq_uspd", TOKEN_INSN, C_none, 0, I_VCMPEQ_USPD },
    TOK t_vcmpeq_uspd, TOKEN_INSN, C_none, 0, I_VCMPEQ_USPD

    ; { "vcmpnge_uqpd", TOKEN_INSN, C_none, 0, I_VCMPNGE_UQPD },
    TOK t_vcmpnge_uqpd, TOKEN_INSN, C_none, 0, I_VCMPNGE_UQPD

    ; { "vcmpngt_uqpd", TOKEN_INSN, C_none, 0, I_VCMPNGT_UQPD },
    TOK t_vcmpngt_uqpd, TOKEN_INSN, C_none, 0, I_VCMPNGT_UQPD

    ; { "vcmpfalse_ospd", TOKEN_INSN, C_none, 0, I_VCMPFALSE_OSPD },
    TOK t_vcmpfalse_ospd, TOKEN_INSN, C_none, 0, I_VCMPFALSE_OSPD

    ; { "vcmpneq_ospd", TOKEN_INSN, C_none, 0, I_VCMPNEQ_OSPD },
    TOK t_vcmpneq_ospd, TOKEN_INSN, C_none, 0, I_VCMPNEQ_OSPD

    ; { "vcmpge_oqpd", TOKEN_INSN, C_none, 0, I_VCMPGE_OQPD },
    TOK t_vcmpge_oqpd, TOKEN_INSN, C_none, 0, I_VCMPGE_OQPD

    ; { "vcmpgt_oqpd", TOKEN_INSN, C_none, 0, I_VCMPGT_OQPD },
    TOK t_vcmpgt_oqpd, TOKEN_INSN, C_none, 0, I_VCMPGT_OQPD

    ; { "vcmptrue_uspd", TOKEN_INSN, C_none, 0, I_VCMPTRUE_USPD },
    TOK t_vcmptrue_uspd, TOKEN_INSN, C_none, 0, I_VCMPTRUE_USPD

    ; { "vcmppd", TOKEN_INSN, C_none, 0, I_VCMPPD },
    TOK t_vcmppd, TOKEN_INSN, C_none, 0, I_VCMPPD

    ; { "vcmpeq_osps", TOKEN_INSN, C_none, 0, I_VCMPEQ_OSPS },
    TOK t_vcmpeq_osps, TOKEN_INSN, C_none, 0, I_VCMPEQ_OSPS

    ; { "vcmpeqps", TOKEN_INSN, C_none, 0, I_VCMPEQPS },
    TOK t_vcmpeqps, TOKEN_INSN, C_none, 0, I_VCMPEQPS

    ; { "vcmplt_osps", TOKEN_INSN, C_none, 0, I_VCMPLT_OSPS },
    TOK t_vcmplt_osps, TOKEN_INSN, C_none, 0, I_VCMPLT_OSPS

    ; { "vcmpltps", TOKEN_INSN, C_none, 0, I_VCMPLTPS },
    TOK t_vcmpltps, TOKEN_INSN, C_none, 0, I_VCMPLTPS

    ; { "vcmple_osps", TOKEN_INSN, C_none, 0, I_VCMPLE_OSPS },
    TOK t_vcmple_osps, TOKEN_INSN, C_none, 0, I_VCMPLE_OSPS

    ; { "vcmpleps", TOKEN_INSN, C_none, 0, I_VCMPLEPS },
    TOK t_vcmpleps, TOKEN_INSN, C_none, 0, I_VCMPLEPS

    ; { "vcmpunord_qps", TOKEN_INSN, C_none, 0, I_VCMPUNORD_QPS },
    TOK t_vcmpunord_qps, TOKEN_INSN, C_none, 0, I_VCMPUNORD_QPS

    ; { "vcmpunordps", TOKEN_INSN, C_none, 0, I_VCMPUNORDPS },
    TOK t_vcmpunordps, TOKEN_INSN, C_none, 0, I_VCMPUNORDPS

    ; { "vcmpneq_uqps", TOKEN_INSN, C_none, 0, I_VCMPNEQ_UQPS },
    TOK t_vcmpneq_uqps, TOKEN_INSN, C_none, 0, I_VCMPNEQ_UQPS

    ; { "vcmpneqps", TOKEN_INSN, C_none, 0, I_VCMPNEQPS },
    TOK t_vcmpneqps, TOKEN_INSN, C_none, 0, I_VCMPNEQPS

    ; { "vcmpnlt_usps", TOKEN_INSN, C_none, 0, I_VCMPNLT_USPS },
    TOK t_vcmpnlt_usps, TOKEN_INSN, C_none, 0, I_VCMPNLT_USPS

    ; { "vcmpnltps", TOKEN_INSN, C_none, 0, I_VCMPNLTPS },
    TOK t_vcmpnltps, TOKEN_INSN, C_none, 0, I_VCMPNLTPS

    ; { "vcmpnle_usps", TOKEN_INSN, C_none, 0, I_VCMPNLE_USPS },
    TOK t_vcmpnle_usps, TOKEN_INSN, C_none, 0, I_VCMPNLE_USPS

    ; { "vcmpnleps", TOKEN_INSN, C_none, 0, I_VCMPNLEPS },
    TOK t_vcmpnleps, TOKEN_INSN, C_none, 0, I_VCMPNLEPS

    ; { "vcmpord_qps", TOKEN_INSN, C_none, 0, I_VCMPORD_QPS },
    TOK t_vcmpord_qps, TOKEN_INSN, C_none, 0, I_VCMPORD_QPS

    ; { "vcmpordps", TOKEN_INSN, C_none, 0, I_VCMPORDPS },
    TOK t_vcmpordps, TOKEN_INSN, C_none, 0, I_VCMPORDPS

    ; { "vcmpeq_uqps", TOKEN_INSN, C_none, 0, I_VCMPEQ_UQPS },
    TOK t_vcmpeq_uqps, TOKEN_INSN, C_none, 0, I_VCMPEQ_UQPS

    ; { "vcmpnge_usps", TOKEN_INSN, C_none, 0, I_VCMPNGE_USPS },
    TOK t_vcmpnge_usps, TOKEN_INSN, C_none, 0, I_VCMPNGE_USPS

    ; { "vcmpngeps", TOKEN_INSN, C_none, 0, I_VCMPNGEPS },
    TOK t_vcmpngeps, TOKEN_INSN, C_none, 0, I_VCMPNGEPS

    ; { "vcmpngt_usps", TOKEN_INSN, C_none, 0, I_VCMPNGT_USPS },
    TOK t_vcmpngt_usps, TOKEN_INSN, C_none, 0, I_VCMPNGT_USPS

    ; { "vcmpngtps", TOKEN_INSN, C_none, 0, I_VCMPNGTPS },
    TOK t_vcmpngtps, TOKEN_INSN, C_none, 0, I_VCMPNGTPS

    ; { "vcmpfalse_oqps", TOKEN_INSN, C_none, 0, I_VCMPFALSE_OQPS },
    TOK t_vcmpfalse_oqps, TOKEN_INSN, C_none, 0, I_VCMPFALSE_OQPS

    ; { "vcmpfalseps", TOKEN_INSN, C_none, 0, I_VCMPFALSEPS },
    TOK t_vcmpfalseps, TOKEN_INSN, C_none, 0, I_VCMPFALSEPS

    ; { "vcmpneq_oqps", TOKEN_INSN, C_none, 0, I_VCMPNEQ_OQPS },
    TOK t_vcmpneq_oqps, TOKEN_INSN, C_none, 0, I_VCMPNEQ_OQPS

    ; { "vcmpge_osps", TOKEN_INSN, C_none, 0, I_VCMPGE_OSPS },
    TOK t_vcmpge_osps, TOKEN_INSN, C_none, 0, I_VCMPGE_OSPS

    ; { "vcmpgeps", TOKEN_INSN, C_none, 0, I_VCMPGEPS },
    TOK t_vcmpgeps, TOKEN_INSN, C_none, 0, I_VCMPGEPS

    ; { "vcmpgt_osps", TOKEN_INSN, C_none, 0, I_VCMPGT_OSPS },
    TOK t_vcmpgt_osps, TOKEN_INSN, C_none, 0, I_VCMPGT_OSPS

    ; { "vcmpgtps", TOKEN_INSN, C_none, 0, I_VCMPGTPS },
    TOK t_vcmpgtps, TOKEN_INSN, C_none, 0, I_VCMPGTPS

    ; { "vcmptrue_uqps", TOKEN_INSN, C_none, 0, I_VCMPTRUE_UQPS },
    TOK t_vcmptrue_uqps, TOKEN_INSN, C_none, 0, I_VCMPTRUE_UQPS

    ; { "vcmptrueps", TOKEN_INSN, C_none, 0, I_VCMPTRUEPS },
    TOK t_vcmptrueps, TOKEN_INSN, C_none, 0, I_VCMPTRUEPS

    ; { "vcmplt_oqps", TOKEN_INSN, C_none, 0, I_VCMPLT_OQPS },
    TOK t_vcmplt_oqps, TOKEN_INSN, C_none, 0, I_VCMPLT_OQPS

    ; { "vcmple_oqps", TOKEN_INSN, C_none, 0, I_VCMPLE_OQPS },
    TOK t_vcmple_oqps, TOKEN_INSN, C_none, 0, I_VCMPLE_OQPS

    ; { "vcmpunord_sps", TOKEN_INSN, C_none, 0, I_VCMPUNORD_SPS },
    TOK t_vcmpunord_sps, TOKEN_INSN, C_none, 0, I_VCMPUNORD_SPS

    ; { "vcmpneq_usps", TOKEN_INSN, C_none, 0, I_VCMPNEQ_USPS },
    TOK t_vcmpneq_usps, TOKEN_INSN, C_none, 0, I_VCMPNEQ_USPS

    ; { "vcmpnlt_uqps", TOKEN_INSN, C_none, 0, I_VCMPNLT_UQPS },
    TOK t_vcmpnlt_uqps, TOKEN_INSN, C_none, 0, I_VCMPNLT_UQPS

    ; { "vcmpnle_uqps", TOKEN_INSN, C_none, 0, I_VCMPNLE_UQPS },
    TOK t_vcmpnle_uqps, TOKEN_INSN, C_none, 0, I_VCMPNLE_UQPS

    ; { "vcmpord_sps", TOKEN_INSN, C_none, 0, I_VCMPORD_SPS },
    TOK t_vcmpord_sps, TOKEN_INSN, C_none, 0, I_VCMPORD_SPS

    ; { "vcmpeq_usps", TOKEN_INSN, C_none, 0, I_VCMPEQ_USPS },
    TOK t_vcmpeq_usps, TOKEN_INSN, C_none, 0, I_VCMPEQ_USPS

    ; { "vcmpnge_uqps", TOKEN_INSN, C_none, 0, I_VCMPNGE_UQPS },
    TOK t_vcmpnge_uqps, TOKEN_INSN, C_none, 0, I_VCMPNGE_UQPS

    ; { "vcmpngt_uqps", TOKEN_INSN, C_none, 0, I_VCMPNGT_UQPS },
    TOK t_vcmpngt_uqps, TOKEN_INSN, C_none, 0, I_VCMPNGT_UQPS

    ; { "vcmpfalse_osps", TOKEN_INSN, C_none, 0, I_VCMPFALSE_OSPS },
    TOK t_vcmpfalse_osps, TOKEN_INSN, C_none, 0, I_VCMPFALSE_OSPS

    ; { "vcmpneq_osps", TOKEN_INSN, C_none, 0, I_VCMPNEQ_OSPS },
    TOK t_vcmpneq_osps, TOKEN_INSN, C_none, 0, I_VCMPNEQ_OSPS

    ; { "vcmpge_oqps", TOKEN_INSN, C_none, 0, I_VCMPGE_OQPS },
    TOK t_vcmpge_oqps, TOKEN_INSN, C_none, 0, I_VCMPGE_OQPS

    ; { "vcmpgt_oqps", TOKEN_INSN, C_none, 0, I_VCMPGT_OQPS },
    TOK t_vcmpgt_oqps, TOKEN_INSN, C_none, 0, I_VCMPGT_OQPS

    ; { "vcmptrue_usps", TOKEN_INSN, C_none, 0, I_VCMPTRUE_USPS },
    TOK t_vcmptrue_usps, TOKEN_INSN, C_none, 0, I_VCMPTRUE_USPS

    ; { "vcmpps", TOKEN_INSN, C_none, 0, I_VCMPPS },
    TOK t_vcmpps, TOKEN_INSN, C_none, 0, I_VCMPPS

    ; { "vcmpeq_ossd", TOKEN_INSN, C_none, 0, I_VCMPEQ_OSSD },
    TOK t_vcmpeq_ossd, TOKEN_INSN, C_none, 0, I_VCMPEQ_OSSD

    ; { "vcmpeqsd", TOKEN_INSN, C_none, 0, I_VCMPEQSD },
    TOK t_vcmpeqsd, TOKEN_INSN, C_none, 0, I_VCMPEQSD

    ; { "vcmplt_ossd", TOKEN_INSN, C_none, 0, I_VCMPLT_OSSD },
    TOK t_vcmplt_ossd, TOKEN_INSN, C_none, 0, I_VCMPLT_OSSD

    ; { "vcmpltsd", TOKEN_INSN, C_none, 0, I_VCMPLTSD },
    TOK t_vcmpltsd, TOKEN_INSN, C_none, 0, I_VCMPLTSD

    ; { "vcmple_ossd", TOKEN_INSN, C_none, 0, I_VCMPLE_OSSD },
    TOK t_vcmple_ossd, TOKEN_INSN, C_none, 0, I_VCMPLE_OSSD

    ; { "vcmplesd", TOKEN_INSN, C_none, 0, I_VCMPLESD },
    TOK t_vcmplesd, TOKEN_INSN, C_none, 0, I_VCMPLESD

    ; { "vcmpunord_qsd", TOKEN_INSN, C_none, 0, I_VCMPUNORD_QSD },
    TOK t_vcmpunord_qsd, TOKEN_INSN, C_none, 0, I_VCMPUNORD_QSD

    ; { "vcmpunordsd", TOKEN_INSN, C_none, 0, I_VCMPUNORDSD },
    TOK t_vcmpunordsd, TOKEN_INSN, C_none, 0, I_VCMPUNORDSD

    ; { "vcmpneq_uqsd", TOKEN_INSN, C_none, 0, I_VCMPNEQ_UQSD },
    TOK t_vcmpneq_uqsd, TOKEN_INSN, C_none, 0, I_VCMPNEQ_UQSD

    ; { "vcmpneqsd", TOKEN_INSN, C_none, 0, I_VCMPNEQSD },
    TOK t_vcmpneqsd, TOKEN_INSN, C_none, 0, I_VCMPNEQSD

    ; { "vcmpnlt_ussd", TOKEN_INSN, C_none, 0, I_VCMPNLT_USSD },
    TOK t_vcmpnlt_ussd, TOKEN_INSN, C_none, 0, I_VCMPNLT_USSD

    ; { "vcmpnltsd", TOKEN_INSN, C_none, 0, I_VCMPNLTSD },
    TOK t_vcmpnltsd, TOKEN_INSN, C_none, 0, I_VCMPNLTSD

    ; { "vcmpnle_ussd", TOKEN_INSN, C_none, 0, I_VCMPNLE_USSD },
    TOK t_vcmpnle_ussd, TOKEN_INSN, C_none, 0, I_VCMPNLE_USSD

    ; { "vcmpnlesd", TOKEN_INSN, C_none, 0, I_VCMPNLESD },
    TOK t_vcmpnlesd, TOKEN_INSN, C_none, 0, I_VCMPNLESD

    ; { "vcmpord_qsd", TOKEN_INSN, C_none, 0, I_VCMPORD_QSD },
    TOK t_vcmpord_qsd, TOKEN_INSN, C_none, 0, I_VCMPORD_QSD

    ; { "vcmpordsd", TOKEN_INSN, C_none, 0, I_VCMPORDSD },
    TOK t_vcmpordsd, TOKEN_INSN, C_none, 0, I_VCMPORDSD

    ; { "vcmpeq_uqsd", TOKEN_INSN, C_none, 0, I_VCMPEQ_UQSD },
    TOK t_vcmpeq_uqsd, TOKEN_INSN, C_none, 0, I_VCMPEQ_UQSD

    ; { "vcmpnge_ussd", TOKEN_INSN, C_none, 0, I_VCMPNGE_USSD },
    TOK t_vcmpnge_ussd, TOKEN_INSN, C_none, 0, I_VCMPNGE_USSD

    ; { "vcmpngesd", TOKEN_INSN, C_none, 0, I_VCMPNGESD },
    TOK t_vcmpngesd, TOKEN_INSN, C_none, 0, I_VCMPNGESD

    ; { "vcmpngt_ussd", TOKEN_INSN, C_none, 0, I_VCMPNGT_USSD },
    TOK t_vcmpngt_ussd, TOKEN_INSN, C_none, 0, I_VCMPNGT_USSD

    ; { "vcmpngtsd", TOKEN_INSN, C_none, 0, I_VCMPNGTSD },
    TOK t_vcmpngtsd, TOKEN_INSN, C_none, 0, I_VCMPNGTSD

    ; { "vcmpfalse_oqsd", TOKEN_INSN, C_none, 0, I_VCMPFALSE_OQSD },
    TOK t_vcmpfalse_oqsd, TOKEN_INSN, C_none, 0, I_VCMPFALSE_OQSD

    ; { "vcmpfalsesd", TOKEN_INSN, C_none, 0, I_VCMPFALSESD },
    TOK t_vcmpfalsesd, TOKEN_INSN, C_none, 0, I_VCMPFALSESD

    ; { "vcmpneq_oqsd", TOKEN_INSN, C_none, 0, I_VCMPNEQ_OQSD },
    TOK t_vcmpneq_oqsd, TOKEN_INSN, C_none, 0, I_VCMPNEQ_OQSD

    ; { "vcmpge_ossd", TOKEN_INSN, C_none, 0, I_VCMPGE_OSSD },
    TOK t_vcmpge_ossd, TOKEN_INSN, C_none, 0, I_VCMPGE_OSSD

    ; { "vcmpgesd", TOKEN_INSN, C_none, 0, I_VCMPGESD },
    TOK t_vcmpgesd, TOKEN_INSN, C_none, 0, I_VCMPGESD

    ; { "vcmpgt_ossd", TOKEN_INSN, C_none, 0, I_VCMPGT_OSSD },
    TOK t_vcmpgt_ossd, TOKEN_INSN, C_none, 0, I_VCMPGT_OSSD

    ; { "vcmpgtsd", TOKEN_INSN, C_none, 0, I_VCMPGTSD },
    TOK t_vcmpgtsd, TOKEN_INSN, C_none, 0, I_VCMPGTSD

    ; { "vcmptrue_uqsd", TOKEN_INSN, C_none, 0, I_VCMPTRUE_UQSD },
    TOK t_vcmptrue_uqsd, TOKEN_INSN, C_none, 0, I_VCMPTRUE_UQSD

    ; { "vcmptruesd", TOKEN_INSN, C_none, 0, I_VCMPTRUESD },
    TOK t_vcmptruesd, TOKEN_INSN, C_none, 0, I_VCMPTRUESD

    ; { "vcmplt_oqsd", TOKEN_INSN, C_none, 0, I_VCMPLT_OQSD },
    TOK t_vcmplt_oqsd, TOKEN_INSN, C_none, 0, I_VCMPLT_OQSD

    ; { "vcmple_oqsd", TOKEN_INSN, C_none, 0, I_VCMPLE_OQSD },
    TOK t_vcmple_oqsd, TOKEN_INSN, C_none, 0, I_VCMPLE_OQSD

    ; { "vcmpunord_ssd", TOKEN_INSN, C_none, 0, I_VCMPUNORD_SSD },
    TOK t_vcmpunord_ssd, TOKEN_INSN, C_none, 0, I_VCMPUNORD_SSD

    ; { "vcmpneq_ussd", TOKEN_INSN, C_none, 0, I_VCMPNEQ_USSD },
    TOK t_vcmpneq_ussd, TOKEN_INSN, C_none, 0, I_VCMPNEQ_USSD

    ; { "vcmpnlt_uqsd", TOKEN_INSN, C_none, 0, I_VCMPNLT_UQSD },
    TOK t_vcmpnlt_uqsd, TOKEN_INSN, C_none, 0, I_VCMPNLT_UQSD

    ; { "vcmpnle_uqsd", TOKEN_INSN, C_none, 0, I_VCMPNLE_UQSD },
    TOK t_vcmpnle_uqsd, TOKEN_INSN, C_none, 0, I_VCMPNLE_UQSD

    ; { "vcmpord_ssd", TOKEN_INSN, C_none, 0, I_VCMPORD_SSD },
    TOK t_vcmpord_ssd, TOKEN_INSN, C_none, 0, I_VCMPORD_SSD

    ; { "vcmpeq_ussd", TOKEN_INSN, C_none, 0, I_VCMPEQ_USSD },
    TOK t_vcmpeq_ussd, TOKEN_INSN, C_none, 0, I_VCMPEQ_USSD

    ; { "vcmpnge_uqsd", TOKEN_INSN, C_none, 0, I_VCMPNGE_UQSD },
    TOK t_vcmpnge_uqsd, TOKEN_INSN, C_none, 0, I_VCMPNGE_UQSD

    ; { "vcmpngt_uqsd", TOKEN_INSN, C_none, 0, I_VCMPNGT_UQSD },
    TOK t_vcmpngt_uqsd, TOKEN_INSN, C_none, 0, I_VCMPNGT_UQSD

    ; { "vcmpfalse_ossd", TOKEN_INSN, C_none, 0, I_VCMPFALSE_OSSD },
    TOK t_vcmpfalse_ossd, TOKEN_INSN, C_none, 0, I_VCMPFALSE_OSSD

    ; { "vcmpneq_ossd", TOKEN_INSN, C_none, 0, I_VCMPNEQ_OSSD },
    TOK t_vcmpneq_ossd, TOKEN_INSN, C_none, 0, I_VCMPNEQ_OSSD

    ; { "vcmpge_oqsd", TOKEN_INSN, C_none, 0, I_VCMPGE_OQSD },
    TOK t_vcmpge_oqsd, TOKEN_INSN, C_none, 0, I_VCMPGE_OQSD

    ; { "vcmpgt_oqsd", TOKEN_INSN, C_none, 0, I_VCMPGT_OQSD },
    TOK t_vcmpgt_oqsd, TOKEN_INSN, C_none, 0, I_VCMPGT_OQSD

    ; { "vcmptrue_ussd", TOKEN_INSN, C_none, 0, I_VCMPTRUE_USSD },
    TOK t_vcmptrue_ussd, TOKEN_INSN, C_none, 0, I_VCMPTRUE_USSD

    ; { "vcmpsd", TOKEN_INSN, C_none, 0, I_VCMPSD },
    TOK t_vcmpsd, TOKEN_INSN, C_none, 0, I_VCMPSD

    ; { "vcmpeq_osss", TOKEN_INSN, C_none, 0, I_VCMPEQ_OSSS },
    TOK t_vcmpeq_osss, TOKEN_INSN, C_none, 0, I_VCMPEQ_OSSS

    ; { "vcmpeqss", TOKEN_INSN, C_none, 0, I_VCMPEQSS },
    TOK t_vcmpeqss, TOKEN_INSN, C_none, 0, I_VCMPEQSS

    ; { "vcmplt_osss", TOKEN_INSN, C_none, 0, I_VCMPLT_OSSS },
    TOK t_vcmplt_osss, TOKEN_INSN, C_none, 0, I_VCMPLT_OSSS

    ; { "vcmpltss", TOKEN_INSN, C_none, 0, I_VCMPLTSS },
    TOK t_vcmpltss, TOKEN_INSN, C_none, 0, I_VCMPLTSS

    ; { "vcmple_osss", TOKEN_INSN, C_none, 0, I_VCMPLE_OSSS },
    TOK t_vcmple_osss, TOKEN_INSN, C_none, 0, I_VCMPLE_OSSS

    ; { "vcmpless", TOKEN_INSN, C_none, 0, I_VCMPLESS },
    TOK t_vcmpless, TOKEN_INSN, C_none, 0, I_VCMPLESS

    ; { "vcmpunord_qss", TOKEN_INSN, C_none, 0, I_VCMPUNORD_QSS },
    TOK t_vcmpunord_qss, TOKEN_INSN, C_none, 0, I_VCMPUNORD_QSS

    ; { "vcmpunordss", TOKEN_INSN, C_none, 0, I_VCMPUNORDSS },
    TOK t_vcmpunordss, TOKEN_INSN, C_none, 0, I_VCMPUNORDSS

    ; { "vcmpneq_uqss", TOKEN_INSN, C_none, 0, I_VCMPNEQ_UQSS },
    TOK t_vcmpneq_uqss, TOKEN_INSN, C_none, 0, I_VCMPNEQ_UQSS

    ; { "vcmpneqss", TOKEN_INSN, C_none, 0, I_VCMPNEQSS },
    TOK t_vcmpneqss, TOKEN_INSN, C_none, 0, I_VCMPNEQSS

    ; { "vcmpnlt_usss", TOKEN_INSN, C_none, 0, I_VCMPNLT_USSS },
    TOK t_vcmpnlt_usss, TOKEN_INSN, C_none, 0, I_VCMPNLT_USSS

    ; { "vcmpnltss", TOKEN_INSN, C_none, 0, I_VCMPNLTSS },
    TOK t_vcmpnltss, TOKEN_INSN, C_none, 0, I_VCMPNLTSS

    ; { "vcmpnle_usss", TOKEN_INSN, C_none, 0, I_VCMPNLE_USSS },
    TOK t_vcmpnle_usss, TOKEN_INSN, C_none, 0, I_VCMPNLE_USSS

    ; { "vcmpnless", TOKEN_INSN, C_none, 0, I_VCMPNLESS },
    TOK t_vcmpnless, TOKEN_INSN, C_none, 0, I_VCMPNLESS

    ; { "vcmpord_qss", TOKEN_INSN, C_none, 0, I_VCMPORD_QSS },
    TOK t_vcmpord_qss, TOKEN_INSN, C_none, 0, I_VCMPORD_QSS

    ; { "vcmpordss", TOKEN_INSN, C_none, 0, I_VCMPORDSS },
    TOK t_vcmpordss, TOKEN_INSN, C_none, 0, I_VCMPORDSS

    ; { "vcmpeq_uqss", TOKEN_INSN, C_none, 0, I_VCMPEQ_UQSS },
    TOK t_vcmpeq_uqss, TOKEN_INSN, C_none, 0, I_VCMPEQ_UQSS

    ; { "vcmpnge_usss", TOKEN_INSN, C_none, 0, I_VCMPNGE_USSS },
    TOK t_vcmpnge_usss, TOKEN_INSN, C_none, 0, I_VCMPNGE_USSS

    ; { "vcmpngess", TOKEN_INSN, C_none, 0, I_VCMPNGESS },
    TOK t_vcmpngess, TOKEN_INSN, C_none, 0, I_VCMPNGESS

    ; { "vcmpngt_usss", TOKEN_INSN, C_none, 0, I_VCMPNGT_USSS },
    TOK t_vcmpngt_usss, TOKEN_INSN, C_none, 0, I_VCMPNGT_USSS

    ; { "vcmpngtss", TOKEN_INSN, C_none, 0, I_VCMPNGTSS },
    TOK t_vcmpngtss, TOKEN_INSN, C_none, 0, I_VCMPNGTSS

    ; { "vcmpfalse_oqss", TOKEN_INSN, C_none, 0, I_VCMPFALSE_OQSS },
    TOK t_vcmpfalse_oqss, TOKEN_INSN, C_none, 0, I_VCMPFALSE_OQSS

    ; { "vcmpfalsess", TOKEN_INSN, C_none, 0, I_VCMPFALSESS },
    TOK t_vcmpfalsess, TOKEN_INSN, C_none, 0, I_VCMPFALSESS

    ; { "vcmpneq_oqss", TOKEN_INSN, C_none, 0, I_VCMPNEQ_OQSS },
    TOK t_vcmpneq_oqss, TOKEN_INSN, C_none, 0, I_VCMPNEQ_OQSS

    ; { "vcmpge_osss", TOKEN_INSN, C_none, 0, I_VCMPGE_OSSS },
    TOK t_vcmpge_osss, TOKEN_INSN, C_none, 0, I_VCMPGE_OSSS

    ; { "vcmpgess", TOKEN_INSN, C_none, 0, I_VCMPGESS },
    TOK t_vcmpgess, TOKEN_INSN, C_none, 0, I_VCMPGESS

    ; { "vcmpgt_osss", TOKEN_INSN, C_none, 0, I_VCMPGT_OSSS },
    TOK t_vcmpgt_osss, TOKEN_INSN, C_none, 0, I_VCMPGT_OSSS

    ; { "vcmpgtss", TOKEN_INSN, C_none, 0, I_VCMPGTSS },
    TOK t_vcmpgtss, TOKEN_INSN, C_none, 0, I_VCMPGTSS

    ; { "vcmptrue_uqss", TOKEN_INSN, C_none, 0, I_VCMPTRUE_UQSS },
    TOK t_vcmptrue_uqss, TOKEN_INSN, C_none, 0, I_VCMPTRUE_UQSS

    ; { "vcmptruess", TOKEN_INSN, C_none, 0, I_VCMPTRUESS },
    TOK t_vcmptruess, TOKEN_INSN, C_none, 0, I_VCMPTRUESS

    ; { "vcmplt_oqss", TOKEN_INSN, C_none, 0, I_VCMPLT_OQSS },
    TOK t_vcmplt_oqss, TOKEN_INSN, C_none, 0, I_VCMPLT_OQSS

    ; { "vcmple_oqss", TOKEN_INSN, C_none, 0, I_VCMPLE_OQSS },
    TOK t_vcmple_oqss, TOKEN_INSN, C_none, 0, I_VCMPLE_OQSS

    ; { "vcmpunord_sss", TOKEN_INSN, C_none, 0, I_VCMPUNORD_SSS },
    TOK t_vcmpunord_sss, TOKEN_INSN, C_none, 0, I_VCMPUNORD_SSS

    ; { "vcmpneq_usss", TOKEN_INSN, C_none, 0, I_VCMPNEQ_USSS },
    TOK t_vcmpneq_usss, TOKEN_INSN, C_none, 0, I_VCMPNEQ_USSS

    ; { "vcmpnlt_uqss", TOKEN_INSN, C_none, 0, I_VCMPNLT_UQSS },
    TOK t_vcmpnlt_uqss, TOKEN_INSN, C_none, 0, I_VCMPNLT_UQSS

    ; { "vcmpnle_uqss", TOKEN_INSN, C_none, 0, I_VCMPNLE_UQSS },
    TOK t_vcmpnle_uqss, TOKEN_INSN, C_none, 0, I_VCMPNLE_UQSS

    ; { "vcmpord_sss", TOKEN_INSN, C_none, 0, I_VCMPORD_SSS },
    TOK t_vcmpord_sss, TOKEN_INSN, C_none, 0, I_VCMPORD_SSS

    ; { "vcmpeq_usss", TOKEN_INSN, C_none, 0, I_VCMPEQ_USSS },
    TOK t_vcmpeq_usss, TOKEN_INSN, C_none, 0, I_VCMPEQ_USSS

    ; { "vcmpnge_uqss", TOKEN_INSN, C_none, 0, I_VCMPNGE_UQSS },
    TOK t_vcmpnge_uqss, TOKEN_INSN, C_none, 0, I_VCMPNGE_UQSS

    ; { "vcmpngt_uqss", TOKEN_INSN, C_none, 0, I_VCMPNGT_UQSS },
    TOK t_vcmpngt_uqss, TOKEN_INSN, C_none, 0, I_VCMPNGT_UQSS

    ; { "vcmpfalse_osss", TOKEN_INSN, C_none, 0, I_VCMPFALSE_OSSS },
    TOK t_vcmpfalse_osss, TOKEN_INSN, C_none, 0, I_VCMPFALSE_OSSS

    ; { "vcmpneq_osss", TOKEN_INSN, C_none, 0, I_VCMPNEQ_OSSS },
    TOK t_vcmpneq_osss, TOKEN_INSN, C_none, 0, I_VCMPNEQ_OSSS

    ; { "vcmpge_oqss", TOKEN_INSN, C_none, 0, I_VCMPGE_OQSS },
    TOK t_vcmpge_oqss, TOKEN_INSN, C_none, 0, I_VCMPGE_OQSS

    ; { "vcmpgt_oqss", TOKEN_INSN, C_none, 0, I_VCMPGT_OQSS },
    TOK t_vcmpgt_oqss, TOKEN_INSN, C_none, 0, I_VCMPGT_OQSS

    ; { "vcmptrue_usss", TOKEN_INSN, C_none, 0, I_VCMPTRUE_USSS },
    TOK t_vcmptrue_usss, TOKEN_INSN, C_none, 0, I_VCMPTRUE_USSS

    ; { "vcmpss", TOKEN_INSN, C_none, 0, I_VCMPSS },
    TOK t_vcmpss, TOKEN_INSN, C_none, 0, I_VCMPSS

    ; { "vcomisd", TOKEN_INSN, C_none, 0, I_VCOMISD },
    TOK t_vcomisd, TOKEN_INSN, C_none, 0, I_VCOMISD

    ; { "vcomiss", TOKEN_INSN, C_none, 0, I_VCOMISS },
    TOK t_vcomiss, TOKEN_INSN, C_none, 0, I_VCOMISS

    ; { "vcvtdq2pd", TOKEN_INSN, C_none, 0, I_VCVTDQ2PD },
    TOK t_vcvtdq2pd, TOKEN_INSN, C_none, 0, I_VCVTDQ2PD

    ; { "vcvtdq2ps", TOKEN_INSN, C_none, 0, I_VCVTDQ2PS },
    TOK t_vcvtdq2ps, TOKEN_INSN, C_none, 0, I_VCVTDQ2PS

    ; { "vcvtpd2dq", TOKEN_INSN, C_none, 0, I_VCVTPD2DQ },
    TOK t_vcvtpd2dq, TOKEN_INSN, C_none, 0, I_VCVTPD2DQ

    ; { "vcvtpd2ps", TOKEN_INSN, C_none, 0, I_VCVTPD2PS },
    TOK t_vcvtpd2ps, TOKEN_INSN, C_none, 0, I_VCVTPD2PS

    ; { "vcvtps2dq", TOKEN_INSN, C_none, 0, I_VCVTPS2DQ },
    TOK t_vcvtps2dq, TOKEN_INSN, C_none, 0, I_VCVTPS2DQ

    ; { "vcvtps2pd", TOKEN_INSN, C_none, 0, I_VCVTPS2PD },
    TOK t_vcvtps2pd, TOKEN_INSN, C_none, 0, I_VCVTPS2PD

    ; { "vcvtsd2si", TOKEN_INSN, C_none, 0, I_VCVTSD2SI },
    TOK t_vcvtsd2si, TOKEN_INSN, C_none, 0, I_VCVTSD2SI

    ; { "vcvtsd2ss", TOKEN_INSN, C_none, 0, I_VCVTSD2SS },
    TOK t_vcvtsd2ss, TOKEN_INSN, C_none, 0, I_VCVTSD2SS

    ; { "vcvtsi2sd", TOKEN_INSN, C_none, 0, I_VCVTSI2SD },
    TOK t_vcvtsi2sd, TOKEN_INSN, C_none, 0, I_VCVTSI2SD

    ; { "vcvtsi2ss", TOKEN_INSN, C_none, 0, I_VCVTSI2SS },
    TOK t_vcvtsi2ss, TOKEN_INSN, C_none, 0, I_VCVTSI2SS

    ; { "vcvtss2sd", TOKEN_INSN, C_none, 0, I_VCVTSS2SD },
    TOK t_vcvtss2sd, TOKEN_INSN, C_none, 0, I_VCVTSS2SD

    ; { "vcvtss2si", TOKEN_INSN, C_none, 0, I_VCVTSS2SI },
    TOK t_vcvtss2si, TOKEN_INSN, C_none, 0, I_VCVTSS2SI

    ; { "vcvttpd2dq", TOKEN_INSN, C_none, 0, I_VCVTTPD2DQ },
    TOK t_vcvttpd2dq, TOKEN_INSN, C_none, 0, I_VCVTTPD2DQ

    ; { "vcvttps2dq", TOKEN_INSN, C_none, 0, I_VCVTTPS2DQ },
    TOK t_vcvttps2dq, TOKEN_INSN, C_none, 0, I_VCVTTPS2DQ

    ; { "vcvttsd2si", TOKEN_INSN, C_none, 0, I_VCVTTSD2SI },
    TOK t_vcvttsd2si, TOKEN_INSN, C_none, 0, I_VCVTTSD2SI

    ; { "vcvttss2si", TOKEN_INSN, C_none, 0, I_VCVTTSS2SI },
    TOK t_vcvttss2si, TOKEN_INSN, C_none, 0, I_VCVTTSS2SI

    ; { "vdivpd", TOKEN_INSN, C_none, 0, I_VDIVPD },
    TOK t_vdivpd, TOKEN_INSN, C_none, 0, I_VDIVPD

    ; { "vdivps", TOKEN_INSN, C_none, 0, I_VDIVPS },
    TOK t_vdivps, TOKEN_INSN, C_none, 0, I_VDIVPS

    ; { "vdivsd", TOKEN_INSN, C_none, 0, I_VDIVSD },
    TOK t_vdivsd, TOKEN_INSN, C_none, 0, I_VDIVSD

    ; { "vdivss", TOKEN_INSN, C_none, 0, I_VDIVSS },
    TOK t_vdivss, TOKEN_INSN, C_none, 0, I_VDIVSS

    ; { "vdppd", TOKEN_INSN, C_none, 0, I_VDPPD },
    TOK t_vdppd, TOKEN_INSN, C_none, 0, I_VDPPD

    ; { "vdpps", TOKEN_INSN, C_none, 0, I_VDPPS },
    TOK t_vdpps, TOKEN_INSN, C_none, 0, I_VDPPS

    ; { "vextractf128", TOKEN_INSN, C_none, 0, I_VEXTRACTF128 },
    TOK t_vextractf128, TOKEN_INSN, C_none, 0, I_VEXTRACTF128

    ; { "vextractps", TOKEN_INSN, C_none, 0, I_VEXTRACTPS },
    TOK t_vextractps, TOKEN_INSN, C_none, 0, I_VEXTRACTPS

    ; { "vhaddpd", TOKEN_INSN, C_none, 0, I_VHADDPD },
    TOK t_vhaddpd, TOKEN_INSN, C_none, 0, I_VHADDPD

    ; { "vhaddps", TOKEN_INSN, C_none, 0, I_VHADDPS },
    TOK t_vhaddps, TOKEN_INSN, C_none, 0, I_VHADDPS

    ; { "vhsubpd", TOKEN_INSN, C_none, 0, I_VHSUBPD },
    TOK t_vhsubpd, TOKEN_INSN, C_none, 0, I_VHSUBPD

    ; { "vhsubps", TOKEN_INSN, C_none, 0, I_VHSUBPS },
    TOK t_vhsubps, TOKEN_INSN, C_none, 0, I_VHSUBPS

    ; { "vinsertf128", TOKEN_INSN, C_none, 0, I_VINSERTF128 },
    TOK t_vinsertf128, TOKEN_INSN, C_none, 0, I_VINSERTF128

    ; { "vinsertps", TOKEN_INSN, C_none, 0, I_VINSERTPS },
    TOK t_vinsertps, TOKEN_INSN, C_none, 0, I_VINSERTPS

    ; { "vlddqu", TOKEN_INSN, C_none, 0, I_VLDDQU },
    TOK t_vlddqu, TOKEN_INSN, C_none, 0, I_VLDDQU

    ; { "vldqqu", TOKEN_INSN, C_none, 0, I_VLDQQU },
    TOK t_vldqqu, TOKEN_INSN, C_none, 0, I_VLDQQU

    ; { "vldmxcsr", TOKEN_INSN, C_none, 0, I_VLDMXCSR },
    TOK t_vldmxcsr, TOKEN_INSN, C_none, 0, I_VLDMXCSR

    ; { "vmaskmovdqu", TOKEN_INSN, C_none, 0, I_VMASKMOVDQU },
    TOK t_vmaskmovdqu, TOKEN_INSN, C_none, 0, I_VMASKMOVDQU

    ; { "vmaskmovps", TOKEN_INSN, C_none, 0, I_VMASKMOVPS },
    TOK t_vmaskmovps, TOKEN_INSN, C_none, 0, I_VMASKMOVPS

    ; { "vmaskmovpd", TOKEN_INSN, C_none, 0, I_VMASKMOVPD },
    TOK t_vmaskmovpd, TOKEN_INSN, C_none, 0, I_VMASKMOVPD

    ; { "vmaxpd", TOKEN_INSN, C_none, 0, I_VMAXPD },
    TOK t_vmaxpd, TOKEN_INSN, C_none, 0, I_VMAXPD

    ; { "vmaxps", TOKEN_INSN, C_none, 0, I_VMAXPS },
    TOK t_vmaxps, TOKEN_INSN, C_none, 0, I_VMAXPS

    ; { "vmaxsd", TOKEN_INSN, C_none, 0, I_VMAXSD },
    TOK t_vmaxsd, TOKEN_INSN, C_none, 0, I_VMAXSD

    ; { "vmaxss", TOKEN_INSN, C_none, 0, I_VMAXSS },
    TOK t_vmaxss, TOKEN_INSN, C_none, 0, I_VMAXSS

    ; { "vminpd", TOKEN_INSN, C_none, 0, I_VMINPD },
    TOK t_vminpd, TOKEN_INSN, C_none, 0, I_VMINPD

    ; { "vminps", TOKEN_INSN, C_none, 0, I_VMINPS },
    TOK t_vminps, TOKEN_INSN, C_none, 0, I_VMINPS

    ; { "vminsd", TOKEN_INSN, C_none, 0, I_VMINSD },
    TOK t_vminsd, TOKEN_INSN, C_none, 0, I_VMINSD

    ; { "vminss", TOKEN_INSN, C_none, 0, I_VMINSS },
    TOK t_vminss, TOKEN_INSN, C_none, 0, I_VMINSS

    ; { "vmovapd", TOKEN_INSN, C_none, 0, I_VMOVAPD },
    TOK t_vmovapd, TOKEN_INSN, C_none, 0, I_VMOVAPD

    ; { "vmovaps", TOKEN_INSN, C_none, 0, I_VMOVAPS },
    TOK t_vmovaps, TOKEN_INSN, C_none, 0, I_VMOVAPS

    ; { "vmovd", TOKEN_INSN, C_none, 0, I_VMOVD },
    TOK t_vmovd, TOKEN_INSN, C_none, 0, I_VMOVD

    ; { "vmovq", TOKEN_INSN, C_none, 0, I_VMOVQ },
    TOK t_vmovq, TOKEN_INSN, C_none, 0, I_VMOVQ

    ; { "vmovddup", TOKEN_INSN, C_none, 0, I_VMOVDDUP },
    TOK t_vmovddup, TOKEN_INSN, C_none, 0, I_VMOVDDUP

    ; { "vmovdqa", TOKEN_INSN, C_none, 0, I_VMOVDQA },
    TOK t_vmovdqa, TOKEN_INSN, C_none, 0, I_VMOVDQA

    ; { "vmovqqa", TOKEN_INSN, C_none, 0, I_VMOVQQA },
    TOK t_vmovqqa, TOKEN_INSN, C_none, 0, I_VMOVQQA

    ; { "vmovdqu", TOKEN_INSN, C_none, 0, I_VMOVDQU },
    TOK t_vmovdqu, TOKEN_INSN, C_none, 0, I_VMOVDQU

    ; { "vmovqqu", TOKEN_INSN, C_none, 0, I_VMOVQQU },
    TOK t_vmovqqu, TOKEN_INSN, C_none, 0, I_VMOVQQU

    ; { "vmovhlps", TOKEN_INSN, C_none, 0, I_VMOVHLPS },
    TOK t_vmovhlps, TOKEN_INSN, C_none, 0, I_VMOVHLPS

    ; { "vmovhpd", TOKEN_INSN, C_none, 0, I_VMOVHPD },
    TOK t_vmovhpd, TOKEN_INSN, C_none, 0, I_VMOVHPD

    ; { "vmovhps", TOKEN_INSN, C_none, 0, I_VMOVHPS },
    TOK t_vmovhps, TOKEN_INSN, C_none, 0, I_VMOVHPS

    ; { "vmovlhps", TOKEN_INSN, C_none, 0, I_VMOVLHPS },
    TOK t_vmovlhps, TOKEN_INSN, C_none, 0, I_VMOVLHPS

    ; { "vmovlpd", TOKEN_INSN, C_none, 0, I_VMOVLPD },
    TOK t_vmovlpd, TOKEN_INSN, C_none, 0, I_VMOVLPD

    ; { "vmovlps", TOKEN_INSN, C_none, 0, I_VMOVLPS },
    TOK t_vmovlps, TOKEN_INSN, C_none, 0, I_VMOVLPS

    ; { "vmovmskpd", TOKEN_INSN, C_none, 0, I_VMOVMSKPD },
    TOK t_vmovmskpd, TOKEN_INSN, C_none, 0, I_VMOVMSKPD

    ; { "vmovmskps", TOKEN_INSN, C_none, 0, I_VMOVMSKPS },
    TOK t_vmovmskps, TOKEN_INSN, C_none, 0, I_VMOVMSKPS

    ; { "vmovntdq", TOKEN_INSN, C_none, 0, I_VMOVNTDQ },
    TOK t_vmovntdq, TOKEN_INSN, C_none, 0, I_VMOVNTDQ

    ; { "vmovntqq", TOKEN_INSN, C_none, 0, I_VMOVNTQQ },
    TOK t_vmovntqq, TOKEN_INSN, C_none, 0, I_VMOVNTQQ

    ; { "vmovntdqa", TOKEN_INSN, C_none, 0, I_VMOVNTDQA },
    TOK t_vmovntdqa, TOKEN_INSN, C_none, 0, I_VMOVNTDQA

    ; { "vmovntpd", TOKEN_INSN, C_none, 0, I_VMOVNTPD },
    TOK t_vmovntpd, TOKEN_INSN, C_none, 0, I_VMOVNTPD

    ; { "vmovntps", TOKEN_INSN, C_none, 0, I_VMOVNTPS },
    TOK t_vmovntps, TOKEN_INSN, C_none, 0, I_VMOVNTPS

    ; { "vmovsd", TOKEN_INSN, C_none, 0, I_VMOVSD },
    TOK t_vmovsd, TOKEN_INSN, C_none, 0, I_VMOVSD

    ; { "vmovshdup", TOKEN_INSN, C_none, 0, I_VMOVSHDUP },
    TOK t_vmovshdup, TOKEN_INSN, C_none, 0, I_VMOVSHDUP

    ; { "vmovsldup", TOKEN_INSN, C_none, 0, I_VMOVSLDUP },
    TOK t_vmovsldup, TOKEN_INSN, C_none, 0, I_VMOVSLDUP

    ; { "vmovss", TOKEN_INSN, C_none, 0, I_VMOVSS },
    TOK t_vmovss, TOKEN_INSN, C_none, 0, I_VMOVSS

    ; { "vmovupd", TOKEN_INSN, C_none, 0, I_VMOVUPD },
    TOK t_vmovupd, TOKEN_INSN, C_none, 0, I_VMOVUPD

    ; { "vmovups", TOKEN_INSN, C_none, 0, I_VMOVUPS },
    TOK t_vmovups, TOKEN_INSN, C_none, 0, I_VMOVUPS

    ; { "vmpsadbw", TOKEN_INSN, C_none, 0, I_VMPSADBW },
    TOK t_vmpsadbw, TOKEN_INSN, C_none, 0, I_VMPSADBW

    ; { "vmulpd", TOKEN_INSN, C_none, 0, I_VMULPD },
    TOK t_vmulpd, TOKEN_INSN, C_none, 0, I_VMULPD

    ; { "vmulps", TOKEN_INSN, C_none, 0, I_VMULPS },
    TOK t_vmulps, TOKEN_INSN, C_none, 0, I_VMULPS

    ; { "vmulsd", TOKEN_INSN, C_none, 0, I_VMULSD },
    TOK t_vmulsd, TOKEN_INSN, C_none, 0, I_VMULSD

    ; { "vmulss", TOKEN_INSN, C_none, 0, I_VMULSS },
    TOK t_vmulss, TOKEN_INSN, C_none, 0, I_VMULSS

    ; { "vorpd", TOKEN_INSN, C_none, 0, I_VORPD },
    TOK t_vorpd, TOKEN_INSN, C_none, 0, I_VORPD

    ; { "vorps", TOKEN_INSN, C_none, 0, I_VORPS },
    TOK t_vorps, TOKEN_INSN, C_none, 0, I_VORPS

    ; { "vpabsb", TOKEN_INSN, C_none, 0, I_VPABSB },
    TOK t_vpabsb, TOKEN_INSN, C_none, 0, I_VPABSB

    ; { "vpabsw", TOKEN_INSN, C_none, 0, I_VPABSW },
    TOK t_vpabsw, TOKEN_INSN, C_none, 0, I_VPABSW

    ; { "vpabsd", TOKEN_INSN, C_none, 0, I_VPABSD },
    TOK t_vpabsd, TOKEN_INSN, C_none, 0, I_VPABSD

    ; { "vpacksswb", TOKEN_INSN, C_none, 0, I_VPACKSSWB },
    TOK t_vpacksswb, TOKEN_INSN, C_none, 0, I_VPACKSSWB

    ; { "vpackssdw", TOKEN_INSN, C_none, 0, I_VPACKSSDW },
    TOK t_vpackssdw, TOKEN_INSN, C_none, 0, I_VPACKSSDW

    ; { "vpackuswb", TOKEN_INSN, C_none, 0, I_VPACKUSWB },
    TOK t_vpackuswb, TOKEN_INSN, C_none, 0, I_VPACKUSWB

    ; { "vpackusdw", TOKEN_INSN, C_none, 0, I_VPACKUSDW },
    TOK t_vpackusdw, TOKEN_INSN, C_none, 0, I_VPACKUSDW

    ; { "vpaddb", TOKEN_INSN, C_none, 0, I_VPADDB },
    TOK t_vpaddb, TOKEN_INSN, C_none, 0, I_VPADDB

    ; { "vpaddw", TOKEN_INSN, C_none, 0, I_VPADDW },
    TOK t_vpaddw, TOKEN_INSN, C_none, 0, I_VPADDW

    ; { "vpaddd", TOKEN_INSN, C_none, 0, I_VPADDD },
    TOK t_vpaddd, TOKEN_INSN, C_none, 0, I_VPADDD

    ; { "vpaddq", TOKEN_INSN, C_none, 0, I_VPADDQ },
    TOK t_vpaddq, TOKEN_INSN, C_none, 0, I_VPADDQ

    ; { "vpaddsb", TOKEN_INSN, C_none, 0, I_VPADDSB },
    TOK t_vpaddsb, TOKEN_INSN, C_none, 0, I_VPADDSB

    ; { "vpaddsw", TOKEN_INSN, C_none, 0, I_VPADDSW },
    TOK t_vpaddsw, TOKEN_INSN, C_none, 0, I_VPADDSW

    ; { "vpaddusb", TOKEN_INSN, C_none, 0, I_VPADDUSB },
    TOK t_vpaddusb, TOKEN_INSN, C_none, 0, I_VPADDUSB

    ; { "vpaddusw", TOKEN_INSN, C_none, 0, I_VPADDUSW },
    TOK t_vpaddusw, TOKEN_INSN, C_none, 0, I_VPADDUSW

    ; { "vpalignr", TOKEN_INSN, C_none, 0, I_VPALIGNR },
    TOK t_vpalignr, TOKEN_INSN, C_none, 0, I_VPALIGNR

    ; { "vpand", TOKEN_INSN, C_none, 0, I_VPAND },
    TOK t_vpand, TOKEN_INSN, C_none, 0, I_VPAND

    ; { "vpandn", TOKEN_INSN, C_none, 0, I_VPANDN },
    TOK t_vpandn, TOKEN_INSN, C_none, 0, I_VPANDN

    ; { "vpavgb", TOKEN_INSN, C_none, 0, I_VPAVGB },
    TOK t_vpavgb, TOKEN_INSN, C_none, 0, I_VPAVGB

    ; { "vpavgw", TOKEN_INSN, C_none, 0, I_VPAVGW },
    TOK t_vpavgw, TOKEN_INSN, C_none, 0, I_VPAVGW

    ; { "vpblendvb", TOKEN_INSN, C_none, 0, I_VPBLENDVB },
    TOK t_vpblendvb, TOKEN_INSN, C_none, 0, I_VPBLENDVB

    ; { "vpblendw", TOKEN_INSN, C_none, 0, I_VPBLENDW },
    TOK t_vpblendw, TOKEN_INSN, C_none, 0, I_VPBLENDW

    ; { "vpcmpestri", TOKEN_INSN, C_none, 0, I_VPCMPESTRI },
    TOK t_vpcmpestri, TOKEN_INSN, C_none, 0, I_VPCMPESTRI

    ; { "vpcmpestrm", TOKEN_INSN, C_none, 0, I_VPCMPESTRM },
    TOK t_vpcmpestrm, TOKEN_INSN, C_none, 0, I_VPCMPESTRM

    ; { "vpcmpistri", TOKEN_INSN, C_none, 0, I_VPCMPISTRI },
    TOK t_vpcmpistri, TOKEN_INSN, C_none, 0, I_VPCMPISTRI

    ; { "vpcmpistrm", TOKEN_INSN, C_none, 0, I_VPCMPISTRM },
    TOK t_vpcmpistrm, TOKEN_INSN, C_none, 0, I_VPCMPISTRM

    ; { "vpcmpeqb", TOKEN_INSN, C_none, 0, I_VPCMPEQB },
    TOK t_vpcmpeqb, TOKEN_INSN, C_none, 0, I_VPCMPEQB

    ; { "vpcmpeqw", TOKEN_INSN, C_none, 0, I_VPCMPEQW },
    TOK t_vpcmpeqw, TOKEN_INSN, C_none, 0, I_VPCMPEQW

    ; { "vpcmpeqd", TOKEN_INSN, C_none, 0, I_VPCMPEQD },
    TOK t_vpcmpeqd, TOKEN_INSN, C_none, 0, I_VPCMPEQD

    ; { "vpcmpeqq", TOKEN_INSN, C_none, 0, I_VPCMPEQQ },
    TOK t_vpcmpeqq, TOKEN_INSN, C_none, 0, I_VPCMPEQQ

    ; { "vpcmpgtb", TOKEN_INSN, C_none, 0, I_VPCMPGTB },
    TOK t_vpcmpgtb, TOKEN_INSN, C_none, 0, I_VPCMPGTB

    ; { "vpcmpgtw", TOKEN_INSN, C_none, 0, I_VPCMPGTW },
    TOK t_vpcmpgtw, TOKEN_INSN, C_none, 0, I_VPCMPGTW

    ; { "vpcmpgtd", TOKEN_INSN, C_none, 0, I_VPCMPGTD },
    TOK t_vpcmpgtd, TOKEN_INSN, C_none, 0, I_VPCMPGTD

    ; { "vpcmpgtq", TOKEN_INSN, C_none, 0, I_VPCMPGTQ },
    TOK t_vpcmpgtq, TOKEN_INSN, C_none, 0, I_VPCMPGTQ

    ; { "vpermilpd", TOKEN_INSN, C_none, 0, I_VPERMILPD },
    TOK t_vpermilpd, TOKEN_INSN, C_none, 0, I_VPERMILPD

    ; { "vpermilps", TOKEN_INSN, C_none, 0, I_VPERMILPS },
    TOK t_vpermilps, TOKEN_INSN, C_none, 0, I_VPERMILPS

    ; { "vperm2f128", TOKEN_INSN, C_none, 0, I_VPERM2F128 },
    TOK t_vperm2f128, TOKEN_INSN, C_none, 0, I_VPERM2F128

    ; { "vpextrb", TOKEN_INSN, C_none, 0, I_VPEXTRB },
    TOK t_vpextrb, TOKEN_INSN, C_none, 0, I_VPEXTRB

    ; { "vpextrw", TOKEN_INSN, C_none, 0, I_VPEXTRW },
    TOK t_vpextrw, TOKEN_INSN, C_none, 0, I_VPEXTRW

    ; { "vpextrd", TOKEN_INSN, C_none, 0, I_VPEXTRD },
    TOK t_vpextrd, TOKEN_INSN, C_none, 0, I_VPEXTRD

    ; { "vpextrq", TOKEN_INSN, C_none, 0, I_VPEXTRQ },
    TOK t_vpextrq, TOKEN_INSN, C_none, 0, I_VPEXTRQ

    ; { "vphaddw", TOKEN_INSN, C_none, 0, I_VPHADDW },
    TOK t_vphaddw, TOKEN_INSN, C_none, 0, I_VPHADDW

    ; { "vphaddd", TOKEN_INSN, C_none, 0, I_VPHADDD },
    TOK t_vphaddd, TOKEN_INSN, C_none, 0, I_VPHADDD

    ; { "vphaddsw", TOKEN_INSN, C_none, 0, I_VPHADDSW },
    TOK t_vphaddsw, TOKEN_INSN, C_none, 0, I_VPHADDSW

    ; { "vphminposuw", TOKEN_INSN, C_none, 0, I_VPHMINPOSUW },
    TOK t_vphminposuw, TOKEN_INSN, C_none, 0, I_VPHMINPOSUW

    ; { "vphsubw", TOKEN_INSN, C_none, 0, I_VPHSUBW },
    TOK t_vphsubw, TOKEN_INSN, C_none, 0, I_VPHSUBW

    ; { "vphsubd", TOKEN_INSN, C_none, 0, I_VPHSUBD },
    TOK t_vphsubd, TOKEN_INSN, C_none, 0, I_VPHSUBD

    ; { "vphsubsw", TOKEN_INSN, C_none, 0, I_VPHSUBSW },
    TOK t_vphsubsw, TOKEN_INSN, C_none, 0, I_VPHSUBSW

    ; { "vpinsrb", TOKEN_INSN, C_none, 0, I_VPINSRB },
    TOK t_vpinsrb, TOKEN_INSN, C_none, 0, I_VPINSRB

    ; { "vpinsrw", TOKEN_INSN, C_none, 0, I_VPINSRW },
    TOK t_vpinsrw, TOKEN_INSN, C_none, 0, I_VPINSRW

    ; { "vpinsrd", TOKEN_INSN, C_none, 0, I_VPINSRD },
    TOK t_vpinsrd, TOKEN_INSN, C_none, 0, I_VPINSRD

    ; { "vpinsrq", TOKEN_INSN, C_none, 0, I_VPINSRQ },
    TOK t_vpinsrq, TOKEN_INSN, C_none, 0, I_VPINSRQ

    ; { "vpmaddwd", TOKEN_INSN, C_none, 0, I_VPMADDWD },
    TOK t_vpmaddwd, TOKEN_INSN, C_none, 0, I_VPMADDWD

    ; { "vpmaddubsw", TOKEN_INSN, C_none, 0, I_VPMADDUBSW },
    TOK t_vpmaddubsw, TOKEN_INSN, C_none, 0, I_VPMADDUBSW

    ; { "vpmaxsb", TOKEN_INSN, C_none, 0, I_VPMAXSB },
    TOK t_vpmaxsb, TOKEN_INSN, C_none, 0, I_VPMAXSB

    ; { "vpmaxsw", TOKEN_INSN, C_none, 0, I_VPMAXSW },
    TOK t_vpmaxsw, TOKEN_INSN, C_none, 0, I_VPMAXSW

    ; { "vpmaxsd", TOKEN_INSN, C_none, 0, I_VPMAXSD },
    TOK t_vpmaxsd, TOKEN_INSN, C_none, 0, I_VPMAXSD

    ; { "vpmaxub", TOKEN_INSN, C_none, 0, I_VPMAXUB },
    TOK t_vpmaxub, TOKEN_INSN, C_none, 0, I_VPMAXUB

    ; { "vpmaxuw", TOKEN_INSN, C_none, 0, I_VPMAXUW },
    TOK t_vpmaxuw, TOKEN_INSN, C_none, 0, I_VPMAXUW

    ; { "vpmaxud", TOKEN_INSN, C_none, 0, I_VPMAXUD },
    TOK t_vpmaxud, TOKEN_INSN, C_none, 0, I_VPMAXUD

    ; { "vpminsb", TOKEN_INSN, C_none, 0, I_VPMINSB },
    TOK t_vpminsb, TOKEN_INSN, C_none, 0, I_VPMINSB

    ; { "vpminsw", TOKEN_INSN, C_none, 0, I_VPMINSW },
    TOK t_vpminsw, TOKEN_INSN, C_none, 0, I_VPMINSW

    ; { "vpminsd", TOKEN_INSN, C_none, 0, I_VPMINSD },
    TOK t_vpminsd, TOKEN_INSN, C_none, 0, I_VPMINSD

    ; { "vpminub", TOKEN_INSN, C_none, 0, I_VPMINUB },
    TOK t_vpminub, TOKEN_INSN, C_none, 0, I_VPMINUB

    ; { "vpminuw", TOKEN_INSN, C_none, 0, I_VPMINUW },
    TOK t_vpminuw, TOKEN_INSN, C_none, 0, I_VPMINUW

    ; { "vpminud", TOKEN_INSN, C_none, 0, I_VPMINUD },
    TOK t_vpminud, TOKEN_INSN, C_none, 0, I_VPMINUD

    ; { "vpmovmskb", TOKEN_INSN, C_none, 0, I_VPMOVMSKB },
    TOK t_vpmovmskb, TOKEN_INSN, C_none, 0, I_VPMOVMSKB

    ; { "vpmovsxbw", TOKEN_INSN, C_none, 0, I_VPMOVSXBW },
    TOK t_vpmovsxbw, TOKEN_INSN, C_none, 0, I_VPMOVSXBW

    ; { "vpmovsxbd", TOKEN_INSN, C_none, 0, I_VPMOVSXBD },
    TOK t_vpmovsxbd, TOKEN_INSN, C_none, 0, I_VPMOVSXBD

    ; { "vpmovsxbq", TOKEN_INSN, C_none, 0, I_VPMOVSXBQ },
    TOK t_vpmovsxbq, TOKEN_INSN, C_none, 0, I_VPMOVSXBQ

    ; { "vpmovsxwd", TOKEN_INSN, C_none, 0, I_VPMOVSXWD },
    TOK t_vpmovsxwd, TOKEN_INSN, C_none, 0, I_VPMOVSXWD

    ; { "vpmovsxwq", TOKEN_INSN, C_none, 0, I_VPMOVSXWQ },
    TOK t_vpmovsxwq, TOKEN_INSN, C_none, 0, I_VPMOVSXWQ

    ; { "vpmovsxdq", TOKEN_INSN, C_none, 0, I_VPMOVSXDQ },
    TOK t_vpmovsxdq, TOKEN_INSN, C_none, 0, I_VPMOVSXDQ

    ; { "vpmovzxbw", TOKEN_INSN, C_none, 0, I_VPMOVZXBW },
    TOK t_vpmovzxbw, TOKEN_INSN, C_none, 0, I_VPMOVZXBW

    ; { "vpmovzxbd", TOKEN_INSN, C_none, 0, I_VPMOVZXBD },
    TOK t_vpmovzxbd, TOKEN_INSN, C_none, 0, I_VPMOVZXBD

    ; { "vpmovzxbq", TOKEN_INSN, C_none, 0, I_VPMOVZXBQ },
    TOK t_vpmovzxbq, TOKEN_INSN, C_none, 0, I_VPMOVZXBQ

    ; { "vpmovzxwd", TOKEN_INSN, C_none, 0, I_VPMOVZXWD },
    TOK t_vpmovzxwd, TOKEN_INSN, C_none, 0, I_VPMOVZXWD

    ; { "vpmovzxwq", TOKEN_INSN, C_none, 0, I_VPMOVZXWQ },
    TOK t_vpmovzxwq, TOKEN_INSN, C_none, 0, I_VPMOVZXWQ

    ; { "vpmovzxdq", TOKEN_INSN, C_none, 0, I_VPMOVZXDQ },
    TOK t_vpmovzxdq, TOKEN_INSN, C_none, 0, I_VPMOVZXDQ

    ; { "vpmulhuw", TOKEN_INSN, C_none, 0, I_VPMULHUW },
    TOK t_vpmulhuw, TOKEN_INSN, C_none, 0, I_VPMULHUW

    ; { "vpmulhrsw", TOKEN_INSN, C_none, 0, I_VPMULHRSW },
    TOK t_vpmulhrsw, TOKEN_INSN, C_none, 0, I_VPMULHRSW

    ; { "vpmulhw", TOKEN_INSN, C_none, 0, I_VPMULHW },
    TOK t_vpmulhw, TOKEN_INSN, C_none, 0, I_VPMULHW

    ; { "vpmullw", TOKEN_INSN, C_none, 0, I_VPMULLW },
    TOK t_vpmullw, TOKEN_INSN, C_none, 0, I_VPMULLW

    ; { "vpmulld", TOKEN_INSN, C_none, 0, I_VPMULLD },
    TOK t_vpmulld, TOKEN_INSN, C_none, 0, I_VPMULLD

    ; { "vpmuludq", TOKEN_INSN, C_none, 0, I_VPMULUDQ },
    TOK t_vpmuludq, TOKEN_INSN, C_none, 0, I_VPMULUDQ

    ; { "vpmuldq", TOKEN_INSN, C_none, 0, I_VPMULDQ },
    TOK t_vpmuldq, TOKEN_INSN, C_none, 0, I_VPMULDQ

    ; { "vpor", TOKEN_INSN, C_none, 0, I_VPOR },
    TOK t_vpor, TOKEN_INSN, C_none, 0, I_VPOR

    ; { "vpsadbw", TOKEN_INSN, C_none, 0, I_VPSADBW },
    TOK t_vpsadbw, TOKEN_INSN, C_none, 0, I_VPSADBW

    ; { "vpshufb", TOKEN_INSN, C_none, 0, I_VPSHUFB },
    TOK t_vpshufb, TOKEN_INSN, C_none, 0, I_VPSHUFB

    ; { "vpshufd", TOKEN_INSN, C_none, 0, I_VPSHUFD },
    TOK t_vpshufd, TOKEN_INSN, C_none, 0, I_VPSHUFD

    ; { "vpshufhw", TOKEN_INSN, C_none, 0, I_VPSHUFHW },
    TOK t_vpshufhw, TOKEN_INSN, C_none, 0, I_VPSHUFHW

    ; { "vpshuflw", TOKEN_INSN, C_none, 0, I_VPSHUFLW },
    TOK t_vpshuflw, TOKEN_INSN, C_none, 0, I_VPSHUFLW

    ; { "vpsignb", TOKEN_INSN, C_none, 0, I_VPSIGNB },
    TOK t_vpsignb, TOKEN_INSN, C_none, 0, I_VPSIGNB

    ; { "vpsignw", TOKEN_INSN, C_none, 0, I_VPSIGNW },
    TOK t_vpsignw, TOKEN_INSN, C_none, 0, I_VPSIGNW

    ; { "vpsignd", TOKEN_INSN, C_none, 0, I_VPSIGND },
    TOK t_vpsignd, TOKEN_INSN, C_none, 0, I_VPSIGND

    ; { "vpslldq", TOKEN_INSN, C_none, 0, I_VPSLLDQ },
    TOK t_vpslldq, TOKEN_INSN, C_none, 0, I_VPSLLDQ

    ; { "vpsrldq", TOKEN_INSN, C_none, 0, I_VPSRLDQ },
    TOK t_vpsrldq, TOKEN_INSN, C_none, 0, I_VPSRLDQ

    ; { "vpsllw", TOKEN_INSN, C_none, 0, I_VPSLLW },
    TOK t_vpsllw, TOKEN_INSN, C_none, 0, I_VPSLLW

    ; { "vpslld", TOKEN_INSN, C_none, 0, I_VPSLLD },
    TOK t_vpslld, TOKEN_INSN, C_none, 0, I_VPSLLD

    ; { "vpsllq", TOKEN_INSN, C_none, 0, I_VPSLLQ },
    TOK t_vpsllq, TOKEN_INSN, C_none, 0, I_VPSLLQ

    ; { "vpsraw", TOKEN_INSN, C_none, 0, I_VPSRAW },
    TOK t_vpsraw, TOKEN_INSN, C_none, 0, I_VPSRAW

    ; { "vpsrad", TOKEN_INSN, C_none, 0, I_VPSRAD },
    TOK t_vpsrad, TOKEN_INSN, C_none, 0, I_VPSRAD

    ; { "vpsrlw", TOKEN_INSN, C_none, 0, I_VPSRLW },
    TOK t_vpsrlw, TOKEN_INSN, C_none, 0, I_VPSRLW

    ; { "vpsrld", TOKEN_INSN, C_none, 0, I_VPSRLD },
    TOK t_vpsrld, TOKEN_INSN, C_none, 0, I_VPSRLD

    ; { "vpsrlq", TOKEN_INSN, C_none, 0, I_VPSRLQ },
    TOK t_vpsrlq, TOKEN_INSN, C_none, 0, I_VPSRLQ

    ; { "vptest", TOKEN_INSN, C_none, 0, I_VPTEST },
    TOK t_vptest, TOKEN_INSN, C_none, 0, I_VPTEST

    ; { "vpsubb", TOKEN_INSN, C_none, 0, I_VPSUBB },
    TOK t_vpsubb, TOKEN_INSN, C_none, 0, I_VPSUBB

    ; { "vpsubw", TOKEN_INSN, C_none, 0, I_VPSUBW },
    TOK t_vpsubw, TOKEN_INSN, C_none, 0, I_VPSUBW

    ; { "vpsubd", TOKEN_INSN, C_none, 0, I_VPSUBD },
    TOK t_vpsubd, TOKEN_INSN, C_none, 0, I_VPSUBD

    ; { "vpsubq", TOKEN_INSN, C_none, 0, I_VPSUBQ },
    TOK t_vpsubq, TOKEN_INSN, C_none, 0, I_VPSUBQ

    ; { "vpsubsb", TOKEN_INSN, C_none, 0, I_VPSUBSB },
    TOK t_vpsubsb, TOKEN_INSN, C_none, 0, I_VPSUBSB

    ; { "vpsubsw", TOKEN_INSN, C_none, 0, I_VPSUBSW },
    TOK t_vpsubsw, TOKEN_INSN, C_none, 0, I_VPSUBSW

    ; { "vpsubusb", TOKEN_INSN, C_none, 0, I_VPSUBUSB },
    TOK t_vpsubusb, TOKEN_INSN, C_none, 0, I_VPSUBUSB

    ; { "vpsubusw", TOKEN_INSN, C_none, 0, I_VPSUBUSW },
    TOK t_vpsubusw, TOKEN_INSN, C_none, 0, I_VPSUBUSW

    ; { "vpunpckhbw", TOKEN_INSN, C_none, 0, I_VPUNPCKHBW },
    TOK t_vpunpckhbw, TOKEN_INSN, C_none, 0, I_VPUNPCKHBW

    ; { "vpunpckhwd", TOKEN_INSN, C_none, 0, I_VPUNPCKHWD },
    TOK t_vpunpckhwd, TOKEN_INSN, C_none, 0, I_VPUNPCKHWD

    ; { "vpunpckhdq", TOKEN_INSN, C_none, 0, I_VPUNPCKHDQ },
    TOK t_vpunpckhdq, TOKEN_INSN, C_none, 0, I_VPUNPCKHDQ

    ; { "vpunpckhqdq", TOKEN_INSN, C_none, 0, I_VPUNPCKHQDQ },
    TOK t_vpunpckhqdq, TOKEN_INSN, C_none, 0, I_VPUNPCKHQDQ

    ; { "vpunpcklbw", TOKEN_INSN, C_none, 0, I_VPUNPCKLBW },
    TOK t_vpunpcklbw, TOKEN_INSN, C_none, 0, I_VPUNPCKLBW

    ; { "vpunpcklwd", TOKEN_INSN, C_none, 0, I_VPUNPCKLWD },
    TOK t_vpunpcklwd, TOKEN_INSN, C_none, 0, I_VPUNPCKLWD

    ; { "vpunpckldq", TOKEN_INSN, C_none, 0, I_VPUNPCKLDQ },
    TOK t_vpunpckldq, TOKEN_INSN, C_none, 0, I_VPUNPCKLDQ

    ; { "vpunpcklqdq", TOKEN_INSN, C_none, 0, I_VPUNPCKLQDQ },
    TOK t_vpunpcklqdq, TOKEN_INSN, C_none, 0, I_VPUNPCKLQDQ

    ; { "vpxor", TOKEN_INSN, C_none, 0, I_VPXOR },
    TOK t_vpxor, TOKEN_INSN, C_none, 0, I_VPXOR

    ; { "vrcpps", TOKEN_INSN, C_none, 0, I_VRCPPS },
    TOK t_vrcpps, TOKEN_INSN, C_none, 0, I_VRCPPS

    ; { "vrcpss", TOKEN_INSN, C_none, 0, I_VRCPSS },
    TOK t_vrcpss, TOKEN_INSN, C_none, 0, I_VRCPSS

    ; { "vrsqrtps", TOKEN_INSN, C_none, 0, I_VRSQRTPS },
    TOK t_vrsqrtps, TOKEN_INSN, C_none, 0, I_VRSQRTPS

    ; { "vrsqrtss", TOKEN_INSN, C_none, 0, I_VRSQRTSS },
    TOK t_vrsqrtss, TOKEN_INSN, C_none, 0, I_VRSQRTSS

    ; { "vroundpd", TOKEN_INSN, C_none, 0, I_VROUNDPD },
    TOK t_vroundpd, TOKEN_INSN, C_none, 0, I_VROUNDPD

    ; { "vroundps", TOKEN_INSN, C_none, 0, I_VROUNDPS },
    TOK t_vroundps, TOKEN_INSN, C_none, 0, I_VROUNDPS

    ; { "vroundsd", TOKEN_INSN, C_none, 0, I_VROUNDSD },
    TOK t_vroundsd, TOKEN_INSN, C_none, 0, I_VROUNDSD

    ; { "vroundss", TOKEN_INSN, C_none, 0, I_VROUNDSS },
    TOK t_vroundss, TOKEN_INSN, C_none, 0, I_VROUNDSS

    ; { "vshufpd", TOKEN_INSN, C_none, 0, I_VSHUFPD },
    TOK t_vshufpd, TOKEN_INSN, C_none, 0, I_VSHUFPD

    ; { "vshufps", TOKEN_INSN, C_none, 0, I_VSHUFPS },
    TOK t_vshufps, TOKEN_INSN, C_none, 0, I_VSHUFPS

    ; { "vsqrtpd", TOKEN_INSN, C_none, 0, I_VSQRTPD },
    TOK t_vsqrtpd, TOKEN_INSN, C_none, 0, I_VSQRTPD

    ; { "vsqrtps", TOKEN_INSN, C_none, 0, I_VSQRTPS },
    TOK t_vsqrtps, TOKEN_INSN, C_none, 0, I_VSQRTPS

    ; { "vsqrtsd", TOKEN_INSN, C_none, 0, I_VSQRTSD },
    TOK t_vsqrtsd, TOKEN_INSN, C_none, 0, I_VSQRTSD

    ; { "vsqrtss", TOKEN_INSN, C_none, 0, I_VSQRTSS },
    TOK t_vsqrtss, TOKEN_INSN, C_none, 0, I_VSQRTSS

    ; { "vstmxcsr", TOKEN_INSN, C_none, 0, I_VSTMXCSR },
    TOK t_vstmxcsr, TOKEN_INSN, C_none, 0, I_VSTMXCSR

    ; { "vsubpd", TOKEN_INSN, C_none, 0, I_VSUBPD },
    TOK t_vsubpd, TOKEN_INSN, C_none, 0, I_VSUBPD

    ; { "vsubps", TOKEN_INSN, C_none, 0, I_VSUBPS },
    TOK t_vsubps, TOKEN_INSN, C_none, 0, I_VSUBPS

    ; { "vsubsd", TOKEN_INSN, C_none, 0, I_VSUBSD },
    TOK t_vsubsd, TOKEN_INSN, C_none, 0, I_VSUBSD

    ; { "vsubss", TOKEN_INSN, C_none, 0, I_VSUBSS },
    TOK t_vsubss, TOKEN_INSN, C_none, 0, I_VSUBSS

    ; { "vtestps", TOKEN_INSN, C_none, 0, I_VTESTPS },
    TOK t_vtestps, TOKEN_INSN, C_none, 0, I_VTESTPS

    ; { "vtestpd", TOKEN_INSN, C_none, 0, I_VTESTPD },
    TOK t_vtestpd, TOKEN_INSN, C_none, 0, I_VTESTPD

    ; { "vucomisd", TOKEN_INSN, C_none, 0, I_VUCOMISD },
    TOK t_vucomisd, TOKEN_INSN, C_none, 0, I_VUCOMISD

    ; { "vucomiss", TOKEN_INSN, C_none, 0, I_VUCOMISS },
    TOK t_vucomiss, TOKEN_INSN, C_none, 0, I_VUCOMISS

    ; { "vunpckhpd", TOKEN_INSN, C_none, 0, I_VUNPCKHPD },
    TOK t_vunpckhpd, TOKEN_INSN, C_none, 0, I_VUNPCKHPD

    ; { "vunpckhps", TOKEN_INSN, C_none, 0, I_VUNPCKHPS },
    TOK t_vunpckhps, TOKEN_INSN, C_none, 0, I_VUNPCKHPS

    ; { "vunpcklpd", TOKEN_INSN, C_none, 0, I_VUNPCKLPD },
    TOK t_vunpcklpd, TOKEN_INSN, C_none, 0, I_VUNPCKLPD

    ; { "vunpcklps", TOKEN_INSN, C_none, 0, I_VUNPCKLPS },
    TOK t_vunpcklps, TOKEN_INSN, C_none, 0, I_VUNPCKLPS

    ; { "vxorpd", TOKEN_INSN, C_none, 0, I_VXORPD },
    TOK t_vxorpd, TOKEN_INSN, C_none, 0, I_VXORPD

    ; { "vxorps", TOKEN_INSN, C_none, 0, I_VXORPS },
    TOK t_vxorps, TOKEN_INSN, C_none, 0, I_VXORPS

    ; { "vzeroall", TOKEN_INSN, C_none, 0, I_VZEROALL },
    TOK t_vzeroall, TOKEN_INSN, C_none, 0, I_VZEROALL

    ; { "vzeroupper", TOKEN_INSN, C_none, 0, I_VZEROUPPER },
    TOK t_vzeroupper, TOKEN_INSN, C_none, 0, I_VZEROUPPER

    ; { "pclmullqlqdq", TOKEN_INSN, C_none, 0, I_PCLMULLQLQDQ },
    TOK t_pclmullqlqdq, TOKEN_INSN, C_none, 0, I_PCLMULLQLQDQ

    ; { "pclmulhqlqdq", TOKEN_INSN, C_none, 0, I_PCLMULHQLQDQ },
    TOK t_pclmulhqlqdq, TOKEN_INSN, C_none, 0, I_PCLMULHQLQDQ

    ; { "pclmullqhqdq", TOKEN_INSN, C_none, 0, I_PCLMULLQHQDQ },
    TOK t_pclmullqhqdq, TOKEN_INSN, C_none, 0, I_PCLMULLQHQDQ

    ; { "pclmulhqhqdq", TOKEN_INSN, C_none, 0, I_PCLMULHQHQDQ },
    TOK t_pclmulhqhqdq, TOKEN_INSN, C_none, 0, I_PCLMULHQHQDQ

    ; { "pclmulqdq", TOKEN_INSN, C_none, 0, I_PCLMULQDQ },
    TOK t_pclmulqdq, TOKEN_INSN, C_none, 0, I_PCLMULQDQ

    ; { "vpclmullqlqdq", TOKEN_INSN, C_none, 0, I_VPCLMULLQLQDQ },
    TOK t_vpclmullqlqdq, TOKEN_INSN, C_none, 0, I_VPCLMULLQLQDQ

    ; { "vpclmulhqlqdq", TOKEN_INSN, C_none, 0, I_VPCLMULHQLQDQ },
    TOK t_vpclmulhqlqdq, TOKEN_INSN, C_none, 0, I_VPCLMULHQLQDQ

    ; { "vpclmullqhqdq", TOKEN_INSN, C_none, 0, I_VPCLMULLQHQDQ },
    TOK t_vpclmullqhqdq, TOKEN_INSN, C_none, 0, I_VPCLMULLQHQDQ

    ; { "vpclmulhqhqdq", TOKEN_INSN, C_none, 0, I_VPCLMULHQHQDQ },
    TOK t_vpclmulhqhqdq, TOKEN_INSN, C_none, 0, I_VPCLMULHQHQDQ

    ; { "vpclmulqdq", TOKEN_INSN, C_none, 0, I_VPCLMULQDQ },
    TOK t_vpclmulqdq, TOKEN_INSN, C_none, 0, I_VPCLMULQDQ

    ; { "vfmadd132ps", TOKEN_INSN, C_none, 0, I_VFMADD132PS },
    TOK t_vfmadd132ps, TOKEN_INSN, C_none, 0, I_VFMADD132PS

    ; { "vfmadd132pd", TOKEN_INSN, C_none, 0, I_VFMADD132PD },
    TOK t_vfmadd132pd, TOKEN_INSN, C_none, 0, I_VFMADD132PD

    ; { "vfmadd312ps", TOKEN_INSN, C_none, 0, I_VFMADD312PS },
    TOK t_vfmadd312ps, TOKEN_INSN, C_none, 0, I_VFMADD312PS

    ; { "vfmadd312pd", TOKEN_INSN, C_none, 0, I_VFMADD312PD },
    TOK t_vfmadd312pd, TOKEN_INSN, C_none, 0, I_VFMADD312PD

    ; { "vfmadd213ps", TOKEN_INSN, C_none, 0, I_VFMADD213PS },
    TOK t_vfmadd213ps, TOKEN_INSN, C_none, 0, I_VFMADD213PS

    ; { "vfmadd213pd", TOKEN_INSN, C_none, 0, I_VFMADD213PD },
    TOK t_vfmadd213pd, TOKEN_INSN, C_none, 0, I_VFMADD213PD

    ; { "vfmadd123ps", TOKEN_INSN, C_none, 0, I_VFMADD123PS },
    TOK t_vfmadd123ps, TOKEN_INSN, C_none, 0, I_VFMADD123PS

    ; { "vfmadd123pd", TOKEN_INSN, C_none, 0, I_VFMADD123PD },
    TOK t_vfmadd123pd, TOKEN_INSN, C_none, 0, I_VFMADD123PD

    ; { "vfmadd231ps", TOKEN_INSN, C_none, 0, I_VFMADD231PS },
    TOK t_vfmadd231ps, TOKEN_INSN, C_none, 0, I_VFMADD231PS

    ; { "vfmadd231pd", TOKEN_INSN, C_none, 0, I_VFMADD231PD },
    TOK t_vfmadd231pd, TOKEN_INSN, C_none, 0, I_VFMADD231PD

    ; { "vfmadd321ps", TOKEN_INSN, C_none, 0, I_VFMADD321PS },
    TOK t_vfmadd321ps, TOKEN_INSN, C_none, 0, I_VFMADD321PS

    ; { "vfmadd321pd", TOKEN_INSN, C_none, 0, I_VFMADD321PD },
    TOK t_vfmadd321pd, TOKEN_INSN, C_none, 0, I_VFMADD321PD

    ; { "vfmaddsub132ps", TOKEN_INSN, C_none, 0, I_VFMADDSUB132PS },
    TOK t_vfmaddsub132ps, TOKEN_INSN, C_none, 0, I_VFMADDSUB132PS

    ; { "vfmaddsub132pd", TOKEN_INSN, C_none, 0, I_VFMADDSUB132PD },
    TOK t_vfmaddsub132pd, TOKEN_INSN, C_none, 0, I_VFMADDSUB132PD

    ; { "vfmaddsub312ps", TOKEN_INSN, C_none, 0, I_VFMADDSUB312PS },
    TOK t_vfmaddsub312ps, TOKEN_INSN, C_none, 0, I_VFMADDSUB312PS

    ; { "vfmaddsub312pd", TOKEN_INSN, C_none, 0, I_VFMADDSUB312PD },
    TOK t_vfmaddsub312pd, TOKEN_INSN, C_none, 0, I_VFMADDSUB312PD

    ; { "vfmaddsub213ps", TOKEN_INSN, C_none, 0, I_VFMADDSUB213PS },
    TOK t_vfmaddsub213ps, TOKEN_INSN, C_none, 0, I_VFMADDSUB213PS

    ; { "vfmaddsub213pd", TOKEN_INSN, C_none, 0, I_VFMADDSUB213PD },
    TOK t_vfmaddsub213pd, TOKEN_INSN, C_none, 0, I_VFMADDSUB213PD

    ; { "vfmaddsub123ps", TOKEN_INSN, C_none, 0, I_VFMADDSUB123PS },
    TOK t_vfmaddsub123ps, TOKEN_INSN, C_none, 0, I_VFMADDSUB123PS

    ; { "vfmaddsub123pd", TOKEN_INSN, C_none, 0, I_VFMADDSUB123PD },
    TOK t_vfmaddsub123pd, TOKEN_INSN, C_none, 0, I_VFMADDSUB123PD

    ; { "vfmaddsub231ps", TOKEN_INSN, C_none, 0, I_VFMADDSUB231PS },
    TOK t_vfmaddsub231ps, TOKEN_INSN, C_none, 0, I_VFMADDSUB231PS

    ; { "vfmaddsub231pd", TOKEN_INSN, C_none, 0, I_VFMADDSUB231PD },
    TOK t_vfmaddsub231pd, TOKEN_INSN, C_none, 0, I_VFMADDSUB231PD

    ; { "vfmaddsub321ps", TOKEN_INSN, C_none, 0, I_VFMADDSUB321PS },
    TOK t_vfmaddsub321ps, TOKEN_INSN, C_none, 0, I_VFMADDSUB321PS

    ; { "vfmaddsub321pd", TOKEN_INSN, C_none, 0, I_VFMADDSUB321PD },
    TOK t_vfmaddsub321pd, TOKEN_INSN, C_none, 0, I_VFMADDSUB321PD

    ; { "vfmsub132ps", TOKEN_INSN, C_none, 0, I_VFMSUB132PS },
    TOK t_vfmsub132ps, TOKEN_INSN, C_none, 0, I_VFMSUB132PS

    ; { "vfmsub132pd", TOKEN_INSN, C_none, 0, I_VFMSUB132PD },
    TOK t_vfmsub132pd, TOKEN_INSN, C_none, 0, I_VFMSUB132PD

    ; { "vfmsub312ps", TOKEN_INSN, C_none, 0, I_VFMSUB312PS },
    TOK t_vfmsub312ps, TOKEN_INSN, C_none, 0, I_VFMSUB312PS

    ; { "vfmsub312pd", TOKEN_INSN, C_none, 0, I_VFMSUB312PD },
    TOK t_vfmsub312pd, TOKEN_INSN, C_none, 0, I_VFMSUB312PD

    ; { "vfmsub213ps", TOKEN_INSN, C_none, 0, I_VFMSUB213PS },
    TOK t_vfmsub213ps, TOKEN_INSN, C_none, 0, I_VFMSUB213PS

    ; { "vfmsub213pd", TOKEN_INSN, C_none, 0, I_VFMSUB213PD },
    TOK t_vfmsub213pd, TOKEN_INSN, C_none, 0, I_VFMSUB213PD

    ; { "vfmsub123ps", TOKEN_INSN, C_none, 0, I_VFMSUB123PS },
    TOK t_vfmsub123ps, TOKEN_INSN, C_none, 0, I_VFMSUB123PS

    ; { "vfmsub123pd", TOKEN_INSN, C_none, 0, I_VFMSUB123PD },
    TOK t_vfmsub123pd, TOKEN_INSN, C_none, 0, I_VFMSUB123PD

    ; { "vfmsub231ps", TOKEN_INSN, C_none, 0, I_VFMSUB231PS },
    TOK t_vfmsub231ps, TOKEN_INSN, C_none, 0, I_VFMSUB231PS

    ; { "vfmsub231pd", TOKEN_INSN, C_none, 0, I_VFMSUB231PD },
    TOK t_vfmsub231pd, TOKEN_INSN, C_none, 0, I_VFMSUB231PD

    ; { "vfmsub321ps", TOKEN_INSN, C_none, 0, I_VFMSUB321PS },
    TOK t_vfmsub321ps, TOKEN_INSN, C_none, 0, I_VFMSUB321PS

    ; { "vfmsub321pd", TOKEN_INSN, C_none, 0, I_VFMSUB321PD },
    TOK t_vfmsub321pd, TOKEN_INSN, C_none, 0, I_VFMSUB321PD

    ; { "vfmsubadd132ps", TOKEN_INSN, C_none, 0, I_VFMSUBADD132PS },
    TOK t_vfmsubadd132ps, TOKEN_INSN, C_none, 0, I_VFMSUBADD132PS

    ; { "vfmsubadd132pd", TOKEN_INSN, C_none, 0, I_VFMSUBADD132PD },
    TOK t_vfmsubadd132pd, TOKEN_INSN, C_none, 0, I_VFMSUBADD132PD

    ; { "vfmsubadd312ps", TOKEN_INSN, C_none, 0, I_VFMSUBADD312PS },
    TOK t_vfmsubadd312ps, TOKEN_INSN, C_none, 0, I_VFMSUBADD312PS

    ; { "vfmsubadd312pd", TOKEN_INSN, C_none, 0, I_VFMSUBADD312PD },
    TOK t_vfmsubadd312pd, TOKEN_INSN, C_none, 0, I_VFMSUBADD312PD

    ; { "vfmsubadd213ps", TOKEN_INSN, C_none, 0, I_VFMSUBADD213PS },
    TOK t_vfmsubadd213ps, TOKEN_INSN, C_none, 0, I_VFMSUBADD213PS

    ; { "vfmsubadd213pd", TOKEN_INSN, C_none, 0, I_VFMSUBADD213PD },
    TOK t_vfmsubadd213pd, TOKEN_INSN, C_none, 0, I_VFMSUBADD213PD

    ; { "vfmsubadd123ps", TOKEN_INSN, C_none, 0, I_VFMSUBADD123PS },
    TOK t_vfmsubadd123ps, TOKEN_INSN, C_none, 0, I_VFMSUBADD123PS

    ; { "vfmsubadd123pd", TOKEN_INSN, C_none, 0, I_VFMSUBADD123PD },
    TOK t_vfmsubadd123pd, TOKEN_INSN, C_none, 0, I_VFMSUBADD123PD

    ; { "vfmsubadd231ps", TOKEN_INSN, C_none, 0, I_VFMSUBADD231PS },
    TOK t_vfmsubadd231ps, TOKEN_INSN, C_none, 0, I_VFMSUBADD231PS

    ; { "vfmsubadd231pd", TOKEN_INSN, C_none, 0, I_VFMSUBADD231PD },
    TOK t_vfmsubadd231pd, TOKEN_INSN, C_none, 0, I_VFMSUBADD231PD

    ; { "vfmsubadd321ps", TOKEN_INSN, C_none, 0, I_VFMSUBADD321PS },
    TOK t_vfmsubadd321ps, TOKEN_INSN, C_none, 0, I_VFMSUBADD321PS

    ; { "vfmsubadd321pd", TOKEN_INSN, C_none, 0, I_VFMSUBADD321PD },
    TOK t_vfmsubadd321pd, TOKEN_INSN, C_none, 0, I_VFMSUBADD321PD

    ; { "vfnmadd132ps", TOKEN_INSN, C_none, 0, I_VFNMADD132PS },
    TOK t_vfnmadd132ps, TOKEN_INSN, C_none, 0, I_VFNMADD132PS

    ; { "vfnmadd132pd", TOKEN_INSN, C_none, 0, I_VFNMADD132PD },
    TOK t_vfnmadd132pd, TOKEN_INSN, C_none, 0, I_VFNMADD132PD

    ; { "vfnmadd312ps", TOKEN_INSN, C_none, 0, I_VFNMADD312PS },
    TOK t_vfnmadd312ps, TOKEN_INSN, C_none, 0, I_VFNMADD312PS

    ; { "vfnmadd312pd", TOKEN_INSN, C_none, 0, I_VFNMADD312PD },
    TOK t_vfnmadd312pd, TOKEN_INSN, C_none, 0, I_VFNMADD312PD

    ; { "vfnmadd213ps", TOKEN_INSN, C_none, 0, I_VFNMADD213PS },
    TOK t_vfnmadd213ps, TOKEN_INSN, C_none, 0, I_VFNMADD213PS

    ; { "vfnmadd213pd", TOKEN_INSN, C_none, 0, I_VFNMADD213PD },
    TOK t_vfnmadd213pd, TOKEN_INSN, C_none, 0, I_VFNMADD213PD

    ; { "vfnmadd123ps", TOKEN_INSN, C_none, 0, I_VFNMADD123PS },
    TOK t_vfnmadd123ps, TOKEN_INSN, C_none, 0, I_VFNMADD123PS

    ; { "vfnmadd123pd", TOKEN_INSN, C_none, 0, I_VFNMADD123PD },
    TOK t_vfnmadd123pd, TOKEN_INSN, C_none, 0, I_VFNMADD123PD

    ; { "vfnmadd231ps", TOKEN_INSN, C_none, 0, I_VFNMADD231PS },
    TOK t_vfnmadd231ps, TOKEN_INSN, C_none, 0, I_VFNMADD231PS

    ; { "vfnmadd231pd", TOKEN_INSN, C_none, 0, I_VFNMADD231PD },
    TOK t_vfnmadd231pd, TOKEN_INSN, C_none, 0, I_VFNMADD231PD

    ; { "vfnmadd321ps", TOKEN_INSN, C_none, 0, I_VFNMADD321PS },
    TOK t_vfnmadd321ps, TOKEN_INSN, C_none, 0, I_VFNMADD321PS

    ; { "vfnmadd321pd", TOKEN_INSN, C_none, 0, I_VFNMADD321PD },
    TOK t_vfnmadd321pd, TOKEN_INSN, C_none, 0, I_VFNMADD321PD

    ; { "vfnmsub132ps", TOKEN_INSN, C_none, 0, I_VFNMSUB132PS },
    TOK t_vfnmsub132ps, TOKEN_INSN, C_none, 0, I_VFNMSUB132PS

    ; { "vfnmsub132pd", TOKEN_INSN, C_none, 0, I_VFNMSUB132PD },
    TOK t_vfnmsub132pd, TOKEN_INSN, C_none, 0, I_VFNMSUB132PD

    ; { "vfnmsub312ps", TOKEN_INSN, C_none, 0, I_VFNMSUB312PS },
    TOK t_vfnmsub312ps, TOKEN_INSN, C_none, 0, I_VFNMSUB312PS

    ; { "vfnmsub312pd", TOKEN_INSN, C_none, 0, I_VFNMSUB312PD },
    TOK t_vfnmsub312pd, TOKEN_INSN, C_none, 0, I_VFNMSUB312PD

    ; { "vfnmsub213ps", TOKEN_INSN, C_none, 0, I_VFNMSUB213PS },
    TOK t_vfnmsub213ps, TOKEN_INSN, C_none, 0, I_VFNMSUB213PS

    ; { "vfnmsub213pd", TOKEN_INSN, C_none, 0, I_VFNMSUB213PD },
    TOK t_vfnmsub213pd, TOKEN_INSN, C_none, 0, I_VFNMSUB213PD

    ; { "vfnmsub123ps", TOKEN_INSN, C_none, 0, I_VFNMSUB123PS },
    TOK t_vfnmsub123ps, TOKEN_INSN, C_none, 0, I_VFNMSUB123PS

    ; { "vfnmsub123pd", TOKEN_INSN, C_none, 0, I_VFNMSUB123PD },
    TOK t_vfnmsub123pd, TOKEN_INSN, C_none, 0, I_VFNMSUB123PD

    ; { "vfnmsub231ps", TOKEN_INSN, C_none, 0, I_VFNMSUB231PS },
    TOK t_vfnmsub231ps, TOKEN_INSN, C_none, 0, I_VFNMSUB231PS

    ; { "vfnmsub231pd", TOKEN_INSN, C_none, 0, I_VFNMSUB231PD },
    TOK t_vfnmsub231pd, TOKEN_INSN, C_none, 0, I_VFNMSUB231PD

    ; { "vfnmsub321ps", TOKEN_INSN, C_none, 0, I_VFNMSUB321PS },
    TOK t_vfnmsub321ps, TOKEN_INSN, C_none, 0, I_VFNMSUB321PS

    ; { "vfnmsub321pd", TOKEN_INSN, C_none, 0, I_VFNMSUB321PD },
    TOK t_vfnmsub321pd, TOKEN_INSN, C_none, 0, I_VFNMSUB321PD

    ; { "vfmadd132ss", TOKEN_INSN, C_none, 0, I_VFMADD132SS },
    TOK t_vfmadd132ss, TOKEN_INSN, C_none, 0, I_VFMADD132SS

    ; { "vfmadd132sd", TOKEN_INSN, C_none, 0, I_VFMADD132SD },
    TOK t_vfmadd132sd, TOKEN_INSN, C_none, 0, I_VFMADD132SD

    ; { "vfmadd312ss", TOKEN_INSN, C_none, 0, I_VFMADD312SS },
    TOK t_vfmadd312ss, TOKEN_INSN, C_none, 0, I_VFMADD312SS

    ; { "vfmadd312sd", TOKEN_INSN, C_none, 0, I_VFMADD312SD },
    TOK t_vfmadd312sd, TOKEN_INSN, C_none, 0, I_VFMADD312SD

    ; { "vfmadd213ss", TOKEN_INSN, C_none, 0, I_VFMADD213SS },
    TOK t_vfmadd213ss, TOKEN_INSN, C_none, 0, I_VFMADD213SS

    ; { "vfmadd213sd", TOKEN_INSN, C_none, 0, I_VFMADD213SD },
    TOK t_vfmadd213sd, TOKEN_INSN, C_none, 0, I_VFMADD213SD

    ; { "vfmadd123ss", TOKEN_INSN, C_none, 0, I_VFMADD123SS },
    TOK t_vfmadd123ss, TOKEN_INSN, C_none, 0, I_VFMADD123SS

    ; { "vfmadd123sd", TOKEN_INSN, C_none, 0, I_VFMADD123SD },
    TOK t_vfmadd123sd, TOKEN_INSN, C_none, 0, I_VFMADD123SD

    ; { "vfmadd231ss", TOKEN_INSN, C_none, 0, I_VFMADD231SS },
    TOK t_vfmadd231ss, TOKEN_INSN, C_none, 0, I_VFMADD231SS

    ; { "vfmadd231sd", TOKEN_INSN, C_none, 0, I_VFMADD231SD },
    TOK t_vfmadd231sd, TOKEN_INSN, C_none, 0, I_VFMADD231SD

    ; { "vfmadd321ss", TOKEN_INSN, C_none, 0, I_VFMADD321SS },
    TOK t_vfmadd321ss, TOKEN_INSN, C_none, 0, I_VFMADD321SS

    ; { "vfmadd321sd", TOKEN_INSN, C_none, 0, I_VFMADD321SD },
    TOK t_vfmadd321sd, TOKEN_INSN, C_none, 0, I_VFMADD321SD

    ; { "vfmsub132ss", TOKEN_INSN, C_none, 0, I_VFMSUB132SS },
    TOK t_vfmsub132ss, TOKEN_INSN, C_none, 0, I_VFMSUB132SS

    ; { "vfmsub132sd", TOKEN_INSN, C_none, 0, I_VFMSUB132SD },
    TOK t_vfmsub132sd, TOKEN_INSN, C_none, 0, I_VFMSUB132SD

    ; { "vfmsub312ss", TOKEN_INSN, C_none, 0, I_VFMSUB312SS },
    TOK t_vfmsub312ss, TOKEN_INSN, C_none, 0, I_VFMSUB312SS

    ; { "vfmsub312sd", TOKEN_INSN, C_none, 0, I_VFMSUB312SD },
    TOK t_vfmsub312sd, TOKEN_INSN, C_none, 0, I_VFMSUB312SD

    ; { "vfmsub213ss", TOKEN_INSN, C_none, 0, I_VFMSUB213SS },
    TOK t_vfmsub213ss, TOKEN_INSN, C_none, 0, I_VFMSUB213SS

    ; { "vfmsub213sd", TOKEN_INSN, C_none, 0, I_VFMSUB213SD },
    TOK t_vfmsub213sd, TOKEN_INSN, C_none, 0, I_VFMSUB213SD

    ; { "vfmsub123ss", TOKEN_INSN, C_none, 0, I_VFMSUB123SS },
    TOK t_vfmsub123ss, TOKEN_INSN, C_none, 0, I_VFMSUB123SS

    ; { "vfmsub123sd", TOKEN_INSN, C_none, 0, I_VFMSUB123SD },
    TOK t_vfmsub123sd, TOKEN_INSN, C_none, 0, I_VFMSUB123SD

    ; { "vfmsub231ss", TOKEN_INSN, C_none, 0, I_VFMSUB231SS },
    TOK t_vfmsub231ss, TOKEN_INSN, C_none, 0, I_VFMSUB231SS

    ; { "vfmsub231sd", TOKEN_INSN, C_none, 0, I_VFMSUB231SD },
    TOK t_vfmsub231sd, TOKEN_INSN, C_none, 0, I_VFMSUB231SD

    ; { "vfmsub321ss", TOKEN_INSN, C_none, 0, I_VFMSUB321SS },
    TOK t_vfmsub321ss, TOKEN_INSN, C_none, 0, I_VFMSUB321SS

    ; { "vfmsub321sd", TOKEN_INSN, C_none, 0, I_VFMSUB321SD },
    TOK t_vfmsub321sd, TOKEN_INSN, C_none, 0, I_VFMSUB321SD

    ; { "vfnmadd132ss", TOKEN_INSN, C_none, 0, I_VFNMADD132SS },
    TOK t_vfnmadd132ss, TOKEN_INSN, C_none, 0, I_VFNMADD132SS

    ; { "vfnmadd132sd", TOKEN_INSN, C_none, 0, I_VFNMADD132SD },
    TOK t_vfnmadd132sd, TOKEN_INSN, C_none, 0, I_VFNMADD132SD

    ; { "vfnmadd312ss", TOKEN_INSN, C_none, 0, I_VFNMADD312SS },
    TOK t_vfnmadd312ss, TOKEN_INSN, C_none, 0, I_VFNMADD312SS

    ; { "vfnmadd312sd", TOKEN_INSN, C_none, 0, I_VFNMADD312SD },
    TOK t_vfnmadd312sd, TOKEN_INSN, C_none, 0, I_VFNMADD312SD

    ; { "vfnmadd213ss", TOKEN_INSN, C_none, 0, I_VFNMADD213SS },
    TOK t_vfnmadd213ss, TOKEN_INSN, C_none, 0, I_VFNMADD213SS

    ; { "vfnmadd213sd", TOKEN_INSN, C_none, 0, I_VFNMADD213SD },
    TOK t_vfnmadd213sd, TOKEN_INSN, C_none, 0, I_VFNMADD213SD

    ; { "vfnmadd123ss", TOKEN_INSN, C_none, 0, I_VFNMADD123SS },
    TOK t_vfnmadd123ss, TOKEN_INSN, C_none, 0, I_VFNMADD123SS

    ; { "vfnmadd123sd", TOKEN_INSN, C_none, 0, I_VFNMADD123SD },
    TOK t_vfnmadd123sd, TOKEN_INSN, C_none, 0, I_VFNMADD123SD

    ; { "vfnmadd231ss", TOKEN_INSN, C_none, 0, I_VFNMADD231SS },
    TOK t_vfnmadd231ss, TOKEN_INSN, C_none, 0, I_VFNMADD231SS

    ; { "vfnmadd231sd", TOKEN_INSN, C_none, 0, I_VFNMADD231SD },
    TOK t_vfnmadd231sd, TOKEN_INSN, C_none, 0, I_VFNMADD231SD

    ; { "vfnmadd321ss", TOKEN_INSN, C_none, 0, I_VFNMADD321SS },
    TOK t_vfnmadd321ss, TOKEN_INSN, C_none, 0, I_VFNMADD321SS

    ; { "vfnmadd321sd", TOKEN_INSN, C_none, 0, I_VFNMADD321SD },
    TOK t_vfnmadd321sd, TOKEN_INSN, C_none, 0, I_VFNMADD321SD

    ; { "vfnmsub132ss", TOKEN_INSN, C_none, 0, I_VFNMSUB132SS },
    TOK t_vfnmsub132ss, TOKEN_INSN, C_none, 0, I_VFNMSUB132SS

    ; { "vfnmsub132sd", TOKEN_INSN, C_none, 0, I_VFNMSUB132SD },
    TOK t_vfnmsub132sd, TOKEN_INSN, C_none, 0, I_VFNMSUB132SD

    ; { "vfnmsub312ss", TOKEN_INSN, C_none, 0, I_VFNMSUB312SS },
    TOK t_vfnmsub312ss, TOKEN_INSN, C_none, 0, I_VFNMSUB312SS

    ; { "vfnmsub312sd", TOKEN_INSN, C_none, 0, I_VFNMSUB312SD },
    TOK t_vfnmsub312sd, TOKEN_INSN, C_none, 0, I_VFNMSUB312SD

    ; { "vfnmsub213ss", TOKEN_INSN, C_none, 0, I_VFNMSUB213SS },
    TOK t_vfnmsub213ss, TOKEN_INSN, C_none, 0, I_VFNMSUB213SS

    ; { "vfnmsub213sd", TOKEN_INSN, C_none, 0, I_VFNMSUB213SD },
    TOK t_vfnmsub213sd, TOKEN_INSN, C_none, 0, I_VFNMSUB213SD

    ; { "vfnmsub123ss", TOKEN_INSN, C_none, 0, I_VFNMSUB123SS },
    TOK t_vfnmsub123ss, TOKEN_INSN, C_none, 0, I_VFNMSUB123SS

    ; { "vfnmsub123sd", TOKEN_INSN, C_none, 0, I_VFNMSUB123SD },
    TOK t_vfnmsub123sd, TOKEN_INSN, C_none, 0, I_VFNMSUB123SD

    ; { "vfnmsub231ss", TOKEN_INSN, C_none, 0, I_VFNMSUB231SS },
    TOK t_vfnmsub231ss, TOKEN_INSN, C_none, 0, I_VFNMSUB231SS

    ; { "vfnmsub231sd", TOKEN_INSN, C_none, 0, I_VFNMSUB231SD },
    TOK t_vfnmsub231sd, TOKEN_INSN, C_none, 0, I_VFNMSUB231SD

    ; { "vfnmsub321ss", TOKEN_INSN, C_none, 0, I_VFNMSUB321SS },
    TOK t_vfnmsub321ss, TOKEN_INSN, C_none, 0, I_VFNMSUB321SS

    ; { "vfnmsub321sd", TOKEN_INSN, C_none, 0, I_VFNMSUB321SD },
    TOK t_vfnmsub321sd, TOKEN_INSN, C_none, 0, I_VFNMSUB321SD

    ; { "rdfsbase", TOKEN_INSN, C_none, 0, I_RDFSBASE },
    TOK t_rdfsbase, TOKEN_INSN, C_none, 0, I_RDFSBASE

    ; { "rdgsbase", TOKEN_INSN, C_none, 0, I_RDGSBASE },
    TOK t_rdgsbase, TOKEN_INSN, C_none, 0, I_RDGSBASE

    ; { "rdrand", TOKEN_INSN, C_none, 0, I_RDRAND },
    TOK t_rdrand, TOKEN_INSN, C_none, 0, I_RDRAND

    ; { "wrfsbase", TOKEN_INSN, C_none, 0, I_WRFSBASE },
    TOK t_wrfsbase, TOKEN_INSN, C_none, 0, I_WRFSBASE

    ; { "wrgsbase", TOKEN_INSN, C_none, 0, I_WRGSBASE },
    TOK t_wrgsbase, TOKEN_INSN, C_none, 0, I_WRGSBASE

    ; { "vcvtph2ps", TOKEN_INSN, C_none, 0, I_VCVTPH2PS },
    TOK t_vcvtph2ps, TOKEN_INSN, C_none, 0, I_VCVTPH2PS

    ; { "vcvtps2ph", TOKEN_INSN, C_none, 0, I_VCVTPS2PH },
    TOK t_vcvtps2ph, TOKEN_INSN, C_none, 0, I_VCVTPS2PH

    ; { "adcx", TOKEN_INSN, C_none, 0, I_ADCX },
    TOK t_adcx, TOKEN_INSN, C_none, 0, I_ADCX

    ; { "adox", TOKEN_INSN, C_none, 0, I_ADOX },
    TOK t_adox, TOKEN_INSN, C_none, 0, I_ADOX

    ; { "rdseed", TOKEN_INSN, C_none, 0, I_RDSEED },
    TOK t_rdseed, TOKEN_INSN, C_none, 0, I_RDSEED

    ; { "clac", TOKEN_INSN, C_none, 0, I_CLAC },
    TOK t_clac, TOKEN_INSN, C_none, 0, I_CLAC

    ; { "stac", TOKEN_INSN, C_none, 0, I_STAC },
    TOK t_stac, TOKEN_INSN, C_none, 0, I_STAC

    ; { "xstore", TOKEN_INSN, C_none, 0, I_XSTORE },
    TOK t_xstore, TOKEN_INSN, C_none, 0, I_XSTORE

    ; { "xcryptecb", TOKEN_INSN, C_none, 0, I_XCRYPTECB },
    TOK t_xcryptecb, TOKEN_INSN, C_none, 0, I_XCRYPTECB

    ; { "xcryptcbc", TOKEN_INSN, C_none, 0, I_XCRYPTCBC },
    TOK t_xcryptcbc, TOKEN_INSN, C_none, 0, I_XCRYPTCBC

    ; { "xcryptctr", TOKEN_INSN, C_none, 0, I_XCRYPTCTR },
    TOK t_xcryptctr, TOKEN_INSN, C_none, 0, I_XCRYPTCTR

    ; { "xcryptcfb", TOKEN_INSN, C_none, 0, I_XCRYPTCFB },
    TOK t_xcryptcfb, TOKEN_INSN, C_none, 0, I_XCRYPTCFB

    ; { "xcryptofb", TOKEN_INSN, C_none, 0, I_XCRYPTOFB },
    TOK t_xcryptofb, TOKEN_INSN, C_none, 0, I_XCRYPTOFB

    ; { "montmul", TOKEN_INSN, C_none, 0, I_MONTMUL },
    TOK t_montmul, TOKEN_INSN, C_none, 0, I_MONTMUL

    ; { "xsha1", TOKEN_INSN, C_none, 0, I_XSHA1 },
    TOK t_xsha1, TOKEN_INSN, C_none, 0, I_XSHA1

    ; { "xsha256", TOKEN_INSN, C_none, 0, I_XSHA256 },
    TOK t_xsha256, TOKEN_INSN, C_none, 0, I_XSHA256

    ; { "llwpcb", TOKEN_INSN, C_none, 0, I_LLWPCB },
    TOK t_llwpcb, TOKEN_INSN, C_none, 0, I_LLWPCB

    ; { "slwpcb", TOKEN_INSN, C_none, 0, I_SLWPCB },
    TOK t_slwpcb, TOKEN_INSN, C_none, 0, I_SLWPCB

    ; { "lwpval", TOKEN_INSN, C_none, 0, I_LWPVAL },
    TOK t_lwpval, TOKEN_INSN, C_none, 0, I_LWPVAL

    ; { "lwpins", TOKEN_INSN, C_none, 0, I_LWPINS },
    TOK t_lwpins, TOKEN_INSN, C_none, 0, I_LWPINS

    ; { "vfmaddpd", TOKEN_INSN, C_none, 0, I_VFMADDPD },
    TOK t_vfmaddpd, TOKEN_INSN, C_none, 0, I_VFMADDPD

    ; { "vfmaddps", TOKEN_INSN, C_none, 0, I_VFMADDPS },
    TOK t_vfmaddps, TOKEN_INSN, C_none, 0, I_VFMADDPS

    ; { "vfmaddsd", TOKEN_INSN, C_none, 0, I_VFMADDSD },
    TOK t_vfmaddsd, TOKEN_INSN, C_none, 0, I_VFMADDSD

    ; { "vfmaddss", TOKEN_INSN, C_none, 0, I_VFMADDSS },
    TOK t_vfmaddss, TOKEN_INSN, C_none, 0, I_VFMADDSS

    ; { "vfmaddsubpd", TOKEN_INSN, C_none, 0, I_VFMADDSUBPD },
    TOK t_vfmaddsubpd, TOKEN_INSN, C_none, 0, I_VFMADDSUBPD

    ; { "vfmaddsubps", TOKEN_INSN, C_none, 0, I_VFMADDSUBPS },
    TOK t_vfmaddsubps, TOKEN_INSN, C_none, 0, I_VFMADDSUBPS

    ; { "vfmsubaddpd", TOKEN_INSN, C_none, 0, I_VFMSUBADDPD },
    TOK t_vfmsubaddpd, TOKEN_INSN, C_none, 0, I_VFMSUBADDPD

    ; { "vfmsubaddps", TOKEN_INSN, C_none, 0, I_VFMSUBADDPS },
    TOK t_vfmsubaddps, TOKEN_INSN, C_none, 0, I_VFMSUBADDPS

    ; { "vfmsubpd", TOKEN_INSN, C_none, 0, I_VFMSUBPD },
    TOK t_vfmsubpd, TOKEN_INSN, C_none, 0, I_VFMSUBPD

    ; { "vfmsubps", TOKEN_INSN, C_none, 0, I_VFMSUBPS },
    TOK t_vfmsubps, TOKEN_INSN, C_none, 0, I_VFMSUBPS

    ; { "vfmsubsd", TOKEN_INSN, C_none, 0, I_VFMSUBSD },
    TOK t_vfmsubsd, TOKEN_INSN, C_none, 0, I_VFMSUBSD

    ; { "vfmsubss", TOKEN_INSN, C_none, 0, I_VFMSUBSS },
    TOK t_vfmsubss, TOKEN_INSN, C_none, 0, I_VFMSUBSS

    ; { "vfnmaddpd", TOKEN_INSN, C_none, 0, I_VFNMADDPD },
    TOK t_vfnmaddpd, TOKEN_INSN, C_none, 0, I_VFNMADDPD

    ; { "vfnmaddps", TOKEN_INSN, C_none, 0, I_VFNMADDPS },
    TOK t_vfnmaddps, TOKEN_INSN, C_none, 0, I_VFNMADDPS

    ; { "vfnmaddsd", TOKEN_INSN, C_none, 0, I_VFNMADDSD },
    TOK t_vfnmaddsd, TOKEN_INSN, C_none, 0, I_VFNMADDSD

    ; { "vfnmaddss", TOKEN_INSN, C_none, 0, I_VFNMADDSS },
    TOK t_vfnmaddss, TOKEN_INSN, C_none, 0, I_VFNMADDSS

    ; { "vfnmsubpd", TOKEN_INSN, C_none, 0, I_VFNMSUBPD },
    TOK t_vfnmsubpd, TOKEN_INSN, C_none, 0, I_VFNMSUBPD

    ; { "vfnmsubps", TOKEN_INSN, C_none, 0, I_VFNMSUBPS },
    TOK t_vfnmsubps, TOKEN_INSN, C_none, 0, I_VFNMSUBPS

    ; { "vfnmsubsd", TOKEN_INSN, C_none, 0, I_VFNMSUBSD },
    TOK t_vfnmsubsd, TOKEN_INSN, C_none, 0, I_VFNMSUBSD

    ; { "vfnmsubss", TOKEN_INSN, C_none, 0, I_VFNMSUBSS },
    TOK t_vfnmsubss, TOKEN_INSN, C_none, 0, I_VFNMSUBSS

    ; { "vfrczpd", TOKEN_INSN, C_none, 0, I_VFRCZPD },
    TOK t_vfrczpd, TOKEN_INSN, C_none, 0, I_VFRCZPD

    ; { "vfrczps", TOKEN_INSN, C_none, 0, I_VFRCZPS },
    TOK t_vfrczps, TOKEN_INSN, C_none, 0, I_VFRCZPS

    ; { "vfrczsd", TOKEN_INSN, C_none, 0, I_VFRCZSD },
    TOK t_vfrczsd, TOKEN_INSN, C_none, 0, I_VFRCZSD

    ; { "vfrczss", TOKEN_INSN, C_none, 0, I_VFRCZSS },
    TOK t_vfrczss, TOKEN_INSN, C_none, 0, I_VFRCZSS

    ; { "vpcmov", TOKEN_INSN, C_none, 0, I_VPCMOV },
    TOK t_vpcmov, TOKEN_INSN, C_none, 0, I_VPCMOV

    ; { "vpcomb", TOKEN_INSN, C_none, 0, I_VPCOMB },
    TOK t_vpcomb, TOKEN_INSN, C_none, 0, I_VPCOMB

    ; { "vpcomd", TOKEN_INSN, C_none, 0, I_VPCOMD },
    TOK t_vpcomd, TOKEN_INSN, C_none, 0, I_VPCOMD

    ; { "vpcomq", TOKEN_INSN, C_none, 0, I_VPCOMQ },
    TOK t_vpcomq, TOKEN_INSN, C_none, 0, I_VPCOMQ

    ; { "vpcomub", TOKEN_INSN, C_none, 0, I_VPCOMUB },
    TOK t_vpcomub, TOKEN_INSN, C_none, 0, I_VPCOMUB

    ; { "vpcomud", TOKEN_INSN, C_none, 0, I_VPCOMUD },
    TOK t_vpcomud, TOKEN_INSN, C_none, 0, I_VPCOMUD

    ; { "vpcomuq", TOKEN_INSN, C_none, 0, I_VPCOMUQ },
    TOK t_vpcomuq, TOKEN_INSN, C_none, 0, I_VPCOMUQ

    ; { "vpcomuw", TOKEN_INSN, C_none, 0, I_VPCOMUW },
    TOK t_vpcomuw, TOKEN_INSN, C_none, 0, I_VPCOMUW

    ; { "vpcomw", TOKEN_INSN, C_none, 0, I_VPCOMW },
    TOK t_vpcomw, TOKEN_INSN, C_none, 0, I_VPCOMW

    ; { "vphaddbd", TOKEN_INSN, C_none, 0, I_VPHADDBD },
    TOK t_vphaddbd, TOKEN_INSN, C_none, 0, I_VPHADDBD

    ; { "vphaddbq", TOKEN_INSN, C_none, 0, I_VPHADDBQ },
    TOK t_vphaddbq, TOKEN_INSN, C_none, 0, I_VPHADDBQ

    ; { "vphaddbw", TOKEN_INSN, C_none, 0, I_VPHADDBW },
    TOK t_vphaddbw, TOKEN_INSN, C_none, 0, I_VPHADDBW

    ; { "vphadddq", TOKEN_INSN, C_none, 0, I_VPHADDDQ },
    TOK t_vphadddq, TOKEN_INSN, C_none, 0, I_VPHADDDQ

    ; { "vphaddubd", TOKEN_INSN, C_none, 0, I_VPHADDUBD },
    TOK t_vphaddubd, TOKEN_INSN, C_none, 0, I_VPHADDUBD

    ; { "vphaddubq", TOKEN_INSN, C_none, 0, I_VPHADDUBQ },
    TOK t_vphaddubq, TOKEN_INSN, C_none, 0, I_VPHADDUBQ

    ; { "vphaddubw", TOKEN_INSN, C_none, 0, I_VPHADDUBW },
    TOK t_vphaddubw, TOKEN_INSN, C_none, 0, I_VPHADDUBW

    ; { "vphaddudq", TOKEN_INSN, C_none, 0, I_VPHADDUDQ },
    TOK t_vphaddudq, TOKEN_INSN, C_none, 0, I_VPHADDUDQ

    ; { "vphadduwd", TOKEN_INSN, C_none, 0, I_VPHADDUWD },
    TOK t_vphadduwd, TOKEN_INSN, C_none, 0, I_VPHADDUWD

    ; { "vphadduwq", TOKEN_INSN, C_none, 0, I_VPHADDUWQ },
    TOK t_vphadduwq, TOKEN_INSN, C_none, 0, I_VPHADDUWQ

    ; { "vphaddwd", TOKEN_INSN, C_none, 0, I_VPHADDWD },
    TOK t_vphaddwd, TOKEN_INSN, C_none, 0, I_VPHADDWD

    ; { "vphaddwq", TOKEN_INSN, C_none, 0, I_VPHADDWQ },
    TOK t_vphaddwq, TOKEN_INSN, C_none, 0, I_VPHADDWQ

    ; { "vphsubbw", TOKEN_INSN, C_none, 0, I_VPHSUBBW },
    TOK t_vphsubbw, TOKEN_INSN, C_none, 0, I_VPHSUBBW

    ; { "vphsubdq", TOKEN_INSN, C_none, 0, I_VPHSUBDQ },
    TOK t_vphsubdq, TOKEN_INSN, C_none, 0, I_VPHSUBDQ

    ; { "vphsubwd", TOKEN_INSN, C_none, 0, I_VPHSUBWD },
    TOK t_vphsubwd, TOKEN_INSN, C_none, 0, I_VPHSUBWD

    ; { "vpmacsdd", TOKEN_INSN, C_none, 0, I_VPMACSDD },
    TOK t_vpmacsdd, TOKEN_INSN, C_none, 0, I_VPMACSDD

    ; { "vpmacsdqh", TOKEN_INSN, C_none, 0, I_VPMACSDQH },
    TOK t_vpmacsdqh, TOKEN_INSN, C_none, 0, I_VPMACSDQH

    ; { "vpmacsdql", TOKEN_INSN, C_none, 0, I_VPMACSDQL },
    TOK t_vpmacsdql, TOKEN_INSN, C_none, 0, I_VPMACSDQL

    ; { "vpmacssdd", TOKEN_INSN, C_none, 0, I_VPMACSSDD },
    TOK t_vpmacssdd, TOKEN_INSN, C_none, 0, I_VPMACSSDD

    ; { "vpmacssdqh", TOKEN_INSN, C_none, 0, I_VPMACSSDQH },
    TOK t_vpmacssdqh, TOKEN_INSN, C_none, 0, I_VPMACSSDQH

    ; { "vpmacssdql", TOKEN_INSN, C_none, 0, I_VPMACSSDQL },
    TOK t_vpmacssdql, TOKEN_INSN, C_none, 0, I_VPMACSSDQL

    ; { "vpmacsswd", TOKEN_INSN, C_none, 0, I_VPMACSSWD },
    TOK t_vpmacsswd, TOKEN_INSN, C_none, 0, I_VPMACSSWD

    ; { "vpmacssww", TOKEN_INSN, C_none, 0, I_VPMACSSWW },
    TOK t_vpmacssww, TOKEN_INSN, C_none, 0, I_VPMACSSWW

    ; { "vpmacswd", TOKEN_INSN, C_none, 0, I_VPMACSWD },
    TOK t_vpmacswd, TOKEN_INSN, C_none, 0, I_VPMACSWD

    ; { "vpmacsww", TOKEN_INSN, C_none, 0, I_VPMACSWW },
    TOK t_vpmacsww, TOKEN_INSN, C_none, 0, I_VPMACSWW

    ; { "vpmadcsswd", TOKEN_INSN, C_none, 0, I_VPMADCSSWD },
    TOK t_vpmadcsswd, TOKEN_INSN, C_none, 0, I_VPMADCSSWD

    ; { "vpmadcswd", TOKEN_INSN, C_none, 0, I_VPMADCSWD },
    TOK t_vpmadcswd, TOKEN_INSN, C_none, 0, I_VPMADCSWD

    ; { "vpperm", TOKEN_INSN, C_none, 0, I_VPPERM },
    TOK t_vpperm, TOKEN_INSN, C_none, 0, I_VPPERM

    ; { "vprotb", TOKEN_INSN, C_none, 0, I_VPROTB },
    TOK t_vprotb, TOKEN_INSN, C_none, 0, I_VPROTB

    ; { "vprotd", TOKEN_INSN, C_none, 0, I_VPROTD },
    TOK t_vprotd, TOKEN_INSN, C_none, 0, I_VPROTD

    ; { "vprotq", TOKEN_INSN, C_none, 0, I_VPROTQ },
    TOK t_vprotq, TOKEN_INSN, C_none, 0, I_VPROTQ

    ; { "vprotw", TOKEN_INSN, C_none, 0, I_VPROTW },
    TOK t_vprotw, TOKEN_INSN, C_none, 0, I_VPROTW

    ; { "vpshab", TOKEN_INSN, C_none, 0, I_VPSHAB },
    TOK t_vpshab, TOKEN_INSN, C_none, 0, I_VPSHAB

    ; { "vpshad", TOKEN_INSN, C_none, 0, I_VPSHAD },
    TOK t_vpshad, TOKEN_INSN, C_none, 0, I_VPSHAD

    ; { "vpshaq", TOKEN_INSN, C_none, 0, I_VPSHAQ },
    TOK t_vpshaq, TOKEN_INSN, C_none, 0, I_VPSHAQ

    ; { "vpshaw", TOKEN_INSN, C_none, 0, I_VPSHAW },
    TOK t_vpshaw, TOKEN_INSN, C_none, 0, I_VPSHAW

    ; { "vpshlb", TOKEN_INSN, C_none, 0, I_VPSHLB },
    TOK t_vpshlb, TOKEN_INSN, C_none, 0, I_VPSHLB

    ; { "vpshld", TOKEN_INSN, C_none, 0, I_VPSHLD },
    TOK t_vpshld, TOKEN_INSN, C_none, 0, I_VPSHLD

    ; { "vpshlq", TOKEN_INSN, C_none, 0, I_VPSHLQ },
    TOK t_vpshlq, TOKEN_INSN, C_none, 0, I_VPSHLQ

    ; { "vpshlw", TOKEN_INSN, C_none, 0, I_VPSHLW },
    TOK t_vpshlw, TOKEN_INSN, C_none, 0, I_VPSHLW

    ; { "vbroadcasti128", TOKEN_INSN, C_none, 0, I_VBROADCASTI128 },
    TOK t_vbroadcasti128, TOKEN_INSN, C_none, 0, I_VBROADCASTI128

    ; { "vpblendd", TOKEN_INSN, C_none, 0, I_VPBLENDD },
    TOK t_vpblendd, TOKEN_INSN, C_none, 0, I_VPBLENDD

    ; { "vpbroadcastb", TOKEN_INSN, C_none, 0, I_VPBROADCASTB },
    TOK t_vpbroadcastb, TOKEN_INSN, C_none, 0, I_VPBROADCASTB

    ; { "vpbroadcastw", TOKEN_INSN, C_none, 0, I_VPBROADCASTW },
    TOK t_vpbroadcastw, TOKEN_INSN, C_none, 0, I_VPBROADCASTW

    ; { "vpbroadcastd", TOKEN_INSN, C_none, 0, I_VPBROADCASTD },
    TOK t_vpbroadcastd, TOKEN_INSN, C_none, 0, I_VPBROADCASTD

    ; { "vpbroadcastq", TOKEN_INSN, C_none, 0, I_VPBROADCASTQ },
    TOK t_vpbroadcastq, TOKEN_INSN, C_none, 0, I_VPBROADCASTQ

    ; { "vpermd", TOKEN_INSN, C_none, 0, I_VPERMD },
    TOK t_vpermd, TOKEN_INSN, C_none, 0, I_VPERMD

    ; { "vpermpd", TOKEN_INSN, C_none, 0, I_VPERMPD },
    TOK t_vpermpd, TOKEN_INSN, C_none, 0, I_VPERMPD

    ; { "vpermps", TOKEN_INSN, C_none, 0, I_VPERMPS },
    TOK t_vpermps, TOKEN_INSN, C_none, 0, I_VPERMPS

    ; { "vpermq", TOKEN_INSN, C_none, 0, I_VPERMQ },
    TOK t_vpermq, TOKEN_INSN, C_none, 0, I_VPERMQ

    ; { "vperm2i128", TOKEN_INSN, C_none, 0, I_VPERM2I128 },
    TOK t_vperm2i128, TOKEN_INSN, C_none, 0, I_VPERM2I128

    ; { "vextracti128", TOKEN_INSN, C_none, 0, I_VEXTRACTI128 },
    TOK t_vextracti128, TOKEN_INSN, C_none, 0, I_VEXTRACTI128

    ; { "vinserti128", TOKEN_INSN, C_none, 0, I_VINSERTI128 },
    TOK t_vinserti128, TOKEN_INSN, C_none, 0, I_VINSERTI128

    ; { "vpmaskmovd", TOKEN_INSN, C_none, 0, I_VPMASKMOVD },
    TOK t_vpmaskmovd, TOKEN_INSN, C_none, 0, I_VPMASKMOVD

    ; { "vpmaskmovq", TOKEN_INSN, C_none, 0, I_VPMASKMOVQ },
    TOK t_vpmaskmovq, TOKEN_INSN, C_none, 0, I_VPMASKMOVQ

    ; { "vpsllvd", TOKEN_INSN, C_none, 0, I_VPSLLVD },
    TOK t_vpsllvd, TOKEN_INSN, C_none, 0, I_VPSLLVD

    ; { "vpsllvq", TOKEN_INSN, C_none, 0, I_VPSLLVQ },
    TOK t_vpsllvq, TOKEN_INSN, C_none, 0, I_VPSLLVQ

    ; { "vpsravd", TOKEN_INSN, C_none, 0, I_VPSRAVD },
    TOK t_vpsravd, TOKEN_INSN, C_none, 0, I_VPSRAVD

    ; { "vpsrlvd", TOKEN_INSN, C_none, 0, I_VPSRLVD },
    TOK t_vpsrlvd, TOKEN_INSN, C_none, 0, I_VPSRLVD

    ; { "vpsrlvq", TOKEN_INSN, C_none, 0, I_VPSRLVQ },
    TOK t_vpsrlvq, TOKEN_INSN, C_none, 0, I_VPSRLVQ

    ; { "vgatherdpd", TOKEN_INSN, C_none, 0, I_VGATHERDPD },
    TOK t_vgatherdpd, TOKEN_INSN, C_none, 0, I_VGATHERDPD

    ; { "vgatherqpd", TOKEN_INSN, C_none, 0, I_VGATHERQPD },
    TOK t_vgatherqpd, TOKEN_INSN, C_none, 0, I_VGATHERQPD

    ; { "vgatherdps", TOKEN_INSN, C_none, 0, I_VGATHERDPS },
    TOK t_vgatherdps, TOKEN_INSN, C_none, 0, I_VGATHERDPS

    ; { "vgatherqps", TOKEN_INSN, C_none, 0, I_VGATHERQPS },
    TOK t_vgatherqps, TOKEN_INSN, C_none, 0, I_VGATHERQPS

    ; { "vpgatherdd", TOKEN_INSN, C_none, 0, I_VPGATHERDD },
    TOK t_vpgatherdd, TOKEN_INSN, C_none, 0, I_VPGATHERDD

    ; { "vpgatherqd", TOKEN_INSN, C_none, 0, I_VPGATHERQD },
    TOK t_vpgatherqd, TOKEN_INSN, C_none, 0, I_VPGATHERQD

    ; { "vpgatherdq", TOKEN_INSN, C_none, 0, I_VPGATHERDQ },
    TOK t_vpgatherdq, TOKEN_INSN, C_none, 0, I_VPGATHERDQ

    ; { "vpgatherqq", TOKEN_INSN, C_none, 0, I_VPGATHERQQ },
    TOK t_vpgatherqq, TOKEN_INSN, C_none, 0, I_VPGATHERQQ

    ; { "xabort", TOKEN_INSN, C_none, 0, I_XABORT },
    TOK t_xabort, TOKEN_INSN, C_none, 0, I_XABORT

    ; { "xbegin", TOKEN_INSN, C_none, 0, I_XBEGIN },
    TOK t_xbegin, TOKEN_INSN, C_none, 0, I_XBEGIN

    ; { "xend", TOKEN_INSN, C_none, 0, I_XEND },
    TOK t_xend, TOKEN_INSN, C_none, 0, I_XEND

    ; { "xtest", TOKEN_INSN, C_none, 0, I_XTEST },
    TOK t_xtest, TOKEN_INSN, C_none, 0, I_XTEST

    ; { "andn", TOKEN_INSN, C_none, 0, I_ANDN },
    TOK t_andn, TOKEN_INSN, C_none, 0, I_ANDN

    ; { "bextr", TOKEN_INSN, C_none, 0, I_BEXTR },
    TOK t_bextr, TOKEN_INSN, C_none, 0, I_BEXTR

    ; { "blci", TOKEN_INSN, C_none, 0, I_BLCI },
    TOK t_blci, TOKEN_INSN, C_none, 0, I_BLCI

    ; { "blcic", TOKEN_INSN, C_none, 0, I_BLCIC },
    TOK t_blcic, TOKEN_INSN, C_none, 0, I_BLCIC

    ; { "blsi", TOKEN_INSN, C_none, 0, I_BLSI },
    TOK t_blsi, TOKEN_INSN, C_none, 0, I_BLSI

    ; { "blsic", TOKEN_INSN, C_none, 0, I_BLSIC },
    TOK t_blsic, TOKEN_INSN, C_none, 0, I_BLSIC

    ; { "blcfill", TOKEN_INSN, C_none, 0, I_BLCFILL },
    TOK t_blcfill, TOKEN_INSN, C_none, 0, I_BLCFILL

    ; { "blsfill", TOKEN_INSN, C_none, 0, I_BLSFILL },
    TOK t_blsfill, TOKEN_INSN, C_none, 0, I_BLSFILL

    ; { "blcmsk", TOKEN_INSN, C_none, 0, I_BLCMSK },
    TOK t_blcmsk, TOKEN_INSN, C_none, 0, I_BLCMSK

    ; { "blsmsk", TOKEN_INSN, C_none, 0, I_BLSMSK },
    TOK t_blsmsk, TOKEN_INSN, C_none, 0, I_BLSMSK

    ; { "blsr", TOKEN_INSN, C_none, 0, I_BLSR },
    TOK t_blsr, TOKEN_INSN, C_none, 0, I_BLSR

    ; { "blcs", TOKEN_INSN, C_none, 0, I_BLCS },
    TOK t_blcs, TOKEN_INSN, C_none, 0, I_BLCS

    ; { "bzhi", TOKEN_INSN, C_none, 0, I_BZHI },
    TOK t_bzhi, TOKEN_INSN, C_none, 0, I_BZHI

    ; { "mulx", TOKEN_INSN, C_none, 0, I_MULX },
    TOK t_mulx, TOKEN_INSN, C_none, 0, I_MULX

    ; { "pdep", TOKEN_INSN, C_none, 0, I_PDEP },
    TOK t_pdep, TOKEN_INSN, C_none, 0, I_PDEP

    ; { "pext", TOKEN_INSN, C_none, 0, I_PEXT },
    TOK t_pext, TOKEN_INSN, C_none, 0, I_PEXT

    ; { "rorx", TOKEN_INSN, C_none, 0, I_RORX },
    TOK t_rorx, TOKEN_INSN, C_none, 0, I_RORX

    ; { "sarx", TOKEN_INSN, C_none, 0, I_SARX },
    TOK t_sarx, TOKEN_INSN, C_none, 0, I_SARX

    ; { "shlx", TOKEN_INSN, C_none, 0, I_SHLX },
    TOK t_shlx, TOKEN_INSN, C_none, 0, I_SHLX

    ; { "shrx", TOKEN_INSN, C_none, 0, I_SHRX },
    TOK t_shrx, TOKEN_INSN, C_none, 0, I_SHRX

    ; { "tzcnt", TOKEN_INSN, C_none, 0, I_TZCNT },
    TOK t_tzcnt, TOKEN_INSN, C_none, 0, I_TZCNT

    ; { "tzmsk", TOKEN_INSN, C_none, 0, I_TZMSK },
    TOK t_tzmsk, TOKEN_INSN, C_none, 0, I_TZMSK

    ; { "t1mskc", TOKEN_INSN, C_none, 0, I_T1MSKC },
    TOK t_t1mskc, TOKEN_INSN, C_none, 0, I_T1MSKC

    ; { "prefetchwt1", TOKEN_INSN, C_none, 0, I_PREFETCHWT1 },
    TOK t_prefetchwt1, TOKEN_INSN, C_none, 0, I_PREFETCHWT1

    ; { "bndmk", TOKEN_INSN, C_none, 0, I_BNDMK },
    TOK t_bndmk, TOKEN_INSN, C_none, 0, I_BNDMK

    ; { "bndcl", TOKEN_INSN, C_none, 0, I_BNDCL },
    TOK t_bndcl, TOKEN_INSN, C_none, 0, I_BNDCL

    ; { "bndcu", TOKEN_INSN, C_none, 0, I_BNDCU },
    TOK t_bndcu, TOKEN_INSN, C_none, 0, I_BNDCU

    ; { "bndcn", TOKEN_INSN, C_none, 0, I_BNDCN },
    TOK t_bndcn, TOKEN_INSN, C_none, 0, I_BNDCN

    ; { "bndmov", TOKEN_INSN, C_none, 0, I_BNDMOV },
    TOK t_bndmov, TOKEN_INSN, C_none, 0, I_BNDMOV

    ; { "bndldx", TOKEN_INSN, C_none, 0, I_BNDLDX },
    TOK t_bndldx, TOKEN_INSN, C_none, 0, I_BNDLDX

    ; { "bndstx", TOKEN_INSN, C_none, 0, I_BNDSTX },
    TOK t_bndstx, TOKEN_INSN, C_none, 0, I_BNDSTX

    ; { "sha1msg1", TOKEN_INSN, C_none, 0, I_SHA1MSG1 },
    TOK t_sha1msg1, TOKEN_INSN, C_none, 0, I_SHA1MSG1

    ; { "sha1msg2", TOKEN_INSN, C_none, 0, I_SHA1MSG2 },
    TOK t_sha1msg2, TOKEN_INSN, C_none, 0, I_SHA1MSG2

    ; { "sha1nexte", TOKEN_INSN, C_none, 0, I_SHA1NEXTE },
    TOK t_sha1nexte, TOKEN_INSN, C_none, 0, I_SHA1NEXTE

    ; { "sha1rnds4", TOKEN_INSN, C_none, 0, I_SHA1RNDS4 },
    TOK t_sha1rnds4, TOKEN_INSN, C_none, 0, I_SHA1RNDS4

    ; { "sha256msg1", TOKEN_INSN, C_none, 0, I_SHA256MSG1 },
    TOK t_sha256msg1, TOKEN_INSN, C_none, 0, I_SHA256MSG1

    ; { "sha256msg2", TOKEN_INSN, C_none, 0, I_SHA256MSG2 },
    TOK t_sha256msg2, TOKEN_INSN, C_none, 0, I_SHA256MSG2

    ; { "sha256rnds2", TOKEN_INSN, C_none, 0, I_SHA256RNDS2 },
    TOK t_sha256rnds2, TOKEN_INSN, C_none, 0, I_SHA256RNDS2

    ; { "kaddb", TOKEN_INSN, C_none, 0, I_KADDB },
    TOK t_kaddb, TOKEN_INSN, C_none, 0, I_KADDB

    ; { "kaddd", TOKEN_INSN, C_none, 0, I_KADDD },
    TOK t_kaddd, TOKEN_INSN, C_none, 0, I_KADDD

    ; { "kaddq", TOKEN_INSN, C_none, 0, I_KADDQ },
    TOK t_kaddq, TOKEN_INSN, C_none, 0, I_KADDQ

    ; { "kaddw", TOKEN_INSN, C_none, 0, I_KADDW },
    TOK t_kaddw, TOKEN_INSN, C_none, 0, I_KADDW

    ; { "kandb", TOKEN_INSN, C_none, 0, I_KANDB },
    TOK t_kandb, TOKEN_INSN, C_none, 0, I_KANDB

    ; { "kandd", TOKEN_INSN, C_none, 0, I_KANDD },
    TOK t_kandd, TOKEN_INSN, C_none, 0, I_KANDD

    ; { "kandnb", TOKEN_INSN, C_none, 0, I_KANDNB },
    TOK t_kandnb, TOKEN_INSN, C_none, 0, I_KANDNB

    ; { "kandnd", TOKEN_INSN, C_none, 0, I_KANDND },
    TOK t_kandnd, TOKEN_INSN, C_none, 0, I_KANDND

    ; { "kandnq", TOKEN_INSN, C_none, 0, I_KANDNQ },
    TOK t_kandnq, TOKEN_INSN, C_none, 0, I_KANDNQ

    ; { "kandnw", TOKEN_INSN, C_none, 0, I_KANDNW },
    TOK t_kandnw, TOKEN_INSN, C_none, 0, I_KANDNW

    ; { "kandq", TOKEN_INSN, C_none, 0, I_KANDQ },
    TOK t_kandq, TOKEN_INSN, C_none, 0, I_KANDQ

    ; { "kandw", TOKEN_INSN, C_none, 0, I_KANDW },
    TOK t_kandw, TOKEN_INSN, C_none, 0, I_KANDW

    ; { "kmovb", TOKEN_INSN, C_none, 0, I_KMOVB },
    TOK t_kmovb, TOKEN_INSN, C_none, 0, I_KMOVB

    ; { "kmovd", TOKEN_INSN, C_none, 0, I_KMOVD },
    TOK t_kmovd, TOKEN_INSN, C_none, 0, I_KMOVD

    ; { "kmovq", TOKEN_INSN, C_none, 0, I_KMOVQ },
    TOK t_kmovq, TOKEN_INSN, C_none, 0, I_KMOVQ

    ; { "kmovw", TOKEN_INSN, C_none, 0, I_KMOVW },
    TOK t_kmovw, TOKEN_INSN, C_none, 0, I_KMOVW

    ; { "knotb", TOKEN_INSN, C_none, 0, I_KNOTB },
    TOK t_knotb, TOKEN_INSN, C_none, 0, I_KNOTB

    ; { "knotd", TOKEN_INSN, C_none, 0, I_KNOTD },
    TOK t_knotd, TOKEN_INSN, C_none, 0, I_KNOTD

    ; { "knotq", TOKEN_INSN, C_none, 0, I_KNOTQ },
    TOK t_knotq, TOKEN_INSN, C_none, 0, I_KNOTQ

    ; { "knotw", TOKEN_INSN, C_none, 0, I_KNOTW },
    TOK t_knotw, TOKEN_INSN, C_none, 0, I_KNOTW

    ; { "korb", TOKEN_INSN, C_none, 0, I_KORB },
    TOK t_korb, TOKEN_INSN, C_none, 0, I_KORB

    ; { "kord", TOKEN_INSN, C_none, 0, I_KORD },
    TOK t_kord, TOKEN_INSN, C_none, 0, I_KORD

    ; { "korq", TOKEN_INSN, C_none, 0, I_KORQ },
    TOK t_korq, TOKEN_INSN, C_none, 0, I_KORQ

    ; { "kortestb", TOKEN_INSN, C_none, 0, I_KORTESTB },
    TOK t_kortestb, TOKEN_INSN, C_none, 0, I_KORTESTB

    ; { "kortestd", TOKEN_INSN, C_none, 0, I_KORTESTD },
    TOK t_kortestd, TOKEN_INSN, C_none, 0, I_KORTESTD

    ; { "kortestq", TOKEN_INSN, C_none, 0, I_KORTESTQ },
    TOK t_kortestq, TOKEN_INSN, C_none, 0, I_KORTESTQ

    ; { "kortestw", TOKEN_INSN, C_none, 0, I_KORTESTW },
    TOK t_kortestw, TOKEN_INSN, C_none, 0, I_KORTESTW

    ; { "korw", TOKEN_INSN, C_none, 0, I_KORW },
    TOK t_korw, TOKEN_INSN, C_none, 0, I_KORW

    ; { "kshiftlb", TOKEN_INSN, C_none, 0, I_KSHIFTLB },
    TOK t_kshiftlb, TOKEN_INSN, C_none, 0, I_KSHIFTLB

    ; { "kshiftld", TOKEN_INSN, C_none, 0, I_KSHIFTLD },
    TOK t_kshiftld, TOKEN_INSN, C_none, 0, I_KSHIFTLD

    ; { "kshiftlq", TOKEN_INSN, C_none, 0, I_KSHIFTLQ },
    TOK t_kshiftlq, TOKEN_INSN, C_none, 0, I_KSHIFTLQ

    ; { "kshiftlw", TOKEN_INSN, C_none, 0, I_KSHIFTLW },
    TOK t_kshiftlw, TOKEN_INSN, C_none, 0, I_KSHIFTLW

    ; { "kshiftrb", TOKEN_INSN, C_none, 0, I_KSHIFTRB },
    TOK t_kshiftrb, TOKEN_INSN, C_none, 0, I_KSHIFTRB

    ; { "kshiftrd", TOKEN_INSN, C_none, 0, I_KSHIFTRD },
    TOK t_kshiftrd, TOKEN_INSN, C_none, 0, I_KSHIFTRD

    ; { "kshiftrq", TOKEN_INSN, C_none, 0, I_KSHIFTRQ },
    TOK t_kshiftrq, TOKEN_INSN, C_none, 0, I_KSHIFTRQ

    ; { "kshiftrw", TOKEN_INSN, C_none, 0, I_KSHIFTRW },
    TOK t_kshiftrw, TOKEN_INSN, C_none, 0, I_KSHIFTRW

    ; { "ktestb", TOKEN_INSN, C_none, 0, I_KTESTB },
    TOK t_ktestb, TOKEN_INSN, C_none, 0, I_KTESTB

    ; { "ktestd", TOKEN_INSN, C_none, 0, I_KTESTD },
    TOK t_ktestd, TOKEN_INSN, C_none, 0, I_KTESTD

    ; { "ktestq", TOKEN_INSN, C_none, 0, I_KTESTQ },
    TOK t_ktestq, TOKEN_INSN, C_none, 0, I_KTESTQ

    ; { "ktestw", TOKEN_INSN, C_none, 0, I_KTESTW },
    TOK t_ktestw, TOKEN_INSN, C_none, 0, I_KTESTW

    ; { "kunpckbw", TOKEN_INSN, C_none, 0, I_KUNPCKBW },
    TOK t_kunpckbw, TOKEN_INSN, C_none, 0, I_KUNPCKBW

    ; { "kunpckdq", TOKEN_INSN, C_none, 0, I_KUNPCKDQ },
    TOK t_kunpckdq, TOKEN_INSN, C_none, 0, I_KUNPCKDQ

    ; { "kunpckwd", TOKEN_INSN, C_none, 0, I_KUNPCKWD },
    TOK t_kunpckwd, TOKEN_INSN, C_none, 0, I_KUNPCKWD

    ; { "kxnorb", TOKEN_INSN, C_none, 0, I_KXNORB },
    TOK t_kxnorb, TOKEN_INSN, C_none, 0, I_KXNORB

    ; { "kxnord", TOKEN_INSN, C_none, 0, I_KXNORD },
    TOK t_kxnord, TOKEN_INSN, C_none, 0, I_KXNORD

    ; { "kxnorq", TOKEN_INSN, C_none, 0, I_KXNORQ },
    TOK t_kxnorq, TOKEN_INSN, C_none, 0, I_KXNORQ

    ; { "kxnorw", TOKEN_INSN, C_none, 0, I_KXNORW },
    TOK t_kxnorw, TOKEN_INSN, C_none, 0, I_KXNORW

    ; { "kxorb", TOKEN_INSN, C_none, 0, I_KXORB },
    TOK t_kxorb, TOKEN_INSN, C_none, 0, I_KXORB

    ; { "kxord", TOKEN_INSN, C_none, 0, I_KXORD },
    TOK t_kxord, TOKEN_INSN, C_none, 0, I_KXORD

    ; { "kxorq", TOKEN_INSN, C_none, 0, I_KXORQ },
    TOK t_kxorq, TOKEN_INSN, C_none, 0, I_KXORQ

    ; { "kxorw", TOKEN_INSN, C_none, 0, I_KXORW },
    TOK t_kxorw, TOKEN_INSN, C_none, 0, I_KXORW

    ; { "valignd", TOKEN_INSN, C_none, 0, I_VALIGND },
    TOK t_valignd, TOKEN_INSN, C_none, 0, I_VALIGND

    ; { "valignq", TOKEN_INSN, C_none, 0, I_VALIGNQ },
    TOK t_valignq, TOKEN_INSN, C_none, 0, I_VALIGNQ

    ; { "vblendmpd", TOKEN_INSN, C_none, 0, I_VBLENDMPD },
    TOK t_vblendmpd, TOKEN_INSN, C_none, 0, I_VBLENDMPD

    ; { "vblendmps", TOKEN_INSN, C_none, 0, I_VBLENDMPS },
    TOK t_vblendmps, TOKEN_INSN, C_none, 0, I_VBLENDMPS

    ; { "vbroadcastf32x2", TOKEN_INSN, C_none, 0, I_VBROADCASTF32X2 },
    TOK t_vbroadcastf32x2, TOKEN_INSN, C_none, 0, I_VBROADCASTF32X2

    ; { "vbroadcastf32x4", TOKEN_INSN, C_none, 0, I_VBROADCASTF32X4 },
    TOK t_vbroadcastf32x4, TOKEN_INSN, C_none, 0, I_VBROADCASTF32X4

    ; { "vbroadcastf32x8", TOKEN_INSN, C_none, 0, I_VBROADCASTF32X8 },
    TOK t_vbroadcastf32x8, TOKEN_INSN, C_none, 0, I_VBROADCASTF32X8

    ; { "vbroadcastf64x2", TOKEN_INSN, C_none, 0, I_VBROADCASTF64X2 },
    TOK t_vbroadcastf64x2, TOKEN_INSN, C_none, 0, I_VBROADCASTF64X2

    ; { "vbroadcastf64x4", TOKEN_INSN, C_none, 0, I_VBROADCASTF64X4 },
    TOK t_vbroadcastf64x4, TOKEN_INSN, C_none, 0, I_VBROADCASTF64X4

    ; { "vbroadcasti32x2", TOKEN_INSN, C_none, 0, I_VBROADCASTI32X2 },
    TOK t_vbroadcasti32x2, TOKEN_INSN, C_none, 0, I_VBROADCASTI32X2

    ; { "vbroadcasti32x4", TOKEN_INSN, C_none, 0, I_VBROADCASTI32X4 },
    TOK t_vbroadcasti32x4, TOKEN_INSN, C_none, 0, I_VBROADCASTI32X4

    ; { "vbroadcasti32x8", TOKEN_INSN, C_none, 0, I_VBROADCASTI32X8 },
    TOK t_vbroadcasti32x8, TOKEN_INSN, C_none, 0, I_VBROADCASTI32X8

    ; { "vbroadcasti64x2", TOKEN_INSN, C_none, 0, I_VBROADCASTI64X2 },
    TOK t_vbroadcasti64x2, TOKEN_INSN, C_none, 0, I_VBROADCASTI64X2

    ; { "vbroadcasti64x4", TOKEN_INSN, C_none, 0, I_VBROADCASTI64X4 },
    TOK t_vbroadcasti64x4, TOKEN_INSN, C_none, 0, I_VBROADCASTI64X4

    ; { "vcompresspd", TOKEN_INSN, C_none, 0, I_VCOMPRESSPD },
    TOK t_vcompresspd, TOKEN_INSN, C_none, 0, I_VCOMPRESSPD

    ; { "vcompressps", TOKEN_INSN, C_none, 0, I_VCOMPRESSPS },
    TOK t_vcompressps, TOKEN_INSN, C_none, 0, I_VCOMPRESSPS

    ; { "vcvtpd2qq", TOKEN_INSN, C_none, 0, I_VCVTPD2QQ },
    TOK t_vcvtpd2qq, TOKEN_INSN, C_none, 0, I_VCVTPD2QQ

    ; { "vcvtpd2udq", TOKEN_INSN, C_none, 0, I_VCVTPD2UDQ },
    TOK t_vcvtpd2udq, TOKEN_INSN, C_none, 0, I_VCVTPD2UDQ

    ; { "vcvtpd2uqq", TOKEN_INSN, C_none, 0, I_VCVTPD2UQQ },
    TOK t_vcvtpd2uqq, TOKEN_INSN, C_none, 0, I_VCVTPD2UQQ

    ; { "vcvtps2qq", TOKEN_INSN, C_none, 0, I_VCVTPS2QQ },
    TOK t_vcvtps2qq, TOKEN_INSN, C_none, 0, I_VCVTPS2QQ

    ; { "vcvtps2udq", TOKEN_INSN, C_none, 0, I_VCVTPS2UDQ },
    TOK t_vcvtps2udq, TOKEN_INSN, C_none, 0, I_VCVTPS2UDQ

    ; { "vcvtps2uqq", TOKEN_INSN, C_none, 0, I_VCVTPS2UQQ },
    TOK t_vcvtps2uqq, TOKEN_INSN, C_none, 0, I_VCVTPS2UQQ

    ; { "vcvtqq2pd", TOKEN_INSN, C_none, 0, I_VCVTQQ2PD },
    TOK t_vcvtqq2pd, TOKEN_INSN, C_none, 0, I_VCVTQQ2PD

    ; { "vcvtqq2ps", TOKEN_INSN, C_none, 0, I_VCVTQQ2PS },
    TOK t_vcvtqq2ps, TOKEN_INSN, C_none, 0, I_VCVTQQ2PS

    ; { "vcvtsd2usi", TOKEN_INSN, C_none, 0, I_VCVTSD2USI },
    TOK t_vcvtsd2usi, TOKEN_INSN, C_none, 0, I_VCVTSD2USI

    ; { "vcvtss2usi", TOKEN_INSN, C_none, 0, I_VCVTSS2USI },
    TOK t_vcvtss2usi, TOKEN_INSN, C_none, 0, I_VCVTSS2USI

    ; { "vcvttpd2qq", TOKEN_INSN, C_none, 0, I_VCVTTPD2QQ },
    TOK t_vcvttpd2qq, TOKEN_INSN, C_none, 0, I_VCVTTPD2QQ

    ; { "vcvttpd2udq", TOKEN_INSN, C_none, 0, I_VCVTTPD2UDQ },
    TOK t_vcvttpd2udq, TOKEN_INSN, C_none, 0, I_VCVTTPD2UDQ

    ; { "vcvttpd2uqq", TOKEN_INSN, C_none, 0, I_VCVTTPD2UQQ },
    TOK t_vcvttpd2uqq, TOKEN_INSN, C_none, 0, I_VCVTTPD2UQQ

    ; { "vcvttps2qq", TOKEN_INSN, C_none, 0, I_VCVTTPS2QQ },
    TOK t_vcvttps2qq, TOKEN_INSN, C_none, 0, I_VCVTTPS2QQ

    ; { "vcvttps2udq", TOKEN_INSN, C_none, 0, I_VCVTTPS2UDQ },
    TOK t_vcvttps2udq, TOKEN_INSN, C_none, 0, I_VCVTTPS2UDQ

    ; { "vcvttps2uqq", TOKEN_INSN, C_none, 0, I_VCVTTPS2UQQ },
    TOK t_vcvttps2uqq, TOKEN_INSN, C_none, 0, I_VCVTTPS2UQQ

    ; { "vcvttsd2usi", TOKEN_INSN, C_none, 0, I_VCVTTSD2USI },
    TOK t_vcvttsd2usi, TOKEN_INSN, C_none, 0, I_VCVTTSD2USI

    ; { "vcvttss2usi", TOKEN_INSN, C_none, 0, I_VCVTTSS2USI },
    TOK t_vcvttss2usi, TOKEN_INSN, C_none, 0, I_VCVTTSS2USI

    ; { "vcvtudq2pd", TOKEN_INSN, C_none, 0, I_VCVTUDQ2PD },
    TOK t_vcvtudq2pd, TOKEN_INSN, C_none, 0, I_VCVTUDQ2PD

    ; { "vcvtudq2ps", TOKEN_INSN, C_none, 0, I_VCVTUDQ2PS },
    TOK t_vcvtudq2ps, TOKEN_INSN, C_none, 0, I_VCVTUDQ2PS

    ; { "vcvtuqq2pd", TOKEN_INSN, C_none, 0, I_VCVTUQQ2PD },
    TOK t_vcvtuqq2pd, TOKEN_INSN, C_none, 0, I_VCVTUQQ2PD

    ; { "vcvtuqq2ps", TOKEN_INSN, C_none, 0, I_VCVTUQQ2PS },
    TOK t_vcvtuqq2ps, TOKEN_INSN, C_none, 0, I_VCVTUQQ2PS

    ; { "vcvtusi2sd", TOKEN_INSN, C_none, 0, I_VCVTUSI2SD },
    TOK t_vcvtusi2sd, TOKEN_INSN, C_none, 0, I_VCVTUSI2SD

    ; { "vcvtusi2ss", TOKEN_INSN, C_none, 0, I_VCVTUSI2SS },
    TOK t_vcvtusi2ss, TOKEN_INSN, C_none, 0, I_VCVTUSI2SS

    ; { "vdbpsadbw", TOKEN_INSN, C_none, 0, I_VDBPSADBW },
    TOK t_vdbpsadbw, TOKEN_INSN, C_none, 0, I_VDBPSADBW

    ; { "vexp2pd", TOKEN_INSN, C_none, 0, I_VEXP2PD },
    TOK t_vexp2pd, TOKEN_INSN, C_none, 0, I_VEXP2PD

    ; { "vexp2ps", TOKEN_INSN, C_none, 0, I_VEXP2PS },
    TOK t_vexp2ps, TOKEN_INSN, C_none, 0, I_VEXP2PS

    ; { "vexpandpd", TOKEN_INSN, C_none, 0, I_VEXPANDPD },
    TOK t_vexpandpd, TOKEN_INSN, C_none, 0, I_VEXPANDPD

    ; { "vexpandps", TOKEN_INSN, C_none, 0, I_VEXPANDPS },
    TOK t_vexpandps, TOKEN_INSN, C_none, 0, I_VEXPANDPS

    ; { "vextractf32x4", TOKEN_INSN, C_none, 0, I_VEXTRACTF32X4 },
    TOK t_vextractf32x4, TOKEN_INSN, C_none, 0, I_VEXTRACTF32X4

    ; { "vextractf32x8", TOKEN_INSN, C_none, 0, I_VEXTRACTF32X8 },
    TOK t_vextractf32x8, TOKEN_INSN, C_none, 0, I_VEXTRACTF32X8

    ; { "vextractf64x2", TOKEN_INSN, C_none, 0, I_VEXTRACTF64X2 },
    TOK t_vextractf64x2, TOKEN_INSN, C_none, 0, I_VEXTRACTF64X2

    ; { "vextractf64x4", TOKEN_INSN, C_none, 0, I_VEXTRACTF64X4 },
    TOK t_vextractf64x4, TOKEN_INSN, C_none, 0, I_VEXTRACTF64X4

    ; { "vextracti32x4", TOKEN_INSN, C_none, 0, I_VEXTRACTI32X4 },
    TOK t_vextracti32x4, TOKEN_INSN, C_none, 0, I_VEXTRACTI32X4

    ; { "vextracti32x8", TOKEN_INSN, C_none, 0, I_VEXTRACTI32X8 },
    TOK t_vextracti32x8, TOKEN_INSN, C_none, 0, I_VEXTRACTI32X8

    ; { "vextracti64x2", TOKEN_INSN, C_none, 0, I_VEXTRACTI64X2 },
    TOK t_vextracti64x2, TOKEN_INSN, C_none, 0, I_VEXTRACTI64X2

    ; { "vextracti64x4", TOKEN_INSN, C_none, 0, I_VEXTRACTI64X4 },
    TOK t_vextracti64x4, TOKEN_INSN, C_none, 0, I_VEXTRACTI64X4

    ; { "vfixupimmpd", TOKEN_INSN, C_none, 0, I_VFIXUPIMMPD },
    TOK t_vfixupimmpd, TOKEN_INSN, C_none, 0, I_VFIXUPIMMPD

    ; { "vfixupimmps", TOKEN_INSN, C_none, 0, I_VFIXUPIMMPS },
    TOK t_vfixupimmps, TOKEN_INSN, C_none, 0, I_VFIXUPIMMPS

    ; { "vfixupimmsd", TOKEN_INSN, C_none, 0, I_VFIXUPIMMSD },
    TOK t_vfixupimmsd, TOKEN_INSN, C_none, 0, I_VFIXUPIMMSD

    ; { "vfixupimmss", TOKEN_INSN, C_none, 0, I_VFIXUPIMMSS },
    TOK t_vfixupimmss, TOKEN_INSN, C_none, 0, I_VFIXUPIMMSS

    ; { "vfpclasspd", TOKEN_INSN, C_none, 0, I_VFPCLASSPD },
    TOK t_vfpclasspd, TOKEN_INSN, C_none, 0, I_VFPCLASSPD

    ; { "vfpclassps", TOKEN_INSN, C_none, 0, I_VFPCLASSPS },
    TOK t_vfpclassps, TOKEN_INSN, C_none, 0, I_VFPCLASSPS

    ; { "vfpclasssd", TOKEN_INSN, C_none, 0, I_VFPCLASSSD },
    TOK t_vfpclasssd, TOKEN_INSN, C_none, 0, I_VFPCLASSSD

    ; { "vfpclassss", TOKEN_INSN, C_none, 0, I_VFPCLASSSS },
    TOK t_vfpclassss, TOKEN_INSN, C_none, 0, I_VFPCLASSSS

    ; { "vgatherpf0dpd", TOKEN_INSN, C_none, 0, I_VGATHERPF0DPD },
    TOK t_vgatherpf0dpd, TOKEN_INSN, C_none, 0, I_VGATHERPF0DPD

    ; { "vgatherpf0dps", TOKEN_INSN, C_none, 0, I_VGATHERPF0DPS },
    TOK t_vgatherpf0dps, TOKEN_INSN, C_none, 0, I_VGATHERPF0DPS

    ; { "vgatherpf0qpd", TOKEN_INSN, C_none, 0, I_VGATHERPF0QPD },
    TOK t_vgatherpf0qpd, TOKEN_INSN, C_none, 0, I_VGATHERPF0QPD

    ; { "vgatherpf0qps", TOKEN_INSN, C_none, 0, I_VGATHERPF0QPS },
    TOK t_vgatherpf0qps, TOKEN_INSN, C_none, 0, I_VGATHERPF0QPS

    ; { "vgatherpf1dpd", TOKEN_INSN, C_none, 0, I_VGATHERPF1DPD },
    TOK t_vgatherpf1dpd, TOKEN_INSN, C_none, 0, I_VGATHERPF1DPD

    ; { "vgatherpf1dps", TOKEN_INSN, C_none, 0, I_VGATHERPF1DPS },
    TOK t_vgatherpf1dps, TOKEN_INSN, C_none, 0, I_VGATHERPF1DPS

    ; { "vgatherpf1qpd", TOKEN_INSN, C_none, 0, I_VGATHERPF1QPD },
    TOK t_vgatherpf1qpd, TOKEN_INSN, C_none, 0, I_VGATHERPF1QPD

    ; { "vgatherpf1qps", TOKEN_INSN, C_none, 0, I_VGATHERPF1QPS },
    TOK t_vgatherpf1qps, TOKEN_INSN, C_none, 0, I_VGATHERPF1QPS

    ; { "vgetexppd", TOKEN_INSN, C_none, 0, I_VGETEXPPD },
    TOK t_vgetexppd, TOKEN_INSN, C_none, 0, I_VGETEXPPD

    ; { "vgetexpps", TOKEN_INSN, C_none, 0, I_VGETEXPPS },
    TOK t_vgetexpps, TOKEN_INSN, C_none, 0, I_VGETEXPPS

    ; { "vgetexpsd", TOKEN_INSN, C_none, 0, I_VGETEXPSD },
    TOK t_vgetexpsd, TOKEN_INSN, C_none, 0, I_VGETEXPSD

    ; { "vgetexpss", TOKEN_INSN, C_none, 0, I_VGETEXPSS },
    TOK t_vgetexpss, TOKEN_INSN, C_none, 0, I_VGETEXPSS

    ; { "vgetmantpd", TOKEN_INSN, C_none, 0, I_VGETMANTPD },
    TOK t_vgetmantpd, TOKEN_INSN, C_none, 0, I_VGETMANTPD

    ; { "vgetmantps", TOKEN_INSN, C_none, 0, I_VGETMANTPS },
    TOK t_vgetmantps, TOKEN_INSN, C_none, 0, I_VGETMANTPS

    ; { "vgetmantsd", TOKEN_INSN, C_none, 0, I_VGETMANTSD },
    TOK t_vgetmantsd, TOKEN_INSN, C_none, 0, I_VGETMANTSD

    ; { "vgetmantss", TOKEN_INSN, C_none, 0, I_VGETMANTSS },
    TOK t_vgetmantss, TOKEN_INSN, C_none, 0, I_VGETMANTSS

    ; { "vinsertf32x4", TOKEN_INSN, C_none, 0, I_VINSERTF32X4 },
    TOK t_vinsertf32x4, TOKEN_INSN, C_none, 0, I_VINSERTF32X4

    ; { "vinsertf32x8", TOKEN_INSN, C_none, 0, I_VINSERTF32X8 },
    TOK t_vinsertf32x8, TOKEN_INSN, C_none, 0, I_VINSERTF32X8

    ; { "vinsertf64x2", TOKEN_INSN, C_none, 0, I_VINSERTF64X2 },
    TOK t_vinsertf64x2, TOKEN_INSN, C_none, 0, I_VINSERTF64X2

    ; { "vinsertf64x4", TOKEN_INSN, C_none, 0, I_VINSERTF64X4 },
    TOK t_vinsertf64x4, TOKEN_INSN, C_none, 0, I_VINSERTF64X4

    ; { "vinserti32x4", TOKEN_INSN, C_none, 0, I_VINSERTI32X4 },
    TOK t_vinserti32x4, TOKEN_INSN, C_none, 0, I_VINSERTI32X4

    ; { "vinserti32x8", TOKEN_INSN, C_none, 0, I_VINSERTI32X8 },
    TOK t_vinserti32x8, TOKEN_INSN, C_none, 0, I_VINSERTI32X8

    ; { "vinserti64x2", TOKEN_INSN, C_none, 0, I_VINSERTI64X2 },
    TOK t_vinserti64x2, TOKEN_INSN, C_none, 0, I_VINSERTI64X2

    ; { "vinserti64x4", TOKEN_INSN, C_none, 0, I_VINSERTI64X4 },
    TOK t_vinserti64x4, TOKEN_INSN, C_none, 0, I_VINSERTI64X4

    ; { "vmovdqa32", TOKEN_INSN, C_none, 0, I_VMOVDQA32 },
    TOK t_vmovdqa32, TOKEN_INSN, C_none, 0, I_VMOVDQA32

    ; { "vmovdqa64", TOKEN_INSN, C_none, 0, I_VMOVDQA64 },
    TOK t_vmovdqa64, TOKEN_INSN, C_none, 0, I_VMOVDQA64

    ; { "vmovdqu16", TOKEN_INSN, C_none, 0, I_VMOVDQU16 },
    TOK t_vmovdqu16, TOKEN_INSN, C_none, 0, I_VMOVDQU16

    ; { "vmovdqu32", TOKEN_INSN, C_none, 0, I_VMOVDQU32 },
    TOK t_vmovdqu32, TOKEN_INSN, C_none, 0, I_VMOVDQU32

    ; { "vmovdqu64", TOKEN_INSN, C_none, 0, I_VMOVDQU64 },
    TOK t_vmovdqu64, TOKEN_INSN, C_none, 0, I_VMOVDQU64

    ; { "vmovdqu8", TOKEN_INSN, C_none, 0, I_VMOVDQU8 },
    TOK t_vmovdqu8, TOKEN_INSN, C_none, 0, I_VMOVDQU8

    ; { "vpabsq", TOKEN_INSN, C_none, 0, I_VPABSQ },
    TOK t_vpabsq, TOKEN_INSN, C_none, 0, I_VPABSQ

    ; { "vpandd", TOKEN_INSN, C_none, 0, I_VPANDD },
    TOK t_vpandd, TOKEN_INSN, C_none, 0, I_VPANDD

    ; { "vpandnd", TOKEN_INSN, C_none, 0, I_VPANDND },
    TOK t_vpandnd, TOKEN_INSN, C_none, 0, I_VPANDND

    ; { "vpandnq", TOKEN_INSN, C_none, 0, I_VPANDNQ },
    TOK t_vpandnq, TOKEN_INSN, C_none, 0, I_VPANDNQ

    ; { "vpandq", TOKEN_INSN, C_none, 0, I_VPANDQ },
    TOK t_vpandq, TOKEN_INSN, C_none, 0, I_VPANDQ

    ; { "vpblendmb", TOKEN_INSN, C_none, 0, I_VPBLENDMB },
    TOK t_vpblendmb, TOKEN_INSN, C_none, 0, I_VPBLENDMB

    ; { "vpblendmd", TOKEN_INSN, C_none, 0, I_VPBLENDMD },
    TOK t_vpblendmd, TOKEN_INSN, C_none, 0, I_VPBLENDMD

    ; { "vpblendmq", TOKEN_INSN, C_none, 0, I_VPBLENDMQ },
    TOK t_vpblendmq, TOKEN_INSN, C_none, 0, I_VPBLENDMQ

    ; { "vpblendmw", TOKEN_INSN, C_none, 0, I_VPBLENDMW },
    TOK t_vpblendmw, TOKEN_INSN, C_none, 0, I_VPBLENDMW

    ; { "vpbroadcastmb2q", TOKEN_INSN, C_none, 0, I_VPBROADCASTMB2Q },
    TOK t_vpbroadcastmb2q, TOKEN_INSN, C_none, 0, I_VPBROADCASTMB2Q

    ; { "vpbroadcastmw2d", TOKEN_INSN, C_none, 0, I_VPBROADCASTMW2D },
    TOK t_vpbroadcastmw2d, TOKEN_INSN, C_none, 0, I_VPBROADCASTMW2D

    ; { "vpcmpb", TOKEN_INSN, C_none, 0, I_VPCMPB },
    TOK t_vpcmpb, TOKEN_INSN, C_none, 0, I_VPCMPB

    ; { "vpcmpd", TOKEN_INSN, C_none, 0, I_VPCMPD },
    TOK t_vpcmpd, TOKEN_INSN, C_none, 0, I_VPCMPD

    ; { "vpcmpq", TOKEN_INSN, C_none, 0, I_VPCMPQ },
    TOK t_vpcmpq, TOKEN_INSN, C_none, 0, I_VPCMPQ

    ; { "vpcmpub", TOKEN_INSN, C_none, 0, I_VPCMPUB },
    TOK t_vpcmpub, TOKEN_INSN, C_none, 0, I_VPCMPUB

    ; { "vpcmpud", TOKEN_INSN, C_none, 0, I_VPCMPUD },
    TOK t_vpcmpud, TOKEN_INSN, C_none, 0, I_VPCMPUD

    ; { "vpcmpuq", TOKEN_INSN, C_none, 0, I_VPCMPUQ },
    TOK t_vpcmpuq, TOKEN_INSN, C_none, 0, I_VPCMPUQ

    ; { "vpcmpuw", TOKEN_INSN, C_none, 0, I_VPCMPUW },
    TOK t_vpcmpuw, TOKEN_INSN, C_none, 0, I_VPCMPUW

    ; { "vpcmpw", TOKEN_INSN, C_none, 0, I_VPCMPW },
    TOK t_vpcmpw, TOKEN_INSN, C_none, 0, I_VPCMPW

    ; { "vpcompressd", TOKEN_INSN, C_none, 0, I_VPCOMPRESSD },
    TOK t_vpcompressd, TOKEN_INSN, C_none, 0, I_VPCOMPRESSD

    ; { "vpcompressq", TOKEN_INSN, C_none, 0, I_VPCOMPRESSQ },
    TOK t_vpcompressq, TOKEN_INSN, C_none, 0, I_VPCOMPRESSQ

    ; { "vpconflictd", TOKEN_INSN, C_none, 0, I_VPCONFLICTD },
    TOK t_vpconflictd, TOKEN_INSN, C_none, 0, I_VPCONFLICTD

    ; { "vpconflictq", TOKEN_INSN, C_none, 0, I_VPCONFLICTQ },
    TOK t_vpconflictq, TOKEN_INSN, C_none, 0, I_VPCONFLICTQ

    ; { "vpermb", TOKEN_INSN, C_none, 0, I_VPERMB },
    TOK t_vpermb, TOKEN_INSN, C_none, 0, I_VPERMB

    ; { "vpermi2b", TOKEN_INSN, C_none, 0, I_VPERMI2B },
    TOK t_vpermi2b, TOKEN_INSN, C_none, 0, I_VPERMI2B

    ; { "vpermi2d", TOKEN_INSN, C_none, 0, I_VPERMI2D },
    TOK t_vpermi2d, TOKEN_INSN, C_none, 0, I_VPERMI2D

    ; { "vpermi2pd", TOKEN_INSN, C_none, 0, I_VPERMI2PD },
    TOK t_vpermi2pd, TOKEN_INSN, C_none, 0, I_VPERMI2PD

    ; { "vpermi2ps", TOKEN_INSN, C_none, 0, I_VPERMI2PS },
    TOK t_vpermi2ps, TOKEN_INSN, C_none, 0, I_VPERMI2PS

    ; { "vpermi2q", TOKEN_INSN, C_none, 0, I_VPERMI2Q },
    TOK t_vpermi2q, TOKEN_INSN, C_none, 0, I_VPERMI2Q

    ; { "vpermi2w", TOKEN_INSN, C_none, 0, I_VPERMI2W },
    TOK t_vpermi2w, TOKEN_INSN, C_none, 0, I_VPERMI2W

    ; { "vpermt2b", TOKEN_INSN, C_none, 0, I_VPERMT2B },
    TOK t_vpermt2b, TOKEN_INSN, C_none, 0, I_VPERMT2B

    ; { "vpermt2d", TOKEN_INSN, C_none, 0, I_VPERMT2D },
    TOK t_vpermt2d, TOKEN_INSN, C_none, 0, I_VPERMT2D

    ; { "vpermt2pd", TOKEN_INSN, C_none, 0, I_VPERMT2PD },
    TOK t_vpermt2pd, TOKEN_INSN, C_none, 0, I_VPERMT2PD

    ; { "vpermt2ps", TOKEN_INSN, C_none, 0, I_VPERMT2PS },
    TOK t_vpermt2ps, TOKEN_INSN, C_none, 0, I_VPERMT2PS

    ; { "vpermt2q", TOKEN_INSN, C_none, 0, I_VPERMT2Q },
    TOK t_vpermt2q, TOKEN_INSN, C_none, 0, I_VPERMT2Q

    ; { "vpermt2w", TOKEN_INSN, C_none, 0, I_VPERMT2W },
    TOK t_vpermt2w, TOKEN_INSN, C_none, 0, I_VPERMT2W

    ; { "vpermw", TOKEN_INSN, C_none, 0, I_VPERMW },
    TOK t_vpermw, TOKEN_INSN, C_none, 0, I_VPERMW

    ; { "vpexpandd", TOKEN_INSN, C_none, 0, I_VPEXPANDD },
    TOK t_vpexpandd, TOKEN_INSN, C_none, 0, I_VPEXPANDD

    ; { "vpexpandq", TOKEN_INSN, C_none, 0, I_VPEXPANDQ },
    TOK t_vpexpandq, TOKEN_INSN, C_none, 0, I_VPEXPANDQ

    ; { "vplzcntd", TOKEN_INSN, C_none, 0, I_VPLZCNTD },
    TOK t_vplzcntd, TOKEN_INSN, C_none, 0, I_VPLZCNTD

    ; { "vplzcntq", TOKEN_INSN, C_none, 0, I_VPLZCNTQ },
    TOK t_vplzcntq, TOKEN_INSN, C_none, 0, I_VPLZCNTQ

    ; { "vpmadd52huq", TOKEN_INSN, C_none, 0, I_VPMADD52HUQ },
    TOK t_vpmadd52huq, TOKEN_INSN, C_none, 0, I_VPMADD52HUQ

    ; { "vpmadd52luq", TOKEN_INSN, C_none, 0, I_VPMADD52LUQ },
    TOK t_vpmadd52luq, TOKEN_INSN, C_none, 0, I_VPMADD52LUQ

    ; { "vpmaxsq", TOKEN_INSN, C_none, 0, I_VPMAXSQ },
    TOK t_vpmaxsq, TOKEN_INSN, C_none, 0, I_VPMAXSQ

    ; { "vpmaxuq", TOKEN_INSN, C_none, 0, I_VPMAXUQ },
    TOK t_vpmaxuq, TOKEN_INSN, C_none, 0, I_VPMAXUQ

    ; { "vpminsq", TOKEN_INSN, C_none, 0, I_VPMINSQ },
    TOK t_vpminsq, TOKEN_INSN, C_none, 0, I_VPMINSQ

    ; { "vpminuq", TOKEN_INSN, C_none, 0, I_VPMINUQ },
    TOK t_vpminuq, TOKEN_INSN, C_none, 0, I_VPMINUQ

    ; { "vpmovb2m", TOKEN_INSN, C_none, 0, I_VPMOVB2M },
    TOK t_vpmovb2m, TOKEN_INSN, C_none, 0, I_VPMOVB2M

    ; { "vpmovd2m", TOKEN_INSN, C_none, 0, I_VPMOVD2M },
    TOK t_vpmovd2m, TOKEN_INSN, C_none, 0, I_VPMOVD2M

    ; { "vpmovdb", TOKEN_INSN, C_none, 0, I_VPMOVDB },
    TOK t_vpmovdb, TOKEN_INSN, C_none, 0, I_VPMOVDB

    ; { "vpmovdw", TOKEN_INSN, C_none, 0, I_VPMOVDW },
    TOK t_vpmovdw, TOKEN_INSN, C_none, 0, I_VPMOVDW

    ; { "vpmovm2b", TOKEN_INSN, C_none, 0, I_VPMOVM2B },
    TOK t_vpmovm2b, TOKEN_INSN, C_none, 0, I_VPMOVM2B

    ; { "vpmovm2d", TOKEN_INSN, C_none, 0, I_VPMOVM2D },
    TOK t_vpmovm2d, TOKEN_INSN, C_none, 0, I_VPMOVM2D

    ; { "vpmovm2q", TOKEN_INSN, C_none, 0, I_VPMOVM2Q },
    TOK t_vpmovm2q, TOKEN_INSN, C_none, 0, I_VPMOVM2Q

    ; { "vpmovm2w", TOKEN_INSN, C_none, 0, I_VPMOVM2W },
    TOK t_vpmovm2w, TOKEN_INSN, C_none, 0, I_VPMOVM2W

    ; { "vpmovq2m", TOKEN_INSN, C_none, 0, I_VPMOVQ2M },
    TOK t_vpmovq2m, TOKEN_INSN, C_none, 0, I_VPMOVQ2M

    ; { "vpmovqb", TOKEN_INSN, C_none, 0, I_VPMOVQB },
    TOK t_vpmovqb, TOKEN_INSN, C_none, 0, I_VPMOVQB

    ; { "vpmovqd", TOKEN_INSN, C_none, 0, I_VPMOVQD },
    TOK t_vpmovqd, TOKEN_INSN, C_none, 0, I_VPMOVQD

    ; { "vpmovqw", TOKEN_INSN, C_none, 0, I_VPMOVQW },
    TOK t_vpmovqw, TOKEN_INSN, C_none, 0, I_VPMOVQW

    ; { "vpmovsdb", TOKEN_INSN, C_none, 0, I_VPMOVSDB },
    TOK t_vpmovsdb, TOKEN_INSN, C_none, 0, I_VPMOVSDB

    ; { "vpmovsdw", TOKEN_INSN, C_none, 0, I_VPMOVSDW },
    TOK t_vpmovsdw, TOKEN_INSN, C_none, 0, I_VPMOVSDW

    ; { "vpmovsqb", TOKEN_INSN, C_none, 0, I_VPMOVSQB },
    TOK t_vpmovsqb, TOKEN_INSN, C_none, 0, I_VPMOVSQB

    ; { "vpmovsqd", TOKEN_INSN, C_none, 0, I_VPMOVSQD },
    TOK t_vpmovsqd, TOKEN_INSN, C_none, 0, I_VPMOVSQD

    ; { "vpmovsqw", TOKEN_INSN, C_none, 0, I_VPMOVSQW },
    TOK t_vpmovsqw, TOKEN_INSN, C_none, 0, I_VPMOVSQW

    ; { "vpmovswb", TOKEN_INSN, C_none, 0, I_VPMOVSWB },
    TOK t_vpmovswb, TOKEN_INSN, C_none, 0, I_VPMOVSWB

    ; { "vpmovusdb", TOKEN_INSN, C_none, 0, I_VPMOVUSDB },
    TOK t_vpmovusdb, TOKEN_INSN, C_none, 0, I_VPMOVUSDB

    ; { "vpmovusdw", TOKEN_INSN, C_none, 0, I_VPMOVUSDW },
    TOK t_vpmovusdw, TOKEN_INSN, C_none, 0, I_VPMOVUSDW

    ; { "vpmovusqb", TOKEN_INSN, C_none, 0, I_VPMOVUSQB },
    TOK t_vpmovusqb, TOKEN_INSN, C_none, 0, I_VPMOVUSQB

    ; { "vpmovusqd", TOKEN_INSN, C_none, 0, I_VPMOVUSQD },
    TOK t_vpmovusqd, TOKEN_INSN, C_none, 0, I_VPMOVUSQD

    ; { "vpmovusqw", TOKEN_INSN, C_none, 0, I_VPMOVUSQW },
    TOK t_vpmovusqw, TOKEN_INSN, C_none, 0, I_VPMOVUSQW

    ; { "vpmovuswb", TOKEN_INSN, C_none, 0, I_VPMOVUSWB },
    TOK t_vpmovuswb, TOKEN_INSN, C_none, 0, I_VPMOVUSWB

    ; { "vpmovw2m", TOKEN_INSN, C_none, 0, I_VPMOVW2M },
    TOK t_vpmovw2m, TOKEN_INSN, C_none, 0, I_VPMOVW2M

    ; { "vpmovwb", TOKEN_INSN, C_none, 0, I_VPMOVWB },
    TOK t_vpmovwb, TOKEN_INSN, C_none, 0, I_VPMOVWB

    ; { "vpmullq", TOKEN_INSN, C_none, 0, I_VPMULLQ },
    TOK t_vpmullq, TOKEN_INSN, C_none, 0, I_VPMULLQ

    ; { "vpmultishiftqb", TOKEN_INSN, C_none, 0, I_VPMULTISHIFTQB },
    TOK t_vpmultishiftqb, TOKEN_INSN, C_none, 0, I_VPMULTISHIFTQB

    ; { "vpord", TOKEN_INSN, C_none, 0, I_VPORD },
    TOK t_vpord, TOKEN_INSN, C_none, 0, I_VPORD

    ; { "vporq", TOKEN_INSN, C_none, 0, I_VPORQ },
    TOK t_vporq, TOKEN_INSN, C_none, 0, I_VPORQ

    ; { "vprold", TOKEN_INSN, C_none, 0, I_VPROLD },
    TOK t_vprold, TOKEN_INSN, C_none, 0, I_VPROLD

    ; { "vprolq", TOKEN_INSN, C_none, 0, I_VPROLQ },
    TOK t_vprolq, TOKEN_INSN, C_none, 0, I_VPROLQ

    ; { "vprolvd", TOKEN_INSN, C_none, 0, I_VPROLVD },
    TOK t_vprolvd, TOKEN_INSN, C_none, 0, I_VPROLVD

    ; { "vprolvq", TOKEN_INSN, C_none, 0, I_VPROLVQ },
    TOK t_vprolvq, TOKEN_INSN, C_none, 0, I_VPROLVQ

    ; { "vprord", TOKEN_INSN, C_none, 0, I_VPRORD },
    TOK t_vprord, TOKEN_INSN, C_none, 0, I_VPRORD

    ; { "vprorq", TOKEN_INSN, C_none, 0, I_VPRORQ },
    TOK t_vprorq, TOKEN_INSN, C_none, 0, I_VPRORQ

    ; { "vprorvd", TOKEN_INSN, C_none, 0, I_VPRORVD },
    TOK t_vprorvd, TOKEN_INSN, C_none, 0, I_VPRORVD

    ; { "vprorvq", TOKEN_INSN, C_none, 0, I_VPRORVQ },
    TOK t_vprorvq, TOKEN_INSN, C_none, 0, I_VPRORVQ

    ; { "vpscatterdd", TOKEN_INSN, C_none, 0, I_VPSCATTERDD },
    TOK t_vpscatterdd, TOKEN_INSN, C_none, 0, I_VPSCATTERDD

    ; { "vpscatterdq", TOKEN_INSN, C_none, 0, I_VPSCATTERDQ },
    TOK t_vpscatterdq, TOKEN_INSN, C_none, 0, I_VPSCATTERDQ

    ; { "vpscatterqd", TOKEN_INSN, C_none, 0, I_VPSCATTERQD },
    TOK t_vpscatterqd, TOKEN_INSN, C_none, 0, I_VPSCATTERQD

    ; { "vpscatterqq", TOKEN_INSN, C_none, 0, I_VPSCATTERQQ },
    TOK t_vpscatterqq, TOKEN_INSN, C_none, 0, I_VPSCATTERQQ

    ; { "vpsllvw", TOKEN_INSN, C_none, 0, I_VPSLLVW },
    TOK t_vpsllvw, TOKEN_INSN, C_none, 0, I_VPSLLVW

    ; { "vpsraq", TOKEN_INSN, C_none, 0, I_VPSRAQ },
    TOK t_vpsraq, TOKEN_INSN, C_none, 0, I_VPSRAQ

    ; { "vpsravq", TOKEN_INSN, C_none, 0, I_VPSRAVQ },
    TOK t_vpsravq, TOKEN_INSN, C_none, 0, I_VPSRAVQ

    ; { "vpsravw", TOKEN_INSN, C_none, 0, I_VPSRAVW },
    TOK t_vpsravw, TOKEN_INSN, C_none, 0, I_VPSRAVW

    ; { "vpsrlvw", TOKEN_INSN, C_none, 0, I_VPSRLVW },
    TOK t_vpsrlvw, TOKEN_INSN, C_none, 0, I_VPSRLVW

    ; { "vpternlogd", TOKEN_INSN, C_none, 0, I_VPTERNLOGD },
    TOK t_vpternlogd, TOKEN_INSN, C_none, 0, I_VPTERNLOGD

    ; { "vpternlogq", TOKEN_INSN, C_none, 0, I_VPTERNLOGQ },
    TOK t_vpternlogq, TOKEN_INSN, C_none, 0, I_VPTERNLOGQ

    ; { "vptestmb", TOKEN_INSN, C_none, 0, I_VPTESTMB },
    TOK t_vptestmb, TOKEN_INSN, C_none, 0, I_VPTESTMB

    ; { "vptestmd", TOKEN_INSN, C_none, 0, I_VPTESTMD },
    TOK t_vptestmd, TOKEN_INSN, C_none, 0, I_VPTESTMD

    ; { "vptestmq", TOKEN_INSN, C_none, 0, I_VPTESTMQ },
    TOK t_vptestmq, TOKEN_INSN, C_none, 0, I_VPTESTMQ

    ; { "vptestmw", TOKEN_INSN, C_none, 0, I_VPTESTMW },
    TOK t_vptestmw, TOKEN_INSN, C_none, 0, I_VPTESTMW

    ; { "vptestnmb", TOKEN_INSN, C_none, 0, I_VPTESTNMB },
    TOK t_vptestnmb, TOKEN_INSN, C_none, 0, I_VPTESTNMB

    ; { "vptestnmd", TOKEN_INSN, C_none, 0, I_VPTESTNMD },
    TOK t_vptestnmd, TOKEN_INSN, C_none, 0, I_VPTESTNMD

    ; { "vptestnmq", TOKEN_INSN, C_none, 0, I_VPTESTNMQ },
    TOK t_vptestnmq, TOKEN_INSN, C_none, 0, I_VPTESTNMQ

    ; { "vptestnmw", TOKEN_INSN, C_none, 0, I_VPTESTNMW },
    TOK t_vptestnmw, TOKEN_INSN, C_none, 0, I_VPTESTNMW

    ; { "vpxord", TOKEN_INSN, C_none, 0, I_VPXORD },
    TOK t_vpxord, TOKEN_INSN, C_none, 0, I_VPXORD

    ; { "vpxorq", TOKEN_INSN, C_none, 0, I_VPXORQ },
    TOK t_vpxorq, TOKEN_INSN, C_none, 0, I_VPXORQ

    ; { "vrangepd", TOKEN_INSN, C_none, 0, I_VRANGEPD },
    TOK t_vrangepd, TOKEN_INSN, C_none, 0, I_VRANGEPD

    ; { "vrangeps", TOKEN_INSN, C_none, 0, I_VRANGEPS },
    TOK t_vrangeps, TOKEN_INSN, C_none, 0, I_VRANGEPS

    ; { "vrangesd", TOKEN_INSN, C_none, 0, I_VRANGESD },
    TOK t_vrangesd, TOKEN_INSN, C_none, 0, I_VRANGESD

    ; { "vrangess", TOKEN_INSN, C_none, 0, I_VRANGESS },
    TOK t_vrangess, TOKEN_INSN, C_none, 0, I_VRANGESS

    ; { "vrcp14pd", TOKEN_INSN, C_none, 0, I_VRCP14PD },
    TOK t_vrcp14pd, TOKEN_INSN, C_none, 0, I_VRCP14PD

    ; { "vrcp14ps", TOKEN_INSN, C_none, 0, I_VRCP14PS },
    TOK t_vrcp14ps, TOKEN_INSN, C_none, 0, I_VRCP14PS

    ; { "vrcp14sd", TOKEN_INSN, C_none, 0, I_VRCP14SD },
    TOK t_vrcp14sd, TOKEN_INSN, C_none, 0, I_VRCP14SD

    ; { "vrcp14ss", TOKEN_INSN, C_none, 0, I_VRCP14SS },
    TOK t_vrcp14ss, TOKEN_INSN, C_none, 0, I_VRCP14SS

    ; { "vrcp28pd", TOKEN_INSN, C_none, 0, I_VRCP28PD },
    TOK t_vrcp28pd, TOKEN_INSN, C_none, 0, I_VRCP28PD

    ; { "vrcp28ps", TOKEN_INSN, C_none, 0, I_VRCP28PS },
    TOK t_vrcp28ps, TOKEN_INSN, C_none, 0, I_VRCP28PS

    ; { "vrcp28sd", TOKEN_INSN, C_none, 0, I_VRCP28SD },
    TOK t_vrcp28sd, TOKEN_INSN, C_none, 0, I_VRCP28SD

    ; { "vrcp28ss", TOKEN_INSN, C_none, 0, I_VRCP28SS },
    TOK t_vrcp28ss, TOKEN_INSN, C_none, 0, I_VRCP28SS

    ; { "vreducepd", TOKEN_INSN, C_none, 0, I_VREDUCEPD },
    TOK t_vreducepd, TOKEN_INSN, C_none, 0, I_VREDUCEPD

    ; { "vreduceps", TOKEN_INSN, C_none, 0, I_VREDUCEPS },
    TOK t_vreduceps, TOKEN_INSN, C_none, 0, I_VREDUCEPS

    ; { "vreducesd", TOKEN_INSN, C_none, 0, I_VREDUCESD },
    TOK t_vreducesd, TOKEN_INSN, C_none, 0, I_VREDUCESD

    ; { "vreducess", TOKEN_INSN, C_none, 0, I_VREDUCESS },
    TOK t_vreducess, TOKEN_INSN, C_none, 0, I_VREDUCESS

    ; { "vrndscalepd", TOKEN_INSN, C_none, 0, I_VRNDSCALEPD },
    TOK t_vrndscalepd, TOKEN_INSN, C_none, 0, I_VRNDSCALEPD

    ; { "vrndscaleps", TOKEN_INSN, C_none, 0, I_VRNDSCALEPS },
    TOK t_vrndscaleps, TOKEN_INSN, C_none, 0, I_VRNDSCALEPS

    ; { "vrndscalesd", TOKEN_INSN, C_none, 0, I_VRNDSCALESD },
    TOK t_vrndscalesd, TOKEN_INSN, C_none, 0, I_VRNDSCALESD

    ; { "vrndscaless", TOKEN_INSN, C_none, 0, I_VRNDSCALESS },
    TOK t_vrndscaless, TOKEN_INSN, C_none, 0, I_VRNDSCALESS

    ; { "vrsqrt14pd", TOKEN_INSN, C_none, 0, I_VRSQRT14PD },
    TOK t_vrsqrt14pd, TOKEN_INSN, C_none, 0, I_VRSQRT14PD

    ; { "vrsqrt14ps", TOKEN_INSN, C_none, 0, I_VRSQRT14PS },
    TOK t_vrsqrt14ps, TOKEN_INSN, C_none, 0, I_VRSQRT14PS

    ; { "vrsqrt14sd", TOKEN_INSN, C_none, 0, I_VRSQRT14SD },
    TOK t_vrsqrt14sd, TOKEN_INSN, C_none, 0, I_VRSQRT14SD

    ; { "vrsqrt14ss", TOKEN_INSN, C_none, 0, I_VRSQRT14SS },
    TOK t_vrsqrt14ss, TOKEN_INSN, C_none, 0, I_VRSQRT14SS

    ; { "vrsqrt28pd", TOKEN_INSN, C_none, 0, I_VRSQRT28PD },
    TOK t_vrsqrt28pd, TOKEN_INSN, C_none, 0, I_VRSQRT28PD

    ; { "vrsqrt28ps", TOKEN_INSN, C_none, 0, I_VRSQRT28PS },
    TOK t_vrsqrt28ps, TOKEN_INSN, C_none, 0, I_VRSQRT28PS

    ; { "vrsqrt28sd", TOKEN_INSN, C_none, 0, I_VRSQRT28SD },
    TOK t_vrsqrt28sd, TOKEN_INSN, C_none, 0, I_VRSQRT28SD

    ; { "vrsqrt28ss", TOKEN_INSN, C_none, 0, I_VRSQRT28SS },
    TOK t_vrsqrt28ss, TOKEN_INSN, C_none, 0, I_VRSQRT28SS

    ; { "vscalefpd", TOKEN_INSN, C_none, 0, I_VSCALEFPD },
    TOK t_vscalefpd, TOKEN_INSN, C_none, 0, I_VSCALEFPD

    ; { "vscalefps", TOKEN_INSN, C_none, 0, I_VSCALEFPS },
    TOK t_vscalefps, TOKEN_INSN, C_none, 0, I_VSCALEFPS

    ; { "vscalefsd", TOKEN_INSN, C_none, 0, I_VSCALEFSD },
    TOK t_vscalefsd, TOKEN_INSN, C_none, 0, I_VSCALEFSD

    ; { "vscalefss", TOKEN_INSN, C_none, 0, I_VSCALEFSS },
    TOK t_vscalefss, TOKEN_INSN, C_none, 0, I_VSCALEFSS

    ; { "vscatterdpd", TOKEN_INSN, C_none, 0, I_VSCATTERDPD },
    TOK t_vscatterdpd, TOKEN_INSN, C_none, 0, I_VSCATTERDPD

    ; { "vscatterdps", TOKEN_INSN, C_none, 0, I_VSCATTERDPS },
    TOK t_vscatterdps, TOKEN_INSN, C_none, 0, I_VSCATTERDPS

    ; { "vscatterpf0dpd", TOKEN_INSN, C_none, 0, I_VSCATTERPF0DPD },
    TOK t_vscatterpf0dpd, TOKEN_INSN, C_none, 0, I_VSCATTERPF0DPD

    ; { "vscatterpf0dps", TOKEN_INSN, C_none, 0, I_VSCATTERPF0DPS },
    TOK t_vscatterpf0dps, TOKEN_INSN, C_none, 0, I_VSCATTERPF0DPS

    ; { "vscatterpf0qpd", TOKEN_INSN, C_none, 0, I_VSCATTERPF0QPD },
    TOK t_vscatterpf0qpd, TOKEN_INSN, C_none, 0, I_VSCATTERPF0QPD

    ; { "vscatterpf0qps", TOKEN_INSN, C_none, 0, I_VSCATTERPF0QPS },
    TOK t_vscatterpf0qps, TOKEN_INSN, C_none, 0, I_VSCATTERPF0QPS

    ; { "vscatterpf1dpd", TOKEN_INSN, C_none, 0, I_VSCATTERPF1DPD },
    TOK t_vscatterpf1dpd, TOKEN_INSN, C_none, 0, I_VSCATTERPF1DPD

    ; { "vscatterpf1dps", TOKEN_INSN, C_none, 0, I_VSCATTERPF1DPS },
    TOK t_vscatterpf1dps, TOKEN_INSN, C_none, 0, I_VSCATTERPF1DPS

    ; { "vscatterpf1qpd", TOKEN_INSN, C_none, 0, I_VSCATTERPF1QPD },
    TOK t_vscatterpf1qpd, TOKEN_INSN, C_none, 0, I_VSCATTERPF1QPD

    ; { "vscatterpf1qps", TOKEN_INSN, C_none, 0, I_VSCATTERPF1QPS },
    TOK t_vscatterpf1qps, TOKEN_INSN, C_none, 0, I_VSCATTERPF1QPS

    ; { "vscatterqpd", TOKEN_INSN, C_none, 0, I_VSCATTERQPD },
    TOK t_vscatterqpd, TOKEN_INSN, C_none, 0, I_VSCATTERQPD

    ; { "vscatterqps", TOKEN_INSN, C_none, 0, I_VSCATTERQPS },
    TOK t_vscatterqps, TOKEN_INSN, C_none, 0, I_VSCATTERQPS

    ; { "vshuff32x4", TOKEN_INSN, C_none, 0, I_VSHUFF32X4 },
    TOK t_vshuff32x4, TOKEN_INSN, C_none, 0, I_VSHUFF32X4

    ; { "vshuff64x2", TOKEN_INSN, C_none, 0, I_VSHUFF64X2 },
    TOK t_vshuff64x2, TOKEN_INSN, C_none, 0, I_VSHUFF64X2

    ; { "vshufi32x4", TOKEN_INSN, C_none, 0, I_VSHUFI32X4 },
    TOK t_vshufi32x4, TOKEN_INSN, C_none, 0, I_VSHUFI32X4

    ; { "vshufi64x2", TOKEN_INSN, C_none, 0, I_VSHUFI64X2 },
    TOK t_vshufi64x2, TOKEN_INSN, C_none, 0, I_VSHUFI64X2

    ; { "rdpkru", TOKEN_INSN, C_none, 0, I_RDPKRU },
    TOK t_rdpkru, TOKEN_INSN, C_none, 0, I_RDPKRU

    ; { "wrpkru", TOKEN_INSN, C_none, 0, I_WRPKRU },
    TOK t_wrpkru, TOKEN_INSN, C_none, 0, I_WRPKRU

    ; { "rdpid", TOKEN_INSN, C_none, 0, I_RDPID },
    TOK t_rdpid, TOKEN_INSN, C_none, 0, I_RDPID

    ; { "clflushopt", TOKEN_INSN, C_none, 0, I_CLFLUSHOPT },
    TOK t_clflushopt, TOKEN_INSN, C_none, 0, I_CLFLUSHOPT

    ; { "clwb", TOKEN_INSN, C_none, 0, I_CLWB },
    TOK t_clwb, TOKEN_INSN, C_none, 0, I_CLWB

    ; { "pcommit", TOKEN_INSN, C_none, 0, I_PCOMMIT },
    TOK t_pcommit, TOKEN_INSN, C_none, 0, I_PCOMMIT

    ; { "clzero", TOKEN_INSN, C_none, 0, I_CLZERO },
    TOK t_clzero, TOKEN_INSN, C_none, 0, I_CLZERO

    ; { "ptwrite", TOKEN_INSN, C_none, 0, I_PTWRITE },
    TOK t_ptwrite, TOKEN_INSN, C_none, 0, I_PTWRITE

    ; { "cldemote", TOKEN_INSN, C_none, 0, I_CLDEMOTE },
    TOK t_cldemote, TOKEN_INSN, C_none, 0, I_CLDEMOTE

    ; { "movdiri", TOKEN_INSN, C_none, 0, I_MOVDIRI },
    TOK t_movdiri, TOKEN_INSN, C_none, 0, I_MOVDIRI

    ; { "movdir64b", TOKEN_INSN, C_none, 0, I_MOVDIR64B },
    TOK t_movdir64b, TOKEN_INSN, C_none, 0, I_MOVDIR64B

    ; { "pconfig", TOKEN_INSN, C_none, 0, I_PCONFIG },
    TOK t_pconfig, TOKEN_INSN, C_none, 0, I_PCONFIG

    ; { "tpause", TOKEN_INSN, C_none, 0, I_TPAUSE },
    TOK t_tpause, TOKEN_INSN, C_none, 0, I_TPAUSE

    ; { "umonitor", TOKEN_INSN, C_none, 0, I_UMONITOR },
    TOK t_umonitor, TOKEN_INSN, C_none, 0, I_UMONITOR

    ; { "umwait", TOKEN_INSN, C_none, 0, I_UMWAIT },
    TOK t_umwait, TOKEN_INSN, C_none, 0, I_UMWAIT

    ; { "wbnoinvd", TOKEN_INSN, C_none, 0, I_WBNOINVD },
    TOK t_wbnoinvd, TOKEN_INSN, C_none, 0, I_WBNOINVD

    ; { "gf2p8affineinvqb", TOKEN_INSN, C_none, 0, I_GF2P8AFFINEINVQB },
    TOK t_gf2p8affineinvqb, TOKEN_INSN, C_none, 0, I_GF2P8AFFINEINVQB

    ; { "vgf2p8affineinvqb", TOKEN_INSN, C_none, 0, I_VGF2P8AFFINEINVQB },
    TOK t_vgf2p8affineinvqb, TOKEN_INSN, C_none, 0, I_VGF2P8AFFINEINVQB

    ; { "gf2p8affineqb", TOKEN_INSN, C_none, 0, I_GF2P8AFFINEQB },
    TOK t_gf2p8affineqb, TOKEN_INSN, C_none, 0, I_GF2P8AFFINEQB

    ; { "vgf2p8affineqb", TOKEN_INSN, C_none, 0, I_VGF2P8AFFINEQB },
    TOK t_vgf2p8affineqb, TOKEN_INSN, C_none, 0, I_VGF2P8AFFINEQB

    ; { "gf2p8mulb", TOKEN_INSN, C_none, 0, I_GF2P8MULB },
    TOK t_gf2p8mulb, TOKEN_INSN, C_none, 0, I_GF2P8MULB

    ; { "vgf2p8mulb", TOKEN_INSN, C_none, 0, I_VGF2P8MULB },
    TOK t_vgf2p8mulb, TOKEN_INSN, C_none, 0, I_VGF2P8MULB

    ; { "vpcompressb", TOKEN_INSN, C_none, 0, I_VPCOMPRESSB },
    TOK t_vpcompressb, TOKEN_INSN, C_none, 0, I_VPCOMPRESSB

    ; { "vpcompressw", TOKEN_INSN, C_none, 0, I_VPCOMPRESSW },
    TOK t_vpcompressw, TOKEN_INSN, C_none, 0, I_VPCOMPRESSW

    ; { "vpexpandb", TOKEN_INSN, C_none, 0, I_VPEXPANDB },
    TOK t_vpexpandb, TOKEN_INSN, C_none, 0, I_VPEXPANDB

    ; { "vpexpandw", TOKEN_INSN, C_none, 0, I_VPEXPANDW },
    TOK t_vpexpandw, TOKEN_INSN, C_none, 0, I_VPEXPANDW

    ; { "vpshldw", TOKEN_INSN, C_none, 0, I_VPSHLDW },
    TOK t_vpshldw, TOKEN_INSN, C_none, 0, I_VPSHLDW

    ; { "vpshldd", TOKEN_INSN, C_none, 0, I_VPSHLDD },
    TOK t_vpshldd, TOKEN_INSN, C_none, 0, I_VPSHLDD

    ; { "vpshldq", TOKEN_INSN, C_none, 0, I_VPSHLDQ },
    TOK t_vpshldq, TOKEN_INSN, C_none, 0, I_VPSHLDQ

    ; { "vpshldvw", TOKEN_INSN, C_none, 0, I_VPSHLDVW },
    TOK t_vpshldvw, TOKEN_INSN, C_none, 0, I_VPSHLDVW

    ; { "vpshldvd", TOKEN_INSN, C_none, 0, I_VPSHLDVD },
    TOK t_vpshldvd, TOKEN_INSN, C_none, 0, I_VPSHLDVD

    ; { "vpshldvq", TOKEN_INSN, C_none, 0, I_VPSHLDVQ },
    TOK t_vpshldvq, TOKEN_INSN, C_none, 0, I_VPSHLDVQ

    ; { "vpshrdw", TOKEN_INSN, C_none, 0, I_VPSHRDW },
    TOK t_vpshrdw, TOKEN_INSN, C_none, 0, I_VPSHRDW

    ; { "vpshrdd", TOKEN_INSN, C_none, 0, I_VPSHRDD },
    TOK t_vpshrdd, TOKEN_INSN, C_none, 0, I_VPSHRDD

    ; { "vpshrdq", TOKEN_INSN, C_none, 0, I_VPSHRDQ },
    TOK t_vpshrdq, TOKEN_INSN, C_none, 0, I_VPSHRDQ

    ; { "vpshrdvw", TOKEN_INSN, C_none, 0, I_VPSHRDVW },
    TOK t_vpshrdvw, TOKEN_INSN, C_none, 0, I_VPSHRDVW

    ; { "vpshrdvd", TOKEN_INSN, C_none, 0, I_VPSHRDVD },
    TOK t_vpshrdvd, TOKEN_INSN, C_none, 0, I_VPSHRDVD

    ; { "vpshrdvq", TOKEN_INSN, C_none, 0, I_VPSHRDVQ },
    TOK t_vpshrdvq, TOKEN_INSN, C_none, 0, I_VPSHRDVQ

    ; { "vpdpbusd", TOKEN_INSN, C_none, 0, I_VPDPBUSD },
    TOK t_vpdpbusd, TOKEN_INSN, C_none, 0, I_VPDPBUSD

    ; { "vpdpbusds", TOKEN_INSN, C_none, 0, I_VPDPBUSDS },
    TOK t_vpdpbusds, TOKEN_INSN, C_none, 0, I_VPDPBUSDS

    ; { "vpdpwssd", TOKEN_INSN, C_none, 0, I_VPDPWSSD },
    TOK t_vpdpwssd, TOKEN_INSN, C_none, 0, I_VPDPWSSD

    ; { "vpdpwssds", TOKEN_INSN, C_none, 0, I_VPDPWSSDS },
    TOK t_vpdpwssds, TOKEN_INSN, C_none, 0, I_VPDPWSSDS

    ; { "vpopcntb", TOKEN_INSN, C_none, 0, I_VPOPCNTB },
    TOK t_vpopcntb, TOKEN_INSN, C_none, 0, I_VPOPCNTB

    ; { "vpopcntw", TOKEN_INSN, C_none, 0, I_VPOPCNTW },
    TOK t_vpopcntw, TOKEN_INSN, C_none, 0, I_VPOPCNTW

    ; { "vpopcntd", TOKEN_INSN, C_none, 0, I_VPOPCNTD },
    TOK t_vpopcntd, TOKEN_INSN, C_none, 0, I_VPOPCNTD

    ; { "vpopcntq", TOKEN_INSN, C_none, 0, I_VPOPCNTQ },
    TOK t_vpopcntq, TOKEN_INSN, C_none, 0, I_VPOPCNTQ

    ; { "vpshufbitqmb", TOKEN_INSN, C_none, 0, I_VPSHUFBITQMB },
    TOK t_vpshufbitqmb, TOKEN_INSN, C_none, 0, I_VPSHUFBITQMB

    ; { "v4fmaddps", TOKEN_INSN, C_none, 0, I_V4FMADDPS },
    TOK t_v4fmaddps, TOKEN_INSN, C_none, 0, I_V4FMADDPS

    ; { "v4fnmaddps", TOKEN_INSN, C_none, 0, I_V4FNMADDPS },
    TOK t_v4fnmaddps, TOKEN_INSN, C_none, 0, I_V4FNMADDPS

    ; { "v4fmaddss", TOKEN_INSN, C_none, 0, I_V4FMADDSS },
    TOK t_v4fmaddss, TOKEN_INSN, C_none, 0, I_V4FMADDSS

    ; { "v4fnmaddss", TOKEN_INSN, C_none, 0, I_V4FNMADDSS },
    TOK t_v4fnmaddss, TOKEN_INSN, C_none, 0, I_V4FNMADDSS

    ; { "v4dpwssds", TOKEN_INSN, C_none, 0, I_V4DPWSSDS },
    TOK t_v4dpwssds, TOKEN_INSN, C_none, 0, I_V4DPWSSDS

    ; { "v4dpwssd", TOKEN_INSN, C_none, 0, I_V4DPWSSD },
    TOK t_v4dpwssd, TOKEN_INSN, C_none, 0, I_V4DPWSSD

    ; { "encls", TOKEN_INSN, C_none, 0, I_ENCLS },
    TOK t_encls, TOKEN_INSN, C_none, 0, I_ENCLS

    ; { "enclu", TOKEN_INSN, C_none, 0, I_ENCLU },
    TOK t_enclu, TOKEN_INSN, C_none, 0, I_ENCLU

    ; { "enclv", TOKEN_INSN, C_none, 0, I_ENCLV },
    TOK t_enclv, TOKEN_INSN, C_none, 0, I_ENCLV

    ; { "hint_nop0", TOKEN_INSN, C_none, 0, I_HINT_NOP0 },
    TOK t_hint_nop0, TOKEN_INSN, C_none, 0, I_HINT_NOP0

    ; { "hint_nop1", TOKEN_INSN, C_none, 0, I_HINT_NOP1 },
    TOK t_hint_nop1, TOKEN_INSN, C_none, 0, I_HINT_NOP1

    ; { "hint_nop2", TOKEN_INSN, C_none, 0, I_HINT_NOP2 },
    TOK t_hint_nop2, TOKEN_INSN, C_none, 0, I_HINT_NOP2

    ; { "hint_nop3", TOKEN_INSN, C_none, 0, I_HINT_NOP3 },
    TOK t_hint_nop3, TOKEN_INSN, C_none, 0, I_HINT_NOP3

    ; { "hint_nop4", TOKEN_INSN, C_none, 0, I_HINT_NOP4 },
    TOK t_hint_nop4, TOKEN_INSN, C_none, 0, I_HINT_NOP4

    ; { "hint_nop5", TOKEN_INSN, C_none, 0, I_HINT_NOP5 },
    TOK t_hint_nop5, TOKEN_INSN, C_none, 0, I_HINT_NOP5

    ; { "hint_nop6", TOKEN_INSN, C_none, 0, I_HINT_NOP6 },
    TOK t_hint_nop6, TOKEN_INSN, C_none, 0, I_HINT_NOP6

    ; { "hint_nop7", TOKEN_INSN, C_none, 0, I_HINT_NOP7 },
    TOK t_hint_nop7, TOKEN_INSN, C_none, 0, I_HINT_NOP7

    ; { "hint_nop8", TOKEN_INSN, C_none, 0, I_HINT_NOP8 },
    TOK t_hint_nop8, TOKEN_INSN, C_none, 0, I_HINT_NOP8

    ; { "hint_nop9", TOKEN_INSN, C_none, 0, I_HINT_NOP9 },
    TOK t_hint_nop9, TOKEN_INSN, C_none, 0, I_HINT_NOP9

    ; { "hint_nop10", TOKEN_INSN, C_none, 0, I_HINT_NOP10 },
    TOK t_hint_nop10, TOKEN_INSN, C_none, 0, I_HINT_NOP10

    ; { "hint_nop11", TOKEN_INSN, C_none, 0, I_HINT_NOP11 },
    TOK t_hint_nop11, TOKEN_INSN, C_none, 0, I_HINT_NOP11

    ; { "hint_nop12", TOKEN_INSN, C_none, 0, I_HINT_NOP12 },
    TOK t_hint_nop12, TOKEN_INSN, C_none, 0, I_HINT_NOP12

    ; { "hint_nop13", TOKEN_INSN, C_none, 0, I_HINT_NOP13 },
    TOK t_hint_nop13, TOKEN_INSN, C_none, 0, I_HINT_NOP13

    ; { "hint_nop14", TOKEN_INSN, C_none, 0, I_HINT_NOP14 },
    TOK t_hint_nop14, TOKEN_INSN, C_none, 0, I_HINT_NOP14

    ; { "hint_nop15", TOKEN_INSN, C_none, 0, I_HINT_NOP15 },
    TOK t_hint_nop15, TOKEN_INSN, C_none, 0, I_HINT_NOP15

    ; { "hint_nop16", TOKEN_INSN, C_none, 0, I_HINT_NOP16 },
    TOK t_hint_nop16, TOKEN_INSN, C_none, 0, I_HINT_NOP16

    ; { "hint_nop17", TOKEN_INSN, C_none, 0, I_HINT_NOP17 },
    TOK t_hint_nop17, TOKEN_INSN, C_none, 0, I_HINT_NOP17

    ; { "hint_nop18", TOKEN_INSN, C_none, 0, I_HINT_NOP18 },
    TOK t_hint_nop18, TOKEN_INSN, C_none, 0, I_HINT_NOP18

    ; { "hint_nop19", TOKEN_INSN, C_none, 0, I_HINT_NOP19 },
    TOK t_hint_nop19, TOKEN_INSN, C_none, 0, I_HINT_NOP19

    ; { "hint_nop20", TOKEN_INSN, C_none, 0, I_HINT_NOP20 },
    TOK t_hint_nop20, TOKEN_INSN, C_none, 0, I_HINT_NOP20

    ; { "hint_nop21", TOKEN_INSN, C_none, 0, I_HINT_NOP21 },
    TOK t_hint_nop21, TOKEN_INSN, C_none, 0, I_HINT_NOP21

    ; { "hint_nop22", TOKEN_INSN, C_none, 0, I_HINT_NOP22 },
    TOK t_hint_nop22, TOKEN_INSN, C_none, 0, I_HINT_NOP22

    ; { "hint_nop23", TOKEN_INSN, C_none, 0, I_HINT_NOP23 },
    TOK t_hint_nop23, TOKEN_INSN, C_none, 0, I_HINT_NOP23

    ; { "hint_nop24", TOKEN_INSN, C_none, 0, I_HINT_NOP24 },
    TOK t_hint_nop24, TOKEN_INSN, C_none, 0, I_HINT_NOP24

    ; { "hint_nop25", TOKEN_INSN, C_none, 0, I_HINT_NOP25 },
    TOK t_hint_nop25, TOKEN_INSN, C_none, 0, I_HINT_NOP25

    ; { "hint_nop26", TOKEN_INSN, C_none, 0, I_HINT_NOP26 },
    TOK t_hint_nop26, TOKEN_INSN, C_none, 0, I_HINT_NOP26

    ; { "hint_nop27", TOKEN_INSN, C_none, 0, I_HINT_NOP27 },
    TOK t_hint_nop27, TOKEN_INSN, C_none, 0, I_HINT_NOP27

    ; { "hint_nop28", TOKEN_INSN, C_none, 0, I_HINT_NOP28 },
    TOK t_hint_nop28, TOKEN_INSN, C_none, 0, I_HINT_NOP28

    ; { "hint_nop29", TOKEN_INSN, C_none, 0, I_HINT_NOP29 },
    TOK t_hint_nop29, TOKEN_INSN, C_none, 0, I_HINT_NOP29

    ; { "hint_nop30", TOKEN_INSN, C_none, 0, I_HINT_NOP30 },
    TOK t_hint_nop30, TOKEN_INSN, C_none, 0, I_HINT_NOP30

    ; { "hint_nop31", TOKEN_INSN, C_none, 0, I_HINT_NOP31 },
    TOK t_hint_nop31, TOKEN_INSN, C_none, 0, I_HINT_NOP31

    ; { "hint_nop32", TOKEN_INSN, C_none, 0, I_HINT_NOP32 },
    TOK t_hint_nop32, TOKEN_INSN, C_none, 0, I_HINT_NOP32

    ; { "hint_nop33", TOKEN_INSN, C_none, 0, I_HINT_NOP33 },
    TOK t_hint_nop33, TOKEN_INSN, C_none, 0, I_HINT_NOP33

    ; { "hint_nop34", TOKEN_INSN, C_none, 0, I_HINT_NOP34 },
    TOK t_hint_nop34, TOKEN_INSN, C_none, 0, I_HINT_NOP34

    ; { "hint_nop35", TOKEN_INSN, C_none, 0, I_HINT_NOP35 },
    TOK t_hint_nop35, TOKEN_INSN, C_none, 0, I_HINT_NOP35

    ; { "hint_nop36", TOKEN_INSN, C_none, 0, I_HINT_NOP36 },
    TOK t_hint_nop36, TOKEN_INSN, C_none, 0, I_HINT_NOP36

    ; { "hint_nop37", TOKEN_INSN, C_none, 0, I_HINT_NOP37 },
    TOK t_hint_nop37, TOKEN_INSN, C_none, 0, I_HINT_NOP37

    ; { "hint_nop38", TOKEN_INSN, C_none, 0, I_HINT_NOP38 },
    TOK t_hint_nop38, TOKEN_INSN, C_none, 0, I_HINT_NOP38

    ; { "hint_nop39", TOKEN_INSN, C_none, 0, I_HINT_NOP39 },
    TOK t_hint_nop39, TOKEN_INSN, C_none, 0, I_HINT_NOP39

    ; { "hint_nop40", TOKEN_INSN, C_none, 0, I_HINT_NOP40 },
    TOK t_hint_nop40, TOKEN_INSN, C_none, 0, I_HINT_NOP40

    ; { "hint_nop41", TOKEN_INSN, C_none, 0, I_HINT_NOP41 },
    TOK t_hint_nop41, TOKEN_INSN, C_none, 0, I_HINT_NOP41

    ; { "hint_nop42", TOKEN_INSN, C_none, 0, I_HINT_NOP42 },
    TOK t_hint_nop42, TOKEN_INSN, C_none, 0, I_HINT_NOP42

    ; { "hint_nop43", TOKEN_INSN, C_none, 0, I_HINT_NOP43 },
    TOK t_hint_nop43, TOKEN_INSN, C_none, 0, I_HINT_NOP43

    ; { "hint_nop44", TOKEN_INSN, C_none, 0, I_HINT_NOP44 },
    TOK t_hint_nop44, TOKEN_INSN, C_none, 0, I_HINT_NOP44

    ; { "hint_nop45", TOKEN_INSN, C_none, 0, I_HINT_NOP45 },
    TOK t_hint_nop45, TOKEN_INSN, C_none, 0, I_HINT_NOP45

    ; { "hint_nop46", TOKEN_INSN, C_none, 0, I_HINT_NOP46 },
    TOK t_hint_nop46, TOKEN_INSN, C_none, 0, I_HINT_NOP46

    ; { "hint_nop47", TOKEN_INSN, C_none, 0, I_HINT_NOP47 },
    TOK t_hint_nop47, TOKEN_INSN, C_none, 0, I_HINT_NOP47

    ; { "hint_nop48", TOKEN_INSN, C_none, 0, I_HINT_NOP48 },
    TOK t_hint_nop48, TOKEN_INSN, C_none, 0, I_HINT_NOP48

    ; { "hint_nop49", TOKEN_INSN, C_none, 0, I_HINT_NOP49 },
    TOK t_hint_nop49, TOKEN_INSN, C_none, 0, I_HINT_NOP49

    ; { "hint_nop50", TOKEN_INSN, C_none, 0, I_HINT_NOP50 },
    TOK t_hint_nop50, TOKEN_INSN, C_none, 0, I_HINT_NOP50

    ; { "hint_nop51", TOKEN_INSN, C_none, 0, I_HINT_NOP51 },
    TOK t_hint_nop51, TOKEN_INSN, C_none, 0, I_HINT_NOP51

    ; { "hint_nop52", TOKEN_INSN, C_none, 0, I_HINT_NOP52 },
    TOK t_hint_nop52, TOKEN_INSN, C_none, 0, I_HINT_NOP52

    ; { "hint_nop53", TOKEN_INSN, C_none, 0, I_HINT_NOP53 },
    TOK t_hint_nop53, TOKEN_INSN, C_none, 0, I_HINT_NOP53

    ; { "hint_nop54", TOKEN_INSN, C_none, 0, I_HINT_NOP54 },
    TOK t_hint_nop54, TOKEN_INSN, C_none, 0, I_HINT_NOP54

    ; { "hint_nop55", TOKEN_INSN, C_none, 0, I_HINT_NOP55 },
    TOK t_hint_nop55, TOKEN_INSN, C_none, 0, I_HINT_NOP55

    ; { "hint_nop56", TOKEN_INSN, C_none, 0, I_HINT_NOP56 },
    TOK t_hint_nop56, TOKEN_INSN, C_none, 0, I_HINT_NOP56

    ; { "hint_nop57", TOKEN_INSN, C_none, 0, I_HINT_NOP57 },
    TOK t_hint_nop57, TOKEN_INSN, C_none, 0, I_HINT_NOP57

    ; { "hint_nop58", TOKEN_INSN, C_none, 0, I_HINT_NOP58 },
    TOK t_hint_nop58, TOKEN_INSN, C_none, 0, I_HINT_NOP58

    ; { "hint_nop59", TOKEN_INSN, C_none, 0, I_HINT_NOP59 },
    TOK t_hint_nop59, TOKEN_INSN, C_none, 0, I_HINT_NOP59

    ; { "hint_nop60", TOKEN_INSN, C_none, 0, I_HINT_NOP60 },
    TOK t_hint_nop60, TOKEN_INSN, C_none, 0, I_HINT_NOP60

    ; { "hint_nop61", TOKEN_INSN, C_none, 0, I_HINT_NOP61 },
    TOK t_hint_nop61, TOKEN_INSN, C_none, 0, I_HINT_NOP61

    ; { "hint_nop62", TOKEN_INSN, C_none, 0, I_HINT_NOP62 },
    TOK t_hint_nop62, TOKEN_INSN, C_none, 0, I_HINT_NOP62

    ; { "hint_nop63", TOKEN_INSN, C_none, 0, I_HINT_NOP63 },
    TOK t_hint_nop63, TOKEN_INSN, C_none, 0, I_HINT_NOP63

    ; { "al", TOKEN_REG, 0, 0, R_AL },
    TOK t_al, TOKEN_REG, 0, 0, R_AL

    ; { "ah", TOKEN_REG, 0, 0, R_AH },
    TOK t_ah, TOKEN_REG, 0, 0, R_AH

    ; { "ax", TOKEN_REG, 0, 0, R_AX },
    TOK t_ax, TOKEN_REG, 0, 0, R_AX

    ; { "eax", TOKEN_REG, 0, 0, R_EAX },
    TOK t_eax, TOKEN_REG, 0, 0, R_EAX

    ; { "rax", TOKEN_REG, 0, 0, R_RAX },
    TOK t_rax, TOKEN_REG, 0, 0, R_RAX

    ; { "bl", TOKEN_REG, 0, 0, R_BL },
    TOK t_bl, TOKEN_REG, 0, 0, R_BL

    ; { "bh", TOKEN_REG, 0, 0, R_BH },
    TOK t_bh, TOKEN_REG, 0, 0, R_BH

    ; { "bx", TOKEN_REG, 0, 0, R_BX },
    TOK t_bx, TOKEN_REG, 0, 0, R_BX

    ; { "ebx", TOKEN_REG, 0, 0, R_EBX },
    TOK t_ebx, TOKEN_REG, 0, 0, R_EBX

    ; { "rbx", TOKEN_REG, 0, 0, R_RBX },
    TOK t_rbx, TOKEN_REG, 0, 0, R_RBX

    ; { "cl", TOKEN_REG, 0, 0, R_CL },
    TOK t_cl, TOKEN_REG, 0, 0, R_CL

    ; { "ch", TOKEN_REG, 0, 0, R_CH },
    TOK t_ch, TOKEN_REG, 0, 0, R_CH

    ; { "cx", TOKEN_REG, 0, 0, R_CX },
    TOK t_cx, TOKEN_REG, 0, 0, R_CX

    ; { "ecx", TOKEN_REG, 0, 0, R_ECX },
    TOK t_ecx, TOKEN_REG, 0, 0, R_ECX

    ; { "rcx", TOKEN_REG, 0, 0, R_RCX },
    TOK t_rcx, TOKEN_REG, 0, 0, R_RCX

    ; { "dl", TOKEN_REG, 0, 0, R_DL },
    TOK t_dl, TOKEN_REG, 0, 0, R_DL

    ; { "dh", TOKEN_REG, 0, 0, R_DH },
    TOK t_dh, TOKEN_REG, 0, 0, R_DH

    ; { "dx", TOKEN_REG, 0, 0, R_DX },
    TOK t_dx, TOKEN_REG, 0, 0, R_DX

    ; { "edx", TOKEN_REG, 0, 0, R_EDX },
    TOK t_edx, TOKEN_REG, 0, 0, R_EDX

    ; { "rdx", TOKEN_REG, 0, 0, R_RDX },
    TOK t_rdx, TOKEN_REG, 0, 0, R_RDX

    ; { "spl", TOKEN_REG, 0, 0, R_SPL },
    TOK t_spl, TOKEN_REG, 0, 0, R_SPL

    ; { "sp", TOKEN_REG, 0, 0, R_SP },
    TOK t_sp, TOKEN_REG, 0, 0, R_SP

    ; { "esp", TOKEN_REG, 0, 0, R_ESP },
    TOK t_esp, TOKEN_REG, 0, 0, R_ESP

    ; { "rsp", TOKEN_REG, 0, 0, R_RSP },
    TOK t_rsp, TOKEN_REG, 0, 0, R_RSP

    ; { "bpl", TOKEN_REG, 0, 0, R_BPL },
    TOK t_bpl, TOKEN_REG, 0, 0, R_BPL

    ; { "bp", TOKEN_REG, 0, 0, R_BP },
    TOK t_bp, TOKEN_REG, 0, 0, R_BP

    ; { "ebp", TOKEN_REG, 0, 0, R_EBP },
    TOK t_ebp, TOKEN_REG, 0, 0, R_EBP

    ; { "rbp", TOKEN_REG, 0, 0, R_RBP },
    TOK t_rbp, TOKEN_REG, 0, 0, R_RBP

    ; { "sil", TOKEN_REG, 0, 0, R_SIL },
    TOK t_sil, TOKEN_REG, 0, 0, R_SIL

    ; { "si", TOKEN_REG, 0, 0, R_SI },
    TOK t_si, TOKEN_REG, 0, 0, R_SI

    ; { "esi", TOKEN_REG, 0, 0, R_ESI },
    TOK t_esi, TOKEN_REG, 0, 0, R_ESI

    ; { "rsi", TOKEN_REG, 0, 0, R_RSI },
    TOK t_rsi, TOKEN_REG, 0, 0, R_RSI

    ; { "dil", TOKEN_REG, 0, 0, R_DIL },
    TOK t_dil, TOKEN_REG, 0, 0, R_DIL

    ; { "di", TOKEN_REG, 0, 0, R_DI },
    TOK t_di, TOKEN_REG, 0, 0, R_DI

    ; { "edi", TOKEN_REG, 0, 0, R_EDI },
    TOK t_edi, TOKEN_REG, 0, 0, R_EDI

    ; { "rdi", TOKEN_REG, 0, 0, R_RDI },
    TOK t_rdi, TOKEN_REG, 0, 0, R_RDI

    ; { "r8b", TOKEN_REG, 0, 0, R_R8B },
    TOK t_r8b, TOKEN_REG, 0, 0, R_R8B

    ; { "r9b", TOKEN_REG, 0, 0, R_R9B },
    TOK t_r9b, TOKEN_REG, 0, 0, R_R9B

    ; { "r10b", TOKEN_REG, 0, 0, R_R10B },
    TOK t_r10b, TOKEN_REG, 0, 0, R_R10B

    ; { "r11b", TOKEN_REG, 0, 0, R_R11B },
    TOK t_r11b, TOKEN_REG, 0, 0, R_R11B

    ; { "r12b", TOKEN_REG, 0, 0, R_R12B },
    TOK t_r12b, TOKEN_REG, 0, 0, R_R12B

    ; { "r13b", TOKEN_REG, 0, 0, R_R13B },
    TOK t_r13b, TOKEN_REG, 0, 0, R_R13B

    ; { "r14b", TOKEN_REG, 0, 0, R_R14B },
    TOK t_r14b, TOKEN_REG, 0, 0, R_R14B

    ; { "r15b", TOKEN_REG, 0, 0, R_R15B },
    TOK t_r15b, TOKEN_REG, 0, 0, R_R15B

    ; { "r8w", TOKEN_REG, 0, 0, R_R8W },
    TOK t_r8w, TOKEN_REG, 0, 0, R_R8W

    ; { "r9w", TOKEN_REG, 0, 0, R_R9W },
    TOK t_r9w, TOKEN_REG, 0, 0, R_R9W

    ; { "r10w", TOKEN_REG, 0, 0, R_R10W },
    TOK t_r10w, TOKEN_REG, 0, 0, R_R10W

    ; { "r11w", TOKEN_REG, 0, 0, R_R11W },
    TOK t_r11w, TOKEN_REG, 0, 0, R_R11W

    ; { "r12w", TOKEN_REG, 0, 0, R_R12W },
    TOK t_r12w, TOKEN_REG, 0, 0, R_R12W

    ; { "r13w", TOKEN_REG, 0, 0, R_R13W },
    TOK t_r13w, TOKEN_REG, 0, 0, R_R13W

    ; { "r14w", TOKEN_REG, 0, 0, R_R14W },
    TOK t_r14w, TOKEN_REG, 0, 0, R_R14W

    ; { "r15w", TOKEN_REG, 0, 0, R_R15W },
    TOK t_r15w, TOKEN_REG, 0, 0, R_R15W

    ; { "r8d", TOKEN_REG, 0, 0, R_R8D },
    TOK t_r8d, TOKEN_REG, 0, 0, R_R8D

    ; { "r9d", TOKEN_REG, 0, 0, R_R9D },
    TOK t_r9d, TOKEN_REG, 0, 0, R_R9D

    ; { "r10d", TOKEN_REG, 0, 0, R_R10D },
    TOK t_r10d, TOKEN_REG, 0, 0, R_R10D

    ; { "r11d", TOKEN_REG, 0, 0, R_R11D },
    TOK t_r11d, TOKEN_REG, 0, 0, R_R11D

    ; { "r12d", TOKEN_REG, 0, 0, R_R12D },
    TOK t_r12d, TOKEN_REG, 0, 0, R_R12D

    ; { "r13d", TOKEN_REG, 0, 0, R_R13D },
    TOK t_r13d, TOKEN_REG, 0, 0, R_R13D

    ; { "r14d", TOKEN_REG, 0, 0, R_R14D },
    TOK t_r14d, TOKEN_REG, 0, 0, R_R14D

    ; { "r15d", TOKEN_REG, 0, 0, R_R15D },
    TOK t_r15d, TOKEN_REG, 0, 0, R_R15D

    ; { "r8", TOKEN_REG, 0, 0, R_R8 },
    TOK t_r8, TOKEN_REG, 0, 0, R_R8

    ; { "r9", TOKEN_REG, 0, 0, R_R9 },
    TOK t_r9, TOKEN_REG, 0, 0, R_R9

    ; { "r10", TOKEN_REG, 0, 0, R_R10 },
    TOK t_r10, TOKEN_REG, 0, 0, R_R10

    ; { "r11", TOKEN_REG, 0, 0, R_R11 },
    TOK t_r11, TOKEN_REG, 0, 0, R_R11

    ; { "r12", TOKEN_REG, 0, 0, R_R12 },
    TOK t_r12, TOKEN_REG, 0, 0, R_R12

    ; { "r13", TOKEN_REG, 0, 0, R_R13 },
    TOK t_r13, TOKEN_REG, 0, 0, R_R13

    ; { "r14", TOKEN_REG, 0, 0, R_R14 },
    TOK t_r14, TOKEN_REG, 0, 0, R_R14

    ; { "r15", TOKEN_REG, 0, 0, R_R15 },
    TOK t_r15, TOKEN_REG, 0, 0, R_R15

    ; { "es", TOKEN_REG, 0, 0, R_ES },
    TOK t_es, TOKEN_REG, 0, 0, R_ES

    ; { "cs", TOKEN_REG, 0, 0, R_CS },
    TOK t_cs, TOKEN_REG, 0, 0, R_CS

    ; { "ss", TOKEN_REG, 0, 0, R_SS },
    TOK t_ss, TOKEN_REG, 0, 0, R_SS

    ; { "ds", TOKEN_REG, 0, 0, R_DS },
    TOK t_ds, TOKEN_REG, 0, 0, R_DS

    ; { "fs", TOKEN_REG, 0, 0, R_FS },
    TOK t_fs, TOKEN_REG, 0, 0, R_FS

    ; { "gs", TOKEN_REG, 0, 0, R_GS },
    TOK t_gs, TOKEN_REG, 0, 0, R_GS

    ; { "segr6", TOKEN_REG, 0, 0, R_SEGR6 },
    TOK t_segr6, TOKEN_REG, 0, 0, R_SEGR6

    ; { "segr7", TOKEN_REG, 0, 0, R_SEGR7 },
    TOK t_segr7, TOKEN_REG, 0, 0, R_SEGR7

    ; { "cr0", TOKEN_REG, 0, 0, R_CR0 },
    TOK t_cr0, TOKEN_REG, 0, 0, R_CR0

    ; { "cr1", TOKEN_REG, 0, 0, R_CR1 },
    TOK t_cr1, TOKEN_REG, 0, 0, R_CR1

    ; { "cr2", TOKEN_REG, 0, 0, R_CR2 },
    TOK t_cr2, TOKEN_REG, 0, 0, R_CR2

    ; { "cr3", TOKEN_REG, 0, 0, R_CR3 },
    TOK t_cr3, TOKEN_REG, 0, 0, R_CR3

    ; { "cr4", TOKEN_REG, 0, 0, R_CR4 },
    TOK t_cr4, TOKEN_REG, 0, 0, R_CR4

    ; { "cr5", TOKEN_REG, 0, 0, R_CR5 },
    TOK t_cr5, TOKEN_REG, 0, 0, R_CR5

    ; { "cr6", TOKEN_REG, 0, 0, R_CR6 },
    TOK t_cr6, TOKEN_REG, 0, 0, R_CR6

    ; { "cr7", TOKEN_REG, 0, 0, R_CR7 },
    TOK t_cr7, TOKEN_REG, 0, 0, R_CR7

    ; { "cr8", TOKEN_REG, 0, 0, R_CR8 },
    TOK t_cr8, TOKEN_REG, 0, 0, R_CR8

    ; { "cr9", TOKEN_REG, 0, 0, R_CR9 },
    TOK t_cr9, TOKEN_REG, 0, 0, R_CR9

    ; { "cr10", TOKEN_REG, 0, 0, R_CR10 },
    TOK t_cr10, TOKEN_REG, 0, 0, R_CR10

    ; { "cr11", TOKEN_REG, 0, 0, R_CR11 },
    TOK t_cr11, TOKEN_REG, 0, 0, R_CR11

    ; { "cr12", TOKEN_REG, 0, 0, R_CR12 },
    TOK t_cr12, TOKEN_REG, 0, 0, R_CR12

    ; { "cr13", TOKEN_REG, 0, 0, R_CR13 },
    TOK t_cr13, TOKEN_REG, 0, 0, R_CR13

    ; { "cr14", TOKEN_REG, 0, 0, R_CR14 },
    TOK t_cr14, TOKEN_REG, 0, 0, R_CR14

    ; { "cr15", TOKEN_REG, 0, 0, R_CR15 },
    TOK t_cr15, TOKEN_REG, 0, 0, R_CR15

    ; { "dr0", TOKEN_REG, 0, 0, R_DR0 },
    TOK t_dr0, TOKEN_REG, 0, 0, R_DR0

    ; { "dr1", TOKEN_REG, 0, 0, R_DR1 },
    TOK t_dr1, TOKEN_REG, 0, 0, R_DR1

    ; { "dr2", TOKEN_REG, 0, 0, R_DR2 },
    TOK t_dr2, TOKEN_REG, 0, 0, R_DR2

    ; { "dr3", TOKEN_REG, 0, 0, R_DR3 },
    TOK t_dr3, TOKEN_REG, 0, 0, R_DR3

    ; { "dr4", TOKEN_REG, 0, 0, R_DR4 },
    TOK t_dr4, TOKEN_REG, 0, 0, R_DR4

    ; { "dr5", TOKEN_REG, 0, 0, R_DR5 },
    TOK t_dr5, TOKEN_REG, 0, 0, R_DR5

    ; { "dr6", TOKEN_REG, 0, 0, R_DR6 },
    TOK t_dr6, TOKEN_REG, 0, 0, R_DR6

    ; { "dr7", TOKEN_REG, 0, 0, R_DR7 },
    TOK t_dr7, TOKEN_REG, 0, 0, R_DR7

    ; { "dr8", TOKEN_REG, 0, 0, R_DR8 },
    TOK t_dr8, TOKEN_REG, 0, 0, R_DR8

    ; { "dr9", TOKEN_REG, 0, 0, R_DR9 },
    TOK t_dr9, TOKEN_REG, 0, 0, R_DR9

    ; { "dr10", TOKEN_REG, 0, 0, R_DR10 },
    TOK t_dr10, TOKEN_REG, 0, 0, R_DR10

    ; { "dr11", TOKEN_REG, 0, 0, R_DR11 },
    TOK t_dr11, TOKEN_REG, 0, 0, R_DR11

    ; { "dr12", TOKEN_REG, 0, 0, R_DR12 },
    TOK t_dr12, TOKEN_REG, 0, 0, R_DR12

    ; { "dr13", TOKEN_REG, 0, 0, R_DR13 },
    TOK t_dr13, TOKEN_REG, 0, 0, R_DR13

    ; { "dr14", TOKEN_REG, 0, 0, R_DR14 },
    TOK t_dr14, TOKEN_REG, 0, 0, R_DR14

    ; { "dr15", TOKEN_REG, 0, 0, R_DR15 },
    TOK t_dr15, TOKEN_REG, 0, 0, R_DR15

    ; { "tr0", TOKEN_REG, 0, 0, R_TR0 },
    TOK t_tr0, TOKEN_REG, 0, 0, R_TR0

    ; { "tr1", TOKEN_REG, 0, 0, R_TR1 },
    TOK t_tr1, TOKEN_REG, 0, 0, R_TR1

    ; { "tr2", TOKEN_REG, 0, 0, R_TR2 },
    TOK t_tr2, TOKEN_REG, 0, 0, R_TR2

    ; { "tr3", TOKEN_REG, 0, 0, R_TR3 },
    TOK t_tr3, TOKEN_REG, 0, 0, R_TR3

    ; { "tr4", TOKEN_REG, 0, 0, R_TR4 },
    TOK t_tr4, TOKEN_REG, 0, 0, R_TR4

    ; { "tr5", TOKEN_REG, 0, 0, R_TR5 },
    TOK t_tr5, TOKEN_REG, 0, 0, R_TR5

    ; { "tr6", TOKEN_REG, 0, 0, R_TR6 },
    TOK t_tr6, TOKEN_REG, 0, 0, R_TR6

    ; { "tr7", TOKEN_REG, 0, 0, R_TR7 },
    TOK t_tr7, TOKEN_REG, 0, 0, R_TR7

    ; { "st0", TOKEN_REG, 0, 0, R_ST0 },
    TOK t_st0, TOKEN_REG, 0, 0, R_ST0

    ; { "st1", TOKEN_REG, 0, 0, R_ST1 },
    TOK t_st1, TOKEN_REG, 0, 0, R_ST1

    ; { "st2", TOKEN_REG, 0, 0, R_ST2 },
    TOK t_st2, TOKEN_REG, 0, 0, R_ST2

    ; { "st3", TOKEN_REG, 0, 0, R_ST3 },
    TOK t_st3, TOKEN_REG, 0, 0, R_ST3

    ; { "st4", TOKEN_REG, 0, 0, R_ST4 },
    TOK t_st4, TOKEN_REG, 0, 0, R_ST4

    ; { "st5", TOKEN_REG, 0, 0, R_ST5 },
    TOK t_st5, TOKEN_REG, 0, 0, R_ST5

    ; { "st6", TOKEN_REG, 0, 0, R_ST6 },
    TOK t_st6, TOKEN_REG, 0, 0, R_ST6

    ; { "st7", TOKEN_REG, 0, 0, R_ST7 },
    TOK t_st7, TOKEN_REG, 0, 0, R_ST7

    ; { "mm0", TOKEN_REG, 0, 0, R_MM0 },
    TOK t_mm0, TOKEN_REG, 0, 0, R_MM0

    ; { "mm1", TOKEN_REG, 0, 0, R_MM1 },
    TOK t_mm1, TOKEN_REG, 0, 0, R_MM1

    ; { "mm2", TOKEN_REG, 0, 0, R_MM2 },
    TOK t_mm2, TOKEN_REG, 0, 0, R_MM2

    ; { "mm3", TOKEN_REG, 0, 0, R_MM3 },
    TOK t_mm3, TOKEN_REG, 0, 0, R_MM3

    ; { "mm4", TOKEN_REG, 0, 0, R_MM4 },
    TOK t_mm4, TOKEN_REG, 0, 0, R_MM4

    ; { "mm5", TOKEN_REG, 0, 0, R_MM5 },
    TOK t_mm5, TOKEN_REG, 0, 0, R_MM5

    ; { "mm6", TOKEN_REG, 0, 0, R_MM6 },
    TOK t_mm6, TOKEN_REG, 0, 0, R_MM6

    ; { "mm7", TOKEN_REG, 0, 0, R_MM7 },
    TOK t_mm7, TOKEN_REG, 0, 0, R_MM7

    ; { "xmm0", TOKEN_REG, 0, 0, R_XMM0 },
    TOK t_xmm0, TOKEN_REG, 0, 0, R_XMM0

    ; { "xmm1", TOKEN_REG, 0, 0, R_XMM1 },
    TOK t_xmm1, TOKEN_REG, 0, 0, R_XMM1

    ; { "xmm2", TOKEN_REG, 0, 0, R_XMM2 },
    TOK t_xmm2, TOKEN_REG, 0, 0, R_XMM2

    ; { "xmm3", TOKEN_REG, 0, 0, R_XMM3 },
    TOK t_xmm3, TOKEN_REG, 0, 0, R_XMM3

    ; { "xmm4", TOKEN_REG, 0, 0, R_XMM4 },
    TOK t_xmm4, TOKEN_REG, 0, 0, R_XMM4

    ; { "xmm5", TOKEN_REG, 0, 0, R_XMM5 },
    TOK t_xmm5, TOKEN_REG, 0, 0, R_XMM5

    ; { "xmm6", TOKEN_REG, 0, 0, R_XMM6 },
    TOK t_xmm6, TOKEN_REG, 0, 0, R_XMM6

    ; { "xmm7", TOKEN_REG, 0, 0, R_XMM7 },
    TOK t_xmm7, TOKEN_REG, 0, 0, R_XMM7

    ; { "xmm8", TOKEN_REG, 0, 0, R_XMM8 },
    TOK t_xmm8, TOKEN_REG, 0, 0, R_XMM8

    ; { "xmm9", TOKEN_REG, 0, 0, R_XMM9 },
    TOK t_xmm9, TOKEN_REG, 0, 0, R_XMM9

    ; { "xmm10", TOKEN_REG, 0, 0, R_XMM10 },
    TOK t_xmm10, TOKEN_REG, 0, 0, R_XMM10

    ; { "xmm11", TOKEN_REG, 0, 0, R_XMM11 },
    TOK t_xmm11, TOKEN_REG, 0, 0, R_XMM11

    ; { "xmm12", TOKEN_REG, 0, 0, R_XMM12 },
    TOK t_xmm12, TOKEN_REG, 0, 0, R_XMM12

    ; { "xmm13", TOKEN_REG, 0, 0, R_XMM13 },
    TOK t_xmm13, TOKEN_REG, 0, 0, R_XMM13

    ; { "xmm14", TOKEN_REG, 0, 0, R_XMM14 },
    TOK t_xmm14, TOKEN_REG, 0, 0, R_XMM14

    ; { "xmm15", TOKEN_REG, 0, 0, R_XMM15 },
    TOK t_xmm15, TOKEN_REG, 0, 0, R_XMM15

    ; { "xmm16", TOKEN_REG, 0, 0, R_XMM16 },
    TOK t_xmm16, TOKEN_REG, 0, 0, R_XMM16

    ; { "xmm17", TOKEN_REG, 0, 0, R_XMM17 },
    TOK t_xmm17, TOKEN_REG, 0, 0, R_XMM17

    ; { "xmm18", TOKEN_REG, 0, 0, R_XMM18 },
    TOK t_xmm18, TOKEN_REG, 0, 0, R_XMM18

    ; { "xmm19", TOKEN_REG, 0, 0, R_XMM19 },
    TOK t_xmm19, TOKEN_REG, 0, 0, R_XMM19

    ; { "xmm20", TOKEN_REG, 0, 0, R_XMM20 },
    TOK t_xmm20, TOKEN_REG, 0, 0, R_XMM20

    ; { "xmm21", TOKEN_REG, 0, 0, R_XMM21 },
    TOK t_xmm21, TOKEN_REG, 0, 0, R_XMM21

    ; { "xmm22", TOKEN_REG, 0, 0, R_XMM22 },
    TOK t_xmm22, TOKEN_REG, 0, 0, R_XMM22

    ; { "xmm23", TOKEN_REG, 0, 0, R_XMM23 },
    TOK t_xmm23, TOKEN_REG, 0, 0, R_XMM23

    ; { "xmm24", TOKEN_REG, 0, 0, R_XMM24 },
    TOK t_xmm24, TOKEN_REG, 0, 0, R_XMM24

    ; { "xmm25", TOKEN_REG, 0, 0, R_XMM25 },
    TOK t_xmm25, TOKEN_REG, 0, 0, R_XMM25

    ; { "xmm26", TOKEN_REG, 0, 0, R_XMM26 },
    TOK t_xmm26, TOKEN_REG, 0, 0, R_XMM26

    ; { "xmm27", TOKEN_REG, 0, 0, R_XMM27 },
    TOK t_xmm27, TOKEN_REG, 0, 0, R_XMM27

    ; { "xmm28", TOKEN_REG, 0, 0, R_XMM28 },
    TOK t_xmm28, TOKEN_REG, 0, 0, R_XMM28

    ; { "xmm29", TOKEN_REG, 0, 0, R_XMM29 },
    TOK t_xmm29, TOKEN_REG, 0, 0, R_XMM29

    ; { "xmm30", TOKEN_REG, 0, 0, R_XMM30 },
    TOK t_xmm30, TOKEN_REG, 0, 0, R_XMM30

    ; { "xmm31", TOKEN_REG, 0, 0, R_XMM31 },
    TOK t_xmm31, TOKEN_REG, 0, 0, R_XMM31

    ; { "ymm0", TOKEN_REG, 0, 0, R_YMM0 },
    TOK t_ymm0, TOKEN_REG, 0, 0, R_YMM0

    ; { "ymm1", TOKEN_REG, 0, 0, R_YMM1 },
    TOK t_ymm1, TOKEN_REG, 0, 0, R_YMM1

    ; { "ymm2", TOKEN_REG, 0, 0, R_YMM2 },
    TOK t_ymm2, TOKEN_REG, 0, 0, R_YMM2

    ; { "ymm3", TOKEN_REG, 0, 0, R_YMM3 },
    TOK t_ymm3, TOKEN_REG, 0, 0, R_YMM3

    ; { "ymm4", TOKEN_REG, 0, 0, R_YMM4 },
    TOK t_ymm4, TOKEN_REG, 0, 0, R_YMM4

    ; { "ymm5", TOKEN_REG, 0, 0, R_YMM5 },
    TOK t_ymm5, TOKEN_REG, 0, 0, R_YMM5

    ; { "ymm6", TOKEN_REG, 0, 0, R_YMM6 },
    TOK t_ymm6, TOKEN_REG, 0, 0, R_YMM6

    ; { "ymm7", TOKEN_REG, 0, 0, R_YMM7 },
    TOK t_ymm7, TOKEN_REG, 0, 0, R_YMM7

    ; { "ymm8", TOKEN_REG, 0, 0, R_YMM8 },
    TOK t_ymm8, TOKEN_REG, 0, 0, R_YMM8

    ; { "ymm9", TOKEN_REG, 0, 0, R_YMM9 },
    TOK t_ymm9, TOKEN_REG, 0, 0, R_YMM9

    ; { "ymm10", TOKEN_REG, 0, 0, R_YMM10 },
    TOK t_ymm10, TOKEN_REG, 0, 0, R_YMM10

    ; { "ymm11", TOKEN_REG, 0, 0, R_YMM11 },
    TOK t_ymm11, TOKEN_REG, 0, 0, R_YMM11

    ; { "ymm12", TOKEN_REG, 0, 0, R_YMM12 },
    TOK t_ymm12, TOKEN_REG, 0, 0, R_YMM12

    ; { "ymm13", TOKEN_REG, 0, 0, R_YMM13 },
    TOK t_ymm13, TOKEN_REG, 0, 0, R_YMM13

    ; { "ymm14", TOKEN_REG, 0, 0, R_YMM14 },
    TOK t_ymm14, TOKEN_REG, 0, 0, R_YMM14

    ; { "ymm15", TOKEN_REG, 0, 0, R_YMM15 },
    TOK t_ymm15, TOKEN_REG, 0, 0, R_YMM15

    ; { "ymm16", TOKEN_REG, 0, 0, R_YMM16 },
    TOK t_ymm16, TOKEN_REG, 0, 0, R_YMM16

    ; { "ymm17", TOKEN_REG, 0, 0, R_YMM17 },
    TOK t_ymm17, TOKEN_REG, 0, 0, R_YMM17

    ; { "ymm18", TOKEN_REG, 0, 0, R_YMM18 },
    TOK t_ymm18, TOKEN_REG, 0, 0, R_YMM18

    ; { "ymm19", TOKEN_REG, 0, 0, R_YMM19 },
    TOK t_ymm19, TOKEN_REG, 0, 0, R_YMM19

    ; { "ymm20", TOKEN_REG, 0, 0, R_YMM20 },
    TOK t_ymm20, TOKEN_REG, 0, 0, R_YMM20

    ; { "ymm21", TOKEN_REG, 0, 0, R_YMM21 },
    TOK t_ymm21, TOKEN_REG, 0, 0, R_YMM21

    ; { "ymm22", TOKEN_REG, 0, 0, R_YMM22 },
    TOK t_ymm22, TOKEN_REG, 0, 0, R_YMM22

    ; { "ymm23", TOKEN_REG, 0, 0, R_YMM23 },
    TOK t_ymm23, TOKEN_REG, 0, 0, R_YMM23

    ; { "ymm24", TOKEN_REG, 0, 0, R_YMM24 },
    TOK t_ymm24, TOKEN_REG, 0, 0, R_YMM24

    ; { "ymm25", TOKEN_REG, 0, 0, R_YMM25 },
    TOK t_ymm25, TOKEN_REG, 0, 0, R_YMM25

    ; { "ymm26", TOKEN_REG, 0, 0, R_YMM26 },
    TOK t_ymm26, TOKEN_REG, 0, 0, R_YMM26

    ; { "ymm27", TOKEN_REG, 0, 0, R_YMM27 },
    TOK t_ymm27, TOKEN_REG, 0, 0, R_YMM27

    ; { "ymm28", TOKEN_REG, 0, 0, R_YMM28 },
    TOK t_ymm28, TOKEN_REG, 0, 0, R_YMM28

    ; { "ymm29", TOKEN_REG, 0, 0, R_YMM29 },
    TOK t_ymm29, TOKEN_REG, 0, 0, R_YMM29

    ; { "ymm30", TOKEN_REG, 0, 0, R_YMM30 },
    TOK t_ymm30, TOKEN_REG, 0, 0, R_YMM30

    ; { "ymm31", TOKEN_REG, 0, 0, R_YMM31 },
    TOK t_ymm31, TOKEN_REG, 0, 0, R_YMM31

    ; { "zmm0", TOKEN_REG, 0, 0, R_ZMM0 },
    TOK t_zmm0, TOKEN_REG, 0, 0, R_ZMM0

    ; { "zmm1", TOKEN_REG, 0, 0, R_ZMM1 },
    TOK t_zmm1, TOKEN_REG, 0, 0, R_ZMM1

    ; { "zmm2", TOKEN_REG, 0, 0, R_ZMM2 },
    TOK t_zmm2, TOKEN_REG, 0, 0, R_ZMM2

    ; { "zmm3", TOKEN_REG, 0, 0, R_ZMM3 },
    TOK t_zmm3, TOKEN_REG, 0, 0, R_ZMM3

    ; { "zmm4", TOKEN_REG, 0, 0, R_ZMM4 },
    TOK t_zmm4, TOKEN_REG, 0, 0, R_ZMM4

    ; { "zmm5", TOKEN_REG, 0, 0, R_ZMM5 },
    TOK t_zmm5, TOKEN_REG, 0, 0, R_ZMM5

    ; { "zmm6", TOKEN_REG, 0, 0, R_ZMM6 },
    TOK t_zmm6, TOKEN_REG, 0, 0, R_ZMM6

    ; { "zmm7", TOKEN_REG, 0, 0, R_ZMM7 },
    TOK t_zmm7, TOKEN_REG, 0, 0, R_ZMM7

    ; { "zmm8", TOKEN_REG, 0, 0, R_ZMM8 },
    TOK t_zmm8, TOKEN_REG, 0, 0, R_ZMM8

    ; { "zmm9", TOKEN_REG, 0, 0, R_ZMM9 },
    TOK t_zmm9, TOKEN_REG, 0, 0, R_ZMM9

    ; { "zmm10", TOKEN_REG, 0, 0, R_ZMM10 },
    TOK t_zmm10, TOKEN_REG, 0, 0, R_ZMM10

    ; { "zmm11", TOKEN_REG, 0, 0, R_ZMM11 },
    TOK t_zmm11, TOKEN_REG, 0, 0, R_ZMM11

    ; { "zmm12", TOKEN_REG, 0, 0, R_ZMM12 },
    TOK t_zmm12, TOKEN_REG, 0, 0, R_ZMM12

    ; { "zmm13", TOKEN_REG, 0, 0, R_ZMM13 },
    TOK t_zmm13, TOKEN_REG, 0, 0, R_ZMM13

    ; { "zmm14", TOKEN_REG, 0, 0, R_ZMM14 },
    TOK t_zmm14, TOKEN_REG, 0, 0, R_ZMM14

    ; { "zmm15", TOKEN_REG, 0, 0, R_ZMM15 },
    TOK t_zmm15, TOKEN_REG, 0, 0, R_ZMM15

    ; { "zmm16", TOKEN_REG, 0, 0, R_ZMM16 },
    TOK t_zmm16, TOKEN_REG, 0, 0, R_ZMM16

    ; { "zmm17", TOKEN_REG, 0, 0, R_ZMM17 },
    TOK t_zmm17, TOKEN_REG, 0, 0, R_ZMM17

    ; { "zmm18", TOKEN_REG, 0, 0, R_ZMM18 },
    TOK t_zmm18, TOKEN_REG, 0, 0, R_ZMM18

    ; { "zmm19", TOKEN_REG, 0, 0, R_ZMM19 },
    TOK t_zmm19, TOKEN_REG, 0, 0, R_ZMM19

    ; { "zmm20", TOKEN_REG, 0, 0, R_ZMM20 },
    TOK t_zmm20, TOKEN_REG, 0, 0, R_ZMM20

    ; { "zmm21", TOKEN_REG, 0, 0, R_ZMM21 },
    TOK t_zmm21, TOKEN_REG, 0, 0, R_ZMM21

    ; { "zmm22", TOKEN_REG, 0, 0, R_ZMM22 },
    TOK t_zmm22, TOKEN_REG, 0, 0, R_ZMM22

    ; { "zmm23", TOKEN_REG, 0, 0, R_ZMM23 },
    TOK t_zmm23, TOKEN_REG, 0, 0, R_ZMM23

    ; { "zmm24", TOKEN_REG, 0, 0, R_ZMM24 },
    TOK t_zmm24, TOKEN_REG, 0, 0, R_ZMM24

    ; { "zmm25", TOKEN_REG, 0, 0, R_ZMM25 },
    TOK t_zmm25, TOKEN_REG, 0, 0, R_ZMM25

    ; { "zmm26", TOKEN_REG, 0, 0, R_ZMM26 },
    TOK t_zmm26, TOKEN_REG, 0, 0, R_ZMM26

    ; { "zmm27", TOKEN_REG, 0, 0, R_ZMM27 },
    TOK t_zmm27, TOKEN_REG, 0, 0, R_ZMM27

    ; { "zmm28", TOKEN_REG, 0, 0, R_ZMM28 },
    TOK t_zmm28, TOKEN_REG, 0, 0, R_ZMM28

    ; { "zmm29", TOKEN_REG, 0, 0, R_ZMM29 },
    TOK t_zmm29, TOKEN_REG, 0, 0, R_ZMM29

    ; { "zmm30", TOKEN_REG, 0, 0, R_ZMM30 },
    TOK t_zmm30, TOKEN_REG, 0, 0, R_ZMM30

    ; { "zmm31", TOKEN_REG, 0, 0, R_ZMM31 },
    TOK t_zmm31, TOKEN_REG, 0, 0, R_ZMM31

    ; { "k0", TOKEN_REG, 0, 0, R_K0 },
    TOK t_k0, TOKEN_REG, 0, 0, R_K0

    ; { "k1", TOKEN_REG, 0, TFLAG_BRC_OPT, R_K1 },
    TOK t_k1, TOKEN_REG, 0, TFLAG_BRC_OPT, R_K1

    ; { "k2", TOKEN_REG, 0, TFLAG_BRC_OPT, R_K2 },
    TOK t_k2, TOKEN_REG, 0, TFLAG_BRC_OPT, R_K2

    ; { "k3", TOKEN_REG, 0, TFLAG_BRC_OPT, R_K3 },
    TOK t_k3, TOKEN_REG, 0, TFLAG_BRC_OPT, R_K3

    ; { "k4", TOKEN_REG, 0, TFLAG_BRC_OPT, R_K4 },
    TOK t_k4, TOKEN_REG, 0, TFLAG_BRC_OPT, R_K4

    ; { "k5", TOKEN_REG, 0, TFLAG_BRC_OPT, R_K5 },
    TOK t_k5, TOKEN_REG, 0, TFLAG_BRC_OPT, R_K5

    ; { "k6", TOKEN_REG, 0, TFLAG_BRC_OPT, R_K6 },
    TOK t_k6, TOKEN_REG, 0, TFLAG_BRC_OPT, R_K6

    ; { "k7", TOKEN_REG, 0, TFLAG_BRC_OPT, R_K7 },
    TOK t_k7, TOKEN_REG, 0, TFLAG_BRC_OPT, R_K7

    ; { "bnd0", TOKEN_REG, 0, 0, R_BND0 },
    TOK t_bnd0, TOKEN_REG, 0, 0, R_BND0

    ; { "bnd1", TOKEN_REG, 0, 0, R_BND1 },
    TOK t_bnd1, TOKEN_REG, 0, 0, R_BND1

    ; { "bnd2", TOKEN_REG, 0, 0, R_BND2 },
    TOK t_bnd2, TOKEN_REG, 0, 0, R_BND2

    ; { "bnd3", TOKEN_REG, 0, 0, R_BND3 },
    TOK t_bnd3, TOKEN_REG, 0, 0, R_BND3

    ; { "a16", TOKEN_PREFIX, 0, 0, P_A16 },
    TOK t_a16, TOKEN_PREFIX, 0, 0, P_A16

    ; { "a32", TOKEN_PREFIX, 0, 0, P_A32 },
    TOK t_a32, TOKEN_PREFIX, 0, 0, P_A32

    ; { "a64", TOKEN_PREFIX, 0, 0, P_A64 },
    TOK t_a64, TOKEN_PREFIX, 0, 0, P_A64

    ; { "asp", TOKEN_PREFIX, 0, 0, P_ASP },
    TOK t_asp, TOKEN_PREFIX, 0, 0, P_ASP

    ; { "lock", TOKEN_PREFIX, 0, 0, P_LOCK },
    TOK t_lock, TOKEN_PREFIX, 0, 0, P_LOCK

    ; { "o16", TOKEN_PREFIX, 0, 0, P_O16 },
    TOK t_o16, TOKEN_PREFIX, 0, 0, P_O16

    ; { "o32", TOKEN_PREFIX, 0, 0, P_O32 },
    TOK t_o32, TOKEN_PREFIX, 0, 0, P_O32

    ; { "o64", TOKEN_PREFIX, 0, 0, P_O64 },
    TOK t_o64, TOKEN_PREFIX, 0, 0, P_O64

    ; { "osp", TOKEN_PREFIX, 0, 0, P_OSP },
    TOK t_osp, TOKEN_PREFIX, 0, 0, P_OSP

    ; { "rep", TOKEN_PREFIX, 0, 0, P_REP },
    TOK t_rep, TOKEN_PREFIX, 0, 0, P_REP

    ; { "repe", TOKEN_PREFIX, 0, 0, P_REPE },
    TOK t_repe, TOKEN_PREFIX, 0, 0, P_REPE

    ; { "repne", TOKEN_PREFIX, 0, 0, P_REPNE },
    TOK t_repne, TOKEN_PREFIX, 0, 0, P_REPNE

    ; { "repnz", TOKEN_PREFIX, 0, 0, P_REPNZ },
    TOK t_repnz, TOKEN_PREFIX, 0, 0, P_REPNZ

    ; { "repz", TOKEN_PREFIX, 0, 0, P_REPZ },
    TOK t_repz, TOKEN_PREFIX, 0, 0, P_REPZ

    ; { "times", TOKEN_PREFIX, 0, 0, P_TIMES },
    TOK t_times, TOKEN_PREFIX, 0, 0, P_TIMES

    ; { "wait", TOKEN_PREFIX, 0, 0, P_WAIT },
    TOK t_wait, TOKEN_PREFIX, 0, 0, P_WAIT

    ; { "xacquire", TOKEN_PREFIX, 0, 0, P_XACQUIRE },
    TOK t_xacquire, TOKEN_PREFIX, 0, 0, P_XACQUIRE

    ; { "xrelease", TOKEN_PREFIX, 0, 0, P_XRELEASE },
    TOK t_xrelease, TOKEN_PREFIX, 0, 0, P_XRELEASE

    ; { "bnd", TOKEN_PREFIX, 0, 0, P_BND },
    TOK t_bnd, TOKEN_PREFIX, 0, 0, P_BND

    ; { "nobnd", TOKEN_PREFIX, 0, 0, P_NOBND },
    TOK t_nobnd, TOKEN_PREFIX, 0, 0, P_NOBND

    ; { "abs", TOKEN_SPECIAL, 0, 0, S_ABS },
    TOK t_abs, TOKEN_SPECIAL, 0, 0, S_ABS

    ; { "byte", TOKEN_SPECIAL, 0, 0, S_BYTE },
    TOK t_byte, TOKEN_SPECIAL, 0, 0, S_BYTE

    ; { "dword", TOKEN_SPECIAL, 0, 0, S_DWORD },
    TOK t_dword, TOKEN_SPECIAL, 0, 0, S_DWORD

    ; { "far", TOKEN_SPECIAL, 0, 0, S_FAR },
    TOK t_far, TOKEN_SPECIAL, 0, 0, S_FAR

    ; { "long", TOKEN_SPECIAL, 0, 0, S_LONG },
    TOK t_long, TOKEN_SPECIAL, 0, 0, S_LONG

    ; { "near", TOKEN_SPECIAL, 0, 0, S_NEAR },
    TOK t_near, TOKEN_SPECIAL, 0, 0, S_NEAR

    ; { "nosplit", TOKEN_SPECIAL, 0, 0, S_NOSPLIT },
    TOK t_nosplit, TOKEN_SPECIAL, 0, 0, S_NOSPLIT

    ; { "oword", TOKEN_SPECIAL, 0, 0, S_OWORD },
    TOK t_oword, TOKEN_SPECIAL, 0, 0, S_OWORD

    ; { "qword", TOKEN_SPECIAL, 0, 0, S_QWORD },
    TOK t_qword, TOKEN_SPECIAL, 0, 0, S_QWORD

    ; { "rel", TOKEN_SPECIAL, 0, 0, S_REL },
    TOK t_rel, TOKEN_SPECIAL, 0, 0, S_REL

    ; { "short", TOKEN_SPECIAL, 0, 0, S_SHORT },
    TOK t_short, TOKEN_SPECIAL, 0, 0, S_SHORT

    ; { "strict", TOKEN_SPECIAL, 0, 0, S_STRICT },
    TOK t_strict, TOKEN_SPECIAL, 0, 0, S_STRICT

    ; { "to", TOKEN_SPECIAL, 0, 0, S_TO },
    TOK t_to, TOKEN_SPECIAL, 0, 0, S_TO

    ; { "tword", TOKEN_SPECIAL, 0, 0, S_TWORD },
    TOK t_tword, TOKEN_SPECIAL, 0, 0, S_TWORD

    ; { "word", TOKEN_SPECIAL, 0, 0, S_WORD },
    TOK t_word, TOKEN_SPECIAL, 0, 0, S_WORD

    ; { "yword", TOKEN_SPECIAL, 0, 0, S_YWORD },
    TOK t_yword, TOKEN_SPECIAL, 0, 0, S_YWORD

    ; { "zword", TOKEN_SPECIAL, 0, 0, S_ZWORD },
    TOK t_zword, TOKEN_SPECIAL, 0, 0, S_ZWORD

    ; { "ptr", TOKEN_ID, 0, TFLAG_WARN, 0 },
    TOK t_ptr, TOKEN_ID, 0, TFLAG_WARN, 0

    ; { "__infinity__", TOKEN_FLOAT, 0, 0, 0 },
    TOK t___infinity__, TOKEN_FLOAT, 0, 0, 0

    ; { "__nan__", TOKEN_FLOAT, 0, 0, 0 },
    TOK t___nan__, TOKEN_FLOAT, 0, 0, 0

    ; { "__qnan__", TOKEN_FLOAT, 0, 0, 0 },
    TOK t___qnan__, TOKEN_FLOAT, 0, 0, 0

    ; { "__snan__", TOKEN_FLOAT, 0, 0, 0 },
    TOK t___snan__, TOKEN_FLOAT, 0, 0, 0

    ; { "__float8__", TOKEN_FLOATIZE, 0, 0, FLOAT_8 },
    TOK t___float8__, TOKEN_FLOATIZE, 0, 0, FLOAT_8

    ; { "__float16__", TOKEN_FLOATIZE, 0, 0, FLOAT_16 },
    TOK t___float16__, TOKEN_FLOATIZE, 0, 0, FLOAT_16

    ; { "__float32__", TOKEN_FLOATIZE, 0, 0, FLOAT_32 },
    TOK t___float32__, TOKEN_FLOATIZE, 0, 0, FLOAT_32

    ; { "__float64__", TOKEN_FLOATIZE, 0, 0, FLOAT_64 },
    TOK t___float64__, TOKEN_FLOATIZE, 0, 0, FLOAT_64

    ; { "__float80m__", TOKEN_FLOATIZE, 0, 0, FLOAT_80M },
    TOK t___float80m__, TOKEN_FLOATIZE, 0, 0, FLOAT_80M

    ; { "__float80e__", TOKEN_FLOATIZE, 0, 0, FLOAT_80E },
    TOK t___float80e__, TOKEN_FLOATIZE, 0, 0, FLOAT_80E

    ; { "__float128l__", TOKEN_FLOATIZE, 0, 0, FLOAT_128L },
    TOK t___float128l__, TOKEN_FLOATIZE, 0, 0, FLOAT_128L

    ; { "__float128h__", TOKEN_FLOATIZE, 0, 0, FLOAT_128H },
    TOK t___float128h__, TOKEN_FLOATIZE, 0, 0, FLOAT_128H

    ; { "__utf16__", TOKEN_STRFUNC, 0, 0, STRFUNC_UTF16 },
    TOK t___utf16__, TOKEN_STRFUNC, 0, 0, STRFUNC_UTF16

    ; { "__utf16le__", TOKEN_STRFUNC, 0, 0, STRFUNC_UTF16LE },
    TOK t___utf16le__, TOKEN_STRFUNC, 0, 0, STRFUNC_UTF16LE

    ; { "__utf16be__", TOKEN_STRFUNC, 0, 0, STRFUNC_UTF16BE },
    TOK t___utf16be__, TOKEN_STRFUNC, 0, 0, STRFUNC_UTF16BE

    ; { "__utf32__", TOKEN_STRFUNC, 0, 0, STRFUNC_UTF32 },
    TOK t___utf32__, TOKEN_STRFUNC, 0, 0, STRFUNC_UTF32

    ; { "__utf32le__", TOKEN_STRFUNC, 0, 0, STRFUNC_UTF32LE },
    TOK t___utf32le__, TOKEN_STRFUNC, 0, 0, STRFUNC_UTF32LE

    ; { "__utf32be__", TOKEN_STRFUNC, 0, 0, STRFUNC_UTF32BE },
    TOK t___utf32be__, TOKEN_STRFUNC, 0, 0, STRFUNC_UTF32BE

    ; { "__ilog2e__", TOKEN_IFUNC, 0, 0, IFUNC_ILOG2E },
    TOK t___ilog2e__, TOKEN_IFUNC, 0, 0, IFUNC_ILOG2E

    ; { "__ilog2w__", TOKEN_IFUNC, 0, 0, IFUNC_ILOG2W },
    TOK t___ilog2w__, TOKEN_IFUNC, 0, 0, IFUNC_ILOG2W

    ; { "__ilog2f__", TOKEN_IFUNC, 0, 0, IFUNC_ILOG2F },
    TOK t___ilog2f__, TOKEN_IFUNC, 0, 0, IFUNC_ILOG2F

    ; { "__ilog2c__", TOKEN_IFUNC, 0, 0, IFUNC_ILOG2C },
    TOK t___ilog2c__, TOKEN_IFUNC, 0, 0, IFUNC_ILOG2C

    ; { "seg", TOKEN_SEG, 0, 0, 0 },
    TOK t_seg, TOKEN_SEG, 0, 0, 0

    ; { "wrt", TOKEN_WRT, 0, 0, 0 },
    TOK t_wrt, TOKEN_WRT, 0, 0, 0

    ; { "1to2", TOKEN_DECORATOR, 0, TFLAG_BRC | TFLAG_BRDCAST , BRC_1TO2 },
    TOK t_1to2, TOKEN_DECORATOR, 0, TFLAG_BRC | TFLAG_BRDCAST, BRC_1TO2

    ; { "1to4", TOKEN_DECORATOR, 0, TFLAG_BRC | TFLAG_BRDCAST , BRC_1TO4 },
    TOK t_1to4, TOKEN_DECORATOR, 0, TFLAG_BRC | TFLAG_BRDCAST, BRC_1TO4

    ; { "1to8", TOKEN_DECORATOR, 0, TFLAG_BRC | TFLAG_BRDCAST , BRC_1TO8 },
    TOK t_1to8, TOKEN_DECORATOR, 0, TFLAG_BRC | TFLAG_BRDCAST, BRC_1TO8

    ; { "1to16", TOKEN_DECORATOR, 0, TFLAG_BRC | TFLAG_BRDCAST , BRC_1TO16 },
    TOK t_1to16, TOKEN_DECORATOR, 0, TFLAG_BRC | TFLAG_BRDCAST, BRC_1TO16

    ; { "rn-sae", TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_RN },
    TOK t_rn_sae, TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_RN

    ; { "rd-sae", TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_RD },
    TOK t_rd_sae, TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_RD

    ; { "ru-sae", TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_RU },
    TOK t_ru_sae, TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_RU

    ; { "rz-sae", TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_RZ },
    TOK t_rz_sae, TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_RZ

    ; { "sae", TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_SAE },
    TOK t_sae, TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_SAE

    ; { "z", TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_Z },
    TOK t_z, TOKEN_DECORATOR, 0, TFLAG_BRC, BRC_Z

    ; { "evex", TOKEN_PREFIX, 0, TFLAG_BRC, P_EVEX },
    TOK t_evex, TOKEN_PREFIX, 0, TFLAG_BRC, P_EVEX

    ; { "vex3", TOKEN_PREFIX, 0, TFLAG_BRC, P_VEX3 },
    TOK t_vex3, TOKEN_PREFIX, 0, TFLAG_BRC, P_VEX3

    ; { "vex2", TOKEN_PREFIX, 0, TFLAG_BRC, P_VEX2 },
    TOK t_vex2, TOKEN_PREFIX, 0, TFLAG_BRC, P_VEX2

