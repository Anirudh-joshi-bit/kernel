#pragma once

#define WAITING_STATE   00
#define RUNNING_STATE   01 
#define IO_STATE        02
#define RUNNING_PROCESS_AD 0x20000000
#define PICKED_PROCESS_AD RUNNING_PROCESS_AD+23*4



// this structure will only be used in the previllaged mode !!! 
typedef struct user_process_t {

    /********************** context field ***********************************/
    uint32_t gp_reg [13];                       // R0-R12
    uint32_t psp;                               // process stack pointer    banked R13
    uint32_t msp;                               // main stack pointer       banker R13
    uint32_t lr;                                // link register (R14)
    uint32_t pc;                                // program counter (R15)
    uint32_t xPSR;                              // program status register 
    uint32_t PRIMASK;                           // premask register
    uint32_t FAULTMASK;                         // fault mask register
    uint32_t BASEPRI;                           // base pri register
    uint32_t CONTROL;                           // control register

    
    /******************* about process ****************************************/
    uint8_t  state;             // waiting/running/io


} user_process_t;
/* xPSR = {APSR, IPSR, EPSR} */
/* size of user_process_t = 23*4 bytes (considering structure padding) */


