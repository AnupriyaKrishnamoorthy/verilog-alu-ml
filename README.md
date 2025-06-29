# verilog-alu-ml #100DaysofVLSIAI

# 8-bit ALU with Python Integration for Delay Prediction

This project implements an **8-bit Arithmetic Logic Unit (ALU)** in Verilog. It supports arithmetic, logical, and shift operations based on a **3-bit opcode** input. The Verilog testbench exports the output to a text file (`alu_output.txt`), which can then be processed using Python (pandas, NumPy, scikit-learn) for analysis and machine learning (e.g., delay prediction).

## 🔧 ALU Features

- **8-bit inputs**: `a`, `b`
- **1-bit carry-in input**: `cin`
- **3-bit opcode**:
  - **opcode[2:1]**: selects the operation group
    - `00`: Arithmetic (Addition/Subtraction)
    - `01`: Logical (AND/OR/XOR/XNOR)
    - `10`: Shift (Left/Right)
    - `11`: Reserved (for future expansion)
  - **opcode[0]**: selects the specific operation inside each group

### Opcode Format

| `opcode[2:1]` | `opcode[0]` | Operation         |
|---------------|-------------|-------------------|
| `00`          | `0`         | Addition (A + B + Cin) |
| `00`          | `1`         | Subtraction (A - B - Bin)    |
| `01`          | `0`         | AND (A & B)       |
| `01`          | `1`         | OR (A \| B)        |
| `10`          | `0`         | Shift Left (A << 1) |
| `10`          | `1`         | Shift Right (A >> 1) |

---

## 📁 File Structure

```bash
verilog-alu-ml/
├── alu.v             # Top-level ALU module
├── adder.v           # Adder module
├── subtractor.v      # Subtractor module
├── logic_unit.v      # AND/OR logic module
├── shift_unit.v      # Shift operations module
├── tb_alu.v          # Testbench for ALU
├── alu_output.txt    # Output dumped by testbench using $fwrite
└── README.md         # This file


## 🐍 Python Integration

- Reads `alu_output.txt`
- Converts binary strings to decimal
- Processes data for potential ML tasks using `pandas` and `scikit-learn` (to be added in later phases)

---

## 🚀 Goals

- ✅ Complete ALU design and testbench (Verilog)
- ✅ Export simulation output
- 🔄 Analyze with Python (in progress)
- 🔮 Build a regression model to **predict delay** based on ALU inputs

---

## 🧠 Learning Objectives

- Solidify understanding of **Verilog modules**, simulation, and testbenches
- Practice **data export from HDL to external tools**
- Bridge VLSI and AI using **Python + Machine Learning**

---





