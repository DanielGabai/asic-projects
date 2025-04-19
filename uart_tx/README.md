# UART Transmitter (uart_tx)

A compact, ASIC-synthesizable UART Transmitter module implemented in Verilog and fully routed using OpenLane and the Sky130 standard cell library.

---

## 🔧 Module Overview

This `uart_tx` module serializes 8-bit data for UART transmission using standard start/stop framing at a configurable baud rate.

### ✅ Key Features:

- 8-bit parallel data input
- Start and stop bit framing
- Configurable baud rate (`CLK_DIV` parameter)
- ASIC-safe Verilog
- Fully routed with DRC/LVS clean layout on Sky130

---

## 📐 Interface

| Port       | Direction | Width | Description                   |
| ---------- | --------- | ----- | ----------------------------- |
| `clk`      | Input     | 1     | System clock                  |
| `rst`      | Input     | 1     | Active-high synchronous reset |
| `tx_start` | Input     | 1     | Pulse to begin transmission   |
| `tx_data`  | Input     | 8     | Data byte to transmit         |
| `tx`       | Output    | 1     | Serial UART transmit line     |
| `tx_busy`  | Output    | 1     | High while transmitting       |

---

## 🧪 Simulation

Simulation was performed using a behavioral testbench (`tb_uart_tx.v`) and GTKWave. Output `tx` line shows:

- 1 start bit (`0`)
- 8 data bits (LSB first)
- 1 stop bit (`1`)

🧠 Example test data: `0b01101100`

---

## 🏗️ ASIC Implementation Details

### ✅ Final Metrics (Sky130 + OpenLane v2.3.10)

| Metric                     | Value       |
| -------------------------- | ----------- |
| Standard Cells             | 148         |
| Core Utilization           | 62.0%       |
| Die Area                   | 3923.91 µm² |
| Power (Total)              | ~46 µW      |
| Timing Violations          | 0           |
| DRC / LVS / Antenna Errors | 0           |
| Fanout Violations          | 2 (minor)   |
