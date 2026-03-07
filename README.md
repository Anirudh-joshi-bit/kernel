# Minimal Preemptive Kernel for ARM Cortex-M4 (STM32F401RE)

A minimal **preemptive embedded kernel** implemented for the **ARM
Cortex-M4 (STM32F401RE)** to explore low-level operating system design,
ARM exception handling, and context switching mechanisms.

This project demonstrates how a small kernel can manage **multiple user
processes**, perform **preemptive scheduling**, and provide **system
calls** using the ARM exception model.

------------------------------------------------------------------------

# System Overview

The kernel runs on the **STM32F401RE (ARM Cortex-M4)** and supports
**two user processes** running concurrently.

Scheduling is driven by the **SysTick timer**, while **PendSV performs
context switching**.

## Scheduling Flow

``` mermaid
flowchart TD
    A[User Process] -->|SysTick Interrupt| B[SysTick Handler]
    B -->|Set PendSV Pending| C[PendSV Handler]
    C --> D[Context Save / Restore]
    D --> E[Scheduler Selects Next Task]
    E --> F[Next User Process]
```

------------------------------------------------------------------------

# Core Kernel Features

## 1. MSP / PSP Separation

The kernel uses the two stack pointers provided by the ARM Cortex-M
architecture.

**MSP (Main Stack Pointer)**\
Used by: - kernel code\
- exception handlers\
- interrupt handlers

**PSP (Process Stack Pointer)**\
Used by: - user processes running in thread mode

This ensures that **kernel execution and user tasks do not share the
same stack**.

------------------------------------------------------------------------

## 2. User and Kernel Privilege Separation

The system uses the ARM privilege model.

  Mode                Purpose
  ------------------- ------------------
  Privileged Mode     Kernel execution
  Unprivileged Mode   User processes

User processes cannot directly access privileged operations or hardware.

All requests to the kernel must go through **system calls using the SVC
instruction**.

------------------------------------------------------------------------

## 3. System Call Interface (SVC)

User processes interact with the kernel using the **SVC (Supervisor
Call) exception**.

Example flow:

    User Process
         |
         | SVC instruction
         v
    SVC Handler
         |
    Kernel performs requested operation
         |
    Return to user mode

This mechanism allows controlled access to hardware resources such as
**USART output**.

------------------------------------------------------------------------

## 4. Preemptive Scheduling using SysTick

A **SysTick timer interrupt** generates periodic scheduling ticks.

The SysTick handler:

-   updates scheduling logic\
-   sets the **PendSV interrupt pending bit**

``` c
SCB->ICSR |= SCB_ICSR_PENDSVSET_Msk;
```

The actual context switch is deferred to the **PendSV handler**.

------------------------------------------------------------------------

## 5. Context Switching in PendSV

The **PendSV exception** performs task switching.

### Why PendSV?

-   designed specifically for context switching\
-   runs at the **lowest interrupt priority**\
-   executes only after other interrupts finish

### Hardware automatically saves

    r0
    r1
    r2
    r3
    r12
    LR
    PC
    xPSR

### Kernel saves manually

    r4 – r11

The scheduler then selects the next process and restores its context.

------------------------------------------------------------------------

## 6. Round-Robin Scheduler

The kernel currently uses a simple **round-robin scheduling algorithm**.

Example logic:

``` c
current_task = (current_task + 1) % NUM_TASKS;
```

This allows fair CPU time sharing between tasks.

------------------------------------------------------------------------

## 7. Multiple User Processes

The kernel supports **two independent user processes**.

Each process has:

-   its own **user stack**
-   its own **kernel stack**
-   independent **PSP context**

Both tasks print messages to the terminal through **kernel syscalls**.

------------------------------------------------------------------------

# Memory Layout

The system uses a **manually designed RAM layout** to isolate kernel and
task memory regions.

    0x20018000 – 0x200177FF   Kernel startup / initialization region
    0x20017800 – 0x20011BFF   Process 1 kernel stack
    0x20011C00 – 0x2000BFFF   Process 2 kernel stack
    0x2000C000 – 0x20006FFF   Process 1 user stack
    0x20007000 – 0x20001FFF   Process 2 user stack
    0x20002000 – 0x20000000   .data and .rodata sections

This layout ensures:

-   stack isolation between processes\
-   separation of kernel and user stacks\
-   predictable memory usage

------------------------------------------------------------------------

# Hardware Platform

Board: **STM32F401RE**\
Processor: **ARM Cortex-M4**

Architecture features used:

-   MSP / PSP stack model\
-   SVC exception\
-   SysTick timer\
-   PendSV exception\
-   ARM exception stack frame

------------------------------------------------------------------------

# Example Output

    hello from main1.c
    hello from main2.c
    hello from main1.c
    hello from main2.c

This demonstrates successful **task switching between independent
processes**.

------------------------------------------------------------------------

# Development Environment

Operating System: **Linux (Arch Linux)**

Tools:

-   arm-none-eabi-gcc\
-   GDB\
-   OpenOCD

Languages:

-   C\
-   ARM Assembly

------------------------------------------------------------------------

# What I Learned

Through this project I gained practical experience with:

-   ARM Cortex-M exception handling\
-   hardware-assisted context switching\
-   stack management using MSP and PSP\
-   privilege level separation\
-   system call implementation using SVC\
-   interrupt-driven scheduling\
-   low-level debugging using GDB\
-   memory layout design in embedded systems

------------------------------------------------------------------------

# References

**The Definitive Guide to the ARM Cortex-M3**\
Author: **Joseph Yiu**

------------------------------------------------------------------------

# Possible Future Improvements

-   dynamic task creation\
-   mutex and semaphore support\
-   priority-based scheduling\
-   task sleep / delay mechanism\
-   memory protection using MPU\
-   inter-process communication (IPC)

------------------------------------------------------------------------

# Author

Aniruddha Joshi
