import re
import os

def parse_insnsd_c(filepath):
    print(f"'{filepath}' dosyası açılıyor...")
    if not os.path.exists(filepath):
        print(f"HATA: '{filepath}' dosyası bulunamadı! Lütfen dosya adını ve klasörü kontrol edin.")
        return None

    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    asm_output = []
    asm_output.append("; ========================================================")
    asm_output.append("; Otomatik Donusturulen disasm ve instrux Tablolari (insnsd.c)")
    asm_output.append("; ========================================================")
    asm_output.append("NO_DECORATOR equ 0")
    asm_output.append("IMMEDIATE equ 1")
    asm_output.append("")

    # 1. Aşama: instrux ana dizisi
    print("1. Aşama: 'instrux' ana dizisi işleniyor...")
    instrux_pattern = r"static\s+const\s+struct\s+itemplate\s+instrux\s*\[\]\s*=\s*\{"
    match_instrux = re.search(instrux_pattern, content)
    
    if match_instrux:
        start_idx = match_instrux.end() - 1
        brace_count = 0
        end_idx = -1
        for i in range(start_idx, len(content)):
            if content[i] == '{':
                brace_count += 1
            elif content[i] == '}':
                brace_count -= 1
                if brace_count == 0:
                    end_idx = i + 1
                    break
        
        if end_idx != -1:
            body = content[start_idx + 1:end_idx - 1]
            asm_output.append("    align 4")
            asm_output.append("instrux:")
            
            entries = split_entries(body)
            for entry in entries:
                entry = entry.strip()
                if not entry:
                    continue
                
                clean_entry = re.sub(r"/\*.*?\*/", "", entry).strip()
                if not clean_entry:
                    continue
                
                if clean_entry.startswith('{') and clean_entry.endswith('}'):
                    inner = clean_entry[1:-1].strip()
                    fields = split_fields(inner)
                    
                    if len(fields) >= 6:
                        opcode = fields[0]
                        operands = fields[1]
                        opd_field = fields[2]
                        deco_field = fields[3]
                        code_field = fields[4]
                        iflag_field = fields[5]
                        
                        asm_output.append(f"    ; Entry: {clean_entry}")
                        asm_output.append(f"    dd {opcode}")
                        asm_output.append(f"    dd {operands}")
                        
                        opd_vals = parse_sub_list(opd_field, 5)
                        for val in opd_vals:
                            asm_output.append(f"    dq {val}")
                            
                        deco_vals = parse_sub_list(deco_field, 5)
                        for val in deco_vals:
                            asm_output.append(f"    dw {val}")
                            
                        code_val = "0" if code_field == "NULL" else code_field
                        asm_output.append(f"    dd {code_val}")
                        asm_output.append(f"    dd {iflag_field}")
                        asm_output.append("")
    print("   -> 'instrux' dizisi tamamlandı.")

    # 2. Aşama: itable_XX[] pointer dizileri (Çarpan: 68 bayt)
    print("2. Aşama: Ara 'itable_*' dizileri işleniyor (Çarpan: 68)...")
    itable_pattern = r"static\s+const\s+struct\s+itemplate\s*\*\s*const\s+(\w+)\[\]\s*=\s*\{([^}]+)\};"
    itable_matches = re.findall(itable_pattern, content, re.DOTALL)
    
    for name, body in itable_matches:
        asm_output.append("    align 4")
        asm_output.append(f"{name}:")
        lines = [l.strip() for l in body.split('\n') if l.strip()]
        for line in lines:
            line_clean = re.sub(r"/\*.*?\*/", "", line).strip()
            line_clean = line_clean.rstrip(',').strip()
            if line_clean:
                if "instrux +" in line_clean:
                    parts = line_clean.split("+")
                    idx_val = parts[1].strip()
                    asm_output.append(f"    dd instrux + ({idx_val} * 68)")
                else:
                    asm_output.append(f"    dd {line_clean}")
        asm_output.append("")
    print(f"   -> Toplam {len(itable_matches)} adet ara itable dizisi işlendi.")

    # 3. Aşama: itable_vex010 gibi disasm_index dizileri (Brace-matching ile düzeltildi)
    print("3. Aşama: 'disasm_index' tablolari işleniyor...")
    disasm_pat = r"static\s+const\s+struct\s+disasm_index\s+(\w+)\[\s*\d*\s*\]\s*=\s*\{"
    pos = 0
    disasm_count = 0
    while True:
        m = re.search(disasm_pat, content[pos:])
        if not m:
            break
        name = m.group(1)
        start_pos = pos + m.start()
        brace_start = content.find('{', start_pos)
        if brace_start == -1:
            break
        
        b_count = 0
        end_idx = -1
        for i in range(brace_start, len(content)):
            if content[i] == '{':
                b_count += 1
            elif content[i] == '}':
                b_count -= 1
                if b_count == 0:
                    end_idx = i + 1
                    break
                    
        if end_idx != -1:
            body = content[brace_start + 1 : end_idx - 1]
            asm_output.append("    align 4")
            asm_output.append(f"{name}:")
            sub_entries = re.findall(r"\{([^}]+)\}", body)
            for sub in sub_entries:
                sub_clean = sub.strip()
                if not sub_clean:
                    continue
                parts = [p.strip() for p in sub_clean.split(',')]
                if len(parts) >= 2:
                    ptr_val = "0" if parts[0].upper() == "NULL" else parts[0]
                    count_val = parts[1]
                    asm_output.append(f"    dd {ptr_val}      ; pointer")
                    asm_output.append(f"    dd {count_val}    ; count")
            asm_output.append("")
            disasm_count += 1
            pos = end_idx
        else:
            pos += m.end()
    print(f"   -> Toplam {disasm_count} adet disasm_index dizisi işlendi.")

    # 4. Aşama: Çok boyutlu ana itable matrisleri (VEX, XOP, EVEX bölümleri)
    print("4. Aşama: Çok boyutlu ana itable matrisleri işleniyor...")
    matrix_pattern = r"const\s+struct\s+disasm_index\s*\*\s*const\s+(\w+)\s*\["
    pos = 0
    matrix_count = 0
    while True:
        m = re.search(matrix_pattern, content[pos:])
        if not m:
            break
        mat_name = m.group(1)
        mat_start_pos = pos + m.start()
        
        brace_start = content.find('{', mat_start_pos)
        if brace_start == -1:
            break
            
        b_count = 0
        mat_end = -1
        for i in range(brace_start, len(content)):
            if content[i] == '{':
                b_count += 1
            elif content[i] == '}':
                b_count -= 1
                if b_count == 0:
                    mat_end = i + 1
                    break
                    
        if mat_end != -1:
            mat_body = content[brace_start:mat_end]
            asm_output.append("    align 4")
            asm_output.append(f"{mat_name}:")
            
            tokens = re.findall(r"(NULL|[a-zA-Z0-9_]+)", mat_body)
            filtered_tokens = []
            for t in tokens:
                if t not in ["const", "struct", "disasm_index"]:
                    filtered_tokens.append("0" if t == "NULL" else t)
                    
            for t in filtered_tokens:
                asm_output.append(f"    dd {t}")
                
            asm_output.append("")
            matrix_count += 1
            pos = mat_end
        else:
            pos += m.end()
    print(f"   -> Toplam {matrix_count} adet çok boyutlu matris işlendi.")

    return "\n".join(asm_output)

def split_entries(body):
    entries = []
    current = []
    depth = 0
    for char in body:
        if char == '{':
            depth += 1
            current.append(char)
        elif char == '}':
            depth -= 1
            current.append(char)
        elif char == ',' and depth == 0:
            entries.append("".join(current).strip())
            current = []
        else:
            current.append(char)
    if current:
        entries.append("".join(current).strip())
    return entries

def split_fields(s):
    fields = []
    current = []
    depth = 0
    for char in s:
        if char == '{':
            depth += 1
            current.append(char)
        elif char == '}':
            depth -= 1
            current.append(char)
        elif char == ',' and depth == 0:
            fields.append("".join(current).strip())
            current = []
        else:
            current.append(char)
    if current:
        fields.append("".join(current).strip())
    return fields

def parse_sub_list(s, count):
    s = s.strip()
    if s.startswith('{') and s.endswith('}'):
        inner = s[1:-1].strip()
        items = [x.strip() for x in inner.split(',')]
        if len(items) == 1 and items[0] == '0':
            return ['0'] * count
        while len(items) < count:
            items.append('0')
        return items[:count]
    else:
        return [s] * count

if __name__ == "__main__":
    generated_asm = parse_insnsd_c("insnsd.c")
    if generated_asm:
        with open("insnsd_data.asm", "w", encoding="utf-8") as out:
            out.write(generated_asm)
        print("\nİşlem Başarılı! 'insnsd_data.asm' dosyası eksiksiz oluşturuldu.")
    else:
        print("\nHATA: Veri üretilemedi!")
        
    input("\nÇıkmak için Enter tuşuna basın...")
