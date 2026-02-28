Minimal Preemptive Kernel on ARM Cortex-M3
Overview
This project implements a minimal preemptive kernel on ARM Cortex-M3 completely from scratch, without using any RTOS frameworks.

The kernel supports task context switching using the PendSV exception, configured at the lowest priority to ensure safe deferred context switching. The task stack layout is manually designed to match the Cortex-M exception entry stacking format (R0–R3, R12, LR, PC, xPSR), and additional saving/restoring of R4–R11 is implemented inside the PendSV handler.

Features
Task Control Block (TCB) design

PSP-based thread execution

SysTick-based preemption

SVC-based system call mechanism

Proper handling of EXC_RETURN values (e.g., 0xFFFFFFFD)

Debugging via GDB to verify register state and stack correctness

What I Learned
Through this project, I gained a deep understanding of:

ARM exception entry/exit mechanism

MSP vs PSP usage

Interrupt priority behavior

Privilege levels (Thread vs Handler mode)

Low-level ABI conventions

How real RTOS kernels manage scheduling
