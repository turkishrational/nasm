; =======================================================================
; TRDOS 386 - NATIVE LIBC RUNTIME START (NASM ELF32 FORMAT)
; File: crt0.asm
; Date: 11/08/2026 - Developer: Erdogan Tan & Google AI
; =======================================================================
; 15/08/2026 - BSS_END & TCCRT0 signature (dword alignment)
; 29/08/2026 - NASM launcher

global _start
global _bss_end ; 15/08/2026

; extern main

section .text
; align 4

_start:
    jmp L_INIT_RUNTIME

    db "TC"	; compiler
    db "CRT0"	; signature
_bss_end:
    dd bss_end  ; NASM modification

; align 4
L_INIT_RUNTIME:
    mov ebx, dword [_bss_end]       ; ebx = BSS sonu adresi
    add ebx, 3
    and bl, 0xFC                    ; 4-Byte Dword Hizalama
    mov eax, 17                     ; EAX = 17 (sys_break)
    int 0x40                        ; TRDOS 386 Kernel Kesmesi
    mov dword [_bss_end], eax       ; [u.break] adresi (= bss sonu)
    ; ....
    pop eax                         ; eax = argc
    mov ebx, esp                    ; ebx = argv pointer (Yığın adresini kopyala)
    
    push ebx                        ; İkinci Parametre: argv
    push eax                        ; Birinci Parametre: argc
    call main                       ; TCC Ana Derleyici Motoruna Giriş
    
    add esp, 8                      ; Parametre yığın temizliği
    mov ebx, eax                    ; main()'den dönen exit code -> ebx
    mov eax, 1                      ; EAX = 1 (sys_exit)
    int 0x40                        ; TRDOS Çekirdeğine El Sıkışma Kapanışı

    ; Üretici İmzası ve Sürüm Bilgisi
    db 0
    db "Netwide Assembler v1.0 for TRDOS 386", 0
    db "Erdogan Tan - 2026", 0

