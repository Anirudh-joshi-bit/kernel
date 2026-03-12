#include "../us_include/kernel_api.h"



int main1 (void ){
    uint32_t addr = 0xffffffff;
    *(uint32_t*) addr = 5;


    while (1){
        user_printf("hello from main1.c\n\r", 0x0);
    }

    return addr;


}
