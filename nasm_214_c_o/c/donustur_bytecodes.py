import re
import os

def extract_referenced_offsets(insnsa_path):
    print(f"'{insnsa_path}' taranıyor ve bytecode offsetleri toplanıyor...")
    if not os.path.exists(insnsa_path):
        print(f"HATA: '{insnsa_path}' dosyası bulunamadı! Lütfen script ile aynı klasörde olduğundan emin olun.")
        return set()
        
    with open(insnsa_path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
    
    pattern = r"nasm_bytecodes\s*\+\s*(\d+|0x[0-9a-fA-F]+)"
    matches = re.findall(pattern, content)
    
    offsets = set()
    for m in matches:
        offsets.add(int(m, 0))
        
    print(f"Toplam {len(offsets)} adet benzersiz bytecode offset adresi tespit edildi.")
    return offsets

def parse_insnsb_c(insnsb_path, referenced_offsets):
    print(f"'{insnsb_path}' taranıyor ve ASM formatına dönüştürülüyor...")
    if not os.path.exists(insnsb_path):
        print(f"HATA: '{insnsb_path}' dosyası bulunamadı! Lütfen dosya adını kontrol edin.")
        return None
        
    with open(insnsb_path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
        
    # nasm_bytecodes dizisinin süslü parantez içini bul
    pattern = r"const\s+uint8_t\s+nasm_bytecodes\s*\[\s*\d*\s*\]\s*=\s*\{([^}]+)\};"
    match = re.search(pattern, content, re.DOTALL)
    
    if not match:
        print("HATA: insnsb.c içinde 'nasm_bytecodes' dizisi regex ile eşleşmedi!")
        return None
        
    body = match.group(1)
    
    # /* ... */ yorum satırlarını temizle ki sayılarla karışmasın
    body_clean = re.sub(r"/\*.*?\*/", "", body)
    
    # Token'ları bul (0x ile başlayanlar, düz sayılar veya octal/decimal ifadeler)
    raw_tokens = re.findall(r"(0x[0-9a-fA-F]+|\d+)", body_clean)
    
    asm_output = []
    asm_output.append("; ========================================================")
    asm_output.append("; Otomatik Donusturulen Bytecode Dizisi ve Etiketleri")
    asm_output.append("; ========================================================")
    asm_output.append("    align 4")
    asm_output.append("nasm_bytecodes:")
    
    line_bytes = []
    current_index = 0
    
    for token in raw_tokens:
        # Eğer bu bayt indisinde bir itemplate referansı varsa, etiket koy
        if current_index in referenced_offsets:
            if line_bytes:
                asm_output.append(f"    db " + ", ".join(line_bytes))
                line_bytes = []
            asm_output.append(f"bytecode_{current_index}:")
            
        # Octal değerleri (örn: 0241) NASM'in anlaması için uygun formata veya ondalığa çevirebiliriz
        # NASM sekizlik sayıları genellikle '0241q' veya 'o241' veya doğrudan ondalık/hex olarak kabul eder.
        # Python'da int(token, 8) yaparsak ondalığa çevirip db ile güvenle yazdırabiliriz:
        try:
            if token.startswith('0') and len(token) > 1 and 'x' not in token.lower():
                # Sekizlik (octal) sayıyı ondalık değere çevirip yazmak en güvenlisidir
                val = int(token, 8)
                line_bytes.append(str(val))
            else:
                line_bytes.append(token)
        except ValueError:
            line_bytes.append(token)
            
        current_index += 1
        
        if len(line_bytes) >= 16:
            asm_output.append(f"    db " + ", ".join(line_bytes))
            line_bytes = []
            
    if line_bytes:
        asm_output.append(f"    db " + ", ".join(line_bytes))
        
    print(f"Toplam {current_index} bayt başarıyla işlendi.")
    return "\n".join(asm_output)

if __name__ == "__main__":
    offsets = extract_referenced_offsets("insnsa.c")
    if offsets:
        generated_asm = parse_insnsb_c("insnsb.c", offsets)
        
        if generated_asm:
            with open("bytecode_data.asm", "w", encoding="utf-8") as out:
                out.write(generated_asm)
            print("İşlem Başarılı! 'bytecode_data.asm' dosyası oluşturuldu.")
            
    input("Çıkmak için Enter tuşuna basın...")
