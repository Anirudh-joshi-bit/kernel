
build/firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

08000040 <resetHandlerHelper>:
extern uint32_t _euserdata;
extern uint32_t _suserbss;
extern uint32_t _euserbss;


void resetHandlerHelper(void) {
 8000040:	b480      	push	{r7}
 8000042:	b089      	sub	sp, #36	@ 0x24
 8000044:	af00      	add	r7, sp, #0
  uint32_t dest = (uint32_t)&_sdata;
 8000046:	4b27      	ldr	r3, [pc, #156]	@ (80000e4 <resetHandlerHelper+0xa4>)
 8000048:	60bb      	str	r3, [r7, #8]
  uint32_t dest_end = (uint32_t)&_edata;
 800004a:	4b27      	ldr	r3, [pc, #156]	@ (80000e8 <resetHandlerHelper+0xa8>)
 800004c:	607b      	str	r3, [r7, #4]
  uint32_t src = (uint32_t)&_sidata;
 800004e:	4b27      	ldr	r3, [pc, #156]	@ (80000ec <resetHandlerHelper+0xac>)
 8000050:	61fb      	str	r3, [r7, #28]

  /*copy data from data section to ram
   * init .bss section*/
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8000052:	68bb      	ldr	r3, [r7, #8]
 8000054:	61bb      	str	r3, [r7, #24]
 8000056:	e009      	b.n	800006c <resetHandlerHelper+0x2c>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 8000058:	69fa      	ldr	r2, [r7, #28]
 800005a:	69bb      	ldr	r3, [r7, #24]
 800005c:	6812      	ldr	r2, [r2, #0]
 800005e:	601a      	str	r2, [r3, #0]
    src += 4;
 8000060:	69fb      	ldr	r3, [r7, #28]
 8000062:	3304      	adds	r3, #4
 8000064:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8000066:	69bb      	ldr	r3, [r7, #24]
 8000068:	3304      	adds	r3, #4
 800006a:	61bb      	str	r3, [r7, #24]
 800006c:	69ba      	ldr	r2, [r7, #24]
 800006e:	687b      	ldr	r3, [r7, #4]
 8000070:	429a      	cmp	r2, r3
 8000072:	d9f1      	bls.n	8000058 <resetHandlerHelper+0x18>
  }

  dest = (uint32_t)&_suserdata;
 8000074:	4b1e      	ldr	r3, [pc, #120]	@ (80000f0 <resetHandlerHelper+0xb0>)
 8000076:	60bb      	str	r3, [r7, #8]
  dest_end = (uint32_t)&_euserdata;
 8000078:	4b1e      	ldr	r3, [pc, #120]	@ (80000f4 <resetHandlerHelper+0xb4>)
 800007a:	607b      	str	r3, [r7, #4]
  src = (uint32_t)&_siuserdata;
 800007c:	4b1e      	ldr	r3, [pc, #120]	@ (80000f8 <resetHandlerHelper+0xb8>)
 800007e:	61fb      	str	r3, [r7, #28]

  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8000080:	68bb      	ldr	r3, [r7, #8]
 8000082:	617b      	str	r3, [r7, #20]
 8000084:	e009      	b.n	800009a <resetHandlerHelper+0x5a>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 8000086:	69fa      	ldr	r2, [r7, #28]
 8000088:	697b      	ldr	r3, [r7, #20]
 800008a:	6812      	ldr	r2, [r2, #0]
 800008c:	601a      	str	r2, [r3, #0]
    src += 4;
 800008e:	69fb      	ldr	r3, [r7, #28]
 8000090:	3304      	adds	r3, #4
 8000092:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8000094:	697b      	ldr	r3, [r7, #20]
 8000096:	3304      	adds	r3, #4
 8000098:	617b      	str	r3, [r7, #20]
 800009a:	697a      	ldr	r2, [r7, #20]
 800009c:	687b      	ldr	r3, [r7, #4]
 800009e:	429a      	cmp	r2, r3
 80000a0:	d9f1      	bls.n	8000086 <resetHandlerHelper+0x46>
  }

  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 80000a2:	4b16      	ldr	r3, [pc, #88]	@ (80000fc <resetHandlerHelper+0xbc>)
 80000a4:	613b      	str	r3, [r7, #16]
 80000a6:	e005      	b.n	80000b4 <resetHandlerHelper+0x74>
    *(uint32_t *)(i) = 0;
 80000a8:	693b      	ldr	r3, [r7, #16]
 80000aa:	2200      	movs	r2, #0
 80000ac:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 80000ae:	693b      	ldr	r3, [r7, #16]
 80000b0:	3304      	adds	r3, #4
 80000b2:	613b      	str	r3, [r7, #16]
 80000b4:	4a12      	ldr	r2, [pc, #72]	@ (8000100 <resetHandlerHelper+0xc0>)
 80000b6:	693b      	ldr	r3, [r7, #16]
 80000b8:	4293      	cmp	r3, r2
 80000ba:	d9f5      	bls.n	80000a8 <resetHandlerHelper+0x68>
  }
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 80000bc:	4b11      	ldr	r3, [pc, #68]	@ (8000104 <resetHandlerHelper+0xc4>)
 80000be:	60fb      	str	r3, [r7, #12]
 80000c0:	e005      	b.n	80000ce <resetHandlerHelper+0x8e>
    *(uint32_t *)(i) = 0;
 80000c2:	68fb      	ldr	r3, [r7, #12]
 80000c4:	2200      	movs	r2, #0
 80000c6:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 80000c8:	68fb      	ldr	r3, [r7, #12]
 80000ca:	3304      	adds	r3, #4
 80000cc:	60fb      	str	r3, [r7, #12]
 80000ce:	4a0e      	ldr	r2, [pc, #56]	@ (8000108 <resetHandlerHelper+0xc8>)
 80000d0:	68fb      	ldr	r3, [r7, #12]
 80000d2:	4293      	cmp	r3, r2
 80000d4:	d9f5      	bls.n	80000c2 <resetHandlerHelper+0x82>
  }
}
 80000d6:	bf00      	nop
 80000d8:	bf00      	nop
 80000da:	3724      	adds	r7, #36	@ 0x24
 80000dc:	46bd      	mov	sp, r7
 80000de:	bc80      	pop	{r7}
 80000e0:	4770      	bx	lr
 80000e2:	bf00      	nop
 80000e4:	20000000 	.word	0x20000000
 80000e8:	20000001 	.word	0x20000001
 80000ec:	08001327 	.word	0x08001327
 80000f0:	20004000 	.word	0x20004000
 80000f4:	20004000 	.word	0x20004000
 80000f8:	080102bc 	.word	0x080102bc
 80000fc:	20000004 	.word	0x20000004
 8000100:	20000470 	.word	0x20000470
 8000104:	20004000 	.word	0x20004000
 8000108:	20004000 	.word	0x20004000

0800010c <fault_handler_helper>:

void fault_handler_helper(uint32_t pc, uint8_t fault_identifier,
                          uint32_t fault_place) {
 800010c:	b580      	push	{r7, lr}
 800010e:	b086      	sub	sp, #24
 8000110:	af00      	add	r7, sp, #0
 8000112:	60f8      	str	r0, [r7, #12]
 8000114:	460b      	mov	r3, r1
 8000116:	607a      	str	r2, [r7, #4]
 8000118:	72fb      	strb	r3, [r7, #11]

  /* bus fault diagnosis */
  if (fault_identifier == BUSFAULT_IDENTIFIER) {
 800011a:	7afb      	ldrb	r3, [r7, #11]
 800011c:	2b00      	cmp	r3, #0
 800011e:	d10e      	bne.n	800013e <fault_handler_helper+0x32>
    printf("busdault !!\n\r", 0x0);
 8000120:	2100      	movs	r1, #0
 8000122:	482d      	ldr	r0, [pc, #180]	@ (80001d8 <fault_handler_helper+0xcc>)
 8000124:	f000 fad4 	bl	80006d0 <printf>
    if (SCB->CFSR & SCB_CFSR_BFARVALID_Msk)
 8000128:	4b2c      	ldr	r3, [pc, #176]	@ (80001dc <fault_handler_helper+0xd0>)
 800012a:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 800012c:	f403 4300 	and.w	r3, r3, #32768	@ 0x8000
 8000130:	2b00      	cmp	r3, #0
 8000132:	d01f      	beq.n	8000174 <fault_handler_helper+0x68>
      printf("busfault address -> %\n\r", (uint32_t)(&SCB->BFAR));
 8000134:	492a      	ldr	r1, [pc, #168]	@ (80001e0 <fault_handler_helper+0xd4>)
 8000136:	482b      	ldr	r0, [pc, #172]	@ (80001e4 <fault_handler_helper+0xd8>)
 8000138:	f000 faca 	bl	80006d0 <printf>
 800013c:	e01a      	b.n	8000174 <fault_handler_helper+0x68>
  }

  /* MemManagement diagnosis */
  else if (fault_identifier == MEMMANAGE_IDENTIFIER) {
 800013e:	7afb      	ldrb	r3, [r7, #11]
 8000140:	2b01      	cmp	r3, #1
 8000142:	d110      	bne.n	8000166 <fault_handler_helper+0x5a>
    printf("MemManagement exception !!\n\r", 0x0);
 8000144:	2100      	movs	r1, #0
 8000146:	4828      	ldr	r0, [pc, #160]	@ (80001e8 <fault_handler_helper+0xdc>)
 8000148:	f000 fac2 	bl	80006d0 <printf>
    if (SCB->CFSR & SCB_CFSR_MMARVALID_Msk)
 800014c:	4b23      	ldr	r3, [pc, #140]	@ (80001dc <fault_handler_helper+0xd0>)
 800014e:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 8000150:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8000154:	2b00      	cmp	r3, #0
 8000156:	d00d      	beq.n	8000174 <fault_handler_helper+0x68>
      printf("address caused MemManage Fault -> %\n\r", SCB->MMFAR);
 8000158:	4b20      	ldr	r3, [pc, #128]	@ (80001dc <fault_handler_helper+0xd0>)
 800015a:	6b5b      	ldr	r3, [r3, #52]	@ 0x34
 800015c:	4619      	mov	r1, r3
 800015e:	4823      	ldr	r0, [pc, #140]	@ (80001ec <fault_handler_helper+0xe0>)
 8000160:	f000 fab6 	bl	80006d0 <printf>
 8000164:	e006      	b.n	8000174 <fault_handler_helper+0x68>
  }

  /* UsageFault diagnosis */
  else if (fault_identifier == USAGEFAULT_IDENTIFIER) {
 8000166:	7afb      	ldrb	r3, [r7, #11]
 8000168:	2b02      	cmp	r3, #2
 800016a:	d130      	bne.n	80001ce <fault_handler_helper+0xc2>
    printf("UsageFault !!\n\r", 0x0);
 800016c:	2100      	movs	r1, #0
 800016e:	4820      	ldr	r0, [pc, #128]	@ (80001f0 <fault_handler_helper+0xe4>)
 8000170:	f000 faae 	bl	80006d0 <printf>
    /* there is no address access that can cause USAGE FAULT */
  } else {
    return;
  }

  uint32_t instruction = *(uint32_t *)(pc);
 8000174:	68fb      	ldr	r3, [r7, #12]
 8000176:	681b      	ldr	r3, [r3, #0]
 8000178:	617b      	str	r3, [r7, #20]

  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 800017a:	491e      	ldr	r1, [pc, #120]	@ (80001f4 <fault_handler_helper+0xe8>)
 800017c:	481e      	ldr	r0, [pc, #120]	@ (80001f8 <fault_handler_helper+0xec>)
 800017e:	f000 faa7 	bl	80006d0 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("PC -> %\n\r", (uint32_t)&pc);
 8000182:	f107 030c 	add.w	r3, r7, #12
 8000186:	4619      	mov	r1, r3
 8000188:	481c      	ldr	r0, [pc, #112]	@ (80001fc <fault_handler_helper+0xf0>)
 800018a:	f000 faa1 	bl	80006d0 <printf>
  printf("instruction that caused the fault-> %\n\r", (uint32_t)(&instruction));
 800018e:	f107 0314 	add.w	r3, r7, #20
 8000192:	4619      	mov	r1, r3
 8000194:	481a      	ldr	r0, [pc, #104]	@ (8000200 <fault_handler_helper+0xf4>)
 8000196:	f000 fa9b 	bl	80006d0 <printf>

  /* KERNEL PANIC if fault in kernel
   * PROCESSES TERMINATION if fault in user process */

  if (fault_place == FAULT_IN_KERNEL) {
 800019a:	687b      	ldr	r3, [r7, #4]
 800019c:	2b01      	cmp	r3, #1
 800019e:	d104      	bne.n	80001aa <fault_handler_helper+0x9e>
    printf("\n\n\rKERNEL PANIC......\n\n\r", 0x0);
 80001a0:	2100      	movs	r1, #0
 80001a2:	4818      	ldr	r0, [pc, #96]	@ (8000204 <fault_handler_helper+0xf8>)
 80001a4:	f000 fa94 	bl	80006d0 <printf>
    while (1)
 80001a8:	e7fe      	b.n	80001a8 <fault_handler_helper+0x9c>
      ;
  }
  /* change state from running to suspend and set pendsv */
  else if (fault_place == FAULT_IN_USERPROC) {
 80001aa:	687b      	ldr	r3, [r7, #4]
 80001ac:	2b00      	cmp	r3, #0
 80001ae:	d10f      	bne.n	80001d0 <fault_handler_helper+0xc4>
    printf("terminating user process...\n\r", 0x0);
 80001b0:	2100      	movs	r1, #0
 80001b2:	4815      	ldr	r0, [pc, #84]	@ (8000208 <fault_handler_helper+0xfc>)
 80001b4:	f000 fa8c 	bl	80006d0 <printf>
    printf("reason -> fault", 0x0);
 80001b8:	2100      	movs	r1, #0
 80001ba:	4814      	ldr	r0, [pc, #80]	@ (800020c <fault_handler_helper+0x100>)
 80001bc:	f000 fa88 	bl	80006d0 <printf>

    (*(user_process_t **)(RUNNING_PROCESS_AD))->state = SUSPEND_STATE;
 80001c0:	4b13      	ldr	r3, [pc, #76]	@ (8000210 <fault_handler_helper+0x104>)
 80001c2:	681b      	ldr	r3, [r3, #0]
 80001c4:	2202      	movs	r2, #2
 80001c6:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* trigger context switching*/
    PendSV_Handler();
 80001c8:	f000 fdba 	bl	8000d40 <PendSV_Handler>
 80001cc:	e000      	b.n	80001d0 <fault_handler_helper+0xc4>
    return;
 80001ce:	bf00      	nop
  }
}
 80001d0:	3718      	adds	r7, #24
 80001d2:	46bd      	mov	sp, r7
 80001d4:	bd80      	pop	{r7, pc}
 80001d6:	bf00      	nop
 80001d8:	08000e90 	.word	0x08000e90
 80001dc:	e000ed00 	.word	0xe000ed00
 80001e0:	e000ed38 	.word	0xe000ed38
 80001e4:	08000ea0 	.word	0x08000ea0
 80001e8:	08000eb8 	.word	0x08000eb8
 80001ec:	08000ed8 	.word	0x08000ed8
 80001f0:	08000f00 	.word	0x08000f00
 80001f4:	e000ed28 	.word	0xe000ed28
 80001f8:	08000f10 	.word	0x08000f10
 80001fc:	08000f40 	.word	0x08000f40
 8000200:	08000f4c 	.word	0x08000f4c
 8000204:	08000f74 	.word	0x08000f74
 8000208:	08000f90 	.word	0x08000f90
 800020c:	08000fb0 	.word	0x08000fb0
 8000210:	20016004 	.word	0x20016004

08000214 <HardFault_Handler_helper>:

void HardFault_Handler_helper(uint32_t pc) {
 8000214:	b580      	push	{r7, lr}
 8000216:	b084      	sub	sp, #16
 8000218:	af00      	add	r7, sp, #0
 800021a:	6078      	str	r0, [r7, #4]

  uint32_t instruction = *(uint32_t *)(pc);
 800021c:	687b      	ldr	r3, [r7, #4]
 800021e:	681b      	ldr	r3, [r3, #0]
 8000220:	60fb      	str	r3, [r7, #12]

  printf("HARD_FAULT !!!\n\r", 0x0);
 8000222:	2100      	movs	r1, #0
 8000224:	480c      	ldr	r0, [pc, #48]	@ (8000258 <HardFault_Handler_helper+0x44>)
 8000226:	f000 fa53 	bl	80006d0 <printf>
  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 800022a:	490c      	ldr	r1, [pc, #48]	@ (800025c <HardFault_Handler_helper+0x48>)
 800022c:	480c      	ldr	r0, [pc, #48]	@ (8000260 <HardFault_Handler_helper+0x4c>)
 800022e:	f000 fa4f 	bl	80006d0 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
 8000232:	490c      	ldr	r1, [pc, #48]	@ (8000264 <HardFault_Handler_helper+0x50>)
 8000234:	480c      	ldr	r0, [pc, #48]	@ (8000268 <HardFault_Handler_helper+0x54>)
 8000236:	f000 fa4b 	bl	80006d0 <printf>
  printf("PC -> %\n\r", (uint32_t)(&pc));
 800023a:	1d3b      	adds	r3, r7, #4
 800023c:	4619      	mov	r1, r3
 800023e:	480b      	ldr	r0, [pc, #44]	@ (800026c <HardFault_Handler_helper+0x58>)
 8000240:	f000 fa46 	bl	80006d0 <printf>
  printf("instruction that triggered HardFault -> %\n\r",
 8000244:	f107 030c 	add.w	r3, r7, #12
 8000248:	4619      	mov	r1, r3
 800024a:	4809      	ldr	r0, [pc, #36]	@ (8000270 <HardFault_Handler_helper+0x5c>)
 800024c:	f000 fa40 	bl	80006d0 <printf>
         (uint32_t)&instruction);
}
 8000250:	bf00      	nop
 8000252:	3710      	adds	r7, #16
 8000254:	46bd      	mov	sp, r7
 8000256:	bd80      	pop	{r7, pc}
 8000258:	08000fc0 	.word	0x08000fc0
 800025c:	e000ed28 	.word	0xe000ed28
 8000260:	08000f10 	.word	0x08000f10
 8000264:	e000ed2c 	.word	0xe000ed2c
 8000268:	08000fd4 	.word	0x08000fd4
 800026c:	08000f40 	.word	0x08000f40
 8000270:	08000ff8 	.word	0x08000ff8

08000274 <mpu_setup>:
#include "core.h"

void mpu_setup(void) {
 8000274:	b480      	push	{r7}
 8000276:	af00      	add	r7, sp, #0

  /*dissable mpu*/
  MPU->CTRL = 0;
 8000278:	4b12      	ldr	r3, [pc, #72]	@ (80002c4 <mpu_setup+0x50>)
 800027a:	2200      	movs	r2, #0
 800027c:	605a      	str	r2, [r3, #4]

  /*region 0*/
  MPU->RNR = 0;
 800027e:	4b11      	ldr	r3, [pc, #68]	@ (80002c4 <mpu_setup+0x50>)
 8000280:	2200      	movs	r2, #0
 8000282:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sFLASHUserSpace);
 8000284:	4b0f      	ldr	r3, [pc, #60]	@ (80002c4 <mpu_setup+0x50>)
 8000286:	4a10      	ldr	r2, [pc, #64]	@ (80002c8 <mpu_setup+0x54>)
 8000288:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 800028a:	4b0e      	ldr	r3, [pc, #56]	@ (80002c4 <mpu_setup+0x50>)
 800028c:	4a0f      	ldr	r2, [pc, #60]	@ (80002cc <mpu_setup+0x58>)
 800028e:	611a      	str	r2, [r3, #16]
      (0 << MPU_RASR_XN_Pos) |     // Executable (XN = 0)
      (0b110 << MPU_RASR_AP_Pos) | // Privileged read-only user read-only
      (15 << MPU_RASR_SIZE_Pos) |  // 64 KB region
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 1;
 8000290:	4b0c      	ldr	r3, [pc, #48]	@ (80002c4 <mpu_setup+0x50>)
 8000292:	2201      	movs	r2, #1
 8000294:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sSRAMUserSpace);
 8000296:	4b0b      	ldr	r3, [pc, #44]	@ (80002c4 <mpu_setup+0x50>)
 8000298:	4a0d      	ldr	r2, [pc, #52]	@ (80002d0 <mpu_setup+0x5c>)
 800029a:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 800029c:	4b09      	ldr	r3, [pc, #36]	@ (80002c4 <mpu_setup+0x50>)
 800029e:	4a0d      	ldr	r2, [pc, #52]	@ (80002d4 <mpu_setup+0x60>)
 80002a0:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 2;
 80002a2:	4b08      	ldr	r3, [pc, #32]	@ (80002c4 <mpu_setup+0x50>)
 80002a4:	2202      	movs	r2, #2
 80002a6:	609a      	str	r2, [r3, #8]
  MPU->RBAR = USER_STACK_END;
 80002a8:	4b06      	ldr	r3, [pc, #24]	@ (80002c4 <mpu_setup+0x50>)
 80002aa:	4a0b      	ldr	r2, [pc, #44]	@ (80002d8 <mpu_setup+0x64>)
 80002ac:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 80002ae:	4b05      	ldr	r3, [pc, #20]	@ (80002c4 <mpu_setup+0x50>)
 80002b0:	4a08      	ldr	r2, [pc, #32]	@ (80002d4 <mpu_setup+0x60>)
 80002b2:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->CTRL = MPU_CTRL_PRIVDEFENA_Msk | MPU_CTRL_ENABLE_Msk;
 80002b4:	4b03      	ldr	r3, [pc, #12]	@ (80002c4 <mpu_setup+0x50>)
 80002b6:	2205      	movs	r2, #5
 80002b8:	605a      	str	r2, [r3, #4]
}
 80002ba:	bf00      	nop
 80002bc:	46bd      	mov	sp, r7
 80002be:	bc80      	pop	{r7}
 80002c0:	4770      	bx	lr
 80002c2:	bf00      	nop
 80002c4:	e000ed90 	.word	0xe000ed90
 80002c8:	08010000 	.word	0x08010000
 80002cc:	0600001f 	.word	0x0600001f
 80002d0:	20004000 	.word	0x20004000
 80002d4:	1300001d 	.word	0x1300001d
 80002d8:	20008000 	.word	0x20008000

080002dc <queue_init>:
#include "core.h"

/* queue functions */
void queue_init (queue_t* q){
 80002dc:	b480      	push	{r7}
 80002de:	b083      	sub	sp, #12
 80002e0:	af00      	add	r7, sp, #0
 80002e2:	6078      	str	r0, [r7, #4]
    q->size = 0;
 80002e4:	687b      	ldr	r3, [r7, #4]
 80002e6:	2200      	movs	r2, #0
 80002e8:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    q->front = 0xff;
 80002ec:	687b      	ldr	r3, [r7, #4]
 80002ee:	22ff      	movs	r2, #255	@ 0xff
 80002f0:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    q->rare = 0;
 80002f4:	687b      	ldr	r3, [r7, #4]
 80002f6:	2200      	movs	r2, #0
 80002f8:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
}
 80002fc:	bf00      	nop
 80002fe:	370c      	adds	r7, #12
 8000300:	46bd      	mov	sp, r7
 8000302:	bc80      	pop	{r7}
 8000304:	4770      	bx	lr

08000306 <queue_push>:

uint8_t queue_push (queue_t* q, user_process_t* process){
 8000306:	b480      	push	{r7}
 8000308:	b083      	sub	sp, #12
 800030a:	af00      	add	r7, sp, #0
 800030c:	6078      	str	r0, [r7, #4]
 800030e:	6039      	str	r1, [r7, #0]
    if (q->front == 0xff){
 8000310:	687b      	ldr	r3, [r7, #4]
 8000312:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8000316:	2bff      	cmp	r3, #255	@ 0xff
 8000318:	d104      	bne.n	8000324 <queue_push+0x1e>
        /* queue is empty */
        q->front = 0;
 800031a:	687b      	ldr	r3, [r7, #4]
 800031c:	2200      	movs	r2, #0
 800031e:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
 8000322:	e009      	b.n	8000338 <queue_push+0x32>
    }
    else if (q->rare == q->front) return -1;
 8000324:	687b      	ldr	r3, [r7, #4]
 8000326:	f893 207a 	ldrb.w	r2, [r3, #122]	@ 0x7a
 800032a:	687b      	ldr	r3, [r7, #4]
 800032c:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8000330:	429a      	cmp	r2, r3
 8000332:	d101      	bne.n	8000338 <queue_push+0x32>
 8000334:	23ff      	movs	r3, #255	@ 0xff
 8000336:	e023      	b.n	8000380 <queue_push+0x7a>

    q->processes [q->rare] = process;
 8000338:	687b      	ldr	r3, [r7, #4]
 800033a:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 800033e:	4619      	mov	r1, r3
 8000340:	687b      	ldr	r3, [r7, #4]
 8000342:	683a      	ldr	r2, [r7, #0]
 8000344:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
    q->rare = (q->rare + 1) % MAX_PROCESS_NUM;
 8000348:	687b      	ldr	r3, [r7, #4]
 800034a:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 800034e:	1c5a      	adds	r2, r3, #1
 8000350:	4b0e      	ldr	r3, [pc, #56]	@ (800038c <queue_push+0x86>)
 8000352:	fb83 1302 	smull	r1, r3, r3, r2
 8000356:	4413      	add	r3, r2
 8000358:	10d9      	asrs	r1, r3, #3
 800035a:	17d3      	asrs	r3, r2, #31
 800035c:	1ac9      	subs	r1, r1, r3
 800035e:	460b      	mov	r3, r1
 8000360:	011b      	lsls	r3, r3, #4
 8000362:	1a5b      	subs	r3, r3, r1
 8000364:	1ad1      	subs	r1, r2, r3
 8000366:	b2ca      	uxtb	r2, r1
 8000368:	687b      	ldr	r3, [r7, #4]
 800036a:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a

    q->size ++ ;
 800036e:	687b      	ldr	r3, [r7, #4]
 8000370:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 8000374:	3301      	adds	r3, #1
 8000376:	b2da      	uxtb	r2, r3
 8000378:	687b      	ldr	r3, [r7, #4]
 800037a:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 800037e:	2300      	movs	r3, #0
}
 8000380:	4618      	mov	r0, r3
 8000382:	370c      	adds	r7, #12
 8000384:	46bd      	mov	sp, r7
 8000386:	bc80      	pop	{r7}
 8000388:	4770      	bx	lr
 800038a:	bf00      	nop
 800038c:	88888889 	.word	0x88888889

08000390 <queue_pop>:

uint8_t queue_pop (queue_t* q){   
 8000390:	b480      	push	{r7}
 8000392:	b083      	sub	sp, #12
 8000394:	af00      	add	r7, sp, #0
 8000396:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff){
 8000398:	687b      	ldr	r3, [r7, #4]
 800039a:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 800039e:	2bff      	cmp	r3, #255	@ 0xff
 80003a0:	d101      	bne.n	80003a6 <queue_pop+0x16>
        /* q is empty*/
        return -1;
 80003a2:	23ff      	movs	r3, #255	@ 0xff
 80003a4:	e02b      	b.n	80003fe <queue_pop+0x6e>
    }
    q->front = (q->front + 1) % MAX_PROCESS_NUM;
 80003a6:	687b      	ldr	r3, [r7, #4]
 80003a8:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 80003ac:	1c5a      	adds	r2, r3, #1
 80003ae:	4b16      	ldr	r3, [pc, #88]	@ (8000408 <queue_pop+0x78>)
 80003b0:	fb83 1302 	smull	r1, r3, r3, r2
 80003b4:	4413      	add	r3, r2
 80003b6:	10d9      	asrs	r1, r3, #3
 80003b8:	17d3      	asrs	r3, r2, #31
 80003ba:	1ac9      	subs	r1, r1, r3
 80003bc:	460b      	mov	r3, r1
 80003be:	011b      	lsls	r3, r3, #4
 80003c0:	1a5b      	subs	r3, r3, r1
 80003c2:	1ad1      	subs	r1, r2, r3
 80003c4:	b2ca      	uxtb	r2, r1
 80003c6:	687b      	ldr	r3, [r7, #4]
 80003c8:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    if (q->front == q->rare){
 80003cc:	687b      	ldr	r3, [r7, #4]
 80003ce:	f893 2079 	ldrb.w	r2, [r3, #121]	@ 0x79
 80003d2:	687b      	ldr	r3, [r7, #4]
 80003d4:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 80003d8:	429a      	cmp	r2, r3
 80003da:	d107      	bne.n	80003ec <queue_pop+0x5c>
        q->front = 0xff;
 80003dc:	687b      	ldr	r3, [r7, #4]
 80003de:	22ff      	movs	r2, #255	@ 0xff
 80003e0:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
        q->rare = 0;
 80003e4:	687b      	ldr	r3, [r7, #4]
 80003e6:	2200      	movs	r2, #0
 80003e8:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
    }
    q->size --;
 80003ec:	687b      	ldr	r3, [r7, #4]
 80003ee:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 80003f2:	3b01      	subs	r3, #1
 80003f4:	b2da      	uxtb	r2, r3
 80003f6:	687b      	ldr	r3, [r7, #4]
 80003f8:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 80003fc:	2300      	movs	r3, #0
}
 80003fe:	4618      	mov	r0, r3
 8000400:	370c      	adds	r7, #12
 8000402:	46bd      	mov	sp, r7
 8000404:	bc80      	pop	{r7}
 8000406:	4770      	bx	lr
 8000408:	88888889 	.word	0x88888889

0800040c <queue_front>:

user_process_t* queue_front (queue_t *q){
 800040c:	b480      	push	{r7}
 800040e:	b083      	sub	sp, #12
 8000410:	af00      	add	r7, sp, #0
 8000412:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff)
 8000414:	687b      	ldr	r3, [r7, #4]
 8000416:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 800041a:	2bff      	cmp	r3, #255	@ 0xff
 800041c:	d101      	bne.n	8000422 <queue_front+0x16>
        return NULL;
 800041e:	2300      	movs	r3, #0
 8000420:	e006      	b.n	8000430 <queue_front+0x24>
    return q->processes [q->front];
 8000422:	687b      	ldr	r3, [r7, #4]
 8000424:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8000428:	461a      	mov	r2, r3
 800042a:	687b      	ldr	r3, [r7, #4]
 800042c:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
}
 8000430:	4618      	mov	r0, r3
 8000432:	370c      	adds	r7, #12
 8000434:	46bd      	mov	sp, r7
 8000436:	bc80      	pop	{r7}
 8000438:	4770      	bx	lr

0800043a <queue_empty>:

uint32_t queue_empty (queue_t *q){
 800043a:	b480      	push	{r7}
 800043c:	b083      	sub	sp, #12
 800043e:	af00      	add	r7, sp, #0
 8000440:	6078      	str	r0, [r7, #4]
    return q->front == 0xff;
 8000442:	687b      	ldr	r3, [r7, #4]
 8000444:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8000448:	2bff      	cmp	r3, #255	@ 0xff
 800044a:	bf0c      	ite	eq
 800044c:	2301      	moveq	r3, #1
 800044e:	2300      	movne	r3, #0
 8000450:	b2db      	uxtb	r3, r3
}
 8000452:	4618      	mov	r0, r3
 8000454:	370c      	adds	r7, #12
 8000456:	46bd      	mov	sp, r7
 8000458:	bc80      	pop	{r7}
 800045a:	4770      	bx	lr

0800045c <queue_size>:

uint32_t queue_size (queue_t *q){
 800045c:	b480      	push	{r7}
 800045e:	b083      	sub	sp, #12
 8000460:	af00      	add	r7, sp, #0
 8000462:	6078      	str	r0, [r7, #4]
    return q->size;
 8000464:	687b      	ldr	r3, [r7, #4]
 8000466:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
}
 800046a:	4618      	mov	r0, r3
 800046c:	370c      	adds	r7, #12
 800046e:	46bd      	mov	sp, r7
 8000470:	bc80      	pop	{r7}
 8000472:	4770      	bx	lr

08000474 <__NVIC_SetPendingIRQ>:
  \details Sets the pending bit of a device specific interrupt in the NVIC pending register.
  \param [in]      IRQn  Device specific interrupt number.
  \note    IRQn must not be negative.
 */
__STATIC_INLINE void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
 8000474:	b480      	push	{r7}
 8000476:	b083      	sub	sp, #12
 8000478:	af00      	add	r7, sp, #0
 800047a:	4603      	mov	r3, r0
 800047c:	71fb      	strb	r3, [r7, #7]
  if ((int32_t)(IRQn) >= 0)
 800047e:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000482:	2b00      	cmp	r3, #0
 8000484:	db0c      	blt.n	80004a0 <__NVIC_SetPendingIRQ+0x2c>
  {
    NVIC->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
 8000486:	79fb      	ldrb	r3, [r7, #7]
 8000488:	f003 021f 	and.w	r2, r3, #31
 800048c:	4907      	ldr	r1, [pc, #28]	@ (80004ac <__NVIC_SetPendingIRQ+0x38>)
 800048e:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000492:	095b      	lsrs	r3, r3, #5
 8000494:	2001      	movs	r0, #1
 8000496:	fa00 f202 	lsl.w	r2, r0, r2
 800049a:	3340      	adds	r3, #64	@ 0x40
 800049c:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
  }
}
 80004a0:	bf00      	nop
 80004a2:	370c      	adds	r7, #12
 80004a4:	46bd      	mov	sp, r7
 80004a6:	bc80      	pop	{r7}
 80004a8:	4770      	bx	lr
 80004aa:	bf00      	nop
 80004ac:	e000e100 	.word	0xe000e100

080004b0 <semaphore_init>:
#include "core.h"

extern queue_t ready_queue;
extern uint8_t process_count;

void semaphore_init(semaphore_t *sema, uint8_t val) {
 80004b0:	b580      	push	{r7, lr}
 80004b2:	b082      	sub	sp, #8
 80004b4:	af00      	add	r7, sp, #0
 80004b6:	6078      	str	r0, [r7, #4]
 80004b8:	460b      	mov	r3, r1
 80004ba:	70fb      	strb	r3, [r7, #3]
  sema->value = val; // unlocked
 80004bc:	687b      	ldr	r3, [r7, #4]
 80004be:	78fa      	ldrb	r2, [r7, #3]
 80004c0:	701a      	strb	r2, [r3, #0]
  queue_init(&(sema->waiting_queue));
 80004c2:	687b      	ldr	r3, [r7, #4]
 80004c4:	3304      	adds	r3, #4
 80004c6:	4618      	mov	r0, r3
 80004c8:	f7ff ff08 	bl	80002dc <queue_init>
}
 80004cc:	bf00      	nop
 80004ce:	3708      	adds	r7, #8
 80004d0:	46bd      	mov	sp, r7
 80004d2:	bd80      	pop	{r7, pc}

080004d4 <semaphore_lock>:

/* this has to be atomic */
void semaphore_lock(semaphore_t *sema) {
 80004d4:	b580      	push	{r7, lr}
 80004d6:	b084      	sub	sp, #16
 80004d8:	af00      	add	r7, sp, #0
 80004da:	6078      	str	r0, [r7, #4]
  \details Disables IRQ interrupts by setting special-purpose register PRIMASK.
           Can only be executed in Privileged modes.
 */
__STATIC_FORCEINLINE void __disable_irq(void)
{
  __ASM volatile ("cpsid i" : : : "memory");
 80004dc:	b672      	cpsid	i
}
 80004de:	bf00      	nop
  __disable_irq();
  if (sema->value == 0) { // semaphore cannot be locked ...
 80004e0:	687b      	ldr	r3, [r7, #4]
 80004e2:	781b      	ldrb	r3, [r3, #0]
 80004e4:	2b00      	cmp	r3, #0
 80004e6:	d112      	bne.n	800050e <semaphore_lock+0x3a>
    user_process_t *running_process =
        *((user_process_t **)(RUNNING_PROCESS_AD));
 80004e8:	4b0e      	ldr	r3, [pc, #56]	@ (8000524 <semaphore_lock+0x50>)
    user_process_t *running_process =
 80004ea:	681b      	ldr	r3, [r3, #0]
 80004ec:	60fb      	str	r3, [r7, #12]
    queue_push(&(sema->waiting_queue), running_process);
 80004ee:	687b      	ldr	r3, [r7, #4]
 80004f0:	3304      	adds	r3, #4
 80004f2:	68f9      	ldr	r1, [r7, #12]
 80004f4:	4618      	mov	r0, r3
 80004f6:	f7ff ff06 	bl	8000306 <queue_push>
    running_process->state = WAITING_STATE;
 80004fa:	68fb      	ldr	r3, [r7, #12]
 80004fc:	2203      	movs	r2, #3
 80004fe:	62da      	str	r2, [r3, #44]	@ 0x2c

//    schedular ();

    /* call PendSV_Handler for context switching */
    //PendSV_Handler();
    NVIC_SetPendingIRQ (PendSV_IRQn);
 8000500:	f06f 0001 	mvn.w	r0, #1
 8000504:	f7ff ffb6 	bl	8000474 <__NVIC_SetPendingIRQ>
  __ASM volatile ("cpsie i" : : : "memory");
 8000508:	b662      	cpsie	i
}
 800050a:	bf00      	nop

    __enable_irq();
    return;
 800050c:	e007      	b.n	800051e <semaphore_lock+0x4a>
  }
  sema->value--;
 800050e:	687b      	ldr	r3, [r7, #4]
 8000510:	781b      	ldrb	r3, [r3, #0]
 8000512:	3b01      	subs	r3, #1
 8000514:	b2da      	uxtb	r2, r3
 8000516:	687b      	ldr	r3, [r7, #4]
 8000518:	701a      	strb	r2, [r3, #0]
  __ASM volatile ("cpsie i" : : : "memory");
 800051a:	b662      	cpsie	i
}
 800051c:	bf00      	nop
  __enable_irq();
}
 800051e:	3710      	adds	r7, #16
 8000520:	46bd      	mov	sp, r7
 8000522:	bd80      	pop	{r7, pc}
 8000524:	20016004 	.word	0x20016004

08000528 <semaphore_unlock>:

void semaphore_unlock(semaphore_t *sema) {
 8000528:	b580      	push	{r7, lr}
 800052a:	b084      	sub	sp, #16
 800052c:	af00      	add	r7, sp, #0
 800052e:	6078      	str	r0, [r7, #4]
  __ASM volatile ("cpsid i" : : : "memory");
 8000530:	b672      	cpsid	i
}
 8000532:	bf00      	nop
  __disable_irq();
  sema->value++;
 8000534:	687b      	ldr	r3, [r7, #4]
 8000536:	781b      	ldrb	r3, [r3, #0]
 8000538:	3301      	adds	r3, #1
 800053a:	b2da      	uxtb	r2, r3
 800053c:	687b      	ldr	r3, [r7, #4]
 800053e:	701a      	strb	r2, [r3, #0]
  /* unlocked */
  user_process_t *process = queue_front(&(sema->waiting_queue));
 8000540:	687b      	ldr	r3, [r7, #4]
 8000542:	3304      	adds	r3, #4
 8000544:	4618      	mov	r0, r3
 8000546:	f7ff ff61 	bl	800040c <queue_front>
 800054a:	60f8      	str	r0, [r7, #12]
  if (!process) {
 800054c:	68fb      	ldr	r3, [r7, #12]
 800054e:	2b00      	cmp	r3, #0
 8000550:	d102      	bne.n	8000558 <semaphore_unlock+0x30>
  __ASM volatile ("cpsie i" : : : "memory");
 8000552:	b662      	cpsie	i
}
 8000554:	bf00      	nop
    /* no process is waiting */
    __enable_irq();
    return;
 8000556:	e00d      	b.n	8000574 <semaphore_unlock+0x4c>
  }
  queue_pop(&(sema->waiting_queue));
 8000558:	687b      	ldr	r3, [r7, #4]
 800055a:	3304      	adds	r3, #4
 800055c:	4618      	mov	r0, r3
 800055e:	f7ff ff17 	bl	8000390 <queue_pop>
  process->state = READY_STATE;
 8000562:	68fb      	ldr	r3, [r7, #12]
 8000564:	2200      	movs	r2, #0
 8000566:	62da      	str	r2, [r3, #44]	@ 0x2c
  queue_push(&ready_queue, process);
 8000568:	68f9      	ldr	r1, [r7, #12]
 800056a:	4804      	ldr	r0, [pc, #16]	@ (800057c <semaphore_unlock+0x54>)
 800056c:	f7ff fecb 	bl	8000306 <queue_push>
  __ASM volatile ("cpsie i" : : : "memory");
 8000570:	b662      	cpsie	i
}
 8000572:	bf00      	nop
  __enable_irq();
}
 8000574:	3710      	adds	r7, #16
 8000576:	46bd      	mov	sp, r7
 8000578:	bd80      	pop	{r7, pc}
 800057a:	bf00      	nop
 800057c:	200003f4 	.word	0x200003f4

08000580 <schedular>:
/* important variable from main.c */
extern user_process_t process[MAX_PROCESS_NUM];
extern queue_t ready_queue;
extern semaphore_t sem_usart1;

void schedular(void) {
 8000580:	b580      	push	{r7, lr}
 8000582:	b084      	sub	sp, #16
 8000584:	af00      	add	r7, sp, #0

  /* Round Robin (FCFS + time slice)*/
  user_process_t *picked_process = NULL;
 8000586:	2300      	movs	r3, #0
 8000588:	60fb      	str	r3, [r7, #12]
  user_process_t *running_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 800058a:	4b1a      	ldr	r3, [pc, #104]	@ (80005f4 <schedular+0x74>)
 800058c:	681b      	ldr	r3, [r3, #0]
 800058e:	60bb      	str	r3, [r7, #8]


  // we could use a priority queue here to support priority...
  picked_process = queue_front(&ready_queue);
 8000590:	4819      	ldr	r0, [pc, #100]	@ (80005f8 <schedular+0x78>)
 8000592:	f7ff ff3b 	bl	800040c <queue_front>
 8000596:	60f8      	str	r0, [r7, #12]
  uint8_t status = queue_pop(&ready_queue);
 8000598:	4817      	ldr	r0, [pc, #92]	@ (80005f8 <schedular+0x78>)
 800059a:	f7ff fef9 	bl	8000390 <queue_pop>
 800059e:	4603      	mov	r3, r0
 80005a0:	71fb      	strb	r3, [r7, #7]


  // if ready queue is empty, then pick the runnung process
  if (0xff == status || !picked_process){
 80005a2:	79fb      	ldrb	r3, [r7, #7]
 80005a4:	2bff      	cmp	r3, #255	@ 0xff
 80005a6:	d002      	beq.n	80005ae <schedular+0x2e>
 80005a8:	68fb      	ldr	r3, [r7, #12]
 80005aa:	2b00      	cmp	r3, #0
 80005ac:	d108      	bne.n	80005c0 <schedular+0x40>
    picked_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 80005ae:	4b11      	ldr	r3, [pc, #68]	@ (80005f4 <schedular+0x74>)
 80005b0:	681b      	ldr	r3, [r3, #0]
 80005b2:	60fb      	str	r3, [r7, #12]
    // dissable systick to remove the context switching overhead if there is only one process .
    SysTick->CTRL &= ~(SysTick_CTRL_ENABLE_Msk);
 80005b4:	4b11      	ldr	r3, [pc, #68]	@ (80005fc <schedular+0x7c>)
 80005b6:	681b      	ldr	r3, [r3, #0]
 80005b8:	4a10      	ldr	r2, [pc, #64]	@ (80005fc <schedular+0x7c>)
 80005ba:	f023 0301 	bic.w	r3, r3, #1
 80005be:	6013      	str	r3, [r2, #0]
    // better if the last standing process is too large  or there is only one process to begin with
  }

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);
 80005c0:	4a0f      	ldr	r2, [pc, #60]	@ (8000600 <schedular+0x80>)
 80005c2:	68fb      	ldr	r3, [r7, #12]
 80005c4:	6013      	str	r3, [r2, #0]
  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE &&
 80005c6:	68bb      	ldr	r3, [r7, #8]
 80005c8:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 80005ca:	2b02      	cmp	r3, #2
 80005cc:	d00a      	beq.n	80005e4 <schedular+0x64>
      running_process->state != WAITING_STATE) {
 80005ce:	68bb      	ldr	r3, [r7, #8]
 80005d0:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
  if (running_process->state != SUSPEND_STATE &&
 80005d2:	2b03      	cmp	r3, #3
 80005d4:	d006      	beq.n	80005e4 <schedular+0x64>
    queue_push(&ready_queue, running_process);
 80005d6:	68b9      	ldr	r1, [r7, #8]
 80005d8:	4807      	ldr	r0, [pc, #28]	@ (80005f8 <schedular+0x78>)
 80005da:	f7ff fe94 	bl	8000306 <queue_push>
    running_process->state = READY_STATE;
 80005de:	68bb      	ldr	r3, [r7, #8]
 80005e0:	2200      	movs	r2, #0
 80005e2:	62da      	str	r2, [r3, #44]	@ 0x2c
  }

  picked_process->state = RUNNING_STATE;
 80005e4:	68fb      	ldr	r3, [r7, #12]
 80005e6:	2201      	movs	r2, #1
 80005e8:	62da      	str	r2, [r3, #44]	@ 0x2c
}
 80005ea:	bf00      	nop
 80005ec:	3710      	adds	r7, #16
 80005ee:	46bd      	mov	sp, r7
 80005f0:	bd80      	pop	{r7, pc}
 80005f2:	bf00      	nop
 80005f4:	20016004 	.word	0x20016004
 80005f8:	200003f4 	.word	0x200003f4
 80005fc:	e000e010 	.word	0xe000e010
 8000600:	20016008 	.word	0x20016008

08000604 <enterCRITICAL>:


extern semaphore_t sem_usart1;
extern uint8_t process_count;

void enterCRITICAL(void) { __disable_irq(); }
 8000604:	b480      	push	{r7}
 8000606:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsid i" : : : "memory");
 8000608:	b672      	cpsid	i
}
 800060a:	bf00      	nop
 800060c:	bf00      	nop
 800060e:	46bd      	mov	sp, r7
 8000610:	bc80      	pop	{r7}
 8000612:	4770      	bx	lr

08000614 <exitCRITICAL>:

void exitCRITICAL(void) { __enable_irq(); }
 8000614:	b480      	push	{r7}
 8000616:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsie i" : : : "memory");
 8000618:	b662      	cpsie	i
}
 800061a:	bf00      	nop
 800061c:	bf00      	nop
 800061e:	46bd      	mov	sp, r7
 8000620:	bc80      	pop	{r7}
 8000622:	4770      	bx	lr

08000624 <_strlen>:

uint32_t _strlen(const char *msg) {
 8000624:	b480      	push	{r7}
 8000626:	b085      	sub	sp, #20
 8000628:	af00      	add	r7, sp, #0
 800062a:	6078      	str	r0, [r7, #4]

  int i = 0;
 800062c:	2300      	movs	r3, #0
 800062e:	60fb      	str	r3, [r7, #12]
  while (msg[i++] != '\0')
 8000630:	bf00      	nop
 8000632:	68fb      	ldr	r3, [r7, #12]
 8000634:	1c5a      	adds	r2, r3, #1
 8000636:	60fa      	str	r2, [r7, #12]
 8000638:	461a      	mov	r2, r3
 800063a:	687b      	ldr	r3, [r7, #4]
 800063c:	4413      	add	r3, r2
 800063e:	781b      	ldrb	r3, [r3, #0]
 8000640:	2b00      	cmp	r3, #0
 8000642:	d1f6      	bne.n	8000632 <_strlen+0xe>
    ;
  return i - 1;
 8000644:	68fb      	ldr	r3, [r7, #12]
 8000646:	3b01      	subs	r3, #1
}
 8000648:	4618      	mov	r0, r3
 800064a:	3714      	adds	r7, #20
 800064c:	46bd      	mov	sp, r7
 800064e:	bc80      	pop	{r7}
 8000650:	4770      	bx	lr

08000652 <hex_str>:

char *hex_str(uint32_t value, char *out) {
 8000652:	b4b0      	push	{r4, r5, r7}
 8000654:	b08b      	sub	sp, #44	@ 0x2c
 8000656:	af00      	add	r7, sp, #0
 8000658:	6078      	str	r0, [r7, #4]
 800065a:	6039      	str	r1, [r7, #0]

  char hex_char[] = "0123456789abcdef";
 800065c:	4b1b      	ldr	r3, [pc, #108]	@ (80006cc <hex_str+0x7a>)
 800065e:	f107 0408 	add.w	r4, r7, #8
 8000662:	461d      	mov	r5, r3
 8000664:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
 8000666:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 8000668:	682b      	ldr	r3, [r5, #0]
 800066a:	7023      	strb	r3, [r4, #0]
  out[0] = '0';
 800066c:	683b      	ldr	r3, [r7, #0]
 800066e:	2230      	movs	r2, #48	@ 0x30
 8000670:	701a      	strb	r2, [r3, #0]
  out[1] = 'x';
 8000672:	683b      	ldr	r3, [r7, #0]
 8000674:	3301      	adds	r3, #1
 8000676:	2278      	movs	r2, #120	@ 0x78
 8000678:	701a      	strb	r2, [r3, #0]

  for (int i = 0; i < 8; i++) {
 800067a:	2300      	movs	r3, #0
 800067c:	627b      	str	r3, [r7, #36]	@ 0x24
 800067e:	e01c      	b.n	80006ba <hex_str+0x68>
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
 8000680:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8000682:	009b      	lsls	r3, r3, #2
 8000684:	220f      	movs	r2, #15
 8000686:	fa02 f303 	lsl.w	r3, r2, r3
 800068a:	461a      	mov	r2, r3
 800068c:	687b      	ldr	r3, [r7, #4]
 800068e:	401a      	ands	r2, r3
 8000690:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8000692:	009b      	lsls	r3, r3, #2
 8000694:	fa22 f303 	lsr.w	r3, r2, r3
 8000698:	623b      	str	r3, [r7, #32]
    int j = 9 - i;
 800069a:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 800069c:	f1c3 0309 	rsb	r3, r3, #9
 80006a0:	61fb      	str	r3, [r7, #28]
    out[j] = hex_char[ind];
 80006a2:	69fb      	ldr	r3, [r7, #28]
 80006a4:	683a      	ldr	r2, [r7, #0]
 80006a6:	4413      	add	r3, r2
 80006a8:	f107 0108 	add.w	r1, r7, #8
 80006ac:	6a3a      	ldr	r2, [r7, #32]
 80006ae:	440a      	add	r2, r1
 80006b0:	7812      	ldrb	r2, [r2, #0]
 80006b2:	701a      	strb	r2, [r3, #0]
  for (int i = 0; i < 8; i++) {
 80006b4:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006b6:	3301      	adds	r3, #1
 80006b8:	627b      	str	r3, [r7, #36]	@ 0x24
 80006ba:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006bc:	2b07      	cmp	r3, #7
 80006be:	dddf      	ble.n	8000680 <hex_str+0x2e>
  }
}
 80006c0:	bf00      	nop
 80006c2:	4618      	mov	r0, r3
 80006c4:	372c      	adds	r7, #44	@ 0x2c
 80006c6:	46bd      	mov	sp, r7
 80006c8:	bcb0      	pop	{r4, r5, r7}
 80006ca:	4770      	bx	lr
 80006cc:	08001024 	.word	0x08001024

080006d0 <printf>:

void printf(const char *msg, uint32_t address) {
 80006d0:	b580      	push	{r7, lr}
 80006d2:	b0a4      	sub	sp, #144	@ 0x90
 80006d4:	af00      	add	r7, sp, #0
 80006d6:	6078      	str	r0, [r7, #4]
 80006d8:	6039      	str	r1, [r7, #0]

  uint32_t value = *((uint32_t *)address);
 80006da:	683b      	ldr	r3, [r7, #0]
 80006dc:	681b      	ldr	r3, [r3, #0]
 80006de:	67fb      	str	r3, [r7, #124]	@ 0x7c
  uint32_t msg_size = _strlen(msg);
 80006e0:	6878      	ldr	r0, [r7, #4]
 80006e2:	f7ff ff9f 	bl	8000624 <_strlen>
 80006e6:	67b8      	str	r0, [r7, #120]	@ 0x78

  if (msg_size + 9 > MAX_STR_SIZE) {
 80006e8:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 80006ea:	3309      	adds	r3, #9
 80006ec:	2b64      	cmp	r3, #100	@ 0x64
 80006ee:	d904      	bls.n	80006fa <printf+0x2a>
    __usart1_print("too large error message !!\n\r", MAX_STR_SIZE);
 80006f0:	2164      	movs	r1, #100	@ 0x64
 80006f2:	483d      	ldr	r0, [pc, #244]	@ (80007e8 <printf+0x118>)
 80006f4:	f000 fae4 	bl	8000cc0 <__usart1_print>
 80006f8:	e072      	b.n	80007e0 <printf+0x110>
    return;
  }
  char hex[10];
  char __msg[MAX_STR_SIZE];

  uint32_t i = 0;
 80006fa:	2300      	movs	r3, #0
 80006fc:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
  int p = 0, q = 0;
 8000700:	2300      	movs	r3, #0
 8000702:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
 8000706:	2300      	movs	r3, #0
 8000708:	f8c7 3084 	str.w	r3, [r7, #132]	@ 0x84
  bool single_sub = false;
 800070c:	2300      	movs	r3, #0
 800070e:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83

  for (; i < msg_size; i++) {
 8000712:	e04d      	b.n	80007b0 <printf+0xe0>

    if (msg[i] == '%' && !single_sub) {
 8000714:	687a      	ldr	r2, [r7, #4]
 8000716:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 800071a:	4413      	add	r3, r2
 800071c:	781b      	ldrb	r3, [r3, #0]
 800071e:	2b25      	cmp	r3, #37	@ 0x25
 8000720:	d12f      	bne.n	8000782 <printf+0xb2>
 8000722:	f897 3083 	ldrb.w	r3, [r7, #131]	@ 0x83
 8000726:	f083 0301 	eor.w	r3, r3, #1
 800072a:	b2db      	uxtb	r3, r3
 800072c:	2b00      	cmp	r3, #0
 800072e:	d028      	beq.n	8000782 <printf+0xb2>
      hex_str(value, hex);
 8000730:	f107 036c 	add.w	r3, r7, #108	@ 0x6c
 8000734:	4619      	mov	r1, r3
 8000736:	6ff8      	ldr	r0, [r7, #124]	@ 0x7c
 8000738:	f7ff ff8b 	bl	8000652 <hex_str>

      while (q - p < 10) {
 800073c:	e011      	b.n	8000762 <printf+0x92>
        __msg[q++] = hex[q - p];
 800073e:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 8000742:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8000746:	1ad2      	subs	r2, r2, r3
 8000748:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 800074c:	1c59      	adds	r1, r3, #1
 800074e:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 8000752:	3290      	adds	r2, #144	@ 0x90
 8000754:	443a      	add	r2, r7
 8000756:	f812 2c24 	ldrb.w	r2, [r2, #-36]
 800075a:	3390      	adds	r3, #144	@ 0x90
 800075c:	443b      	add	r3, r7
 800075e:	f803 2c88 	strb.w	r2, [r3, #-136]
      while (q - p < 10) {
 8000762:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 8000766:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 800076a:	1ad3      	subs	r3, r2, r3
 800076c:	2b09      	cmp	r3, #9
 800076e:	dde6      	ble.n	800073e <printf+0x6e>
      }
      p++;
 8000770:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8000774:	3301      	adds	r3, #1
 8000776:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
      single_sub = true;
 800077a:	2301      	movs	r3, #1
 800077c:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83
 8000780:	e011      	b.n	80007a6 <printf+0xd6>
    } else
      __msg[q++] = msg[p++];
 8000782:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8000786:	1c5a      	adds	r2, r3, #1
 8000788:	f8c7 2088 	str.w	r2, [r7, #136]	@ 0x88
 800078c:	461a      	mov	r2, r3
 800078e:	687b      	ldr	r3, [r7, #4]
 8000790:	441a      	add	r2, r3
 8000792:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 8000796:	1c59      	adds	r1, r3, #1
 8000798:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 800079c:	7812      	ldrb	r2, [r2, #0]
 800079e:	3390      	adds	r3, #144	@ 0x90
 80007a0:	443b      	add	r3, r7
 80007a2:	f803 2c88 	strb.w	r2, [r3, #-136]
  for (; i < msg_size; i++) {
 80007a6:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 80007aa:	3301      	adds	r3, #1
 80007ac:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
 80007b0:	f8d7 208c 	ldr.w	r2, [r7, #140]	@ 0x8c
 80007b4:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 80007b6:	429a      	cmp	r2, r3
 80007b8:	d3ac      	bcc.n	8000714 <printf+0x44>
  }
  __msg[q] = '\0';
 80007ba:	f107 0208 	add.w	r2, r7, #8
 80007be:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 80007c2:	4413      	add	r3, r2
 80007c4:	2200      	movs	r2, #0
 80007c6:	701a      	strb	r2, [r3, #0]
  __usart1_print(__msg, _strlen(__msg));
 80007c8:	f107 0308 	add.w	r3, r7, #8
 80007cc:	4618      	mov	r0, r3
 80007ce:	f7ff ff29 	bl	8000624 <_strlen>
 80007d2:	4602      	mov	r2, r0
 80007d4:	f107 0308 	add.w	r3, r7, #8
 80007d8:	4611      	mov	r1, r2
 80007da:	4618      	mov	r0, r3
 80007dc:	f000 fa70 	bl	8000cc0 <__usart1_print>
}
 80007e0:	3790      	adds	r7, #144	@ 0x90
 80007e2:	46bd      	mov	sp, r7
 80007e4:	bd80      	pop	{r7, pc}
 80007e6:	bf00      	nop
 80007e8:	08001038 	.word	0x08001038

080007ec <syscall__printf>:

void syscall__printf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 80007ec:	b580      	push	{r7, lr}
 80007ee:	b084      	sub	sp, #16
 80007f0:	af00      	add	r7, sp, #0
 80007f2:	60f8      	str	r0, [r7, #12]
 80007f4:	60b9      	str	r1, [r7, #8]
 80007f6:	607a      	str	r2, [r7, #4]
 80007f8:	603b      	str	r3, [r7, #0]
  semaphore_lock(&sem_usart1);
 80007fa:	4807      	ldr	r0, [pc, #28]	@ (8000818 <syscall__printf+0x2c>)
 80007fc:	f7ff fe6a 	bl	80004d4 <semaphore_lock>
  printf((const char *)a, b);
 8000800:	68fb      	ldr	r3, [r7, #12]
 8000802:	68b9      	ldr	r1, [r7, #8]
 8000804:	4618      	mov	r0, r3
 8000806:	f7ff ff63 	bl	80006d0 <printf>
  semaphore_unlock(&sem_usart1);
 800080a:	4803      	ldr	r0, [pc, #12]	@ (8000818 <syscall__printf+0x2c>)
 800080c:	f7ff fe8c 	bl	8000528 <semaphore_unlock>
}
 8000810:	bf00      	nop
 8000812:	3710      	adds	r7, #16
 8000814:	46bd      	mov	sp, r7
 8000816:	bd80      	pop	{r7, pc}
 8000818:	2000002c 	.word	0x2000002c

0800081c <syscall__scanf>:

void syscall__scanf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 800081c:	b480      	push	{r7}
 800081e:	b085      	sub	sp, #20
 8000820:	af00      	add	r7, sp, #0
 8000822:	60f8      	str	r0, [r7, #12]
 8000824:	60b9      	str	r1, [r7, #8]
 8000826:	607a      	str	r2, [r7, #4]
 8000828:	603b      	str	r3, [r7, #0]

  while (1)
 800082a:	e7fe      	b.n	800082a <syscall__scanf+0xe>

0800082c <syscall__process_exit>:
    ;
}

void syscall__process_exit (uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 800082c:	b580      	push	{r7, lr}
 800082e:	b084      	sub	sp, #16
 8000830:	af00      	add	r7, sp, #0
 8000832:	60f8      	str	r0, [r7, #12]
 8000834:	60b9      	str	r1, [r7, #8]
 8000836:	607a      	str	r2, [r7, #4]
 8000838:	603b      	str	r3, [r7, #0]
  // ignore  all the parameters
  process_exit ();
 800083a:	f000 f823 	bl	8000884 <process_exit>
}
 800083e:	bf00      	nop
 8000840:	3710      	adds	r7, #16
 8000842:	46bd      	mov	sp, r7
 8000844:	bd80      	pop	{r7, pc}
 8000846:	bf00      	nop

08000848 <__NVIC_SetPendingIRQ>:
{
 8000848:	b480      	push	{r7}
 800084a:	b083      	sub	sp, #12
 800084c:	af00      	add	r7, sp, #0
 800084e:	4603      	mov	r3, r0
 8000850:	71fb      	strb	r3, [r7, #7]
  if ((int32_t)(IRQn) >= 0)
 8000852:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000856:	2b00      	cmp	r3, #0
 8000858:	db0c      	blt.n	8000874 <__NVIC_SetPendingIRQ+0x2c>
    NVIC->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
 800085a:	79fb      	ldrb	r3, [r7, #7]
 800085c:	f003 021f 	and.w	r2, r3, #31
 8000860:	4907      	ldr	r1, [pc, #28]	@ (8000880 <__NVIC_SetPendingIRQ+0x38>)
 8000862:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000866:	095b      	lsrs	r3, r3, #5
 8000868:	2001      	movs	r0, #1
 800086a:	fa00 f202 	lsl.w	r2, r0, r2
 800086e:	3340      	adds	r3, #64	@ 0x40
 8000870:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
}
 8000874:	bf00      	nop
 8000876:	370c      	adds	r7, #12
 8000878:	46bd      	mov	sp, r7
 800087a:	bc80      	pop	{r7}
 800087c:	4770      	bx	lr
 800087e:	bf00      	nop
 8000880:	e000e100 	.word	0xe000e100

08000884 <process_exit>:
void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind);
void launch_process (void);


// if any of the process returns from mainx funcktion, this function wwill be called
void process_exit (void) {
 8000884:	b580      	push	{r7, lr}
 8000886:	b082      	sub	sp, #8
 8000888:	af00      	add	r7, sp, #0

  // i dont know why i was getting hardfault when using <*(user_process_t **) RUNNING_PROCESS_AD> T_T 
  // got it .. should have used () to enclosed the constant in define.h file !!!
  user_process_t *process = *(user_process_t **)(RUNNING_PROCESS_AD);
 800088a:	4b0a      	ldr	r3, [pc, #40]	@ (80008b4 <process_exit+0x30>)
 800088c:	681b      	ldr	r3, [r3, #0]
 800088e:	607b      	str	r3, [r7, #4]
  printf ("process with process id <%d> is terminated \n\r",
 8000890:	687b      	ldr	r3, [r7, #4]
 8000892:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8000894:	4619      	mov	r1, r3
 8000896:	4808      	ldr	r0, [pc, #32]	@ (80008b8 <process_exit+0x34>)
 8000898:	f7ff ff1a 	bl	80006d0 <printf>
            process->process_id);
  // remove the process from the queue , call context switching and return
  
  // suspend the process
  process -> state = SUSPEND_STATE;
 800089c:	687b      	ldr	r3, [r7, #4]
 800089e:	2202      	movs	r2, #2
 80008a0:	62da      	str	r2, [r3, #44]	@ 0x2c
 
  // set the pendsv (to trigger context switching)
  NVIC_SetPendingIRQ (PendSV_IRQn);
 80008a2:	f06f 0001 	mvn.w	r0, #1
 80008a6:	f7ff ffcf 	bl	8000848 <__NVIC_SetPendingIRQ>
}
 80008aa:	bf00      	nop
 80008ac:	3708      	adds	r7, #8
 80008ae:	46bd      	mov	sp, r7
 80008b0:	bd80      	pop	{r7, pc}
 80008b2:	bf00      	nop
 80008b4:	20016004 	.word	0x20016004
 80008b8:	08001058 	.word	0x08001058

080008bc <main>:

int main() {
 80008bc:	b580      	push	{r7, lr}
 80008be:	b086      	sub	sp, #24
 80008c0:	af00      	add	r7, sp, #0

    SCB->SHP[10] = 0xff;    // set the PendSV to be the lowest priority...
 80008c2:	4b54      	ldr	r3, [pc, #336]	@ (8000a14 <main+0x158>)
 80008c4:	22ff      	movs	r2, #255	@ 0xff
 80008c6:	f883 2022 	strb.w	r2, [r3, #34]	@ 0x22

    /* some init code */
    __usart1_init ();
 80008ca:	f000 f9b7 	bl	8000c3c <__usart1_init>
    queue_init (&ready_queue);
 80008ce:	4852      	ldr	r0, [pc, #328]	@ (8000a18 <main+0x15c>)
 80008d0:	f7ff fd04 	bl	80002dc <queue_init>
    semaphore_init (&sem_usart1, 1);
 80008d4:	2101      	movs	r1, #1
 80008d6:	4851      	ldr	r0, [pc, #324]	@ (8000a1c <main+0x160>)
 80008d8:	f7ff fdea 	bl	80004b0 <semaphore_init>

    if (process_count < 1 || process_count > MAX_PROCESS_NUM){
 80008dc:	4b50      	ldr	r3, [pc, #320]	@ (8000a20 <main+0x164>)
 80008de:	781b      	ldrb	r3, [r3, #0]
 80008e0:	2b00      	cmp	r3, #0
 80008e2:	d003      	beq.n	80008ec <main+0x30>
 80008e4:	4b4e      	ldr	r3, [pc, #312]	@ (8000a20 <main+0x164>)
 80008e6:	781b      	ldrb	r3, [r3, #0]
 80008e8:	2b0f      	cmp	r3, #15
 80008ea:	d904      	bls.n	80008f6 <main+0x3a>
        printf ("ERROR in the number of process ....\n\r", 0x0);
 80008ec:	2100      	movs	r1, #0
 80008ee:	484d      	ldr	r0, [pc, #308]	@ (8000a24 <main+0x168>)
 80008f0:	f7ff feee 	bl	80006d0 <printf>
        while (1);
 80008f4:	e7fe      	b.n	80008f4 <main+0x38>
    }

    /******************** fault handler init ***************************/
    
    // enable faults (without this any fault = hardfault)
    SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;
 80008f6:	4b47      	ldr	r3, [pc, #284]	@ (8000a14 <main+0x158>)
 80008f8:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80008fa:	4a46      	ldr	r2, [pc, #280]	@ (8000a14 <main+0x158>)
 80008fc:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
 8000900:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;
 8000902:	4b44      	ldr	r3, [pc, #272]	@ (8000a14 <main+0x158>)
 8000904:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000906:	4a43      	ldr	r2, [pc, #268]	@ (8000a14 <main+0x158>)
 8000908:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
 800090c:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;
 800090e:	4b41      	ldr	r3, [pc, #260]	@ (8000a14 <main+0x158>)
 8000910:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000912:	4a40      	ldr	r2, [pc, #256]	@ (8000a14 <main+0x158>)
 8000914:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 8000918:	6253      	str	r3, [r2, #36]	@ 0x24



    /* init syscall table */
    Syscall_Table[0] =  syscall__printf;
 800091a:	4b43      	ldr	r3, [pc, #268]	@ (8000a28 <main+0x16c>)
 800091c:	4a43      	ldr	r2, [pc, #268]	@ (8000a2c <main+0x170>)
 800091e:	601a      	str	r2, [r3, #0]
    Syscall_Table[1] =  syscall__scanf;
 8000920:	4b41      	ldr	r3, [pc, #260]	@ (8000a28 <main+0x16c>)
 8000922:	4a43      	ldr	r2, [pc, #268]	@ (8000a30 <main+0x174>)
 8000924:	605a      	str	r2, [r3, #4]
    Syscall_Table[2] =  syscall__process_exit;
 8000926:	4b40      	ldr	r3, [pc, #256]	@ (8000a28 <main+0x16c>)
 8000928:	4a42      	ldr	r2, [pc, #264]	@ (8000a34 <main+0x178>)
 800092a:	609a      	str	r2, [r3, #8]

    *(uint32_t *)(SYSCALL_TABLE_AD) = (uint32_t)(Syscall_Table);
 800092c:	4b42      	ldr	r3, [pc, #264]	@ (8000a38 <main+0x17c>)
 800092e:	4a3e      	ldr	r2, [pc, #248]	@ (8000a28 <main+0x16c>)
 8000930:	601a      	str	r2, [r3, #0]
    
    uint32_t psp_val = USER_STACK_INIT;
 8000932:	4b42      	ldr	r3, [pc, #264]	@ (8000a3c <main+0x180>)
 8000934:	617b      	str	r3, [r7, #20]
    uint32_t msp_val = KERNEL_STACK_INIT;
 8000936:	4b42      	ldr	r3, [pc, #264]	@ (8000a40 <main+0x184>)
 8000938:	613b      	str	r3, [r7, #16]
    uint32_t user_stack_size = USER_STACK_SIZE / process_count;
 800093a:	4b39      	ldr	r3, [pc, #228]	@ (8000a20 <main+0x164>)
 800093c:	781b      	ldrb	r3, [r3, #0]
 800093e:	461a      	mov	r2, r3
 8000940:	f44f 4300 	mov.w	r3, #32768	@ 0x8000
 8000944:	fb93 f3f2 	sdiv	r3, r3, r2
 8000948:	60bb      	str	r3, [r7, #8]
    uint32_t kernel_stack_size = KERNEL_STACK_SIZE / process_count;
 800094a:	4b35      	ldr	r3, [pc, #212]	@ (8000a20 <main+0x164>)
 800094c:	781b      	ldrb	r3, [r3, #0]
 800094e:	461a      	mov	r2, r3
 8000950:	f44f 43c0 	mov.w	r3, #24576	@ 0x6000
 8000954:	fb93 f3f2 	sdiv	r3, r3, r2
 8000958:	607b      	str	r3, [r7, #4]

    /* fill the pcs */
    process_pc [0] = main1;
 800095a:	4b3a      	ldr	r3, [pc, #232]	@ (8000a44 <main+0x188>)
 800095c:	4a3a      	ldr	r2, [pc, #232]	@ (8000a48 <main+0x18c>)
 800095e:	601a      	str	r2, [r3, #0]
    process_pc [1] = main2;
 8000960:	4b38      	ldr	r3, [pc, #224]	@ (8000a44 <main+0x188>)
 8000962:	4a3a      	ldr	r2, [pc, #232]	@ (8000a4c <main+0x190>)
 8000964:	605a      	str	r2, [r3, #4]
    process_pc [2] = main3;
 8000966:	4b37      	ldr	r3, [pc, #220]	@ (8000a44 <main+0x188>)
 8000968:	4a39      	ldr	r2, [pc, #228]	@ (8000a50 <main+0x194>)
 800096a:	609a      	str	r2, [r3, #8]
    process_pc [3] = main4;
 800096c:	4b35      	ldr	r3, [pc, #212]	@ (8000a44 <main+0x188>)
 800096e:	4a39      	ldr	r2, [pc, #228]	@ (8000a54 <main+0x198>)
 8000970:	60da      	str	r2, [r3, #12]
    process_pc [4] = main5;
 8000972:	4b34      	ldr	r3, [pc, #208]	@ (8000a44 <main+0x188>)
 8000974:	4a38      	ldr	r2, [pc, #224]	@ (8000a58 <main+0x19c>)
 8000976:	611a      	str	r2, [r3, #16]
    process_pc [5] = main6;
 8000978:	4b32      	ldr	r3, [pc, #200]	@ (8000a44 <main+0x188>)
 800097a:	4a38      	ldr	r2, [pc, #224]	@ (8000a5c <main+0x1a0>)
 800097c:	615a      	str	r2, [r3, #20]
    process_pc [6] = main7;
 800097e:	4b31      	ldr	r3, [pc, #196]	@ (8000a44 <main+0x188>)
 8000980:	4a37      	ldr	r2, [pc, #220]	@ (8000a60 <main+0x1a4>)
 8000982:	619a      	str	r2, [r3, #24]
    process_pc [7] = main8;
 8000984:	4b2f      	ldr	r3, [pc, #188]	@ (8000a44 <main+0x188>)
 8000986:	4a37      	ldr	r2, [pc, #220]	@ (8000a64 <main+0x1a8>)
 8000988:	61da      	str	r2, [r3, #28]
    process_pc [8] = main9;
 800098a:	4b2e      	ldr	r3, [pc, #184]	@ (8000a44 <main+0x188>)
 800098c:	4a36      	ldr	r2, [pc, #216]	@ (8000a68 <main+0x1ac>)
 800098e:	621a      	str	r2, [r3, #32]
    process_pc [9] = main10;
 8000990:	4b2c      	ldr	r3, [pc, #176]	@ (8000a44 <main+0x188>)
 8000992:	4a36      	ldr	r2, [pc, #216]	@ (8000a6c <main+0x1b0>)
 8000994:	625a      	str	r2, [r3, #36]	@ 0x24
    process_pc [10] = main11;
 8000996:	4b2b      	ldr	r3, [pc, #172]	@ (8000a44 <main+0x188>)
 8000998:	4a35      	ldr	r2, [pc, #212]	@ (8000a70 <main+0x1b4>)
 800099a:	629a      	str	r2, [r3, #40]	@ 0x28
    process_pc [11] = main12;
 800099c:	4b29      	ldr	r3, [pc, #164]	@ (8000a44 <main+0x188>)
 800099e:	4a35      	ldr	r2, [pc, #212]	@ (8000a74 <main+0x1b8>)
 80009a0:	62da      	str	r2, [r3, #44]	@ 0x2c
    process_pc [12] = main13;
 80009a2:	4b28      	ldr	r3, [pc, #160]	@ (8000a44 <main+0x188>)
 80009a4:	4a34      	ldr	r2, [pc, #208]	@ (8000a78 <main+0x1bc>)
 80009a6:	631a      	str	r2, [r3, #48]	@ 0x30
    process_pc [13] = main14;
 80009a8:	4b26      	ldr	r3, [pc, #152]	@ (8000a44 <main+0x188>)
 80009aa:	4a34      	ldr	r2, [pc, #208]	@ (8000a7c <main+0x1c0>)
 80009ac:	635a      	str	r2, [r3, #52]	@ 0x34
    process_pc [14] = main15;
 80009ae:	4b25      	ldr	r3, [pc, #148]	@ (8000a44 <main+0x188>)
 80009b0:	4a33      	ldr	r2, [pc, #204]	@ (8000a80 <main+0x1c4>)
 80009b2:	639a      	str	r2, [r3, #56]	@ 0x38

    for (uint8_t i=0; i<process_count; i++){
 80009b4:	2300      	movs	r3, #0
 80009b6:	73fb      	strb	r3, [r7, #15]
 80009b8:	e01d      	b.n	80009f6 <main+0x13a>
        make_process (&process[i], psp_val, msp_val, i);
 80009ba:	7bfb      	ldrb	r3, [r7, #15]
 80009bc:	2234      	movs	r2, #52	@ 0x34
 80009be:	fb02 f303 	mul.w	r3, r2, r3
 80009c2:	4a30      	ldr	r2, [pc, #192]	@ (8000a84 <main+0x1c8>)
 80009c4:	1898      	adds	r0, r3, r2
 80009c6:	7bfb      	ldrb	r3, [r7, #15]
 80009c8:	693a      	ldr	r2, [r7, #16]
 80009ca:	6979      	ldr	r1, [r7, #20]
 80009cc:	f000 f85e 	bl	8000a8c <make_process>
        psp_val -= user_stack_size;
 80009d0:	697a      	ldr	r2, [r7, #20]
 80009d2:	68bb      	ldr	r3, [r7, #8]
 80009d4:	1ad3      	subs	r3, r2, r3
 80009d6:	617b      	str	r3, [r7, #20]
        msp_val -= kernel_stack_size;
 80009d8:	693a      	ldr	r2, [r7, #16]
 80009da:	687b      	ldr	r3, [r7, #4]
 80009dc:	1ad3      	subs	r3, r2, r3
 80009de:	613b      	str	r3, [r7, #16]
        /* make stack pointers word aligned */
        psp_val &= ~(3);
 80009e0:	697b      	ldr	r3, [r7, #20]
 80009e2:	f023 0303 	bic.w	r3, r3, #3
 80009e6:	617b      	str	r3, [r7, #20]
        msp_val &= ~(3);
 80009e8:	693b      	ldr	r3, [r7, #16]
 80009ea:	f023 0303 	bic.w	r3, r3, #3
 80009ee:	613b      	str	r3, [r7, #16]
    for (uint8_t i=0; i<process_count; i++){
 80009f0:	7bfb      	ldrb	r3, [r7, #15]
 80009f2:	3301      	adds	r3, #1
 80009f4:	73fb      	strb	r3, [r7, #15]
 80009f6:	4b0a      	ldr	r3, [pc, #40]	@ (8000a20 <main+0x164>)
 80009f8:	781b      	ldrb	r3, [r3, #0]
 80009fa:	7bfa      	ldrb	r2, [r7, #15]
 80009fc:	429a      	cmp	r2, r3
 80009fe:	d3dc      	bcc.n	80009ba <main+0xfe>
 
    /* accessing illegal address in kernel code -> Kernel Panic*/
//    *(uint32_t*) (0xffffffff) = 5;

    /*impose user restriction*/
    mpu_setup ();
 8000a00:	f7ff fc38 	bl	8000274 <mpu_setup>

    /* start the processes */
    launch_process();
 8000a04:	f000 f8be 	bl	8000b84 <launch_process>
    // TODO
    // transfer the control to this section from user space if there is no process to be run


    // if all the processes are done
    printf ("all the processes are done executing \n\r", 0x0);
 8000a08:	2100      	movs	r1, #0
 8000a0a:	481f      	ldr	r0, [pc, #124]	@ (8000a88 <main+0x1cc>)
 8000a0c:	f7ff fe60 	bl	80006d0 <printf>
    while (1);
 8000a10:	e7fe      	b.n	8000a10 <main+0x154>
 8000a12:	bf00      	nop
 8000a14:	e000ed00 	.word	0xe000ed00
 8000a18:	200003f4 	.word	0x200003f4
 8000a1c:	2000002c 	.word	0x2000002c
 8000a20:	20000000 	.word	0x20000000
 8000a24:	08001088 	.word	0x08001088
 8000a28:	20000004 	.word	0x20000004
 8000a2c:	080007ed 	.word	0x080007ed
 8000a30:	0800081d 	.word	0x0800081d
 8000a34:	0800082d 	.word	0x0800082d
 8000a38:	2001600c 	.word	0x2001600c
 8000a3c:	20010000 	.word	0x20010000
 8000a40:	20016000 	.word	0x20016000
 8000a44:	200003b8 	.word	0x200003b8
 8000a48:	08010001 	.word	0x08010001
 8000a4c:	0801002d 	.word	0x0801002d
 8000a50:	08010269 	.word	0x08010269
 8000a54:	08010059 	.word	0x08010059
 8000a58:	08010085 	.word	0x08010085
 8000a5c:	080100b1 	.word	0x080100b1
 8000a60:	080100dd 	.word	0x080100dd
 8000a64:	08010109 	.word	0x08010109
 8000a68:	08010135 	.word	0x08010135
 8000a6c:	08010161 	.word	0x08010161
 8000a70:	0801018d 	.word	0x0801018d
 8000a74:	080101b9 	.word	0x080101b9
 8000a78:	080101e5 	.word	0x080101e5
 8000a7c:	08010211 	.word	0x08010211
 8000a80:	0801023d 	.word	0x0801023d
 8000a84:	200000ac 	.word	0x200000ac
 8000a88:	080010b0 	.word	0x080010b0

08000a8c <make_process>:
}

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t process_id){
 8000a8c:	b480      	push	{r7}
 8000a8e:	b087      	sub	sp, #28
 8000a90:	af00      	add	r7, sp, #0
 8000a92:	60f8      	str	r0, [r7, #12]
 8000a94:	60b9      	str	r1, [r7, #8]
 8000a96:	607a      	str	r2, [r7, #4]
 8000a98:	70fb      	strb	r3, [r7, #3]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;
 8000a9a:	68fb      	ldr	r3, [r7, #12]
 8000a9c:	2200      	movs	r2, #0
 8000a9e:	61da      	str	r2, [r3, #28]
 8000aa0:	68fb      	ldr	r3, [r7, #12]
 8000aa2:	69da      	ldr	r2, [r3, #28]
 8000aa4:	68fb      	ldr	r3, [r7, #12]
 8000aa6:	619a      	str	r2, [r3, #24]
 8000aa8:	68fb      	ldr	r3, [r7, #12]
 8000aaa:	699a      	ldr	r2, [r3, #24]
 8000aac:	68fb      	ldr	r3, [r7, #12]
 8000aae:	615a      	str	r2, [r3, #20]
 8000ab0:	68fb      	ldr	r3, [r7, #12]
 8000ab2:	695a      	ldr	r2, [r3, #20]
 8000ab4:	68fb      	ldr	r3, [r7, #12]
 8000ab6:	611a      	str	r2, [r3, #16]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
 8000ab8:	68fb      	ldr	r3, [r7, #12]
 8000aba:	691a      	ldr	r2, [r3, #16]
 8000abc:	68fb      	ldr	r3, [r7, #12]
 8000abe:	60da      	str	r2, [r3, #12]
 8000ac0:	68fb      	ldr	r3, [r7, #12]
 8000ac2:	68da      	ldr	r2, [r3, #12]
 8000ac4:	68fb      	ldr	r3, [r7, #12]
 8000ac6:	609a      	str	r2, [r3, #8]
 8000ac8:	68fb      	ldr	r3, [r7, #12]
 8000aca:	689a      	ldr	r2, [r3, #8]
 8000acc:	68fb      	ldr	r3, [r7, #12]
 8000ace:	605a      	str	r2, [r3, #4]
 8000ad0:	68fb      	ldr	r3, [r7, #12]
 8000ad2:	685a      	ldr	r2, [r3, #4]
 8000ad4:	68fb      	ldr	r3, [r7, #12]
 8000ad6:	601a      	str	r2, [r3, #0]

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;
 8000ad8:	68fb      	ldr	r3, [r7, #12]
 8000ada:	f06f 0202 	mvn.w	r2, #2
 8000ade:	629a      	str	r2, [r3, #40]	@ 0x28



    //process->pc = (uint32_t) fun;
    process->psp = psp;
 8000ae0:	68fb      	ldr	r3, [r7, #12]
 8000ae2:	68ba      	ldr	r2, [r7, #8]
 8000ae4:	621a      	str	r2, [r3, #32]
    process->msp = msp;
 8000ae6:	68fb      	ldr	r3, [r7, #12]
 8000ae8:	687a      	ldr	r2, [r7, #4]
 8000aea:	625a      	str	r2, [r3, #36]	@ 0x24
    process->psp -= 8*4;        // start from 8 word below the base of the stack
 8000aec:	68fb      	ldr	r3, [r7, #12]
 8000aee:	6a1b      	ldr	r3, [r3, #32]
 8000af0:	f1a3 0220 	sub.w	r2, r3, #32
 8000af4:	68fb      	ldr	r3, [r7, #12]
 8000af6:	621a      	str	r2, [r3, #32]
    represent thumb state 
    */

    // put the lr value in stack if you want to be able to return from the user process
  
    for (int i=0; i<8; i++){
 8000af8:	2300      	movs	r3, #0
 8000afa:	617b      	str	r3, [r7, #20]
 8000afc:	e032      	b.n	8000b64 <make_process+0xd8>
        if (i == 5) {
 8000afe:	697b      	ldr	r3, [r7, #20]
 8000b00:	2b05      	cmp	r3, #5
 8000b02:	d108      	bne.n	8000b16 <make_process+0x8a>
          *(uint32_t *)(process->psp+i*4) = (uint32_t ) user_process_exit;
 8000b04:	68fb      	ldr	r3, [r7, #12]
 8000b06:	6a1b      	ldr	r3, [r3, #32]
 8000b08:	697a      	ldr	r2, [r7, #20]
 8000b0a:	0092      	lsls	r2, r2, #2
 8000b0c:	4413      	add	r3, r2
 8000b0e:	461a      	mov	r2, r3
 8000b10:	4b1a      	ldr	r3, [pc, #104]	@ (8000b7c <make_process+0xf0>)
 8000b12:	6013      	str	r3, [r2, #0]
 8000b14:	e023      	b.n	8000b5e <make_process+0xd2>
        }
        else if (i == 6)
 8000b16:	697b      	ldr	r3, [r7, #20]
 8000b18:	2b06      	cmp	r3, #6
 8000b1a:	d10b      	bne.n	8000b34 <make_process+0xa8>
            *(uint32_t *)(process->psp+i*4) =
                    (uint32_t) process_pc [process_id];
 8000b1c:	78fb      	ldrb	r3, [r7, #3]
 8000b1e:	4a18      	ldr	r2, [pc, #96]	@ (8000b80 <make_process+0xf4>)
 8000b20:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
            *(uint32_t *)(process->psp+i*4) =
 8000b24:	68fb      	ldr	r3, [r7, #12]
 8000b26:	6a1b      	ldr	r3, [r3, #32]
 8000b28:	697a      	ldr	r2, [r7, #20]
 8000b2a:	0092      	lsls	r2, r2, #2
 8000b2c:	4413      	add	r3, r2
                    (uint32_t) process_pc [process_id];
 8000b2e:	460a      	mov	r2, r1
            *(uint32_t *)(process->psp+i*4) =
 8000b30:	601a      	str	r2, [r3, #0]
 8000b32:	e014      	b.n	8000b5e <make_process+0xd2>
        else if (i == 7)
 8000b34:	697b      	ldr	r3, [r7, #20]
 8000b36:	2b07      	cmp	r3, #7
 8000b38:	d109      	bne.n	8000b4e <make_process+0xc2>
            *(uint32_t *)(process->psp+i*4) = 0x01000000;
 8000b3a:	68fb      	ldr	r3, [r7, #12]
 8000b3c:	6a1b      	ldr	r3, [r3, #32]
 8000b3e:	697a      	ldr	r2, [r7, #20]
 8000b40:	0092      	lsls	r2, r2, #2
 8000b42:	4413      	add	r3, r2
 8000b44:	461a      	mov	r2, r3
 8000b46:	f04f 7380 	mov.w	r3, #16777216	@ 0x1000000
 8000b4a:	6013      	str	r3, [r2, #0]
 8000b4c:	e007      	b.n	8000b5e <make_process+0xd2>
        else 
            *(uint32_t *)(process->psp+i*4) = 0x0;
 8000b4e:	68fb      	ldr	r3, [r7, #12]
 8000b50:	6a1b      	ldr	r3, [r3, #32]
 8000b52:	697a      	ldr	r2, [r7, #20]
 8000b54:	0092      	lsls	r2, r2, #2
 8000b56:	4413      	add	r3, r2
 8000b58:	461a      	mov	r2, r3
 8000b5a:	2300      	movs	r3, #0
 8000b5c:	6013      	str	r3, [r2, #0]
    for (int i=0; i<8; i++){
 8000b5e:	697b      	ldr	r3, [r7, #20]
 8000b60:	3301      	adds	r3, #1
 8000b62:	617b      	str	r3, [r7, #20]
 8000b64:	697b      	ldr	r3, [r7, #20]
 8000b66:	2b07      	cmp	r3, #7
 8000b68:	ddc9      	ble.n	8000afe <make_process+0x72>
    }
    
    process-> process_id = process_id;
 8000b6a:	78fa      	ldrb	r2, [r7, #3]
 8000b6c:	68fb      	ldr	r3, [r7, #12]
 8000b6e:	631a      	str	r2, [r3, #48]	@ 0x30

}
 8000b70:	bf00      	nop
 8000b72:	371c      	adds	r7, #28
 8000b74:	46bd      	mov	sp, r7
 8000b76:	bc80      	pop	{r7}
 8000b78:	4770      	bx	lr
 8000b7a:	bf00      	nop
 8000b7c:	080102b9 	.word	0x080102b9
 8000b80:	200003b8 	.word	0x200003b8

08000b84 <launch_process>:

void  launch_process (void){
 8000b84:	b580      	push	{r7, lr}
 8000b86:	b082      	sub	sp, #8
 8000b88:	af00      	add	r7, sp, #0
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process[0].psp);
 8000b8a:	4b27      	ldr	r3, [pc, #156]	@ (8000c28 <launch_process+0xa4>)
 8000b8c:	6a1b      	ldr	r3, [r3, #32]
 8000b8e:	4618      	mov	r0, r3
 8000b90:	f000 f8c8 	bl	8000d24 <__asm__set_psp>
    __asm__set_msp (process[0].msp);
 8000b94:	4b24      	ldr	r3, [pc, #144]	@ (8000c28 <launch_process+0xa4>)
 8000b96:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000b98:	4618      	mov	r0, r3
 8000b9a:	f000 f8c6 	bl	8000d2a <__asm__set_msp>
       

    SysTick->LOAD = 16000 - 1;
 8000b9e:	4b23      	ldr	r3, [pc, #140]	@ (8000c2c <launch_process+0xa8>)
 8000ba0:	f643 627f 	movw	r2, #15999	@ 0x3e7f
 8000ba4:	605a      	str	r2, [r3, #4]
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
 8000ba6:	4b21      	ldr	r3, [pc, #132]	@ (8000c2c <launch_process+0xa8>)
 8000ba8:	681b      	ldr	r3, [r3, #0]
 8000baa:	4a20      	ldr	r2, [pc, #128]	@ (8000c2c <launch_process+0xa8>)
 8000bac:	f043 0307 	orr.w	r3, r3, #7
 8000bb0:	6013      	str	r3, [r2, #0]
            | SysTick_CTRL_ENABLE_Msk);

    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process[0]);
 8000bb2:	4b1f      	ldr	r3, [pc, #124]	@ (8000c30 <launch_process+0xac>)
 8000bb4:	4a1c      	ldr	r2, [pc, #112]	@ (8000c28 <launch_process+0xa4>)
 8000bb6:	601a      	str	r2, [r3, #0]

    /* initially all the processes will be placed in the ready queue except the first one (entry point) */
    for (uint8_t i=1; i<process_count; i++){
 8000bb8:	2301      	movs	r3, #1
 8000bba:	71fb      	strb	r3, [r7, #7]
 8000bbc:	e012      	b.n	8000be4 <launch_process+0x60>
        int status = queue_push (&ready_queue, &process[i]);
 8000bbe:	79fb      	ldrb	r3, [r7, #7]
 8000bc0:	2234      	movs	r2, #52	@ 0x34
 8000bc2:	fb02 f303 	mul.w	r3, r2, r3
 8000bc6:	4a18      	ldr	r2, [pc, #96]	@ (8000c28 <launch_process+0xa4>)
 8000bc8:	4413      	add	r3, r2
 8000bca:	4619      	mov	r1, r3
 8000bcc:	4819      	ldr	r0, [pc, #100]	@ (8000c34 <launch_process+0xb0>)
 8000bce:	f7ff fb9a 	bl	8000306 <queue_push>
 8000bd2:	4603      	mov	r3, r0
 8000bd4:	603b      	str	r3, [r7, #0]
        if (status){
 8000bd6:	683b      	ldr	r3, [r7, #0]
 8000bd8:	2b00      	cmp	r3, #0
 8000bda:	d000      	beq.n	8000bde <launch_process+0x5a>
            while (1);
 8000bdc:	e7fe      	b.n	8000bdc <launch_process+0x58>
    for (uint8_t i=1; i<process_count; i++){
 8000bde:	79fb      	ldrb	r3, [r7, #7]
 8000be0:	3301      	adds	r3, #1
 8000be2:	71fb      	strb	r3, [r7, #7]
 8000be4:	4b14      	ldr	r3, [pc, #80]	@ (8000c38 <launch_process+0xb4>)
 8000be6:	781b      	ldrb	r3, [r3, #0]
 8000be8:	79fa      	ldrb	r2, [r7, #7]
 8000bea:	429a      	cmp	r2, r3
 8000bec:	d3e7      	bcc.n	8000bbe <launch_process+0x3a>
        }
    }

    process[0].state = RUNNING_STATE;
 8000bee:	4b0e      	ldr	r3, [pc, #56]	@ (8000c28 <launch_process+0xa4>)
 8000bf0:	2201      	movs	r2, #1
 8000bf2:	62da      	str	r2, [r3, #44]	@ 0x2c
    for (uint8_t i=1; i<process_count; i++){
 8000bf4:	2301      	movs	r3, #1
 8000bf6:	71bb      	strb	r3, [r7, #6]
 8000bf8:	e00b      	b.n	8000c12 <launch_process+0x8e>
        process[i].state = READY_STATE;
 8000bfa:	79bb      	ldrb	r3, [r7, #6]
 8000bfc:	4a0a      	ldr	r2, [pc, #40]	@ (8000c28 <launch_process+0xa4>)
 8000bfe:	2134      	movs	r1, #52	@ 0x34
 8000c00:	fb01 f303 	mul.w	r3, r1, r3
 8000c04:	4413      	add	r3, r2
 8000c06:	332c      	adds	r3, #44	@ 0x2c
 8000c08:	2200      	movs	r2, #0
 8000c0a:	601a      	str	r2, [r3, #0]
    for (uint8_t i=1; i<process_count; i++){
 8000c0c:	79bb      	ldrb	r3, [r7, #6]
 8000c0e:	3301      	adds	r3, #1
 8000c10:	71bb      	strb	r3, [r7, #6]
 8000c12:	4b09      	ldr	r3, [pc, #36]	@ (8000c38 <launch_process+0xb4>)
 8000c14:	781b      	ldrb	r3, [r3, #0]
 8000c16:	79ba      	ldrb	r2, [r7, #6]
 8000c18:	429a      	cmp	r2, r3
 8000c1a:	d3ee      	bcc.n	8000bfa <launch_process+0x76>
    }
 
    __asm__launch_main1();
 8000c1c:	f00f fb42 	bl	80102a4 <__asm__launch_main1>

}
 8000c20:	bf00      	nop
 8000c22:	3708      	adds	r7, #8
 8000c24:	46bd      	mov	sp, r7
 8000c26:	bd80      	pop	{r7, pc}
 8000c28:	200000ac 	.word	0x200000ac
 8000c2c:	e000e010 	.word	0xe000e010
 8000c30:	20016004 	.word	0x20016004
 8000c34:	200003f4 	.word	0x200003f4
 8000c38:	20000000 	.word	0x20000000

08000c3c <__usart1_init>:
#include "core.h"
#include "usart.h"

void __usart1_init(void) {
 8000c3c:	b480      	push	{r7}
 8000c3e:	af00      	add	r7, sp, #0

  RCC->APB2ENR |= RCC_APB2ENR_USART1EN_Msk;
 8000c40:	4b1c      	ldr	r3, [pc, #112]	@ (8000cb4 <__usart1_init+0x78>)
 8000c42:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 8000c44:	4a1b      	ldr	r2, [pc, #108]	@ (8000cb4 <__usart1_init+0x78>)
 8000c46:	f043 0310 	orr.w	r3, r3, #16
 8000c4a:	6453      	str	r3, [r2, #68]	@ 0x44
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
 8000c4c:	4b19      	ldr	r3, [pc, #100]	@ (8000cb4 <__usart1_init+0x78>)
 8000c4e:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8000c50:	4a18      	ldr	r2, [pc, #96]	@ (8000cb4 <__usart1_init+0x78>)
 8000c52:	f043 0301 	orr.w	r3, r3, #1
 8000c56:	6313      	str	r3, [r2, #48]	@ 0x30
  // alternate function mode
  GPIOA->MODER &= ~((3 << (2 * TX_PIN)) | (3 << (2 * RX_PIN)));
 8000c58:	4b17      	ldr	r3, [pc, #92]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c5a:	681b      	ldr	r3, [r3, #0]
 8000c5c:	4a16      	ldr	r2, [pc, #88]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c5e:	f423 1370 	bic.w	r3, r3, #3932160	@ 0x3c0000
 8000c62:	6013      	str	r3, [r2, #0]
  GPIOA->MODER |= 2 << (2 * TX_PIN) | 2 << (2 * RX_PIN);
 8000c64:	4b14      	ldr	r3, [pc, #80]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c66:	681b      	ldr	r3, [r3, #0]
 8000c68:	4a13      	ldr	r2, [pc, #76]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c6a:	f443 1320 	orr.w	r3, r3, #2621440	@ 0x280000
 8000c6e:	6013      	str	r3, [r2, #0]
  // high speed
  GPIOA->OSPEEDR |= (3 << (TX_PIN * 2)) | (3 << (RX_PIN * 2));
 8000c70:	4b11      	ldr	r3, [pc, #68]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c72:	689b      	ldr	r3, [r3, #8]
 8000c74:	4a10      	ldr	r2, [pc, #64]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c76:	f443 1370 	orr.w	r3, r3, #3932160	@ 0x3c0000
 8000c7a:	6093      	str	r3, [r2, #8]
  // clear the bits in AFR register
  GPIOA->AFR[1] &= ~((0xf << 4) | (0xf << 8));
 8000c7c:	4b0e      	ldr	r3, [pc, #56]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c7e:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000c80:	4a0d      	ldr	r2, [pc, #52]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c82:	f423 637f 	bic.w	r3, r3, #4080	@ 0xff0
 8000c86:	6253      	str	r3, [r2, #36]	@ 0x24
  // set for af7
  GPIOA->AFR[1] |= (7 << 4) | (7 << 8);
 8000c88:	4b0b      	ldr	r3, [pc, #44]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c8a:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000c8c:	4a0a      	ldr	r2, [pc, #40]	@ (8000cb8 <__usart1_init+0x7c>)
 8000c8e:	f443 63ee 	orr.w	r3, r3, #1904	@ 0x770
 8000c92:	6253      	str	r3, [r2, #36]	@ 0x24

  // enable usart, reciever, transiever
  USART1->CR1 |= USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
 8000c94:	4b09      	ldr	r3, [pc, #36]	@ (8000cbc <__usart1_init+0x80>)
 8000c96:	68db      	ldr	r3, [r3, #12]
 8000c98:	4a08      	ldr	r2, [pc, #32]	@ (8000cbc <__usart1_init+0x80>)
 8000c9a:	f443 5300 	orr.w	r3, r3, #8192	@ 0x2000
 8000c9e:	f043 030c 	orr.w	r3, r3, #12
 8000ca2:	60d3      	str	r3, [r2, #12]
  // set the baud rate (115200 in this case)
  USART1->BRR = 0x08B;
 8000ca4:	4b05      	ldr	r3, [pc, #20]	@ (8000cbc <__usart1_init+0x80>)
 8000ca6:	228b      	movs	r2, #139	@ 0x8b
 8000ca8:	609a      	str	r2, [r3, #8]
}
 8000caa:	bf00      	nop
 8000cac:	46bd      	mov	sp, r7
 8000cae:	bc80      	pop	{r7}
 8000cb0:	4770      	bx	lr
 8000cb2:	bf00      	nop
 8000cb4:	40023800 	.word	0x40023800
 8000cb8:	40020000 	.word	0x40020000
 8000cbc:	40011000 	.word	0x40011000

08000cc0 <__usart1_print>:

void __usart1_print(const char *msg, uint32_t size) {
 8000cc0:	b480      	push	{r7}
 8000cc2:	b085      	sub	sp, #20
 8000cc4:	af00      	add	r7, sp, #0
 8000cc6:	6078      	str	r0, [r7, #4]
 8000cc8:	6039      	str	r1, [r7, #0]

  // semaphore_lock(&sem_usart1);
  //enterCRITICAL();
  int i = 0;
 8000cca:	2300      	movs	r3, #0
 8000ccc:	60fb      	str	r3, [r7, #12]
  while (i < size && msg[i] != '\0') {
 8000cce:	e00f      	b.n	8000cf0 <__usart1_print+0x30>
    while (!(USART1->SR & USART_SR_TXE))
 8000cd0:	bf00      	nop
 8000cd2:	4b13      	ldr	r3, [pc, #76]	@ (8000d20 <__usart1_print+0x60>)
 8000cd4:	681b      	ldr	r3, [r3, #0]
 8000cd6:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8000cda:	2b00      	cmp	r3, #0
 8000cdc:	d0f9      	beq.n	8000cd2 <__usart1_print+0x12>
      ;
    USART1->DR = msg[i++];
 8000cde:	68fb      	ldr	r3, [r7, #12]
 8000ce0:	1c5a      	adds	r2, r3, #1
 8000ce2:	60fa      	str	r2, [r7, #12]
 8000ce4:	461a      	mov	r2, r3
 8000ce6:	687b      	ldr	r3, [r7, #4]
 8000ce8:	4413      	add	r3, r2
 8000cea:	781a      	ldrb	r2, [r3, #0]
 8000cec:	4b0c      	ldr	r3, [pc, #48]	@ (8000d20 <__usart1_print+0x60>)
 8000cee:	605a      	str	r2, [r3, #4]
  while (i < size && msg[i] != '\0') {
 8000cf0:	68fb      	ldr	r3, [r7, #12]
 8000cf2:	683a      	ldr	r2, [r7, #0]
 8000cf4:	429a      	cmp	r2, r3
 8000cf6:	d905      	bls.n	8000d04 <__usart1_print+0x44>
 8000cf8:	68fb      	ldr	r3, [r7, #12]
 8000cfa:	687a      	ldr	r2, [r7, #4]
 8000cfc:	4413      	add	r3, r2
 8000cfe:	781b      	ldrb	r3, [r3, #0]
 8000d00:	2b00      	cmp	r3, #0
 8000d02:	d1e5      	bne.n	8000cd0 <__usart1_print+0x10>
  }
  while (!(USART1->SR & USART_SR_TC)) {
 8000d04:	bf00      	nop
 8000d06:	4b06      	ldr	r3, [pc, #24]	@ (8000d20 <__usart1_print+0x60>)
 8000d08:	681b      	ldr	r3, [r3, #0]
 8000d0a:	f003 0340 	and.w	r3, r3, #64	@ 0x40
 8000d0e:	2b00      	cmp	r3, #0
 8000d10:	d0f9      	beq.n	8000d06 <__usart1_print+0x46>
  }
  //exitCRITICAL();
  // semaphore_unlock(&sem_usart1);
}
 8000d12:	bf00      	nop
 8000d14:	bf00      	nop
 8000d16:	3714      	adds	r7, #20
 8000d18:	46bd      	mov	sp, r7
 8000d1a:	bc80      	pop	{r7}
 8000d1c:	4770      	bx	lr
 8000d1e:	bf00      	nop
 8000d20:	40011000 	.word	0x40011000

08000d24 <__asm__set_psp>:

.global __asm__set_psp
.type __asm__set_psp, %function 
__asm__set_psp:
    /* r0 contains the argument*/
    msr psp, r0
 8000d24:	f380 8809 	msr	PSP, r0
    bx lr
 8000d28:	4770      	bx	lr

08000d2a <__asm__set_msp>:

.global __asm__set_msp
.type __asm__set_msp, %function
__asm__set_msp:
    /* r0 contains the argument*/
    msr msp, r0
 8000d2a:	f380 8808 	msr	MSP, r0
    bx lr
 8000d2e:	4770      	bx	lr

08000d30 <Reset_Handler>:
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
 8000d30:	f7ff f986 	bl	8000040 <resetHandlerHelper>
    B main
 8000d34:	f7ff bdc2 	b.w	80008bc <main>

08000d38 <hang>:
hang:
    B .
 8000d38:	e7fe      	b.n	8000d38 <hang>

08000d3a <Default_Handler>:

.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .
 8000d3a:	e7fe      	b.n	8000d3a <Default_Handler>

08000d3c <NMI_Handler>:

.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .
 8000d3c:	e7fe      	b.n	8000d3c <NMI_Handler>

08000d3e <DebugMon_Handler>:

.section .text.DebugMon_Handler
.global DebugMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .
 8000d3e:	e7fe      	b.n	8000d3e <DebugMon_Handler>

08000d40 <PendSV_Handler>:
.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    cpsid i
 8000d40:	b672      	cpsid	i

    push {lr}
 8000d42:	b500      	push	{lr}
    bl schedular
 8000d44:	f7ff fc1c 	bl	8000580 <schedular>
    pop {lr}
 8000d48:	f85d eb04 	ldr.w	lr, [sp], #4

    /************************ start saving reg*********************************/
    ldr r0, =RUNNING_PROCESS
 8000d4c:	4813      	ldr	r0, [pc, #76]	@ (8000d9c <PendSV_Handler+0x5c>)
    ldr r1, [r0]            // r1 now contain the struct address
 8000d4e:	6801      	ldr	r1, [r0, #0]
    

    stmia r1!, {r4-r11}     // r4->r11 stored in the runnging process struct
 8000d50:	e8a1 0ff0 	stmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}

    mrs r0, psp
 8000d54:	f3ef 8009 	mrs	r0, PSP
    str r0, [r1]
 8000d58:	6008      	str	r0, [r1, #0]
    add r1, #4
 8000d5a:	f101 0104 	add.w	r1, r1, #4
    
    mrs r0, msp
 8000d5e:	f3ef 8008 	mrs	r0, MSP
    str r0, [r1]
 8000d62:	6008      	str	r0, [r1, #0]
    add r1, #4
 8000d64:	f101 0104 	add.w	r1, r1, #4
    
    str lr, [r1]            // important !!! store the exec_return value
 8000d68:	f8c1 e000 	str.w	lr, [r1]
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
 8000d6c:	480c      	ldr	r0, [pc, #48]	@ (8000da0 <PendSV_Handler+0x60>)
    ldr r1, [r0]
 8000d6e:	6801      	ldr	r1, [r0, #0]
    ldmia r1!, {r4-r11}
 8000d70:	e8b1 0ff0 	ldmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
   

    /* before setting psp, msp, faultmask, basepri -> mask all interrupt
    so that no interrupt can be fired in the middle of setting important regs*/

    ldr r0, [r1]
 8000d74:	6808      	ldr	r0, [r1, #0]
    msr psp, r0
 8000d76:	f380 8809 	msr	PSP, r0
    add r1, #4
 8000d7a:	f101 0104 	add.w	r1, r1, #4
    
    ldr r0, [r1]
 8000d7e:	6808      	ldr	r0, [r1, #0]
    msr msp, r0
 8000d80:	f380 8808 	msr	MSP, r0
    add r1, #4
 8000d84:	f101 0104 	add.w	r1, r1, #4
    
    ldr lr, [r1]
 8000d88:	f8d1 e000 	ldr.w	lr, [r1]

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
 8000d8c:	4804      	ldr	r0, [pc, #16]	@ (8000da0 <PendSV_Handler+0x60>)
    ldr r1, =RUNNING_PROCESS
 8000d8e:	4903      	ldr	r1, [pc, #12]	@ (8000d9c <PendSV_Handler+0x5c>)
    ldr r2, [r0]
 8000d90:	6802      	ldr	r2, [r0, #0]
    str r2, [r1]
 8000d92:	600a      	str	r2, [r1, #0]
    
    dsb
 8000d94:	f3bf 8f4f 	dsb	sy

    cpsie i
 8000d98:	b662      	cpsie	i

    bx lr
 8000d9a:	4770      	bx	lr
    ldr r0, =RUNNING_PROCESS
 8000d9c:	20016004 	.word	0x20016004
    ldr r0, =PICKED_PROCESS
 8000da0:	20016008 	.word	0x20016008

08000da4 <SysTick_Handler>:
    caller saved register it will be recovered before returning from the isr*/
    

    /*****************set the PendSV interrupt*********************/
    
    ldr r0, =0xE000ED04      // Address of ICSR register
 8000da4:	4802      	ldr	r0, [pc, #8]	@ (8000db0 <SysTick_Handler+0xc>)
    ldr r1, =0x10000000      // Bit 28 (PENDSVSET)
 8000da6:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
    str r1, [r0]             // Set PendSV pending
 8000daa:	6001      	str	r1, [r0, #0]


    bx lr
 8000dac:	4770      	bx	lr
 8000dae:	0000      	.short	0x0000
    ldr r0, =0xE000ED04      // Address of ICSR register
 8000db0:	e000ed04 	.word	0xe000ed04

08000db4 <SVC_Handler>:
.section .text.SVC_Handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler:
    /* r0, r1, r2, r3 stores the arguments of systemcall */
    push {r0, r1, r2, r3}
 8000db4:	b40f      	push	{r0, r1, r2, r3}

    tst lr, #4
 8000db6:	f01e 0f04 	tst.w	lr, #4
    ite eq
 8000dba:	bf0c      	ite	eq
    mrseq r0, msp
 8000dbc:	f3ef 8008 	mrseq	r0, MSP
    mrsne r0, psp
 8000dc0:	f3ef 8009 	mrsne	r0, PSP

    add r0, #24 /* retrieve the old pc that is stacked*/
 8000dc4:	f100 0018 	add.w	r0, r0, #24
    ldr r1, [r0]
 8000dc8:	6801      	ldr	r1, [r0, #0]
    sub r1, #2      /*move 2 bytes before to get the scv immidiate*/
 8000dca:	f1a1 0102 	sub.w	r1, r1, #2
    ldrb r0, [r1]   /*r0 now contains the immidiate value*/
 8000dce:	7808      	ldrb	r0, [r1, #0]

    
    ldr r2, =SYSCALL_TABLE_AD
 8000dd0:	4a07      	ldr	r2, [pc, #28]	@ (8000df0 <SVC_Handler+0x3c>)
    ldr r1, [r2]            // r1 contains the address of syscall_table
 8000dd2:	6811      	ldr	r1, [r2, #0]
                            // r0 contains the immidate value
    
    mov r3, #4
 8000dd4:	f04f 0304 	mov.w	r3, #4
    mul r0, r3 
 8000dd8:	fb03 f000 	mul.w	r0, r3, r0
    add r1, r0 
 8000ddc:	4401      	add	r1, r0

    mov r12, r1            // store the address of service function in r12
 8000dde:	468c      	mov	ip, r1
    ldr r12, [r12]
 8000de0:	f8dc c000 	ldr.w	ip, [ip]

    pop {r0, r1, r2, r3}
 8000de4:	bc0f      	pop	{r0, r1, r2, r3}

    push {lr}
 8000de6:	b500      	push	{lr}
    blx r12
 8000de8:	47e0      	blx	ip
    pop {lr}
 8000dea:	f85d eb04 	ldr.w	lr, [sp], #4


    bx lr
 8000dee:	4770      	bx	lr
    ldr r2, =SYSCALL_TABLE_AD
 8000df0:	2001600c 	.word	0x2001600c

08000df4 <BusFault_Handler>:
// r0 -> pc, r1 -> fault type, r2 -> fault in kernel / userproc
.section .text.BusFault_Handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler:
    ldr r0, =0xfffffffd
 8000df4:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0
 8000df8:	4586      	cmp	lr, r0
    ittee eq 
 8000dfa:	bf07      	ittee	eq
    mrseq r0, psp
 8000dfc:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000e00:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000e02:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000e06:	2201      	movne	r2, #1

    /* find pc */
    ldr r0, [r0, #24]
 8000e08:	6980      	ldr	r0, [r0, #24]
    mov r1, BusFault_Identifier
 8000e0a:	f04f 0100 	mov.w	r1, #0
    push {lr}
 8000e0e:	b500      	push	{lr}
    bl fault_handler_helper
 8000e10:	f7ff f97c 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000e14:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8000e18:	4770      	bx	lr

08000e1a <MemManage_Handler>:
/***********************MemManage_Handler start************************/
.section .text.MemManage_Handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler:
    ldr r0, =0xfffffffd 
 8000e1a:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000e1e:	4586      	cmp	lr, r0

    ittee eq 
 8000e20:	bf07      	ittee	eq
    mrseq r0, psp
 8000e22:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000e26:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000e28:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000e2c:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8000e2e:	6980      	ldr	r0, [r0, #24]
    mov r1, MemManage_Identifier
 8000e30:	f04f 0101 	mov.w	r1, #1
    push {lr}
 8000e34:	b500      	push	{lr}
    bl fault_handler_helper
 8000e36:	f7ff f969 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000e3a:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8000e3e:	4770      	bx	lr

08000e40 <UsageFault_Handler>:

.section .text.UsageFault_Handler
.global UsageFault_Handler 
.type UsageFault_Handler, %function
UsageFault_Handler:
    ldr r0, =0xfffffffd 
 8000e40:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000e44:	4586      	cmp	lr, r0

    ittee eq 
 8000e46:	bf07      	ittee	eq
    mrseq r0, psp
 8000e48:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000e4c:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000e4e:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000e52:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8000e54:	6980      	ldr	r0, [r0, #24]
    mov r1, UsageFault_Identifier
 8000e56:	f04f 0102 	mov.w	r1, #2
    push {lr}
 8000e5a:	b500      	push	{lr}
    bl fault_handler_helper
 8000e5c:	f7ff f956 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000e60:	f85d eb04 	ldr.w	lr, [sp], #4
    
    bx lr
 8000e64:	4770      	bx	lr
	...

08000e68 <HardFault_Handler>:
.section .text.HardFault_Handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler:

    ldr r0, =0xfffffffd 
 8000e68:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000e6c:	4586      	cmp	lr, r0
    ite eq 
 8000e6e:	bf0c      	ite	eq
    mrseq r0, psp
 8000e70:	f3ef 8009 	mrseq	r0, PSP
    mrsne r0, msp
 8000e74:	f3ef 8008 	mrsne	r0, MSP
    
    /* find pc */
    ldr r0, [r0, #24]
 8000e78:	6980      	ldr	r0, [r0, #24]
    
    /* after getting the pc, msp can be safely altered !!!*/
    ldr r1, =_estack
 8000e7a:	4904      	ldr	r1, [pc, #16]	@ (8000e8c <HardFault_Handler+0x24>)
    msr msp, r1
 8000e7c:	f381 8808 	msr	MSP, r1

    push {lr}
 8000e80:	b500      	push	{lr}
    bl HardFault_Handler_helper
 8000e82:	f7ff f9c7 	bl	8000214 <HardFault_Handler_helper>
    pop {lr}
 8000e86:	f85d eb04 	ldr.w	lr, [sp], #4

    b .
 8000e8a:	e7fe      	b.n	8000e8a <HardFault_Handler+0x22>
    ldr r1, =_estack
 8000e8c:	20018000 	.word	0x20018000

Disassembly of section .usertext:

08001328 <main1-0xecd8>:
	...

08010000 <main1>:
#include "kernel_api.h"

USER_CODE int main1(void) {
 8010000:	b580      	push	{r7, lr}
 8010002:	af00      	add	r7, sp, #0
  while (1) {

    user_printf("hello from main1.c\n\r", 0x0);
 8010004:	2100      	movs	r1, #0
 8010006:	4806      	ldr	r0, [pc, #24]	@ (8010020 <main1+0x20>)
 8010008:	f000 f954 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c second time\n\r", 0x0);
 801000c:	2100      	movs	r1, #0
 801000e:	4805      	ldr	r0, [pc, #20]	@ (8010024 <main1+0x24>)
 8010010:	f000 f950 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c third time\n\r", 0x0);
 8010014:	2100      	movs	r1, #0
 8010016:	4804      	ldr	r0, [pc, #16]	@ (8010028 <main1+0x28>)
 8010018:	f000 f94c 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c\n\r", 0x0);
 801001c:	e7f2      	b.n	8010004 <main1+0x4>
 801001e:	bf00      	nop
 8010020:	080010d8 	.word	0x080010d8
 8010024:	080010f0 	.word	0x080010f0
 8010028:	08001114 	.word	0x08001114

0801002c <main2>:
#include "kernel_api.h"

USER_CODE int main2(void) {
 801002c:	b580      	push	{r7, lr}
 801002e:	b082      	sub	sp, #8
 8010030:	af00      	add	r7, sp, #0
  int count = 10;
 8010032:	230a      	movs	r3, #10
 8010034:	607b      	str	r3, [r7, #4]
  while (count --) {
 8010036:	e003      	b.n	8010040 <main2+0x14>
    user_printf("((((((((((hello from main2.c\n\r", 0x0);
 8010038:	2100      	movs	r1, #0
 801003a:	4806      	ldr	r0, [pc, #24]	@ (8010054 <main2+0x28>)
 801003c:	f000 f93a 	bl	80102b4 <user_printf>
  while (count --) {
 8010040:	687b      	ldr	r3, [r7, #4]
 8010042:	1e5a      	subs	r2, r3, #1
 8010044:	607a      	str	r2, [r7, #4]
 8010046:	2b00      	cmp	r3, #0
 8010048:	d1f6      	bne.n	8010038 <main2+0xc>
  }
}
 801004a:	bf00      	nop
 801004c:	4618      	mov	r0, r3
 801004e:	3708      	adds	r7, #8
 8010050:	46bd      	mov	sp, r7
 8010052:	bd80      	pop	{r7, pc}
 8010054:	08001134 	.word	0x08001134

08010058 <main4>:
#include "kernel_api.h"
USER_CODE int main4 (void){
 8010058:	b580      	push	{r7, lr}
 801005a:	b082      	sub	sp, #8
 801005c:	af00      	add	r7, sp, #0
    int count = 10;
 801005e:	230a      	movs	r3, #10
 8010060:	607b      	str	r3, [r7, #4]
    while (count--)
 8010062:	e003      	b.n	801006c <main4+0x14>
    user_printf("++++++++++hello from main4.c\n\r", 0x0);
 8010064:	2100      	movs	r1, #0
 8010066:	4806      	ldr	r0, [pc, #24]	@ (8010080 <main4+0x28>)
 8010068:	f000 f924 	bl	80102b4 <user_printf>
    while (count--)
 801006c:	687b      	ldr	r3, [r7, #4]
 801006e:	1e5a      	subs	r2, r3, #1
 8010070:	607a      	str	r2, [r7, #4]
 8010072:	2b00      	cmp	r3, #0
 8010074:	d1f6      	bne.n	8010064 <main4+0xc>

    
}
 8010076:	bf00      	nop
 8010078:	4618      	mov	r0, r3
 801007a:	3708      	adds	r7, #8
 801007c:	46bd      	mov	sp, r7
 801007e:	bd80      	pop	{r7, pc}
 8010080:	08001154 	.word	0x08001154

08010084 <main5>:
#include "kernel_api.h"

USER_CODE int main5 (void){
 8010084:	b580      	push	{r7, lr}
 8010086:	b082      	sub	sp, #8
 8010088:	af00      	add	r7, sp, #0
    int count = 10;   
 801008a:	230a      	movs	r3, #10
 801008c:	607b      	str	r3, [r7, #4]
    while (count --){
 801008e:	e003      	b.n	8010098 <main5+0x14>
        user_printf ("==========hello from main5.c\n\r", 0x0);
 8010090:	2100      	movs	r1, #0
 8010092:	4806      	ldr	r0, [pc, #24]	@ (80100ac <main5+0x28>)
 8010094:	f000 f90e 	bl	80102b4 <user_printf>
    while (count --){
 8010098:	687b      	ldr	r3, [r7, #4]
 801009a:	1e5a      	subs	r2, r3, #1
 801009c:	607a      	str	r2, [r7, #4]
 801009e:	2b00      	cmp	r3, #0
 80100a0:	d1f6      	bne.n	8010090 <main5+0xc>

    }



}
 80100a2:	bf00      	nop
 80100a4:	4618      	mov	r0, r3
 80100a6:	3708      	adds	r7, #8
 80100a8:	46bd      	mov	sp, r7
 80100aa:	bd80      	pop	{r7, pc}
 80100ac:	08001174 	.word	0x08001174

080100b0 <main6>:
#include "kernel_api.h"

USER_CODE int main6 (void){
 80100b0:	b580      	push	{r7, lr}
 80100b2:	b082      	sub	sp, #8
 80100b4:	af00      	add	r7, sp, #0
  
  int count = 10;
 80100b6:	230a      	movs	r3, #10
 80100b8:	607b      	str	r3, [r7, #4]
    while (count--){
 80100ba:	e003      	b.n	80100c4 <main6+0x14>
        user_printf ("@@@@@@@@@@hello from main6.c\n\r", 0x0);
 80100bc:	2100      	movs	r1, #0
 80100be:	4806      	ldr	r0, [pc, #24]	@ (80100d8 <main6+0x28>)
 80100c0:	f000 f8f8 	bl	80102b4 <user_printf>
    while (count--){
 80100c4:	687b      	ldr	r3, [r7, #4]
 80100c6:	1e5a      	subs	r2, r3, #1
 80100c8:	607a      	str	r2, [r7, #4]
 80100ca:	2b00      	cmp	r3, #0
 80100cc:	d1f6      	bne.n	80100bc <main6+0xc>

    }



}
 80100ce:	bf00      	nop
 80100d0:	4618      	mov	r0, r3
 80100d2:	3708      	adds	r7, #8
 80100d4:	46bd      	mov	sp, r7
 80100d6:	bd80      	pop	{r7, pc}
 80100d8:	08001194 	.word	0x08001194

080100dc <main7>:
#include "kernel_api.h"

USER_CODE int main7 (void){
 80100dc:	b580      	push	{r7, lr}
 80100de:	b082      	sub	sp, #8
 80100e0:	af00      	add	r7, sp, #0
 
  int count = 10;
 80100e2:	230a      	movs	r3, #10
 80100e4:	607b      	str	r3, [r7, #4]
    while (count --){
 80100e6:	e003      	b.n	80100f0 <main7+0x14>
        user_printf ("@@@@@@@@@@hello from main5.c\n\r", 0x0);
 80100e8:	2100      	movs	r1, #0
 80100ea:	4806      	ldr	r0, [pc, #24]	@ (8010104 <main7+0x28>)
 80100ec:	f000 f8e2 	bl	80102b4 <user_printf>
    while (count --){
 80100f0:	687b      	ldr	r3, [r7, #4]
 80100f2:	1e5a      	subs	r2, r3, #1
 80100f4:	607a      	str	r2, [r7, #4]
 80100f6:	2b00      	cmp	r3, #0
 80100f8:	d1f6      	bne.n	80100e8 <main7+0xc>

    }



}
 80100fa:	bf00      	nop
 80100fc:	4618      	mov	r0, r3
 80100fe:	3708      	adds	r7, #8
 8010100:	46bd      	mov	sp, r7
 8010102:	bd80      	pop	{r7, pc}
 8010104:	080011b4 	.word	0x080011b4

08010108 <main8>:
#include "kernel_api.h"

USER_CODE int main8 (void){
 8010108:	b580      	push	{r7, lr}
 801010a:	b082      	sub	sp, #8
 801010c:	af00      	add	r7, sp, #0
  int count = 10;   
 801010e:	230a      	movs	r3, #10
 8010110:	607b      	str	r3, [r7, #4]
    while (count--){
 8010112:	e003      	b.n	801011c <main8+0x14>
        user_printf ("==========hello from main8.c\n\r", 0x0);
 8010114:	2100      	movs	r1, #0
 8010116:	4806      	ldr	r0, [pc, #24]	@ (8010130 <main8+0x28>)
 8010118:	f000 f8cc 	bl	80102b4 <user_printf>
    while (count--){
 801011c:	687b      	ldr	r3, [r7, #4]
 801011e:	1e5a      	subs	r2, r3, #1
 8010120:	607a      	str	r2, [r7, #4]
 8010122:	2b00      	cmp	r3, #0
 8010124:	d1f6      	bne.n	8010114 <main8+0xc>

    }



}
 8010126:	bf00      	nop
 8010128:	4618      	mov	r0, r3
 801012a:	3708      	adds	r7, #8
 801012c:	46bd      	mov	sp, r7
 801012e:	bd80      	pop	{r7, pc}
 8010130:	080011d4 	.word	0x080011d4

08010134 <main9>:
#include "kernel_api.h"

USER_CODE int main9 (void){
 8010134:	b580      	push	{r7, lr}
 8010136:	b082      	sub	sp, #8
 8010138:	af00      	add	r7, sp, #0
 
  int count = 10;
 801013a:	230a      	movs	r3, #10
 801013c:	607b      	str	r3, [r7, #4]
    while (count--){
 801013e:	e003      	b.n	8010148 <main9+0x14>
        user_printf ("==========hello from main9.c\n\r", 0x0);
 8010140:	2100      	movs	r1, #0
 8010142:	4806      	ldr	r0, [pc, #24]	@ (801015c <main9+0x28>)
 8010144:	f000 f8b6 	bl	80102b4 <user_printf>
    while (count--){
 8010148:	687b      	ldr	r3, [r7, #4]
 801014a:	1e5a      	subs	r2, r3, #1
 801014c:	607a      	str	r2, [r7, #4]
 801014e:	2b00      	cmp	r3, #0
 8010150:	d1f6      	bne.n	8010140 <main9+0xc>

    }



}
 8010152:	bf00      	nop
 8010154:	4618      	mov	r0, r3
 8010156:	3708      	adds	r7, #8
 8010158:	46bd      	mov	sp, r7
 801015a:	bd80      	pop	{r7, pc}
 801015c:	080011f4 	.word	0x080011f4

08010160 <main10>:
#include "kernel_api.h"

USER_CODE int main10 (void){
 8010160:	b580      	push	{r7, lr}
 8010162:	b082      	sub	sp, #8
 8010164:	af00      	add	r7, sp, #0
 
  int count = 10;
 8010166:	230a      	movs	r3, #10
 8010168:	607b      	str	r3, [r7, #4]
    while (count --){
 801016a:	e003      	b.n	8010174 <main10+0x14>
        user_printf ("==========hello from main10.c\n\r", 0x0);
 801016c:	2100      	movs	r1, #0
 801016e:	4806      	ldr	r0, [pc, #24]	@ (8010188 <main10+0x28>)
 8010170:	f000 f8a0 	bl	80102b4 <user_printf>
    while (count --){
 8010174:	687b      	ldr	r3, [r7, #4]
 8010176:	1e5a      	subs	r2, r3, #1
 8010178:	607a      	str	r2, [r7, #4]
 801017a:	2b00      	cmp	r3, #0
 801017c:	d1f6      	bne.n	801016c <main10+0xc>

    }



}
 801017e:	bf00      	nop
 8010180:	4618      	mov	r0, r3
 8010182:	3708      	adds	r7, #8
 8010184:	46bd      	mov	sp, r7
 8010186:	bd80      	pop	{r7, pc}
 8010188:	08001214 	.word	0x08001214

0801018c <main11>:
#include "kernel_api.h"

USER_CODE int main11 (void){
 801018c:	b580      	push	{r7, lr}
 801018e:	b082      	sub	sp, #8
 8010190:	af00      	add	r7, sp, #0
    int count = 10;   
 8010192:	230a      	movs	r3, #10
 8010194:	607b      	str	r3, [r7, #4]
    while (count --){
 8010196:	e003      	b.n	80101a0 <main11+0x14>
        user_printf ("==========hello from main11.c\n\r", 0x0);
 8010198:	2100      	movs	r1, #0
 801019a:	4806      	ldr	r0, [pc, #24]	@ (80101b4 <main11+0x28>)
 801019c:	f000 f88a 	bl	80102b4 <user_printf>
    while (count --){
 80101a0:	687b      	ldr	r3, [r7, #4]
 80101a2:	1e5a      	subs	r2, r3, #1
 80101a4:	607a      	str	r2, [r7, #4]
 80101a6:	2b00      	cmp	r3, #0
 80101a8:	d1f6      	bne.n	8010198 <main11+0xc>

    }



}
 80101aa:	bf00      	nop
 80101ac:	4618      	mov	r0, r3
 80101ae:	3708      	adds	r7, #8
 80101b0:	46bd      	mov	sp, r7
 80101b2:	bd80      	pop	{r7, pc}
 80101b4:	08001234 	.word	0x08001234

080101b8 <main12>:
#include "kernel_api.h"

USER_CODE int main12 (void){
 80101b8:	b580      	push	{r7, lr}
 80101ba:	b082      	sub	sp, #8
 80101bc:	af00      	add	r7, sp, #0
 
  int count = 10;
 80101be:	230a      	movs	r3, #10
 80101c0:	607b      	str	r3, [r7, #4]
    while (count --){
 80101c2:	e003      	b.n	80101cc <main12+0x14>
        user_printf ("==========hello from main12.c\n\r", 0x0);
 80101c4:	2100      	movs	r1, #0
 80101c6:	4806      	ldr	r0, [pc, #24]	@ (80101e0 <main12+0x28>)
 80101c8:	f000 f874 	bl	80102b4 <user_printf>
    while (count --){
 80101cc:	687b      	ldr	r3, [r7, #4]
 80101ce:	1e5a      	subs	r2, r3, #1
 80101d0:	607a      	str	r2, [r7, #4]
 80101d2:	2b00      	cmp	r3, #0
 80101d4:	d1f6      	bne.n	80101c4 <main12+0xc>

    }



}
 80101d6:	bf00      	nop
 80101d8:	4618      	mov	r0, r3
 80101da:	3708      	adds	r7, #8
 80101dc:	46bd      	mov	sp, r7
 80101de:	bd80      	pop	{r7, pc}
 80101e0:	08001254 	.word	0x08001254

080101e4 <main13>:
#include "kernel_api.h"

USER_CODE int main13 (void){
 80101e4:	b580      	push	{r7, lr}
 80101e6:	b082      	sub	sp, #8
 80101e8:	af00      	add	r7, sp, #0
  int count = 10;   
 80101ea:	230a      	movs	r3, #10
 80101ec:	607b      	str	r3, [r7, #4]
    while (count--){
 80101ee:	e003      	b.n	80101f8 <main13+0x14>
        user_printf ("==========hello from main13.c\n\r", 0x0);
 80101f0:	2100      	movs	r1, #0
 80101f2:	4806      	ldr	r0, [pc, #24]	@ (801020c <main13+0x28>)
 80101f4:	f000 f85e 	bl	80102b4 <user_printf>
    while (count--){
 80101f8:	687b      	ldr	r3, [r7, #4]
 80101fa:	1e5a      	subs	r2, r3, #1
 80101fc:	607a      	str	r2, [r7, #4]
 80101fe:	2b00      	cmp	r3, #0
 8010200:	d1f6      	bne.n	80101f0 <main13+0xc>

    }



}
 8010202:	bf00      	nop
 8010204:	4618      	mov	r0, r3
 8010206:	3708      	adds	r7, #8
 8010208:	46bd      	mov	sp, r7
 801020a:	bd80      	pop	{r7, pc}
 801020c:	08001274 	.word	0x08001274

08010210 <main14>:
#include "kernel_api.h"

USER_CODE int main14 (void){
 8010210:	b580      	push	{r7, lr}
 8010212:	b082      	sub	sp, #8
 8010214:	af00      	add	r7, sp, #0
  int count = 10;   
 8010216:	230a      	movs	r3, #10
 8010218:	607b      	str	r3, [r7, #4]
    while (count--){
 801021a:	e003      	b.n	8010224 <main14+0x14>
        user_printf ("==========hello from main14.c\n\r", 0x0);
 801021c:	2100      	movs	r1, #0
 801021e:	4806      	ldr	r0, [pc, #24]	@ (8010238 <main14+0x28>)
 8010220:	f000 f848 	bl	80102b4 <user_printf>
    while (count--){
 8010224:	687b      	ldr	r3, [r7, #4]
 8010226:	1e5a      	subs	r2, r3, #1
 8010228:	607a      	str	r2, [r7, #4]
 801022a:	2b00      	cmp	r3, #0
 801022c:	d1f6      	bne.n	801021c <main14+0xc>

    }



}
 801022e:	bf00      	nop
 8010230:	4618      	mov	r0, r3
 8010232:	3708      	adds	r7, #8
 8010234:	46bd      	mov	sp, r7
 8010236:	bd80      	pop	{r7, pc}
 8010238:	08001294 	.word	0x08001294

0801023c <main15>:
#include "kernel_api.h"

USER_CODE int main15 (void){
 801023c:	b580      	push	{r7, lr}
 801023e:	b082      	sub	sp, #8
 8010240:	af00      	add	r7, sp, #0
  int count = 10;   
 8010242:	230a      	movs	r3, #10
 8010244:	607b      	str	r3, [r7, #4]
    while (count--){
 8010246:	e003      	b.n	8010250 <main15+0x14>
        user_printf ("==========hello from main15.c\n\r", 0x0);
 8010248:	2100      	movs	r1, #0
 801024a:	4806      	ldr	r0, [pc, #24]	@ (8010264 <main15+0x28>)
 801024c:	f000 f832 	bl	80102b4 <user_printf>
    while (count--){
 8010250:	687b      	ldr	r3, [r7, #4]
 8010252:	1e5a      	subs	r2, r3, #1
 8010254:	607a      	str	r2, [r7, #4]
 8010256:	2b00      	cmp	r3, #0
 8010258:	d1f6      	bne.n	8010248 <main15+0xc>

    }



}
 801025a:	bf00      	nop
 801025c:	4618      	mov	r0, r3
 801025e:	3708      	adds	r7, #8
 8010260:	46bd      	mov	sp, r7
 8010262:	bd80      	pop	{r7, pc}
 8010264:	080012b4 	.word	0x080012b4

08010268 <main3>:
#include "kernel_api.h"

USER_CODE int main3 (void){
 8010268:	b580      	push	{r7, lr}
 801026a:	b082      	sub	sp, #8
 801026c:	af00      	add	r7, sp, #0
  int count = 10;
 801026e:	230a      	movs	r3, #10
 8010270:	607b      	str	r3, [r7, #4]
  // returning
  user_printf ("returning from main3 before printing anything \n\r", 0x0);
 8010272:	2100      	movs	r1, #0
 8010274:	4809      	ldr	r0, [pc, #36]	@ (801029c <main3+0x34>)
 8010276:	f000 f81d 	bl	80102b4 <user_printf>
  user_process_exit();
 801027a:	f000 f81d 	bl	80102b8 <user_process_exit>

    while (count--){
 801027e:	e003      	b.n	8010288 <main3+0x20>
        user_printf (">>>>>>>>>>hello from main3.c\n\r", 0x0);
 8010280:	2100      	movs	r1, #0
 8010282:	4807      	ldr	r0, [pc, #28]	@ (80102a0 <main3+0x38>)
 8010284:	f000 f816 	bl	80102b4 <user_printf>
    while (count--){
 8010288:	687b      	ldr	r3, [r7, #4]
 801028a:	1e5a      	subs	r2, r3, #1
 801028c:	607a      	str	r2, [r7, #4]
 801028e:	2b00      	cmp	r3, #0
 8010290:	d1f6      	bne.n	8010280 <main3+0x18>
    }
}
 8010292:	bf00      	nop
 8010294:	4618      	mov	r0, r3
 8010296:	3708      	adds	r7, #8
 8010298:	46bd      	mov	sp, r7
 801029a:	bd80      	pop	{r7, pc}
 801029c:	080012d4 	.word	0x080012d4
 80102a0:	08001308 	.word	0x08001308

080102a4 <__asm__launch_main1>:
 80102a4:	f04f 0003 	mov.w	r0, #3
 80102a8:	f380 8814 	msr	CONTROL, r0
 80102ac:	f3bf 8f6f 	isb	sy
 80102b0:	f7ff fea6 	bl	8010000 <main1>

080102b4 <user_printf>:
 80102b4:	df00      	svc	0
 80102b6:	4770      	bx	lr

080102b8 <user_process_exit>:
 80102b8:	df02      	svc	2
 80102ba:	4770      	bx	lr

build/firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

08000040 <resetHandlerHelper>:
extern uint32_t _euserdata;
extern uint32_t _suserbss;
extern uint32_t _euserbss;


void resetHandlerHelper(void) {
 8000040:	b480      	push	{r7}
 8000042:	b089      	sub	sp, #36	@ 0x24
 8000044:	af00      	add	r7, sp, #0
  uint32_t dest = (uint32_t)&_sdata;
 8000046:	4b27      	ldr	r3, [pc, #156]	@ (80000e4 <resetHandlerHelper+0xa4>)
 8000048:	60bb      	str	r3, [r7, #8]
  uint32_t dest_end = (uint32_t)&_edata;
 800004a:	4b27      	ldr	r3, [pc, #156]	@ (80000e8 <resetHandlerHelper+0xa8>)
 800004c:	607b      	str	r3, [r7, #4]
  uint32_t src = (uint32_t)&_sidata;
 800004e:	4b27      	ldr	r3, [pc, #156]	@ (80000ec <resetHandlerHelper+0xac>)
 8000050:	61fb      	str	r3, [r7, #28]

  /*copy data from data section to ram
   * init .bss section*/
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8000052:	68bb      	ldr	r3, [r7, #8]
 8000054:	61bb      	str	r3, [r7, #24]
 8000056:	e009      	b.n	800006c <resetHandlerHelper+0x2c>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 8000058:	69fa      	ldr	r2, [r7, #28]
 800005a:	69bb      	ldr	r3, [r7, #24]
 800005c:	6812      	ldr	r2, [r2, #0]
 800005e:	601a      	str	r2, [r3, #0]
    src += 4;
 8000060:	69fb      	ldr	r3, [r7, #28]
 8000062:	3304      	adds	r3, #4
 8000064:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8000066:	69bb      	ldr	r3, [r7, #24]
 8000068:	3304      	adds	r3, #4
 800006a:	61bb      	str	r3, [r7, #24]
 800006c:	69ba      	ldr	r2, [r7, #24]
 800006e:	687b      	ldr	r3, [r7, #4]
 8000070:	429a      	cmp	r2, r3
 8000072:	d9f1      	bls.n	8000058 <resetHandlerHelper+0x18>
  }

  dest = (uint32_t)&_suserdata;
 8000074:	4b1e      	ldr	r3, [pc, #120]	@ (80000f0 <resetHandlerHelper+0xb0>)
 8000076:	60bb      	str	r3, [r7, #8]
  dest_end = (uint32_t)&_euserdata;
 8000078:	4b1e      	ldr	r3, [pc, #120]	@ (80000f4 <resetHandlerHelper+0xb4>)
 800007a:	607b      	str	r3, [r7, #4]
  src = (uint32_t)&_siuserdata;
 800007c:	4b1e      	ldr	r3, [pc, #120]	@ (80000f8 <resetHandlerHelper+0xb8>)
 800007e:	61fb      	str	r3, [r7, #28]

  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8000080:	68bb      	ldr	r3, [r7, #8]
 8000082:	617b      	str	r3, [r7, #20]
 8000084:	e009      	b.n	800009a <resetHandlerHelper+0x5a>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 8000086:	69fa      	ldr	r2, [r7, #28]
 8000088:	697b      	ldr	r3, [r7, #20]
 800008a:	6812      	ldr	r2, [r2, #0]
 800008c:	601a      	str	r2, [r3, #0]
    src += 4;
 800008e:	69fb      	ldr	r3, [r7, #28]
 8000090:	3304      	adds	r3, #4
 8000092:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8000094:	697b      	ldr	r3, [r7, #20]
 8000096:	3304      	adds	r3, #4
 8000098:	617b      	str	r3, [r7, #20]
 800009a:	697a      	ldr	r2, [r7, #20]
 800009c:	687b      	ldr	r3, [r7, #4]
 800009e:	429a      	cmp	r2, r3
 80000a0:	d9f1      	bls.n	8000086 <resetHandlerHelper+0x46>
  }

  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 80000a2:	4b16      	ldr	r3, [pc, #88]	@ (80000fc <resetHandlerHelper+0xbc>)
 80000a4:	613b      	str	r3, [r7, #16]
 80000a6:	e005      	b.n	80000b4 <resetHandlerHelper+0x74>
    *(uint32_t *)(i) = 0;
 80000a8:	693b      	ldr	r3, [r7, #16]
 80000aa:	2200      	movs	r2, #0
 80000ac:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 80000ae:	693b      	ldr	r3, [r7, #16]
 80000b0:	3304      	adds	r3, #4
 80000b2:	613b      	str	r3, [r7, #16]
 80000b4:	4a12      	ldr	r2, [pc, #72]	@ (8000100 <resetHandlerHelper+0xc0>)
 80000b6:	693b      	ldr	r3, [r7, #16]
 80000b8:	4293      	cmp	r3, r2
 80000ba:	d9f5      	bls.n	80000a8 <resetHandlerHelper+0x68>
  }
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 80000bc:	4b11      	ldr	r3, [pc, #68]	@ (8000104 <resetHandlerHelper+0xc4>)
 80000be:	60fb      	str	r3, [r7, #12]
 80000c0:	e005      	b.n	80000ce <resetHandlerHelper+0x8e>
    *(uint32_t *)(i) = 0;
 80000c2:	68fb      	ldr	r3, [r7, #12]
 80000c4:	2200      	movs	r2, #0
 80000c6:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 80000c8:	68fb      	ldr	r3, [r7, #12]
 80000ca:	3304      	adds	r3, #4
 80000cc:	60fb      	str	r3, [r7, #12]
 80000ce:	4a0e      	ldr	r2, [pc, #56]	@ (8000108 <resetHandlerHelper+0xc8>)
 80000d0:	68fb      	ldr	r3, [r7, #12]
 80000d2:	4293      	cmp	r3, r2
 80000d4:	d9f5      	bls.n	80000c2 <resetHandlerHelper+0x82>
  }
}
 80000d6:	bf00      	nop
 80000d8:	bf00      	nop
 80000da:	3724      	adds	r7, #36	@ 0x24
 80000dc:	46bd      	mov	sp, r7
 80000de:	bc80      	pop	{r7}
 80000e0:	4770      	bx	lr
 80000e2:	bf00      	nop
 80000e4:	20000000 	.word	0x20000000
 80000e8:	20000001 	.word	0x20000001
 80000ec:	0800132b 	.word	0x0800132b
 80000f0:	20004000 	.word	0x20004000
 80000f4:	20004000 	.word	0x20004000
 80000f8:	080102bc 	.word	0x080102bc
 80000fc:	20000004 	.word	0x20000004
 8000100:	20000470 	.word	0x20000470
 8000104:	20004000 	.word	0x20004000
 8000108:	20004000 	.word	0x20004000

0800010c <fault_handler_helper>:

void fault_handler_helper(uint32_t pc, uint8_t fault_identifier,
                          uint32_t fault_place) {
 800010c:	b580      	push	{r7, lr}
 800010e:	b086      	sub	sp, #24
 8000110:	af00      	add	r7, sp, #0
 8000112:	60f8      	str	r0, [r7, #12]
 8000114:	460b      	mov	r3, r1
 8000116:	607a      	str	r2, [r7, #4]
 8000118:	72fb      	strb	r3, [r7, #11]

  /* bus fault diagnosis */
  if (fault_identifier == BUSFAULT_IDENTIFIER) {
 800011a:	7afb      	ldrb	r3, [r7, #11]
 800011c:	2b00      	cmp	r3, #0
 800011e:	d10e      	bne.n	800013e <fault_handler_helper+0x32>
    printf("busdault !!\n\r", 0x0);
 8000120:	2100      	movs	r1, #0
 8000122:	482d      	ldr	r0, [pc, #180]	@ (80001d8 <fault_handler_helper+0xcc>)
 8000124:	f000 fad4 	bl	80006d0 <printf>
    if (SCB->CFSR & SCB_CFSR_BFARVALID_Msk)
 8000128:	4b2c      	ldr	r3, [pc, #176]	@ (80001dc <fault_handler_helper+0xd0>)
 800012a:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 800012c:	f403 4300 	and.w	r3, r3, #32768	@ 0x8000
 8000130:	2b00      	cmp	r3, #0
 8000132:	d01f      	beq.n	8000174 <fault_handler_helper+0x68>
      printf("busfault address -> %\n\r", (uint32_t)(&SCB->BFAR));
 8000134:	492a      	ldr	r1, [pc, #168]	@ (80001e0 <fault_handler_helper+0xd4>)
 8000136:	482b      	ldr	r0, [pc, #172]	@ (80001e4 <fault_handler_helper+0xd8>)
 8000138:	f000 faca 	bl	80006d0 <printf>
 800013c:	e01a      	b.n	8000174 <fault_handler_helper+0x68>
  }

  /* MemManagement diagnosis */
  else if (fault_identifier == MEMMANAGE_IDENTIFIER) {
 800013e:	7afb      	ldrb	r3, [r7, #11]
 8000140:	2b01      	cmp	r3, #1
 8000142:	d110      	bne.n	8000166 <fault_handler_helper+0x5a>
    printf("MemManagement exception !!\n\r", 0x0);
 8000144:	2100      	movs	r1, #0
 8000146:	4828      	ldr	r0, [pc, #160]	@ (80001e8 <fault_handler_helper+0xdc>)
 8000148:	f000 fac2 	bl	80006d0 <printf>
    if (SCB->CFSR & SCB_CFSR_MMARVALID_Msk)
 800014c:	4b23      	ldr	r3, [pc, #140]	@ (80001dc <fault_handler_helper+0xd0>)
 800014e:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 8000150:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8000154:	2b00      	cmp	r3, #0
 8000156:	d00d      	beq.n	8000174 <fault_handler_helper+0x68>
      printf("address caused MemManage Fault -> %\n\r", SCB->MMFAR);
 8000158:	4b20      	ldr	r3, [pc, #128]	@ (80001dc <fault_handler_helper+0xd0>)
 800015a:	6b5b      	ldr	r3, [r3, #52]	@ 0x34
 800015c:	4619      	mov	r1, r3
 800015e:	4823      	ldr	r0, [pc, #140]	@ (80001ec <fault_handler_helper+0xe0>)
 8000160:	f000 fab6 	bl	80006d0 <printf>
 8000164:	e006      	b.n	8000174 <fault_handler_helper+0x68>
  }

  /* UsageFault diagnosis */
  else if (fault_identifier == USAGEFAULT_IDENTIFIER) {
 8000166:	7afb      	ldrb	r3, [r7, #11]
 8000168:	2b02      	cmp	r3, #2
 800016a:	d130      	bne.n	80001ce <fault_handler_helper+0xc2>
    printf("UsageFault !!\n\r", 0x0);
 800016c:	2100      	movs	r1, #0
 800016e:	4820      	ldr	r0, [pc, #128]	@ (80001f0 <fault_handler_helper+0xe4>)
 8000170:	f000 faae 	bl	80006d0 <printf>
    /* there is no address access that can cause USAGE FAULT */
  } else {
    return;
  }

  uint32_t instruction = *(uint32_t *)(pc);
 8000174:	68fb      	ldr	r3, [r7, #12]
 8000176:	681b      	ldr	r3, [r3, #0]
 8000178:	617b      	str	r3, [r7, #20]

  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 800017a:	491e      	ldr	r1, [pc, #120]	@ (80001f4 <fault_handler_helper+0xe8>)
 800017c:	481e      	ldr	r0, [pc, #120]	@ (80001f8 <fault_handler_helper+0xec>)
 800017e:	f000 faa7 	bl	80006d0 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("PC -> %\n\r", (uint32_t)&pc);
 8000182:	f107 030c 	add.w	r3, r7, #12
 8000186:	4619      	mov	r1, r3
 8000188:	481c      	ldr	r0, [pc, #112]	@ (80001fc <fault_handler_helper+0xf0>)
 800018a:	f000 faa1 	bl	80006d0 <printf>
  printf("instruction that caused the fault-> %\n\r", (uint32_t)(&instruction));
 800018e:	f107 0314 	add.w	r3, r7, #20
 8000192:	4619      	mov	r1, r3
 8000194:	481a      	ldr	r0, [pc, #104]	@ (8000200 <fault_handler_helper+0xf4>)
 8000196:	f000 fa9b 	bl	80006d0 <printf>

  /* KERNEL PANIC if fault in kernel
   * PROCESSES TERMINATION if fault in user process */

  if (fault_place == FAULT_IN_KERNEL) {
 800019a:	687b      	ldr	r3, [r7, #4]
 800019c:	2b01      	cmp	r3, #1
 800019e:	d104      	bne.n	80001aa <fault_handler_helper+0x9e>
    printf("\n\n\rKERNEL PANIC......\n\n\r", 0x0);
 80001a0:	2100      	movs	r1, #0
 80001a2:	4818      	ldr	r0, [pc, #96]	@ (8000204 <fault_handler_helper+0xf8>)
 80001a4:	f000 fa94 	bl	80006d0 <printf>
    while (1)
 80001a8:	e7fe      	b.n	80001a8 <fault_handler_helper+0x9c>
      ;
  }
  /* change state from running to suspend and set pendsv */
  else if (fault_place == FAULT_IN_USERPROC) {
 80001aa:	687b      	ldr	r3, [r7, #4]
 80001ac:	2b00      	cmp	r3, #0
 80001ae:	d10f      	bne.n	80001d0 <fault_handler_helper+0xc4>
    printf("terminating user process...\n\r", 0x0);
 80001b0:	2100      	movs	r1, #0
 80001b2:	4815      	ldr	r0, [pc, #84]	@ (8000208 <fault_handler_helper+0xfc>)
 80001b4:	f000 fa8c 	bl	80006d0 <printf>
    printf("reason -> fault", 0x0);
 80001b8:	2100      	movs	r1, #0
 80001ba:	4814      	ldr	r0, [pc, #80]	@ (800020c <fault_handler_helper+0x100>)
 80001bc:	f000 fa88 	bl	80006d0 <printf>

    (*(user_process_t **)(RUNNING_PROCESS_AD))->state = SUSPEND_STATE;
 80001c0:	4b13      	ldr	r3, [pc, #76]	@ (8000210 <fault_handler_helper+0x104>)
 80001c2:	681b      	ldr	r3, [r3, #0]
 80001c4:	2202      	movs	r2, #2
 80001c6:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* trigger context switching*/
    PendSV_Handler();
 80001c8:	f000 fdbc 	bl	8000d44 <PendSV_Handler>
 80001cc:	e000      	b.n	80001d0 <fault_handler_helper+0xc4>
    return;
 80001ce:	bf00      	nop
  }
}
 80001d0:	3718      	adds	r7, #24
 80001d2:	46bd      	mov	sp, r7
 80001d4:	bd80      	pop	{r7, pc}
 80001d6:	bf00      	nop
 80001d8:	08000e94 	.word	0x08000e94
 80001dc:	e000ed00 	.word	0xe000ed00
 80001e0:	e000ed38 	.word	0xe000ed38
 80001e4:	08000ea4 	.word	0x08000ea4
 80001e8:	08000ebc 	.word	0x08000ebc
 80001ec:	08000edc 	.word	0x08000edc
 80001f0:	08000f04 	.word	0x08000f04
 80001f4:	e000ed28 	.word	0xe000ed28
 80001f8:	08000f14 	.word	0x08000f14
 80001fc:	08000f44 	.word	0x08000f44
 8000200:	08000f50 	.word	0x08000f50
 8000204:	08000f78 	.word	0x08000f78
 8000208:	08000f94 	.word	0x08000f94
 800020c:	08000fb4 	.word	0x08000fb4
 8000210:	20016004 	.word	0x20016004

08000214 <HardFault_Handler_helper>:

void HardFault_Handler_helper(uint32_t pc) {
 8000214:	b580      	push	{r7, lr}
 8000216:	b084      	sub	sp, #16
 8000218:	af00      	add	r7, sp, #0
 800021a:	6078      	str	r0, [r7, #4]

  uint32_t instruction = *(uint32_t *)(pc);
 800021c:	687b      	ldr	r3, [r7, #4]
 800021e:	681b      	ldr	r3, [r3, #0]
 8000220:	60fb      	str	r3, [r7, #12]

  printf("HARD_FAULT !!!\n\r", 0x0);
 8000222:	2100      	movs	r1, #0
 8000224:	480c      	ldr	r0, [pc, #48]	@ (8000258 <HardFault_Handler_helper+0x44>)
 8000226:	f000 fa53 	bl	80006d0 <printf>
  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 800022a:	490c      	ldr	r1, [pc, #48]	@ (800025c <HardFault_Handler_helper+0x48>)
 800022c:	480c      	ldr	r0, [pc, #48]	@ (8000260 <HardFault_Handler_helper+0x4c>)
 800022e:	f000 fa4f 	bl	80006d0 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
 8000232:	490c      	ldr	r1, [pc, #48]	@ (8000264 <HardFault_Handler_helper+0x50>)
 8000234:	480c      	ldr	r0, [pc, #48]	@ (8000268 <HardFault_Handler_helper+0x54>)
 8000236:	f000 fa4b 	bl	80006d0 <printf>
  printf("PC -> %\n\r", (uint32_t)(&pc));
 800023a:	1d3b      	adds	r3, r7, #4
 800023c:	4619      	mov	r1, r3
 800023e:	480b      	ldr	r0, [pc, #44]	@ (800026c <HardFault_Handler_helper+0x58>)
 8000240:	f000 fa46 	bl	80006d0 <printf>
  printf("instruction that triggered HardFault -> %\n\r",
 8000244:	f107 030c 	add.w	r3, r7, #12
 8000248:	4619      	mov	r1, r3
 800024a:	4809      	ldr	r0, [pc, #36]	@ (8000270 <HardFault_Handler_helper+0x5c>)
 800024c:	f000 fa40 	bl	80006d0 <printf>
         (uint32_t)&instruction);
}
 8000250:	bf00      	nop
 8000252:	3710      	adds	r7, #16
 8000254:	46bd      	mov	sp, r7
 8000256:	bd80      	pop	{r7, pc}
 8000258:	08000fc4 	.word	0x08000fc4
 800025c:	e000ed28 	.word	0xe000ed28
 8000260:	08000f14 	.word	0x08000f14
 8000264:	e000ed2c 	.word	0xe000ed2c
 8000268:	08000fd8 	.word	0x08000fd8
 800026c:	08000f44 	.word	0x08000f44
 8000270:	08000ffc 	.word	0x08000ffc

08000274 <mpu_setup>:
#include "core.h"

void mpu_setup(void) {
 8000274:	b480      	push	{r7}
 8000276:	af00      	add	r7, sp, #0

  /*dissable mpu*/
  MPU->CTRL = 0;
 8000278:	4b12      	ldr	r3, [pc, #72]	@ (80002c4 <mpu_setup+0x50>)
 800027a:	2200      	movs	r2, #0
 800027c:	605a      	str	r2, [r3, #4]

  /*region 0*/
  MPU->RNR = 0;
 800027e:	4b11      	ldr	r3, [pc, #68]	@ (80002c4 <mpu_setup+0x50>)
 8000280:	2200      	movs	r2, #0
 8000282:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sFLASHUserSpace);
 8000284:	4b0f      	ldr	r3, [pc, #60]	@ (80002c4 <mpu_setup+0x50>)
 8000286:	4a10      	ldr	r2, [pc, #64]	@ (80002c8 <mpu_setup+0x54>)
 8000288:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 800028a:	4b0e      	ldr	r3, [pc, #56]	@ (80002c4 <mpu_setup+0x50>)
 800028c:	4a0f      	ldr	r2, [pc, #60]	@ (80002cc <mpu_setup+0x58>)
 800028e:	611a      	str	r2, [r3, #16]
      (0 << MPU_RASR_XN_Pos) |     // Executable (XN = 0)
      (0b110 << MPU_RASR_AP_Pos) | // Privileged read-only user read-only
      (15 << MPU_RASR_SIZE_Pos) |  // 64 KB region
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 1;
 8000290:	4b0c      	ldr	r3, [pc, #48]	@ (80002c4 <mpu_setup+0x50>)
 8000292:	2201      	movs	r2, #1
 8000294:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sSRAMUserSpace);
 8000296:	4b0b      	ldr	r3, [pc, #44]	@ (80002c4 <mpu_setup+0x50>)
 8000298:	4a0d      	ldr	r2, [pc, #52]	@ (80002d0 <mpu_setup+0x5c>)
 800029a:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 800029c:	4b09      	ldr	r3, [pc, #36]	@ (80002c4 <mpu_setup+0x50>)
 800029e:	4a0d      	ldr	r2, [pc, #52]	@ (80002d4 <mpu_setup+0x60>)
 80002a0:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 2;
 80002a2:	4b08      	ldr	r3, [pc, #32]	@ (80002c4 <mpu_setup+0x50>)
 80002a4:	2202      	movs	r2, #2
 80002a6:	609a      	str	r2, [r3, #8]
  MPU->RBAR = USER_STACK_END;
 80002a8:	4b06      	ldr	r3, [pc, #24]	@ (80002c4 <mpu_setup+0x50>)
 80002aa:	4a0b      	ldr	r2, [pc, #44]	@ (80002d8 <mpu_setup+0x64>)
 80002ac:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 80002ae:	4b05      	ldr	r3, [pc, #20]	@ (80002c4 <mpu_setup+0x50>)
 80002b0:	4a08      	ldr	r2, [pc, #32]	@ (80002d4 <mpu_setup+0x60>)
 80002b2:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->CTRL = MPU_CTRL_PRIVDEFENA_Msk | MPU_CTRL_ENABLE_Msk;
 80002b4:	4b03      	ldr	r3, [pc, #12]	@ (80002c4 <mpu_setup+0x50>)
 80002b6:	2205      	movs	r2, #5
 80002b8:	605a      	str	r2, [r3, #4]
}
 80002ba:	bf00      	nop
 80002bc:	46bd      	mov	sp, r7
 80002be:	bc80      	pop	{r7}
 80002c0:	4770      	bx	lr
 80002c2:	bf00      	nop
 80002c4:	e000ed90 	.word	0xe000ed90
 80002c8:	08010000 	.word	0x08010000
 80002cc:	0600001f 	.word	0x0600001f
 80002d0:	20004000 	.word	0x20004000
 80002d4:	1300001d 	.word	0x1300001d
 80002d8:	20008000 	.word	0x20008000

080002dc <queue_init>:
#include "core.h"

/* queue functions */
void queue_init (queue_t* q){
 80002dc:	b480      	push	{r7}
 80002de:	b083      	sub	sp, #12
 80002e0:	af00      	add	r7, sp, #0
 80002e2:	6078      	str	r0, [r7, #4]
    q->size = 0;
 80002e4:	687b      	ldr	r3, [r7, #4]
 80002e6:	2200      	movs	r2, #0
 80002e8:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    q->front = 0xff;
 80002ec:	687b      	ldr	r3, [r7, #4]
 80002ee:	22ff      	movs	r2, #255	@ 0xff
 80002f0:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    q->rare = 0;
 80002f4:	687b      	ldr	r3, [r7, #4]
 80002f6:	2200      	movs	r2, #0
 80002f8:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
}
 80002fc:	bf00      	nop
 80002fe:	370c      	adds	r7, #12
 8000300:	46bd      	mov	sp, r7
 8000302:	bc80      	pop	{r7}
 8000304:	4770      	bx	lr

08000306 <queue_push>:

uint8_t queue_push (queue_t* q, user_process_t* process){
 8000306:	b480      	push	{r7}
 8000308:	b083      	sub	sp, #12
 800030a:	af00      	add	r7, sp, #0
 800030c:	6078      	str	r0, [r7, #4]
 800030e:	6039      	str	r1, [r7, #0]
    if (q->front == 0xff){
 8000310:	687b      	ldr	r3, [r7, #4]
 8000312:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8000316:	2bff      	cmp	r3, #255	@ 0xff
 8000318:	d104      	bne.n	8000324 <queue_push+0x1e>
        /* queue is empty */
        q->front = 0;
 800031a:	687b      	ldr	r3, [r7, #4]
 800031c:	2200      	movs	r2, #0
 800031e:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
 8000322:	e009      	b.n	8000338 <queue_push+0x32>
    }
    else if (q->rare == q->front) return -1;
 8000324:	687b      	ldr	r3, [r7, #4]
 8000326:	f893 207a 	ldrb.w	r2, [r3, #122]	@ 0x7a
 800032a:	687b      	ldr	r3, [r7, #4]
 800032c:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8000330:	429a      	cmp	r2, r3
 8000332:	d101      	bne.n	8000338 <queue_push+0x32>
 8000334:	23ff      	movs	r3, #255	@ 0xff
 8000336:	e023      	b.n	8000380 <queue_push+0x7a>

    q->processes [q->rare] = process;
 8000338:	687b      	ldr	r3, [r7, #4]
 800033a:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 800033e:	4619      	mov	r1, r3
 8000340:	687b      	ldr	r3, [r7, #4]
 8000342:	683a      	ldr	r2, [r7, #0]
 8000344:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
    q->rare = (q->rare + 1) % MAX_PROCESS_NUM;
 8000348:	687b      	ldr	r3, [r7, #4]
 800034a:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 800034e:	1c5a      	adds	r2, r3, #1
 8000350:	4b0e      	ldr	r3, [pc, #56]	@ (800038c <queue_push+0x86>)
 8000352:	fb83 1302 	smull	r1, r3, r3, r2
 8000356:	4413      	add	r3, r2
 8000358:	10d9      	asrs	r1, r3, #3
 800035a:	17d3      	asrs	r3, r2, #31
 800035c:	1ac9      	subs	r1, r1, r3
 800035e:	460b      	mov	r3, r1
 8000360:	011b      	lsls	r3, r3, #4
 8000362:	1a5b      	subs	r3, r3, r1
 8000364:	1ad1      	subs	r1, r2, r3
 8000366:	b2ca      	uxtb	r2, r1
 8000368:	687b      	ldr	r3, [r7, #4]
 800036a:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a

    q->size ++ ;
 800036e:	687b      	ldr	r3, [r7, #4]
 8000370:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 8000374:	3301      	adds	r3, #1
 8000376:	b2da      	uxtb	r2, r3
 8000378:	687b      	ldr	r3, [r7, #4]
 800037a:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 800037e:	2300      	movs	r3, #0
}
 8000380:	4618      	mov	r0, r3
 8000382:	370c      	adds	r7, #12
 8000384:	46bd      	mov	sp, r7
 8000386:	bc80      	pop	{r7}
 8000388:	4770      	bx	lr
 800038a:	bf00      	nop
 800038c:	88888889 	.word	0x88888889

08000390 <queue_pop>:

uint8_t queue_pop (queue_t* q){   
 8000390:	b480      	push	{r7}
 8000392:	b083      	sub	sp, #12
 8000394:	af00      	add	r7, sp, #0
 8000396:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff){
 8000398:	687b      	ldr	r3, [r7, #4]
 800039a:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 800039e:	2bff      	cmp	r3, #255	@ 0xff
 80003a0:	d101      	bne.n	80003a6 <queue_pop+0x16>
        /* q is empty*/
        return -1;
 80003a2:	23ff      	movs	r3, #255	@ 0xff
 80003a4:	e02b      	b.n	80003fe <queue_pop+0x6e>
    }
    q->front = (q->front + 1) % MAX_PROCESS_NUM;
 80003a6:	687b      	ldr	r3, [r7, #4]
 80003a8:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 80003ac:	1c5a      	adds	r2, r3, #1
 80003ae:	4b16      	ldr	r3, [pc, #88]	@ (8000408 <queue_pop+0x78>)
 80003b0:	fb83 1302 	smull	r1, r3, r3, r2
 80003b4:	4413      	add	r3, r2
 80003b6:	10d9      	asrs	r1, r3, #3
 80003b8:	17d3      	asrs	r3, r2, #31
 80003ba:	1ac9      	subs	r1, r1, r3
 80003bc:	460b      	mov	r3, r1
 80003be:	011b      	lsls	r3, r3, #4
 80003c0:	1a5b      	subs	r3, r3, r1
 80003c2:	1ad1      	subs	r1, r2, r3
 80003c4:	b2ca      	uxtb	r2, r1
 80003c6:	687b      	ldr	r3, [r7, #4]
 80003c8:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    if (q->front == q->rare){
 80003cc:	687b      	ldr	r3, [r7, #4]
 80003ce:	f893 2079 	ldrb.w	r2, [r3, #121]	@ 0x79
 80003d2:	687b      	ldr	r3, [r7, #4]
 80003d4:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 80003d8:	429a      	cmp	r2, r3
 80003da:	d107      	bne.n	80003ec <queue_pop+0x5c>
        q->front = 0xff;
 80003dc:	687b      	ldr	r3, [r7, #4]
 80003de:	22ff      	movs	r2, #255	@ 0xff
 80003e0:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
        q->rare = 0;
 80003e4:	687b      	ldr	r3, [r7, #4]
 80003e6:	2200      	movs	r2, #0
 80003e8:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
    }
    q->size --;
 80003ec:	687b      	ldr	r3, [r7, #4]
 80003ee:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 80003f2:	3b01      	subs	r3, #1
 80003f4:	b2da      	uxtb	r2, r3
 80003f6:	687b      	ldr	r3, [r7, #4]
 80003f8:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 80003fc:	2300      	movs	r3, #0
}
 80003fe:	4618      	mov	r0, r3
 8000400:	370c      	adds	r7, #12
 8000402:	46bd      	mov	sp, r7
 8000404:	bc80      	pop	{r7}
 8000406:	4770      	bx	lr
 8000408:	88888889 	.word	0x88888889

0800040c <queue_front>:

user_process_t* queue_front (queue_t *q){
 800040c:	b480      	push	{r7}
 800040e:	b083      	sub	sp, #12
 8000410:	af00      	add	r7, sp, #0
 8000412:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff)
 8000414:	687b      	ldr	r3, [r7, #4]
 8000416:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 800041a:	2bff      	cmp	r3, #255	@ 0xff
 800041c:	d101      	bne.n	8000422 <queue_front+0x16>
        return NULL;
 800041e:	2300      	movs	r3, #0
 8000420:	e006      	b.n	8000430 <queue_front+0x24>
    return q->processes [q->front];
 8000422:	687b      	ldr	r3, [r7, #4]
 8000424:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8000428:	461a      	mov	r2, r3
 800042a:	687b      	ldr	r3, [r7, #4]
 800042c:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
}
 8000430:	4618      	mov	r0, r3
 8000432:	370c      	adds	r7, #12
 8000434:	46bd      	mov	sp, r7
 8000436:	bc80      	pop	{r7}
 8000438:	4770      	bx	lr

0800043a <queue_empty>:

uint32_t queue_empty (queue_t *q){
 800043a:	b480      	push	{r7}
 800043c:	b083      	sub	sp, #12
 800043e:	af00      	add	r7, sp, #0
 8000440:	6078      	str	r0, [r7, #4]
    return q->front == 0xff;
 8000442:	687b      	ldr	r3, [r7, #4]
 8000444:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8000448:	2bff      	cmp	r3, #255	@ 0xff
 800044a:	bf0c      	ite	eq
 800044c:	2301      	moveq	r3, #1
 800044e:	2300      	movne	r3, #0
 8000450:	b2db      	uxtb	r3, r3
}
 8000452:	4618      	mov	r0, r3
 8000454:	370c      	adds	r7, #12
 8000456:	46bd      	mov	sp, r7
 8000458:	bc80      	pop	{r7}
 800045a:	4770      	bx	lr

0800045c <queue_size>:

uint32_t queue_size (queue_t *q){
 800045c:	b480      	push	{r7}
 800045e:	b083      	sub	sp, #12
 8000460:	af00      	add	r7, sp, #0
 8000462:	6078      	str	r0, [r7, #4]
    return q->size;
 8000464:	687b      	ldr	r3, [r7, #4]
 8000466:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
}
 800046a:	4618      	mov	r0, r3
 800046c:	370c      	adds	r7, #12
 800046e:	46bd      	mov	sp, r7
 8000470:	bc80      	pop	{r7}
 8000472:	4770      	bx	lr

08000474 <__NVIC_SetPendingIRQ>:
  \details Sets the pending bit of a device specific interrupt in the NVIC pending register.
  \param [in]      IRQn  Device specific interrupt number.
  \note    IRQn must not be negative.
 */
__STATIC_INLINE void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
 8000474:	b480      	push	{r7}
 8000476:	b083      	sub	sp, #12
 8000478:	af00      	add	r7, sp, #0
 800047a:	4603      	mov	r3, r0
 800047c:	71fb      	strb	r3, [r7, #7]
  if ((int32_t)(IRQn) >= 0)
 800047e:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000482:	2b00      	cmp	r3, #0
 8000484:	db0c      	blt.n	80004a0 <__NVIC_SetPendingIRQ+0x2c>
  {
    NVIC->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
 8000486:	79fb      	ldrb	r3, [r7, #7]
 8000488:	f003 021f 	and.w	r2, r3, #31
 800048c:	4907      	ldr	r1, [pc, #28]	@ (80004ac <__NVIC_SetPendingIRQ+0x38>)
 800048e:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000492:	095b      	lsrs	r3, r3, #5
 8000494:	2001      	movs	r0, #1
 8000496:	fa00 f202 	lsl.w	r2, r0, r2
 800049a:	3340      	adds	r3, #64	@ 0x40
 800049c:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
  }
}
 80004a0:	bf00      	nop
 80004a2:	370c      	adds	r7, #12
 80004a4:	46bd      	mov	sp, r7
 80004a6:	bc80      	pop	{r7}
 80004a8:	4770      	bx	lr
 80004aa:	bf00      	nop
 80004ac:	e000e100 	.word	0xe000e100

080004b0 <semaphore_init>:
#include "core.h"

extern queue_t ready_queue;
extern uint8_t process_count;

void semaphore_init(semaphore_t *sema, uint8_t val) {
 80004b0:	b580      	push	{r7, lr}
 80004b2:	b082      	sub	sp, #8
 80004b4:	af00      	add	r7, sp, #0
 80004b6:	6078      	str	r0, [r7, #4]
 80004b8:	460b      	mov	r3, r1
 80004ba:	70fb      	strb	r3, [r7, #3]
  sema->value = val; // unlocked
 80004bc:	687b      	ldr	r3, [r7, #4]
 80004be:	78fa      	ldrb	r2, [r7, #3]
 80004c0:	701a      	strb	r2, [r3, #0]
  queue_init(&(sema->waiting_queue));
 80004c2:	687b      	ldr	r3, [r7, #4]
 80004c4:	3304      	adds	r3, #4
 80004c6:	4618      	mov	r0, r3
 80004c8:	f7ff ff08 	bl	80002dc <queue_init>
}
 80004cc:	bf00      	nop
 80004ce:	3708      	adds	r7, #8
 80004d0:	46bd      	mov	sp, r7
 80004d2:	bd80      	pop	{r7, pc}

080004d4 <semaphore_lock>:

/* this has to be atomic */
void semaphore_lock(semaphore_t *sema) {
 80004d4:	b580      	push	{r7, lr}
 80004d6:	b084      	sub	sp, #16
 80004d8:	af00      	add	r7, sp, #0
 80004da:	6078      	str	r0, [r7, #4]
  \details Disables IRQ interrupts by setting special-purpose register PRIMASK.
           Can only be executed in Privileged modes.
 */
__STATIC_FORCEINLINE void __disable_irq(void)
{
  __ASM volatile ("cpsid i" : : : "memory");
 80004dc:	b672      	cpsid	i
}
 80004de:	bf00      	nop
  __disable_irq();
  if (sema->value == 0) { // semaphore cannot be locked ...
 80004e0:	687b      	ldr	r3, [r7, #4]
 80004e2:	781b      	ldrb	r3, [r3, #0]
 80004e4:	2b00      	cmp	r3, #0
 80004e6:	d112      	bne.n	800050e <semaphore_lock+0x3a>
    user_process_t *running_process =
        *((user_process_t **)(RUNNING_PROCESS_AD));
 80004e8:	4b0e      	ldr	r3, [pc, #56]	@ (8000524 <semaphore_lock+0x50>)
    user_process_t *running_process =
 80004ea:	681b      	ldr	r3, [r3, #0]
 80004ec:	60fb      	str	r3, [r7, #12]
    queue_push(&(sema->waiting_queue), running_process);
 80004ee:	687b      	ldr	r3, [r7, #4]
 80004f0:	3304      	adds	r3, #4
 80004f2:	68f9      	ldr	r1, [r7, #12]
 80004f4:	4618      	mov	r0, r3
 80004f6:	f7ff ff06 	bl	8000306 <queue_push>
    running_process->state = WAITING_STATE;
 80004fa:	68fb      	ldr	r3, [r7, #12]
 80004fc:	2203      	movs	r2, #3
 80004fe:	62da      	str	r2, [r3, #44]	@ 0x2c

//    schedular ();

    /* call PendSV_Handler for context switching */
    //PendSV_Handler();
    NVIC_SetPendingIRQ (PendSV_IRQn);
 8000500:	f06f 0001 	mvn.w	r0, #1
 8000504:	f7ff ffb6 	bl	8000474 <__NVIC_SetPendingIRQ>
  __ASM volatile ("cpsie i" : : : "memory");
 8000508:	b662      	cpsie	i
}
 800050a:	bf00      	nop

    __enable_irq();
    return;
 800050c:	e007      	b.n	800051e <semaphore_lock+0x4a>
  }
  sema->value--;
 800050e:	687b      	ldr	r3, [r7, #4]
 8000510:	781b      	ldrb	r3, [r3, #0]
 8000512:	3b01      	subs	r3, #1
 8000514:	b2da      	uxtb	r2, r3
 8000516:	687b      	ldr	r3, [r7, #4]
 8000518:	701a      	strb	r2, [r3, #0]
  __ASM volatile ("cpsie i" : : : "memory");
 800051a:	b662      	cpsie	i
}
 800051c:	bf00      	nop
  __enable_irq();
}
 800051e:	3710      	adds	r7, #16
 8000520:	46bd      	mov	sp, r7
 8000522:	bd80      	pop	{r7, pc}
 8000524:	20016004 	.word	0x20016004

08000528 <semaphore_unlock>:

void semaphore_unlock(semaphore_t *sema) {
 8000528:	b580      	push	{r7, lr}
 800052a:	b084      	sub	sp, #16
 800052c:	af00      	add	r7, sp, #0
 800052e:	6078      	str	r0, [r7, #4]
  __ASM volatile ("cpsid i" : : : "memory");
 8000530:	b672      	cpsid	i
}
 8000532:	bf00      	nop
  __disable_irq();
  sema->value++;
 8000534:	687b      	ldr	r3, [r7, #4]
 8000536:	781b      	ldrb	r3, [r3, #0]
 8000538:	3301      	adds	r3, #1
 800053a:	b2da      	uxtb	r2, r3
 800053c:	687b      	ldr	r3, [r7, #4]
 800053e:	701a      	strb	r2, [r3, #0]
  /* unlocked */
  user_process_t *process = queue_front(&(sema->waiting_queue));
 8000540:	687b      	ldr	r3, [r7, #4]
 8000542:	3304      	adds	r3, #4
 8000544:	4618      	mov	r0, r3
 8000546:	f7ff ff61 	bl	800040c <queue_front>
 800054a:	60f8      	str	r0, [r7, #12]
  if (!process) {
 800054c:	68fb      	ldr	r3, [r7, #12]
 800054e:	2b00      	cmp	r3, #0
 8000550:	d102      	bne.n	8000558 <semaphore_unlock+0x30>
  __ASM volatile ("cpsie i" : : : "memory");
 8000552:	b662      	cpsie	i
}
 8000554:	bf00      	nop
    /* no process is waiting */
    __enable_irq();
    return;
 8000556:	e00d      	b.n	8000574 <semaphore_unlock+0x4c>
  }
  queue_pop(&(sema->waiting_queue));
 8000558:	687b      	ldr	r3, [r7, #4]
 800055a:	3304      	adds	r3, #4
 800055c:	4618      	mov	r0, r3
 800055e:	f7ff ff17 	bl	8000390 <queue_pop>
  process->state = READY_STATE;
 8000562:	68fb      	ldr	r3, [r7, #12]
 8000564:	2200      	movs	r2, #0
 8000566:	62da      	str	r2, [r3, #44]	@ 0x2c
  queue_push(&ready_queue, process);
 8000568:	68f9      	ldr	r1, [r7, #12]
 800056a:	4804      	ldr	r0, [pc, #16]	@ (800057c <semaphore_unlock+0x54>)
 800056c:	f7ff fecb 	bl	8000306 <queue_push>
  __ASM volatile ("cpsie i" : : : "memory");
 8000570:	b662      	cpsie	i
}
 8000572:	bf00      	nop
  __enable_irq();
}
 8000574:	3710      	adds	r7, #16
 8000576:	46bd      	mov	sp, r7
 8000578:	bd80      	pop	{r7, pc}
 800057a:	bf00      	nop
 800057c:	200003f4 	.word	0x200003f4

08000580 <schedular>:
/* important variable from main.c */
extern user_process_t process[MAX_PROCESS_NUM];
extern queue_t ready_queue;
extern semaphore_t sem_usart1;

void schedular(void) {
 8000580:	b580      	push	{r7, lr}
 8000582:	b084      	sub	sp, #16
 8000584:	af00      	add	r7, sp, #0

  /* Round Robin (FCFS + time slice)*/
  user_process_t *picked_process = NULL;
 8000586:	2300      	movs	r3, #0
 8000588:	60fb      	str	r3, [r7, #12]
  user_process_t *running_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 800058a:	4b1a      	ldr	r3, [pc, #104]	@ (80005f4 <schedular+0x74>)
 800058c:	681b      	ldr	r3, [r3, #0]
 800058e:	60bb      	str	r3, [r7, #8]


  // we could use a priority queue here to support priority...
  picked_process = queue_front(&ready_queue);
 8000590:	4819      	ldr	r0, [pc, #100]	@ (80005f8 <schedular+0x78>)
 8000592:	f7ff ff3b 	bl	800040c <queue_front>
 8000596:	60f8      	str	r0, [r7, #12]
  uint8_t status = queue_pop(&ready_queue);
 8000598:	4817      	ldr	r0, [pc, #92]	@ (80005f8 <schedular+0x78>)
 800059a:	f7ff fef9 	bl	8000390 <queue_pop>
 800059e:	4603      	mov	r3, r0
 80005a0:	71fb      	strb	r3, [r7, #7]


  // if ready queue is empty, then pick the runnung process
  if (0xff == status || !picked_process){
 80005a2:	79fb      	ldrb	r3, [r7, #7]
 80005a4:	2bff      	cmp	r3, #255	@ 0xff
 80005a6:	d002      	beq.n	80005ae <schedular+0x2e>
 80005a8:	68fb      	ldr	r3, [r7, #12]
 80005aa:	2b00      	cmp	r3, #0
 80005ac:	d108      	bne.n	80005c0 <schedular+0x40>
    picked_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 80005ae:	4b11      	ldr	r3, [pc, #68]	@ (80005f4 <schedular+0x74>)
 80005b0:	681b      	ldr	r3, [r3, #0]
 80005b2:	60fb      	str	r3, [r7, #12]
    // dissable systick to remove the context switching overhead if there is only one process .
    SysTick->CTRL &= ~(SysTick_CTRL_ENABLE_Msk);
 80005b4:	4b11      	ldr	r3, [pc, #68]	@ (80005fc <schedular+0x7c>)
 80005b6:	681b      	ldr	r3, [r3, #0]
 80005b8:	4a10      	ldr	r2, [pc, #64]	@ (80005fc <schedular+0x7c>)
 80005ba:	f023 0301 	bic.w	r3, r3, #1
 80005be:	6013      	str	r3, [r2, #0]
    // better if the last standing process is too large  or there is only one process to begin with
  }

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);
 80005c0:	4a0f      	ldr	r2, [pc, #60]	@ (8000600 <schedular+0x80>)
 80005c2:	68fb      	ldr	r3, [r7, #12]
 80005c4:	6013      	str	r3, [r2, #0]
  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE &&
 80005c6:	68bb      	ldr	r3, [r7, #8]
 80005c8:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 80005ca:	2b02      	cmp	r3, #2
 80005cc:	d00a      	beq.n	80005e4 <schedular+0x64>
      running_process->state != WAITING_STATE) {
 80005ce:	68bb      	ldr	r3, [r7, #8]
 80005d0:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
  if (running_process->state != SUSPEND_STATE &&
 80005d2:	2b03      	cmp	r3, #3
 80005d4:	d006      	beq.n	80005e4 <schedular+0x64>
    queue_push(&ready_queue, running_process);
 80005d6:	68b9      	ldr	r1, [r7, #8]
 80005d8:	4807      	ldr	r0, [pc, #28]	@ (80005f8 <schedular+0x78>)
 80005da:	f7ff fe94 	bl	8000306 <queue_push>
    running_process->state = READY_STATE;
 80005de:	68bb      	ldr	r3, [r7, #8]
 80005e0:	2200      	movs	r2, #0
 80005e2:	62da      	str	r2, [r3, #44]	@ 0x2c
  }

  picked_process->state = RUNNING_STATE;
 80005e4:	68fb      	ldr	r3, [r7, #12]
 80005e6:	2201      	movs	r2, #1
 80005e8:	62da      	str	r2, [r3, #44]	@ 0x2c
}
 80005ea:	bf00      	nop
 80005ec:	3710      	adds	r7, #16
 80005ee:	46bd      	mov	sp, r7
 80005f0:	bd80      	pop	{r7, pc}
 80005f2:	bf00      	nop
 80005f4:	20016004 	.word	0x20016004
 80005f8:	200003f4 	.word	0x200003f4
 80005fc:	e000e010 	.word	0xe000e010
 8000600:	20016008 	.word	0x20016008

08000604 <enterCRITICAL>:


extern semaphore_t sem_usart1;
extern uint8_t process_count;

void enterCRITICAL(void) { __disable_irq(); }
 8000604:	b480      	push	{r7}
 8000606:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsid i" : : : "memory");
 8000608:	b672      	cpsid	i
}
 800060a:	bf00      	nop
 800060c:	bf00      	nop
 800060e:	46bd      	mov	sp, r7
 8000610:	bc80      	pop	{r7}
 8000612:	4770      	bx	lr

08000614 <exitCRITICAL>:

void exitCRITICAL(void) { __enable_irq(); }
 8000614:	b480      	push	{r7}
 8000616:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsie i" : : : "memory");
 8000618:	b662      	cpsie	i
}
 800061a:	bf00      	nop
 800061c:	bf00      	nop
 800061e:	46bd      	mov	sp, r7
 8000620:	bc80      	pop	{r7}
 8000622:	4770      	bx	lr

08000624 <_strlen>:

uint32_t _strlen(const char *msg) {
 8000624:	b480      	push	{r7}
 8000626:	b085      	sub	sp, #20
 8000628:	af00      	add	r7, sp, #0
 800062a:	6078      	str	r0, [r7, #4]

  int i = 0;
 800062c:	2300      	movs	r3, #0
 800062e:	60fb      	str	r3, [r7, #12]
  while (msg[i++] != '\0')
 8000630:	bf00      	nop
 8000632:	68fb      	ldr	r3, [r7, #12]
 8000634:	1c5a      	adds	r2, r3, #1
 8000636:	60fa      	str	r2, [r7, #12]
 8000638:	461a      	mov	r2, r3
 800063a:	687b      	ldr	r3, [r7, #4]
 800063c:	4413      	add	r3, r2
 800063e:	781b      	ldrb	r3, [r3, #0]
 8000640:	2b00      	cmp	r3, #0
 8000642:	d1f6      	bne.n	8000632 <_strlen+0xe>
    ;
  return i - 1;
 8000644:	68fb      	ldr	r3, [r7, #12]
 8000646:	3b01      	subs	r3, #1
}
 8000648:	4618      	mov	r0, r3
 800064a:	3714      	adds	r7, #20
 800064c:	46bd      	mov	sp, r7
 800064e:	bc80      	pop	{r7}
 8000650:	4770      	bx	lr

08000652 <hex_str>:

char *hex_str(uint32_t value, char *out) {
 8000652:	b4b0      	push	{r4, r5, r7}
 8000654:	b08b      	sub	sp, #44	@ 0x2c
 8000656:	af00      	add	r7, sp, #0
 8000658:	6078      	str	r0, [r7, #4]
 800065a:	6039      	str	r1, [r7, #0]

  char hex_char[] = "0123456789abcdef";
 800065c:	4b1b      	ldr	r3, [pc, #108]	@ (80006cc <hex_str+0x7a>)
 800065e:	f107 0408 	add.w	r4, r7, #8
 8000662:	461d      	mov	r5, r3
 8000664:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
 8000666:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 8000668:	682b      	ldr	r3, [r5, #0]
 800066a:	7023      	strb	r3, [r4, #0]
  out[0] = '0';
 800066c:	683b      	ldr	r3, [r7, #0]
 800066e:	2230      	movs	r2, #48	@ 0x30
 8000670:	701a      	strb	r2, [r3, #0]
  out[1] = 'x';
 8000672:	683b      	ldr	r3, [r7, #0]
 8000674:	3301      	adds	r3, #1
 8000676:	2278      	movs	r2, #120	@ 0x78
 8000678:	701a      	strb	r2, [r3, #0]

  for (int i = 0; i < 8; i++) {
 800067a:	2300      	movs	r3, #0
 800067c:	627b      	str	r3, [r7, #36]	@ 0x24
 800067e:	e01c      	b.n	80006ba <hex_str+0x68>
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
 8000680:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8000682:	009b      	lsls	r3, r3, #2
 8000684:	220f      	movs	r2, #15
 8000686:	fa02 f303 	lsl.w	r3, r2, r3
 800068a:	461a      	mov	r2, r3
 800068c:	687b      	ldr	r3, [r7, #4]
 800068e:	401a      	ands	r2, r3
 8000690:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8000692:	009b      	lsls	r3, r3, #2
 8000694:	fa22 f303 	lsr.w	r3, r2, r3
 8000698:	623b      	str	r3, [r7, #32]
    int j = 9 - i;
 800069a:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 800069c:	f1c3 0309 	rsb	r3, r3, #9
 80006a0:	61fb      	str	r3, [r7, #28]
    out[j] = hex_char[ind];
 80006a2:	69fb      	ldr	r3, [r7, #28]
 80006a4:	683a      	ldr	r2, [r7, #0]
 80006a6:	4413      	add	r3, r2
 80006a8:	f107 0108 	add.w	r1, r7, #8
 80006ac:	6a3a      	ldr	r2, [r7, #32]
 80006ae:	440a      	add	r2, r1
 80006b0:	7812      	ldrb	r2, [r2, #0]
 80006b2:	701a      	strb	r2, [r3, #0]
  for (int i = 0; i < 8; i++) {
 80006b4:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006b6:	3301      	adds	r3, #1
 80006b8:	627b      	str	r3, [r7, #36]	@ 0x24
 80006ba:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006bc:	2b07      	cmp	r3, #7
 80006be:	dddf      	ble.n	8000680 <hex_str+0x2e>
  }
}
 80006c0:	bf00      	nop
 80006c2:	4618      	mov	r0, r3
 80006c4:	372c      	adds	r7, #44	@ 0x2c
 80006c6:	46bd      	mov	sp, r7
 80006c8:	bcb0      	pop	{r4, r5, r7}
 80006ca:	4770      	bx	lr
 80006cc:	08001028 	.word	0x08001028

080006d0 <printf>:

void printf(const char *msg, uint32_t address) {
 80006d0:	b580      	push	{r7, lr}
 80006d2:	b0a4      	sub	sp, #144	@ 0x90
 80006d4:	af00      	add	r7, sp, #0
 80006d6:	6078      	str	r0, [r7, #4]
 80006d8:	6039      	str	r1, [r7, #0]

  uint32_t value = *((uint32_t *)address);
 80006da:	683b      	ldr	r3, [r7, #0]
 80006dc:	681b      	ldr	r3, [r3, #0]
 80006de:	67fb      	str	r3, [r7, #124]	@ 0x7c
  uint32_t msg_size = _strlen(msg);
 80006e0:	6878      	ldr	r0, [r7, #4]
 80006e2:	f7ff ff9f 	bl	8000624 <_strlen>
 80006e6:	67b8      	str	r0, [r7, #120]	@ 0x78

  if (msg_size + 9 > MAX_STR_SIZE) {
 80006e8:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 80006ea:	3309      	adds	r3, #9
 80006ec:	2b64      	cmp	r3, #100	@ 0x64
 80006ee:	d904      	bls.n	80006fa <printf+0x2a>
    __usart1_print("too large error message !!\n\r", MAX_STR_SIZE);
 80006f0:	2164      	movs	r1, #100	@ 0x64
 80006f2:	483d      	ldr	r0, [pc, #244]	@ (80007e8 <printf+0x118>)
 80006f4:	f000 fae6 	bl	8000cc4 <__usart1_print>
 80006f8:	e072      	b.n	80007e0 <printf+0x110>
    return;
  }
  char hex[10];
  char __msg[MAX_STR_SIZE];

  uint32_t i = 0;
 80006fa:	2300      	movs	r3, #0
 80006fc:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
  int p = 0, q = 0;
 8000700:	2300      	movs	r3, #0
 8000702:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
 8000706:	2300      	movs	r3, #0
 8000708:	f8c7 3084 	str.w	r3, [r7, #132]	@ 0x84
  bool single_sub = false;
 800070c:	2300      	movs	r3, #0
 800070e:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83

  for (; i < msg_size; i++) {
 8000712:	e04d      	b.n	80007b0 <printf+0xe0>

    if (msg[i] == '%' && !single_sub) {
 8000714:	687a      	ldr	r2, [r7, #4]
 8000716:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 800071a:	4413      	add	r3, r2
 800071c:	781b      	ldrb	r3, [r3, #0]
 800071e:	2b25      	cmp	r3, #37	@ 0x25
 8000720:	d12f      	bne.n	8000782 <printf+0xb2>
 8000722:	f897 3083 	ldrb.w	r3, [r7, #131]	@ 0x83
 8000726:	f083 0301 	eor.w	r3, r3, #1
 800072a:	b2db      	uxtb	r3, r3
 800072c:	2b00      	cmp	r3, #0
 800072e:	d028      	beq.n	8000782 <printf+0xb2>
      hex_str(value, hex);
 8000730:	f107 036c 	add.w	r3, r7, #108	@ 0x6c
 8000734:	4619      	mov	r1, r3
 8000736:	6ff8      	ldr	r0, [r7, #124]	@ 0x7c
 8000738:	f7ff ff8b 	bl	8000652 <hex_str>

      while (q - p < 10) {
 800073c:	e011      	b.n	8000762 <printf+0x92>
        __msg[q++] = hex[q - p];
 800073e:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 8000742:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8000746:	1ad2      	subs	r2, r2, r3
 8000748:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 800074c:	1c59      	adds	r1, r3, #1
 800074e:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 8000752:	3290      	adds	r2, #144	@ 0x90
 8000754:	443a      	add	r2, r7
 8000756:	f812 2c24 	ldrb.w	r2, [r2, #-36]
 800075a:	3390      	adds	r3, #144	@ 0x90
 800075c:	443b      	add	r3, r7
 800075e:	f803 2c88 	strb.w	r2, [r3, #-136]
      while (q - p < 10) {
 8000762:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 8000766:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 800076a:	1ad3      	subs	r3, r2, r3
 800076c:	2b09      	cmp	r3, #9
 800076e:	dde6      	ble.n	800073e <printf+0x6e>
      }
      p++;
 8000770:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8000774:	3301      	adds	r3, #1
 8000776:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
      single_sub = true;
 800077a:	2301      	movs	r3, #1
 800077c:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83
 8000780:	e011      	b.n	80007a6 <printf+0xd6>
    } else
      __msg[q++] = msg[p++];
 8000782:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8000786:	1c5a      	adds	r2, r3, #1
 8000788:	f8c7 2088 	str.w	r2, [r7, #136]	@ 0x88
 800078c:	461a      	mov	r2, r3
 800078e:	687b      	ldr	r3, [r7, #4]
 8000790:	441a      	add	r2, r3
 8000792:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 8000796:	1c59      	adds	r1, r3, #1
 8000798:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 800079c:	7812      	ldrb	r2, [r2, #0]
 800079e:	3390      	adds	r3, #144	@ 0x90
 80007a0:	443b      	add	r3, r7
 80007a2:	f803 2c88 	strb.w	r2, [r3, #-136]
  for (; i < msg_size; i++) {
 80007a6:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 80007aa:	3301      	adds	r3, #1
 80007ac:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
 80007b0:	f8d7 208c 	ldr.w	r2, [r7, #140]	@ 0x8c
 80007b4:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 80007b6:	429a      	cmp	r2, r3
 80007b8:	d3ac      	bcc.n	8000714 <printf+0x44>
  }
  __msg[q] = '\0';
 80007ba:	f107 0208 	add.w	r2, r7, #8
 80007be:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 80007c2:	4413      	add	r3, r2
 80007c4:	2200      	movs	r2, #0
 80007c6:	701a      	strb	r2, [r3, #0]
  __usart1_print(__msg, _strlen(__msg));
 80007c8:	f107 0308 	add.w	r3, r7, #8
 80007cc:	4618      	mov	r0, r3
 80007ce:	f7ff ff29 	bl	8000624 <_strlen>
 80007d2:	4602      	mov	r2, r0
 80007d4:	f107 0308 	add.w	r3, r7, #8
 80007d8:	4611      	mov	r1, r2
 80007da:	4618      	mov	r0, r3
 80007dc:	f000 fa72 	bl	8000cc4 <__usart1_print>
}
 80007e0:	3790      	adds	r7, #144	@ 0x90
 80007e2:	46bd      	mov	sp, r7
 80007e4:	bd80      	pop	{r7, pc}
 80007e6:	bf00      	nop
 80007e8:	0800103c 	.word	0x0800103c

080007ec <syscall__printf>:

void syscall__printf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 80007ec:	b580      	push	{r7, lr}
 80007ee:	b084      	sub	sp, #16
 80007f0:	af00      	add	r7, sp, #0
 80007f2:	60f8      	str	r0, [r7, #12]
 80007f4:	60b9      	str	r1, [r7, #8]
 80007f6:	607a      	str	r2, [r7, #4]
 80007f8:	603b      	str	r3, [r7, #0]
  semaphore_lock(&sem_usart1);
 80007fa:	4807      	ldr	r0, [pc, #28]	@ (8000818 <syscall__printf+0x2c>)
 80007fc:	f7ff fe6a 	bl	80004d4 <semaphore_lock>
  printf((const char *)a, b);
 8000800:	68fb      	ldr	r3, [r7, #12]
 8000802:	68b9      	ldr	r1, [r7, #8]
 8000804:	4618      	mov	r0, r3
 8000806:	f7ff ff63 	bl	80006d0 <printf>
  semaphore_unlock(&sem_usart1);
 800080a:	4803      	ldr	r0, [pc, #12]	@ (8000818 <syscall__printf+0x2c>)
 800080c:	f7ff fe8c 	bl	8000528 <semaphore_unlock>
}
 8000810:	bf00      	nop
 8000812:	3710      	adds	r7, #16
 8000814:	46bd      	mov	sp, r7
 8000816:	bd80      	pop	{r7, pc}
 8000818:	2000002c 	.word	0x2000002c

0800081c <syscall__scanf>:

void syscall__scanf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 800081c:	b480      	push	{r7}
 800081e:	b085      	sub	sp, #20
 8000820:	af00      	add	r7, sp, #0
 8000822:	60f8      	str	r0, [r7, #12]
 8000824:	60b9      	str	r1, [r7, #8]
 8000826:	607a      	str	r2, [r7, #4]
 8000828:	603b      	str	r3, [r7, #0]

  while (1)
 800082a:	e7fe      	b.n	800082a <syscall__scanf+0xe>

0800082c <syscall__process_exit>:
    ;
}

void syscall__process_exit (uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 800082c:	b580      	push	{r7, lr}
 800082e:	b084      	sub	sp, #16
 8000830:	af00      	add	r7, sp, #0
 8000832:	60f8      	str	r0, [r7, #12]
 8000834:	60b9      	str	r1, [r7, #8]
 8000836:	607a      	str	r2, [r7, #4]
 8000838:	603b      	str	r3, [r7, #0]
  // ignore  all the parameters
  process_exit ();
 800083a:	f000 f823 	bl	8000884 <process_exit>
}
 800083e:	bf00      	nop
 8000840:	3710      	adds	r7, #16
 8000842:	46bd      	mov	sp, r7
 8000844:	bd80      	pop	{r7, pc}
 8000846:	bf00      	nop

08000848 <__NVIC_SetPendingIRQ>:
{
 8000848:	b480      	push	{r7}
 800084a:	b083      	sub	sp, #12
 800084c:	af00      	add	r7, sp, #0
 800084e:	4603      	mov	r3, r0
 8000850:	71fb      	strb	r3, [r7, #7]
  if ((int32_t)(IRQn) >= 0)
 8000852:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000856:	2b00      	cmp	r3, #0
 8000858:	db0c      	blt.n	8000874 <__NVIC_SetPendingIRQ+0x2c>
    NVIC->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
 800085a:	79fb      	ldrb	r3, [r7, #7]
 800085c:	f003 021f 	and.w	r2, r3, #31
 8000860:	4907      	ldr	r1, [pc, #28]	@ (8000880 <__NVIC_SetPendingIRQ+0x38>)
 8000862:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8000866:	095b      	lsrs	r3, r3, #5
 8000868:	2001      	movs	r0, #1
 800086a:	fa00 f202 	lsl.w	r2, r0, r2
 800086e:	3340      	adds	r3, #64	@ 0x40
 8000870:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
}
 8000874:	bf00      	nop
 8000876:	370c      	adds	r7, #12
 8000878:	46bd      	mov	sp, r7
 800087a:	bc80      	pop	{r7}
 800087c:	4770      	bx	lr
 800087e:	bf00      	nop
 8000880:	e000e100 	.word	0xe000e100

08000884 <process_exit>:
void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind);
void launch_process (void);


// if any of the process returns from mainx funcktion, this function wwill be called
void process_exit (void) {
 8000884:	b580      	push	{r7, lr}
 8000886:	b082      	sub	sp, #8
 8000888:	af00      	add	r7, sp, #0

  // i dont know why i was getting hardfault when using <*(user_process_t **) RUNNING_PROCESS_AD> T_T 
  // got it .. should have used () to enclosed the constant in define.h file !!!
  user_process_t *process = *(user_process_t **)(RUNNING_PROCESS_AD);
 800088a:	4b0b      	ldr	r3, [pc, #44]	@ (80008b8 <process_exit+0x34>)
 800088c:	681b      	ldr	r3, [r3, #0]
 800088e:	607b      	str	r3, [r7, #4]
  uint32_t process_id = process->process_id;
 8000890:	687b      	ldr	r3, [r7, #4]
 8000892:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8000894:	603b      	str	r3, [r7, #0]
  printf ("process with process id <%d> is terminated \n\r",
 8000896:	463b      	mov	r3, r7
 8000898:	4619      	mov	r1, r3
 800089a:	4808      	ldr	r0, [pc, #32]	@ (80008bc <process_exit+0x38>)
 800089c:	f7ff ff18 	bl	80006d0 <printf>
            (uint32_t)(&process_id));
  // remove the process from the queue , call context switching and return
  
  // suspend the process
  process -> state = SUSPEND_STATE;
 80008a0:	687b      	ldr	r3, [r7, #4]
 80008a2:	2202      	movs	r2, #2
 80008a4:	62da      	str	r2, [r3, #44]	@ 0x2c
 
  // set the pendsv (to trigger context switching)
  NVIC_SetPendingIRQ (PendSV_IRQn);
 80008a6:	f06f 0001 	mvn.w	r0, #1
 80008aa:	f7ff ffcd 	bl	8000848 <__NVIC_SetPendingIRQ>
}
 80008ae:	bf00      	nop
 80008b0:	3708      	adds	r7, #8
 80008b2:	46bd      	mov	sp, r7
 80008b4:	bd80      	pop	{r7, pc}
 80008b6:	bf00      	nop
 80008b8:	20016004 	.word	0x20016004
 80008bc:	0800105c 	.word	0x0800105c

080008c0 <main>:

int main() {
 80008c0:	b580      	push	{r7, lr}
 80008c2:	b086      	sub	sp, #24
 80008c4:	af00      	add	r7, sp, #0

    SCB->SHP[10] = 0xff;    // set the PendSV to be the lowest priority...
 80008c6:	4b54      	ldr	r3, [pc, #336]	@ (8000a18 <main+0x158>)
 80008c8:	22ff      	movs	r2, #255	@ 0xff
 80008ca:	f883 2022 	strb.w	r2, [r3, #34]	@ 0x22

    /* some init code */
    __usart1_init ();
 80008ce:	f000 f9b7 	bl	8000c40 <__usart1_init>
    queue_init (&ready_queue);
 80008d2:	4852      	ldr	r0, [pc, #328]	@ (8000a1c <main+0x15c>)
 80008d4:	f7ff fd02 	bl	80002dc <queue_init>
    semaphore_init (&sem_usart1, 1);
 80008d8:	2101      	movs	r1, #1
 80008da:	4851      	ldr	r0, [pc, #324]	@ (8000a20 <main+0x160>)
 80008dc:	f7ff fde8 	bl	80004b0 <semaphore_init>

    if (process_count < 1 || process_count > MAX_PROCESS_NUM){
 80008e0:	4b50      	ldr	r3, [pc, #320]	@ (8000a24 <main+0x164>)
 80008e2:	781b      	ldrb	r3, [r3, #0]
 80008e4:	2b00      	cmp	r3, #0
 80008e6:	d003      	beq.n	80008f0 <main+0x30>
 80008e8:	4b4e      	ldr	r3, [pc, #312]	@ (8000a24 <main+0x164>)
 80008ea:	781b      	ldrb	r3, [r3, #0]
 80008ec:	2b0f      	cmp	r3, #15
 80008ee:	d904      	bls.n	80008fa <main+0x3a>
        printf ("ERROR in the number of process ....\n\r", 0x0);
 80008f0:	2100      	movs	r1, #0
 80008f2:	484d      	ldr	r0, [pc, #308]	@ (8000a28 <main+0x168>)
 80008f4:	f7ff feec 	bl	80006d0 <printf>
        while (1);
 80008f8:	e7fe      	b.n	80008f8 <main+0x38>
    }

    /******************** fault handler init ***************************/
    
    // enable faults (without this any fault = hardfault)
    SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;
 80008fa:	4b47      	ldr	r3, [pc, #284]	@ (8000a18 <main+0x158>)
 80008fc:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80008fe:	4a46      	ldr	r2, [pc, #280]	@ (8000a18 <main+0x158>)
 8000900:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
 8000904:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;
 8000906:	4b44      	ldr	r3, [pc, #272]	@ (8000a18 <main+0x158>)
 8000908:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 800090a:	4a43      	ldr	r2, [pc, #268]	@ (8000a18 <main+0x158>)
 800090c:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
 8000910:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;
 8000912:	4b41      	ldr	r3, [pc, #260]	@ (8000a18 <main+0x158>)
 8000914:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000916:	4a40      	ldr	r2, [pc, #256]	@ (8000a18 <main+0x158>)
 8000918:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 800091c:	6253      	str	r3, [r2, #36]	@ 0x24



    /* init syscall table */
    Syscall_Table[0] =  syscall__printf;
 800091e:	4b43      	ldr	r3, [pc, #268]	@ (8000a2c <main+0x16c>)
 8000920:	4a43      	ldr	r2, [pc, #268]	@ (8000a30 <main+0x170>)
 8000922:	601a      	str	r2, [r3, #0]
    Syscall_Table[1] =  syscall__scanf;
 8000924:	4b41      	ldr	r3, [pc, #260]	@ (8000a2c <main+0x16c>)
 8000926:	4a43      	ldr	r2, [pc, #268]	@ (8000a34 <main+0x174>)
 8000928:	605a      	str	r2, [r3, #4]
    Syscall_Table[2] =  syscall__process_exit;
 800092a:	4b40      	ldr	r3, [pc, #256]	@ (8000a2c <main+0x16c>)
 800092c:	4a42      	ldr	r2, [pc, #264]	@ (8000a38 <main+0x178>)
 800092e:	609a      	str	r2, [r3, #8]

    *(uint32_t *)(SYSCALL_TABLE_AD) = (uint32_t)(Syscall_Table);
 8000930:	4b42      	ldr	r3, [pc, #264]	@ (8000a3c <main+0x17c>)
 8000932:	4a3e      	ldr	r2, [pc, #248]	@ (8000a2c <main+0x16c>)
 8000934:	601a      	str	r2, [r3, #0]
    
    uint32_t psp_val = USER_STACK_INIT;
 8000936:	4b42      	ldr	r3, [pc, #264]	@ (8000a40 <main+0x180>)
 8000938:	617b      	str	r3, [r7, #20]
    uint32_t msp_val = KERNEL_STACK_INIT;
 800093a:	4b42      	ldr	r3, [pc, #264]	@ (8000a44 <main+0x184>)
 800093c:	613b      	str	r3, [r7, #16]
    uint32_t user_stack_size = USER_STACK_SIZE / process_count;
 800093e:	4b39      	ldr	r3, [pc, #228]	@ (8000a24 <main+0x164>)
 8000940:	781b      	ldrb	r3, [r3, #0]
 8000942:	461a      	mov	r2, r3
 8000944:	f44f 4300 	mov.w	r3, #32768	@ 0x8000
 8000948:	fb93 f3f2 	sdiv	r3, r3, r2
 800094c:	60bb      	str	r3, [r7, #8]
    uint32_t kernel_stack_size = KERNEL_STACK_SIZE / process_count;
 800094e:	4b35      	ldr	r3, [pc, #212]	@ (8000a24 <main+0x164>)
 8000950:	781b      	ldrb	r3, [r3, #0]
 8000952:	461a      	mov	r2, r3
 8000954:	f44f 43c0 	mov.w	r3, #24576	@ 0x6000
 8000958:	fb93 f3f2 	sdiv	r3, r3, r2
 800095c:	607b      	str	r3, [r7, #4]

    /* fill the pcs */
    process_pc [0] = main1;
 800095e:	4b3a      	ldr	r3, [pc, #232]	@ (8000a48 <main+0x188>)
 8000960:	4a3a      	ldr	r2, [pc, #232]	@ (8000a4c <main+0x18c>)
 8000962:	601a      	str	r2, [r3, #0]
    process_pc [1] = main2;
 8000964:	4b38      	ldr	r3, [pc, #224]	@ (8000a48 <main+0x188>)
 8000966:	4a3a      	ldr	r2, [pc, #232]	@ (8000a50 <main+0x190>)
 8000968:	605a      	str	r2, [r3, #4]
    process_pc [2] = main3;
 800096a:	4b37      	ldr	r3, [pc, #220]	@ (8000a48 <main+0x188>)
 800096c:	4a39      	ldr	r2, [pc, #228]	@ (8000a54 <main+0x194>)
 800096e:	609a      	str	r2, [r3, #8]
    process_pc [3] = main4;
 8000970:	4b35      	ldr	r3, [pc, #212]	@ (8000a48 <main+0x188>)
 8000972:	4a39      	ldr	r2, [pc, #228]	@ (8000a58 <main+0x198>)
 8000974:	60da      	str	r2, [r3, #12]
    process_pc [4] = main5;
 8000976:	4b34      	ldr	r3, [pc, #208]	@ (8000a48 <main+0x188>)
 8000978:	4a38      	ldr	r2, [pc, #224]	@ (8000a5c <main+0x19c>)
 800097a:	611a      	str	r2, [r3, #16]
    process_pc [5] = main6;
 800097c:	4b32      	ldr	r3, [pc, #200]	@ (8000a48 <main+0x188>)
 800097e:	4a38      	ldr	r2, [pc, #224]	@ (8000a60 <main+0x1a0>)
 8000980:	615a      	str	r2, [r3, #20]
    process_pc [6] = main7;
 8000982:	4b31      	ldr	r3, [pc, #196]	@ (8000a48 <main+0x188>)
 8000984:	4a37      	ldr	r2, [pc, #220]	@ (8000a64 <main+0x1a4>)
 8000986:	619a      	str	r2, [r3, #24]
    process_pc [7] = main8;
 8000988:	4b2f      	ldr	r3, [pc, #188]	@ (8000a48 <main+0x188>)
 800098a:	4a37      	ldr	r2, [pc, #220]	@ (8000a68 <main+0x1a8>)
 800098c:	61da      	str	r2, [r3, #28]
    process_pc [8] = main9;
 800098e:	4b2e      	ldr	r3, [pc, #184]	@ (8000a48 <main+0x188>)
 8000990:	4a36      	ldr	r2, [pc, #216]	@ (8000a6c <main+0x1ac>)
 8000992:	621a      	str	r2, [r3, #32]
    process_pc [9] = main10;
 8000994:	4b2c      	ldr	r3, [pc, #176]	@ (8000a48 <main+0x188>)
 8000996:	4a36      	ldr	r2, [pc, #216]	@ (8000a70 <main+0x1b0>)
 8000998:	625a      	str	r2, [r3, #36]	@ 0x24
    process_pc [10] = main11;
 800099a:	4b2b      	ldr	r3, [pc, #172]	@ (8000a48 <main+0x188>)
 800099c:	4a35      	ldr	r2, [pc, #212]	@ (8000a74 <main+0x1b4>)
 800099e:	629a      	str	r2, [r3, #40]	@ 0x28
    process_pc [11] = main12;
 80009a0:	4b29      	ldr	r3, [pc, #164]	@ (8000a48 <main+0x188>)
 80009a2:	4a35      	ldr	r2, [pc, #212]	@ (8000a78 <main+0x1b8>)
 80009a4:	62da      	str	r2, [r3, #44]	@ 0x2c
    process_pc [12] = main13;
 80009a6:	4b28      	ldr	r3, [pc, #160]	@ (8000a48 <main+0x188>)
 80009a8:	4a34      	ldr	r2, [pc, #208]	@ (8000a7c <main+0x1bc>)
 80009aa:	631a      	str	r2, [r3, #48]	@ 0x30
    process_pc [13] = main14;
 80009ac:	4b26      	ldr	r3, [pc, #152]	@ (8000a48 <main+0x188>)
 80009ae:	4a34      	ldr	r2, [pc, #208]	@ (8000a80 <main+0x1c0>)
 80009b0:	635a      	str	r2, [r3, #52]	@ 0x34
    process_pc [14] = main15;
 80009b2:	4b25      	ldr	r3, [pc, #148]	@ (8000a48 <main+0x188>)
 80009b4:	4a33      	ldr	r2, [pc, #204]	@ (8000a84 <main+0x1c4>)
 80009b6:	639a      	str	r2, [r3, #56]	@ 0x38

    for (uint8_t i=0; i<process_count; i++){
 80009b8:	2300      	movs	r3, #0
 80009ba:	73fb      	strb	r3, [r7, #15]
 80009bc:	e01d      	b.n	80009fa <main+0x13a>
        make_process (&process[i], psp_val, msp_val, i);
 80009be:	7bfb      	ldrb	r3, [r7, #15]
 80009c0:	2234      	movs	r2, #52	@ 0x34
 80009c2:	fb02 f303 	mul.w	r3, r2, r3
 80009c6:	4a30      	ldr	r2, [pc, #192]	@ (8000a88 <main+0x1c8>)
 80009c8:	1898      	adds	r0, r3, r2
 80009ca:	7bfb      	ldrb	r3, [r7, #15]
 80009cc:	693a      	ldr	r2, [r7, #16]
 80009ce:	6979      	ldr	r1, [r7, #20]
 80009d0:	f000 f85e 	bl	8000a90 <make_process>
        psp_val -= user_stack_size;
 80009d4:	697a      	ldr	r2, [r7, #20]
 80009d6:	68bb      	ldr	r3, [r7, #8]
 80009d8:	1ad3      	subs	r3, r2, r3
 80009da:	617b      	str	r3, [r7, #20]
        msp_val -= kernel_stack_size;
 80009dc:	693a      	ldr	r2, [r7, #16]
 80009de:	687b      	ldr	r3, [r7, #4]
 80009e0:	1ad3      	subs	r3, r2, r3
 80009e2:	613b      	str	r3, [r7, #16]
        /* make stack pointers word aligned */
        psp_val &= ~(3);
 80009e4:	697b      	ldr	r3, [r7, #20]
 80009e6:	f023 0303 	bic.w	r3, r3, #3
 80009ea:	617b      	str	r3, [r7, #20]
        msp_val &= ~(3);
 80009ec:	693b      	ldr	r3, [r7, #16]
 80009ee:	f023 0303 	bic.w	r3, r3, #3
 80009f2:	613b      	str	r3, [r7, #16]
    for (uint8_t i=0; i<process_count; i++){
 80009f4:	7bfb      	ldrb	r3, [r7, #15]
 80009f6:	3301      	adds	r3, #1
 80009f8:	73fb      	strb	r3, [r7, #15]
 80009fa:	4b0a      	ldr	r3, [pc, #40]	@ (8000a24 <main+0x164>)
 80009fc:	781b      	ldrb	r3, [r3, #0]
 80009fe:	7bfa      	ldrb	r2, [r7, #15]
 8000a00:	429a      	cmp	r2, r3
 8000a02:	d3dc      	bcc.n	80009be <main+0xfe>
 
    /* accessing illegal address in kernel code -> Kernel Panic*/
//    *(uint32_t*) (0xffffffff) = 5;

    /*impose user restriction*/
    mpu_setup ();
 8000a04:	f7ff fc36 	bl	8000274 <mpu_setup>

    /* start the processes */
    launch_process();
 8000a08:	f000 f8be 	bl	8000b88 <launch_process>
    // TODO
    // transfer the control to this section from user space if there is no process to be run


    // if all the processes are done
    printf ("all the processes are done executing \n\r", 0x0);
 8000a0c:	2100      	movs	r1, #0
 8000a0e:	481f      	ldr	r0, [pc, #124]	@ (8000a8c <main+0x1cc>)
 8000a10:	f7ff fe5e 	bl	80006d0 <printf>
    while (1);
 8000a14:	e7fe      	b.n	8000a14 <main+0x154>
 8000a16:	bf00      	nop
 8000a18:	e000ed00 	.word	0xe000ed00
 8000a1c:	200003f4 	.word	0x200003f4
 8000a20:	2000002c 	.word	0x2000002c
 8000a24:	20000000 	.word	0x20000000
 8000a28:	0800108c 	.word	0x0800108c
 8000a2c:	20000004 	.word	0x20000004
 8000a30:	080007ed 	.word	0x080007ed
 8000a34:	0800081d 	.word	0x0800081d
 8000a38:	0800082d 	.word	0x0800082d
 8000a3c:	2001600c 	.word	0x2001600c
 8000a40:	20010000 	.word	0x20010000
 8000a44:	20016000 	.word	0x20016000
 8000a48:	200003b8 	.word	0x200003b8
 8000a4c:	08010001 	.word	0x08010001
 8000a50:	0801002d 	.word	0x0801002d
 8000a54:	08010269 	.word	0x08010269
 8000a58:	08010059 	.word	0x08010059
 8000a5c:	08010085 	.word	0x08010085
 8000a60:	080100b1 	.word	0x080100b1
 8000a64:	080100dd 	.word	0x080100dd
 8000a68:	08010109 	.word	0x08010109
 8000a6c:	08010135 	.word	0x08010135
 8000a70:	08010161 	.word	0x08010161
 8000a74:	0801018d 	.word	0x0801018d
 8000a78:	080101b9 	.word	0x080101b9
 8000a7c:	080101e5 	.word	0x080101e5
 8000a80:	08010211 	.word	0x08010211
 8000a84:	0801023d 	.word	0x0801023d
 8000a88:	200000ac 	.word	0x200000ac
 8000a8c:	080010b4 	.word	0x080010b4

08000a90 <make_process>:
}

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t process_id){
 8000a90:	b480      	push	{r7}
 8000a92:	b087      	sub	sp, #28
 8000a94:	af00      	add	r7, sp, #0
 8000a96:	60f8      	str	r0, [r7, #12]
 8000a98:	60b9      	str	r1, [r7, #8]
 8000a9a:	607a      	str	r2, [r7, #4]
 8000a9c:	70fb      	strb	r3, [r7, #3]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;
 8000a9e:	68fb      	ldr	r3, [r7, #12]
 8000aa0:	2200      	movs	r2, #0
 8000aa2:	61da      	str	r2, [r3, #28]
 8000aa4:	68fb      	ldr	r3, [r7, #12]
 8000aa6:	69da      	ldr	r2, [r3, #28]
 8000aa8:	68fb      	ldr	r3, [r7, #12]
 8000aaa:	619a      	str	r2, [r3, #24]
 8000aac:	68fb      	ldr	r3, [r7, #12]
 8000aae:	699a      	ldr	r2, [r3, #24]
 8000ab0:	68fb      	ldr	r3, [r7, #12]
 8000ab2:	615a      	str	r2, [r3, #20]
 8000ab4:	68fb      	ldr	r3, [r7, #12]
 8000ab6:	695a      	ldr	r2, [r3, #20]
 8000ab8:	68fb      	ldr	r3, [r7, #12]
 8000aba:	611a      	str	r2, [r3, #16]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
 8000abc:	68fb      	ldr	r3, [r7, #12]
 8000abe:	691a      	ldr	r2, [r3, #16]
 8000ac0:	68fb      	ldr	r3, [r7, #12]
 8000ac2:	60da      	str	r2, [r3, #12]
 8000ac4:	68fb      	ldr	r3, [r7, #12]
 8000ac6:	68da      	ldr	r2, [r3, #12]
 8000ac8:	68fb      	ldr	r3, [r7, #12]
 8000aca:	609a      	str	r2, [r3, #8]
 8000acc:	68fb      	ldr	r3, [r7, #12]
 8000ace:	689a      	ldr	r2, [r3, #8]
 8000ad0:	68fb      	ldr	r3, [r7, #12]
 8000ad2:	605a      	str	r2, [r3, #4]
 8000ad4:	68fb      	ldr	r3, [r7, #12]
 8000ad6:	685a      	ldr	r2, [r3, #4]
 8000ad8:	68fb      	ldr	r3, [r7, #12]
 8000ada:	601a      	str	r2, [r3, #0]

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;
 8000adc:	68fb      	ldr	r3, [r7, #12]
 8000ade:	f06f 0202 	mvn.w	r2, #2
 8000ae2:	629a      	str	r2, [r3, #40]	@ 0x28



    //process->pc = (uint32_t) fun;
    process->psp = psp;
 8000ae4:	68fb      	ldr	r3, [r7, #12]
 8000ae6:	68ba      	ldr	r2, [r7, #8]
 8000ae8:	621a      	str	r2, [r3, #32]
    process->msp = msp;
 8000aea:	68fb      	ldr	r3, [r7, #12]
 8000aec:	687a      	ldr	r2, [r7, #4]
 8000aee:	625a      	str	r2, [r3, #36]	@ 0x24
    process->psp -= 8*4;        // start from 8 word below the base of the stack
 8000af0:	68fb      	ldr	r3, [r7, #12]
 8000af2:	6a1b      	ldr	r3, [r3, #32]
 8000af4:	f1a3 0220 	sub.w	r2, r3, #32
 8000af8:	68fb      	ldr	r3, [r7, #12]
 8000afa:	621a      	str	r2, [r3, #32]
    represent thumb state 
    */

    // put the lr value in stack if you want to be able to return from the user process
  
    for (int i=0; i<8; i++){
 8000afc:	2300      	movs	r3, #0
 8000afe:	617b      	str	r3, [r7, #20]
 8000b00:	e032      	b.n	8000b68 <make_process+0xd8>
        if (i == 5) {
 8000b02:	697b      	ldr	r3, [r7, #20]
 8000b04:	2b05      	cmp	r3, #5
 8000b06:	d108      	bne.n	8000b1a <make_process+0x8a>
          *(uint32_t *)(process->psp+i*4) = (uint32_t ) user_process_exit;
 8000b08:	68fb      	ldr	r3, [r7, #12]
 8000b0a:	6a1b      	ldr	r3, [r3, #32]
 8000b0c:	697a      	ldr	r2, [r7, #20]
 8000b0e:	0092      	lsls	r2, r2, #2
 8000b10:	4413      	add	r3, r2
 8000b12:	461a      	mov	r2, r3
 8000b14:	4b1a      	ldr	r3, [pc, #104]	@ (8000b80 <make_process+0xf0>)
 8000b16:	6013      	str	r3, [r2, #0]
 8000b18:	e023      	b.n	8000b62 <make_process+0xd2>
        }
        else if (i == 6)
 8000b1a:	697b      	ldr	r3, [r7, #20]
 8000b1c:	2b06      	cmp	r3, #6
 8000b1e:	d10b      	bne.n	8000b38 <make_process+0xa8>
            *(uint32_t *)(process->psp+i*4) =
                    (uint32_t) process_pc [process_id];
 8000b20:	78fb      	ldrb	r3, [r7, #3]
 8000b22:	4a18      	ldr	r2, [pc, #96]	@ (8000b84 <make_process+0xf4>)
 8000b24:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
            *(uint32_t *)(process->psp+i*4) =
 8000b28:	68fb      	ldr	r3, [r7, #12]
 8000b2a:	6a1b      	ldr	r3, [r3, #32]
 8000b2c:	697a      	ldr	r2, [r7, #20]
 8000b2e:	0092      	lsls	r2, r2, #2
 8000b30:	4413      	add	r3, r2
                    (uint32_t) process_pc [process_id];
 8000b32:	460a      	mov	r2, r1
            *(uint32_t *)(process->psp+i*4) =
 8000b34:	601a      	str	r2, [r3, #0]
 8000b36:	e014      	b.n	8000b62 <make_process+0xd2>
        else if (i == 7)
 8000b38:	697b      	ldr	r3, [r7, #20]
 8000b3a:	2b07      	cmp	r3, #7
 8000b3c:	d109      	bne.n	8000b52 <make_process+0xc2>
            *(uint32_t *)(process->psp+i*4) = 0x01000000;
 8000b3e:	68fb      	ldr	r3, [r7, #12]
 8000b40:	6a1b      	ldr	r3, [r3, #32]
 8000b42:	697a      	ldr	r2, [r7, #20]
 8000b44:	0092      	lsls	r2, r2, #2
 8000b46:	4413      	add	r3, r2
 8000b48:	461a      	mov	r2, r3
 8000b4a:	f04f 7380 	mov.w	r3, #16777216	@ 0x1000000
 8000b4e:	6013      	str	r3, [r2, #0]
 8000b50:	e007      	b.n	8000b62 <make_process+0xd2>
        else 
            *(uint32_t *)(process->psp+i*4) = 0x0;
 8000b52:	68fb      	ldr	r3, [r7, #12]
 8000b54:	6a1b      	ldr	r3, [r3, #32]
 8000b56:	697a      	ldr	r2, [r7, #20]
 8000b58:	0092      	lsls	r2, r2, #2
 8000b5a:	4413      	add	r3, r2
 8000b5c:	461a      	mov	r2, r3
 8000b5e:	2300      	movs	r3, #0
 8000b60:	6013      	str	r3, [r2, #0]
    for (int i=0; i<8; i++){
 8000b62:	697b      	ldr	r3, [r7, #20]
 8000b64:	3301      	adds	r3, #1
 8000b66:	617b      	str	r3, [r7, #20]
 8000b68:	697b      	ldr	r3, [r7, #20]
 8000b6a:	2b07      	cmp	r3, #7
 8000b6c:	ddc9      	ble.n	8000b02 <make_process+0x72>
    }
    
    process-> process_id = process_id;
 8000b6e:	78fa      	ldrb	r2, [r7, #3]
 8000b70:	68fb      	ldr	r3, [r7, #12]
 8000b72:	631a      	str	r2, [r3, #48]	@ 0x30

}
 8000b74:	bf00      	nop
 8000b76:	371c      	adds	r7, #28
 8000b78:	46bd      	mov	sp, r7
 8000b7a:	bc80      	pop	{r7}
 8000b7c:	4770      	bx	lr
 8000b7e:	bf00      	nop
 8000b80:	080102b9 	.word	0x080102b9
 8000b84:	200003b8 	.word	0x200003b8

08000b88 <launch_process>:

void  launch_process (void){
 8000b88:	b580      	push	{r7, lr}
 8000b8a:	b082      	sub	sp, #8
 8000b8c:	af00      	add	r7, sp, #0
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process[0].psp);
 8000b8e:	4b27      	ldr	r3, [pc, #156]	@ (8000c2c <launch_process+0xa4>)
 8000b90:	6a1b      	ldr	r3, [r3, #32]
 8000b92:	4618      	mov	r0, r3
 8000b94:	f000 f8c8 	bl	8000d28 <__asm__set_psp>
    __asm__set_msp (process[0].msp);
 8000b98:	4b24      	ldr	r3, [pc, #144]	@ (8000c2c <launch_process+0xa4>)
 8000b9a:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000b9c:	4618      	mov	r0, r3
 8000b9e:	f000 f8c6 	bl	8000d2e <__asm__set_msp>
       

    SysTick->LOAD = 16000 - 1;
 8000ba2:	4b23      	ldr	r3, [pc, #140]	@ (8000c30 <launch_process+0xa8>)
 8000ba4:	f643 627f 	movw	r2, #15999	@ 0x3e7f
 8000ba8:	605a      	str	r2, [r3, #4]
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
 8000baa:	4b21      	ldr	r3, [pc, #132]	@ (8000c30 <launch_process+0xa8>)
 8000bac:	681b      	ldr	r3, [r3, #0]
 8000bae:	4a20      	ldr	r2, [pc, #128]	@ (8000c30 <launch_process+0xa8>)
 8000bb0:	f043 0307 	orr.w	r3, r3, #7
 8000bb4:	6013      	str	r3, [r2, #0]
            | SysTick_CTRL_ENABLE_Msk);

    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process[0]);
 8000bb6:	4b1f      	ldr	r3, [pc, #124]	@ (8000c34 <launch_process+0xac>)
 8000bb8:	4a1c      	ldr	r2, [pc, #112]	@ (8000c2c <launch_process+0xa4>)
 8000bba:	601a      	str	r2, [r3, #0]

    /* initially all the processes will be placed in the ready queue except the first one (entry point) */
    for (uint8_t i=1; i<process_count; i++){
 8000bbc:	2301      	movs	r3, #1
 8000bbe:	71fb      	strb	r3, [r7, #7]
 8000bc0:	e012      	b.n	8000be8 <launch_process+0x60>
        int status = queue_push (&ready_queue, &process[i]);
 8000bc2:	79fb      	ldrb	r3, [r7, #7]
 8000bc4:	2234      	movs	r2, #52	@ 0x34
 8000bc6:	fb02 f303 	mul.w	r3, r2, r3
 8000bca:	4a18      	ldr	r2, [pc, #96]	@ (8000c2c <launch_process+0xa4>)
 8000bcc:	4413      	add	r3, r2
 8000bce:	4619      	mov	r1, r3
 8000bd0:	4819      	ldr	r0, [pc, #100]	@ (8000c38 <launch_process+0xb0>)
 8000bd2:	f7ff fb98 	bl	8000306 <queue_push>
 8000bd6:	4603      	mov	r3, r0
 8000bd8:	603b      	str	r3, [r7, #0]
        if (status){
 8000bda:	683b      	ldr	r3, [r7, #0]
 8000bdc:	2b00      	cmp	r3, #0
 8000bde:	d000      	beq.n	8000be2 <launch_process+0x5a>
            while (1);
 8000be0:	e7fe      	b.n	8000be0 <launch_process+0x58>
    for (uint8_t i=1; i<process_count; i++){
 8000be2:	79fb      	ldrb	r3, [r7, #7]
 8000be4:	3301      	adds	r3, #1
 8000be6:	71fb      	strb	r3, [r7, #7]
 8000be8:	4b14      	ldr	r3, [pc, #80]	@ (8000c3c <launch_process+0xb4>)
 8000bea:	781b      	ldrb	r3, [r3, #0]
 8000bec:	79fa      	ldrb	r2, [r7, #7]
 8000bee:	429a      	cmp	r2, r3
 8000bf0:	d3e7      	bcc.n	8000bc2 <launch_process+0x3a>
        }
    }

    process[0].state = RUNNING_STATE;
 8000bf2:	4b0e      	ldr	r3, [pc, #56]	@ (8000c2c <launch_process+0xa4>)
 8000bf4:	2201      	movs	r2, #1
 8000bf6:	62da      	str	r2, [r3, #44]	@ 0x2c
    for (uint8_t i=1; i<process_count; i++){
 8000bf8:	2301      	movs	r3, #1
 8000bfa:	71bb      	strb	r3, [r7, #6]
 8000bfc:	e00b      	b.n	8000c16 <launch_process+0x8e>
        process[i].state = READY_STATE;
 8000bfe:	79bb      	ldrb	r3, [r7, #6]
 8000c00:	4a0a      	ldr	r2, [pc, #40]	@ (8000c2c <launch_process+0xa4>)
 8000c02:	2134      	movs	r1, #52	@ 0x34
 8000c04:	fb01 f303 	mul.w	r3, r1, r3
 8000c08:	4413      	add	r3, r2
 8000c0a:	332c      	adds	r3, #44	@ 0x2c
 8000c0c:	2200      	movs	r2, #0
 8000c0e:	601a      	str	r2, [r3, #0]
    for (uint8_t i=1; i<process_count; i++){
 8000c10:	79bb      	ldrb	r3, [r7, #6]
 8000c12:	3301      	adds	r3, #1
 8000c14:	71bb      	strb	r3, [r7, #6]
 8000c16:	4b09      	ldr	r3, [pc, #36]	@ (8000c3c <launch_process+0xb4>)
 8000c18:	781b      	ldrb	r3, [r3, #0]
 8000c1a:	79ba      	ldrb	r2, [r7, #6]
 8000c1c:	429a      	cmp	r2, r3
 8000c1e:	d3ee      	bcc.n	8000bfe <launch_process+0x76>
    }
 
    __asm__launch_main1();
 8000c20:	f00f fb40 	bl	80102a4 <__asm__launch_main1>

}
 8000c24:	bf00      	nop
 8000c26:	3708      	adds	r7, #8
 8000c28:	46bd      	mov	sp, r7
 8000c2a:	bd80      	pop	{r7, pc}
 8000c2c:	200000ac 	.word	0x200000ac
 8000c30:	e000e010 	.word	0xe000e010
 8000c34:	20016004 	.word	0x20016004
 8000c38:	200003f4 	.word	0x200003f4
 8000c3c:	20000000 	.word	0x20000000

08000c40 <__usart1_init>:
#include "core.h"
#include "usart.h"

void __usart1_init(void) {
 8000c40:	b480      	push	{r7}
 8000c42:	af00      	add	r7, sp, #0

  RCC->APB2ENR |= RCC_APB2ENR_USART1EN_Msk;
 8000c44:	4b1c      	ldr	r3, [pc, #112]	@ (8000cb8 <__usart1_init+0x78>)
 8000c46:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 8000c48:	4a1b      	ldr	r2, [pc, #108]	@ (8000cb8 <__usart1_init+0x78>)
 8000c4a:	f043 0310 	orr.w	r3, r3, #16
 8000c4e:	6453      	str	r3, [r2, #68]	@ 0x44
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
 8000c50:	4b19      	ldr	r3, [pc, #100]	@ (8000cb8 <__usart1_init+0x78>)
 8000c52:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8000c54:	4a18      	ldr	r2, [pc, #96]	@ (8000cb8 <__usart1_init+0x78>)
 8000c56:	f043 0301 	orr.w	r3, r3, #1
 8000c5a:	6313      	str	r3, [r2, #48]	@ 0x30
  // alternate function mode
  GPIOA->MODER &= ~((3 << (2 * TX_PIN)) | (3 << (2 * RX_PIN)));
 8000c5c:	4b17      	ldr	r3, [pc, #92]	@ (8000cbc <__usart1_init+0x7c>)
 8000c5e:	681b      	ldr	r3, [r3, #0]
 8000c60:	4a16      	ldr	r2, [pc, #88]	@ (8000cbc <__usart1_init+0x7c>)
 8000c62:	f423 1370 	bic.w	r3, r3, #3932160	@ 0x3c0000
 8000c66:	6013      	str	r3, [r2, #0]
  GPIOA->MODER |= 2 << (2 * TX_PIN) | 2 << (2 * RX_PIN);
 8000c68:	4b14      	ldr	r3, [pc, #80]	@ (8000cbc <__usart1_init+0x7c>)
 8000c6a:	681b      	ldr	r3, [r3, #0]
 8000c6c:	4a13      	ldr	r2, [pc, #76]	@ (8000cbc <__usart1_init+0x7c>)
 8000c6e:	f443 1320 	orr.w	r3, r3, #2621440	@ 0x280000
 8000c72:	6013      	str	r3, [r2, #0]
  // high speed
  GPIOA->OSPEEDR |= (3 << (TX_PIN * 2)) | (3 << (RX_PIN * 2));
 8000c74:	4b11      	ldr	r3, [pc, #68]	@ (8000cbc <__usart1_init+0x7c>)
 8000c76:	689b      	ldr	r3, [r3, #8]
 8000c78:	4a10      	ldr	r2, [pc, #64]	@ (8000cbc <__usart1_init+0x7c>)
 8000c7a:	f443 1370 	orr.w	r3, r3, #3932160	@ 0x3c0000
 8000c7e:	6093      	str	r3, [r2, #8]
  // clear the bits in AFR register
  GPIOA->AFR[1] &= ~((0xf << 4) | (0xf << 8));
 8000c80:	4b0e      	ldr	r3, [pc, #56]	@ (8000cbc <__usart1_init+0x7c>)
 8000c82:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000c84:	4a0d      	ldr	r2, [pc, #52]	@ (8000cbc <__usart1_init+0x7c>)
 8000c86:	f423 637f 	bic.w	r3, r3, #4080	@ 0xff0
 8000c8a:	6253      	str	r3, [r2, #36]	@ 0x24
  // set for af7
  GPIOA->AFR[1] |= (7 << 4) | (7 << 8);
 8000c8c:	4b0b      	ldr	r3, [pc, #44]	@ (8000cbc <__usart1_init+0x7c>)
 8000c8e:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000c90:	4a0a      	ldr	r2, [pc, #40]	@ (8000cbc <__usart1_init+0x7c>)
 8000c92:	f443 63ee 	orr.w	r3, r3, #1904	@ 0x770
 8000c96:	6253      	str	r3, [r2, #36]	@ 0x24

  // enable usart, reciever, transiever
  USART1->CR1 |= USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
 8000c98:	4b09      	ldr	r3, [pc, #36]	@ (8000cc0 <__usart1_init+0x80>)
 8000c9a:	68db      	ldr	r3, [r3, #12]
 8000c9c:	4a08      	ldr	r2, [pc, #32]	@ (8000cc0 <__usart1_init+0x80>)
 8000c9e:	f443 5300 	orr.w	r3, r3, #8192	@ 0x2000
 8000ca2:	f043 030c 	orr.w	r3, r3, #12
 8000ca6:	60d3      	str	r3, [r2, #12]
  // set the baud rate (115200 in this case)
  USART1->BRR = 0x08B;
 8000ca8:	4b05      	ldr	r3, [pc, #20]	@ (8000cc0 <__usart1_init+0x80>)
 8000caa:	228b      	movs	r2, #139	@ 0x8b
 8000cac:	609a      	str	r2, [r3, #8]
}
 8000cae:	bf00      	nop
 8000cb0:	46bd      	mov	sp, r7
 8000cb2:	bc80      	pop	{r7}
 8000cb4:	4770      	bx	lr
 8000cb6:	bf00      	nop
 8000cb8:	40023800 	.word	0x40023800
 8000cbc:	40020000 	.word	0x40020000
 8000cc0:	40011000 	.word	0x40011000

08000cc4 <__usart1_print>:

void __usart1_print(const char *msg, uint32_t size) {
 8000cc4:	b480      	push	{r7}
 8000cc6:	b085      	sub	sp, #20
 8000cc8:	af00      	add	r7, sp, #0
 8000cca:	6078      	str	r0, [r7, #4]
 8000ccc:	6039      	str	r1, [r7, #0]

  // semaphore_lock(&sem_usart1);
  //enterCRITICAL();
  int i = 0;
 8000cce:	2300      	movs	r3, #0
 8000cd0:	60fb      	str	r3, [r7, #12]
  while (i < size && msg[i] != '\0') {
 8000cd2:	e00f      	b.n	8000cf4 <__usart1_print+0x30>
    while (!(USART1->SR & USART_SR_TXE))
 8000cd4:	bf00      	nop
 8000cd6:	4b13      	ldr	r3, [pc, #76]	@ (8000d24 <__usart1_print+0x60>)
 8000cd8:	681b      	ldr	r3, [r3, #0]
 8000cda:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8000cde:	2b00      	cmp	r3, #0
 8000ce0:	d0f9      	beq.n	8000cd6 <__usart1_print+0x12>
      ;
    USART1->DR = msg[i++];
 8000ce2:	68fb      	ldr	r3, [r7, #12]
 8000ce4:	1c5a      	adds	r2, r3, #1
 8000ce6:	60fa      	str	r2, [r7, #12]
 8000ce8:	461a      	mov	r2, r3
 8000cea:	687b      	ldr	r3, [r7, #4]
 8000cec:	4413      	add	r3, r2
 8000cee:	781a      	ldrb	r2, [r3, #0]
 8000cf0:	4b0c      	ldr	r3, [pc, #48]	@ (8000d24 <__usart1_print+0x60>)
 8000cf2:	605a      	str	r2, [r3, #4]
  while (i < size && msg[i] != '\0') {
 8000cf4:	68fb      	ldr	r3, [r7, #12]
 8000cf6:	683a      	ldr	r2, [r7, #0]
 8000cf8:	429a      	cmp	r2, r3
 8000cfa:	d905      	bls.n	8000d08 <__usart1_print+0x44>
 8000cfc:	68fb      	ldr	r3, [r7, #12]
 8000cfe:	687a      	ldr	r2, [r7, #4]
 8000d00:	4413      	add	r3, r2
 8000d02:	781b      	ldrb	r3, [r3, #0]
 8000d04:	2b00      	cmp	r3, #0
 8000d06:	d1e5      	bne.n	8000cd4 <__usart1_print+0x10>
  }
  while (!(USART1->SR & USART_SR_TC)) {
 8000d08:	bf00      	nop
 8000d0a:	4b06      	ldr	r3, [pc, #24]	@ (8000d24 <__usart1_print+0x60>)
 8000d0c:	681b      	ldr	r3, [r3, #0]
 8000d0e:	f003 0340 	and.w	r3, r3, #64	@ 0x40
 8000d12:	2b00      	cmp	r3, #0
 8000d14:	d0f9      	beq.n	8000d0a <__usart1_print+0x46>
  }
  //exitCRITICAL();
  // semaphore_unlock(&sem_usart1);
}
 8000d16:	bf00      	nop
 8000d18:	bf00      	nop
 8000d1a:	3714      	adds	r7, #20
 8000d1c:	46bd      	mov	sp, r7
 8000d1e:	bc80      	pop	{r7}
 8000d20:	4770      	bx	lr
 8000d22:	bf00      	nop
 8000d24:	40011000 	.word	0x40011000

08000d28 <__asm__set_psp>:

.global __asm__set_psp
.type __asm__set_psp, %function 
__asm__set_psp:
    /* r0 contains the argument*/
    msr psp, r0
 8000d28:	f380 8809 	msr	PSP, r0
    bx lr
 8000d2c:	4770      	bx	lr

08000d2e <__asm__set_msp>:

.global __asm__set_msp
.type __asm__set_msp, %function
__asm__set_msp:
    /* r0 contains the argument*/
    msr msp, r0
 8000d2e:	f380 8808 	msr	MSP, r0
    bx lr
 8000d32:	4770      	bx	lr

08000d34 <Reset_Handler>:
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
 8000d34:	f7ff f984 	bl	8000040 <resetHandlerHelper>
    B main
 8000d38:	f7ff bdc2 	b.w	80008c0 <main>

08000d3c <hang>:
hang:
    B .
 8000d3c:	e7fe      	b.n	8000d3c <hang>

08000d3e <Default_Handler>:

.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .
 8000d3e:	e7fe      	b.n	8000d3e <Default_Handler>

08000d40 <NMI_Handler>:

.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .
 8000d40:	e7fe      	b.n	8000d40 <NMI_Handler>

08000d42 <DebugMon_Handler>:

.section .text.DebugMon_Handler
.global DebugMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .
 8000d42:	e7fe      	b.n	8000d42 <DebugMon_Handler>

08000d44 <PendSV_Handler>:
.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    cpsid i
 8000d44:	b672      	cpsid	i

    push {lr}
 8000d46:	b500      	push	{lr}
    bl schedular
 8000d48:	f7ff fc1a 	bl	8000580 <schedular>
    pop {lr}
 8000d4c:	f85d eb04 	ldr.w	lr, [sp], #4

    /************************ start saving reg*********************************/
    ldr r0, =RUNNING_PROCESS
 8000d50:	4813      	ldr	r0, [pc, #76]	@ (8000da0 <PendSV_Handler+0x5c>)
    ldr r1, [r0]            // r1 now contain the struct address
 8000d52:	6801      	ldr	r1, [r0, #0]
    

    stmia r1!, {r4-r11}     // r4->r11 stored in the runnging process struct
 8000d54:	e8a1 0ff0 	stmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}

    mrs r0, psp
 8000d58:	f3ef 8009 	mrs	r0, PSP
    str r0, [r1]
 8000d5c:	6008      	str	r0, [r1, #0]
    add r1, #4
 8000d5e:	f101 0104 	add.w	r1, r1, #4
    
    mrs r0, msp
 8000d62:	f3ef 8008 	mrs	r0, MSP
    str r0, [r1]
 8000d66:	6008      	str	r0, [r1, #0]
    add r1, #4
 8000d68:	f101 0104 	add.w	r1, r1, #4
    
    str lr, [r1]            // important !!! store the exec_return value
 8000d6c:	f8c1 e000 	str.w	lr, [r1]
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
 8000d70:	480c      	ldr	r0, [pc, #48]	@ (8000da4 <PendSV_Handler+0x60>)
    ldr r1, [r0]
 8000d72:	6801      	ldr	r1, [r0, #0]
    ldmia r1!, {r4-r11}
 8000d74:	e8b1 0ff0 	ldmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
   

    /* before setting psp, msp, faultmask, basepri -> mask all interrupt
    so that no interrupt can be fired in the middle of setting important regs*/

    ldr r0, [r1]
 8000d78:	6808      	ldr	r0, [r1, #0]
    msr psp, r0
 8000d7a:	f380 8809 	msr	PSP, r0
    add r1, #4
 8000d7e:	f101 0104 	add.w	r1, r1, #4
    
    ldr r0, [r1]
 8000d82:	6808      	ldr	r0, [r1, #0]
    msr msp, r0
 8000d84:	f380 8808 	msr	MSP, r0
    add r1, #4
 8000d88:	f101 0104 	add.w	r1, r1, #4
    
    ldr lr, [r1]
 8000d8c:	f8d1 e000 	ldr.w	lr, [r1]

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
 8000d90:	4804      	ldr	r0, [pc, #16]	@ (8000da4 <PendSV_Handler+0x60>)
    ldr r1, =RUNNING_PROCESS
 8000d92:	4903      	ldr	r1, [pc, #12]	@ (8000da0 <PendSV_Handler+0x5c>)
    ldr r2, [r0]
 8000d94:	6802      	ldr	r2, [r0, #0]
    str r2, [r1]
 8000d96:	600a      	str	r2, [r1, #0]
    
    dsb
 8000d98:	f3bf 8f4f 	dsb	sy

    cpsie i
 8000d9c:	b662      	cpsie	i

    bx lr
 8000d9e:	4770      	bx	lr
    ldr r0, =RUNNING_PROCESS
 8000da0:	20016004 	.word	0x20016004
    ldr r0, =PICKED_PROCESS
 8000da4:	20016008 	.word	0x20016008

08000da8 <SysTick_Handler>:
    caller saved register it will be recovered before returning from the isr*/
    

    /*****************set the PendSV interrupt*********************/
    
    ldr r0, =0xE000ED04      // Address of ICSR register
 8000da8:	4802      	ldr	r0, [pc, #8]	@ (8000db4 <SysTick_Handler+0xc>)
    ldr r1, =0x10000000      // Bit 28 (PENDSVSET)
 8000daa:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
    str r1, [r0]             // Set PendSV pending
 8000dae:	6001      	str	r1, [r0, #0]


    bx lr
 8000db0:	4770      	bx	lr
 8000db2:	0000      	.short	0x0000
    ldr r0, =0xE000ED04      // Address of ICSR register
 8000db4:	e000ed04 	.word	0xe000ed04

08000db8 <SVC_Handler>:
.section .text.SVC_Handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler:
    /* r0, r1, r2, r3 stores the arguments of systemcall */
    push {r0, r1, r2, r3}
 8000db8:	b40f      	push	{r0, r1, r2, r3}

    tst lr, #4
 8000dba:	f01e 0f04 	tst.w	lr, #4
    ite eq
 8000dbe:	bf0c      	ite	eq
    mrseq r0, msp
 8000dc0:	f3ef 8008 	mrseq	r0, MSP
    mrsne r0, psp
 8000dc4:	f3ef 8009 	mrsne	r0, PSP

    add r0, #24 /* retrieve the old pc that is stacked*/
 8000dc8:	f100 0018 	add.w	r0, r0, #24
    ldr r1, [r0]
 8000dcc:	6801      	ldr	r1, [r0, #0]
    sub r1, #2      /*move 2 bytes before to get the scv immidiate*/
 8000dce:	f1a1 0102 	sub.w	r1, r1, #2
    ldrb r0, [r1]   /*r0 now contains the immidiate value*/
 8000dd2:	7808      	ldrb	r0, [r1, #0]

    
    ldr r2, =SYSCALL_TABLE_AD
 8000dd4:	4a07      	ldr	r2, [pc, #28]	@ (8000df4 <SVC_Handler+0x3c>)
    ldr r1, [r2]            // r1 contains the address of syscall_table
 8000dd6:	6811      	ldr	r1, [r2, #0]
                            // r0 contains the immidate value
    
    mov r3, #4
 8000dd8:	f04f 0304 	mov.w	r3, #4
    mul r0, r3 
 8000ddc:	fb03 f000 	mul.w	r0, r3, r0
    add r1, r0 
 8000de0:	4401      	add	r1, r0

    mov r12, r1            // store the address of service function in r12
 8000de2:	468c      	mov	ip, r1
    ldr r12, [r12]
 8000de4:	f8dc c000 	ldr.w	ip, [ip]

    pop {r0, r1, r2, r3}
 8000de8:	bc0f      	pop	{r0, r1, r2, r3}

    push {lr}
 8000dea:	b500      	push	{lr}
    blx r12
 8000dec:	47e0      	blx	ip
    pop {lr}
 8000dee:	f85d eb04 	ldr.w	lr, [sp], #4


    bx lr
 8000df2:	4770      	bx	lr
    ldr r2, =SYSCALL_TABLE_AD
 8000df4:	2001600c 	.word	0x2001600c

08000df8 <BusFault_Handler>:
// r0 -> pc, r1 -> fault type, r2 -> fault in kernel / userproc
.section .text.BusFault_Handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler:
    ldr r0, =0xfffffffd
 8000df8:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0
 8000dfc:	4586      	cmp	lr, r0
    ittee eq 
 8000dfe:	bf07      	ittee	eq
    mrseq r0, psp
 8000e00:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000e04:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000e06:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000e0a:	2201      	movne	r2, #1

    /* find pc */
    ldr r0, [r0, #24]
 8000e0c:	6980      	ldr	r0, [r0, #24]
    mov r1, BusFault_Identifier
 8000e0e:	f04f 0100 	mov.w	r1, #0
    push {lr}
 8000e12:	b500      	push	{lr}
    bl fault_handler_helper
 8000e14:	f7ff f97a 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000e18:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8000e1c:	4770      	bx	lr

08000e1e <MemManage_Handler>:
/***********************MemManage_Handler start************************/
.section .text.MemManage_Handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler:
    ldr r0, =0xfffffffd 
 8000e1e:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000e22:	4586      	cmp	lr, r0

    ittee eq 
 8000e24:	bf07      	ittee	eq
    mrseq r0, psp
 8000e26:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000e2a:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000e2c:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000e30:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8000e32:	6980      	ldr	r0, [r0, #24]
    mov r1, MemManage_Identifier
 8000e34:	f04f 0101 	mov.w	r1, #1
    push {lr}
 8000e38:	b500      	push	{lr}
    bl fault_handler_helper
 8000e3a:	f7ff f967 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000e3e:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8000e42:	4770      	bx	lr

08000e44 <UsageFault_Handler>:

.section .text.UsageFault_Handler
.global UsageFault_Handler 
.type UsageFault_Handler, %function
UsageFault_Handler:
    ldr r0, =0xfffffffd 
 8000e44:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000e48:	4586      	cmp	lr, r0

    ittee eq 
 8000e4a:	bf07      	ittee	eq
    mrseq r0, psp
 8000e4c:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000e50:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000e52:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000e56:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8000e58:	6980      	ldr	r0, [r0, #24]
    mov r1, UsageFault_Identifier
 8000e5a:	f04f 0102 	mov.w	r1, #2
    push {lr}
 8000e5e:	b500      	push	{lr}
    bl fault_handler_helper
 8000e60:	f7ff f954 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000e64:	f85d eb04 	ldr.w	lr, [sp], #4
    
    bx lr
 8000e68:	4770      	bx	lr
	...

08000e6c <HardFault_Handler>:
.section .text.HardFault_Handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler:

    ldr r0, =0xfffffffd 
 8000e6c:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000e70:	4586      	cmp	lr, r0
    ite eq 
 8000e72:	bf0c      	ite	eq
    mrseq r0, psp
 8000e74:	f3ef 8009 	mrseq	r0, PSP
    mrsne r0, msp
 8000e78:	f3ef 8008 	mrsne	r0, MSP
    
    /* find pc */
    ldr r0, [r0, #24]
 8000e7c:	6980      	ldr	r0, [r0, #24]
    
    /* after getting the pc, msp can be safely altered !!!*/
    ldr r1, =_estack
 8000e7e:	4904      	ldr	r1, [pc, #16]	@ (8000e90 <HardFault_Handler+0x24>)
    msr msp, r1
 8000e80:	f381 8808 	msr	MSP, r1

    push {lr}
 8000e84:	b500      	push	{lr}
    bl HardFault_Handler_helper
 8000e86:	f7ff f9c5 	bl	8000214 <HardFault_Handler_helper>
    pop {lr}
 8000e8a:	f85d eb04 	ldr.w	lr, [sp], #4

    b .
 8000e8e:	e7fe      	b.n	8000e8e <HardFault_Handler+0x22>
    ldr r1, =_estack
 8000e90:	20018000 	.word	0x20018000

Disassembly of section .usertext:

0800132c <main1-0xecd4>:
	...

08010000 <main1>:
#include "kernel_api.h"

USER_CODE int main1(void) {
 8010000:	b580      	push	{r7, lr}
 8010002:	af00      	add	r7, sp, #0
  while (1) {

    user_printf("hello from main1.c\n\r", 0x0);
 8010004:	2100      	movs	r1, #0
 8010006:	4806      	ldr	r0, [pc, #24]	@ (8010020 <main1+0x20>)
 8010008:	f000 f954 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c second time\n\r", 0x0);
 801000c:	2100      	movs	r1, #0
 801000e:	4805      	ldr	r0, [pc, #20]	@ (8010024 <main1+0x24>)
 8010010:	f000 f950 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c third time\n\r", 0x0);
 8010014:	2100      	movs	r1, #0
 8010016:	4804      	ldr	r0, [pc, #16]	@ (8010028 <main1+0x28>)
 8010018:	f000 f94c 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c\n\r", 0x0);
 801001c:	e7f2      	b.n	8010004 <main1+0x4>
 801001e:	bf00      	nop
 8010020:	080010dc 	.word	0x080010dc
 8010024:	080010f4 	.word	0x080010f4
 8010028:	08001118 	.word	0x08001118

0801002c <main2>:
#include "kernel_api.h"

USER_CODE int main2(void) {
 801002c:	b580      	push	{r7, lr}
 801002e:	b082      	sub	sp, #8
 8010030:	af00      	add	r7, sp, #0
  int count = 10;
 8010032:	230a      	movs	r3, #10
 8010034:	607b      	str	r3, [r7, #4]
  while (count --) {
 8010036:	e003      	b.n	8010040 <main2+0x14>
    user_printf("((((((((((hello from main2.c\n\r", 0x0);
 8010038:	2100      	movs	r1, #0
 801003a:	4806      	ldr	r0, [pc, #24]	@ (8010054 <main2+0x28>)
 801003c:	f000 f93a 	bl	80102b4 <user_printf>
  while (count --) {
 8010040:	687b      	ldr	r3, [r7, #4]
 8010042:	1e5a      	subs	r2, r3, #1
 8010044:	607a      	str	r2, [r7, #4]
 8010046:	2b00      	cmp	r3, #0
 8010048:	d1f6      	bne.n	8010038 <main2+0xc>
  }
}
 801004a:	bf00      	nop
 801004c:	4618      	mov	r0, r3
 801004e:	3708      	adds	r7, #8
 8010050:	46bd      	mov	sp, r7
 8010052:	bd80      	pop	{r7, pc}
 8010054:	08001138 	.word	0x08001138

08010058 <main4>:
#include "kernel_api.h"
USER_CODE int main4 (void){
 8010058:	b580      	push	{r7, lr}
 801005a:	b082      	sub	sp, #8
 801005c:	af00      	add	r7, sp, #0
    int count = 10;
 801005e:	230a      	movs	r3, #10
 8010060:	607b      	str	r3, [r7, #4]
    while (count--)
 8010062:	e003      	b.n	801006c <main4+0x14>
    user_printf("++++++++++hello from main4.c\n\r", 0x0);
 8010064:	2100      	movs	r1, #0
 8010066:	4806      	ldr	r0, [pc, #24]	@ (8010080 <main4+0x28>)
 8010068:	f000 f924 	bl	80102b4 <user_printf>
    while (count--)
 801006c:	687b      	ldr	r3, [r7, #4]
 801006e:	1e5a      	subs	r2, r3, #1
 8010070:	607a      	str	r2, [r7, #4]
 8010072:	2b00      	cmp	r3, #0
 8010074:	d1f6      	bne.n	8010064 <main4+0xc>

    
}
 8010076:	bf00      	nop
 8010078:	4618      	mov	r0, r3
 801007a:	3708      	adds	r7, #8
 801007c:	46bd      	mov	sp, r7
 801007e:	bd80      	pop	{r7, pc}
 8010080:	08001158 	.word	0x08001158

08010084 <main5>:
#include "kernel_api.h"

USER_CODE int main5 (void){
 8010084:	b580      	push	{r7, lr}
 8010086:	b082      	sub	sp, #8
 8010088:	af00      	add	r7, sp, #0
    int count = 10;   
 801008a:	230a      	movs	r3, #10
 801008c:	607b      	str	r3, [r7, #4]
    while (count --){
 801008e:	e003      	b.n	8010098 <main5+0x14>
        user_printf ("==========hello from main5.c\n\r", 0x0);
 8010090:	2100      	movs	r1, #0
 8010092:	4806      	ldr	r0, [pc, #24]	@ (80100ac <main5+0x28>)
 8010094:	f000 f90e 	bl	80102b4 <user_printf>
    while (count --){
 8010098:	687b      	ldr	r3, [r7, #4]
 801009a:	1e5a      	subs	r2, r3, #1
 801009c:	607a      	str	r2, [r7, #4]
 801009e:	2b00      	cmp	r3, #0
 80100a0:	d1f6      	bne.n	8010090 <main5+0xc>

    }



}
 80100a2:	bf00      	nop
 80100a4:	4618      	mov	r0, r3
 80100a6:	3708      	adds	r7, #8
 80100a8:	46bd      	mov	sp, r7
 80100aa:	bd80      	pop	{r7, pc}
 80100ac:	08001178 	.word	0x08001178

080100b0 <main6>:
#include "kernel_api.h"

USER_CODE int main6 (void){
 80100b0:	b580      	push	{r7, lr}
 80100b2:	b082      	sub	sp, #8
 80100b4:	af00      	add	r7, sp, #0
  
  int count = 10;
 80100b6:	230a      	movs	r3, #10
 80100b8:	607b      	str	r3, [r7, #4]
    while (count--){
 80100ba:	e003      	b.n	80100c4 <main6+0x14>
        user_printf ("@@@@@@@@@@hello from main6.c\n\r", 0x0);
 80100bc:	2100      	movs	r1, #0
 80100be:	4806      	ldr	r0, [pc, #24]	@ (80100d8 <main6+0x28>)
 80100c0:	f000 f8f8 	bl	80102b4 <user_printf>
    while (count--){
 80100c4:	687b      	ldr	r3, [r7, #4]
 80100c6:	1e5a      	subs	r2, r3, #1
 80100c8:	607a      	str	r2, [r7, #4]
 80100ca:	2b00      	cmp	r3, #0
 80100cc:	d1f6      	bne.n	80100bc <main6+0xc>

    }



}
 80100ce:	bf00      	nop
 80100d0:	4618      	mov	r0, r3
 80100d2:	3708      	adds	r7, #8
 80100d4:	46bd      	mov	sp, r7
 80100d6:	bd80      	pop	{r7, pc}
 80100d8:	08001198 	.word	0x08001198

080100dc <main7>:
#include "kernel_api.h"

USER_CODE int main7 (void){
 80100dc:	b580      	push	{r7, lr}
 80100de:	b082      	sub	sp, #8
 80100e0:	af00      	add	r7, sp, #0
 
  int count = 10;
 80100e2:	230a      	movs	r3, #10
 80100e4:	607b      	str	r3, [r7, #4]
    while (count --){
 80100e6:	e003      	b.n	80100f0 <main7+0x14>
        user_printf ("@@@@@@@@@@hello from main5.c\n\r", 0x0);
 80100e8:	2100      	movs	r1, #0
 80100ea:	4806      	ldr	r0, [pc, #24]	@ (8010104 <main7+0x28>)
 80100ec:	f000 f8e2 	bl	80102b4 <user_printf>
    while (count --){
 80100f0:	687b      	ldr	r3, [r7, #4]
 80100f2:	1e5a      	subs	r2, r3, #1
 80100f4:	607a      	str	r2, [r7, #4]
 80100f6:	2b00      	cmp	r3, #0
 80100f8:	d1f6      	bne.n	80100e8 <main7+0xc>

    }



}
 80100fa:	bf00      	nop
 80100fc:	4618      	mov	r0, r3
 80100fe:	3708      	adds	r7, #8
 8010100:	46bd      	mov	sp, r7
 8010102:	bd80      	pop	{r7, pc}
 8010104:	080011b8 	.word	0x080011b8

08010108 <main8>:
#include "kernel_api.h"

USER_CODE int main8 (void){
 8010108:	b580      	push	{r7, lr}
 801010a:	b082      	sub	sp, #8
 801010c:	af00      	add	r7, sp, #0
  int count = 10;   
 801010e:	230a      	movs	r3, #10
 8010110:	607b      	str	r3, [r7, #4]
    while (count--){
 8010112:	e003      	b.n	801011c <main8+0x14>
        user_printf ("==========hello from main8.c\n\r", 0x0);
 8010114:	2100      	movs	r1, #0
 8010116:	4806      	ldr	r0, [pc, #24]	@ (8010130 <main8+0x28>)
 8010118:	f000 f8cc 	bl	80102b4 <user_printf>
    while (count--){
 801011c:	687b      	ldr	r3, [r7, #4]
 801011e:	1e5a      	subs	r2, r3, #1
 8010120:	607a      	str	r2, [r7, #4]
 8010122:	2b00      	cmp	r3, #0
 8010124:	d1f6      	bne.n	8010114 <main8+0xc>

    }



}
 8010126:	bf00      	nop
 8010128:	4618      	mov	r0, r3
 801012a:	3708      	adds	r7, #8
 801012c:	46bd      	mov	sp, r7
 801012e:	bd80      	pop	{r7, pc}
 8010130:	080011d8 	.word	0x080011d8

08010134 <main9>:
#include "kernel_api.h"

USER_CODE int main9 (void){
 8010134:	b580      	push	{r7, lr}
 8010136:	b082      	sub	sp, #8
 8010138:	af00      	add	r7, sp, #0
 
  int count = 10;
 801013a:	230a      	movs	r3, #10
 801013c:	607b      	str	r3, [r7, #4]
    while (count--){
 801013e:	e003      	b.n	8010148 <main9+0x14>
        user_printf ("==========hello from main9.c\n\r", 0x0);
 8010140:	2100      	movs	r1, #0
 8010142:	4806      	ldr	r0, [pc, #24]	@ (801015c <main9+0x28>)
 8010144:	f000 f8b6 	bl	80102b4 <user_printf>
    while (count--){
 8010148:	687b      	ldr	r3, [r7, #4]
 801014a:	1e5a      	subs	r2, r3, #1
 801014c:	607a      	str	r2, [r7, #4]
 801014e:	2b00      	cmp	r3, #0
 8010150:	d1f6      	bne.n	8010140 <main9+0xc>

    }



}
 8010152:	bf00      	nop
 8010154:	4618      	mov	r0, r3
 8010156:	3708      	adds	r7, #8
 8010158:	46bd      	mov	sp, r7
 801015a:	bd80      	pop	{r7, pc}
 801015c:	080011f8 	.word	0x080011f8

08010160 <main10>:
#include "kernel_api.h"

USER_CODE int main10 (void){
 8010160:	b580      	push	{r7, lr}
 8010162:	b082      	sub	sp, #8
 8010164:	af00      	add	r7, sp, #0
 
  int count = 10;
 8010166:	230a      	movs	r3, #10
 8010168:	607b      	str	r3, [r7, #4]
    while (count --){
 801016a:	e003      	b.n	8010174 <main10+0x14>
        user_printf ("==========hello from main10.c\n\r", 0x0);
 801016c:	2100      	movs	r1, #0
 801016e:	4806      	ldr	r0, [pc, #24]	@ (8010188 <main10+0x28>)
 8010170:	f000 f8a0 	bl	80102b4 <user_printf>
    while (count --){
 8010174:	687b      	ldr	r3, [r7, #4]
 8010176:	1e5a      	subs	r2, r3, #1
 8010178:	607a      	str	r2, [r7, #4]
 801017a:	2b00      	cmp	r3, #0
 801017c:	d1f6      	bne.n	801016c <main10+0xc>

    }



}
 801017e:	bf00      	nop
 8010180:	4618      	mov	r0, r3
 8010182:	3708      	adds	r7, #8
 8010184:	46bd      	mov	sp, r7
 8010186:	bd80      	pop	{r7, pc}
 8010188:	08001218 	.word	0x08001218

0801018c <main11>:
#include "kernel_api.h"

USER_CODE int main11 (void){
 801018c:	b580      	push	{r7, lr}
 801018e:	b082      	sub	sp, #8
 8010190:	af00      	add	r7, sp, #0
    int count = 10;   
 8010192:	230a      	movs	r3, #10
 8010194:	607b      	str	r3, [r7, #4]
    while (count --){
 8010196:	e003      	b.n	80101a0 <main11+0x14>
        user_printf ("==========hello from main11.c\n\r", 0x0);
 8010198:	2100      	movs	r1, #0
 801019a:	4806      	ldr	r0, [pc, #24]	@ (80101b4 <main11+0x28>)
 801019c:	f000 f88a 	bl	80102b4 <user_printf>
    while (count --){
 80101a0:	687b      	ldr	r3, [r7, #4]
 80101a2:	1e5a      	subs	r2, r3, #1
 80101a4:	607a      	str	r2, [r7, #4]
 80101a6:	2b00      	cmp	r3, #0
 80101a8:	d1f6      	bne.n	8010198 <main11+0xc>

    }



}
 80101aa:	bf00      	nop
 80101ac:	4618      	mov	r0, r3
 80101ae:	3708      	adds	r7, #8
 80101b0:	46bd      	mov	sp, r7
 80101b2:	bd80      	pop	{r7, pc}
 80101b4:	08001238 	.word	0x08001238

080101b8 <main12>:
#include "kernel_api.h"

USER_CODE int main12 (void){
 80101b8:	b580      	push	{r7, lr}
 80101ba:	b082      	sub	sp, #8
 80101bc:	af00      	add	r7, sp, #0
 
  int count = 10;
 80101be:	230a      	movs	r3, #10
 80101c0:	607b      	str	r3, [r7, #4]
    while (count --){
 80101c2:	e003      	b.n	80101cc <main12+0x14>
        user_printf ("==========hello from main12.c\n\r", 0x0);
 80101c4:	2100      	movs	r1, #0
 80101c6:	4806      	ldr	r0, [pc, #24]	@ (80101e0 <main12+0x28>)
 80101c8:	f000 f874 	bl	80102b4 <user_printf>
    while (count --){
 80101cc:	687b      	ldr	r3, [r7, #4]
 80101ce:	1e5a      	subs	r2, r3, #1
 80101d0:	607a      	str	r2, [r7, #4]
 80101d2:	2b00      	cmp	r3, #0
 80101d4:	d1f6      	bne.n	80101c4 <main12+0xc>

    }



}
 80101d6:	bf00      	nop
 80101d8:	4618      	mov	r0, r3
 80101da:	3708      	adds	r7, #8
 80101dc:	46bd      	mov	sp, r7
 80101de:	bd80      	pop	{r7, pc}
 80101e0:	08001258 	.word	0x08001258

080101e4 <main13>:
#include "kernel_api.h"

USER_CODE int main13 (void){
 80101e4:	b580      	push	{r7, lr}
 80101e6:	b082      	sub	sp, #8
 80101e8:	af00      	add	r7, sp, #0
  int count = 10;   
 80101ea:	230a      	movs	r3, #10
 80101ec:	607b      	str	r3, [r7, #4]
    while (count--){
 80101ee:	e003      	b.n	80101f8 <main13+0x14>
        user_printf ("==========hello from main13.c\n\r", 0x0);
 80101f0:	2100      	movs	r1, #0
 80101f2:	4806      	ldr	r0, [pc, #24]	@ (801020c <main13+0x28>)
 80101f4:	f000 f85e 	bl	80102b4 <user_printf>
    while (count--){
 80101f8:	687b      	ldr	r3, [r7, #4]
 80101fa:	1e5a      	subs	r2, r3, #1
 80101fc:	607a      	str	r2, [r7, #4]
 80101fe:	2b00      	cmp	r3, #0
 8010200:	d1f6      	bne.n	80101f0 <main13+0xc>

    }



}
 8010202:	bf00      	nop
 8010204:	4618      	mov	r0, r3
 8010206:	3708      	adds	r7, #8
 8010208:	46bd      	mov	sp, r7
 801020a:	bd80      	pop	{r7, pc}
 801020c:	08001278 	.word	0x08001278

08010210 <main14>:
#include "kernel_api.h"

USER_CODE int main14 (void){
 8010210:	b580      	push	{r7, lr}
 8010212:	b082      	sub	sp, #8
 8010214:	af00      	add	r7, sp, #0
  int count = 10;   
 8010216:	230a      	movs	r3, #10
 8010218:	607b      	str	r3, [r7, #4]
    while (count--){
 801021a:	e003      	b.n	8010224 <main14+0x14>
        user_printf ("==========hello from main14.c\n\r", 0x0);
 801021c:	2100      	movs	r1, #0
 801021e:	4806      	ldr	r0, [pc, #24]	@ (8010238 <main14+0x28>)
 8010220:	f000 f848 	bl	80102b4 <user_printf>
    while (count--){
 8010224:	687b      	ldr	r3, [r7, #4]
 8010226:	1e5a      	subs	r2, r3, #1
 8010228:	607a      	str	r2, [r7, #4]
 801022a:	2b00      	cmp	r3, #0
 801022c:	d1f6      	bne.n	801021c <main14+0xc>

    }



}
 801022e:	bf00      	nop
 8010230:	4618      	mov	r0, r3
 8010232:	3708      	adds	r7, #8
 8010234:	46bd      	mov	sp, r7
 8010236:	bd80      	pop	{r7, pc}
 8010238:	08001298 	.word	0x08001298

0801023c <main15>:
#include "kernel_api.h"

USER_CODE int main15 (void){
 801023c:	b580      	push	{r7, lr}
 801023e:	b082      	sub	sp, #8
 8010240:	af00      	add	r7, sp, #0
  int count = 10;   
 8010242:	230a      	movs	r3, #10
 8010244:	607b      	str	r3, [r7, #4]
    while (count--){
 8010246:	e003      	b.n	8010250 <main15+0x14>
        user_printf ("==========hello from main15.c\n\r", 0x0);
 8010248:	2100      	movs	r1, #0
 801024a:	4806      	ldr	r0, [pc, #24]	@ (8010264 <main15+0x28>)
 801024c:	f000 f832 	bl	80102b4 <user_printf>
    while (count--){
 8010250:	687b      	ldr	r3, [r7, #4]
 8010252:	1e5a      	subs	r2, r3, #1
 8010254:	607a      	str	r2, [r7, #4]
 8010256:	2b00      	cmp	r3, #0
 8010258:	d1f6      	bne.n	8010248 <main15+0xc>

    }



}
 801025a:	bf00      	nop
 801025c:	4618      	mov	r0, r3
 801025e:	3708      	adds	r7, #8
 8010260:	46bd      	mov	sp, r7
 8010262:	bd80      	pop	{r7, pc}
 8010264:	080012b8 	.word	0x080012b8

08010268 <main3>:
#include "kernel_api.h"

USER_CODE int main3 (void){
 8010268:	b580      	push	{r7, lr}
 801026a:	b082      	sub	sp, #8
 801026c:	af00      	add	r7, sp, #0
  int count = 10;
 801026e:	230a      	movs	r3, #10
 8010270:	607b      	str	r3, [r7, #4]
  // returning
  user_printf ("returning from main3 before printing anything \n\r", 0x0);
 8010272:	2100      	movs	r1, #0
 8010274:	4809      	ldr	r0, [pc, #36]	@ (801029c <main3+0x34>)
 8010276:	f000 f81d 	bl	80102b4 <user_printf>
  user_process_exit();
 801027a:	f000 f81d 	bl	80102b8 <user_process_exit>

    while (count--){
 801027e:	e003      	b.n	8010288 <main3+0x20>
        user_printf (">>>>>>>>>>hello from main3.c\n\r", 0x0);
 8010280:	2100      	movs	r1, #0
 8010282:	4807      	ldr	r0, [pc, #28]	@ (80102a0 <main3+0x38>)
 8010284:	f000 f816 	bl	80102b4 <user_printf>
    while (count--){
 8010288:	687b      	ldr	r3, [r7, #4]
 801028a:	1e5a      	subs	r2, r3, #1
 801028c:	607a      	str	r2, [r7, #4]
 801028e:	2b00      	cmp	r3, #0
 8010290:	d1f6      	bne.n	8010280 <main3+0x18>
    }
}
 8010292:	bf00      	nop
 8010294:	4618      	mov	r0, r3
 8010296:	3708      	adds	r7, #8
 8010298:	46bd      	mov	sp, r7
 801029a:	bd80      	pop	{r7, pc}
 801029c:	080012d8 	.word	0x080012d8
 80102a0:	0800130c 	.word	0x0800130c

080102a4 <__asm__launch_main1>:
 80102a4:	f04f 0003 	mov.w	r0, #3
 80102a8:	f380 8814 	msr	CONTROL, r0
 80102ac:	f3bf 8f6f 	isb	sy
 80102b0:	f7ff fea6 	bl	8010000 <main1>

080102b4 <user_printf>:
 80102b4:	df00      	svc	0
 80102b6:	4770      	bx	lr

080102b8 <user_process_exit>:
 80102b8:	df02      	svc	2
 80102ba:	4770      	bx	lr
