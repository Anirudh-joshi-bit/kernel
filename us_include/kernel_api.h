#pragma once

#include <stdbool.h>
#include <stdint.h>



/**************** syscalls **************************/
void led_write (bool led_num, bool value);
void user_printf (const char *string, uint32_t addr);

