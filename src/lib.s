.syntax unified
.cpu cortex-m4
.thumb


/* dont need to store the caller saved register (they can be safely overwritten)
 BUT for context switching, save all the registers !!!!

 arguments are stored in r0-r3... (if more arg -> stored in stack)
 */

   /*lr stores the return address */
/************************* defines ************************************/
.equ WAITING_STATE, 0x0
.equ RUNNING_STATE, 0x1
.equ IO_STATE,      0x2


/*************************NVIC_REG address*******************/
.equ ISPR, 0xE000E000+0x0100+0x100
.equ ICPR, 0xE000E000+0x0100+0x180
.equ IABR, 0xE000E000+0x0100+0x200


.equ RUNNING_PROCESS, 0x20017800+0x4
.equ PICKED_PROCESS, 0x20017800+0x8


/****************************** SysTick_Handler start ********************/
.section .text.SysTick_Handler
.global SysTick_Handler 
.type SysTick_Handler, %function
SysTick_Handler:
    /* 
    psp is not automatically set by hardware !!! do -> <msr PSP, r0>


    8 regs are saved into the psp before calling this isr => restore those
    registers into the process struct
    seq -> r0, r1, r2, r3, r12, lr, pc, psr
    inside the isr, msp is used but the reg values are pushed into the user stack
    therefor pop cannot be used directly !!!

    safe reg = r0-r3, r12 
    */

    /* dont need to dissable interrupts as interrupt will not change mask registers
    or control register ... though it can change the psr register but as psr is a 
    caller saved register it will be recovered before returning from the isr*/


    /************************ start saving reg*********************************/

    ldr r0, =RUNNING_PROCESS
    ldr r1, [r0]            // r1 now contain the struct address
    stmia r1!, {r4-r11}     // r4->r11 stored in the runnging process struct
    
    mrs r0, psp
    str r0, [r1]
    add r1, #4
    
    mrs r0, msp
    str r0, [r1]
    add r1, #4
    
    str lr, [r1]            // important !!! store the exec_return value
    add r1, #4

    mrs r0, FAULTMASK
    str r0, [r1]
    add r1, #4

    mrs r0, BASEPRI
    str r0, [r1]
    add r1, #4
                    
    mrs r0, PRIMASK     // at the end -> restore the primask 
    str r0, [r1]

    /*store the value of ispr, icpr, iabr regs into the struct*/
    // todo ********************************************************************


    /* coping the register into structure is done */
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
    ldr r1, [r0]
    ldmia r1!, {r4, r11}
   

    /* before setting psp, msp, faultmask, basepri -> mask all interrupt
    so that no interrupt can be fired in the middle of setting important regs*/
    mov r0, #1              
    msr PRIMASK, r0

    ldr r0, [r1]
    msr psp, r0
    add r1, #4
    
    ldr r0, [r1]
    msr msp, r0
    add r1, #4
    
    ldr lr, [r1]
    add r1, #4 

    ldr r0, [r1]
    msr FAULTMASK, r0
    add r1, #4
    
    ldr r0, [r1]
    msr BASEPRI, r0
    add r1, #4
    
    mov r2, r1 
    add r2, #4
    mov r3, #8
    b loop1

loop1 :
    sub r3, #1
    ldr r0, =ISPR
    ldr r12, [r2]
    add r2, #4
    str r12, [r0]
    add r0, #4
    
    cmp r3, #0
    bne loop1

    mov r3, #8
    b loop2   

loop2 :
    sub r3, #1
    ldr r0, =ICPR
    ldr r12, [r2]
    add r2, #4
    str r12, [r0]
    add r0, #4
    
    cmp r3, #0
    bne loop2


    mov r3, #8
    b loop3

loop3 :
    sub r3, #1
    ldr r0, =IABR
    ldr r12, [r2]
    add r2, #4
    str r12, [r0]
    add r0, #4
    
    cmp r3, #0
    bne loop3

    // do this in the end
    ldr r0, [r1]
    msr PRIMASK, r0
    add r1, #4


    bx lr

/****************************** SysTick_Handler end ********************/ 




.global __asm__get_PRIMASK
.type __asm__get_PRIMASK, %function
__asm__get_PRIMASK:
    /* r0 contains the address of process->PRIMASK */
    mrs r1, PRIMASK
    str r1, [r0]

    bx lr


.global __asm__get_FAULTMASK
.type __asm__get_FAULTMASK, %function
__asm__get_FAULTMASK:
    /* r0 contains the address of process->FAULTMASK */
    mrs r1, FAULTMASK
    str r1, [r0]

    bx lr

.global __asm__get_BASEPRI
.type __asm__get_BASEPRI, %function
__asm__get_BASEPRI:
    /* r0 contains the address of process->BASEPRI */
    mrs r1, BASEPRI 
    str r1, [r0]

    bx lr


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

.global __asm__switch_to_usermode
.type   __asm__switch_to_usermode, %function 
 __asm__switch_to_usermode:

    mov r0, #3 
    msr control, r0 
    isb
    bx lr
