#pragma once

#define MAIN1_PROCESS_NUM 0
#define MAIN2_PROCESS_NUM 1
#define WAITING_STATE   00
#define RUNNING_STATE   01 
#define IO_STATE        02
#define M2_USER_ST_INIT 0x20007000
#define M1_USER_ST_INIT 0x2000c000
#define USER_SPACE 0x2000c000
#define M2_KERNEL_ST_INIT 0x20011c00
#define M1_KERNEL_ST_INIT 0x20017800
#define RUNNING_PROCESS_AD M1_KERNEL_ST_INIT+0x4    // stores address of running process
#define PICKED_PROCESS_AD RUNNING_PROCESS_AD+0x4    // stores address of picked process






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
    volatile uint32_t ISPR[8U];                              // set interrupt pending
    volatile uint32_t ICPR[8U];                              // clear interrupt pending
    volatile uint32_t IABR[8U];                              // set active interrupt

    /******************* about process ****************************************/
    uint8_t  state;             // waiting/running/io


} user_process_t;
/* xPSR = {APSR, IPSR, EPSR} */
/* size of user_process_t = 23*4 bytes (considering structure padding) */


