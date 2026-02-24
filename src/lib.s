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


/*************************RUNNING_PROCESS constants********************/
.equ PROCESS_ST_SIZE,       23*4 
.equ RUNNING_PROCESS,       0x20000000      
.equ R_GPREG,               RUNNING_PROCESS   
.equ R_PSP,                 RUNNING_PROCESS+13*4
.equ R_MSP,                 R_PSP + 4
.equ R_LR,                  R_MSP + 4
.equ R_PC,                  R_LR + 4
.equ R_xPSR,                R_PC + 4
.equ R_PRIMASK,             R_xPSR + 4
.equ R_FAULTMASK,           R_PRIMASK + 4
.equ R_BASEPRI,             R_FAULTMASK + 4
.equ R_CONTROL,             R_BASEPRI + 4


/*************************PICKED_PROCESS constants********************/
.equ PICKED_PROCESS,        RUNNING_PROCESS + PROCESS_ST_SIZ
.equ P_GPREG,               PICKED_PROCESS   
.equ P_PSP,                 PICKED_PROCESS+13*4
.equ P_MSP,                 P_PSP + 4
.equ P_LR,                  P_MSP + 4
.equ P_PC,                  P_LR + 4
.equ P_xPSR,                P_PC + 4
.equ P_PRIMASK,             P_xPSR + 4
.equ P_FAULTMASK,           P_PRIMASK + 4
.equ P_BASEPRI,             P_FAULTMASK + 4
.equ P_CONTROL,             P_BASEPRI + 4


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

    
    ldr r1, =address
    mrs r2, PSP
    ldr r0, [r2]
    add r2, #4
    str r0, [r1]
    add r1, #4
    mov r0, r1  

    ldr r1, [r2]
    add r2, #4
    str r1, [r0]
    add r0, #4
    mov r1, r2 

    /* r0 = address, r1 = psp */
    ldr r2, [r1]
    add r1, #4
    str r2, [r0]
    add r0, #4

    ldr r3, [r1]
    add r1, #4
    str r3, [r0]
    add r0, #4

    /* done r0, r1, r2, r3... todo -> r12, lr, pc, psr */
    stmia r0!, {r4-r11}
     
    ldr r12, [r1]
    add r1, #4
    str r12, [r0]
    add r0, #4
    /* done saving r12 */
    
    /*store psp, msp*/
    mrs r2, PSP 
    sub r2, #32         // jump 8 word down
    str r2, [r0]
    add r0, #4
    mrs r2, MSP         // there will not be any push to the msp as user stack will  
    str r2, [r0]        // be used for stacking 8 word => we can safely store the msp
    add r0, #4

    /*store lr*/
    ldr r2, [r1]
    add r1, #4
    str r2, [r0]
    add r0, #4

    /*store pc*/
    ldr r2, [r1]
    add r1, #4
    str r2, [r0]
    add r0, #4

    /*store psr*/
    ldr r2, [r1]
    add r1, #4
    str r2, [r0]
    add r0, #4
    

    /* store all the special registers  (dont need to store psp anymore)*/
    mrs r1, PRIMASK
    str r1, [r0]
    add r0, #4


    mrs r1, FAULTMASK
    str r1, [r0]
    add r0, #4

    mrs r1, BASEPRI 
    str r1, [r0]
    add r0, #4

    mrs r1, CONTROL 
    str r1, [r0]
    add r0, #4

    /* coping the register into structure is done */
    /* now copy the struct into register => run different process */


    








/****************************** SysTick_Handler end ********************/


.section .text.lib_s

.global over_write_reg
.type over_write_reg, %function

over_write_reg:
   MOV r0, #222
   MOV r1, #333
   MOV r2, #334
   MOV r3, #335
   MOV r4, #336
   MOV r5, #337
   MOV r6, #338
   MOV r7, #339
   MOV r8, #340
   MOV r9, #341
   MOV r10, #342
   MOV r11, #343
   MOV r12, #344

   BX LR         



.global __asm__copy_reg
.type __asm__copy_reg, %function
__asm__copy_reg:
/*1. store all the registers of the running process in its reg*/ 
/*2. load all the register with value from picked process st*/ 
    


    /* gpreg copy */
    push {r0}
    ldr r0, =RUNNING_PROCESS
    add r0, #4
    stmia r0, {r1-r12}
    sub r0, #4
    mov r1, r0
    pop {r0}
    str r0, [r1]
    
    ldr r0, =R_PSP
    mrs r1, PSP 
    str r1, [r0]

    mrs r1, MSP 
    str r1, [r0, #4]!

    str r14, [r0, #4]!
    str r15, [r0, #4]!
    
    mrs r1, APSR 
    str r1, [r0, #4]!
    mrs r1, IPSR
    str r1, [r0, #4]!
    mrs r1, EPSR
    str r1, [r0, #4]!

    mrs r1, PRIMASK 
    str r1, [r0, #4]!

    mrs r1, FAULTMASK 
    str r1, [r0, #4]!
    
    mrs r1, BASEPRI
    str r1, [r0, #4]!
    
    mrs r1, CONTROL
    str r1, [r0, #4]!

  /* done */  
    bx lr

