#include "../include/commons.h"
#include <stdint.h>

/*linker script symbols*/
extern uint32_t _sdata;
extern uint32_t _edata;
extern uint32_t _sidata;
extern uint32_t _sbss;
extern uint32_t _ebss;

extern uint32_t _siuserdata;
extern uint32_t _suserdata;
extern uint32_t _euserdata;
extern uint32_t _suserbss;
extern uint32_t _euserbss;

extern user_process_t process[MAX_PROCESS_NUM];
extern queue_t ready_queue;

void resetHandlerHelper(void) {
  uint32_t dest = (uint32_t)&_sdata;
  uint32_t dest_end = (uint32_t)&_edata;
  uint32_t src = (uint32_t)&_sidata;

  /*copy data from data section to ram
   * init .bss section*/
  for (uint32_t i = dest; i <= dest_end; i += 4) {
    *(uint32_t *)(i) = *(uint32_t *)(src);
    src += 4;
  }

  dest = (uint32_t)&_suserdata;
  dest_end = (uint32_t)&_euserdata;
  src = (uint32_t)&_siuserdata;

  for (uint32_t i = dest; i <= dest_end; i += 4) {
    *(uint32_t *)(i) = *(uint32_t *)(src);
    src += 4;
  }

  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i+=4){
        *(uint32_t *)(i) = 0;
  }
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i+=4){
        *(uint32_t *)(i) = 0;
  }
}

void schedular(void) {

  /* Round Robin (FCFS + time slice)*/
  user_process_t *picked_process = NULL;
  user_process_t *running_process = *(user_process_t **)(RUNNING_PROCESS_AD);

  picked_process = queue_front(&ready_queue);
  uint8_t status = queue_pop(&ready_queue);

  if (status == -1 || !picked_process)
    return;

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);

  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE) {
    queue_push(&ready_queue, running_process);
    running_process->state = READY_STATE;
  }

  picked_process->state = RUNNING_STATE;
}

void fault_handler_helper(uint32_t pc, uint8_t fault_identifier,
                          uint32_t fault_place) {

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
  printf("PC -> %\n\r", (uint32_t)&pc);
  printf("instruction that caused the fault-> %\n\r", (uint32_t)(&instruction));

  /* KERNEL PANIC if fault in kernel
   * PROCESSES TERMINATION if fault in user process */

  if (fault_place == FAULT_IN_KERNEL) {
    printf("\n\n\rKERNEL PANIC......\n\n\r", 0x0);
    while (1)
      ;
  }
  /* change state from running to suspend and set pendsv */
  else if (fault_place == FAULT_IN_USERPROC) {
    printf("terminating user process...\n\r", 0x0);
    printf("reason -> fault", 0x0);

    (*(user_process_t **)(RUNNING_PROCESS_AD))->state = SUSPEND_STATE;

    /* trigger context switching*/
    PendSV_Handler();
  }
}

void HardFault_Handler_helper(uint32_t pc) {

  uint32_t instruction = *(uint32_t *)(pc);

  printf("HARD_FAULT !!!\n\r", 0x0);
  printf("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
  printf("PC -> %\n\r", (uint32_t)(&pc));
  printf("instruction that triggered HardFault -> %\n\r",
         (uint32_t)&instruction);
}

void mpu_setup (void){

    /*dissable mpu*/
    MPU-> CTRL = 0;

    /*region 0*/
    MPU->RNR = 0;
    MPU->RBAR = (uint32_t)(&_sFLASHUserSpace);
    MPU->RASR =
    (0 << MPU_RASR_XN_Pos) |          // Executable (XN = 0)
    (0b110 << MPU_RASR_AP_Pos) |      // Privileged read-only user read-only
    (15 << MPU_RASR_SIZE_Pos) |       // 64 KB region
    MPU_RASR_ENABLE_Msk;

    MPU->RNR = 1;
    MPU->RBAR = (uint32_t)(&_sSRAMUserSpace);
    MPU->RASR =
    (1 << MPU_RASR_XN_Pos) |        // non Executable
    (0b011 << MPU_RASR_AP_Pos) |    // privillage read write user read-write
    (14 << MPU_RASR_SIZE_Pos) |     // 32 KB size
    MPU_RASR_ENABLE_Msk;

    MPU->RNR = 2;
    MPU->RBAR = USER_STACK_END;
    MPU->RASR =
    (1 << MPU_RASR_XN_Pos) |        // non Executable
    (0b011 << MPU_RASR_AP_Pos) |    // privillage read write user read-write
    (14 << MPU_RASR_SIZE_Pos) |     // 32 KB size
    MPU_RASR_ENABLE_Msk;   

    MPU->CTRL = MPU_CTRL_PRIVDEFENA_Msk | MPU_CTRL_ENABLE_Msk;
}

uint32_t _strlen(const char *msg) {

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
  uint32_t msg_size = _strlen(msg);

  if (msg_size + 9 > MAX_STR_SIZE) {
    __usart1_print("too large error message !!\n\r", MAX_STR_SIZE);
    return;
  }
  char hex[10];
  char __msg[MAX_STR_SIZE];

  uint32_t i = 0;
  int p = 0, q = 0;
  bool single_sub = false;

  for (; i < msg_size; i++) {

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
  __usart1_print(__msg, _strlen(__msg));
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
