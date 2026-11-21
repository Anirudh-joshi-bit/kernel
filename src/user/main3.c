#include "kernel_api.h"

USER_CODE int main3 (void){
  int count = 10;
  // returning
  user_printf ("returning from main3 before printing anything \n\r", 0x0);
  user_process_exit();

    while (count--){
        user_printf (">>>>>>>>>>hello from main3.c\n\r", 0x0);
    }
}
