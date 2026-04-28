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
.equ BusFault_Identifier, 0x0
.equ MemManage_Identifier, 0x1
.equ UsageFault_Identifier, 0x2
.equ FAULT_IN_USERPROC,     0x0 
.equ FAULT_IN_KERNEL,       0x1


/*************************NVIC_REG address*******************/
.equ ISPR, 0xE000E000+0x0100+0x100
.equ ICPR, 0xE000E000+0x0100+0x180
.equ IABR, 0xE000E000+0x0100+0x200
.equ PSP, 0xfffffffd

.equ KERNEL_SPACE_INIT, 0x20016000
.equ USER_SPACE_INIT,   0x2000c000
.equ RUNNING_PROCESS, KERNEL_SPACE_INIT+0x4
.equ PICKED_PROCESS, KERNEL_SPACE_INIT+0x8
.equ SYSCALL_TABLE_AD, KERNEL_SPACE_INIT+0xc


.section .text.Reset_Handler
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
    B main
hang:
    B .

.size Reset_Handler, . - Reset_Handler

.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .

.size Default_Handler, . - Default_Handler


.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .

.size NMI_Handler, . - NMI_Handler


.section .text.DebugMon_Handler
.global DebugMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .

.size DebugMon_Handler, . - DebugMon_Handler


.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    cpsid i

    push {lr}
    bl schedular
    pop {lr}

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

    ldr r0, [r1]
    msr psp, r0
    add r1, #4
    
    ldr r0, [r1]
    msr msp, r0
    add r1, #4
    
    ldr lr, [r1]

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
    ldr r1, =RUNNING_PROCESS
    ldr r2, [r0]
    str r2, [r1]
    
    dsb

    cpsie i

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

    tst lr, #4
    ite eq
    mrseq r0, msp
    mrsne r0, psp

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

/***********************BusFault_Handler start**********************/

// r0 -> pc, r1 -> fault type, r2 -> fault in kernel / userproc
.section .text.BusFault_Handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler:
    ldr r0, =0xfffffffd
    cmp lr, r0
    ittee eq 
    mrseq r0, psp
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
    mrsne r0, msp
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper

    /* find pc */
    ldr r0, [r0, #24]
    mov r1, BusFault_Identifier
    push {lr}
    bl fault_handler_helper
    pop {lr}

    bx lr

.size BusFault_Handler, . - BusFault_Handler

/***********************BusFault_Handler end************************/


/***********************MemManage_Handler start************************/
.section .text.MemManage_Handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler:
    ldr r0, =0xfffffffd 
    cmp lr, r0 

    ittee eq 
    mrseq r0, psp
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
    mrsne r0, msp
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
    
    /* find pc */
    ldr r0, [r0, #24]
    mov r1, MemManage_Identifier
    push {lr}
    bl fault_handler_helper
    pop {lr}

    bx lr

.size MemManage_Handler, . - MemManage_Handler

/***********************MemManage_Handler end************************/

/***********************UsageFault_Handler start*********************/

.section .text.UsageFault_Handler
.global UsageFault_Handler 
.type UsageFault_Handler, %function
UsageFault_Handler:
    ldr r0, =0xfffffffd 
    cmp lr, r0 

    ittee eq 
    mrseq r0, psp
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
    mrsne r0, msp
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
    
    /* find pc */
    ldr r0, [r0, #24]
    mov r1, UsageFault_Identifier
    push {lr}
    bl fault_handler_helper
    pop {lr}
    
    bx lr

.size UsageFault_Handler, . - UsageFault_Handler



/***********************UsageFault_Handler end*********************/


/**********************HardFault_Handler start************************/
/* there is no "helper" function to handle hardfault
 *
 * DONOT use printf (we dont want LOCKUP state)..
 * if stack is corrupted or any other fault occured in hardfault handler ->
 * lockup !!
 *
 * do the minimum operation in the hardfault and nmi handler
 *

    HardFault is the endpoint of our kernel... there is no returning from this !!!
    problem with printing inside HardFault_Handler -> if stack is corrupted calling
    printf function will result in lockup state !!!!

    soln... as Hardfault is the end point, we can safely change the msp to any valid 
    address ..... change the msp to end of SRAM and call printf function
    we will not use psp => no need to alter it
 */

.section .text.HardFault_Handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler:

    ldr r0, =0xfffffffd 
    cmp lr, r0 
    ite eq 
    mrseq r0, psp
    mrsne r0, msp
    
    /* find pc */
    ldr r0, [r0, #24]
    
    /* after getting the pc, msp can be safely altered !!!*/
    ldr r1, =_estack
    msr msp, r1

    push {lr}
    bl HardFault_Handler_helper
    pop {lr}

    b .

.size HardFault_Handler, . - HardFault_Handler


/**********************HardFault_Handler end**************************/
