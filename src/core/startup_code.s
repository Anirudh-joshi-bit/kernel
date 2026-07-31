.syntax unified
.cpu cortex-m4
.thumb

/* header */

.section .Header, "a", %progbits
.global Header 
.type Header, %object
Header:
    .word   0xffffffff
    .word   0x8718f8ce 
    .word   _evtable
    .word   _header_start
    .word   _svtable
    .word   _firmware_end

.size Header, . - Header

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
    .word Default_Handler       /*  reserved */
    .word Default_Handler       /*  reserved */
    .word Default_Handler       /*  reserved */
    .word Default_Handler       /*  reserved */
    .word SVC_Handler           /*  SVC call handler */
    .word DebugMon_Handler      /*  Debug moniter */
    .word Default_Handler       /*  reserver  */
    .word PendSV_Handler        /*  pend sv handler */
    .word SysTick_Handler       /*  systick timer handler */


.size vector_table, . - vector_table


