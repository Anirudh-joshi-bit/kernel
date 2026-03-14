#pragma once

#include <stdbool.h>
#include <stdint.h>


#define USER_CODE    __attribute__((section(".usertext")))
#define USER_DATA    __attribute__((section(".userdata")))
#define USER_BSS     __attribute__((section(".userbss")))
#define USER_RODATA  __attribute__((section(".userrodata")))

/**************** syscalls **************************/
USER_CODE void user_printf (const char *string, uint32_t addr);

