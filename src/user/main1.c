#include "kernel_api.h"
#include <stdint.h>

USER_CODE int main1(void) {
  uint32_t count = 1;
  while (count--) {

    user_printf("hello from main1.c\n\r");
    user_printf("hello from main1.c second time\n\r");
    user_printf("hello from main1.c third time\n\r");
  }
}
