#pragma once

#include <stdint.h>

#define MAIN1_PROCESS_NUM               0
#define MAIN2_PROCESS_NUM               1
#define READY_STATE                     00
#define RUNNING_STATE                   01
#define SUSPEND_STATE                   02
#define WAITING_STATE                   03
#define FAULT_IN_USERPROC               00 
#define FAULT_IN_KERNEL                 01
#define KERNELINIT_SIZE                 8*1024
#define KERNEL_STACK_INIT               0x20018000-KERNELINIT_SIZE
#define USER_STACK_INIT                 0x20000000+64*1024  
#define SIZE_PROCESS                    15*4
#define RUNNING_PROCESS_AD KERNEL_STACK_INIT+0x4    // stores address of running process
#define PICKED_PROCESS_AD RUNNING_PROCESS_AD+0x4    // stores address of picked process
#define RX_PIN                          9
#define TX_PIN                          10 
#define MAX_STR_SIZE                    100
#define MAX_SYSCALL_NUM                 10
#define SYSCALL_TABLE_AD                KERNEL_STACK_INIT+0xc
#define MAX_PROCESS_NUM                 15
#define USER_STACK_SIZE                 32 * 1024       // 32 KB
#define KERNEL_STACK_SIZE               24 * 1024       // 24 KB
#define BUSFAULT_IDENTIFIER             0x0
#define MEMMANAGE_IDENTIFIER            0x1
#define USAGEFAULT_IDENTIFIER           0x2

/* USER space definitions */

#define USER_CODE    __attribute__((section(".usertext")))
#define USER_DATA    __attribute__((section(".userdata")))
#define USER_BSS     __attribute__((section(".userbss")))
#define USER_RODATA  __attribute__((section(".userrodata")))


// this structure will only be used in the previllaged mode !!! 
typedef struct user_process_t {

    /********************** context field ***********************************/
    // store only those register that are not stored in stack (except control register)
    uint32_t r4;
    uint32_t r5;
    uint32_t r6;
    uint32_t r7;
    uint32_t r8;
    uint32_t r9;
    uint32_t r10;
    uint32_t r11;
    uint32_t psp;                          // process stack pointer  banked R13
    uint32_t msp;                          // main stack pointer     banker R13
    uint32_t lr;

             /*** donot store the control reg ***/
 //   uint32_t CONTROL;                      // control register
                        /* NVIC registers*/

    /******************* about process ****************************************/
    uint32_t  state;             // waiting/running/io


} user_process_t;
/* xPSR = {APSR, IPSR, EPSR} */
/* size of user_process_t = 23*4 bytes (considering structure padding) */



/* queue -> stores the addresses of processes */
typedef struct __queue_t {
    user_process_t *processes [30];    
    uint8_t size;
    uint8_t front;
    uint8_t rare;
}queue_t;


/* to buggy !!!!*/
typedef struct __semaphore_t {
    uint8_t value;
    queue_t waiting_queue;
} semaphore_t;
