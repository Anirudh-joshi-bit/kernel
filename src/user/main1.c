#include "kernel_api.h"

USER_CODE int main1(void) {
  while (1) {

    user_printf("hello from main1.c\n\r", 0x0);
    user_printf("hello from main1.c second time\n\r", 0x0);
    user_printf("hello from main1.c third time\n\r", 0x0);
  }

  return 0;
}
