; =======================================================================
; NASM v2.14.02 - SAF ASSEMBLY FLAT BINARY / PRG ÇIKTI MOTORU (outbin.asm)
; `nasm386.asm` include zincirinin nullout.asm'den sonraki halkasıdır.
; Geliştirici: Erdoğan Tan & Google AI - 30/08/2026
; =======================================================================

; 02/09/2026 - Google AI

section .text
align 4

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_outbin_init
; İşlev: Çıktı tamponunu ve binary üretim konum sayaçlarını sıfırlar.
; -----------------------------------------------------------------------------
global nasm_outbin_init
nasm_outbin_init:
    push ebp
    mov ebp, esp
    
    mov dword [nasm_out_buf_ptr], nasm_output_buffer
    mov dword [nasm_out_total_bytes], 0
    
    mov esp, ebp
    pop ebp
    ret

align 4

; -----------------------------------------------------------------------------
; Fonksiyon: nasm_outbin_emit_byte
; İşlev: Çözümlenen makine kod byte'ını çıktı tamponuna yazar ve PC'yi ilerletir.
; Girdi (Stack): [EBP+8] = emit_char (Yazılacak 1 byte ham veri veya opkod)
; -----------------------------------------------------------------------------
global nasm_outbin_emit_byte
nasm_outbin_emit_byte:
    push ebp
    mov ebp, esp
    push ebx
    push edi

    mov eax, [ebp + 8]          ; AL = Yazılacak ham byte verisi
    mov edi, [nasm_out_buf_ptr] ; EDI = Güncel çıktı yazma bellek adresi
    
    ; Tampon bellek taşma emniyet kontrolü (Max 64 KB çıktı sınırı)
    mov ebx, [nasm_out_total_bytes]
    cmp ebx, 65535
    jae .L_emit_abort

    mov [edi], al               ; Byte'ı tampon belleğe fiziksel olarak işle!
    inc edi                     ; Pointer'ı 1 byte ileri kaydır
    inc ebx                     ; Toplam üretilen byte sayacını artır
    
    mov [nasm_out_buf_ptr], edi
    mov [nasm_out_total_bytes], ebx

    ; --- HARİKA ENTEGRASYON ---
    ; Üretilen her byte için anlık derleme Konum Sayacını (PC) otomatik olarak 1 artır!
    inc dword [nasm_program_counter]

.L_emit_abort:
    pop edi
    pop ebx
    mov esp, ebp
    pop ebp
    ret

; =========================================================================
; NİHAİ SÜRÜCÜ İŞLEV KÖPRÜLERİ (C ÇAĞRI MODELLİ ARABİRİMLER)
; =========================================================================

; void bin_init(void)
bin_init:
    push ebp
    mov ebp, esp

    ; Küresel çıktı dosyası adını al ve diske yazma modunda aç (+3 LIBC FD zırhıyla)
    mov eax, dword [out_filename]
    test eax, eax
    jz .L_bin_init_fail

    push 1                      ; NF_PANIC = 1
    push eax                    ; out_filename
    call nasm_open_write        ; file.asm yerel dosya oluşturma tetiği
    add esp, 8
    cmp eax, -1
    je .L_bin_init_fail
    
    mov dword [bin_file_handle], eax ; BSS segmentindeki aktif handle alanına kilitle
    jmp .L_bin_init_done

.L_bin_init_fail:
    push bin_init_err_msg       ; data.asm'e eklenecek
    push 2                      ; ERR_PANIC = 2
    call nasm_error
    add esp, 8

.L_bin_init_done:
    pop ebp
    ret

align 4

; void bin_output(int32_t sect_id, const void *data, uint32_t len)
; Derleme döngüsünden gelen ham bytecode baytlarını doğrudan dosyaya yazar.
bin_output:
    push ebp
    mov ebp, esp
    push ebx
    push esi

    mov esi, [ebp + 12]         ; esi = data pointer (ham bytecode tampon adresi)
    mov ecx, [ebp + 16]         ; ecx = len (yazılacak byte miktarı)
    mov ebx, dword [bin_file_handle] ; ebx = aktif çıktı dosya handle'ı

    test ebx, ebx
    jz .L_bin_out_done
    test esi, esi
    jz .L_bin_out_done
    test ecx, ecx
    jz .L_bin_out_done

    ; write(handle, data, len) ile disk yazma işlemini yürüt
    push ebx                    ; fp (LIBC FD)
    push ecx                    ; size
    push esi                    ; buf ptr
    call nasm_write             ; file.asm içindeki +3 zırh uyumlu yazıcı
    add esp, 12

.L_bin_out_done:
    pop esi
    pop ebx
    pop ebp
    ret

align 4

; void bin_cleanup(void)
; Çıktı dosyasını güvenle kapatır ve handle'ı sıfırlar.
bin_cleanup:
    push ebp
    mov ebp, esp

    mov eax, dword [bin_file_handle]
    test eax, eax
    jz .L_bin_clean_done

    push eax
    call nasm_close             ; file.asm yerel dosya kapatıcısı
    add esp, 4
    mov dword [bin_file_handle], 0 ; Kullanım sonrası sıfırla

.L_bin_clean_done:
    pop ebp
    ret


