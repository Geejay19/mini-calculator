#  🧮 Mini Calculator – SystemVerilog FPGA Design 
![Status](https://img.shields.io/badge/Status-Completed-2ecc71?style=for-the-badge)  
![Language](https://img.shields.io/badge/SystemVerilog-Design-blue?style=for-the-badge)  
![Platform](https://img.shields.io/badge/FPGA-Simulation-orange?style=for-the-badge)  
![Tools](https://img.shields.io/badge/Tools-EDA%20Playground%20%7C%20VS%20Code-6f42c1?style=for-the-badge)  
![License](https://img.shields.io/badge/License-Academic-lightgrey?style=for-the-badge)

---
A simple FPGA‑based mini calculator designed to multiply two single‑digit numbers (0–9) and display the result on a dual 7‑segment display.  
This project demonstrates digital design fundamentals using SystemVerilog, including adders, multipliers, and display decoders.

## 📘 Project Overview

This mini calculator performs **unsigned multiplication** of two numbers below 10 and outputs the result in **decimal form** using two 7‑segment displays.  
The design flow follows a structured hardware‑design approach:

- Building basic arithmetic blocks (1‑bit and 8‑bit adders)
- Constructing a 4‑bit multiplier using ripple‑carry adders
- Designing a 7‑segment decoder for display output
- (Optional) Integrating all modules into a complete top‑level calculator system
---
# 🧩 Section 1 — 8‑Bit Adder Design

### **1. One‑Bit Full Adder**
- Implemented using **dataflow modeling** (`assign` statements).
- Inputs: `A`, `B`, `Cin`  
- Outputs: `Sum`, `Cout`  
- File: `one_bit_adder.sv`

### **2. Testbench for One‑Bit Adder**
- Exhaustively tests all input combinations.
- Includes the module using:  
  ```systemverilog
  `include "one_bit_adder.sv"
  ```
- File: `one_bit_adder_tb.sv`

### **3. 8‑Bit Ripple Carry Adder**
- Built by instantiating **eight** one‑bit adders.
- Inputs: `A[7:0]`, `B[7:0]`, `Cin`  
- Outputs: `Sum[7:0]`, `Cout`  
- File: `eight_bit_adder.sv`

### **4. Testbench for 8‑Bit Adder**
- Contains 10 test cases including carry‑out scenarios.
- File: `eight_bit_adder_tb.sv`

---

# 🧩 Section 2 — 4‑Bit Multiplier Design

### **1. Understanding Multiplication**
- Manual binary multiplication analysis.
- Identified pattern of **shift + add** operations.

### **2. 4‑Bit Unsigned Multiplier**
- Built using **four 8‑bit adders** from Section 1.
- Inputs: `A[3:0]`, `B[3:0]`  
- Output: `product[7:0]`  
- File: `four_bit_unsigned_multiplier.sv`

### **3. Testbench for Unsigned Multiplier**
- Includes 10 test cases.
- File: `four_bit_multiplier_tb.sv`

### **4. 4‑Bit Signed Multiplier**
- Modified logic to support signed arithmetic.
- File: `four_bit_signed_multiplier.sv`

---

# 🧩 Section 3 — 7‑Segment Display Decoder

### **1. Decoder Design**
- Converts a 4‑bit binary input (0–9) into a **7‑segment common‑cathode** output.
- Output format: `seg[6:0]` → `(g f e d c b a)`
- File: `seven_segment_decoder.sv`

### **2. Testbench for Decoder**
- Tests all digits from 0 to 9.
- File: `seven_segment_decoder_tb.sv`

---

# 🧱 Section 4 — Integrated Calculator Module

### **Top‑Level Integration**
Combines:
- `four_bit_unsigned_multiplier`
- Two `seven_segment_decoder` modules

The top module:
- Accepts two 4‑bit inputs  
- Computes the 8‑bit product  
- Splits the result into tens and ones  
- Drives two 7‑segment displays  
- File: `top_module.sv`

### **Integrated Testbench**
- Includes 10 test cases validating multiplication + display output  
- File: `top_module_tb.sv`

---

# 🛠️ Tools Used

- **SystemVerilog**
- **EDA Playground** (simulation)
- **Visual Studio Code** (editing)

---

# 📸 Screenshots (Placeholders)

Add your simulation screenshots here:

- **One‑bit adder testbench result**  
<img width="1366" height="462" alt="one_bit_adder_tb" src="https://github.com/user-attachments/assets/7d36c35a-507a-4ccc-b2b3-c83ea3a52b97" />

- **Eight‑bit adder testbench result**  
<img width="1366" height="531" alt="eight_bit_adder_tb" src="https://github.com/user-attachments/assets/693707a9-5072-4894-bf87-661afd1905d3" />

- **Seven‑segment decoder testbench result**  
<img width="1366" height="522" alt="seven_segment_decoder_tb" src="https://github.com/user-attachments/assets/35e3d9ed-1dde-4f4c-bc27-5d73a994f465" />

---

# 📂 Project Structure (Suggested)

```
/Mini-Calculator
│
├── one_bit_adder.sv
├── one_bit_adder_tb.sv
│
├── eight_bit_adder.sv
├── eight_bit_adder_tb.sv
│
├── four_bit_unsigned_multiplier.sv
├── four_bit_multiplier_tb.sv
├── four_bit_signed_multiplier.sv
│
├── seven_segment_decoder.sv
├── seven_segment_decoder_tb.sv
│
├── top_module.sv
└── top_module_tb.sv
```

---



