import re

input_filename = "enums.h"  # C kaynak kodunun veya define/enum listesinin olduğu dosya
output_filename = "nasm_assigns.asm"     # Çıkacak NASM dosyası

syms = {}          # Değerleri takip etmek için sözlük
current_val = 0    # Otomatik artan sayaç
in_enum = False
output_lines = []

print("C enum ve define dosyası işleniyor...")

try:
    with open(input_filename, "r", encoding="utf-8", errors="ignore") as f:
        lines = f.readlines()
except FileNotFoundError:
    print(f"Hata: '{input_filename}' dosyası bulunamadı!")
    input("Çıkmak için Enter'a basın...")
    exit()

for line in lines:
    stripped = line.strip()
    # Yorum satırlarını temizle
    stripped = re.sub(r'//.*', '', stripped).strip()
    if not stripped:
        continue

    # 1. #define satırlarını yakala (Örn: #define EXPR_REG_START 1)
    define_match = re.match(r'^#define\s+([A-Za-z0-9_]+)\s+(.+)$', stripped)
    if define_match:
        name, expr = define_match.groups()
        expr = expr.strip()
        try:
            # Daha önce tanımlanan bir sabit varsa Python eval ile hesaplar
            val = eval(expr, {"__builtins__": None}, syms)
            syms[name] = val
            output_lines.append(f"%assign {name} {val}")
        except Exception:
            output_lines.append(f"%assign {name} {expr}")
        continue

    # 2. Enum bloğu başlangıcı
    if "enum" in stripped:
        in_enum = True
        continue

    if in_enum:
        if "}" in stripped:
            in_enum = False
            continue
        
        # Sondaki virgülü temizle
        item_str = stripped.rstrip(',').strip()
        if not item_str:
            continue

        # Eşittir (=) var mı kontrol et
        if '=' in item_str:
            parts = item_str.split('=', 1)
            name = parts[0].strip()
            expr = parts[1].strip()
            try:
                # İfadeyi değerlendir (örn: EXPR_REG_START veya -1)
                val = eval(expr, {"__builtins__": None}, syms)
                syms[name] = val
                current_val = val + 1  # Bir sonraki eleman buradan devam eder
                output_lines.append(f"%assign {name} {val}")
            except Exception:
                output_lines.append(f"%assign {name} {expr}")
        else:
            # Eşittir yoksa, mevcut sayacı kullan ve 1 artır
            name = item_str
            syms[name] = current_val
            output_lines.append(f"%assign {name} {current_val}")
            current_val += 1

# Sonucu NASM dosyasına yaz
with open(output_filename, "w", encoding="utf-8") as f:
    f.write("; --- Otomatik Uretilen NASM Assign Sabitleri ---\n\n")
    for l in output_lines:
        f.write(l + "\n")

print(f"\nİşlem tamamlandı! '{output_filename}' dosyası oluşturuldu.")
input("\nÇıkmak için Enter'a basın...")
