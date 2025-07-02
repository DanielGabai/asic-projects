# ASIC Projects

This repository contains digital hardware modules written in Verilog, designed and verified for ASIC synthesis using the open-source OpenLane flow and the Sky130 PDK. Each project is created with physical design constraints in mind, targeting eventual silicon implementation.

---

## 🧠 Current Projects

### 🟦 1. 4-Bit CPU (Educational Datapath)
A simple 4-bit processor built from scratch to understand CPU microarchitecture and datapath design. It features:
- 3-bit Program Counter
- Instruction ROM
- Register File (4-bit wide)
- ALU with basic operations
- Simple control path with a custom 4-bit instruction format
- Clocked, synchronous top-level integration

📁 [`4bit-cpu/`](./4bit-cpu)

This CPU was synthesized using **OpenLane** and successfully passed the full RTL-to-GDS flow on Sky130.

---

### 🟩 2. UART Transmitter (UART TX)
A parameterizable UART transmitter designed for ASIC integration. It includes:
- Configurable baud rate support
- Start bit, 8 data bits, stop bit protocol
- FSM-based implementation
- `tx_ready` and `tx` outputs for clean interfacing

📁 [`uart-tx/`](./uart-tx)

The UART TX module has been verified through simulation and synthesized with **OpenLane**, producing a GDSII layout ready for chip integration.

---

## 🛠 Tools & Flow
- **RTL**: Verilog (SystemVerilog-subset safe)
- **Simulation**: Icarus Verilog + GTKWave
- **ASIC Synthesis & Layout**: OpenLane using Sky130
- **Linting & Formatting**: Verible

