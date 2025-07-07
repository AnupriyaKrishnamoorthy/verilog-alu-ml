# 🧠 Verilog ALU + Python Integration for Delay Prediction
**#100DaysOfVLSIAI**

This project implements an **8-bit Arithmetic Logic Unit (ALU)** in Verilog and integrates with Python for signal validation and machine learning-based delay prediction.

The Verilog testbench exports output to a text file (`alu_output.txt`), which can be read by Python scripts using `pandas`, `NumPy`, and `scikit-learn` for analysis and ML applications.

---

## 🔧 ALU Features

- **Inputs**: 
  - `a` [7:0] — 8-bit input A  
  - `b` [7:0] — 8-bit input B  
  - `cin` [0:0] — Carry-in (used for addition/subtraction)  
- **Output**: 
  - `out` [7:0] — Result  
- **Opcode**: 3 bits used to select the operation:
  - `opcode[2:1]` — Operation group
  - `opcode[0]` — Sub-operation within the group

---

## 🎛 Opcode Format

| `opcode[2:1]` | `opcode[0]` | Operation              |
|---------------|-------------|------------------------|
| `00`          | `0`         | Addition (A + B + Cin) |
| `00`          | `1`         | Subtraction (A - B - Bin) |
| `01`          | `0`         | AND (A & B)            |
| `01`          | `1`         | OR (A \| B)             |
| `10`          | `0`         | Shift Left (A << 1)    |
| `10`          | `1`         | Shift Right (A >> 1)   |
| `11`          | -           | *Reserved*             |

---

## 📁 File Structure

```bash
verilog-alu-ml/
├── alu.v             # Top-level ALU wrapper
├── adder.v           # Adder module
├── subtractor.v      # Subtractor module
├── logic_unit.v      # Logical operations module
├── shift_unit.v      # Shift operations module
├── tb_alu.v          # ALU testbench
├── alu_output.txt    # Testbench output dumped via $fwrite
├── alu_validator.py  # (Coming soon) Python parser and validator
└── README.md         # This file
🐍 Python Integration
🧾 Reads simulation output (alu_output.txt)

🔄 Converts binary to decimal

📊 Future: Prepares data for machine learning

Regression to predict delay

Anomaly detection in ALU results

🚀 Goals
✅ Design modular 8-bit ALU

✅ Simulate with testbench and export output

🔄 Analyze outputs using Python (in progress)

🔮 Use ML to predict delay or correctness

🧠 Learning Objectives
Gain confidence in modular Verilog design and simulation

Practice file-based integration between HDL and Python

Explore the intersection of VLSI and Machine Learning

📌 Project Status
This is the easy-level project in my 3-tiered VLSI + AI portfolio:

Level	Project	Status
Easy	8-bit ALU + Python-based Output Validator	✅ Complete
Medium	ALU Delay Prediction using Regression	🔄 In Progress
Hard	VLSI Datapath + Full ML Pipeline Integration	⏳ Planned

🙋‍♀️ Author
Anupriya Krishnamoorthy
GitHub | LinkedIn
