#include "../include/commons.h"


void make_process(user_process_t *p){
    // populate the RUNNING_PROCESS address with the current process

    *((user_process_t *)(RUNNING_PROCESS_AD)) = *p;
    __asm__copy_reg ();
    
}

