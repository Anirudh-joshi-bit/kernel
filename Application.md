# Application and Future Scope

## Purpose

This project is a small preemptive multitasking kernel developed for the STM32F401RE (ARM Cortex-M4).

It allows an embedded application to be divided into multiple independent processes. Each process has its own stack and execution context, while the kernel manages scheduling and context switching.

For example, an embedded device could organise its work into separate processes for sensor reading, UART communication, display updates, and data logging. This can make application code more modular than placing all functionality in one large superloop.

## What the Current Kernel Provides

- Multiple user processes with separate execution contexts.
- Preemptive context switching and round-robin scheduling.
- SVC-based system-call mechanism.
- Process termination through `process_exit`. The kernel places `user_process_exit()` in the initial LR slot, so a process that returns transfers control to the kernel exit routine.
- Avoidance of unnecessary context switching when only one process is runnable.
- `printf`-based output for debugging and observing process execution.

## Potential Applications

The kernel can serve as an experimental execution framework for small embedded applications that need multiple independent activities, such as monitoring devices, data loggers, communication controllers, or simple IoT devices.

At its current stage, it is primarily a learning and development project demonstrating process execution, context switching, system calls, and process lifecycle management. It is not a complete RTOS and does not yet provide the timing, waiting, or synchronisation facilities required by many practical embedded applications.

## Future Scope

Possible future improvements include:

- Timer-based delays and periodic execution.
- Process blocking and event-based wake-up.
- Semaphores, mutexes, and inter-process communication.
- Input handling and a more complete process I/O interface.
- MPU-based memory protection to restrict access between user processes and kernel memory.
- Improved scheduling policies and fault handling.

These are planned areas for exploration, not features implemented in the current version.

## Platform

- **Microcontroller:** STM32F401RE
- **Processor:** ARM Cortex-M4
- **Development approach:** Bare-metal, CMSIS/register-level development
