#pragma once

#define MAIN1_PROCESS_NUM               0
#define MAIN2_PROCESS_NUM               1
#define READY_STATE                     00
#define RUNNING_STATE                   ~READY_STATE
#define KERNEL_SPACE_INIT               0x20016000
#define USER_SPACE_INIT                 0x2000c000  
#define SIZE_PROCESS                    15*4
#define RUNNING_PROCESS_AD KERNEL_SPACE_INIT+0x4    // stores address of running process
#define PICKED_PROCESS_AD RUNNING_PROCESS_AD+0x4    // stores address of picked process
#define RX_PIN                          9
#define TX_PIN                          10 
#define MAX_STR_SIZE                    100
#define MAX_SYSCALL_NUM                 10
#define SYSCALL_TABLE_AD                KERNEL_SPACE_INIT+0xc
#define MAX_PROCESS_NUM                 20
#define TOTAL_STACK_SIZE                40 * 1024       // 40 KB
#define BUSFAULT_IDENTIFIER             0x0
#define MEMMANAGE_IDENTIFIER            0x1
#define USAGEFAULT_IDENTIFIER           0x2


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
    uint32_t FAULTMASK;                    // fault mask register
    uint32_t BASEPRI;                      // base pri register
    // set the PRIMASK at the end !!
    uint32_t PRIMASK;                      // premask register
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
    user_process_t *processes [MAX_PROCESS_NUM];    
    uint32_t size;
    uint8_t front;
    uint8_t rare;
}queue_t;
