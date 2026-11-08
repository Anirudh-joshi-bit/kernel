#include "core.h"
#include "defines.h"
#include <stdint.h>
#include <stdarg.h>


extern semaphore_t sem_usart1;
extern uint8_t process_count;

void enterCRITICAL(void) { __disable_irq(); }

void exitCRITICAL(void) { __enable_irq(); }

void syscall__printf(const char *msg, ...) {
  semaphore_lock(&sem_usart1);
  
  // pass all the function parameter to printf ();

  va_list args;
  va_start (args, msg);

  printf (msg, args);

  va_end(args);
  semaphore_unlock(&sem_usart1);
}

void syscall__scanf(const char* msg, ...) {

  while (1)
    ;
}

void syscall__process_exit (uint32_t status) {
  process_exit (status);
}


