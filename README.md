# Minimal Preemptive Kernel for ARM Cortex-M4 (STM32F401RE)

A minimal **preemptive operating system kernel** implemented for the
**ARM Cortex-M4 (STM32F401RE)** to explore low‑level operating system
design on embedded hardware.

This project demonstrates how a lightweight kernel can manage multiple
isolated processes while implementing:

-   preemptive scheduling
-   context switching
-   privilege separation
-   memory protection
-   fault isolation

The purpose of this project is educational: to understand how core OS
mechanisms work on ARM Cortex‑M microcontrollers.

------------------------------------------------------------------------

# System Overview

The kernel runs on the **STM32F401RE (ARM Cortex-M4)** microcontroller
and provides a small **multi‑process execution environment**.

Scheduling is driven by the **SysTick timer**, while **PendSV performs
context switching**.

Current system capabilities:

-   preemptive multitasking
-   kernel / user privilege separation
-   MPU‑based memory protection
-   fault isolation between processes
-   atomic critical sections using interrupt masking

------------------------------------------------------------------------

# Core Kernel Architecture

## Dual Stack Model (MSP / PSP)

The Cortex‑M architecture provides two stack pointers.

### MSP --- Main Stack Pointer

Used by: - kernel code - exception handlers - interrupt handlers

### PSP --- Process Stack Pointer

Used by: - user processes running in thread mode

This design prevents kernel stack corruption by user processes.

------------------------------------------------------------------------

# Privilege Separation

The system uses the ARM privilege model.

  Mode           Purpose
  -------------- ------------------
  Privileged     Kernel execution
  Unprivileged   User processes

User processes cannot execute privileged instructions or access
protected kernel memory. All kernel services are accessed through **SVC
system calls**.

------------------------------------------------------------------------

# System Call Interface (SVC)

User processes request kernel services using the **SVC (Supervisor
Call)** exception.

Execution flow:

User Process → SVC Instruction → SVC Handler → Kernel Service → Return
to User

This ensures controlled interaction between user programs and the
kernel.

------------------------------------------------------------------------

# Scheduling System

## Preemptive Scheduling using SysTick

A periodic **SysTick interrupt** drives scheduling.

The SysTick handler triggers a context switch by setting the **PendSV
pending bit**:

``` c
SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
```

------------------------------------------------------------------------

## Context Switching using PendSV

During exception entry, hardware automatically saves:

    r0 r1 r2 r3 r12 LR PC xPSR

The kernel manually saves:

    r4 – r11

Context switching steps:

1.  Save current process registers
2.  Select next runnable process
3.  Restore the selected process context
4.  Resume execution

PendSV runs at the **lowest interrupt priority**, making it ideal for
context switching.

------------------------------------------------------------------------

# Process Management

The kernel currently supports **up to 10 processes**.

Each process contains:

-   Process Control Block (PCB)
-   user stack
-   kernel stack
-   process state
-   MPU configuration

------------------------------------------------------------------------

# Process States

  State     Description
  --------- ----------------------
  RUNNING   Currently executing
  READY     Waiting for CPU
  WAITING   Waiting for an event
  SUSPEND   Temporarily disabled

The scheduler selects processes from the **READY queue**.

------------------------------------------------------------------------

# Round‑Robin Scheduler

The kernel uses a **round‑robin scheduling algorithm**.

Example:

``` c
current_task = (current_task + 1) % NUM_TASKS;
```

This ensures fair CPU time distribution among processes.

------------------------------------------------------------------------

# Critical Section Protection

The kernel uses `semaphore` to prevent the race condition.

Example:

``` c
semaphore_lock(&sem_usart1);

/* critical section */

semaphore_unlock(&sem_usart1);
```

Implementation:

. Each semaphore maintains a value and a waiting queue for blocked processes.
. When a process acquires an available semaphore, the semaphore value is decremented by 1.
. If a process attempts to acquire an unavailable semaphore, it is removed from the ready queue and placed in the semaphore's waiting queue until the semaphore becomes available.
. When a process exits a critical section, it calls semaphore_unlock(&sem_usart1). The kernel checks the semaphore's waiting queue and, if a process is waiting, moves it back to the ready queue and updates the semaphore state accordingly.


------------------------------------------------------------------------

# Why Interrupt Masking Works

The Cortex‑M4 is a **single‑core processor**.

Only one instruction stream executes at a time. Concurrency occurs only
when a task is interrupted by an ISR.

If interrupts are disabled:

no interrupt → no preemption → no concurrent access

Therefore the critical section becomes **atomic**.

Because of this property:

-   mutexes are unnecessary
-   semaphores are unnecessary
-   interrupt masking is sufficient

This technique is commonly used in **small embedded kernels and
lightweight RTOS implementations**.

------------------------------------------------------------------------

# Fault Handling

The kernel implements fault diagnostics for:

-   Memory Management Fault
-   Bus Fault
-   Hard Fault

The fault handler reports:

-   faulting instruction
-   program counter (PC)
-   fault address
-   fault status registers

### User Process Fault

If a user process triggers a fault:

-   the process is terminated
-   other processes continue running

### Kernel Fault

If the kernel triggers a fault:

-   the system enters **kernel panic**

------------------------------------------------------------------------

# Memory Protection (MPU)

The **ARM Memory Protection Unit (MPU)** isolates memory regions.

This ensures:

-   user processes cannot access kernel memory
-   processes cannot overwrite each other's memory
-   illegal accesses generate faults

MPU configuration is updated during **context switching**.

------------------------------------------------------------------------

# Memory Layout

## SRAM Layout (96 KB)

SRAM │ ├── Kernel Stack ├── User Stack Region ├── User Data Region └──
Kernel Data

------------------------------------------------------------------------

## Flash Layout

FLASH │ ├── Vector Table ├── Kernel Code └── User Programs

------------------------------------------------------------------------

# Hardware Platform

Board: **STM32F401RE**\
Processor: **ARM Cortex‑M4**

Architecture features used:

-   MSP / PSP stack model
-   SVC exception
-   SysTick timer
-   PendSV exception
-   Memory Protection Unit (MPU)

------------------------------------------------------------------------

# Development Environment

Operating System: **Arch Linux**

Tools:

-   arm-none-eabi-gcc
-   GDB
-   OpenOCD

Languages:

-   C
-   ARM Assembly

------------------------------------------------------------------------

# References

**Operating Systems: Three Easy Pieces (OSTEP)**\
Remzi H. Arpaci‑Dusseau\
Andrea C. Arpaci‑Dusseau

**The Definitive Guide to ARM Cortex‑M3 and Cortex‑M4 Processors**\
Joseph Yiu

------------------------------------------------------------------------

# Author

Aniruddha Joshi

------------------------------------------------------------------------

# Demo

https://youtu.be/Hs2-LNs8Tdw
