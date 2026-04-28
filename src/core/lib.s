.syntax unified
.cpu cortex-m4
.thumb


.global __asm__set_psp
.type __asm__set_psp, %function 
__asm__set_psp:
    /* r0 contains the argument*/
    msr psp, r0
    bx lr

.global __asm__set_msp
.type __asm__set_msp, %function
__asm__set_msp:
    /* r0 contains the argument*/
    msr msp, r0
    bx lr

.section .usertext.launch_main1
.global __asm__launch_main1
.type   __asm__launch_main1, %function 
 __asm__launch_main1:

    mov r0, #3 
    msr control, r0 
    isb
    
    bl main1

