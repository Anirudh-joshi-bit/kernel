#include "defines.h"
#include "core.h"

/* important variable from main.c */
extern user_process_t process[MAX_PROCESS_NUM];
extern queue_t ready_queue;
extern semaphore_t sem_usart1;

void schedular(void) {

  /* Round Robin (FCFS + time slice)*/
  user_process_t *picked_process = NULL;
  user_process_t *running_process = *(user_process_t **)(RUNNING_PROCESS_AD);


  // we could use a priority queue here to support priority...
  picked_process = queue_front(&ready_queue);
  uint8_t status = queue_pop(&ready_queue);


  // if ready queue is empty, then pick the runnung process
  if (0xff == status || !picked_process){
    picked_process = *(user_process_t **)(RUNNING_PROCESS_AD);
    // dissable systick to remove the context switching overhead if there is only one process .

    printf ("ready queue is empty, turning off context switching\n\r", 0x0);
    SysTick->CTRL &= ~(SysTick_CTRL_ENABLE_Msk);
    // better if the last standing process is too large  or there is only one process to begin with
  }

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);

  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE &&
      running_process->state != WAITING_STATE) {
    queue_push(&ready_queue, running_process);
    running_process->state = READY_STATE;
  }

  picked_process->state = RUNNING_STATE;
}

