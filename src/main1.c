#include "../us_include/kernel_api.h"


USER_CODE int main1(void) {
  uint32_t addr = 0xffffffff;

  int counter = 30;
  while (1) {
    if (!counter--) {
      *(uint32_t *)addr = 5;
    }
    user_printf("hello from main1.c\n\r", 0x0);
  }

  return addr;
}
