#include "defines.h"
#include <stdint.h>
#include "core.h"

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

  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
    *(uint32_t *)(i) = 0;
  }
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
    *(uint32_t *)(i) = 0;
  }
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
  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
         (uint32_t)(&SCB->CFSR));
  printf("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
  printf("PC -> %\n\r", (uint32_t)(&pc));
  printf("instruction that triggered HardFault -> %\n\r",
         (uint32_t)&instruction);
}
