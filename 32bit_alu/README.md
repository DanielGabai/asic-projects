# RISC-V ALU (32-bit)

This project implements a 32-bit Arithmetic Logic Unit (ALU) suitable for use in a RISC-V CPU. The ALU performs core operations required by the base RV32I instruction set, including arithmetic, logical, and shift instructions.

## ✅ Supported Operations

| Operation | Control Code (`sel`) | Description                     |
| --------- | -------------------- | ------------------------------- |
| AND       | `0000`               | Bitwise AND                     |
| OR        | `0001`               | Bitwise OR                      |
| ADD       | `0010`               | Addition                        |
| SUB       | `0011`               | Subtraction                     |
| XOR       | `0100`               | Bitwise XOR                     |
| SLT       | `0101`               | Set if `a < b` (signed)         |
| SLL       | `0111`               | Shift left logical              |
| SRL       | `1000`               | Shift right logical             |
| SRA       | `1001`               | Shift right arithmetic (signed) |

All operations are performed on 32-bit inputs `a` and `b`. Shift amounts use `b[4:0]`.

## 🔧 Future Work

- Integrate into a pipelined RISC-V CPU core
- Synthesize with OpenLane for Sky130 PDK
- Add support for unsigned comparisons (`SLTU`)
