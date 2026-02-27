#pragma once

#include <stddef.h>
#include <stdbool.h>
#include "device/stm32f401xe.h"
#include "defines.h"

// user process entry points
void main1(void);
void main2(void);


// asm functions
extern void __asm__copy_reg (uint32_t *addr);
extern void __asm__get_PRIMASK (uint32_t *addr);
extern void __asm__get_FAULTMASK (uint32_t *addr);
extern void __asm__get_BASEPRI (uint32_t *addr);
extern void __asm__set_psp (uint32_t value);
extern void __asm__set_msp (uint32_t value);
extern void __asm__switch_to_usermode (void);


void __usart1_init (void);
void printf (const char* msg, uint32_t addr);
uint32_t strlen (const char *msg);
uint32_t erase_flash (uint32_t address);
uint32_t flash_write (uint32_t dest, const char* src, uint32_t size, uint32_t delay);
void delay (uint32_t  count);

