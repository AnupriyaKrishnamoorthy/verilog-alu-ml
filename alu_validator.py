from vcdvcd import VCDVCD

# ALU logic
def alu_expected(a, b, opcode_bin):
    opcode_bin = f"{opcode_bin:03b}"  # Ensure binary string
    op_main = opcode_bin[:2]  # opcode[2:1]
    op = opcode_bin[2]        # opcode[0]

    if op_main == "00":  # Adder
        a_val = int(a)
        b_val = int(b)
        c_in = int(op)
        return (a_val + b_val + c_in) % 256
    
    elif op_main == "01":  # Subtractor
        a_val = int(a)
        b_val = int(b)
        b_in = int(op)
        return (a_val - b_val - b_in) % 256

    elif op_main == "10":  # Logic
        a_val = int(a)
        b_val = int(b)
        if op == "0":
            return a_val & b_val
        elif op == "1":
            return a_val | b_val

    elif op_main == "11":  # Shift
        a_val = int(a)
        if op == "0":
            return (a_val << 1) % 256
        elif op == "1":
            return a_val >> 1

    return 0


# Convert binary string to int safely
def b2i(bin_str):
    return int(bin_str, 2) if isinstance(bin_str, str) and all(c in '01' for c in bin_str) else None

# Load VCD
vcd = VCDVCD("dump.vcd", signals=[], store_tvs=True)

# Define signal names
signal_names = {
    'a': 'alu8_tb.a[7:0]',
    'b': 'alu8_tb.b[7:0]',
    'opcode': 'alu8_tb.opcode[2:0]',
    'out': 'alu8_tb.out[7:0]'
}

# Extract signals
tv = {}
for key, expected_name in signal_names.items():
    found = False
    for symbol, signal_obj in vcd.data.items():
        full_name = signal_obj.references[0] if signal_obj.references else ""
        if full_name == expected_name:
            print(f"✅ Found signal '{key}': {full_name}")
            tv[key] = {t: b2i(vv) for t, vv in signal_obj.tv if b2i(vv) is not None}
            found = True
            break
    if not found:
        print(f"❌ Could not find signal for '{key}' → {expected_name}")

# Combine timepoints
all_times = sorted(set().union(*[set(tvs.keys()) for tvs in tv.values()]))

# Compare values
print("\n🔎 ALU Output Validation:")
for t in all_times:
    try:
        a = tv['a'][t]
        b = tv['b'][t]
        opcode = tv['opcode'][t]
        actual = tv['out'][t]
        expected = alu_expected(a, b, opcode)

        if expected is None:
            continue

        result = "✅" if expected == actual else "❌"
        print(f"\n⏱ Time {t}:")
        print(f"  a = {a}, b = {b}, opcode = {opcode:03b}")
        print(f"  {result} Expected = {expected}, Got = {actual}")
    except KeyError:
        continue
