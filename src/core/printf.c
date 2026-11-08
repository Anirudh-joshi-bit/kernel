#include "usart.h"
#include <stdarg.h>

#define MAX_STR_LENGTH 500 

uint32_t strlen(const char *msg) {

  int i = 0;
  while (msg[i++] != '\0')
    ;
  return i - 1;
}

 uint32_t concat (char *s, uint32_t ind, uint32_t MAX_S_SIZE, char *t){
  int t_ind = 0;
  while (ind < MAX_S_SIZE-1 && t[t_ind]){
    s[ind++] = t[t_ind++];
  }
  return ind;
}

void hex_str(uint32_t value, char out[11]) {
// put the string representation of hex value in out
  char hex_char[] = "0123456789abcdef";
  out [10] = '\0';
  out[0] = '0';
  out[1] = 'x';

  for (int i = 0; i < 8; i++) {
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
    int j = 9 - i;
    out[j] = hex_char[ind];
  }
}

void int_str (uint32_t value, char out[11]){
  // put the string representation of value in out;
  int32_t i = 9;
  out[10] = '\0';
  while (i >= 0){

    uint8_t digit = value % 10;
    value /= 10;
    out[i--] = '0' + digit;
  }
}

void printf(const char *msg, ...) {
  va_list args;
  va_start (args, msg);

  uint32_t size = strlen (msg);
  char __msg[MAX_STR_LENGTH];

  int msg_ind = 0;
  int __msg_ind = 0;
  while (msg_ind < size){
    if (msg[msg_ind] != '%'){
      __msg[__msg_ind++] = msg [msg_ind++];
      continue;
    }
    
    // msg[msg_ind] == '%'
    if (msg_ind+1 >= size) break;
    if (msg[msg_ind+1] == 's'){

      char* address = va_arg (args, char*);
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, address);
      msg_ind ++;
    }
    else if (msg[msg_ind+1] == 'd'){

      char target [11];
      uint32_t value = va_arg (args, uint32_t);
      int_str (value, target);
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, target);
      msg_ind ++;
    }
    else if (msg[msg_ind+1] == 'x'){

      char target [11];
      uint32_t value = va_arg (args, uint32_t);
      hex_str (value, target);
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, target);
      msg_ind ++;
    }
    msg_ind ++;

  }
  va_end (args);
  __msg[__msg_ind] = '\0';
  __usart1_print (__msg, strlen (__msg));

}
