#include "../include/commons.h"

extern void copy_gpreg (uint32_t *regs);


user_process_t process1;
user_process_t process2;


void main1 ();
void main2 ();
void make_process (user_process_t* process, bool process_num);
void launch_process (void);

int main() {

 // main1();
 // main2();  
    /* some init code */
    make_process (&process1, MAIN1_PROCESS_NUM);
    make_process (&process2, MAIN2_PROCESS_NUM);
    
    //call main1, main2

    /* start the processes */
    launch_process();
    while (1);
}

void make_process (user_process_t* process, bool process_num){
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;


    void (*fun) (void) = 0;
    if (process_num)
        fun = main2;
    else 
        fun = main1;

    //process->pc = (uint32_t) fun;
    process->psp = process_num ? M2_USER_ST_INIT : M1_USER_ST_INIT;
    process->msp = process_num ? M2_KERNEL_ST_INIT : M1_KERNEL_ST_INIT;
    process->psp -= 8*4;        // start from 8 word below the base of the stack
    
    /* set the value of pc in side the padding (of 8w)
    the values in the padding is random -> make them 0x0 

    set the xPSR word in the stack to 0x01000000 as 24th bit must ne 1 for xPSR to 
    represent thumb state 
    */
    uint32_t psp_value = process->psp;
    for (int i=0; i<8; i++){
        if (i == 6)
            *(uint32_t *)(psp_value+i*4) = (uint32_t) fun;
        else if (i == 7)
            *(uint32_t *)(psp_value+i*4) = 0x01000000;
        else 
            *(uint32_t *)(psp_value+i*4) = 0x0;
    }
    
    // set psp 

    __asm__get_PRIMASK (&(process->PRIMASK));
    __asm__get_FAULTMASK (&(process->FAULTMASK));
    __asm__get_BASEPRI (&(process->BASEPRI));

    /* NVIC register copy */
    for (uint8_t i=0; i<8; i++){
        process->ISPR[i] = NVIC->ISPR[i];
        process->IABR[i] = NVIC->IABR[i];
        process->ICPR[i] = NVIC->ICPR[i];
    }
}

void  launch_process (void){

    /*set the load value 
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process1.psp);
    __asm__set_msp (process1.msp);
       

    SysTick->LOAD = 16000 - 1;
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
            | SysTick_CTRL_ENABLE_Msk);
    __asm__switch_to_usermode ();  
    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process1);
    process1.state = RUNNING_STATE;
    process2.state = WAITING_STATE;

    main1 ();

}
