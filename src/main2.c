#include "../us_include/kernel_api.h"

//void printf (const char *string, uint32_t addr);


USER_CODE int main2 (void ){   
    
//     printf ("accessing kernel code \n\r", 0x0);
    while (1){
        user_printf ("((((((((((hello from main2.c\n\r", 0x0);
    }
}
