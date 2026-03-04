.syntax unified
.cpu cortex-m4
.thumb 

.section .text.user_lib_s
.global user_printf
.type user_printf, %function
user_printf:
    /* r0 -> string, r1 -> address*/
    svc #0
    bx lr

