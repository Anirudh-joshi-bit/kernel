#pragma once

#include <stddef.h>
#include <stdbool.h>
#include "device/stm32f401xe.h"
#include "defines.h"

// linker script symbols ->
extern uint32_t _estack;

extern uint32_t _sFLASHKernelSpace;
extern uint32_t _sSRAMKernelSPACE;
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


// user process entry points
void main1(void);
void main2(void);

// syscalls
void syscall__printf (uint32_t a, uint32_t b, uint32_t c, uint32_t d);
void syscall__scanf (uint32_t a, uint32_t b, uint32_t c, uint32_t d);

// asm functions
void PendSV_Handler(void);

void __asm__copy_reg (uint32_t *addr);
void __asm__get_PRIMASK (uint32_t *addr);
void __asm__get_FAULTMASK (uint32_t *addr);
void __asm__get_BASEPRI (uint32_t *addr);
void __asm__set_psp (uint32_t value);
void __asm__set_msp (uint32_t value);
void __asm__launch_main1 (void);


void mpu_setup (void);
void __usart1_init (void);
void printf (const char* msg, uint32_t addr);
uint32_t _strlen (const char *msg);
uint32_t erase_flash (uint32_t address);
uint32_t flash_write (uint32_t dest, const char* src, uint32_t size, uint32_t delay);
void delay (uint32_t  count);
uint8_t queue_push (queue_t* q, user_process_t* process);
uint8_t queue_pop (queue_t* q);
void queue_init (queue_t* q, uint8_t size);
user_process_t* queue_front (queue_t *q);
