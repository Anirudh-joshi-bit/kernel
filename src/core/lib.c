#include "core.h"
#include "defines.h"
#include "usart.h"
#include <stdint.h>

void enterCRITICAL(void) { __disable_irq(); }

void exitCRITICAL(void) { __enable_irq(); }

extern semaphore_t sem_usart1;

uint32_t _strlen(const char *msg) {

  int i = 0;
  while (msg[i++] != '\0')
    ;
  return i - 1;
}

char *hex_str(uint32_t value, char *out) {

  char hex_char[] = "0123456789abcdef";
  out[0] = '0';
  out[1] = 'x';

  for (int i = 0; i < 8; i++) {
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
    int j = 9 - i;
    out[j] = hex_char[ind];
  }
}

void printf(const char *msg, uint32_t address) {

  uint32_t value = *((uint32_t *)address);
  uint32_t msg_size = _strlen(msg);

  if (msg_size + 9 > MAX_STR_SIZE) {
    __usart1_print("too large error message !!\n\r", MAX_STR_SIZE);
    return;
  }
  char hex[10];
  char __msg[MAX_STR_SIZE];

  uint32_t i = 0;
  int p = 0, q = 0;
  bool single_sub = false;

  for (; i < msg_size; i++) {

    if (msg[i] == '%' && !single_sub) {
      hex_str(value, hex);

      while (q - p < 10) {
        __msg[q++] = hex[q - p];
      }
      p++;
      single_sub = true;
    } else
      __msg[q++] = msg[p++];
  }
  __msg[q] = '\0';
  __usart1_print(__msg, _strlen(__msg));
}

void syscall__printf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
  semaphore_lock(&sem_usart1);
  printf((const char *)a, b);
  semaphore_unlock(&sem_usart1);
}

void syscall__scanf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {

  while (1)
    ;
}
