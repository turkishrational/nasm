import re

def parse_insnsa_c(filepath):
    with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()

    asm_output = []
    asm_output.append("; ========================================================")
    asm_output.append("; Otomatik Donusturulen itemplate Tablolari ve Pointer Dizisi")
    asm_output.append("; ========================================================")
    asm_output.append("NO_DECORATOR equ 0")
    asm_output.append("IMMEDIATE equ 1")
    asm_output.append("")

    # 1. Aşama: Tüm instrux_XXX[] dizilerini bul ve dönüştür
    pattern = r"static\s+const\s+struct\s+itemplate\s+(\w+)\[\]\s*=\s*\{"
    
    pos = 0
    while True:
        match = re.search(pattern, content[pos:])
        if not match:
            break
            
        name = match.group(1)
        start_idx = pos + match.end() - 1  # '{' karakterinin yeri
        
        # Süslü parantezlerin kapanış yerini bul
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
        
        if end_idx == -1:
            break
            
        body = content[start_idx + 1:end_idx - 1]
        pos = end_idx
        
        # 32-bit port için align 4 ve etiket
        asm_output.append("    align 4")
        asm_output.append(f"{name}:")
        
        entries = split_entries(body)
        
        for entry in entries:
            entry = entry.strip()
            if not entry:
                continue
                
            # ITEMPLATE_END kontrolü (I_none = -1 olarak ayarlandı)
            if 'ITEMPLATE_END' in entry:
                asm_output.append("    ; --- ITEMPLATE_END ---")
                asm_output.append("    dd I_none                 ; opcode (I_none = -1)")
                asm_output.append("    dd 0                      ; operands")
                for _ in range(5):
                    asm_output.append("    dq 0                      ; opd")
                for _ in range(5):
                    asm_output.append("    dw 0                      ; deco")
                asm_output.append("    dd 0                      ; code (NULL)")
                asm_output.append("    dd 0                      ; iflag_idx")
                asm_output.append("")
                continue
                
            # Normal template satırı ({ ... })
            if entry.startswith('{') and entry.endswith('}'):
                inner = entry[1:-1].strip()
                fields = split_fields(inner)
                
                if len(fields) >= 6:
                    opcode = fields[0]
                    operands = fields[1]
                    opd_field = fields[2]
                    deco_field = fields[3]
                    code_field = fields[4]
                    iflag_field = fields[5]
                    
                    asm_output.append(f"    ; Entry: {entry}")
                    asm_output.append(f"    dd {opcode}")
                    asm_output.append(f"    dd {operands}")
                    
                    # opd (5 adet dq)
                    opd_vals = parse_sub_list(opd_field, 5)
                    for val in opd_vals:
                        asm_output.append(f"    dq {val}")
                        
                    # deco (5 adet dw)
                    deco_vals = parse_sub_list(deco_field, 5)
                    for val in deco_vals:
                        asm_output.append(f"    dw {val}")
                        
                    # code (pointer)
                    code_val = "0" if code_field == "NULL" else code_field
                    asm_output.append(f"    dd {code_val}")
                    
                    # iflag_idx
                    asm_output.append(f"    dd {iflag_field}")
                    asm_output.append("")
                    
    # 2. Aşama: nasm_instructions pointer dizisini bul ve ekle
    asm_output.append("")
    asm_output.append("; ========================================================")
    asm_output.append("; Ana Pointer Tablosu")
    asm_output.append("; ========================================================")
    
    inst_pattern = r"const\s+struct\s+itemplate\s*\*\s*const\s+nasm_instructions\[\]\s*=\s*\{([^}]+)\};"
    match_inst = re.search(inst_pattern, content, re.DOTALL)
    if match_inst:
        body_inst = match_inst.group(1)
        lines_inst = [l.strip() for l in body_inst.split('\n') if l.strip()]
        
        asm_output.append("    align 4")
        asm_output.append("nasm_instructions:")
        for line in lines_inst:
            line = line.rstrip(',').strip()
            if line and not line.startswith('//'):
                asm_output.append(f"    dd {line}")

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
    generated_asm = parse_insnsa_c("insnsa.c")
    with open("instrux_data.asm", "w", encoding="utf-8") as out:
        out.write(generated_asm)
    print("İşlem Başarılı! I_none (ITEMPLATE_END) ayarlanarak instrux_data.asm oluşturuldu.")
