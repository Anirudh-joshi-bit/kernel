#include "../include/commons.h"

extern user_process_t process1;
extern user_process_t process2;

void schedular(void) {

  uint32_t state_process1 = *((uint32_t*)(&process1) + (SIZE_PROCESS - 4)/4);
  uint32_t state_process2 = *((uint32_t*)(&process2) + (SIZE_PROCESS - 4)/4);
  /* both the process cannot be waiting at the same time
   * both the process cannot be running at the same time
   * if one process is waiting -> then pick it
   * if one process is in io -> pick the other one
   *
   * implement io state once threading is done.....
   *
   *    as of now, there are only two states 1. running state,
   *                                         2. running state
   *
   * change the below code in future
   * code assumes that if one process is in waiting state ->other process must
   * be running
   */

  if (state_process2 == WAITING_STATE) {
    *((uint32_t *)(PICKED_PROCESS_AD)) = (uint32_t)(&process2);
    process1.state = WAITING_STATE;
    process2.state = RUNNING_STATE;
  } else {
    *((uint32_t *)(PICKED_PROCESS_AD)) = (uint32_t)(&process1);
    process1.state = RUNNING_STATE;
    process2.state = WAITING_STATE;
  }
}
