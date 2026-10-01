import re

input_filename = "tokhash.c" 
output_filename = "tokendata_out.asm"

success_count = 0
items = []

print("Dosya okunuyor...")

try:
    with open(input_filename, "r", encoding="utf-8", errors="ignore") as f:
        c_lines = f.readlines()
except FileNotFoundError:
    print(f"Hata: '{input_filename}' dosyası bulunamadı!")
    input("Çıkmak için Enter'a basın...")
    exit()

# 1. Aşama: Satırları parse et ve bellekte sakla
for line in c_lines:
    match = re.search(r'\{\s*"([^"]*)"\s*,\s*([^,]+)\s*,\s*([^,]+)\s*,\s*([^,]+)\s*,\s*([^}]+)\}', line)
    if match:
        token_str, flag, c_type, pad, identifier = [g.strip() for g in match.groups()]
        
        # Etiket ismi üretme (örn: "db" -> t_db)
        clean_name = re.sub(r'[^a-zA-Z0-9_]', '_', token_str)
        if not clean_name or clean_name.isdigit():
            clean_name = f"item_{success_count}"
        label_name = f"t_{clean_name}"
        
        items.append({
            'line': line.strip(),
            'label': label_name,
            'token': token_str,
            'flag': flag,
            'c_type': c_type,
            'pad': pad,
            'identifier': identifier
        })
        success_count += 1

# 2. Aşama: Dosyaya yazma (Önce stringler, sonra kesintisiz dizi)
with open(output_filename, "w", encoding="utf-8") as f:
    f.write("; --- Otomatik Uretilen NASM Tablosu ---\n")
    f.write("section .data\n\n")
    
    # Makro Tanımı
    f.write("%macro TOK 5\n")
    f.write("    dd %1\n")
    f.write("    dw %2\n")
    f.write("    db %3\n")
    f.write("    db %4\n")
    f.write("    dd %5\n")
    f.write("%endmacro\n\n")
    
    f.write("; --- 1. String Tanımları (Ayrı Bölge) ---\n")
    for item in items:
        f.write(f"    {item['label']}: db \"{item['token']}\", 0\n")
    
    f.write("\n; --- 2. Kesintisiz Tokendata Dizisi (12-byte struct array) ---\n")
    f.write("tokendata:\n")
    for item in items:
        f.write(f"    ; {item['line']}\n")
        f.write(f"    TOK {item['label']}, {item['flag']}, {item['c_type']}, {item['pad']}, {item['identifier']}\n\n")

print(f"\nİşlem tamamlandı!")
print(f"Toplam {success_count} eleman, araya etiket girmeden kesintisiz dizi olarak yazıldı.")
print(f"Çıktı dosyası: '{output_filename}'")

input("\nÇıkmak için Enter'a basın...")
