# 2-Bit Comparator (Transistor-Level CMOS)

**Full-custom static CMOS 2-bit magnitude comparator** designed at the transistor level with logic minimization, custom gate design, logical-effort–based sizing, and post-layout timing verification.

This project was completed as a final project for **EE103 (Intro to VLSI Design)** and focuses on **high-performance digital circuit optimization** using industry-standard tools and methodologies.

---

## 📌 Project Overview

This repository contains the design, optimization, and verification of a **2-bit magnitude comparator** implemented entirely in **static CMOS logic**.  
The comparator evaluates two 2-bit inputs (`A1 A0` and `B1 B0`) and produces three outputs:

- **G** — A > B  
- **E** — A = B  
- **L** — A < B  

The project emphasizes:
- Transistor-level design (no standard cells)
- Logic minimization and topology selection
- Custom pull-down network (PDN) gates
- Logical effort–based delay optimization
- HSPICE transient and timing analysis

---

## 🧠 Design Methodology

### 1. Logic Derivation
- Constructed the full truth table for all 16 input combinations
- Derived Boolean expressions for **G**, **L**, and **E**
- Optimized logic by setting  
  **E = ¬(G + L)** to minimize hardware
- Restricted implementation to **inverting logic only** for CMOS efficiency

### 2. Baseline Implementation
- Implemented using standard CMOS logic gates only
- Included:
  - XNOR
  - NAND
  - NOR
  - Inverters
- **Total transistor count:** 56

This version was fully functional but not area- or speed-optimal.

---

## 🔧 Custom Gate Optimization

To reduce transistor count and delay:

- Designed **custom CMOS logic gates** for **G** and **L**
- Implemented Boolean expressions directly in the **pull-down network**
- Used complementary pull-up networks for static CMOS correctness

### Results:

| Metric | Baseline | Optimized |
|------|---------|----------|
| Transistor Count | 56 | **52** |
| Custom Gates | None | **G & L PDN gates** |

This reduced area and simplified the critical path.

---

## ⏱️ Timing & Critical Path Analysis

### Critical Path
The longest delay occurs when the **MSBs (A1 or B1)** toggle:

