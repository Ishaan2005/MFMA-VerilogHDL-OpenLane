# Matrix Fused Multiply ADD - MFMA - RTL to GDSII with OpenLane

![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
![Language: Verilog](https://img.shields.io/badge/Language-Verilog%20HDL-brightgreen.svg)
![EDA Flow: OpenLane](https://img.shields.io/badge/EDA-OpenLane-orange.svg)
![Process: SkyWater 130nm](https://img.shields.io/badge/PDK-SkyWater%20130nm-red.svg)
![Status: Active](https://img.shields.io/badge/Design%20Status-Theory%20%26%20Design-informational.svg)

<div align="center" style="margin: 20px 0;">
  <a href="https://ishaan2005.github.io/gds-viewer/" target="_blank" style="text-decoration: none;">
    <img src="https://img.shields.io/badge/GDSII_Viewer-Launch_Tool-blue?style=for-the-badge&logo=visualstudiocode&logoColor=white" alt="GDS Viewer" />
  </a>
  &nbsp;&nbsp;
  <a href="https://ishaan2005.github.io/rtl-portfolio/" target="_blank" style="text-decoration: none;">
    <img src="https://img.shields.io/badge/RTL_Portfolio-View_Demo-brightgreen?style=for-the-badge&logo=github&logoColor=white" alt="View Demo" />
  </a>
</div>

---

## Project Overview

This repository hosts the design, verification, and end-to-end automated silicon implementation of a **Multiply-Accumulate (MAC) Unit**. Designed in **Verilog HDL**, this hardware block undergoes complete digital physical design from RTL synthesis to final GDSII layout generation using the open-source **OpenLane** EDA flow and open PDKs (such as SkyWater 130nm).

The MAC unit serves as the computational backbone for modern high-performance Digital Signal Processing (DSP) applications, matrix acceleration engines, and Machine Learning / Deep Neural Network (DNN) hardware accelerators.

---

## Fundamental Theory

### 1. The Multiply-Accumulate Operation
The fundamental operation of a MAC unit computes the product of two input operands and adds that product to an ongoing accumulator value:

$$\text{Accumulator}_{\text{new}} = (\text{Operand } A \times \text{Operand } B) + \text{Accumulator}_{\text{previous}}$$

In vector and tensor operations, such as finite impulse response (FIR) filtering, convolution operations, and matrix multiplications ($C = A \cdot B$), this calculation is repeated across thousands to millions of cycles:

$$Y = \sum_{i=0}^{N-1} (A_i \cdot B_i)$$

Implementing this natively in dedicated hardware eliminates instruction overhead, maximizes pipeline throughput, and minimizes latency.

---

## Architectural Building Blocks

A standard hardware MAC architecture comprises three primary functional units:

1. **Multiplier Stage:** Multiplies $N$-bit inputs $A$ and $B$ to yield a $2N$-bit intermediate product.
2. **Adder Stage:** Sums the $2N$-bit product with the dynamic width accumulator register.
3. **Accumulator Register:** Holds the running total, protected with additional guard bits to prevent arithmetic overflow during sequential multiply-add steps.

---

## Interactive Demos & Links

- **GDSII Viewer:** [<ins>Launch Interactive Layout Tool</ins>](https://ishaan2005.github.io/gds-viewer/)
- **RTL Portfolio:** [<ins>View Full Hardware Design Portfolio</ins>](https://ishaan2005.github.io/rtl-portfolio/)

---

## License

Distributed under the [Apache 2.0 License](LICENSE).
