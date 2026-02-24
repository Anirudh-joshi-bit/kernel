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




/***************************** vtable *******************************/

.section .isr_vector, "a", %progbits
.global vector_table
.type vector_table, %object

vector_table:
    .word _estack           // msp value
    .word Reset_Handler     
    
    .word Default_Handler   /*  NMI handler */
    .word Default_Handler   /*  Hard fault handler */
    .word Default_Handler   /*  mem management handler */
    .word Default_Handler   /*  bus fault */
    .word Default_Handler   /*  usage fault */
    .word Default_Handler   /*  reserved */
    .word Default_Handler   /*  reserved */
    .word Default_Handler   /*  reserved */
    .word Default_Handler   /*  reserved */
    .word Default_Handler   /*  SVC call handler */
    .word Default_Handler   /*  Debug moniter */
    .word Default_Handler   /*  reserver  */
    .word Default_Handler   /*  pend sv handler */
    .word SysTick_Handler   /*  systick timer handler */

    .rept 40
        .word Default_Handler
    .endr

    .word Default_Handler 

.size vector_table, . - vector_table


