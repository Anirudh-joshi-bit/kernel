#include "../include/commons.h"

extern user_process_t process[MAX_PROCESS_NUM];
extern queue_t ready_queue;

void schedular(void) {

  //  uint32_t state_process1 = *((uint32_t*)(&process[0]) + (SIZE_PROCESS -
  //  4)/4); uint32_t state_process2 = *((uint32_t*)(&process[1]) +
  //  (SIZE_PROCESS - 4)/4);
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
  //    user_process_t* picked = NULL;
  //    user_process_t* run = NULL;
  //    if (state_process1 == RUNNING_STATE){
  //        picked = &process[1];
  //        run = &process[0];
  //    }
  //    else {
  //        picked = &process[0];
  //        run = &process[1];
  //    }
  //
  //    picked-> state = ~(picked->state);
  //    run-> state = ~(run->state);
  //
  //    *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t) (picked);

  /* Round Robin (FCFS + time slice)*/
  user_process_t *picked_process = NULL;
  user_process_t *running_process = *(user_process_t **)(RUNNING_PROCESS_AD);

  picked_process = queue_front(&ready_queue);
  uint8_t status = queue_pop(&ready_queue);

  if (status == -1 || !picked_process)
    return;

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);
  picked_process->state = RUNNING_STATE;
  running_process->state = READY_STATE;

  queue_push(&ready_queue, running_process);
}

void fault_handler_helper(uint32_t pc, uint8_t fault_identifier) {

  /* bus fault diagnosis */
  if (fault_identifier == BUSFAULT_IDENTIFIER) {
    printf("busdault !!\n\r", 0x0);
    if (SCB->CFSR & SCB_CFSR_BFARVALID_Msk)
      printf("busfault address -> %\n\r", (uint32_t)(&SCB->BFAR));

  }

  /* MemManagement diagnosis */
  else if (fault_identifier == MEMMANAGE_IDENTIFIER) {
    printf("MemManagement exception !!\n\r", 0x0);
    if (SCB->CFSR & SCB_CFSR_MMARVALID_Msk)
      printf("address caused MemManage Fault -> %\n\r", SCB->MMFAR);
  }

  /* UsageFault diagnosis */
  else if (fault_identifier == USAGEFAULT_IDENTIFIER) {
    printf("UsageFault !!\n\r", 0x0);
    /* there is no address access that can cause USAGE FAULT */
  } else {
    return;
  }

  uint32_t instruction = *(uint32_t *)(pc);

  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
         (uint32_t)(&SCB->CFSR));
  printf ("PC -> %\n\r", (uint32_t)&pc);
  printf("instruction that caused the fault-> %\n\r", (uint32_t)(&instruction));
}

void HardFault_Handler_helper (uint32_t pc){

    uint32_t instruction = *(uint32_t *)(pc);

    printf ("HARD_FAULT !!!\n\r", 0x0);
    printf ("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
    printf ("PC -> %\n\r", (uint32_t)(&pc));
    printf ("instruction that triggered HardFault -> %\n\r", (uint32_t)&instruction);

}

/* 
 * hardfault and nmi handlers are implemented in asm as the stack might be corrupted 
 * using c for handling these faults can access the stack and lead the kernel into 
 * lock up state 
 *
 */

uint32_t strlen(const char *msg) {

  int i = 0;
  while (msg[i++] != '\0')
    ;
  return i - 1;
}

void __usart1_init(void) {

  RCC->APB2ENR |= RCC_APB2ENR_USART1EN_Msk;
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
  // alternate function mode
  GPIOA->MODER &= ~((3 << (2 * TX_PIN)) | (3 << (2 * RX_PIN)));
  GPIOA->MODER |= 2 << (2 * TX_PIN) | 2 << (2 * RX_PIN);
  // high speed
  GPIOA->OSPEEDR |= (3 << (TX_PIN * 2)) | (3 << (RX_PIN * 2));
  // clear the bits in AFR register
  GPIOA->AFR[1] &= ~((0xf << 4) | (0xf << 8));
  // set for af7
  GPIOA->AFR[1] |= (7 << 4) | (7 << 8);

  // enable usart, reciever, transiever
  USART1->CR1 |= USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
  // set the baud rate (115200 in this case)
  USART1->BRR = 0x08B;
}

void __usart1_print(const char *msg, uint32_t size) {

  int i = 0;
  while (i < size && msg[i] != '\0') {
    while (!(USART1->SR & USART_SR_TXE))
      ;
    USART1->DR = msg[i++];
  }
  while (!(USART1->SR & USART_SR_TC)) {
  }
}

char *hex_str(uint32_t value, char *out) {

  char hex_char[] = "0123456789abcdef";
  out[0] = '0';
  out[1] = 'x';

  for (int i = 0; i < 8; i++) {
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
    int j = 9 - i;
    out[j] = hex_char[ind];
  }
}

void printf(const char *msg, uint32_t address) {

  uint32_t value = *((uint32_t *)address);

  if (strlen(msg) + 9 > MAX_STR_SIZE) {
    __usart1_print("too large error message !!\n\r", MAX_STR_SIZE);
    return;
  }
  char hex[10];
  char __msg[MAX_STR_SIZE];

  uint32_t i = 0;
  int p = 0, q = 0;
  bool single_sub = false;

  for (; i < strlen(msg); i++) {

    if (msg[i] == '%' && !single_sub) {
      hex_str(value, hex);

      while (q - p < 10) {
        __msg[q++] = hex[q - p];
      }
      p++;
      single_sub = true;
    } else
      __msg[q++] = msg[p++];
  }
  __msg[q] = '\0';
  __usart1_print(__msg, strlen(__msg));
}

void syscall__printf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
  //((user_process_t *) RUNNING_PROCESS_AD)-> state = IO_RUNNING_STATE;
  printf((const char *)a, b);
  //((user_process_t *) RUNNING_PROCESS_AD)-> state = RUNNING_STATE;
}

void syscall__scanf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {

  while (1)
    ;
}
