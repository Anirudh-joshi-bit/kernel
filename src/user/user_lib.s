.syntax unified
.cpu cortex-m4
.thumb 

.section .usertext
.global user_printf
.type user_printf, %function
user_printf:
    /* r0 -> string, r1 -> address*/
    // there are n number of arguments in printf function ... 4 are stored in 
    // the regiser and rest will be in the stack
    svc #0
    bx lr


.section .usertext
.global user_process_exit
.type user_process_exit, %function
user_process_exit:
    svc #2
    bx lr

