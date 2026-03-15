# Minimal Preemptive Kernel for ARM Cortex-M4 (STM32F401RE)

A minimal **preemptive operating system kernel** implemented for the
**ARM Cortex-M4 (STM32F401RE)** to explore low-level OS design,
exception handling, context switching, memory protection, and
synchronization mechanisms.

This project demonstrates how a small embedded kernel can manage
**multiple isolated user processes**, perform **preemptive scheduling**,
implement **synchronization primitives**, and provide **fault
isolation** using the ARM Cortex-M architecture.

------------------------------------------------------------------------

# System Overview

The kernel runs on the **STM32F401RE (ARM Cortex-M4)** and provides a
small multi-process execution environment.

Scheduling is driven by the **SysTick timer**, while **PendSV performs
context switching**.

The system supports:

-   Preemptive multitasking
-   Kernel / user privilege separation
-   Memory protection using MPU
-   Fault isolation between processes
-   Semaphore based synchronization

------------------------------------------------------------------------

# Core Kernel Architecture

## MSP / PSP Stack Separation

The kernel uses the two stack pointers provided by the ARM Cortex-M
architecture.

**MSP (Main Stack Pointer)**\
Used by: - kernel code - exception handlers - interrupt handlers

**PSP (Process Stack Pointer)**\
Used by: - user processes running in thread mode

This ensures kernel execution and user tasks never share the same stack.

------------------------------------------------------------------------

## Privilege Separation

The kernel uses ARM's privilege model.

  Mode                Purpose
  ------------------- ------------------
  Privileged Mode     Kernel execution
  Unprivileged Mode   User processes

User code cannot execute privileged instructions or access kernel memory
directly.

All kernel services must be requested through **SVC system calls**.

------------------------------------------------------------------------

# System Call Interface (SVC)

User processes interact with the kernel using the **SVC (Supervisor
Call)** exception.

Typical flow:

User Process\
→ SVC instruction\
→ SVC Handler\
→ Kernel executes requested service\
→ Return to user mode

This allows controlled access to kernel functionality and hardware
resources.

------------------------------------------------------------------------

# Scheduling System

## Preemptive Scheduling using SysTick

A **SysTick interrupt** generates periodic scheduling ticks.

The SysTick handler sets the **PendSV interrupt pending bit** to trigger
context switching.

``` c
SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
```

------------------------------------------------------------------------

## Context Switching with PendSV

PendSV performs the actual task switch.

Hardware automatically saves:

    r0 r1 r2 r3 r12 LR PC xPSR

The kernel manually saves:

    r4 – r11

After saving the context, the scheduler selects the next runnable task
and restores its context.

PendSV runs at the **lowest interrupt priority**, making it ideal for
context switching.

------------------------------------------------------------------------

# Process Management

The kernel currently supports **up to 20 processes**.

Each process has:

-   Process Control Block (PCB)
-   independent user stack
-   independent kernel stack
-   process state information
-   MPU configuration

------------------------------------------------------------------------

## Process States

The kernel implements four process states:

  State     Description
  --------- ------------------------
  RUNNING   Currently executing
  READY     Waiting for CPU
  WAITING   Waiting for a resource
  SUSPEND   Temporarily disabled

The scheduler only selects **READY processes**.

Processes in the WAITING state cannot execute until the resource becomes
available.

------------------------------------------------------------------------

# Round Robin Scheduler

The scheduler currently uses a **round-robin algorithm**.

Example logic:

``` c
current_task = (current_task + 1) % NUM_TASKS;
```

This ensures fair CPU sharing among processes.

------------------------------------------------------------------------

# Semaphore Synchronization

The kernel includes **semaphore based synchronization**.

## Lock Operation

When a process attempts to acquire a locked semaphore:

1.  `semaphore.value--`
2.  If the resource is unavailable:
    -   process state changes **RUNNING → WAITING**
    -   process is pushed into the **semaphore waiting queue**
    -   scheduler is invoked via **PendSV**

This prevents busy waiting and allows other processes to run.

------------------------------------------------------------------------

## Unlock Operation

When a semaphore is released:

1.  `semaphore.value++`
2.  If the value becomes `1`, the resource becomes available.
3.  If the waiting queue is not empty:
    -   remove a process from the waiting queue
    -   change its state **WAITING → READY**
    -   push it into the ready queue

------------------------------------------------------------------------

# Fault Handling

The kernel implements detailed **fault diagnostics**.

Supported faults include:

-   Memory Management Fault
-   Bus Fault
-   Hard Fault

The fault handler prints:

-   faulting instruction
-   program counter (PC)
-   fault address
-   status registers

### User Process Fault

If a **user process causes a fault**:

-   the process is terminated
-   other processes continue running

### Kernel Fault

If the **kernel causes a fault**:

-   the system enters **kernel panic**

------------------------------------------------------------------------

# Memory Protection (MPU)

The **ARM Memory Protection Unit (MPU)** is used to isolate memory
regions.

MPU ensures:

-   user processes cannot access kernel memory
-   processes cannot corrupt each other
-   illegal accesses generate memory faults

MPU regions are reconfigured during **context switching**.

------------------------------------------------------------------------

# Memory Layout

The system uses a **manually designed linker script**.

## SRAM Layout (96 KB)

    SRAM
    │
    ├── Kernel Stack
    ├── User Stack Region (32 KB)
    ├── User Data Region (32 KB)
    └── Kernel Data (16 KB)

This layout provides strong memory isolation.

------------------------------------------------------------------------

## Flash Layout

    FLASH
    │
    ├── Vector Table
    ├── Kernel Code + Kernel Data
    └── User Code + User Data

Example allocation:

    64 KB → Kernel
    64 KB → User programs

------------------------------------------------------------------------

# Hardware Platform

Board: **STM32F401RE**\
Processor: **ARM Cortex-M4**

Architecture features used:

-   MSP / PSP stack model
-   SVC exception
-   SysTick timer
-   PendSV exception
-   MPU (Memory Protection Unit)

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

# Concepts Explored

Through this project:

-   ARM exception handling
-   context switching on Cortex-M
-   semaphore synchronization
-   process scheduling
-   memory protection using MPU
-   privilege separation
-   linker script based memory layout
-   low level debugging using GDB

------------------------------------------------------------------------

# References

This project was strongly inspired by the following resources:

-   **Operating Systems: Three Easy Pieces (OSTEP)**\
    Authors: Remzi H. Arpaci-Dusseau and Andrea C. Arpaci-Dusseau

-   **The Definitive Guide to ARM Cortex-M3 and Cortex-M4 Processors**\
    Author: Joseph Yiu

These resources were extremely helpful in understanding **operating
system design concepts**, **ARM exception handling**, and **embedded
kernel implementation**.

------------------------------------------------------------------------

# Demo

https://youtu.be/Hs2-LNs8Tdw

------------------------------------------------------------------------

# Author

**Aniruddha Joshi**
