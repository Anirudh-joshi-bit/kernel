#pragma once

#include <stddef.h>
#include <stdbool.h>
#include "device/stm32f401xe.h"
#include "defines.h"
#include "stdarg.h"

// linker script symbols ->
extern uint32_t _estack;

extern uint32_t _sFLASHKernelSpace;
extern uint32_t _sSRAMKernelSpace;
extern uint32_t _FLASHKernelSpaceSize;
extern uint32_t _SRAMKernelSpaceSize;

extern uint32_t _sFLASHUserSpace;
extern uint32_t _sSRAMUserSpace;
extern uint32_t _FLASHUserSpaceSize; 
extern uint32_t _SRAMUserSpaceSize;

#define USER_STACK_END              0x20000000+32*1024
#define KERNEL_STACK_END            0x20000000+64*1024
#define USER_STACK_REGION_SIZE      32*1024
#define KERNEL_STACK_REGION_SIZE    32*1024
// this makes 6 regions


// syscalls
void syscall__printf (const char* msg, ...);
void syscall__scanf (const char* msg, ...);
void syscall__process_exit (uint32_t status);

// asm functions
void PendSV_Handler(void);
void __asm__set_psp (uint32_t value);
void __asm__set_msp (uint32_t value);
void __asm__launch_main1 (void);
void user_process_exit (void);  // unique case as process may or may not be calling this syscall directly


void schedular (void);
void mpu_setup (void);
void __usart1_init (void);
void printf (const char* msg, ... );
void process_exit (uint32_t status);
uint32_t _strlen (const char *msg);
void delay (uint32_t  count);

uint8_t queue_push (queue_t *q, user_process_t *process);
uint8_t queue_pop (queue_t *q);
void queue_init (queue_t *q);
user_process_t* queue_front (queue_t *q);
uint32_t queue_empty (queue_t *q);
uint32_t queue_size (queue_t *q);

void semaphore_init (semaphore_t *sema, uint8_t value);
void semaphore_lock (semaphore_t *sema);
void semaphore_unlock (semaphore_t *sema);

void enterCRITICAL (void);
void exitCRITICAL (void);

