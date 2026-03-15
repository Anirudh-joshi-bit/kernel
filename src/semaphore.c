#include "../include/commons.h"

extern queue_t ready_queue;
extern uint8_t process_count;

void semaphore_init (semaphore_t *sema, uint8_t value){
    sema->value = value;               // unlocked
    queue_init (&(sema->waiting_queue), process_count);
}

/* this has to be atomic */
void semaphore_lock (semaphore_t *sema){
    __disable_irq ();
    if (sema->value == 0){      // semaphore cannot be locked ...
        user_process_t *running_process = 
            *((user_process_t **)(RUNNING_PROCESS_AD));
        queue_push (&(sema->waiting_queue), running_process);
        running_process->state = WAITING_STATE;
        
        /* call PendSV_Handler for context switching */
        PendSV_Handler();
        __enable_irq ();
        return ;
    }
    sema->value --;
    __enable_irq ();
}

void semaphore_unock (semaphore_t *sema){
    __disable_irq ();
    sema->value ++;
    /* unlocked */
    if (sema->value == 1){
        user_process_t *process = queue_front (&(sema->waiting_queue));
        if (!process){
            /* no process is waiting */
            __enable_irq ();
            return;
        }
        queue_pop (&(sema->waiting_queue));
        process->state = READY_STATE;
        queue_push (&ready_queue, process);
    }
    __enable_irq ();
}
