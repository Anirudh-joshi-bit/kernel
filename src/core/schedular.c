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

  picked_process = queue_front(&ready_queue);
  uint8_t status = queue_pop(&ready_queue);

  if (-1 == status || !picked_process)
    return;

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

