.syntax unified
.cpu cortex-m4
.thumb


/* dont need to store the caller saved register (they can be safely overwritten)
 BUT for context switching, save all the registers !!!!

 arguments are stored in r0-r3... (if more arg -> stored in stack)
 */

   /*lr stores the return address */
/************************* defines ************************************/
.equ READY_STATE, 0x0
.equ RUNNING_STATE, ~READY_STATE


/*************************NVIC_REG address*******************/
.equ ISPR, 0xE000E000+0x0100+0x100
.equ ICPR, 0xE000E000+0x0100+0x180
.equ IABR, 0xE000E000+0x0100+0x200


.equ KERNEL_SPACE_INIT, 0x20016000
.equ USER_SPACE_INIT,   0x2000c000
.equ RUNNING_PROCESS, KERNEL_SPACE_INIT+0x4
.equ PICKED_PROCESS, KERNEL_SPACE_INIT+0x8
.equ SYSCALL_TABLE_AD, KERNEL_SPACE_INIT+0xc



.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    push {lr}
    bl schedular
    pop {lr}

    /************************ start saving reg*********************************/
    ldr r0, =RUNNING_PROCESS
    ldr r1, [r0]            // r1 now contain the struct address
    
    ldr r0, =PICKED_PROCESS
    ldr r2, [r0]

    cmp r2, r1 
    it eq
    bxeq lr

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

    dsb

    /*store the value of ispr, icpr, iabr regs into the struct*/
    // todo ********************************************************************


    /* coping the register into structure is done */
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
    ldr r1, [r0]
    ldmia r1!, {r4-r11}
   

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
    
    // do this in the end
    ldr r0, [r1]
    msr PRIMASK, r0
    add r1, #4

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
    ldr r1, =RUNNING_PROCESS
    ldr r2, [r0]
    str r2, [r1]
    
    dsb

    bx lr


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
    

    /*****************set the PendSV interrupt*********************/
    
    ldr r0, =0xE000ED04      // Address of ICSR register
    ldr r1, =0x10000000      // Bit 28 (PENDSVSET)
    str r1, [r0]             // Set PendSV pending


    bx lr

/****************************** SysTick_Handler end ********************/ 


/************************SCV_Handler start**************************/ 
.section .text.SVC_Handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler:
    /* r0, r1, r2, r3 stores the arguments of systemcall */
    push {r0, r1, r2, r3}

    mrs r0, psp  /*assumption -> kernel will never call svc*/
    add r0, #24 /* retrieve the old pc that is stacked*/
    ldr r1, [r0]
    sub r1, #2      /*move 2 bytes before to get the scv immidiate*/
    ldrb r0, [r1]   /*r0 now contains the immidiate value*/

    
    ldr r2, =SYSCALL_TABLE_AD
    ldr r1, [r2]            // r1 contains the address of syscall_table
                            // r0 contains the immidate value
    
    mov r3, #4
    mul r0, r3 
    add r1, r0 

    mov r12, r1            // store the address of service function in r12
    ldr r12, [r12]

    pop {r0, r1, r2, r3}

    push {lr}
    blx r12
    pop {lr}


    bx lr

.size SVC_Handler, . - SVC_Handler 
/**************************SCV_Handler end**************************/ 




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
