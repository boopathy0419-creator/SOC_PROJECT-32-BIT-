# NanoCore 16 - Instruction ROM

## Overview

NanoCore 16 Instruction ROM is a hardware module that stores the program instructions for the NanoCore 16 processor. It provides read-only access to machine instructions based on the program counter (PC), enabling the CPU to fetch and execute instructions.

This project is implemented using **Verilog HDL** and is designed for simulation and FPGA-based educational processor development.

---

## Features

- 16-bit instruction storage
- Read-only memory (ROM)
- Combinational instruction fetch
- Simple address-to-instruction mapping
- Easily expandable instruction memory
- Compatible with the NanoCore 16 CPU

---

## Project Structure

```
NanoCore16-InstructionROM/
│
├── InstructionROM.v      # Instruction ROM module
├── InstructionROM_tb.v   # Testbench
├── README.md
└── docs/                 # Optional documentation
```

---

## Instruction Format

Each instruction is **16 bits** wide.

Example:

| Bits | Description |
|------|-------------|
| 15:12 | Opcode |
| 11:8 | Register 1 |
| 7:4 | Register 2 |
| 3:0 | Immediate / Register |

*(Modify this section if your instruction format differs.)*

---

## Module Interface

### Inputs

| Signal | Width | Description |
|---------|------|-------------|
| address | N bits | Instruction address |

### Outputs

| Signal | Width | Description |
|---------|------|-------------|
| instruction | 16 bits | Instruction stored at the selected address |

---

## How It Works

1. The CPU places the Program Counter (PC) value on the ROM address input.
2. The ROM looks up the corresponding instruction.
3. The selected 16-bit instruction is immediately available at the output.
4. The CPU decodes and executes the fetched instruction.

---

## Simulation

Run the design using any Verilog simulator.

Examples:

### ModelSim

```bash
vlog InstructionROM.v InstructionROM_tb.v
vsim InstructionROM_tb
run -all
```

### Icarus Verilog

```bash
iverilog -o rom InstructionROM.v InstructionROM_tb.v
vvp rom
```

---

## Example Instructions

| Address | Instruction | Description |
|----------|------------|-------------|
| 0x00 | 16'h1021 | Load Register |
| 0x01 | 16'h2345 | Add |
| 0x02 | 16'h3456 | Store |
| 0x03 | 16'hF000 | Halt |

*(Replace with your actual instruction contents.)*

---

## Applications

- Educational CPU design
- Processor architecture learning
- FPGA implementations
- Computer organization laboratories
- Verilog practice projects

---

## Requirements

- Verilog HDL
- ModelSim, Vivado Simulator, or Icarus Verilog
- FPGA board (optional)

---

## Future Improvements

- Parameterized ROM size
- Memory initialization from HEX/BIN files
- Support for larger instruction sets
- Integration with complete NanoCore 16 processor

---

## Author

**E BOOPATHY**

NanoCore 16 Processor Project

---

## License

This project is licensed under the MIT License.
