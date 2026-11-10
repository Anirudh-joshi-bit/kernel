#include "kernel_api.h"

USER_CODE int main2(void) {
  int count = 1;
  while (count --) {
    user_printf("((((((((((hello from main2.c\n\r", 0x0);
  }
//  while (1);
}
