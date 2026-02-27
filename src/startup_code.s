.syntax unified
.cpu cortex-m4
.thumb

.section .text.Reset_Handler
.global Reset_Handler
.type Reset_Handler, %function

Reset_Handler:                           
    LDR r0, =_sdata                     // _sdata in sram
    LDR r1, =_edata                     // _edata in sram
    LDR r2, =_sidata                    // _sidata in flash

    B copy

copy:
    CMP r0, r1
    BLT copy_helper

    // init .bss with 0
    LDR r0, =_sbss                       // _sbss present in sram
    LDR r1, =_ebss                       // _ebss present in sram
    MOV r2, #0 

    B init_zero

copy_helper:
    LDR r3, [r2], #4 
    STR r3, [r0], #4 

    B copy

init_zero:
    CMP r0, r1
    BLT init_zero_helper
    
    B call_entry


init_zero_helper:
    STR r2, [r0], #4 
    B init_zero
                

call_entry:
    B main

hang:
    B .

.size Reset_Handler, . - Reset_Handler

/************************ Default_Handler start**********************/
.section .text.Default_handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .

.size Default_Handler, . - Default_Handler



/************************ Default_Handler start**********************/
.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .

.size NMI_Handler, . - NMI_Handler


/************************ Default_Handler start**********************/
.section .text.HardFault_handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler :
    B .

.size HardFault_Handler, . - HardFault_Handler


/************************ Default_Handler start**********************/
.section .text.MemManage_handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler :
    B .

.size MemManage_Handler, . - MemManage_Handler


/************************ Default_Handler start**********************/
.section .text.BusFault_handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler :
    B .

.size BusFault_Handler, . - BusFault_Handler


/************************ Default_Handler start**********************/
.section .text.UsageFault_handler
.global UsageFault_Handler
.type UsageFault_Handler, %function
UsageFault_Handler :
    B .

.size UsageFault_Handler, . - UsageFault_Handler


/************************ Default_Handler start**********************/
.section .text.SVC_handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler :
    B .

.size SVC_Handler, . - SVC_Handler


/************************ Default_Handler start**********************/
.section .text.DebugMon_handler
.global DenubMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .

.size DebugMon_Handler, . - DebugMon_Handler


/************************ Default_Handler start**********************/
.section .text.PendSV_handler
.global PendSV_Handler 
.type PendSV_Handler, %function
PendSV_Handler:
    B .

.size PendSV_Handler, . - PendSV_Handler



/***************************** vtable *******************************/

.section .isr_vector, "a", %progbits
.global vector_table
.type vector_table, %object

vector_table:
    .word _estack           // msp value
    .word Reset_Handler     
    
    .word NMI_Handler           /*  NMI handler */
    .word HardFault_Handler     /*  Hard fault handler */
    .word MemManage_Handler     /*  mem management handler */
    .word BusFault_Handler      /*  bus fault */
    .word UsageFault_Handler    /*  usage fault */
    .word 0                     /*  reserved */
    .word 0                     /*  reserved */
    .word 0                     /*  reserved */
    .word 0                     /*  reserved */
    .word SVC_Handler           /*  SVC call handler */
    .word DebugMon_Handler      /*  Debug moniter */
    .word 0                     /*  reserver  */
    .word PendSV_Handler        /*  pend sv handler */
    .word SysTick_Handler       /*  systick timer handler */

    .rept 40
        .word Default_Handler
    .endr

    .word Default_Handler 

.size vector_table, . - vector_table


