.syntax unified
.cpu cortex-m4
.thumb

.section .text.Reset_Handler
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
    B main
hang:
    B .

.size Reset_Handler, . - Reset_Handler

/************************ Default_Handler start**********************/
.section .text.Default_Handler
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
.section .text.DebugMon_handler
.global DenubMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .

.size DebugMon_Handler, . - DebugMon_Handler


/************************ Default_Handler start**********************/

/* header */
.section .Header, "a", %progbits
.global Header 
.type Header, %object
Header:
    .word   0xffffffff
    .word   0x043cd564 
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


