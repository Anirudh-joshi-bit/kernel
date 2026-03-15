#include "../include/commons.h"
#include <stdint.h>

/************************syscalls declaration*************************/
void syscall__printf (uint32_t a, uint32_t b, uint32_t c, uint32_t d);
void syscall__scanf (uint32_t a, uint32_t b, uint32_t c, uint32_t d);
void (*Syscall_Table [MAX_SYSCALL_NUM]) (uint32_t , uint32_t, uint32_t, uint32_t); 

/* semaphores */
semaphore_t sem_usart1;

/* store the process struct and pc of each process */
user_process_t process [MAX_PROCESS_NUM];
void (*process_pc[MAX_PROCESS_NUM]) (void);
queue_t ready_queue;

USER_CODE int user_launch_process ();


/* set the value of this variable according to the number of processes you have */
uint8_t  process_count = 3;

void main1 (void);          // this is must (atleast one process)
void main2 (void);
void main3 (void);
void main4 (void);
void main5 (void);
void main6 (void);
void main7 (void);


void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind);
void launch_process (void);

int main() {

    SCB->SHP[10] = 0xff;    // set the PendSV to be the lowest priority...

    /* some init code */
    __usart1_init ();
    queue_init (&ready_queue, process_count);
    semaphore_init (&sem_usart1, 1);

    if (process_count < 1 || process_count > MAX_PROCESS_NUM){
        printf ("ERROR in the number of process ....\n\r", 0x0);
        while (1);
    }

    /******************** fault handler init ***************************/
    
    // enable faults (without this any fault = hardfault)
    SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;
    SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;
    SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;



    /* init syscall table */
    Syscall_Table[0] =  syscall__printf;
    Syscall_Table[1] =  syscall__scanf;
    *(uint32_t *)(SYSCALL_TABLE_AD) = (uint32_t)(Syscall_Table);
    
    uint32_t psp_val = USER_STACK_INIT;
    uint32_t msp_val = KERNEL_STACK_INIT;
    uint32_t user_stack_size = USER_STACK_SIZE / process_count;
    uint32_t kernel_stack_size = KERNEL_STACK_SIZE / process_count;

    /* fill the pcs */
    process_pc [0] = main1;
    process_pc [1] = main2;
    process_pc [2] = main3;
    process_pc [3] = main4;
    process_pc [4] = main5;
    process_pc [5] = main6;
    process_pc [6] = main7;

    for (uint8_t i=0; i<process_count; i++){
        make_process (&process[i], psp_val, msp_val, i);
        psp_val -= user_stack_size;
        msp_val -= kernel_stack_size;
        /* make stack pointers word aligned */
        psp_val &= ~(3);
        msp_val &= ~(3);
    }
 
//    *(uint32_t*) (0xffffffff) = 5;

    /*impose user restriction*/
    mpu_setup ();

    /* start the processes */
    launch_process();
    /* should never fall to this section */
    while (1);
}

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind){
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;



    //process->pc = (uint32_t) fun;
    process->psp = psp & (~3);
    process->msp = msp & (~3);
    process->psp -= 8*4;        // start from 8 word below the base of the stack
    
    /* set the value of pc in side the padding (of 8w)
    the values in the padding is random -> make them 0x0 

    set the xPSR word in the stack to 0x01000000 as 24th bit must ne 1 for xPSR to 
    represent thumb state 
    */
    for (int i=0; i<8; i++){
        if (i == 6)
            *(uint32_t *)(process->psp+i*4) = (uint32_t) process_pc [ind];
        else if (i == 7)
            *(uint32_t *)(process->psp+i*4) = 0x01000000;
        else 
            *(uint32_t *)(process->psp+i*4) = 0x0;
    }
    
    // set psp 

    __asm__get_PRIMASK (&(process->PRIMASK));
    __asm__get_FAULTMASK (&(process->FAULTMASK));
    __asm__get_BASEPRI (&(process->BASEPRI));

}

void  launch_process (void){

    /*set the load value 
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process[0].psp);
    __asm__set_msp (process[0].msp);
       

    SysTick->LOAD = 16000 - 1;
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
            | SysTick_CTRL_ENABLE_Msk);

    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process[0]);

    /* initially all the processes will be placed in the ready queue except the first one (entry point) */
    for (uint8_t i=1; i<process_count; i++){
        queue_push (&ready_queue, &process[i]);
    }

    process[0].state = RUNNING_STATE;
    for (uint8_t i=1; i<process_count; i++){
        process[i].state = READY_STATE;
    }
 
    __asm__launch_main1();

}
