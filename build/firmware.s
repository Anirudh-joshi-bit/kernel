
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
 80000ec:	080014a8 	.word	0x080014a8
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
 8000124:	f000 fb2a 	bl	800077c <printf>
    if (SCB->CFSR & SCB_CFSR_BFARVALID_Msk)
 8000128:	4b2c      	ldr	r3, [pc, #176]	@ (80001dc <fault_handler_helper+0xd0>)
 800012a:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 800012c:	f403 4300 	and.w	r3, r3, #32768	@ 0x8000
 8000130:	2b00      	cmp	r3, #0
 8000132:	d01f      	beq.n	8000174 <fault_handler_helper+0x68>
      printf("busfault address -> %\n\r", (uint32_t)(&SCB->BFAR));
 8000134:	492a      	ldr	r1, [pc, #168]	@ (80001e0 <fault_handler_helper+0xd4>)
 8000136:	482b      	ldr	r0, [pc, #172]	@ (80001e4 <fault_handler_helper+0xd8>)
 8000138:	f000 fb20 	bl	800077c <printf>
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
 8000148:	f000 fb18 	bl	800077c <printf>
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
 8000160:	f000 fb0c 	bl	800077c <printf>
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
 8000170:	f000 fb04 	bl	800077c <printf>
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
 800017e:	f000 fafd 	bl	800077c <printf>
         (uint32_t)(&SCB->CFSR));
  printf("PC -> %\n\r", (uint32_t)&pc);
 8000182:	f107 030c 	add.w	r3, r7, #12
 8000186:	4619      	mov	r1, r3
 8000188:	481c      	ldr	r0, [pc, #112]	@ (80001fc <fault_handler_helper+0xf0>)
 800018a:	f000 faf7 	bl	800077c <printf>
  printf("instruction that caused the fault-> %\n\r", (uint32_t)(&instruction));
 800018e:	f107 0314 	add.w	r3, r7, #20
 8000192:	4619      	mov	r1, r3
 8000194:	481a      	ldr	r0, [pc, #104]	@ (8000200 <fault_handler_helper+0xf4>)
 8000196:	f000 faf1 	bl	800077c <printf>

  /* KERNEL PANIC if fault in kernel
   * PROCESSES TERMINATION if fault in user process */

  if (fault_place == FAULT_IN_KERNEL) {
 800019a:	687b      	ldr	r3, [r7, #4]
 800019c:	2b01      	cmp	r3, #1
 800019e:	d104      	bne.n	80001aa <fault_handler_helper+0x9e>
    printf("\n\n\rKERNEL PANIC......\n\n\r", 0x0);
 80001a0:	2100      	movs	r1, #0
 80001a2:	4818      	ldr	r0, [pc, #96]	@ (8000204 <fault_handler_helper+0xf8>)
 80001a4:	f000 faea 	bl	800077c <printf>
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
 80001b4:	f000 fae2 	bl	800077c <printf>
    printf("reason -> fault", 0x0);
 80001b8:	2100      	movs	r1, #0
 80001ba:	4814      	ldr	r0, [pc, #80]	@ (800020c <fault_handler_helper+0x100>)
 80001bc:	f000 fade 	bl	800077c <printf>

    (*(user_process_t **)(RUNNING_PROCESS_AD))->state = SUSPEND_STATE;
 80001c0:	4b13      	ldr	r3, [pc, #76]	@ (8000210 <fault_handler_helper+0x104>)
 80001c2:	681b      	ldr	r3, [r3, #0]
 80001c4:	2202      	movs	r2, #2
 80001c6:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* trigger context switching*/
    PendSV_Handler();
 80001c8:	f000 fe6e 	bl	8000ea8 <PendSV_Handler>
 80001cc:	e000      	b.n	80001d0 <fault_handler_helper+0xc4>
    return;
 80001ce:	bf00      	nop
  }
}
 80001d0:	3718      	adds	r7, #24
 80001d2:	46bd      	mov	sp, r7
 80001d4:	bd80      	pop	{r7, pc}
 80001d6:	bf00      	nop
 80001d8:	08000ff8 	.word	0x08000ff8
 80001dc:	e000ed00 	.word	0xe000ed00
 80001e0:	e000ed38 	.word	0xe000ed38
 80001e4:	08001008 	.word	0x08001008
 80001e8:	08001020 	.word	0x08001020
 80001ec:	08001040 	.word	0x08001040
 80001f0:	08001068 	.word	0x08001068
 80001f4:	e000ed28 	.word	0xe000ed28
 80001f8:	08001078 	.word	0x08001078
 80001fc:	080010a8 	.word	0x080010a8
 8000200:	080010b4 	.word	0x080010b4
 8000204:	080010dc 	.word	0x080010dc
 8000208:	080010f8 	.word	0x080010f8
 800020c:	08001118 	.word	0x08001118
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
 8000226:	f000 faa9 	bl	800077c <printf>
  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 800022a:	490c      	ldr	r1, [pc, #48]	@ (800025c <HardFault_Handler_helper+0x48>)
 800022c:	480c      	ldr	r0, [pc, #48]	@ (8000260 <HardFault_Handler_helper+0x4c>)
 800022e:	f000 faa5 	bl	800077c <printf>
         (uint32_t)(&SCB->CFSR));
  printf("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
 8000232:	490c      	ldr	r1, [pc, #48]	@ (8000264 <HardFault_Handler_helper+0x50>)
 8000234:	480c      	ldr	r0, [pc, #48]	@ (8000268 <HardFault_Handler_helper+0x54>)
 8000236:	f000 faa1 	bl	800077c <printf>
  printf("PC -> %\n\r", (uint32_t)(&pc));
 800023a:	1d3b      	adds	r3, r7, #4
 800023c:	4619      	mov	r1, r3
 800023e:	480b      	ldr	r0, [pc, #44]	@ (800026c <HardFault_Handler_helper+0x58>)
 8000240:	f000 fa9c 	bl	800077c <printf>
  printf("instruction that triggered HardFault -> %\n\r",
 8000244:	f107 030c 	add.w	r3, r7, #12
 8000248:	4619      	mov	r1, r3
 800024a:	4809      	ldr	r0, [pc, #36]	@ (8000270 <HardFault_Handler_helper+0x5c>)
 800024c:	f000 fa96 	bl	800077c <printf>
         (uint32_t)&instruction);
}
 8000250:	bf00      	nop
 8000252:	3710      	adds	r7, #16
 8000254:	46bd      	mov	sp, r7
 8000256:	bd80      	pop	{r7, pc}
 8000258:	08001128 	.word	0x08001128
 800025c:	e000ed28 	.word	0xe000ed28
 8000260:	08001078 	.word	0x08001078
 8000264:	e000ed2c 	.word	0xe000ed2c
 8000268:	0800113c 	.word	0x0800113c
 800026c:	080010a8 	.word	0x080010a8
 8000270:	08001160 	.word	0x08001160

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
 800058a:	4b1c      	ldr	r3, [pc, #112]	@ (80005fc <schedular+0x7c>)
 800058c:	681b      	ldr	r3, [r3, #0]
 800058e:	60bb      	str	r3, [r7, #8]


  // we could use a priority queue here to support priority...
  picked_process = queue_front(&ready_queue);
 8000590:	481b      	ldr	r0, [pc, #108]	@ (8000600 <schedular+0x80>)
 8000592:	f7ff ff3b 	bl	800040c <queue_front>
 8000596:	60f8      	str	r0, [r7, #12]
  uint8_t status = queue_pop(&ready_queue);
 8000598:	4819      	ldr	r0, [pc, #100]	@ (8000600 <schedular+0x80>)
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
 80005ac:	d10c      	bne.n	80005c8 <schedular+0x48>
    picked_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 80005ae:	4b13      	ldr	r3, [pc, #76]	@ (80005fc <schedular+0x7c>)
 80005b0:	681b      	ldr	r3, [r3, #0]
 80005b2:	60fb      	str	r3, [r7, #12]
    // dissable systick to remove the context switching overhead if there is only one process .

    printf ("ready queue is empty, turning off context switching\n\r", 0x0);
 80005b4:	2100      	movs	r1, #0
 80005b6:	4813      	ldr	r0, [pc, #76]	@ (8000604 <schedular+0x84>)
 80005b8:	f000 f8e0 	bl	800077c <printf>
    SysTick->CTRL &= ~(SysTick_CTRL_ENABLE_Msk);
 80005bc:	4b12      	ldr	r3, [pc, #72]	@ (8000608 <schedular+0x88>)
 80005be:	681b      	ldr	r3, [r3, #0]
 80005c0:	4a11      	ldr	r2, [pc, #68]	@ (8000608 <schedular+0x88>)
 80005c2:	f023 0301 	bic.w	r3, r3, #1
 80005c6:	6013      	str	r3, [r2, #0]
    // better if the last standing process is too large  or there is only one process to begin with
  }

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);
 80005c8:	4a10      	ldr	r2, [pc, #64]	@ (800060c <schedular+0x8c>)
 80005ca:	68fb      	ldr	r3, [r7, #12]
 80005cc:	6013      	str	r3, [r2, #0]
  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE &&
 80005ce:	68bb      	ldr	r3, [r7, #8]
 80005d0:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 80005d2:	2b02      	cmp	r3, #2
 80005d4:	d00a      	beq.n	80005ec <schedular+0x6c>
      running_process->state != WAITING_STATE) {
 80005d6:	68bb      	ldr	r3, [r7, #8]
 80005d8:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
  if (running_process->state != SUSPEND_STATE &&
 80005da:	2b03      	cmp	r3, #3
 80005dc:	d006      	beq.n	80005ec <schedular+0x6c>
    queue_push(&ready_queue, running_process);
 80005de:	68b9      	ldr	r1, [r7, #8]
 80005e0:	4807      	ldr	r0, [pc, #28]	@ (8000600 <schedular+0x80>)
 80005e2:	f7ff fe90 	bl	8000306 <queue_push>
    running_process->state = READY_STATE;
 80005e6:	68bb      	ldr	r3, [r7, #8]
 80005e8:	2200      	movs	r2, #0
 80005ea:	62da      	str	r2, [r3, #44]	@ 0x2c
  }

  picked_process->state = RUNNING_STATE;
 80005ec:	68fb      	ldr	r3, [r7, #12]
 80005ee:	2201      	movs	r2, #1
 80005f0:	62da      	str	r2, [r3, #44]	@ 0x2c
}
 80005f2:	bf00      	nop
 80005f4:	3710      	adds	r7, #16
 80005f6:	46bd      	mov	sp, r7
 80005f8:	bd80      	pop	{r7, pc}
 80005fa:	bf00      	nop
 80005fc:	20016004 	.word	0x20016004
 8000600:	200003f4 	.word	0x200003f4
 8000604:	0800118c 	.word	0x0800118c
 8000608:	e000e010 	.word	0xe000e010
 800060c:	20016008 	.word	0x20016008

08000610 <strlen>:
#include "usart.h"
#include <stdarg.h>

#define MAX_STR_LENGTH 500 

uint32_t strlen(const char *msg) {
 8000610:	b480      	push	{r7}
 8000612:	b085      	sub	sp, #20
 8000614:	af00      	add	r7, sp, #0
 8000616:	6078      	str	r0, [r7, #4]

  int i = 0;
 8000618:	2300      	movs	r3, #0
 800061a:	60fb      	str	r3, [r7, #12]
  while (msg[i++] != '\0')
 800061c:	bf00      	nop
 800061e:	68fb      	ldr	r3, [r7, #12]
 8000620:	1c5a      	adds	r2, r3, #1
 8000622:	60fa      	str	r2, [r7, #12]
 8000624:	461a      	mov	r2, r3
 8000626:	687b      	ldr	r3, [r7, #4]
 8000628:	4413      	add	r3, r2
 800062a:	781b      	ldrb	r3, [r3, #0]
 800062c:	2b00      	cmp	r3, #0
 800062e:	d1f6      	bne.n	800061e <strlen+0xe>
    ;
  return i - 1;
 8000630:	68fb      	ldr	r3, [r7, #12]
 8000632:	3b01      	subs	r3, #1
}
 8000634:	4618      	mov	r0, r3
 8000636:	3714      	adds	r7, #20
 8000638:	46bd      	mov	sp, r7
 800063a:	bc80      	pop	{r7}
 800063c:	4770      	bx	lr

0800063e <concat>:

 uint32_t concat (char *s, uint32_t ind, uint32_t MAX_S_SIZE, char *t){
 800063e:	b480      	push	{r7}
 8000640:	b087      	sub	sp, #28
 8000642:	af00      	add	r7, sp, #0
 8000644:	60f8      	str	r0, [r7, #12]
 8000646:	60b9      	str	r1, [r7, #8]
 8000648:	607a      	str	r2, [r7, #4]
 800064a:	603b      	str	r3, [r7, #0]
  int t_ind = 0;
 800064c:	2300      	movs	r3, #0
 800064e:	617b      	str	r3, [r7, #20]
  while (ind < MAX_S_SIZE-1 && t[t_ind]){
 8000650:	e00c      	b.n	800066c <concat+0x2e>
    s[ind++] = t[t_ind++];
 8000652:	697b      	ldr	r3, [r7, #20]
 8000654:	1c5a      	adds	r2, r3, #1
 8000656:	617a      	str	r2, [r7, #20]
 8000658:	461a      	mov	r2, r3
 800065a:	683b      	ldr	r3, [r7, #0]
 800065c:	441a      	add	r2, r3
 800065e:	68bb      	ldr	r3, [r7, #8]
 8000660:	1c59      	adds	r1, r3, #1
 8000662:	60b9      	str	r1, [r7, #8]
 8000664:	68f9      	ldr	r1, [r7, #12]
 8000666:	440b      	add	r3, r1
 8000668:	7812      	ldrb	r2, [r2, #0]
 800066a:	701a      	strb	r2, [r3, #0]
  while (ind < MAX_S_SIZE-1 && t[t_ind]){
 800066c:	687b      	ldr	r3, [r7, #4]
 800066e:	3b01      	subs	r3, #1
 8000670:	68ba      	ldr	r2, [r7, #8]
 8000672:	429a      	cmp	r2, r3
 8000674:	d205      	bcs.n	8000682 <concat+0x44>
 8000676:	697b      	ldr	r3, [r7, #20]
 8000678:	683a      	ldr	r2, [r7, #0]
 800067a:	4413      	add	r3, r2
 800067c:	781b      	ldrb	r3, [r3, #0]
 800067e:	2b00      	cmp	r3, #0
 8000680:	d1e7      	bne.n	8000652 <concat+0x14>
  }
  return ind;
 8000682:	68bb      	ldr	r3, [r7, #8]
}
 8000684:	4618      	mov	r0, r3
 8000686:	371c      	adds	r7, #28
 8000688:	46bd      	mov	sp, r7
 800068a:	bc80      	pop	{r7}
 800068c:	4770      	bx	lr

0800068e <hex_str>:

void hex_str(uint32_t value, char out[11]) {
 800068e:	b4b0      	push	{r4, r5, r7}
 8000690:	b08b      	sub	sp, #44	@ 0x2c
 8000692:	af00      	add	r7, sp, #0
 8000694:	6078      	str	r0, [r7, #4]
 8000696:	6039      	str	r1, [r7, #0]
// put the string representation of hex value in out
  char hex_char[] = "0123456789abcdef";
 8000698:	4b1d      	ldr	r3, [pc, #116]	@ (8000710 <hex_str+0x82>)
 800069a:	f107 0408 	add.w	r4, r7, #8
 800069e:	461d      	mov	r5, r3
 80006a0:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
 80006a2:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 80006a4:	682b      	ldr	r3, [r5, #0]
 80006a6:	7023      	strb	r3, [r4, #0]
  out [10] = '\0';
 80006a8:	683b      	ldr	r3, [r7, #0]
 80006aa:	330a      	adds	r3, #10
 80006ac:	2200      	movs	r2, #0
 80006ae:	701a      	strb	r2, [r3, #0]
  out[0] = '0';
 80006b0:	683b      	ldr	r3, [r7, #0]
 80006b2:	2230      	movs	r2, #48	@ 0x30
 80006b4:	701a      	strb	r2, [r3, #0]
  out[1] = 'x';
 80006b6:	683b      	ldr	r3, [r7, #0]
 80006b8:	3301      	adds	r3, #1
 80006ba:	2278      	movs	r2, #120	@ 0x78
 80006bc:	701a      	strb	r2, [r3, #0]

  for (int i = 0; i < 8; i++) {
 80006be:	2300      	movs	r3, #0
 80006c0:	627b      	str	r3, [r7, #36]	@ 0x24
 80006c2:	e01c      	b.n	80006fe <hex_str+0x70>
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
 80006c4:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006c6:	009b      	lsls	r3, r3, #2
 80006c8:	220f      	movs	r2, #15
 80006ca:	fa02 f303 	lsl.w	r3, r2, r3
 80006ce:	461a      	mov	r2, r3
 80006d0:	687b      	ldr	r3, [r7, #4]
 80006d2:	401a      	ands	r2, r3
 80006d4:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006d6:	009b      	lsls	r3, r3, #2
 80006d8:	fa22 f303 	lsr.w	r3, r2, r3
 80006dc:	623b      	str	r3, [r7, #32]
    int j = 9 - i;
 80006de:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006e0:	f1c3 0309 	rsb	r3, r3, #9
 80006e4:	61fb      	str	r3, [r7, #28]
    out[j] = hex_char[ind];
 80006e6:	69fb      	ldr	r3, [r7, #28]
 80006e8:	683a      	ldr	r2, [r7, #0]
 80006ea:	4413      	add	r3, r2
 80006ec:	f107 0108 	add.w	r1, r7, #8
 80006f0:	6a3a      	ldr	r2, [r7, #32]
 80006f2:	440a      	add	r2, r1
 80006f4:	7812      	ldrb	r2, [r2, #0]
 80006f6:	701a      	strb	r2, [r3, #0]
  for (int i = 0; i < 8; i++) {
 80006f8:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006fa:	3301      	adds	r3, #1
 80006fc:	627b      	str	r3, [r7, #36]	@ 0x24
 80006fe:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8000700:	2b07      	cmp	r3, #7
 8000702:	dddf      	ble.n	80006c4 <hex_str+0x36>
  }
}
 8000704:	bf00      	nop
 8000706:	bf00      	nop
 8000708:	372c      	adds	r7, #44	@ 0x2c
 800070a:	46bd      	mov	sp, r7
 800070c:	bcb0      	pop	{r4, r5, r7}
 800070e:	4770      	bx	lr
 8000710:	080011c4 	.word	0x080011c4

08000714 <int_str>:

void int_str (uint32_t value, char out[11]){
 8000714:	b480      	push	{r7}
 8000716:	b085      	sub	sp, #20
 8000718:	af00      	add	r7, sp, #0
 800071a:	6078      	str	r0, [r7, #4]
 800071c:	6039      	str	r1, [r7, #0]
  // put the string representation of value in out;
  int32_t i = 9;
 800071e:	2309      	movs	r3, #9
 8000720:	60fb      	str	r3, [r7, #12]
  out[10] = '\0';
 8000722:	683b      	ldr	r3, [r7, #0]
 8000724:	330a      	adds	r3, #10
 8000726:	2200      	movs	r2, #0
 8000728:	701a      	strb	r2, [r3, #0]
  while (i >= 0){
 800072a:	e01b      	b.n	8000764 <int_str+0x50>

    uint8_t digit = value % 10;
 800072c:	6879      	ldr	r1, [r7, #4]
 800072e:	4b12      	ldr	r3, [pc, #72]	@ (8000778 <int_str+0x64>)
 8000730:	fba3 2301 	umull	r2, r3, r3, r1
 8000734:	08da      	lsrs	r2, r3, #3
 8000736:	4613      	mov	r3, r2
 8000738:	009b      	lsls	r3, r3, #2
 800073a:	4413      	add	r3, r2
 800073c:	005b      	lsls	r3, r3, #1
 800073e:	1aca      	subs	r2, r1, r3
 8000740:	4613      	mov	r3, r2
 8000742:	72fb      	strb	r3, [r7, #11]
    value /= 10;
 8000744:	687b      	ldr	r3, [r7, #4]
 8000746:	4a0c      	ldr	r2, [pc, #48]	@ (8000778 <int_str+0x64>)
 8000748:	fba2 2303 	umull	r2, r3, r2, r3
 800074c:	08db      	lsrs	r3, r3, #3
 800074e:	607b      	str	r3, [r7, #4]
    out[i--] = '0' + digit;
 8000750:	68fb      	ldr	r3, [r7, #12]
 8000752:	1e5a      	subs	r2, r3, #1
 8000754:	60fa      	str	r2, [r7, #12]
 8000756:	461a      	mov	r2, r3
 8000758:	683b      	ldr	r3, [r7, #0]
 800075a:	4413      	add	r3, r2
 800075c:	7afa      	ldrb	r2, [r7, #11]
 800075e:	3230      	adds	r2, #48	@ 0x30
 8000760:	b2d2      	uxtb	r2, r2
 8000762:	701a      	strb	r2, [r3, #0]
  while (i >= 0){
 8000764:	68fb      	ldr	r3, [r7, #12]
 8000766:	2b00      	cmp	r3, #0
 8000768:	dae0      	bge.n	800072c <int_str+0x18>
  }
}
 800076a:	bf00      	nop
 800076c:	bf00      	nop
 800076e:	3714      	adds	r7, #20
 8000770:	46bd      	mov	sp, r7
 8000772:	bc80      	pop	{r7}
 8000774:	4770      	bx	lr
 8000776:	bf00      	nop
 8000778:	cccccccd 	.word	0xcccccccd

0800077c <printf>:

void printf(const char *msg, ...) {
 800077c:	b40f      	push	{r0, r1, r2, r3}
 800077e:	b580      	push	{r7, lr}
 8000780:	f5ad 7d0a 	sub.w	sp, sp, #552	@ 0x228
 8000784:	af00      	add	r7, sp, #0
  va_list args;
  va_start (args, msg);
 8000786:	f507 730d 	add.w	r3, r7, #564	@ 0x234
 800078a:	f8c7 320c 	str.w	r3, [r7, #524]	@ 0x20c

  uint32_t size = strlen (msg);
 800078e:	f8d7 0230 	ldr.w	r0, [r7, #560]	@ 0x230
 8000792:	f7ff ff3d 	bl	8000610 <strlen>
 8000796:	f8c7 021c 	str.w	r0, [r7, #540]	@ 0x21c
  char __msg[MAX_STR_LENGTH];

  int msg_ind = 0;
 800079a:	2300      	movs	r3, #0
 800079c:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
  int __msg_ind = 0;
 80007a0:	2300      	movs	r3, #0
 80007a2:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
  while (msg_ind < size){
 80007a6:	e0a1      	b.n	80008ec <printf+0x170>
    if (msg[msg_ind] != '%'){
 80007a8:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80007ac:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 80007b0:	4413      	add	r3, r2
 80007b2:	781b      	ldrb	r3, [r3, #0]
 80007b4:	2b25      	cmp	r3, #37	@ 0x25
 80007b6:	d014      	beq.n	80007e2 <printf+0x66>
      __msg[__msg_ind++] = msg [msg_ind++];
 80007b8:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80007bc:	1c5a      	adds	r2, r3, #1
 80007be:	f8c7 2224 	str.w	r2, [r7, #548]	@ 0x224
 80007c2:	461a      	mov	r2, r3
 80007c4:	f8d7 3230 	ldr.w	r3, [r7, #560]	@ 0x230
 80007c8:	441a      	add	r2, r3
 80007ca:	f8d7 3220 	ldr.w	r3, [r7, #544]	@ 0x220
 80007ce:	1c59      	adds	r1, r3, #1
 80007d0:	f8c7 1220 	str.w	r1, [r7, #544]	@ 0x220
 80007d4:	7811      	ldrb	r1, [r2, #0]
 80007d6:	f507 720a 	add.w	r2, r7, #552	@ 0x228
 80007da:	f5a2 7204 	sub.w	r2, r2, #528	@ 0x210
 80007de:	54d1      	strb	r1, [r2, r3]
      continue;
 80007e0:	e084      	b.n	80008ec <printf+0x170>
    }
    
    // msg[msg_ind] == '%'
    if (msg_ind+1 >= size) break;
 80007e2:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80007e6:	3301      	adds	r3, #1
 80007e8:	461a      	mov	r2, r3
 80007ea:	f8d7 321c 	ldr.w	r3, [r7, #540]	@ 0x21c
 80007ee:	4293      	cmp	r3, r2
 80007f0:	f240 8084 	bls.w	80008fc <printf+0x180>
    if (msg[msg_ind+1] == 's'){
 80007f4:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80007f8:	3301      	adds	r3, #1
 80007fa:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 80007fe:	4413      	add	r3, r2
 8000800:	781b      	ldrb	r3, [r3, #0]
 8000802:	2b73      	cmp	r3, #115	@ 0x73
 8000804:	d11a      	bne.n	800083c <printf+0xc0>

      char* address = va_arg (args, char*);
 8000806:	f8d7 320c 	ldr.w	r3, [r7, #524]	@ 0x20c
 800080a:	1d1a      	adds	r2, r3, #4
 800080c:	f8c7 220c 	str.w	r2, [r7, #524]	@ 0x20c
 8000810:	681b      	ldr	r3, [r3, #0]
 8000812:	f8c7 3210 	str.w	r3, [r7, #528]	@ 0x210
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, address);
 8000816:	f8d7 1220 	ldr.w	r1, [r7, #544]	@ 0x220
 800081a:	f107 0018 	add.w	r0, r7, #24
 800081e:	f8d7 3210 	ldr.w	r3, [r7, #528]	@ 0x210
 8000822:	f44f 72fa 	mov.w	r2, #500	@ 0x1f4
 8000826:	f7ff ff0a 	bl	800063e <concat>
 800082a:	4603      	mov	r3, r0
 800082c:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
      msg_ind ++;
 8000830:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8000834:	3301      	adds	r3, #1
 8000836:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
 800083a:	e052      	b.n	80008e2 <printf+0x166>
    }
    else if (msg[msg_ind+1] == 'd'){
 800083c:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8000840:	3301      	adds	r3, #1
 8000842:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 8000846:	4413      	add	r3, r2
 8000848:	781b      	ldrb	r3, [r3, #0]
 800084a:	2b64      	cmp	r3, #100	@ 0x64
 800084c:	d121      	bne.n	8000892 <printf+0x116>

      char target [11];
      uint32_t value = va_arg (args, uint32_t);
 800084e:	f8d7 320c 	ldr.w	r3, [r7, #524]	@ 0x20c
 8000852:	1d1a      	adds	r2, r3, #4
 8000854:	f8c7 220c 	str.w	r2, [r7, #524]	@ 0x20c
 8000858:	681b      	ldr	r3, [r3, #0]
 800085a:	f8c7 3214 	str.w	r3, [r7, #532]	@ 0x214
      int_str (value, target);
 800085e:	f107 030c 	add.w	r3, r7, #12
 8000862:	4619      	mov	r1, r3
 8000864:	f8d7 0214 	ldr.w	r0, [r7, #532]	@ 0x214
 8000868:	f7ff ff54 	bl	8000714 <int_str>
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, target);
 800086c:	f8d7 1220 	ldr.w	r1, [r7, #544]	@ 0x220
 8000870:	f107 030c 	add.w	r3, r7, #12
 8000874:	f107 0018 	add.w	r0, r7, #24
 8000878:	f44f 72fa 	mov.w	r2, #500	@ 0x1f4
 800087c:	f7ff fedf 	bl	800063e <concat>
 8000880:	4603      	mov	r3, r0
 8000882:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
      msg_ind ++;
 8000886:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 800088a:	3301      	adds	r3, #1
 800088c:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
 8000890:	e027      	b.n	80008e2 <printf+0x166>
    }
    else if (msg[msg_ind+1] == 'x'){
 8000892:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8000896:	3301      	adds	r3, #1
 8000898:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 800089c:	4413      	add	r3, r2
 800089e:	781b      	ldrb	r3, [r3, #0]
 80008a0:	2b78      	cmp	r3, #120	@ 0x78
 80008a2:	d11e      	bne.n	80008e2 <printf+0x166>

      char target [11];
      uint32_t value = va_arg (args, uint32_t);
 80008a4:	f8d7 320c 	ldr.w	r3, [r7, #524]	@ 0x20c
 80008a8:	1d1a      	adds	r2, r3, #4
 80008aa:	f8c7 220c 	str.w	r2, [r7, #524]	@ 0x20c
 80008ae:	681b      	ldr	r3, [r3, #0]
 80008b0:	f8c7 3218 	str.w	r3, [r7, #536]	@ 0x218
      hex_str (value, target);
 80008b4:	463b      	mov	r3, r7
 80008b6:	4619      	mov	r1, r3
 80008b8:	f8d7 0218 	ldr.w	r0, [r7, #536]	@ 0x218
 80008bc:	f7ff fee7 	bl	800068e <hex_str>
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, target);
 80008c0:	f8d7 1220 	ldr.w	r1, [r7, #544]	@ 0x220
 80008c4:	463b      	mov	r3, r7
 80008c6:	f107 0018 	add.w	r0, r7, #24
 80008ca:	f44f 72fa 	mov.w	r2, #500	@ 0x1f4
 80008ce:	f7ff feb6 	bl	800063e <concat>
 80008d2:	4603      	mov	r3, r0
 80008d4:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
      msg_ind ++;
 80008d8:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80008dc:	3301      	adds	r3, #1
 80008de:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
    }
    msg_ind ++;
 80008e2:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80008e6:	3301      	adds	r3, #1
 80008e8:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
  while (msg_ind < size){
 80008ec:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80008f0:	f8d7 221c 	ldr.w	r2, [r7, #540]	@ 0x21c
 80008f4:	429a      	cmp	r2, r3
 80008f6:	f63f af57 	bhi.w	80007a8 <printf+0x2c>
 80008fa:	e000      	b.n	80008fe <printf+0x182>
    if (msg_ind+1 >= size) break;
 80008fc:	bf00      	nop

  }
  va_end (args);
  __msg[__msg_ind] = '\0';
 80008fe:	f507 730a 	add.w	r3, r7, #552	@ 0x228
 8000902:	f5a3 7204 	sub.w	r2, r3, #528	@ 0x210
 8000906:	f8d7 3220 	ldr.w	r3, [r7, #544]	@ 0x220
 800090a:	4413      	add	r3, r2
 800090c:	2200      	movs	r2, #0
 800090e:	701a      	strb	r2, [r3, #0]
  __usart1_print (__msg, strlen (__msg));
 8000910:	f107 0318 	add.w	r3, r7, #24
 8000914:	4618      	mov	r0, r3
 8000916:	f7ff fe7b 	bl	8000610 <strlen>
 800091a:	4602      	mov	r2, r0
 800091c:	f107 0318 	add.w	r3, r7, #24
 8000920:	4611      	mov	r1, r2
 8000922:	4618      	mov	r0, r3
 8000924:	f000 fa80 	bl	8000e28 <__usart1_print>

}
 8000928:	bf00      	nop
 800092a:	f507 770a 	add.w	r7, r7, #552	@ 0x228
 800092e:	46bd      	mov	sp, r7
 8000930:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
 8000934:	b004      	add	sp, #16
 8000936:	4770      	bx	lr

08000938 <enterCRITICAL>:


extern semaphore_t sem_usart1;
extern uint8_t process_count;

void enterCRITICAL(void) { __disable_irq(); }
 8000938:	b480      	push	{r7}
 800093a:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsid i" : : : "memory");
 800093c:	b672      	cpsid	i
}
 800093e:	bf00      	nop
 8000940:	bf00      	nop
 8000942:	46bd      	mov	sp, r7
 8000944:	bc80      	pop	{r7}
 8000946:	4770      	bx	lr

08000948 <exitCRITICAL>:

void exitCRITICAL(void) { __enable_irq(); }
 8000948:	b480      	push	{r7}
 800094a:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsie i" : : : "memory");
 800094c:	b662      	cpsie	i
}
 800094e:	bf00      	nop
 8000950:	bf00      	nop
 8000952:	46bd      	mov	sp, r7
 8000954:	bc80      	pop	{r7}
 8000956:	4770      	bx	lr

08000958 <syscall__printf>:

void syscall__printf(const char *msg, ...) {
 8000958:	b40f      	push	{r0, r1, r2, r3}
 800095a:	b580      	push	{r7, lr}
 800095c:	b082      	sub	sp, #8
 800095e:	af00      	add	r7, sp, #0
  semaphore_lock(&sem_usart1);
 8000960:	4809      	ldr	r0, [pc, #36]	@ (8000988 <syscall__printf+0x30>)
 8000962:	f7ff fdb7 	bl	80004d4 <semaphore_lock>
  
  // pass all the function parameter to printf ();

  va_list args;
  va_start (args, msg);
 8000966:	f107 0314 	add.w	r3, r7, #20
 800096a:	607b      	str	r3, [r7, #4]

  printf (msg, args);
 800096c:	6879      	ldr	r1, [r7, #4]
 800096e:	6938      	ldr	r0, [r7, #16]
 8000970:	f7ff ff04 	bl	800077c <printf>

  va_end(args);
  semaphore_unlock(&sem_usart1);
 8000974:	4804      	ldr	r0, [pc, #16]	@ (8000988 <syscall__printf+0x30>)
 8000976:	f7ff fdd7 	bl	8000528 <semaphore_unlock>
}
 800097a:	bf00      	nop
 800097c:	3708      	adds	r7, #8
 800097e:	46bd      	mov	sp, r7
 8000980:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
 8000984:	b004      	add	sp, #16
 8000986:	4770      	bx	lr
 8000988:	2000002c 	.word	0x2000002c

0800098c <syscall__scanf>:

void syscall__scanf(const char* msg, ...) {
 800098c:	b40f      	push	{r0, r1, r2, r3}
 800098e:	b480      	push	{r7}
 8000990:	af00      	add	r7, sp, #0

  while (1)
 8000992:	e7fe      	b.n	8000992 <syscall__scanf+0x6>

08000994 <syscall__process_exit>:
    ;
}

void syscall__process_exit (uint32_t status) {
 8000994:	b580      	push	{r7, lr}
 8000996:	b082      	sub	sp, #8
 8000998:	af00      	add	r7, sp, #0
 800099a:	6078      	str	r0, [r7, #4]
  process_exit (status);
 800099c:	6878      	ldr	r0, [r7, #4]
 800099e:	f000 f823 	bl	80009e8 <process_exit>
}
 80009a2:	bf00      	nop
 80009a4:	3708      	adds	r7, #8
 80009a6:	46bd      	mov	sp, r7
 80009a8:	bd80      	pop	{r7, pc}
 80009aa:	bf00      	nop

080009ac <__NVIC_SetPendingIRQ>:
{
 80009ac:	b480      	push	{r7}
 80009ae:	b083      	sub	sp, #12
 80009b0:	af00      	add	r7, sp, #0
 80009b2:	4603      	mov	r3, r0
 80009b4:	71fb      	strb	r3, [r7, #7]
  if ((int32_t)(IRQn) >= 0)
 80009b6:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80009ba:	2b00      	cmp	r3, #0
 80009bc:	db0c      	blt.n	80009d8 <__NVIC_SetPendingIRQ+0x2c>
    NVIC->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
 80009be:	79fb      	ldrb	r3, [r7, #7]
 80009c0:	f003 021f 	and.w	r2, r3, #31
 80009c4:	4907      	ldr	r1, [pc, #28]	@ (80009e4 <__NVIC_SetPendingIRQ+0x38>)
 80009c6:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80009ca:	095b      	lsrs	r3, r3, #5
 80009cc:	2001      	movs	r0, #1
 80009ce:	fa00 f202 	lsl.w	r2, r0, r2
 80009d2:	3340      	adds	r3, #64	@ 0x40
 80009d4:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
}
 80009d8:	bf00      	nop
 80009da:	370c      	adds	r7, #12
 80009dc:	46bd      	mov	sp, r7
 80009de:	bc80      	pop	{r7}
 80009e0:	4770      	bx	lr
 80009e2:	bf00      	nop
 80009e4:	e000e100 	.word	0xe000e100

080009e8 <process_exit>:
void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind);
void launch_process (void);


// if any of the process returns from mainx funcktion, this function wwill be called
void process_exit (uint32_t status) {
 80009e8:	b580      	push	{r7, lr}
 80009ea:	b084      	sub	sp, #16
 80009ec:	af00      	add	r7, sp, #0
 80009ee:	6078      	str	r0, [r7, #4]
  // do what ever you want with the status

  // i dont know why i was getting hardfault when using <*(user_process_t **) RUNNING_PROCESS_AD> T_T 
  // got it .. should have used () to enclosed the constant in define.h file !!!
  user_process_t *process = *(user_process_t **)(RUNNING_PROCESS_AD);
 80009f0:	4b0b      	ldr	r3, [pc, #44]	@ (8000a20 <process_exit+0x38>)
 80009f2:	681b      	ldr	r3, [r3, #0]
 80009f4:	60fb      	str	r3, [r7, #12]
  uint32_t process_id = process->process_id;
 80009f6:	68fb      	ldr	r3, [r7, #12]
 80009f8:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 80009fa:	60bb      	str	r3, [r7, #8]
  printf ("process with process id <%d> is terminated \n\r",
 80009fc:	f107 0308 	add.w	r3, r7, #8
 8000a00:	4619      	mov	r1, r3
 8000a02:	4808      	ldr	r0, [pc, #32]	@ (8000a24 <process_exit+0x3c>)
 8000a04:	f7ff feba 	bl	800077c <printf>
            (uint32_t)(&process_id));
  // remove the process from the queue , call context switching and return
  
  // suspend the process
  process -> state = SUSPEND_STATE;
 8000a08:	68fb      	ldr	r3, [r7, #12]
 8000a0a:	2202      	movs	r2, #2
 8000a0c:	62da      	str	r2, [r3, #44]	@ 0x2c
 
  // set the pendsv (to trigger context switching)
  NVIC_SetPendingIRQ (PendSV_IRQn);
 8000a0e:	f06f 0001 	mvn.w	r0, #1
 8000a12:	f7ff ffcb 	bl	80009ac <__NVIC_SetPendingIRQ>
}
 8000a16:	bf00      	nop
 8000a18:	3710      	adds	r7, #16
 8000a1a:	46bd      	mov	sp, r7
 8000a1c:	bd80      	pop	{r7, pc}
 8000a1e:	bf00      	nop
 8000a20:	20016004 	.word	0x20016004
 8000a24:	080011d8 	.word	0x080011d8

08000a28 <main>:

int main() {
 8000a28:	b580      	push	{r7, lr}
 8000a2a:	b086      	sub	sp, #24
 8000a2c:	af00      	add	r7, sp, #0

    SCB->SHP[10] = 0xff;    // set the PendSV to be the lowest priority...
 8000a2e:	4b53      	ldr	r3, [pc, #332]	@ (8000b7c <main+0x154>)
 8000a30:	22ff      	movs	r2, #255	@ 0xff
 8000a32:	f883 2022 	strb.w	r2, [r3, #34]	@ 0x22

    /* some init code */
    __usart1_init ();
 8000a36:	f000 f9b5 	bl	8000da4 <__usart1_init>
    queue_init (&ready_queue);
 8000a3a:	4851      	ldr	r0, [pc, #324]	@ (8000b80 <main+0x158>)
 8000a3c:	f7ff fc4e 	bl	80002dc <queue_init>
    semaphore_init (&sem_usart1, 1);
 8000a40:	2101      	movs	r1, #1
 8000a42:	4850      	ldr	r0, [pc, #320]	@ (8000b84 <main+0x15c>)
 8000a44:	f7ff fd34 	bl	80004b0 <semaphore_init>

    if (process_count < 1 || process_count > MAX_PROCESS_NUM){
 8000a48:	4b4f      	ldr	r3, [pc, #316]	@ (8000b88 <main+0x160>)
 8000a4a:	781b      	ldrb	r3, [r3, #0]
 8000a4c:	2b00      	cmp	r3, #0
 8000a4e:	d003      	beq.n	8000a58 <main+0x30>
 8000a50:	4b4d      	ldr	r3, [pc, #308]	@ (8000b88 <main+0x160>)
 8000a52:	781b      	ldrb	r3, [r3, #0]
 8000a54:	2b0f      	cmp	r3, #15
 8000a56:	d903      	bls.n	8000a60 <main+0x38>
        printf ("ERROR in the number of process ....\n\r");
 8000a58:	484c      	ldr	r0, [pc, #304]	@ (8000b8c <main+0x164>)
 8000a5a:	f7ff fe8f 	bl	800077c <printf>
        while (1);
 8000a5e:	e7fe      	b.n	8000a5e <main+0x36>
    }

    /******************** fault handler init ***************************/
    
    // enable faults (without this any fault = hardfault)
    SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;
 8000a60:	4b46      	ldr	r3, [pc, #280]	@ (8000b7c <main+0x154>)
 8000a62:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000a64:	4a45      	ldr	r2, [pc, #276]	@ (8000b7c <main+0x154>)
 8000a66:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
 8000a6a:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;
 8000a6c:	4b43      	ldr	r3, [pc, #268]	@ (8000b7c <main+0x154>)
 8000a6e:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000a70:	4a42      	ldr	r2, [pc, #264]	@ (8000b7c <main+0x154>)
 8000a72:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
 8000a76:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;
 8000a78:	4b40      	ldr	r3, [pc, #256]	@ (8000b7c <main+0x154>)
 8000a7a:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000a7c:	4a3f      	ldr	r2, [pc, #252]	@ (8000b7c <main+0x154>)
 8000a7e:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 8000a82:	6253      	str	r3, [r2, #36]	@ 0x24



    /* init syscall table */
    Syscall_Table[0] =  (void (*) (void))syscall__printf;
 8000a84:	4b42      	ldr	r3, [pc, #264]	@ (8000b90 <main+0x168>)
 8000a86:	4a43      	ldr	r2, [pc, #268]	@ (8000b94 <main+0x16c>)
 8000a88:	601a      	str	r2, [r3, #0]
    Syscall_Table[1] =  (void (*) (void))syscall__scanf;
 8000a8a:	4b41      	ldr	r3, [pc, #260]	@ (8000b90 <main+0x168>)
 8000a8c:	4a42      	ldr	r2, [pc, #264]	@ (8000b98 <main+0x170>)
 8000a8e:	605a      	str	r2, [r3, #4]
    Syscall_Table[2] =  (void (*) (void))syscall__process_exit;
 8000a90:	4b3f      	ldr	r3, [pc, #252]	@ (8000b90 <main+0x168>)
 8000a92:	4a42      	ldr	r2, [pc, #264]	@ (8000b9c <main+0x174>)
 8000a94:	609a      	str	r2, [r3, #8]

    *(uint32_t *)(SYSCALL_TABLE_AD) = (uint32_t)(Syscall_Table);
 8000a96:	4b42      	ldr	r3, [pc, #264]	@ (8000ba0 <main+0x178>)
 8000a98:	4a3d      	ldr	r2, [pc, #244]	@ (8000b90 <main+0x168>)
 8000a9a:	601a      	str	r2, [r3, #0]
    
    uint32_t psp_val = USER_STACK_INIT;
 8000a9c:	4b41      	ldr	r3, [pc, #260]	@ (8000ba4 <main+0x17c>)
 8000a9e:	617b      	str	r3, [r7, #20]
    uint32_t msp_val = KERNEL_STACK_INIT;
 8000aa0:	4b41      	ldr	r3, [pc, #260]	@ (8000ba8 <main+0x180>)
 8000aa2:	613b      	str	r3, [r7, #16]
    uint32_t user_stack_size = USER_STACK_SIZE / process_count;
 8000aa4:	4b38      	ldr	r3, [pc, #224]	@ (8000b88 <main+0x160>)
 8000aa6:	781b      	ldrb	r3, [r3, #0]
 8000aa8:	461a      	mov	r2, r3
 8000aaa:	f44f 4300 	mov.w	r3, #32768	@ 0x8000
 8000aae:	fb93 f3f2 	sdiv	r3, r3, r2
 8000ab2:	60bb      	str	r3, [r7, #8]
    uint32_t kernel_stack_size = KERNEL_STACK_SIZE / process_count;
 8000ab4:	4b34      	ldr	r3, [pc, #208]	@ (8000b88 <main+0x160>)
 8000ab6:	781b      	ldrb	r3, [r3, #0]
 8000ab8:	461a      	mov	r2, r3
 8000aba:	f44f 43c0 	mov.w	r3, #24576	@ 0x6000
 8000abe:	fb93 f3f2 	sdiv	r3, r3, r2
 8000ac2:	607b      	str	r3, [r7, #4]

    /* fill the pcs */
    process_pc [0] = main1;
 8000ac4:	4b39      	ldr	r3, [pc, #228]	@ (8000bac <main+0x184>)
 8000ac6:	4a3a      	ldr	r2, [pc, #232]	@ (8000bb0 <main+0x188>)
 8000ac8:	601a      	str	r2, [r3, #0]
    process_pc [1] = main2;
 8000aca:	4b38      	ldr	r3, [pc, #224]	@ (8000bac <main+0x184>)
 8000acc:	4a39      	ldr	r2, [pc, #228]	@ (8000bb4 <main+0x18c>)
 8000ace:	605a      	str	r2, [r3, #4]
    process_pc [2] = main3;
 8000ad0:	4b36      	ldr	r3, [pc, #216]	@ (8000bac <main+0x184>)
 8000ad2:	4a39      	ldr	r2, [pc, #228]	@ (8000bb8 <main+0x190>)
 8000ad4:	609a      	str	r2, [r3, #8]
    process_pc [3] = main4;
 8000ad6:	4b35      	ldr	r3, [pc, #212]	@ (8000bac <main+0x184>)
 8000ad8:	4a38      	ldr	r2, [pc, #224]	@ (8000bbc <main+0x194>)
 8000ada:	60da      	str	r2, [r3, #12]
    process_pc [4] = main5;
 8000adc:	4b33      	ldr	r3, [pc, #204]	@ (8000bac <main+0x184>)
 8000ade:	4a38      	ldr	r2, [pc, #224]	@ (8000bc0 <main+0x198>)
 8000ae0:	611a      	str	r2, [r3, #16]
    process_pc [5] = main6;
 8000ae2:	4b32      	ldr	r3, [pc, #200]	@ (8000bac <main+0x184>)
 8000ae4:	4a37      	ldr	r2, [pc, #220]	@ (8000bc4 <main+0x19c>)
 8000ae6:	615a      	str	r2, [r3, #20]
    process_pc [6] = main7;
 8000ae8:	4b30      	ldr	r3, [pc, #192]	@ (8000bac <main+0x184>)
 8000aea:	4a37      	ldr	r2, [pc, #220]	@ (8000bc8 <main+0x1a0>)
 8000aec:	619a      	str	r2, [r3, #24]
    process_pc [7] = main8;
 8000aee:	4b2f      	ldr	r3, [pc, #188]	@ (8000bac <main+0x184>)
 8000af0:	4a36      	ldr	r2, [pc, #216]	@ (8000bcc <main+0x1a4>)
 8000af2:	61da      	str	r2, [r3, #28]
    process_pc [8] = main9;
 8000af4:	4b2d      	ldr	r3, [pc, #180]	@ (8000bac <main+0x184>)
 8000af6:	4a36      	ldr	r2, [pc, #216]	@ (8000bd0 <main+0x1a8>)
 8000af8:	621a      	str	r2, [r3, #32]
    process_pc [9] = main10;
 8000afa:	4b2c      	ldr	r3, [pc, #176]	@ (8000bac <main+0x184>)
 8000afc:	4a35      	ldr	r2, [pc, #212]	@ (8000bd4 <main+0x1ac>)
 8000afe:	625a      	str	r2, [r3, #36]	@ 0x24
    process_pc [10] = main11;
 8000b00:	4b2a      	ldr	r3, [pc, #168]	@ (8000bac <main+0x184>)
 8000b02:	4a35      	ldr	r2, [pc, #212]	@ (8000bd8 <main+0x1b0>)
 8000b04:	629a      	str	r2, [r3, #40]	@ 0x28
    process_pc [11] = main12;
 8000b06:	4b29      	ldr	r3, [pc, #164]	@ (8000bac <main+0x184>)
 8000b08:	4a34      	ldr	r2, [pc, #208]	@ (8000bdc <main+0x1b4>)
 8000b0a:	62da      	str	r2, [r3, #44]	@ 0x2c
    process_pc [12] = main13;
 8000b0c:	4b27      	ldr	r3, [pc, #156]	@ (8000bac <main+0x184>)
 8000b0e:	4a34      	ldr	r2, [pc, #208]	@ (8000be0 <main+0x1b8>)
 8000b10:	631a      	str	r2, [r3, #48]	@ 0x30
    process_pc [13] = main14;
 8000b12:	4b26      	ldr	r3, [pc, #152]	@ (8000bac <main+0x184>)
 8000b14:	4a33      	ldr	r2, [pc, #204]	@ (8000be4 <main+0x1bc>)
 8000b16:	635a      	str	r2, [r3, #52]	@ 0x34
    process_pc [14] = main15;
 8000b18:	4b24      	ldr	r3, [pc, #144]	@ (8000bac <main+0x184>)
 8000b1a:	4a33      	ldr	r2, [pc, #204]	@ (8000be8 <main+0x1c0>)
 8000b1c:	639a      	str	r2, [r3, #56]	@ 0x38

    for (uint8_t i=0; i<process_count; i++){
 8000b1e:	2300      	movs	r3, #0
 8000b20:	73fb      	strb	r3, [r7, #15]
 8000b22:	e01d      	b.n	8000b60 <main+0x138>
        make_process (&process[i], psp_val, msp_val, i);
 8000b24:	7bfb      	ldrb	r3, [r7, #15]
 8000b26:	2234      	movs	r2, #52	@ 0x34
 8000b28:	fb02 f303 	mul.w	r3, r2, r3
 8000b2c:	4a2f      	ldr	r2, [pc, #188]	@ (8000bec <main+0x1c4>)
 8000b2e:	1898      	adds	r0, r3, r2
 8000b30:	7bfb      	ldrb	r3, [r7, #15]
 8000b32:	693a      	ldr	r2, [r7, #16]
 8000b34:	6979      	ldr	r1, [r7, #20]
 8000b36:	f000 f85d 	bl	8000bf4 <make_process>
        psp_val -= user_stack_size;
 8000b3a:	697a      	ldr	r2, [r7, #20]
 8000b3c:	68bb      	ldr	r3, [r7, #8]
 8000b3e:	1ad3      	subs	r3, r2, r3
 8000b40:	617b      	str	r3, [r7, #20]
        msp_val -= kernel_stack_size;
 8000b42:	693a      	ldr	r2, [r7, #16]
 8000b44:	687b      	ldr	r3, [r7, #4]
 8000b46:	1ad3      	subs	r3, r2, r3
 8000b48:	613b      	str	r3, [r7, #16]
        /* make stack pointers word aligned */
        psp_val &= ~(3);
 8000b4a:	697b      	ldr	r3, [r7, #20]
 8000b4c:	f023 0303 	bic.w	r3, r3, #3
 8000b50:	617b      	str	r3, [r7, #20]
        msp_val &= ~(3);
 8000b52:	693b      	ldr	r3, [r7, #16]
 8000b54:	f023 0303 	bic.w	r3, r3, #3
 8000b58:	613b      	str	r3, [r7, #16]
    for (uint8_t i=0; i<process_count; i++){
 8000b5a:	7bfb      	ldrb	r3, [r7, #15]
 8000b5c:	3301      	adds	r3, #1
 8000b5e:	73fb      	strb	r3, [r7, #15]
 8000b60:	4b09      	ldr	r3, [pc, #36]	@ (8000b88 <main+0x160>)
 8000b62:	781b      	ldrb	r3, [r3, #0]
 8000b64:	7bfa      	ldrb	r2, [r7, #15]
 8000b66:	429a      	cmp	r2, r3
 8000b68:	d3dc      	bcc.n	8000b24 <main+0xfc>
 
    /* accessing illegal address in kernel code -> Kernel Panic*/
//    *(uint32_t*) (0xffffffff) = 5;

    /*impose user restriction*/
    mpu_setup ();
 8000b6a:	f7ff fb83 	bl	8000274 <mpu_setup>

    /* start the processes */
    launch_process();
 8000b6e:	f000 f8bd 	bl	8000cec <launch_process>
    // TODO
    // transfer the control to this section from user space if there is no process to be run


    // if all the processes are done
    printf ("all the processes are done executing \n\r");
 8000b72:	481f      	ldr	r0, [pc, #124]	@ (8000bf0 <main+0x1c8>)
 8000b74:	f7ff fe02 	bl	800077c <printf>
    while (1);
 8000b78:	e7fe      	b.n	8000b78 <main+0x150>
 8000b7a:	bf00      	nop
 8000b7c:	e000ed00 	.word	0xe000ed00
 8000b80:	200003f4 	.word	0x200003f4
 8000b84:	2000002c 	.word	0x2000002c
 8000b88:	20000000 	.word	0x20000000
 8000b8c:	08001208 	.word	0x08001208
 8000b90:	20000004 	.word	0x20000004
 8000b94:	08000959 	.word	0x08000959
 8000b98:	0800098d 	.word	0x0800098d
 8000b9c:	08000995 	.word	0x08000995
 8000ba0:	2001600c 	.word	0x2001600c
 8000ba4:	20010000 	.word	0x20010000
 8000ba8:	20016000 	.word	0x20016000
 8000bac:	200003b8 	.word	0x200003b8
 8000bb0:	08010279 	.word	0x08010279
 8000bb4:	08010109 	.word	0x08010109
 8000bb8:	08010135 	.word	0x08010135
 8000bbc:	08010171 	.word	0x08010171
 8000bc0:	0801019d 	.word	0x0801019d
 8000bc4:	080101c9 	.word	0x080101c9
 8000bc8:	080101f5 	.word	0x080101f5
 8000bcc:	08010221 	.word	0x08010221
 8000bd0:	0801024d 	.word	0x0801024d
 8000bd4:	08010001 	.word	0x08010001
 8000bd8:	0801002d 	.word	0x0801002d
 8000bdc:	08010059 	.word	0x08010059
 8000be0:	08010085 	.word	0x08010085
 8000be4:	080100b1 	.word	0x080100b1
 8000be8:	080100dd 	.word	0x080100dd
 8000bec:	200000ac 	.word	0x200000ac
 8000bf0:	08001230 	.word	0x08001230

08000bf4 <make_process>:
}

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t process_id){
 8000bf4:	b480      	push	{r7}
 8000bf6:	b087      	sub	sp, #28
 8000bf8:	af00      	add	r7, sp, #0
 8000bfa:	60f8      	str	r0, [r7, #12]
 8000bfc:	60b9      	str	r1, [r7, #8]
 8000bfe:	607a      	str	r2, [r7, #4]
 8000c00:	70fb      	strb	r3, [r7, #3]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;
 8000c02:	68fb      	ldr	r3, [r7, #12]
 8000c04:	2200      	movs	r2, #0
 8000c06:	61da      	str	r2, [r3, #28]
 8000c08:	68fb      	ldr	r3, [r7, #12]
 8000c0a:	69da      	ldr	r2, [r3, #28]
 8000c0c:	68fb      	ldr	r3, [r7, #12]
 8000c0e:	619a      	str	r2, [r3, #24]
 8000c10:	68fb      	ldr	r3, [r7, #12]
 8000c12:	699a      	ldr	r2, [r3, #24]
 8000c14:	68fb      	ldr	r3, [r7, #12]
 8000c16:	615a      	str	r2, [r3, #20]
 8000c18:	68fb      	ldr	r3, [r7, #12]
 8000c1a:	695a      	ldr	r2, [r3, #20]
 8000c1c:	68fb      	ldr	r3, [r7, #12]
 8000c1e:	611a      	str	r2, [r3, #16]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
 8000c20:	68fb      	ldr	r3, [r7, #12]
 8000c22:	691a      	ldr	r2, [r3, #16]
 8000c24:	68fb      	ldr	r3, [r7, #12]
 8000c26:	60da      	str	r2, [r3, #12]
 8000c28:	68fb      	ldr	r3, [r7, #12]
 8000c2a:	68da      	ldr	r2, [r3, #12]
 8000c2c:	68fb      	ldr	r3, [r7, #12]
 8000c2e:	609a      	str	r2, [r3, #8]
 8000c30:	68fb      	ldr	r3, [r7, #12]
 8000c32:	689a      	ldr	r2, [r3, #8]
 8000c34:	68fb      	ldr	r3, [r7, #12]
 8000c36:	605a      	str	r2, [r3, #4]
 8000c38:	68fb      	ldr	r3, [r7, #12]
 8000c3a:	685a      	ldr	r2, [r3, #4]
 8000c3c:	68fb      	ldr	r3, [r7, #12]
 8000c3e:	601a      	str	r2, [r3, #0]

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;
 8000c40:	68fb      	ldr	r3, [r7, #12]
 8000c42:	f06f 0202 	mvn.w	r2, #2
 8000c46:	629a      	str	r2, [r3, #40]	@ 0x28



    //process->pc = (uint32_t) fun;
    process->psp = psp;
 8000c48:	68fb      	ldr	r3, [r7, #12]
 8000c4a:	68ba      	ldr	r2, [r7, #8]
 8000c4c:	621a      	str	r2, [r3, #32]
    process->msp = msp;
 8000c4e:	68fb      	ldr	r3, [r7, #12]
 8000c50:	687a      	ldr	r2, [r7, #4]
 8000c52:	625a      	str	r2, [r3, #36]	@ 0x24
    process->psp -= 8*4;        // start from 8 word below the base of the stack
 8000c54:	68fb      	ldr	r3, [r7, #12]
 8000c56:	6a1b      	ldr	r3, [r3, #32]
 8000c58:	f1a3 0220 	sub.w	r2, r3, #32
 8000c5c:	68fb      	ldr	r3, [r7, #12]
 8000c5e:	621a      	str	r2, [r3, #32]
    represent thumb state 
    */

    // put the lr value in stack if you want to be able to return from the user process
  
    for (int i=0; i<8; i++){
 8000c60:	2300      	movs	r3, #0
 8000c62:	617b      	str	r3, [r7, #20]
 8000c64:	e032      	b.n	8000ccc <make_process+0xd8>
        if (i == 5) {
 8000c66:	697b      	ldr	r3, [r7, #20]
 8000c68:	2b05      	cmp	r3, #5
 8000c6a:	d108      	bne.n	8000c7e <make_process+0x8a>
          *(uint32_t *)(process->psp+i*4) = (uint32_t ) user_process_exit;
 8000c6c:	68fb      	ldr	r3, [r7, #12]
 8000c6e:	6a1b      	ldr	r3, [r3, #32]
 8000c70:	697a      	ldr	r2, [r7, #20]
 8000c72:	0092      	lsls	r2, r2, #2
 8000c74:	4413      	add	r3, r2
 8000c76:	461a      	mov	r2, r3
 8000c78:	4b1a      	ldr	r3, [pc, #104]	@ (8000ce4 <make_process+0xf0>)
 8000c7a:	6013      	str	r3, [r2, #0]
 8000c7c:	e023      	b.n	8000cc6 <make_process+0xd2>
        }
        else if (i == 6)
 8000c7e:	697b      	ldr	r3, [r7, #20]
 8000c80:	2b06      	cmp	r3, #6
 8000c82:	d10b      	bne.n	8000c9c <make_process+0xa8>
            *(uint32_t *)(process->psp+i*4) =
                    (uint32_t) process_pc [process_id];
 8000c84:	78fb      	ldrb	r3, [r7, #3]
 8000c86:	4a18      	ldr	r2, [pc, #96]	@ (8000ce8 <make_process+0xf4>)
 8000c88:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
            *(uint32_t *)(process->psp+i*4) =
 8000c8c:	68fb      	ldr	r3, [r7, #12]
 8000c8e:	6a1b      	ldr	r3, [r3, #32]
 8000c90:	697a      	ldr	r2, [r7, #20]
 8000c92:	0092      	lsls	r2, r2, #2
 8000c94:	4413      	add	r3, r2
                    (uint32_t) process_pc [process_id];
 8000c96:	460a      	mov	r2, r1
            *(uint32_t *)(process->psp+i*4) =
 8000c98:	601a      	str	r2, [r3, #0]
 8000c9a:	e014      	b.n	8000cc6 <make_process+0xd2>
        else if (i == 7)
 8000c9c:	697b      	ldr	r3, [r7, #20]
 8000c9e:	2b07      	cmp	r3, #7
 8000ca0:	d109      	bne.n	8000cb6 <make_process+0xc2>
            *(uint32_t *)(process->psp+i*4) = 0x01000000;
 8000ca2:	68fb      	ldr	r3, [r7, #12]
 8000ca4:	6a1b      	ldr	r3, [r3, #32]
 8000ca6:	697a      	ldr	r2, [r7, #20]
 8000ca8:	0092      	lsls	r2, r2, #2
 8000caa:	4413      	add	r3, r2
 8000cac:	461a      	mov	r2, r3
 8000cae:	f04f 7380 	mov.w	r3, #16777216	@ 0x1000000
 8000cb2:	6013      	str	r3, [r2, #0]
 8000cb4:	e007      	b.n	8000cc6 <make_process+0xd2>
        else 
            *(uint32_t *)(process->psp+i*4) = 0x0;
 8000cb6:	68fb      	ldr	r3, [r7, #12]
 8000cb8:	6a1b      	ldr	r3, [r3, #32]
 8000cba:	697a      	ldr	r2, [r7, #20]
 8000cbc:	0092      	lsls	r2, r2, #2
 8000cbe:	4413      	add	r3, r2
 8000cc0:	461a      	mov	r2, r3
 8000cc2:	2300      	movs	r3, #0
 8000cc4:	6013      	str	r3, [r2, #0]
    for (int i=0; i<8; i++){
 8000cc6:	697b      	ldr	r3, [r7, #20]
 8000cc8:	3301      	adds	r3, #1
 8000cca:	617b      	str	r3, [r7, #20]
 8000ccc:	697b      	ldr	r3, [r7, #20]
 8000cce:	2b07      	cmp	r3, #7
 8000cd0:	ddc9      	ble.n	8000c66 <make_process+0x72>
    }
    
    process-> process_id = process_id;
 8000cd2:	78fa      	ldrb	r2, [r7, #3]
 8000cd4:	68fb      	ldr	r3, [r7, #12]
 8000cd6:	631a      	str	r2, [r3, #48]	@ 0x30

}
 8000cd8:	bf00      	nop
 8000cda:	371c      	adds	r7, #28
 8000cdc:	46bd      	mov	sp, r7
 8000cde:	bc80      	pop	{r7}
 8000ce0:	4770      	bx	lr
 8000ce2:	bf00      	nop
 8000ce4:	080102b9 	.word	0x080102b9
 8000ce8:	200003b8 	.word	0x200003b8

08000cec <launch_process>:

void  launch_process (void){
 8000cec:	b580      	push	{r7, lr}
 8000cee:	b082      	sub	sp, #8
 8000cf0:	af00      	add	r7, sp, #0
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process[0].psp);
 8000cf2:	4b27      	ldr	r3, [pc, #156]	@ (8000d90 <launch_process+0xa4>)
 8000cf4:	6a1b      	ldr	r3, [r3, #32]
 8000cf6:	4618      	mov	r0, r3
 8000cf8:	f000 f8c8 	bl	8000e8c <__asm__set_psp>
    __asm__set_msp (process[0].msp);
 8000cfc:	4b24      	ldr	r3, [pc, #144]	@ (8000d90 <launch_process+0xa4>)
 8000cfe:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000d00:	4618      	mov	r0, r3
 8000d02:	f000 f8c6 	bl	8000e92 <__asm__set_msp>
       

    SysTick->LOAD = 16000 - 1;
 8000d06:	4b23      	ldr	r3, [pc, #140]	@ (8000d94 <launch_process+0xa8>)
 8000d08:	f643 627f 	movw	r2, #15999	@ 0x3e7f
 8000d0c:	605a      	str	r2, [r3, #4]
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
 8000d0e:	4b21      	ldr	r3, [pc, #132]	@ (8000d94 <launch_process+0xa8>)
 8000d10:	681b      	ldr	r3, [r3, #0]
 8000d12:	4a20      	ldr	r2, [pc, #128]	@ (8000d94 <launch_process+0xa8>)
 8000d14:	f043 0307 	orr.w	r3, r3, #7
 8000d18:	6013      	str	r3, [r2, #0]
            | SysTick_CTRL_ENABLE_Msk);

    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process[0]);
 8000d1a:	4b1f      	ldr	r3, [pc, #124]	@ (8000d98 <launch_process+0xac>)
 8000d1c:	4a1c      	ldr	r2, [pc, #112]	@ (8000d90 <launch_process+0xa4>)
 8000d1e:	601a      	str	r2, [r3, #0]

    /* initially all the processes will be placed in the ready queue except the first one (entry point) */
    for (uint8_t i=1; i<process_count; i++){
 8000d20:	2301      	movs	r3, #1
 8000d22:	71fb      	strb	r3, [r7, #7]
 8000d24:	e012      	b.n	8000d4c <launch_process+0x60>
        int status = queue_push (&ready_queue, &process[i]);
 8000d26:	79fb      	ldrb	r3, [r7, #7]
 8000d28:	2234      	movs	r2, #52	@ 0x34
 8000d2a:	fb02 f303 	mul.w	r3, r2, r3
 8000d2e:	4a18      	ldr	r2, [pc, #96]	@ (8000d90 <launch_process+0xa4>)
 8000d30:	4413      	add	r3, r2
 8000d32:	4619      	mov	r1, r3
 8000d34:	4819      	ldr	r0, [pc, #100]	@ (8000d9c <launch_process+0xb0>)
 8000d36:	f7ff fae6 	bl	8000306 <queue_push>
 8000d3a:	4603      	mov	r3, r0
 8000d3c:	603b      	str	r3, [r7, #0]
        if (status){
 8000d3e:	683b      	ldr	r3, [r7, #0]
 8000d40:	2b00      	cmp	r3, #0
 8000d42:	d000      	beq.n	8000d46 <launch_process+0x5a>
            while (1);
 8000d44:	e7fe      	b.n	8000d44 <launch_process+0x58>
    for (uint8_t i=1; i<process_count; i++){
 8000d46:	79fb      	ldrb	r3, [r7, #7]
 8000d48:	3301      	adds	r3, #1
 8000d4a:	71fb      	strb	r3, [r7, #7]
 8000d4c:	4b14      	ldr	r3, [pc, #80]	@ (8000da0 <launch_process+0xb4>)
 8000d4e:	781b      	ldrb	r3, [r3, #0]
 8000d50:	79fa      	ldrb	r2, [r7, #7]
 8000d52:	429a      	cmp	r2, r3
 8000d54:	d3e7      	bcc.n	8000d26 <launch_process+0x3a>
        }
    }

    process[0].state = RUNNING_STATE;
 8000d56:	4b0e      	ldr	r3, [pc, #56]	@ (8000d90 <launch_process+0xa4>)
 8000d58:	2201      	movs	r2, #1
 8000d5a:	62da      	str	r2, [r3, #44]	@ 0x2c
    for (uint8_t i=1; i<process_count; i++){
 8000d5c:	2301      	movs	r3, #1
 8000d5e:	71bb      	strb	r3, [r7, #6]
 8000d60:	e00b      	b.n	8000d7a <launch_process+0x8e>
        process[i].state = READY_STATE;
 8000d62:	79bb      	ldrb	r3, [r7, #6]
 8000d64:	4a0a      	ldr	r2, [pc, #40]	@ (8000d90 <launch_process+0xa4>)
 8000d66:	2134      	movs	r1, #52	@ 0x34
 8000d68:	fb01 f303 	mul.w	r3, r1, r3
 8000d6c:	4413      	add	r3, r2
 8000d6e:	332c      	adds	r3, #44	@ 0x2c
 8000d70:	2200      	movs	r2, #0
 8000d72:	601a      	str	r2, [r3, #0]
    for (uint8_t i=1; i<process_count; i++){
 8000d74:	79bb      	ldrb	r3, [r7, #6]
 8000d76:	3301      	adds	r3, #1
 8000d78:	71bb      	strb	r3, [r7, #6]
 8000d7a:	4b09      	ldr	r3, [pc, #36]	@ (8000da0 <launch_process+0xb4>)
 8000d7c:	781b      	ldrb	r3, [r3, #0]
 8000d7e:	79ba      	ldrb	r2, [r7, #6]
 8000d80:	429a      	cmp	r2, r3
 8000d82:	d3ee      	bcc.n	8000d62 <launch_process+0x76>
    }
 
    __asm__launch_main1();
 8000d84:	f00f fa8e 	bl	80102a4 <__asm__launch_main1>

}
 8000d88:	bf00      	nop
 8000d8a:	3708      	adds	r7, #8
 8000d8c:	46bd      	mov	sp, r7
 8000d8e:	bd80      	pop	{r7, pc}
 8000d90:	200000ac 	.word	0x200000ac
 8000d94:	e000e010 	.word	0xe000e010
 8000d98:	20016004 	.word	0x20016004
 8000d9c:	200003f4 	.word	0x200003f4
 8000da0:	20000000 	.word	0x20000000

08000da4 <__usart1_init>:
#include "core.h"
#include "usart.h"

void __usart1_init(void) {
 8000da4:	b480      	push	{r7}
 8000da6:	af00      	add	r7, sp, #0

  RCC->APB2ENR |= RCC_APB2ENR_USART1EN_Msk;
 8000da8:	4b1c      	ldr	r3, [pc, #112]	@ (8000e1c <__usart1_init+0x78>)
 8000daa:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 8000dac:	4a1b      	ldr	r2, [pc, #108]	@ (8000e1c <__usart1_init+0x78>)
 8000dae:	f043 0310 	orr.w	r3, r3, #16
 8000db2:	6453      	str	r3, [r2, #68]	@ 0x44
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
 8000db4:	4b19      	ldr	r3, [pc, #100]	@ (8000e1c <__usart1_init+0x78>)
 8000db6:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8000db8:	4a18      	ldr	r2, [pc, #96]	@ (8000e1c <__usart1_init+0x78>)
 8000dba:	f043 0301 	orr.w	r3, r3, #1
 8000dbe:	6313      	str	r3, [r2, #48]	@ 0x30
  // alternate function mode
  GPIOA->MODER &= ~((3 << (2 * TX_PIN)) | (3 << (2 * RX_PIN)));
 8000dc0:	4b17      	ldr	r3, [pc, #92]	@ (8000e20 <__usart1_init+0x7c>)
 8000dc2:	681b      	ldr	r3, [r3, #0]
 8000dc4:	4a16      	ldr	r2, [pc, #88]	@ (8000e20 <__usart1_init+0x7c>)
 8000dc6:	f423 1370 	bic.w	r3, r3, #3932160	@ 0x3c0000
 8000dca:	6013      	str	r3, [r2, #0]
  GPIOA->MODER |= 2 << (2 * TX_PIN) | 2 << (2 * RX_PIN);
 8000dcc:	4b14      	ldr	r3, [pc, #80]	@ (8000e20 <__usart1_init+0x7c>)
 8000dce:	681b      	ldr	r3, [r3, #0]
 8000dd0:	4a13      	ldr	r2, [pc, #76]	@ (8000e20 <__usart1_init+0x7c>)
 8000dd2:	f443 1320 	orr.w	r3, r3, #2621440	@ 0x280000
 8000dd6:	6013      	str	r3, [r2, #0]
  // high speed
  GPIOA->OSPEEDR |= (3 << (TX_PIN * 2)) | (3 << (RX_PIN * 2));
 8000dd8:	4b11      	ldr	r3, [pc, #68]	@ (8000e20 <__usart1_init+0x7c>)
 8000dda:	689b      	ldr	r3, [r3, #8]
 8000ddc:	4a10      	ldr	r2, [pc, #64]	@ (8000e20 <__usart1_init+0x7c>)
 8000dde:	f443 1370 	orr.w	r3, r3, #3932160	@ 0x3c0000
 8000de2:	6093      	str	r3, [r2, #8]
  // clear the bits in AFR register
  GPIOA->AFR[1] &= ~((0xf << 4) | (0xf << 8));
 8000de4:	4b0e      	ldr	r3, [pc, #56]	@ (8000e20 <__usart1_init+0x7c>)
 8000de6:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000de8:	4a0d      	ldr	r2, [pc, #52]	@ (8000e20 <__usart1_init+0x7c>)
 8000dea:	f423 637f 	bic.w	r3, r3, #4080	@ 0xff0
 8000dee:	6253      	str	r3, [r2, #36]	@ 0x24
  // set for af7
  GPIOA->AFR[1] |= (7 << 4) | (7 << 8);
 8000df0:	4b0b      	ldr	r3, [pc, #44]	@ (8000e20 <__usart1_init+0x7c>)
 8000df2:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000df4:	4a0a      	ldr	r2, [pc, #40]	@ (8000e20 <__usart1_init+0x7c>)
 8000df6:	f443 63ee 	orr.w	r3, r3, #1904	@ 0x770
 8000dfa:	6253      	str	r3, [r2, #36]	@ 0x24

  // enable usart, reciever, transiever
  USART1->CR1 |= USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
 8000dfc:	4b09      	ldr	r3, [pc, #36]	@ (8000e24 <__usart1_init+0x80>)
 8000dfe:	68db      	ldr	r3, [r3, #12]
 8000e00:	4a08      	ldr	r2, [pc, #32]	@ (8000e24 <__usart1_init+0x80>)
 8000e02:	f443 5300 	orr.w	r3, r3, #8192	@ 0x2000
 8000e06:	f043 030c 	orr.w	r3, r3, #12
 8000e0a:	60d3      	str	r3, [r2, #12]
  // set the baud rate (115200 in this case)
  USART1->BRR = 0x08B;
 8000e0c:	4b05      	ldr	r3, [pc, #20]	@ (8000e24 <__usart1_init+0x80>)
 8000e0e:	228b      	movs	r2, #139	@ 0x8b
 8000e10:	609a      	str	r2, [r3, #8]
}
 8000e12:	bf00      	nop
 8000e14:	46bd      	mov	sp, r7
 8000e16:	bc80      	pop	{r7}
 8000e18:	4770      	bx	lr
 8000e1a:	bf00      	nop
 8000e1c:	40023800 	.word	0x40023800
 8000e20:	40020000 	.word	0x40020000
 8000e24:	40011000 	.word	0x40011000

08000e28 <__usart1_print>:

void __usart1_print(const char *msg, uint32_t size) {
 8000e28:	b480      	push	{r7}
 8000e2a:	b085      	sub	sp, #20
 8000e2c:	af00      	add	r7, sp, #0
 8000e2e:	6078      	str	r0, [r7, #4]
 8000e30:	6039      	str	r1, [r7, #0]

  // semaphore_lock(&sem_usart1);
  //enterCRITICAL();
  int i = 0;
 8000e32:	2300      	movs	r3, #0
 8000e34:	60fb      	str	r3, [r7, #12]
  while (i < size && msg[i] != '\0') {
 8000e36:	e00f      	b.n	8000e58 <__usart1_print+0x30>
    while (!(USART1->SR & USART_SR_TXE))
 8000e38:	bf00      	nop
 8000e3a:	4b13      	ldr	r3, [pc, #76]	@ (8000e88 <__usart1_print+0x60>)
 8000e3c:	681b      	ldr	r3, [r3, #0]
 8000e3e:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8000e42:	2b00      	cmp	r3, #0
 8000e44:	d0f9      	beq.n	8000e3a <__usart1_print+0x12>
      ;
    USART1->DR = msg[i++];
 8000e46:	68fb      	ldr	r3, [r7, #12]
 8000e48:	1c5a      	adds	r2, r3, #1
 8000e4a:	60fa      	str	r2, [r7, #12]
 8000e4c:	461a      	mov	r2, r3
 8000e4e:	687b      	ldr	r3, [r7, #4]
 8000e50:	4413      	add	r3, r2
 8000e52:	781a      	ldrb	r2, [r3, #0]
 8000e54:	4b0c      	ldr	r3, [pc, #48]	@ (8000e88 <__usart1_print+0x60>)
 8000e56:	605a      	str	r2, [r3, #4]
  while (i < size && msg[i] != '\0') {
 8000e58:	68fb      	ldr	r3, [r7, #12]
 8000e5a:	683a      	ldr	r2, [r7, #0]
 8000e5c:	429a      	cmp	r2, r3
 8000e5e:	d905      	bls.n	8000e6c <__usart1_print+0x44>
 8000e60:	68fb      	ldr	r3, [r7, #12]
 8000e62:	687a      	ldr	r2, [r7, #4]
 8000e64:	4413      	add	r3, r2
 8000e66:	781b      	ldrb	r3, [r3, #0]
 8000e68:	2b00      	cmp	r3, #0
 8000e6a:	d1e5      	bne.n	8000e38 <__usart1_print+0x10>
  }
  while (!(USART1->SR & USART_SR_TC)) {
 8000e6c:	bf00      	nop
 8000e6e:	4b06      	ldr	r3, [pc, #24]	@ (8000e88 <__usart1_print+0x60>)
 8000e70:	681b      	ldr	r3, [r3, #0]
 8000e72:	f003 0340 	and.w	r3, r3, #64	@ 0x40
 8000e76:	2b00      	cmp	r3, #0
 8000e78:	d0f9      	beq.n	8000e6e <__usart1_print+0x46>
  }
  //exitCRITICAL();
  // semaphore_unlock(&sem_usart1);
}
 8000e7a:	bf00      	nop
 8000e7c:	bf00      	nop
 8000e7e:	3714      	adds	r7, #20
 8000e80:	46bd      	mov	sp, r7
 8000e82:	bc80      	pop	{r7}
 8000e84:	4770      	bx	lr
 8000e86:	bf00      	nop
 8000e88:	40011000 	.word	0x40011000

08000e8c <__asm__set_psp>:

.global __asm__set_psp
.type __asm__set_psp, %function 
__asm__set_psp:
    /* r0 contains the argument*/
    msr psp, r0
 8000e8c:	f380 8809 	msr	PSP, r0
    bx lr
 8000e90:	4770      	bx	lr

08000e92 <__asm__set_msp>:

.global __asm__set_msp
.type __asm__set_msp, %function
__asm__set_msp:
    /* r0 contains the argument*/
    msr msp, r0
 8000e92:	f380 8808 	msr	MSP, r0
    bx lr
 8000e96:	4770      	bx	lr

08000e98 <Reset_Handler>:
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
 8000e98:	f7ff f8d2 	bl	8000040 <resetHandlerHelper>
    B main
 8000e9c:	f7ff bdc4 	b.w	8000a28 <main>

08000ea0 <hang>:
hang:
    B .
 8000ea0:	e7fe      	b.n	8000ea0 <hang>

08000ea2 <Default_Handler>:

.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .
 8000ea2:	e7fe      	b.n	8000ea2 <Default_Handler>

08000ea4 <NMI_Handler>:

.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .
 8000ea4:	e7fe      	b.n	8000ea4 <NMI_Handler>

08000ea6 <DebugMon_Handler>:

.section .text.DebugMon_Handler
.global DebugMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .
 8000ea6:	e7fe      	b.n	8000ea6 <DebugMon_Handler>

08000ea8 <PendSV_Handler>:
.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    cpsid i
 8000ea8:	b672      	cpsid	i

    push {lr}
 8000eaa:	b500      	push	{lr}
    bl schedular
 8000eac:	f7ff fb68 	bl	8000580 <schedular>
    pop {lr}
 8000eb0:	f85d eb04 	ldr.w	lr, [sp], #4

    /************************ start saving reg*********************************/
    ldr r0, =RUNNING_PROCESS
 8000eb4:	4813      	ldr	r0, [pc, #76]	@ (8000f04 <PendSV_Handler+0x5c>)
    ldr r1, [r0]            // r1 now contain the struct address
 8000eb6:	6801      	ldr	r1, [r0, #0]
    

    stmia r1!, {r4-r11}     // r4->r11 stored in the runnging process struct
 8000eb8:	e8a1 0ff0 	stmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}

    mrs r0, psp
 8000ebc:	f3ef 8009 	mrs	r0, PSP
    str r0, [r1]
 8000ec0:	6008      	str	r0, [r1, #0]
    add r1, #4
 8000ec2:	f101 0104 	add.w	r1, r1, #4
    
    mrs r0, msp
 8000ec6:	f3ef 8008 	mrs	r0, MSP
    str r0, [r1]
 8000eca:	6008      	str	r0, [r1, #0]
    add r1, #4
 8000ecc:	f101 0104 	add.w	r1, r1, #4
    
    str lr, [r1]            // important !!! store the exec_return value
 8000ed0:	f8c1 e000 	str.w	lr, [r1]
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
 8000ed4:	480c      	ldr	r0, [pc, #48]	@ (8000f08 <PendSV_Handler+0x60>)
    ldr r1, [r0]
 8000ed6:	6801      	ldr	r1, [r0, #0]
    ldmia r1!, {r4-r11}
 8000ed8:	e8b1 0ff0 	ldmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
   

    /* before setting psp, msp, faultmask, basepri -> mask all interrupt
    so that no interrupt can be fired in the middle of setting important regs*/

    ldr r0, [r1]
 8000edc:	6808      	ldr	r0, [r1, #0]
    msr psp, r0
 8000ede:	f380 8809 	msr	PSP, r0
    add r1, #4
 8000ee2:	f101 0104 	add.w	r1, r1, #4
    
    ldr r0, [r1]
 8000ee6:	6808      	ldr	r0, [r1, #0]
    msr msp, r0
 8000ee8:	f380 8808 	msr	MSP, r0
    add r1, #4
 8000eec:	f101 0104 	add.w	r1, r1, #4
    
    ldr lr, [r1]
 8000ef0:	f8d1 e000 	ldr.w	lr, [r1]

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
 8000ef4:	4804      	ldr	r0, [pc, #16]	@ (8000f08 <PendSV_Handler+0x60>)
    ldr r1, =RUNNING_PROCESS
 8000ef6:	4903      	ldr	r1, [pc, #12]	@ (8000f04 <PendSV_Handler+0x5c>)
    ldr r2, [r0]
 8000ef8:	6802      	ldr	r2, [r0, #0]
    str r2, [r1]
 8000efa:	600a      	str	r2, [r1, #0]
    
    dsb
 8000efc:	f3bf 8f4f 	dsb	sy

    cpsie i
 8000f00:	b662      	cpsie	i

    bx lr
 8000f02:	4770      	bx	lr
    ldr r0, =RUNNING_PROCESS
 8000f04:	20016004 	.word	0x20016004
    ldr r0, =PICKED_PROCESS
 8000f08:	20016008 	.word	0x20016008

08000f0c <SysTick_Handler>:
    caller saved register it will be recovered before returning from the isr*/
    

    /*****************set the PendSV interrupt*********************/
    
    ldr r0, =0xE000ED04      // Address of ICSR register
 8000f0c:	4802      	ldr	r0, [pc, #8]	@ (8000f18 <SysTick_Handler+0xc>)
    ldr r1, =0x10000000      // Bit 28 (PENDSVSET)
 8000f0e:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
    str r1, [r0]             // Set PendSV pending
 8000f12:	6001      	str	r1, [r0, #0]


    bx lr
 8000f14:	4770      	bx	lr
 8000f16:	0000      	.short	0x0000
    ldr r0, =0xE000ED04      // Address of ICSR register
 8000f18:	e000ed04 	.word	0xe000ed04

08000f1c <SVC_Handler>:
.section .text.SVC_Handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler:
    /* r0, r1, r2, r3 stores the arguments of systemcall */
    push {r0, r1, r2, r3}
 8000f1c:	b40f      	push	{r0, r1, r2, r3}

    tst lr, #4
 8000f1e:	f01e 0f04 	tst.w	lr, #4
    ite eq
 8000f22:	bf0c      	ite	eq
    mrseq r0, msp
 8000f24:	f3ef 8008 	mrseq	r0, MSP
    mrsne r0, psp
 8000f28:	f3ef 8009 	mrsne	r0, PSP

    add r0, #24 /* retrieve the old pc that is stacked*/
 8000f2c:	f100 0018 	add.w	r0, r0, #24
    ldr r1, [r0]
 8000f30:	6801      	ldr	r1, [r0, #0]
    sub r1, #2      /*move 2 bytes before to get the scv immidiate*/
 8000f32:	f1a1 0102 	sub.w	r1, r1, #2
    ldrb r0, [r1]   /*r0 now contains the immidiate value*/
 8000f36:	7808      	ldrb	r0, [r1, #0]

    
    ldr r2, =SYSCALL_TABLE_AD
 8000f38:	4a07      	ldr	r2, [pc, #28]	@ (8000f58 <SVC_Handler+0x3c>)
    ldr r1, [r2]            // r1 contains the address of syscall_table
 8000f3a:	6811      	ldr	r1, [r2, #0]
                            // r0 contains the immidate value
    
    mov r3, #4
 8000f3c:	f04f 0304 	mov.w	r3, #4
    mul r0, r3 
 8000f40:	fb03 f000 	mul.w	r0, r3, r0
    add r1, r0 
 8000f44:	4401      	add	r1, r0

    mov r12, r1            // store the address of service function in r12
 8000f46:	468c      	mov	ip, r1
    ldr r12, [r12]
 8000f48:	f8dc c000 	ldr.w	ip, [ip]

    pop {r0, r1, r2, r3}
 8000f4c:	bc0f      	pop	{r0, r1, r2, r3}

    push {lr}
 8000f4e:	b500      	push	{lr}
    blx r12
 8000f50:	47e0      	blx	ip
    pop {lr}
 8000f52:	f85d eb04 	ldr.w	lr, [sp], #4


    bx lr
 8000f56:	4770      	bx	lr
    ldr r2, =SYSCALL_TABLE_AD
 8000f58:	2001600c 	.word	0x2001600c

08000f5c <BusFault_Handler>:
// r0 -> pc, r1 -> fault type, r2 -> fault in kernel / userproc
.section .text.BusFault_Handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler:
    ldr r0, =0xfffffffd
 8000f5c:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0
 8000f60:	4586      	cmp	lr, r0
    ittee eq 
 8000f62:	bf07      	ittee	eq
    mrseq r0, psp
 8000f64:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000f68:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000f6a:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000f6e:	2201      	movne	r2, #1

    /* find pc */
    ldr r0, [r0, #24]
 8000f70:	6980      	ldr	r0, [r0, #24]
    mov r1, BusFault_Identifier
 8000f72:	f04f 0100 	mov.w	r1, #0
    push {lr}
 8000f76:	b500      	push	{lr}
    bl fault_handler_helper
 8000f78:	f7ff f8c8 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000f7c:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8000f80:	4770      	bx	lr

08000f82 <MemManage_Handler>:
/***********************MemManage_Handler start************************/
.section .text.MemManage_Handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler:
    ldr r0, =0xfffffffd 
 8000f82:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000f86:	4586      	cmp	lr, r0

    ittee eq 
 8000f88:	bf07      	ittee	eq
    mrseq r0, psp
 8000f8a:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000f8e:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000f90:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000f94:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8000f96:	6980      	ldr	r0, [r0, #24]
    mov r1, MemManage_Identifier
 8000f98:	f04f 0101 	mov.w	r1, #1
    push {lr}
 8000f9c:	b500      	push	{lr}
    bl fault_handler_helper
 8000f9e:	f7ff f8b5 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000fa2:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8000fa6:	4770      	bx	lr

08000fa8 <UsageFault_Handler>:

.section .text.UsageFault_Handler
.global UsageFault_Handler 
.type UsageFault_Handler, %function
UsageFault_Handler:
    ldr r0, =0xfffffffd 
 8000fa8:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000fac:	4586      	cmp	lr, r0

    ittee eq 
 8000fae:	bf07      	ittee	eq
    mrseq r0, psp
 8000fb0:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000fb4:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000fb6:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000fba:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8000fbc:	6980      	ldr	r0, [r0, #24]
    mov r1, UsageFault_Identifier
 8000fbe:	f04f 0102 	mov.w	r1, #2
    push {lr}
 8000fc2:	b500      	push	{lr}
    bl fault_handler_helper
 8000fc4:	f7ff f8a2 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000fc8:	f85d eb04 	ldr.w	lr, [sp], #4
    
    bx lr
 8000fcc:	4770      	bx	lr
	...

08000fd0 <HardFault_Handler>:
.section .text.HardFault_Handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler:

    ldr r0, =0xfffffffd 
 8000fd0:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000fd4:	4586      	cmp	lr, r0
    ite eq 
 8000fd6:	bf0c      	ite	eq
    mrseq r0, psp
 8000fd8:	f3ef 8009 	mrseq	r0, PSP
    mrsne r0, msp
 8000fdc:	f3ef 8008 	mrsne	r0, MSP
    
    /* find pc */
    ldr r0, [r0, #24]
 8000fe0:	6980      	ldr	r0, [r0, #24]
    
    /* after getting the pc, msp can be safely altered !!!*/
    ldr r1, =_estack
 8000fe2:	4904      	ldr	r1, [pc, #16]	@ (8000ff4 <HardFault_Handler+0x24>)
    msr msp, r1
 8000fe4:	f381 8808 	msr	MSP, r1

    push {lr}
 8000fe8:	b500      	push	{lr}
    bl HardFault_Handler_helper
 8000fea:	f7ff f913 	bl	8000214 <HardFault_Handler_helper>
    pop {lr}
 8000fee:	f85d eb04 	ldr.w	lr, [sp], #4

    b .
 8000ff2:	e7fe      	b.n	8000ff2 <HardFault_Handler+0x22>
    ldr r1, =_estack
 8000ff4:	20018000 	.word	0x20018000

Disassembly of section .usertext:

080014ac <main10-0xeb54>:
	...

08010000 <main10>:
#include "kernel_api.h"

USER_CODE int main10 (void){
 8010000:	b580      	push	{r7, lr}
 8010002:	b082      	sub	sp, #8
 8010004:	af00      	add	r7, sp, #0
 
  int count = 10;
 8010006:	230a      	movs	r3, #10
 8010008:	607b      	str	r3, [r7, #4]
    while (count --){
 801000a:	e003      	b.n	8010014 <main10+0x14>
        user_printf ("==========hello from main10.c\n\r", 0x0);
 801000c:	2100      	movs	r1, #0
 801000e:	4806      	ldr	r0, [pc, #24]	@ (8010028 <main10+0x28>)
 8010010:	f000 f950 	bl	80102b4 <user_printf>
    while (count --){
 8010014:	687b      	ldr	r3, [r7, #4]
 8010016:	1e5a      	subs	r2, r3, #1
 8010018:	607a      	str	r2, [r7, #4]
 801001a:	2b00      	cmp	r3, #0
 801001c:	d1f6      	bne.n	801000c <main10+0xc>

    }



}
 801001e:	bf00      	nop
 8010020:	4618      	mov	r0, r3
 8010022:	3708      	adds	r7, #8
 8010024:	46bd      	mov	sp, r7
 8010026:	bd80      	pop	{r7, pc}
 8010028:	08001258 	.word	0x08001258

0801002c <main11>:
#include "kernel_api.h"

USER_CODE int main11 (void){
 801002c:	b580      	push	{r7, lr}
 801002e:	b082      	sub	sp, #8
 8010030:	af00      	add	r7, sp, #0
    int count = 10;   
 8010032:	230a      	movs	r3, #10
 8010034:	607b      	str	r3, [r7, #4]
    while (count --){
 8010036:	e003      	b.n	8010040 <main11+0x14>
        user_printf ("==========hello from main11.c\n\r", 0x0);
 8010038:	2100      	movs	r1, #0
 801003a:	4806      	ldr	r0, [pc, #24]	@ (8010054 <main11+0x28>)
 801003c:	f000 f93a 	bl	80102b4 <user_printf>
    while (count --){
 8010040:	687b      	ldr	r3, [r7, #4]
 8010042:	1e5a      	subs	r2, r3, #1
 8010044:	607a      	str	r2, [r7, #4]
 8010046:	2b00      	cmp	r3, #0
 8010048:	d1f6      	bne.n	8010038 <main11+0xc>

    }



}
 801004a:	bf00      	nop
 801004c:	4618      	mov	r0, r3
 801004e:	3708      	adds	r7, #8
 8010050:	46bd      	mov	sp, r7
 8010052:	bd80      	pop	{r7, pc}
 8010054:	08001278 	.word	0x08001278

08010058 <main12>:
#include "kernel_api.h"

USER_CODE int main12 (void){
 8010058:	b580      	push	{r7, lr}
 801005a:	b082      	sub	sp, #8
 801005c:	af00      	add	r7, sp, #0
 
  int count = 10;
 801005e:	230a      	movs	r3, #10
 8010060:	607b      	str	r3, [r7, #4]
    while (count --){
 8010062:	e003      	b.n	801006c <main12+0x14>
        user_printf ("==========hello from main12.c\n\r", 0x0);
 8010064:	2100      	movs	r1, #0
 8010066:	4806      	ldr	r0, [pc, #24]	@ (8010080 <main12+0x28>)
 8010068:	f000 f924 	bl	80102b4 <user_printf>
    while (count --){
 801006c:	687b      	ldr	r3, [r7, #4]
 801006e:	1e5a      	subs	r2, r3, #1
 8010070:	607a      	str	r2, [r7, #4]
 8010072:	2b00      	cmp	r3, #0
 8010074:	d1f6      	bne.n	8010064 <main12+0xc>

    }



}
 8010076:	bf00      	nop
 8010078:	4618      	mov	r0, r3
 801007a:	3708      	adds	r7, #8
 801007c:	46bd      	mov	sp, r7
 801007e:	bd80      	pop	{r7, pc}
 8010080:	08001298 	.word	0x08001298

08010084 <main13>:
#include "kernel_api.h"

USER_CODE int main13 (void){
 8010084:	b580      	push	{r7, lr}
 8010086:	b082      	sub	sp, #8
 8010088:	af00      	add	r7, sp, #0
  int count = 10;   
 801008a:	230a      	movs	r3, #10
 801008c:	607b      	str	r3, [r7, #4]
    while (count--){
 801008e:	e003      	b.n	8010098 <main13+0x14>
        user_printf ("==========hello from main13.c\n\r", 0x0);
 8010090:	2100      	movs	r1, #0
 8010092:	4806      	ldr	r0, [pc, #24]	@ (80100ac <main13+0x28>)
 8010094:	f000 f90e 	bl	80102b4 <user_printf>
    while (count--){
 8010098:	687b      	ldr	r3, [r7, #4]
 801009a:	1e5a      	subs	r2, r3, #1
 801009c:	607a      	str	r2, [r7, #4]
 801009e:	2b00      	cmp	r3, #0
 80100a0:	d1f6      	bne.n	8010090 <main13+0xc>

    }



}
 80100a2:	bf00      	nop
 80100a4:	4618      	mov	r0, r3
 80100a6:	3708      	adds	r7, #8
 80100a8:	46bd      	mov	sp, r7
 80100aa:	bd80      	pop	{r7, pc}
 80100ac:	080012b8 	.word	0x080012b8

080100b0 <main14>:
#include "kernel_api.h"

USER_CODE int main14 (void){
 80100b0:	b580      	push	{r7, lr}
 80100b2:	b082      	sub	sp, #8
 80100b4:	af00      	add	r7, sp, #0
  int count = 10;   
 80100b6:	230a      	movs	r3, #10
 80100b8:	607b      	str	r3, [r7, #4]
    while (count--){
 80100ba:	e003      	b.n	80100c4 <main14+0x14>
        user_printf ("==========hello from main14.c\n\r", 0x0);
 80100bc:	2100      	movs	r1, #0
 80100be:	4806      	ldr	r0, [pc, #24]	@ (80100d8 <main14+0x28>)
 80100c0:	f000 f8f8 	bl	80102b4 <user_printf>
    while (count--){
 80100c4:	687b      	ldr	r3, [r7, #4]
 80100c6:	1e5a      	subs	r2, r3, #1
 80100c8:	607a      	str	r2, [r7, #4]
 80100ca:	2b00      	cmp	r3, #0
 80100cc:	d1f6      	bne.n	80100bc <main14+0xc>

    }



}
 80100ce:	bf00      	nop
 80100d0:	4618      	mov	r0, r3
 80100d2:	3708      	adds	r7, #8
 80100d4:	46bd      	mov	sp, r7
 80100d6:	bd80      	pop	{r7, pc}
 80100d8:	080012d8 	.word	0x080012d8

080100dc <main15>:
#include "kernel_api.h"

USER_CODE int main15 (void){
 80100dc:	b580      	push	{r7, lr}
 80100de:	b082      	sub	sp, #8
 80100e0:	af00      	add	r7, sp, #0
  int count = 10;   
 80100e2:	230a      	movs	r3, #10
 80100e4:	607b      	str	r3, [r7, #4]
    while (count--){
 80100e6:	e003      	b.n	80100f0 <main15+0x14>
        user_printf ("==========hello from main15.c\n\r", 0x0);
 80100e8:	2100      	movs	r1, #0
 80100ea:	4806      	ldr	r0, [pc, #24]	@ (8010104 <main15+0x28>)
 80100ec:	f000 f8e2 	bl	80102b4 <user_printf>
    while (count--){
 80100f0:	687b      	ldr	r3, [r7, #4]
 80100f2:	1e5a      	subs	r2, r3, #1
 80100f4:	607a      	str	r2, [r7, #4]
 80100f6:	2b00      	cmp	r3, #0
 80100f8:	d1f6      	bne.n	80100e8 <main15+0xc>

    }



}
 80100fa:	bf00      	nop
 80100fc:	4618      	mov	r0, r3
 80100fe:	3708      	adds	r7, #8
 8010100:	46bd      	mov	sp, r7
 8010102:	bd80      	pop	{r7, pc}
 8010104:	080012f8 	.word	0x080012f8

08010108 <main2>:
#include "kernel_api.h"

USER_CODE int main2(void) {
 8010108:	b580      	push	{r7, lr}
 801010a:	b082      	sub	sp, #8
 801010c:	af00      	add	r7, sp, #0
  int count = 10;
 801010e:	230a      	movs	r3, #10
 8010110:	607b      	str	r3, [r7, #4]
  while (count --) {
 8010112:	e003      	b.n	801011c <main2+0x14>
    user_printf("((((((((((hello from main2.c\n\r", 0x0);
 8010114:	2100      	movs	r1, #0
 8010116:	4806      	ldr	r0, [pc, #24]	@ (8010130 <main2+0x28>)
 8010118:	f000 f8cc 	bl	80102b4 <user_printf>
  while (count --) {
 801011c:	687b      	ldr	r3, [r7, #4]
 801011e:	1e5a      	subs	r2, r3, #1
 8010120:	607a      	str	r2, [r7, #4]
 8010122:	2b00      	cmp	r3, #0
 8010124:	d1f6      	bne.n	8010114 <main2+0xc>
  }
}
 8010126:	bf00      	nop
 8010128:	4618      	mov	r0, r3
 801012a:	3708      	adds	r7, #8
 801012c:	46bd      	mov	sp, r7
 801012e:	bd80      	pop	{r7, pc}
 8010130:	08001318 	.word	0x08001318

08010134 <main3>:
#include "kernel_api.h"

USER_CODE int main3 (void){
 8010134:	b580      	push	{r7, lr}
 8010136:	b082      	sub	sp, #8
 8010138:	af00      	add	r7, sp, #0
  int count = 10;
 801013a:	230a      	movs	r3, #10
 801013c:	607b      	str	r3, [r7, #4]
  // returning
  user_printf ("returning from main3 before printing anything \n\r", 0x0);
 801013e:	2100      	movs	r1, #0
 8010140:	4809      	ldr	r0, [pc, #36]	@ (8010168 <main3+0x34>)
 8010142:	f000 f8b7 	bl	80102b4 <user_printf>
  user_process_exit();
 8010146:	f000 f8b7 	bl	80102b8 <user_process_exit>

    while (count--){
 801014a:	e003      	b.n	8010154 <main3+0x20>
        user_printf (">>>>>>>>>>hello from main3.c\n\r", 0x0);
 801014c:	2100      	movs	r1, #0
 801014e:	4807      	ldr	r0, [pc, #28]	@ (801016c <main3+0x38>)
 8010150:	f000 f8b0 	bl	80102b4 <user_printf>
    while (count--){
 8010154:	687b      	ldr	r3, [r7, #4]
 8010156:	1e5a      	subs	r2, r3, #1
 8010158:	607a      	str	r2, [r7, #4]
 801015a:	2b00      	cmp	r3, #0
 801015c:	d1f6      	bne.n	801014c <main3+0x18>
    }
}
 801015e:	bf00      	nop
 8010160:	4618      	mov	r0, r3
 8010162:	3708      	adds	r7, #8
 8010164:	46bd      	mov	sp, r7
 8010166:	bd80      	pop	{r7, pc}
 8010168:	08001338 	.word	0x08001338
 801016c:	0800136c 	.word	0x0800136c

08010170 <main4>:
#include "kernel_api.h"
USER_CODE int main4 (void){
 8010170:	b580      	push	{r7, lr}
 8010172:	b082      	sub	sp, #8
 8010174:	af00      	add	r7, sp, #0
    int count = 10;
 8010176:	230a      	movs	r3, #10
 8010178:	607b      	str	r3, [r7, #4]
    while (count--)
 801017a:	e003      	b.n	8010184 <main4+0x14>
    user_printf("++++++++++hello from main4.c\n\r", 0x0);
 801017c:	2100      	movs	r1, #0
 801017e:	4806      	ldr	r0, [pc, #24]	@ (8010198 <main4+0x28>)
 8010180:	f000 f898 	bl	80102b4 <user_printf>
    while (count--)
 8010184:	687b      	ldr	r3, [r7, #4]
 8010186:	1e5a      	subs	r2, r3, #1
 8010188:	607a      	str	r2, [r7, #4]
 801018a:	2b00      	cmp	r3, #0
 801018c:	d1f6      	bne.n	801017c <main4+0xc>

    
}
 801018e:	bf00      	nop
 8010190:	4618      	mov	r0, r3
 8010192:	3708      	adds	r7, #8
 8010194:	46bd      	mov	sp, r7
 8010196:	bd80      	pop	{r7, pc}
 8010198:	0800138c 	.word	0x0800138c

0801019c <main5>:
#include "kernel_api.h"

USER_CODE int main5 (void){
 801019c:	b580      	push	{r7, lr}
 801019e:	b082      	sub	sp, #8
 80101a0:	af00      	add	r7, sp, #0
    int count = 10;   
 80101a2:	230a      	movs	r3, #10
 80101a4:	607b      	str	r3, [r7, #4]
    while (count --){
 80101a6:	e003      	b.n	80101b0 <main5+0x14>
        user_printf ("==========hello from main5.c\n\r", 0x0);
 80101a8:	2100      	movs	r1, #0
 80101aa:	4806      	ldr	r0, [pc, #24]	@ (80101c4 <main5+0x28>)
 80101ac:	f000 f882 	bl	80102b4 <user_printf>
    while (count --){
 80101b0:	687b      	ldr	r3, [r7, #4]
 80101b2:	1e5a      	subs	r2, r3, #1
 80101b4:	607a      	str	r2, [r7, #4]
 80101b6:	2b00      	cmp	r3, #0
 80101b8:	d1f6      	bne.n	80101a8 <main5+0xc>

    }



}
 80101ba:	bf00      	nop
 80101bc:	4618      	mov	r0, r3
 80101be:	3708      	adds	r7, #8
 80101c0:	46bd      	mov	sp, r7
 80101c2:	bd80      	pop	{r7, pc}
 80101c4:	080013ac 	.word	0x080013ac

080101c8 <main6>:
#include "kernel_api.h"

USER_CODE int main6 (void){
 80101c8:	b580      	push	{r7, lr}
 80101ca:	b082      	sub	sp, #8
 80101cc:	af00      	add	r7, sp, #0
  
  int count = 10;
 80101ce:	230a      	movs	r3, #10
 80101d0:	607b      	str	r3, [r7, #4]
    while (count--){
 80101d2:	e003      	b.n	80101dc <main6+0x14>
        user_printf ("@@@@@@@@@@hello from main6.c\n\r", 0x0);
 80101d4:	2100      	movs	r1, #0
 80101d6:	4806      	ldr	r0, [pc, #24]	@ (80101f0 <main6+0x28>)
 80101d8:	f000 f86c 	bl	80102b4 <user_printf>
    while (count--){
 80101dc:	687b      	ldr	r3, [r7, #4]
 80101de:	1e5a      	subs	r2, r3, #1
 80101e0:	607a      	str	r2, [r7, #4]
 80101e2:	2b00      	cmp	r3, #0
 80101e4:	d1f6      	bne.n	80101d4 <main6+0xc>

    }



}
 80101e6:	bf00      	nop
 80101e8:	4618      	mov	r0, r3
 80101ea:	3708      	adds	r7, #8
 80101ec:	46bd      	mov	sp, r7
 80101ee:	bd80      	pop	{r7, pc}
 80101f0:	080013cc 	.word	0x080013cc

080101f4 <main7>:
#include "kernel_api.h"

USER_CODE int main7 (void){
 80101f4:	b580      	push	{r7, lr}
 80101f6:	b082      	sub	sp, #8
 80101f8:	af00      	add	r7, sp, #0
 
  int count = 10;
 80101fa:	230a      	movs	r3, #10
 80101fc:	607b      	str	r3, [r7, #4]
    while (count --){
 80101fe:	e003      	b.n	8010208 <main7+0x14>
        user_printf ("@@@@@@@@@@hello from main5.c\n\r", 0x0);
 8010200:	2100      	movs	r1, #0
 8010202:	4806      	ldr	r0, [pc, #24]	@ (801021c <main7+0x28>)
 8010204:	f000 f856 	bl	80102b4 <user_printf>
    while (count --){
 8010208:	687b      	ldr	r3, [r7, #4]
 801020a:	1e5a      	subs	r2, r3, #1
 801020c:	607a      	str	r2, [r7, #4]
 801020e:	2b00      	cmp	r3, #0
 8010210:	d1f6      	bne.n	8010200 <main7+0xc>

    }



}
 8010212:	bf00      	nop
 8010214:	4618      	mov	r0, r3
 8010216:	3708      	adds	r7, #8
 8010218:	46bd      	mov	sp, r7
 801021a:	bd80      	pop	{r7, pc}
 801021c:	080013ec 	.word	0x080013ec

08010220 <main8>:
#include "kernel_api.h"

USER_CODE int main8 (void){
 8010220:	b580      	push	{r7, lr}
 8010222:	b082      	sub	sp, #8
 8010224:	af00      	add	r7, sp, #0
  int count = 10;   
 8010226:	230a      	movs	r3, #10
 8010228:	607b      	str	r3, [r7, #4]
    while (count--){
 801022a:	e003      	b.n	8010234 <main8+0x14>
        user_printf ("==========hello from main8.c\n\r", 0x0);
 801022c:	2100      	movs	r1, #0
 801022e:	4806      	ldr	r0, [pc, #24]	@ (8010248 <main8+0x28>)
 8010230:	f000 f840 	bl	80102b4 <user_printf>
    while (count--){
 8010234:	687b      	ldr	r3, [r7, #4]
 8010236:	1e5a      	subs	r2, r3, #1
 8010238:	607a      	str	r2, [r7, #4]
 801023a:	2b00      	cmp	r3, #0
 801023c:	d1f6      	bne.n	801022c <main8+0xc>

    }



}
 801023e:	bf00      	nop
 8010240:	4618      	mov	r0, r3
 8010242:	3708      	adds	r7, #8
 8010244:	46bd      	mov	sp, r7
 8010246:	bd80      	pop	{r7, pc}
 8010248:	0800140c 	.word	0x0800140c

0801024c <main9>:
#include "kernel_api.h"

USER_CODE int main9 (void){
 801024c:	b580      	push	{r7, lr}
 801024e:	b082      	sub	sp, #8
 8010250:	af00      	add	r7, sp, #0
 
  int count = 10;
 8010252:	230a      	movs	r3, #10
 8010254:	607b      	str	r3, [r7, #4]
    while (count--){
 8010256:	e003      	b.n	8010260 <main9+0x14>
        user_printf ("==========hello from main9.c\n\r", 0x0);
 8010258:	2100      	movs	r1, #0
 801025a:	4806      	ldr	r0, [pc, #24]	@ (8010274 <main9+0x28>)
 801025c:	f000 f82a 	bl	80102b4 <user_printf>
    while (count--){
 8010260:	687b      	ldr	r3, [r7, #4]
 8010262:	1e5a      	subs	r2, r3, #1
 8010264:	607a      	str	r2, [r7, #4]
 8010266:	2b00      	cmp	r3, #0
 8010268:	d1f6      	bne.n	8010258 <main9+0xc>

    }



}
 801026a:	bf00      	nop
 801026c:	4618      	mov	r0, r3
 801026e:	3708      	adds	r7, #8
 8010270:	46bd      	mov	sp, r7
 8010272:	bd80      	pop	{r7, pc}
 8010274:	0800142c 	.word	0x0800142c

08010278 <main1>:
#include "kernel_api.h"

USER_CODE int main1(void) {
 8010278:	b580      	push	{r7, lr}
 801027a:	af00      	add	r7, sp, #0
  while (1) {

    user_printf("hello from main1.c\n\r", 0x0);
 801027c:	2100      	movs	r1, #0
 801027e:	4806      	ldr	r0, [pc, #24]	@ (8010298 <main1+0x20>)
 8010280:	f000 f818 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c second time\n\r", 0x0);
 8010284:	2100      	movs	r1, #0
 8010286:	4805      	ldr	r0, [pc, #20]	@ (801029c <main1+0x24>)
 8010288:	f000 f814 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c third time\n\r", 0x0);
 801028c:	2100      	movs	r1, #0
 801028e:	4804      	ldr	r0, [pc, #16]	@ (80102a0 <main1+0x28>)
 8010290:	f000 f810 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c\n\r", 0x0);
 8010294:	e7f2      	b.n	801027c <main1+0x4>
 8010296:	bf00      	nop
 8010298:	0800144c 	.word	0x0800144c
 801029c:	08001464 	.word	0x08001464
 80102a0:	08001488 	.word	0x08001488

080102a4 <__asm__launch_main1>:
 80102a4:	f04f 0003 	mov.w	r0, #3
 80102a8:	f380 8814 	msr	CONTROL, r0
 80102ac:	f3bf 8f6f 	isb	sy
 80102b0:	f7ff ffe2 	bl	8010278 <main1>

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
 80000ec:	080014a4 	.word	0x080014a4
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
 8000124:	f000 fb2a 	bl	800077c <printf>
    if (SCB->CFSR & SCB_CFSR_BFARVALID_Msk)
 8000128:	4b2c      	ldr	r3, [pc, #176]	@ (80001dc <fault_handler_helper+0xd0>)
 800012a:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 800012c:	f403 4300 	and.w	r3, r3, #32768	@ 0x8000
 8000130:	2b00      	cmp	r3, #0
 8000132:	d01f      	beq.n	8000174 <fault_handler_helper+0x68>
      printf("busfault address -> %\n\r", (uint32_t)(&SCB->BFAR));
 8000134:	492a      	ldr	r1, [pc, #168]	@ (80001e0 <fault_handler_helper+0xd4>)
 8000136:	482b      	ldr	r0, [pc, #172]	@ (80001e4 <fault_handler_helper+0xd8>)
 8000138:	f000 fb20 	bl	800077c <printf>
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
 8000148:	f000 fb18 	bl	800077c <printf>
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
 8000160:	f000 fb0c 	bl	800077c <printf>
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
 8000170:	f000 fb04 	bl	800077c <printf>
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
 800017e:	f000 fafd 	bl	800077c <printf>
         (uint32_t)(&SCB->CFSR));
  printf("PC -> %\n\r", (uint32_t)&pc);
 8000182:	f107 030c 	add.w	r3, r7, #12
 8000186:	4619      	mov	r1, r3
 8000188:	481c      	ldr	r0, [pc, #112]	@ (80001fc <fault_handler_helper+0xf0>)
 800018a:	f000 faf7 	bl	800077c <printf>
  printf("instruction that caused the fault-> %\n\r", (uint32_t)(&instruction));
 800018e:	f107 0314 	add.w	r3, r7, #20
 8000192:	4619      	mov	r1, r3
 8000194:	481a      	ldr	r0, [pc, #104]	@ (8000200 <fault_handler_helper+0xf4>)
 8000196:	f000 faf1 	bl	800077c <printf>

  /* KERNEL PANIC if fault in kernel
   * PROCESSES TERMINATION if fault in user process */

  if (fault_place == FAULT_IN_KERNEL) {
 800019a:	687b      	ldr	r3, [r7, #4]
 800019c:	2b01      	cmp	r3, #1
 800019e:	d104      	bne.n	80001aa <fault_handler_helper+0x9e>
    printf("\n\n\rKERNEL PANIC......\n\n\r", 0x0);
 80001a0:	2100      	movs	r1, #0
 80001a2:	4818      	ldr	r0, [pc, #96]	@ (8000204 <fault_handler_helper+0xf8>)
 80001a4:	f000 faea 	bl	800077c <printf>
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
 80001b4:	f000 fae2 	bl	800077c <printf>
    printf("reason -> fault", 0x0);
 80001b8:	2100      	movs	r1, #0
 80001ba:	4814      	ldr	r0, [pc, #80]	@ (800020c <fault_handler_helper+0x100>)
 80001bc:	f000 fade 	bl	800077c <printf>

    (*(user_process_t **)(RUNNING_PROCESS_AD))->state = SUSPEND_STATE;
 80001c0:	4b13      	ldr	r3, [pc, #76]	@ (8000210 <fault_handler_helper+0x104>)
 80001c2:	681b      	ldr	r3, [r3, #0]
 80001c4:	2202      	movs	r2, #2
 80001c6:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* trigger context switching*/
    PendSV_Handler();
 80001c8:	f000 fe6c 	bl	8000ea4 <PendSV_Handler>
 80001cc:	e000      	b.n	80001d0 <fault_handler_helper+0xc4>
    return;
 80001ce:	bf00      	nop
  }
}
 80001d0:	3718      	adds	r7, #24
 80001d2:	46bd      	mov	sp, r7
 80001d4:	bd80      	pop	{r7, pc}
 80001d6:	bf00      	nop
 80001d8:	08000ff4 	.word	0x08000ff4
 80001dc:	e000ed00 	.word	0xe000ed00
 80001e0:	e000ed38 	.word	0xe000ed38
 80001e4:	08001004 	.word	0x08001004
 80001e8:	0800101c 	.word	0x0800101c
 80001ec:	0800103c 	.word	0x0800103c
 80001f0:	08001064 	.word	0x08001064
 80001f4:	e000ed28 	.word	0xe000ed28
 80001f8:	08001074 	.word	0x08001074
 80001fc:	080010a4 	.word	0x080010a4
 8000200:	080010b0 	.word	0x080010b0
 8000204:	080010d8 	.word	0x080010d8
 8000208:	080010f4 	.word	0x080010f4
 800020c:	08001114 	.word	0x08001114
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
 8000226:	f000 faa9 	bl	800077c <printf>
  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 800022a:	490c      	ldr	r1, [pc, #48]	@ (800025c <HardFault_Handler_helper+0x48>)
 800022c:	480c      	ldr	r0, [pc, #48]	@ (8000260 <HardFault_Handler_helper+0x4c>)
 800022e:	f000 faa5 	bl	800077c <printf>
         (uint32_t)(&SCB->CFSR));
  printf("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
 8000232:	490c      	ldr	r1, [pc, #48]	@ (8000264 <HardFault_Handler_helper+0x50>)
 8000234:	480c      	ldr	r0, [pc, #48]	@ (8000268 <HardFault_Handler_helper+0x54>)
 8000236:	f000 faa1 	bl	800077c <printf>
  printf("PC -> %\n\r", (uint32_t)(&pc));
 800023a:	1d3b      	adds	r3, r7, #4
 800023c:	4619      	mov	r1, r3
 800023e:	480b      	ldr	r0, [pc, #44]	@ (800026c <HardFault_Handler_helper+0x58>)
 8000240:	f000 fa9c 	bl	800077c <printf>
  printf("instruction that triggered HardFault -> %\n\r",
 8000244:	f107 030c 	add.w	r3, r7, #12
 8000248:	4619      	mov	r1, r3
 800024a:	4809      	ldr	r0, [pc, #36]	@ (8000270 <HardFault_Handler_helper+0x5c>)
 800024c:	f000 fa96 	bl	800077c <printf>
         (uint32_t)&instruction);
}
 8000250:	bf00      	nop
 8000252:	3710      	adds	r7, #16
 8000254:	46bd      	mov	sp, r7
 8000256:	bd80      	pop	{r7, pc}
 8000258:	08001124 	.word	0x08001124
 800025c:	e000ed28 	.word	0xe000ed28
 8000260:	08001074 	.word	0x08001074
 8000264:	e000ed2c 	.word	0xe000ed2c
 8000268:	08001138 	.word	0x08001138
 800026c:	080010a4 	.word	0x080010a4
 8000270:	0800115c 	.word	0x0800115c

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
 800058a:	4b1c      	ldr	r3, [pc, #112]	@ (80005fc <schedular+0x7c>)
 800058c:	681b      	ldr	r3, [r3, #0]
 800058e:	60bb      	str	r3, [r7, #8]


  // we could use a priority queue here to support priority...
  picked_process = queue_front(&ready_queue);
 8000590:	481b      	ldr	r0, [pc, #108]	@ (8000600 <schedular+0x80>)
 8000592:	f7ff ff3b 	bl	800040c <queue_front>
 8000596:	60f8      	str	r0, [r7, #12]
  uint8_t status = queue_pop(&ready_queue);
 8000598:	4819      	ldr	r0, [pc, #100]	@ (8000600 <schedular+0x80>)
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
 80005ac:	d10c      	bne.n	80005c8 <schedular+0x48>
    picked_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 80005ae:	4b13      	ldr	r3, [pc, #76]	@ (80005fc <schedular+0x7c>)
 80005b0:	681b      	ldr	r3, [r3, #0]
 80005b2:	60fb      	str	r3, [r7, #12]
    // dissable systick to remove the context switching overhead if there is only one process .

    printf ("ready queue is empty, turning off context switching\n\r", 0x0);
 80005b4:	2100      	movs	r1, #0
 80005b6:	4813      	ldr	r0, [pc, #76]	@ (8000604 <schedular+0x84>)
 80005b8:	f000 f8e0 	bl	800077c <printf>
    SysTick->CTRL &= ~(SysTick_CTRL_ENABLE_Msk);
 80005bc:	4b12      	ldr	r3, [pc, #72]	@ (8000608 <schedular+0x88>)
 80005be:	681b      	ldr	r3, [r3, #0]
 80005c0:	4a11      	ldr	r2, [pc, #68]	@ (8000608 <schedular+0x88>)
 80005c2:	f023 0301 	bic.w	r3, r3, #1
 80005c6:	6013      	str	r3, [r2, #0]
    // better if the last standing process is too large  or there is only one process to begin with
  }

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);
 80005c8:	4a10      	ldr	r2, [pc, #64]	@ (800060c <schedular+0x8c>)
 80005ca:	68fb      	ldr	r3, [r7, #12]
 80005cc:	6013      	str	r3, [r2, #0]
  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE &&
 80005ce:	68bb      	ldr	r3, [r7, #8]
 80005d0:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 80005d2:	2b02      	cmp	r3, #2
 80005d4:	d00a      	beq.n	80005ec <schedular+0x6c>
      running_process->state != WAITING_STATE) {
 80005d6:	68bb      	ldr	r3, [r7, #8]
 80005d8:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
  if (running_process->state != SUSPEND_STATE &&
 80005da:	2b03      	cmp	r3, #3
 80005dc:	d006      	beq.n	80005ec <schedular+0x6c>
    queue_push(&ready_queue, running_process);
 80005de:	68b9      	ldr	r1, [r7, #8]
 80005e0:	4807      	ldr	r0, [pc, #28]	@ (8000600 <schedular+0x80>)
 80005e2:	f7ff fe90 	bl	8000306 <queue_push>
    running_process->state = READY_STATE;
 80005e6:	68bb      	ldr	r3, [r7, #8]
 80005e8:	2200      	movs	r2, #0
 80005ea:	62da      	str	r2, [r3, #44]	@ 0x2c
  }

  picked_process->state = RUNNING_STATE;
 80005ec:	68fb      	ldr	r3, [r7, #12]
 80005ee:	2201      	movs	r2, #1
 80005f0:	62da      	str	r2, [r3, #44]	@ 0x2c
}
 80005f2:	bf00      	nop
 80005f4:	3710      	adds	r7, #16
 80005f6:	46bd      	mov	sp, r7
 80005f8:	bd80      	pop	{r7, pc}
 80005fa:	bf00      	nop
 80005fc:	20016004 	.word	0x20016004
 8000600:	200003f4 	.word	0x200003f4
 8000604:	08001188 	.word	0x08001188
 8000608:	e000e010 	.word	0xe000e010
 800060c:	20016008 	.word	0x20016008

08000610 <strlen>:
#include "usart.h"
#include <stdarg.h>

#define MAX_STR_LENGTH 500 

uint32_t strlen(const char *msg) {
 8000610:	b480      	push	{r7}
 8000612:	b085      	sub	sp, #20
 8000614:	af00      	add	r7, sp, #0
 8000616:	6078      	str	r0, [r7, #4]

  int i = 0;
 8000618:	2300      	movs	r3, #0
 800061a:	60fb      	str	r3, [r7, #12]
  while (msg[i++] != '\0')
 800061c:	bf00      	nop
 800061e:	68fb      	ldr	r3, [r7, #12]
 8000620:	1c5a      	adds	r2, r3, #1
 8000622:	60fa      	str	r2, [r7, #12]
 8000624:	461a      	mov	r2, r3
 8000626:	687b      	ldr	r3, [r7, #4]
 8000628:	4413      	add	r3, r2
 800062a:	781b      	ldrb	r3, [r3, #0]
 800062c:	2b00      	cmp	r3, #0
 800062e:	d1f6      	bne.n	800061e <strlen+0xe>
    ;
  return i - 1;
 8000630:	68fb      	ldr	r3, [r7, #12]
 8000632:	3b01      	subs	r3, #1
}
 8000634:	4618      	mov	r0, r3
 8000636:	3714      	adds	r7, #20
 8000638:	46bd      	mov	sp, r7
 800063a:	bc80      	pop	{r7}
 800063c:	4770      	bx	lr

0800063e <concat>:

 uint32_t concat (char *s, uint32_t ind, uint32_t MAX_S_SIZE, char *t){
 800063e:	b480      	push	{r7}
 8000640:	b087      	sub	sp, #28
 8000642:	af00      	add	r7, sp, #0
 8000644:	60f8      	str	r0, [r7, #12]
 8000646:	60b9      	str	r1, [r7, #8]
 8000648:	607a      	str	r2, [r7, #4]
 800064a:	603b      	str	r3, [r7, #0]
  int t_ind = 0;
 800064c:	2300      	movs	r3, #0
 800064e:	617b      	str	r3, [r7, #20]
  while (ind < MAX_S_SIZE-1 && t[t_ind]){
 8000650:	e00c      	b.n	800066c <concat+0x2e>
    s[ind++] = t[t_ind++];
 8000652:	697b      	ldr	r3, [r7, #20]
 8000654:	1c5a      	adds	r2, r3, #1
 8000656:	617a      	str	r2, [r7, #20]
 8000658:	461a      	mov	r2, r3
 800065a:	683b      	ldr	r3, [r7, #0]
 800065c:	441a      	add	r2, r3
 800065e:	68bb      	ldr	r3, [r7, #8]
 8000660:	1c59      	adds	r1, r3, #1
 8000662:	60b9      	str	r1, [r7, #8]
 8000664:	68f9      	ldr	r1, [r7, #12]
 8000666:	440b      	add	r3, r1
 8000668:	7812      	ldrb	r2, [r2, #0]
 800066a:	701a      	strb	r2, [r3, #0]
  while (ind < MAX_S_SIZE-1 && t[t_ind]){
 800066c:	687b      	ldr	r3, [r7, #4]
 800066e:	3b01      	subs	r3, #1
 8000670:	68ba      	ldr	r2, [r7, #8]
 8000672:	429a      	cmp	r2, r3
 8000674:	d205      	bcs.n	8000682 <concat+0x44>
 8000676:	697b      	ldr	r3, [r7, #20]
 8000678:	683a      	ldr	r2, [r7, #0]
 800067a:	4413      	add	r3, r2
 800067c:	781b      	ldrb	r3, [r3, #0]
 800067e:	2b00      	cmp	r3, #0
 8000680:	d1e7      	bne.n	8000652 <concat+0x14>
  }
  return ind;
 8000682:	68bb      	ldr	r3, [r7, #8]
}
 8000684:	4618      	mov	r0, r3
 8000686:	371c      	adds	r7, #28
 8000688:	46bd      	mov	sp, r7
 800068a:	bc80      	pop	{r7}
 800068c:	4770      	bx	lr

0800068e <hex_str>:

void hex_str(uint32_t value, char out[11]) {
 800068e:	b4b0      	push	{r4, r5, r7}
 8000690:	b08b      	sub	sp, #44	@ 0x2c
 8000692:	af00      	add	r7, sp, #0
 8000694:	6078      	str	r0, [r7, #4]
 8000696:	6039      	str	r1, [r7, #0]
// put the string representation of hex value in out
  char hex_char[] = "0123456789abcdef";
 8000698:	4b1d      	ldr	r3, [pc, #116]	@ (8000710 <hex_str+0x82>)
 800069a:	f107 0408 	add.w	r4, r7, #8
 800069e:	461d      	mov	r5, r3
 80006a0:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
 80006a2:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 80006a4:	682b      	ldr	r3, [r5, #0]
 80006a6:	7023      	strb	r3, [r4, #0]
  out [10] = '\0';
 80006a8:	683b      	ldr	r3, [r7, #0]
 80006aa:	330a      	adds	r3, #10
 80006ac:	2200      	movs	r2, #0
 80006ae:	701a      	strb	r2, [r3, #0]
  out[0] = '0';
 80006b0:	683b      	ldr	r3, [r7, #0]
 80006b2:	2230      	movs	r2, #48	@ 0x30
 80006b4:	701a      	strb	r2, [r3, #0]
  out[1] = 'x';
 80006b6:	683b      	ldr	r3, [r7, #0]
 80006b8:	3301      	adds	r3, #1
 80006ba:	2278      	movs	r2, #120	@ 0x78
 80006bc:	701a      	strb	r2, [r3, #0]

  for (int i = 0; i < 8; i++) {
 80006be:	2300      	movs	r3, #0
 80006c0:	627b      	str	r3, [r7, #36]	@ 0x24
 80006c2:	e01c      	b.n	80006fe <hex_str+0x70>
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
 80006c4:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006c6:	009b      	lsls	r3, r3, #2
 80006c8:	220f      	movs	r2, #15
 80006ca:	fa02 f303 	lsl.w	r3, r2, r3
 80006ce:	461a      	mov	r2, r3
 80006d0:	687b      	ldr	r3, [r7, #4]
 80006d2:	401a      	ands	r2, r3
 80006d4:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006d6:	009b      	lsls	r3, r3, #2
 80006d8:	fa22 f303 	lsr.w	r3, r2, r3
 80006dc:	623b      	str	r3, [r7, #32]
    int j = 9 - i;
 80006de:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006e0:	f1c3 0309 	rsb	r3, r3, #9
 80006e4:	61fb      	str	r3, [r7, #28]
    out[j] = hex_char[ind];
 80006e6:	69fb      	ldr	r3, [r7, #28]
 80006e8:	683a      	ldr	r2, [r7, #0]
 80006ea:	4413      	add	r3, r2
 80006ec:	f107 0108 	add.w	r1, r7, #8
 80006f0:	6a3a      	ldr	r2, [r7, #32]
 80006f2:	440a      	add	r2, r1
 80006f4:	7812      	ldrb	r2, [r2, #0]
 80006f6:	701a      	strb	r2, [r3, #0]
  for (int i = 0; i < 8; i++) {
 80006f8:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80006fa:	3301      	adds	r3, #1
 80006fc:	627b      	str	r3, [r7, #36]	@ 0x24
 80006fe:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8000700:	2b07      	cmp	r3, #7
 8000702:	dddf      	ble.n	80006c4 <hex_str+0x36>
  }
}
 8000704:	bf00      	nop
 8000706:	bf00      	nop
 8000708:	372c      	adds	r7, #44	@ 0x2c
 800070a:	46bd      	mov	sp, r7
 800070c:	bcb0      	pop	{r4, r5, r7}
 800070e:	4770      	bx	lr
 8000710:	080011c0 	.word	0x080011c0

08000714 <int_str>:

void int_str (uint32_t value, char out[11]){
 8000714:	b480      	push	{r7}
 8000716:	b085      	sub	sp, #20
 8000718:	af00      	add	r7, sp, #0
 800071a:	6078      	str	r0, [r7, #4]
 800071c:	6039      	str	r1, [r7, #0]
  // put the string representation of value in out;
  int32_t i = 9;
 800071e:	2309      	movs	r3, #9
 8000720:	60fb      	str	r3, [r7, #12]
  out[10] = '\0';
 8000722:	683b      	ldr	r3, [r7, #0]
 8000724:	330a      	adds	r3, #10
 8000726:	2200      	movs	r2, #0
 8000728:	701a      	strb	r2, [r3, #0]
  while (i >= 0){
 800072a:	e01b      	b.n	8000764 <int_str+0x50>

    uint8_t digit = value % 10;
 800072c:	6879      	ldr	r1, [r7, #4]
 800072e:	4b12      	ldr	r3, [pc, #72]	@ (8000778 <int_str+0x64>)
 8000730:	fba3 2301 	umull	r2, r3, r3, r1
 8000734:	08da      	lsrs	r2, r3, #3
 8000736:	4613      	mov	r3, r2
 8000738:	009b      	lsls	r3, r3, #2
 800073a:	4413      	add	r3, r2
 800073c:	005b      	lsls	r3, r3, #1
 800073e:	1aca      	subs	r2, r1, r3
 8000740:	4613      	mov	r3, r2
 8000742:	72fb      	strb	r3, [r7, #11]
    value /= 10;
 8000744:	687b      	ldr	r3, [r7, #4]
 8000746:	4a0c      	ldr	r2, [pc, #48]	@ (8000778 <int_str+0x64>)
 8000748:	fba2 2303 	umull	r2, r3, r2, r3
 800074c:	08db      	lsrs	r3, r3, #3
 800074e:	607b      	str	r3, [r7, #4]
    out[i--] = '0' + digit;
 8000750:	68fb      	ldr	r3, [r7, #12]
 8000752:	1e5a      	subs	r2, r3, #1
 8000754:	60fa      	str	r2, [r7, #12]
 8000756:	461a      	mov	r2, r3
 8000758:	683b      	ldr	r3, [r7, #0]
 800075a:	4413      	add	r3, r2
 800075c:	7afa      	ldrb	r2, [r7, #11]
 800075e:	3230      	adds	r2, #48	@ 0x30
 8000760:	b2d2      	uxtb	r2, r2
 8000762:	701a      	strb	r2, [r3, #0]
  while (i >= 0){
 8000764:	68fb      	ldr	r3, [r7, #12]
 8000766:	2b00      	cmp	r3, #0
 8000768:	dae0      	bge.n	800072c <int_str+0x18>
  }
}
 800076a:	bf00      	nop
 800076c:	bf00      	nop
 800076e:	3714      	adds	r7, #20
 8000770:	46bd      	mov	sp, r7
 8000772:	bc80      	pop	{r7}
 8000774:	4770      	bx	lr
 8000776:	bf00      	nop
 8000778:	cccccccd 	.word	0xcccccccd

0800077c <printf>:

void printf(const char *msg, ...) {
 800077c:	b40f      	push	{r0, r1, r2, r3}
 800077e:	b580      	push	{r7, lr}
 8000780:	f5ad 7d0a 	sub.w	sp, sp, #552	@ 0x228
 8000784:	af00      	add	r7, sp, #0
  va_list args;
  va_start (args, msg);
 8000786:	f507 730d 	add.w	r3, r7, #564	@ 0x234
 800078a:	f8c7 320c 	str.w	r3, [r7, #524]	@ 0x20c

  uint32_t size = strlen (msg);
 800078e:	f8d7 0230 	ldr.w	r0, [r7, #560]	@ 0x230
 8000792:	f7ff ff3d 	bl	8000610 <strlen>
 8000796:	f8c7 021c 	str.w	r0, [r7, #540]	@ 0x21c
  char __msg[MAX_STR_LENGTH];

  int msg_ind = 0;
 800079a:	2300      	movs	r3, #0
 800079c:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
  int __msg_ind = 0;
 80007a0:	2300      	movs	r3, #0
 80007a2:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
  while (msg_ind < size){
 80007a6:	e0a1      	b.n	80008ec <printf+0x170>
    if (msg[msg_ind] != '%'){
 80007a8:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80007ac:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 80007b0:	4413      	add	r3, r2
 80007b2:	781b      	ldrb	r3, [r3, #0]
 80007b4:	2b25      	cmp	r3, #37	@ 0x25
 80007b6:	d014      	beq.n	80007e2 <printf+0x66>
      __msg[__msg_ind++] = msg [msg_ind++];
 80007b8:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80007bc:	1c5a      	adds	r2, r3, #1
 80007be:	f8c7 2224 	str.w	r2, [r7, #548]	@ 0x224
 80007c2:	461a      	mov	r2, r3
 80007c4:	f8d7 3230 	ldr.w	r3, [r7, #560]	@ 0x230
 80007c8:	441a      	add	r2, r3
 80007ca:	f8d7 3220 	ldr.w	r3, [r7, #544]	@ 0x220
 80007ce:	1c59      	adds	r1, r3, #1
 80007d0:	f8c7 1220 	str.w	r1, [r7, #544]	@ 0x220
 80007d4:	7811      	ldrb	r1, [r2, #0]
 80007d6:	f507 720a 	add.w	r2, r7, #552	@ 0x228
 80007da:	f5a2 7204 	sub.w	r2, r2, #528	@ 0x210
 80007de:	54d1      	strb	r1, [r2, r3]
      continue;
 80007e0:	e084      	b.n	80008ec <printf+0x170>
    }
    
    // msg[msg_ind] == '%'
    if (msg_ind+1 >= size) break;
 80007e2:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80007e6:	3301      	adds	r3, #1
 80007e8:	461a      	mov	r2, r3
 80007ea:	f8d7 321c 	ldr.w	r3, [r7, #540]	@ 0x21c
 80007ee:	4293      	cmp	r3, r2
 80007f0:	f240 8084 	bls.w	80008fc <printf+0x180>
    if (msg[msg_ind+1] == 's'){
 80007f4:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80007f8:	3301      	adds	r3, #1
 80007fa:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 80007fe:	4413      	add	r3, r2
 8000800:	781b      	ldrb	r3, [r3, #0]
 8000802:	2b73      	cmp	r3, #115	@ 0x73
 8000804:	d11a      	bne.n	800083c <printf+0xc0>

      char* address = va_arg (args, char*);
 8000806:	f8d7 320c 	ldr.w	r3, [r7, #524]	@ 0x20c
 800080a:	1d1a      	adds	r2, r3, #4
 800080c:	f8c7 220c 	str.w	r2, [r7, #524]	@ 0x20c
 8000810:	681b      	ldr	r3, [r3, #0]
 8000812:	f8c7 3210 	str.w	r3, [r7, #528]	@ 0x210
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, address);
 8000816:	f8d7 1220 	ldr.w	r1, [r7, #544]	@ 0x220
 800081a:	f107 0018 	add.w	r0, r7, #24
 800081e:	f8d7 3210 	ldr.w	r3, [r7, #528]	@ 0x210
 8000822:	f44f 72fa 	mov.w	r2, #500	@ 0x1f4
 8000826:	f7ff ff0a 	bl	800063e <concat>
 800082a:	4603      	mov	r3, r0
 800082c:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
      msg_ind ++;
 8000830:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8000834:	3301      	adds	r3, #1
 8000836:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
 800083a:	e052      	b.n	80008e2 <printf+0x166>
    }
    else if (msg[msg_ind+1] == 'd'){
 800083c:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8000840:	3301      	adds	r3, #1
 8000842:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 8000846:	4413      	add	r3, r2
 8000848:	781b      	ldrb	r3, [r3, #0]
 800084a:	2b64      	cmp	r3, #100	@ 0x64
 800084c:	d121      	bne.n	8000892 <printf+0x116>

      char target [11];
      uint32_t value = va_arg (args, uint32_t);
 800084e:	f8d7 320c 	ldr.w	r3, [r7, #524]	@ 0x20c
 8000852:	1d1a      	adds	r2, r3, #4
 8000854:	f8c7 220c 	str.w	r2, [r7, #524]	@ 0x20c
 8000858:	681b      	ldr	r3, [r3, #0]
 800085a:	f8c7 3214 	str.w	r3, [r7, #532]	@ 0x214
      int_str (value, target);
 800085e:	f107 030c 	add.w	r3, r7, #12
 8000862:	4619      	mov	r1, r3
 8000864:	f8d7 0214 	ldr.w	r0, [r7, #532]	@ 0x214
 8000868:	f7ff ff54 	bl	8000714 <int_str>
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, target);
 800086c:	f8d7 1220 	ldr.w	r1, [r7, #544]	@ 0x220
 8000870:	f107 030c 	add.w	r3, r7, #12
 8000874:	f107 0018 	add.w	r0, r7, #24
 8000878:	f44f 72fa 	mov.w	r2, #500	@ 0x1f4
 800087c:	f7ff fedf 	bl	800063e <concat>
 8000880:	4603      	mov	r3, r0
 8000882:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
      msg_ind ++;
 8000886:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 800088a:	3301      	adds	r3, #1
 800088c:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
 8000890:	e027      	b.n	80008e2 <printf+0x166>
    }
    else if (msg[msg_ind+1] == 'x'){
 8000892:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8000896:	3301      	adds	r3, #1
 8000898:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 800089c:	4413      	add	r3, r2
 800089e:	781b      	ldrb	r3, [r3, #0]
 80008a0:	2b78      	cmp	r3, #120	@ 0x78
 80008a2:	d11e      	bne.n	80008e2 <printf+0x166>

      char target [11];
      uint32_t value = va_arg (args, uint32_t);
 80008a4:	f8d7 320c 	ldr.w	r3, [r7, #524]	@ 0x20c
 80008a8:	1d1a      	adds	r2, r3, #4
 80008aa:	f8c7 220c 	str.w	r2, [r7, #524]	@ 0x20c
 80008ae:	681b      	ldr	r3, [r3, #0]
 80008b0:	f8c7 3218 	str.w	r3, [r7, #536]	@ 0x218
      hex_str (value, target);
 80008b4:	463b      	mov	r3, r7
 80008b6:	4619      	mov	r1, r3
 80008b8:	f8d7 0218 	ldr.w	r0, [r7, #536]	@ 0x218
 80008bc:	f7ff fee7 	bl	800068e <hex_str>
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, target);
 80008c0:	f8d7 1220 	ldr.w	r1, [r7, #544]	@ 0x220
 80008c4:	463b      	mov	r3, r7
 80008c6:	f107 0018 	add.w	r0, r7, #24
 80008ca:	f44f 72fa 	mov.w	r2, #500	@ 0x1f4
 80008ce:	f7ff feb6 	bl	800063e <concat>
 80008d2:	4603      	mov	r3, r0
 80008d4:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
      msg_ind ++;
 80008d8:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80008dc:	3301      	adds	r3, #1
 80008de:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
    }
    msg_ind ++;
 80008e2:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80008e6:	3301      	adds	r3, #1
 80008e8:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
  while (msg_ind < size){
 80008ec:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80008f0:	f8d7 221c 	ldr.w	r2, [r7, #540]	@ 0x21c
 80008f4:	429a      	cmp	r2, r3
 80008f6:	f63f af57 	bhi.w	80007a8 <printf+0x2c>
 80008fa:	e000      	b.n	80008fe <printf+0x182>
    if (msg_ind+1 >= size) break;
 80008fc:	bf00      	nop

  }
  va_end (args);
  __msg[__msg_ind] = '\0';
 80008fe:	f507 730a 	add.w	r3, r7, #552	@ 0x228
 8000902:	f5a3 7204 	sub.w	r2, r3, #528	@ 0x210
 8000906:	f8d7 3220 	ldr.w	r3, [r7, #544]	@ 0x220
 800090a:	4413      	add	r3, r2
 800090c:	2200      	movs	r2, #0
 800090e:	701a      	strb	r2, [r3, #0]
  __usart1_print (__msg, strlen (__msg));
 8000910:	f107 0318 	add.w	r3, r7, #24
 8000914:	4618      	mov	r0, r3
 8000916:	f7ff fe7b 	bl	8000610 <strlen>
 800091a:	4602      	mov	r2, r0
 800091c:	f107 0318 	add.w	r3, r7, #24
 8000920:	4611      	mov	r1, r2
 8000922:	4618      	mov	r0, r3
 8000924:	f000 fa7e 	bl	8000e24 <__usart1_print>

}
 8000928:	bf00      	nop
 800092a:	f507 770a 	add.w	r7, r7, #552	@ 0x228
 800092e:	46bd      	mov	sp, r7
 8000930:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
 8000934:	b004      	add	sp, #16
 8000936:	4770      	bx	lr

08000938 <enterCRITICAL>:


extern semaphore_t sem_usart1;
extern uint8_t process_count;

void enterCRITICAL(void) { __disable_irq(); }
 8000938:	b480      	push	{r7}
 800093a:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsid i" : : : "memory");
 800093c:	b672      	cpsid	i
}
 800093e:	bf00      	nop
 8000940:	bf00      	nop
 8000942:	46bd      	mov	sp, r7
 8000944:	bc80      	pop	{r7}
 8000946:	4770      	bx	lr

08000948 <exitCRITICAL>:

void exitCRITICAL(void) { __enable_irq(); }
 8000948:	b480      	push	{r7}
 800094a:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsie i" : : : "memory");
 800094c:	b662      	cpsie	i
}
 800094e:	bf00      	nop
 8000950:	bf00      	nop
 8000952:	46bd      	mov	sp, r7
 8000954:	bc80      	pop	{r7}
 8000956:	4770      	bx	lr

08000958 <syscall__printf>:

void syscall__printf(const char *msg, ...) {
 8000958:	b40f      	push	{r0, r1, r2, r3}
 800095a:	b580      	push	{r7, lr}
 800095c:	b082      	sub	sp, #8
 800095e:	af00      	add	r7, sp, #0
  semaphore_lock(&sem_usart1);
 8000960:	4809      	ldr	r0, [pc, #36]	@ (8000988 <syscall__printf+0x30>)
 8000962:	f7ff fdb7 	bl	80004d4 <semaphore_lock>
  
  // pass all the function parameter to printf ();

  va_list args;
  va_start (args, msg);
 8000966:	f107 0314 	add.w	r3, r7, #20
 800096a:	607b      	str	r3, [r7, #4]

  printf (msg, args);
 800096c:	6879      	ldr	r1, [r7, #4]
 800096e:	6938      	ldr	r0, [r7, #16]
 8000970:	f7ff ff04 	bl	800077c <printf>

  va_end(args);
  semaphore_unlock(&sem_usart1);
 8000974:	4804      	ldr	r0, [pc, #16]	@ (8000988 <syscall__printf+0x30>)
 8000976:	f7ff fdd7 	bl	8000528 <semaphore_unlock>
}
 800097a:	bf00      	nop
 800097c:	3708      	adds	r7, #8
 800097e:	46bd      	mov	sp, r7
 8000980:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
 8000984:	b004      	add	sp, #16
 8000986:	4770      	bx	lr
 8000988:	2000002c 	.word	0x2000002c

0800098c <syscall__scanf>:

void syscall__scanf(const char* msg, ...) {
 800098c:	b40f      	push	{r0, r1, r2, r3}
 800098e:	b480      	push	{r7}
 8000990:	af00      	add	r7, sp, #0

  while (1)
 8000992:	e7fe      	b.n	8000992 <syscall__scanf+0x6>

08000994 <syscall__process_exit>:
    ;
}

void syscall__process_exit (uint32_t status) {
 8000994:	b580      	push	{r7, lr}
 8000996:	b082      	sub	sp, #8
 8000998:	af00      	add	r7, sp, #0
 800099a:	6078      	str	r0, [r7, #4]
  process_exit (status);
 800099c:	6878      	ldr	r0, [r7, #4]
 800099e:	f000 f823 	bl	80009e8 <process_exit>
}
 80009a2:	bf00      	nop
 80009a4:	3708      	adds	r7, #8
 80009a6:	46bd      	mov	sp, r7
 80009a8:	bd80      	pop	{r7, pc}
 80009aa:	bf00      	nop

080009ac <__NVIC_SetPendingIRQ>:
{
 80009ac:	b480      	push	{r7}
 80009ae:	b083      	sub	sp, #12
 80009b0:	af00      	add	r7, sp, #0
 80009b2:	4603      	mov	r3, r0
 80009b4:	71fb      	strb	r3, [r7, #7]
  if ((int32_t)(IRQn) >= 0)
 80009b6:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80009ba:	2b00      	cmp	r3, #0
 80009bc:	db0c      	blt.n	80009d8 <__NVIC_SetPendingIRQ+0x2c>
    NVIC->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
 80009be:	79fb      	ldrb	r3, [r7, #7]
 80009c0:	f003 021f 	and.w	r2, r3, #31
 80009c4:	4907      	ldr	r1, [pc, #28]	@ (80009e4 <__NVIC_SetPendingIRQ+0x38>)
 80009c6:	f997 3007 	ldrsb.w	r3, [r7, #7]
 80009ca:	095b      	lsrs	r3, r3, #5
 80009cc:	2001      	movs	r0, #1
 80009ce:	fa00 f202 	lsl.w	r2, r0, r2
 80009d2:	3340      	adds	r3, #64	@ 0x40
 80009d4:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
}
 80009d8:	bf00      	nop
 80009da:	370c      	adds	r7, #12
 80009dc:	46bd      	mov	sp, r7
 80009de:	bc80      	pop	{r7}
 80009e0:	4770      	bx	lr
 80009e2:	bf00      	nop
 80009e4:	e000e100 	.word	0xe000e100

080009e8 <process_exit>:
void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind);
void launch_process (void);


// if any of the process returns from mainx funcktion, this function wwill be called
void process_exit (uint32_t status) {
 80009e8:	b580      	push	{r7, lr}
 80009ea:	b084      	sub	sp, #16
 80009ec:	af00      	add	r7, sp, #0
 80009ee:	6078      	str	r0, [r7, #4]
  // do what ever you want with the status

  // i dont know why i was getting hardfault when using <*(user_process_t **) RUNNING_PROCESS_AD> T_T 
  // got it .. should have used () to enclosed the constant in define.h file !!!
  user_process_t *process = *(user_process_t **)(RUNNING_PROCESS_AD);
 80009f0:	4b0a      	ldr	r3, [pc, #40]	@ (8000a1c <process_exit+0x34>)
 80009f2:	681b      	ldr	r3, [r3, #0]
 80009f4:	60fb      	str	r3, [r7, #12]
  uint32_t process_id = process->process_id;
 80009f6:	68fb      	ldr	r3, [r7, #12]
 80009f8:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 80009fa:	60bb      	str	r3, [r7, #8]
  printf ("process with process id <%d> is terminated \n\r",
 80009fc:	68b9      	ldr	r1, [r7, #8]
 80009fe:	4808      	ldr	r0, [pc, #32]	@ (8000a20 <process_exit+0x38>)
 8000a00:	f7ff febc 	bl	800077c <printf>
            process_id);
  // remove the process from the queue , call context switching and return
  
  // suspend the process
  process -> state = SUSPEND_STATE;
 8000a04:	68fb      	ldr	r3, [r7, #12]
 8000a06:	2202      	movs	r2, #2
 8000a08:	62da      	str	r2, [r3, #44]	@ 0x2c
 
  // set the pendsv (to trigger context switching)
  NVIC_SetPendingIRQ (PendSV_IRQn);
 8000a0a:	f06f 0001 	mvn.w	r0, #1
 8000a0e:	f7ff ffcd 	bl	80009ac <__NVIC_SetPendingIRQ>
}
 8000a12:	bf00      	nop
 8000a14:	3710      	adds	r7, #16
 8000a16:	46bd      	mov	sp, r7
 8000a18:	bd80      	pop	{r7, pc}
 8000a1a:	bf00      	nop
 8000a1c:	20016004 	.word	0x20016004
 8000a20:	080011d4 	.word	0x080011d4

08000a24 <main>:

int main() {
 8000a24:	b580      	push	{r7, lr}
 8000a26:	b086      	sub	sp, #24
 8000a28:	af00      	add	r7, sp, #0

    SCB->SHP[10] = 0xff;    // set the PendSV to be the lowest priority...
 8000a2a:	4b53      	ldr	r3, [pc, #332]	@ (8000b78 <main+0x154>)
 8000a2c:	22ff      	movs	r2, #255	@ 0xff
 8000a2e:	f883 2022 	strb.w	r2, [r3, #34]	@ 0x22

    /* some init code */
    __usart1_init ();
 8000a32:	f000 f9b5 	bl	8000da0 <__usart1_init>
    queue_init (&ready_queue);
 8000a36:	4851      	ldr	r0, [pc, #324]	@ (8000b7c <main+0x158>)
 8000a38:	f7ff fc50 	bl	80002dc <queue_init>
    semaphore_init (&sem_usart1, 1);
 8000a3c:	2101      	movs	r1, #1
 8000a3e:	4850      	ldr	r0, [pc, #320]	@ (8000b80 <main+0x15c>)
 8000a40:	f7ff fd36 	bl	80004b0 <semaphore_init>

    if (process_count < 1 || process_count > MAX_PROCESS_NUM){
 8000a44:	4b4f      	ldr	r3, [pc, #316]	@ (8000b84 <main+0x160>)
 8000a46:	781b      	ldrb	r3, [r3, #0]
 8000a48:	2b00      	cmp	r3, #0
 8000a4a:	d003      	beq.n	8000a54 <main+0x30>
 8000a4c:	4b4d      	ldr	r3, [pc, #308]	@ (8000b84 <main+0x160>)
 8000a4e:	781b      	ldrb	r3, [r3, #0]
 8000a50:	2b0f      	cmp	r3, #15
 8000a52:	d903      	bls.n	8000a5c <main+0x38>
        printf ("ERROR in the number of process ....\n\r");
 8000a54:	484c      	ldr	r0, [pc, #304]	@ (8000b88 <main+0x164>)
 8000a56:	f7ff fe91 	bl	800077c <printf>
        while (1);
 8000a5a:	e7fe      	b.n	8000a5a <main+0x36>
    }

    /******************** fault handler init ***************************/
    
    // enable faults (without this any fault = hardfault)
    SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;
 8000a5c:	4b46      	ldr	r3, [pc, #280]	@ (8000b78 <main+0x154>)
 8000a5e:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000a60:	4a45      	ldr	r2, [pc, #276]	@ (8000b78 <main+0x154>)
 8000a62:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
 8000a66:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;
 8000a68:	4b43      	ldr	r3, [pc, #268]	@ (8000b78 <main+0x154>)
 8000a6a:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000a6c:	4a42      	ldr	r2, [pc, #264]	@ (8000b78 <main+0x154>)
 8000a6e:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
 8000a72:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;
 8000a74:	4b40      	ldr	r3, [pc, #256]	@ (8000b78 <main+0x154>)
 8000a76:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000a78:	4a3f      	ldr	r2, [pc, #252]	@ (8000b78 <main+0x154>)
 8000a7a:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 8000a7e:	6253      	str	r3, [r2, #36]	@ 0x24



    /* init syscall table */
    Syscall_Table[0] =  (void (*) (void))syscall__printf;
 8000a80:	4b42      	ldr	r3, [pc, #264]	@ (8000b8c <main+0x168>)
 8000a82:	4a43      	ldr	r2, [pc, #268]	@ (8000b90 <main+0x16c>)
 8000a84:	601a      	str	r2, [r3, #0]
    Syscall_Table[1] =  (void (*) (void))syscall__scanf;
 8000a86:	4b41      	ldr	r3, [pc, #260]	@ (8000b8c <main+0x168>)
 8000a88:	4a42      	ldr	r2, [pc, #264]	@ (8000b94 <main+0x170>)
 8000a8a:	605a      	str	r2, [r3, #4]
    Syscall_Table[2] =  (void (*) (void))syscall__process_exit;
 8000a8c:	4b3f      	ldr	r3, [pc, #252]	@ (8000b8c <main+0x168>)
 8000a8e:	4a42      	ldr	r2, [pc, #264]	@ (8000b98 <main+0x174>)
 8000a90:	609a      	str	r2, [r3, #8]

    *(uint32_t *)(SYSCALL_TABLE_AD) = (uint32_t)(Syscall_Table);
 8000a92:	4b42      	ldr	r3, [pc, #264]	@ (8000b9c <main+0x178>)
 8000a94:	4a3d      	ldr	r2, [pc, #244]	@ (8000b8c <main+0x168>)
 8000a96:	601a      	str	r2, [r3, #0]
    
    uint32_t psp_val = USER_STACK_INIT;
 8000a98:	4b41      	ldr	r3, [pc, #260]	@ (8000ba0 <main+0x17c>)
 8000a9a:	617b      	str	r3, [r7, #20]
    uint32_t msp_val = KERNEL_STACK_INIT;
 8000a9c:	4b41      	ldr	r3, [pc, #260]	@ (8000ba4 <main+0x180>)
 8000a9e:	613b      	str	r3, [r7, #16]
    uint32_t user_stack_size = USER_STACK_SIZE / process_count;
 8000aa0:	4b38      	ldr	r3, [pc, #224]	@ (8000b84 <main+0x160>)
 8000aa2:	781b      	ldrb	r3, [r3, #0]
 8000aa4:	461a      	mov	r2, r3
 8000aa6:	f44f 4300 	mov.w	r3, #32768	@ 0x8000
 8000aaa:	fb93 f3f2 	sdiv	r3, r3, r2
 8000aae:	60bb      	str	r3, [r7, #8]
    uint32_t kernel_stack_size = KERNEL_STACK_SIZE / process_count;
 8000ab0:	4b34      	ldr	r3, [pc, #208]	@ (8000b84 <main+0x160>)
 8000ab2:	781b      	ldrb	r3, [r3, #0]
 8000ab4:	461a      	mov	r2, r3
 8000ab6:	f44f 43c0 	mov.w	r3, #24576	@ 0x6000
 8000aba:	fb93 f3f2 	sdiv	r3, r3, r2
 8000abe:	607b      	str	r3, [r7, #4]

    /* fill the pcs */
    process_pc [0] = main1;
 8000ac0:	4b39      	ldr	r3, [pc, #228]	@ (8000ba8 <main+0x184>)
 8000ac2:	4a3a      	ldr	r2, [pc, #232]	@ (8000bac <main+0x188>)
 8000ac4:	601a      	str	r2, [r3, #0]
    process_pc [1] = main2;
 8000ac6:	4b38      	ldr	r3, [pc, #224]	@ (8000ba8 <main+0x184>)
 8000ac8:	4a39      	ldr	r2, [pc, #228]	@ (8000bb0 <main+0x18c>)
 8000aca:	605a      	str	r2, [r3, #4]
    process_pc [2] = main3;
 8000acc:	4b36      	ldr	r3, [pc, #216]	@ (8000ba8 <main+0x184>)
 8000ace:	4a39      	ldr	r2, [pc, #228]	@ (8000bb4 <main+0x190>)
 8000ad0:	609a      	str	r2, [r3, #8]
    process_pc [3] = main4;
 8000ad2:	4b35      	ldr	r3, [pc, #212]	@ (8000ba8 <main+0x184>)
 8000ad4:	4a38      	ldr	r2, [pc, #224]	@ (8000bb8 <main+0x194>)
 8000ad6:	60da      	str	r2, [r3, #12]
    process_pc [4] = main5;
 8000ad8:	4b33      	ldr	r3, [pc, #204]	@ (8000ba8 <main+0x184>)
 8000ada:	4a38      	ldr	r2, [pc, #224]	@ (8000bbc <main+0x198>)
 8000adc:	611a      	str	r2, [r3, #16]
    process_pc [5] = main6;
 8000ade:	4b32      	ldr	r3, [pc, #200]	@ (8000ba8 <main+0x184>)
 8000ae0:	4a37      	ldr	r2, [pc, #220]	@ (8000bc0 <main+0x19c>)
 8000ae2:	615a      	str	r2, [r3, #20]
    process_pc [6] = main7;
 8000ae4:	4b30      	ldr	r3, [pc, #192]	@ (8000ba8 <main+0x184>)
 8000ae6:	4a37      	ldr	r2, [pc, #220]	@ (8000bc4 <main+0x1a0>)
 8000ae8:	619a      	str	r2, [r3, #24]
    process_pc [7] = main8;
 8000aea:	4b2f      	ldr	r3, [pc, #188]	@ (8000ba8 <main+0x184>)
 8000aec:	4a36      	ldr	r2, [pc, #216]	@ (8000bc8 <main+0x1a4>)
 8000aee:	61da      	str	r2, [r3, #28]
    process_pc [8] = main9;
 8000af0:	4b2d      	ldr	r3, [pc, #180]	@ (8000ba8 <main+0x184>)
 8000af2:	4a36      	ldr	r2, [pc, #216]	@ (8000bcc <main+0x1a8>)
 8000af4:	621a      	str	r2, [r3, #32]
    process_pc [9] = main10;
 8000af6:	4b2c      	ldr	r3, [pc, #176]	@ (8000ba8 <main+0x184>)
 8000af8:	4a35      	ldr	r2, [pc, #212]	@ (8000bd0 <main+0x1ac>)
 8000afa:	625a      	str	r2, [r3, #36]	@ 0x24
    process_pc [10] = main11;
 8000afc:	4b2a      	ldr	r3, [pc, #168]	@ (8000ba8 <main+0x184>)
 8000afe:	4a35      	ldr	r2, [pc, #212]	@ (8000bd4 <main+0x1b0>)
 8000b00:	629a      	str	r2, [r3, #40]	@ 0x28
    process_pc [11] = main12;
 8000b02:	4b29      	ldr	r3, [pc, #164]	@ (8000ba8 <main+0x184>)
 8000b04:	4a34      	ldr	r2, [pc, #208]	@ (8000bd8 <main+0x1b4>)
 8000b06:	62da      	str	r2, [r3, #44]	@ 0x2c
    process_pc [12] = main13;
 8000b08:	4b27      	ldr	r3, [pc, #156]	@ (8000ba8 <main+0x184>)
 8000b0a:	4a34      	ldr	r2, [pc, #208]	@ (8000bdc <main+0x1b8>)
 8000b0c:	631a      	str	r2, [r3, #48]	@ 0x30
    process_pc [13] = main14;
 8000b0e:	4b26      	ldr	r3, [pc, #152]	@ (8000ba8 <main+0x184>)
 8000b10:	4a33      	ldr	r2, [pc, #204]	@ (8000be0 <main+0x1bc>)
 8000b12:	635a      	str	r2, [r3, #52]	@ 0x34
    process_pc [14] = main15;
 8000b14:	4b24      	ldr	r3, [pc, #144]	@ (8000ba8 <main+0x184>)
 8000b16:	4a33      	ldr	r2, [pc, #204]	@ (8000be4 <main+0x1c0>)
 8000b18:	639a      	str	r2, [r3, #56]	@ 0x38

    for (uint8_t i=0; i<process_count; i++){
 8000b1a:	2300      	movs	r3, #0
 8000b1c:	73fb      	strb	r3, [r7, #15]
 8000b1e:	e01d      	b.n	8000b5c <main+0x138>
        make_process (&process[i], psp_val, msp_val, i);
 8000b20:	7bfb      	ldrb	r3, [r7, #15]
 8000b22:	2234      	movs	r2, #52	@ 0x34
 8000b24:	fb02 f303 	mul.w	r3, r2, r3
 8000b28:	4a2f      	ldr	r2, [pc, #188]	@ (8000be8 <main+0x1c4>)
 8000b2a:	1898      	adds	r0, r3, r2
 8000b2c:	7bfb      	ldrb	r3, [r7, #15]
 8000b2e:	693a      	ldr	r2, [r7, #16]
 8000b30:	6979      	ldr	r1, [r7, #20]
 8000b32:	f000 f85d 	bl	8000bf0 <make_process>
        psp_val -= user_stack_size;
 8000b36:	697a      	ldr	r2, [r7, #20]
 8000b38:	68bb      	ldr	r3, [r7, #8]
 8000b3a:	1ad3      	subs	r3, r2, r3
 8000b3c:	617b      	str	r3, [r7, #20]
        msp_val -= kernel_stack_size;
 8000b3e:	693a      	ldr	r2, [r7, #16]
 8000b40:	687b      	ldr	r3, [r7, #4]
 8000b42:	1ad3      	subs	r3, r2, r3
 8000b44:	613b      	str	r3, [r7, #16]
        /* make stack pointers word aligned */
        psp_val &= ~(3);
 8000b46:	697b      	ldr	r3, [r7, #20]
 8000b48:	f023 0303 	bic.w	r3, r3, #3
 8000b4c:	617b      	str	r3, [r7, #20]
        msp_val &= ~(3);
 8000b4e:	693b      	ldr	r3, [r7, #16]
 8000b50:	f023 0303 	bic.w	r3, r3, #3
 8000b54:	613b      	str	r3, [r7, #16]
    for (uint8_t i=0; i<process_count; i++){
 8000b56:	7bfb      	ldrb	r3, [r7, #15]
 8000b58:	3301      	adds	r3, #1
 8000b5a:	73fb      	strb	r3, [r7, #15]
 8000b5c:	4b09      	ldr	r3, [pc, #36]	@ (8000b84 <main+0x160>)
 8000b5e:	781b      	ldrb	r3, [r3, #0]
 8000b60:	7bfa      	ldrb	r2, [r7, #15]
 8000b62:	429a      	cmp	r2, r3
 8000b64:	d3dc      	bcc.n	8000b20 <main+0xfc>
 
    /* accessing illegal address in kernel code -> Kernel Panic*/
//    *(uint32_t*) (0xffffffff) = 5;

    /*impose user restriction*/
    mpu_setup ();
 8000b66:	f7ff fb85 	bl	8000274 <mpu_setup>

    /* start the processes */
    launch_process();
 8000b6a:	f000 f8bd 	bl	8000ce8 <launch_process>
    // TODO
    // transfer the control to this section from user space if there is no process to be run


    // if all the processes are done
    printf ("all the processes are done executing \n\r");
 8000b6e:	481f      	ldr	r0, [pc, #124]	@ (8000bec <main+0x1c8>)
 8000b70:	f7ff fe04 	bl	800077c <printf>
    while (1);
 8000b74:	e7fe      	b.n	8000b74 <main+0x150>
 8000b76:	bf00      	nop
 8000b78:	e000ed00 	.word	0xe000ed00
 8000b7c:	200003f4 	.word	0x200003f4
 8000b80:	2000002c 	.word	0x2000002c
 8000b84:	20000000 	.word	0x20000000
 8000b88:	08001204 	.word	0x08001204
 8000b8c:	20000004 	.word	0x20000004
 8000b90:	08000959 	.word	0x08000959
 8000b94:	0800098d 	.word	0x0800098d
 8000b98:	08000995 	.word	0x08000995
 8000b9c:	2001600c 	.word	0x2001600c
 8000ba0:	20010000 	.word	0x20010000
 8000ba4:	20016000 	.word	0x20016000
 8000ba8:	200003b8 	.word	0x200003b8
 8000bac:	08010279 	.word	0x08010279
 8000bb0:	08010109 	.word	0x08010109
 8000bb4:	08010135 	.word	0x08010135
 8000bb8:	08010171 	.word	0x08010171
 8000bbc:	0801019d 	.word	0x0801019d
 8000bc0:	080101c9 	.word	0x080101c9
 8000bc4:	080101f5 	.word	0x080101f5
 8000bc8:	08010221 	.word	0x08010221
 8000bcc:	0801024d 	.word	0x0801024d
 8000bd0:	08010001 	.word	0x08010001
 8000bd4:	0801002d 	.word	0x0801002d
 8000bd8:	08010059 	.word	0x08010059
 8000bdc:	08010085 	.word	0x08010085
 8000be0:	080100b1 	.word	0x080100b1
 8000be4:	080100dd 	.word	0x080100dd
 8000be8:	200000ac 	.word	0x200000ac
 8000bec:	0800122c 	.word	0x0800122c

08000bf0 <make_process>:
}

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t process_id){
 8000bf0:	b480      	push	{r7}
 8000bf2:	b087      	sub	sp, #28
 8000bf4:	af00      	add	r7, sp, #0
 8000bf6:	60f8      	str	r0, [r7, #12]
 8000bf8:	60b9      	str	r1, [r7, #8]
 8000bfa:	607a      	str	r2, [r7, #4]
 8000bfc:	70fb      	strb	r3, [r7, #3]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;
 8000bfe:	68fb      	ldr	r3, [r7, #12]
 8000c00:	2200      	movs	r2, #0
 8000c02:	61da      	str	r2, [r3, #28]
 8000c04:	68fb      	ldr	r3, [r7, #12]
 8000c06:	69da      	ldr	r2, [r3, #28]
 8000c08:	68fb      	ldr	r3, [r7, #12]
 8000c0a:	619a      	str	r2, [r3, #24]
 8000c0c:	68fb      	ldr	r3, [r7, #12]
 8000c0e:	699a      	ldr	r2, [r3, #24]
 8000c10:	68fb      	ldr	r3, [r7, #12]
 8000c12:	615a      	str	r2, [r3, #20]
 8000c14:	68fb      	ldr	r3, [r7, #12]
 8000c16:	695a      	ldr	r2, [r3, #20]
 8000c18:	68fb      	ldr	r3, [r7, #12]
 8000c1a:	611a      	str	r2, [r3, #16]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
 8000c1c:	68fb      	ldr	r3, [r7, #12]
 8000c1e:	691a      	ldr	r2, [r3, #16]
 8000c20:	68fb      	ldr	r3, [r7, #12]
 8000c22:	60da      	str	r2, [r3, #12]
 8000c24:	68fb      	ldr	r3, [r7, #12]
 8000c26:	68da      	ldr	r2, [r3, #12]
 8000c28:	68fb      	ldr	r3, [r7, #12]
 8000c2a:	609a      	str	r2, [r3, #8]
 8000c2c:	68fb      	ldr	r3, [r7, #12]
 8000c2e:	689a      	ldr	r2, [r3, #8]
 8000c30:	68fb      	ldr	r3, [r7, #12]
 8000c32:	605a      	str	r2, [r3, #4]
 8000c34:	68fb      	ldr	r3, [r7, #12]
 8000c36:	685a      	ldr	r2, [r3, #4]
 8000c38:	68fb      	ldr	r3, [r7, #12]
 8000c3a:	601a      	str	r2, [r3, #0]

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;
 8000c3c:	68fb      	ldr	r3, [r7, #12]
 8000c3e:	f06f 0202 	mvn.w	r2, #2
 8000c42:	629a      	str	r2, [r3, #40]	@ 0x28



    //process->pc = (uint32_t) fun;
    process->psp = psp;
 8000c44:	68fb      	ldr	r3, [r7, #12]
 8000c46:	68ba      	ldr	r2, [r7, #8]
 8000c48:	621a      	str	r2, [r3, #32]
    process->msp = msp;
 8000c4a:	68fb      	ldr	r3, [r7, #12]
 8000c4c:	687a      	ldr	r2, [r7, #4]
 8000c4e:	625a      	str	r2, [r3, #36]	@ 0x24
    process->psp -= 8*4;        // start from 8 word below the base of the stack
 8000c50:	68fb      	ldr	r3, [r7, #12]
 8000c52:	6a1b      	ldr	r3, [r3, #32]
 8000c54:	f1a3 0220 	sub.w	r2, r3, #32
 8000c58:	68fb      	ldr	r3, [r7, #12]
 8000c5a:	621a      	str	r2, [r3, #32]
    represent thumb state 
    */

    // put the lr value in stack if you want to be able to return from the user process
  
    for (int i=0; i<8; i++){
 8000c5c:	2300      	movs	r3, #0
 8000c5e:	617b      	str	r3, [r7, #20]
 8000c60:	e032      	b.n	8000cc8 <make_process+0xd8>
        if (i == 5) {
 8000c62:	697b      	ldr	r3, [r7, #20]
 8000c64:	2b05      	cmp	r3, #5
 8000c66:	d108      	bne.n	8000c7a <make_process+0x8a>
          *(uint32_t *)(process->psp+i*4) = (uint32_t ) user_process_exit;
 8000c68:	68fb      	ldr	r3, [r7, #12]
 8000c6a:	6a1b      	ldr	r3, [r3, #32]
 8000c6c:	697a      	ldr	r2, [r7, #20]
 8000c6e:	0092      	lsls	r2, r2, #2
 8000c70:	4413      	add	r3, r2
 8000c72:	461a      	mov	r2, r3
 8000c74:	4b1a      	ldr	r3, [pc, #104]	@ (8000ce0 <make_process+0xf0>)
 8000c76:	6013      	str	r3, [r2, #0]
 8000c78:	e023      	b.n	8000cc2 <make_process+0xd2>
        }
        else if (i == 6)
 8000c7a:	697b      	ldr	r3, [r7, #20]
 8000c7c:	2b06      	cmp	r3, #6
 8000c7e:	d10b      	bne.n	8000c98 <make_process+0xa8>
            *(uint32_t *)(process->psp+i*4) =
                    (uint32_t) process_pc [process_id];
 8000c80:	78fb      	ldrb	r3, [r7, #3]
 8000c82:	4a18      	ldr	r2, [pc, #96]	@ (8000ce4 <make_process+0xf4>)
 8000c84:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
            *(uint32_t *)(process->psp+i*4) =
 8000c88:	68fb      	ldr	r3, [r7, #12]
 8000c8a:	6a1b      	ldr	r3, [r3, #32]
 8000c8c:	697a      	ldr	r2, [r7, #20]
 8000c8e:	0092      	lsls	r2, r2, #2
 8000c90:	4413      	add	r3, r2
                    (uint32_t) process_pc [process_id];
 8000c92:	460a      	mov	r2, r1
            *(uint32_t *)(process->psp+i*4) =
 8000c94:	601a      	str	r2, [r3, #0]
 8000c96:	e014      	b.n	8000cc2 <make_process+0xd2>
        else if (i == 7)
 8000c98:	697b      	ldr	r3, [r7, #20]
 8000c9a:	2b07      	cmp	r3, #7
 8000c9c:	d109      	bne.n	8000cb2 <make_process+0xc2>
            *(uint32_t *)(process->psp+i*4) = 0x01000000;
 8000c9e:	68fb      	ldr	r3, [r7, #12]
 8000ca0:	6a1b      	ldr	r3, [r3, #32]
 8000ca2:	697a      	ldr	r2, [r7, #20]
 8000ca4:	0092      	lsls	r2, r2, #2
 8000ca6:	4413      	add	r3, r2
 8000ca8:	461a      	mov	r2, r3
 8000caa:	f04f 7380 	mov.w	r3, #16777216	@ 0x1000000
 8000cae:	6013      	str	r3, [r2, #0]
 8000cb0:	e007      	b.n	8000cc2 <make_process+0xd2>
        else 
            *(uint32_t *)(process->psp+i*4) = 0x0;
 8000cb2:	68fb      	ldr	r3, [r7, #12]
 8000cb4:	6a1b      	ldr	r3, [r3, #32]
 8000cb6:	697a      	ldr	r2, [r7, #20]
 8000cb8:	0092      	lsls	r2, r2, #2
 8000cba:	4413      	add	r3, r2
 8000cbc:	461a      	mov	r2, r3
 8000cbe:	2300      	movs	r3, #0
 8000cc0:	6013      	str	r3, [r2, #0]
    for (int i=0; i<8; i++){
 8000cc2:	697b      	ldr	r3, [r7, #20]
 8000cc4:	3301      	adds	r3, #1
 8000cc6:	617b      	str	r3, [r7, #20]
 8000cc8:	697b      	ldr	r3, [r7, #20]
 8000cca:	2b07      	cmp	r3, #7
 8000ccc:	ddc9      	ble.n	8000c62 <make_process+0x72>
    }
    
    process-> process_id = process_id;
 8000cce:	78fa      	ldrb	r2, [r7, #3]
 8000cd0:	68fb      	ldr	r3, [r7, #12]
 8000cd2:	631a      	str	r2, [r3, #48]	@ 0x30

}
 8000cd4:	bf00      	nop
 8000cd6:	371c      	adds	r7, #28
 8000cd8:	46bd      	mov	sp, r7
 8000cda:	bc80      	pop	{r7}
 8000cdc:	4770      	bx	lr
 8000cde:	bf00      	nop
 8000ce0:	080102b9 	.word	0x080102b9
 8000ce4:	200003b8 	.word	0x200003b8

08000ce8 <launch_process>:

void  launch_process (void){
 8000ce8:	b580      	push	{r7, lr}
 8000cea:	b082      	sub	sp, #8
 8000cec:	af00      	add	r7, sp, #0
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process[0].psp);
 8000cee:	4b27      	ldr	r3, [pc, #156]	@ (8000d8c <launch_process+0xa4>)
 8000cf0:	6a1b      	ldr	r3, [r3, #32]
 8000cf2:	4618      	mov	r0, r3
 8000cf4:	f000 f8c8 	bl	8000e88 <__asm__set_psp>
    __asm__set_msp (process[0].msp);
 8000cf8:	4b24      	ldr	r3, [pc, #144]	@ (8000d8c <launch_process+0xa4>)
 8000cfa:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000cfc:	4618      	mov	r0, r3
 8000cfe:	f000 f8c6 	bl	8000e8e <__asm__set_msp>
       

    SysTick->LOAD = 16000 - 1;
 8000d02:	4b23      	ldr	r3, [pc, #140]	@ (8000d90 <launch_process+0xa8>)
 8000d04:	f643 627f 	movw	r2, #15999	@ 0x3e7f
 8000d08:	605a      	str	r2, [r3, #4]
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
 8000d0a:	4b21      	ldr	r3, [pc, #132]	@ (8000d90 <launch_process+0xa8>)
 8000d0c:	681b      	ldr	r3, [r3, #0]
 8000d0e:	4a20      	ldr	r2, [pc, #128]	@ (8000d90 <launch_process+0xa8>)
 8000d10:	f043 0307 	orr.w	r3, r3, #7
 8000d14:	6013      	str	r3, [r2, #0]
            | SysTick_CTRL_ENABLE_Msk);

    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process[0]);
 8000d16:	4b1f      	ldr	r3, [pc, #124]	@ (8000d94 <launch_process+0xac>)
 8000d18:	4a1c      	ldr	r2, [pc, #112]	@ (8000d8c <launch_process+0xa4>)
 8000d1a:	601a      	str	r2, [r3, #0]

    /* initially all the processes will be placed in the ready queue except the first one (entry point) */
    for (uint8_t i=1; i<process_count; i++){
 8000d1c:	2301      	movs	r3, #1
 8000d1e:	71fb      	strb	r3, [r7, #7]
 8000d20:	e012      	b.n	8000d48 <launch_process+0x60>
        int status = queue_push (&ready_queue, &process[i]);
 8000d22:	79fb      	ldrb	r3, [r7, #7]
 8000d24:	2234      	movs	r2, #52	@ 0x34
 8000d26:	fb02 f303 	mul.w	r3, r2, r3
 8000d2a:	4a18      	ldr	r2, [pc, #96]	@ (8000d8c <launch_process+0xa4>)
 8000d2c:	4413      	add	r3, r2
 8000d2e:	4619      	mov	r1, r3
 8000d30:	4819      	ldr	r0, [pc, #100]	@ (8000d98 <launch_process+0xb0>)
 8000d32:	f7ff fae8 	bl	8000306 <queue_push>
 8000d36:	4603      	mov	r3, r0
 8000d38:	603b      	str	r3, [r7, #0]
        if (status){
 8000d3a:	683b      	ldr	r3, [r7, #0]
 8000d3c:	2b00      	cmp	r3, #0
 8000d3e:	d000      	beq.n	8000d42 <launch_process+0x5a>
            while (1);
 8000d40:	e7fe      	b.n	8000d40 <launch_process+0x58>
    for (uint8_t i=1; i<process_count; i++){
 8000d42:	79fb      	ldrb	r3, [r7, #7]
 8000d44:	3301      	adds	r3, #1
 8000d46:	71fb      	strb	r3, [r7, #7]
 8000d48:	4b14      	ldr	r3, [pc, #80]	@ (8000d9c <launch_process+0xb4>)
 8000d4a:	781b      	ldrb	r3, [r3, #0]
 8000d4c:	79fa      	ldrb	r2, [r7, #7]
 8000d4e:	429a      	cmp	r2, r3
 8000d50:	d3e7      	bcc.n	8000d22 <launch_process+0x3a>
        }
    }

    process[0].state = RUNNING_STATE;
 8000d52:	4b0e      	ldr	r3, [pc, #56]	@ (8000d8c <launch_process+0xa4>)
 8000d54:	2201      	movs	r2, #1
 8000d56:	62da      	str	r2, [r3, #44]	@ 0x2c
    for (uint8_t i=1; i<process_count; i++){
 8000d58:	2301      	movs	r3, #1
 8000d5a:	71bb      	strb	r3, [r7, #6]
 8000d5c:	e00b      	b.n	8000d76 <launch_process+0x8e>
        process[i].state = READY_STATE;
 8000d5e:	79bb      	ldrb	r3, [r7, #6]
 8000d60:	4a0a      	ldr	r2, [pc, #40]	@ (8000d8c <launch_process+0xa4>)
 8000d62:	2134      	movs	r1, #52	@ 0x34
 8000d64:	fb01 f303 	mul.w	r3, r1, r3
 8000d68:	4413      	add	r3, r2
 8000d6a:	332c      	adds	r3, #44	@ 0x2c
 8000d6c:	2200      	movs	r2, #0
 8000d6e:	601a      	str	r2, [r3, #0]
    for (uint8_t i=1; i<process_count; i++){
 8000d70:	79bb      	ldrb	r3, [r7, #6]
 8000d72:	3301      	adds	r3, #1
 8000d74:	71bb      	strb	r3, [r7, #6]
 8000d76:	4b09      	ldr	r3, [pc, #36]	@ (8000d9c <launch_process+0xb4>)
 8000d78:	781b      	ldrb	r3, [r3, #0]
 8000d7a:	79ba      	ldrb	r2, [r7, #6]
 8000d7c:	429a      	cmp	r2, r3
 8000d7e:	d3ee      	bcc.n	8000d5e <launch_process+0x76>
    }
 
    __asm__launch_main1();
 8000d80:	f00f fa90 	bl	80102a4 <__asm__launch_main1>

}
 8000d84:	bf00      	nop
 8000d86:	3708      	adds	r7, #8
 8000d88:	46bd      	mov	sp, r7
 8000d8a:	bd80      	pop	{r7, pc}
 8000d8c:	200000ac 	.word	0x200000ac
 8000d90:	e000e010 	.word	0xe000e010
 8000d94:	20016004 	.word	0x20016004
 8000d98:	200003f4 	.word	0x200003f4
 8000d9c:	20000000 	.word	0x20000000

08000da0 <__usart1_init>:
#include "core.h"
#include "usart.h"

void __usart1_init(void) {
 8000da0:	b480      	push	{r7}
 8000da2:	af00      	add	r7, sp, #0

  RCC->APB2ENR |= RCC_APB2ENR_USART1EN_Msk;
 8000da4:	4b1c      	ldr	r3, [pc, #112]	@ (8000e18 <__usart1_init+0x78>)
 8000da6:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 8000da8:	4a1b      	ldr	r2, [pc, #108]	@ (8000e18 <__usart1_init+0x78>)
 8000daa:	f043 0310 	orr.w	r3, r3, #16
 8000dae:	6453      	str	r3, [r2, #68]	@ 0x44
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
 8000db0:	4b19      	ldr	r3, [pc, #100]	@ (8000e18 <__usart1_init+0x78>)
 8000db2:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8000db4:	4a18      	ldr	r2, [pc, #96]	@ (8000e18 <__usart1_init+0x78>)
 8000db6:	f043 0301 	orr.w	r3, r3, #1
 8000dba:	6313      	str	r3, [r2, #48]	@ 0x30
  // alternate function mode
  GPIOA->MODER &= ~((3 << (2 * TX_PIN)) | (3 << (2 * RX_PIN)));
 8000dbc:	4b17      	ldr	r3, [pc, #92]	@ (8000e1c <__usart1_init+0x7c>)
 8000dbe:	681b      	ldr	r3, [r3, #0]
 8000dc0:	4a16      	ldr	r2, [pc, #88]	@ (8000e1c <__usart1_init+0x7c>)
 8000dc2:	f423 1370 	bic.w	r3, r3, #3932160	@ 0x3c0000
 8000dc6:	6013      	str	r3, [r2, #0]
  GPIOA->MODER |= 2 << (2 * TX_PIN) | 2 << (2 * RX_PIN);
 8000dc8:	4b14      	ldr	r3, [pc, #80]	@ (8000e1c <__usart1_init+0x7c>)
 8000dca:	681b      	ldr	r3, [r3, #0]
 8000dcc:	4a13      	ldr	r2, [pc, #76]	@ (8000e1c <__usart1_init+0x7c>)
 8000dce:	f443 1320 	orr.w	r3, r3, #2621440	@ 0x280000
 8000dd2:	6013      	str	r3, [r2, #0]
  // high speed
  GPIOA->OSPEEDR |= (3 << (TX_PIN * 2)) | (3 << (RX_PIN * 2));
 8000dd4:	4b11      	ldr	r3, [pc, #68]	@ (8000e1c <__usart1_init+0x7c>)
 8000dd6:	689b      	ldr	r3, [r3, #8]
 8000dd8:	4a10      	ldr	r2, [pc, #64]	@ (8000e1c <__usart1_init+0x7c>)
 8000dda:	f443 1370 	orr.w	r3, r3, #3932160	@ 0x3c0000
 8000dde:	6093      	str	r3, [r2, #8]
  // clear the bits in AFR register
  GPIOA->AFR[1] &= ~((0xf << 4) | (0xf << 8));
 8000de0:	4b0e      	ldr	r3, [pc, #56]	@ (8000e1c <__usart1_init+0x7c>)
 8000de2:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000de4:	4a0d      	ldr	r2, [pc, #52]	@ (8000e1c <__usart1_init+0x7c>)
 8000de6:	f423 637f 	bic.w	r3, r3, #4080	@ 0xff0
 8000dea:	6253      	str	r3, [r2, #36]	@ 0x24
  // set for af7
  GPIOA->AFR[1] |= (7 << 4) | (7 << 8);
 8000dec:	4b0b      	ldr	r3, [pc, #44]	@ (8000e1c <__usart1_init+0x7c>)
 8000dee:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8000df0:	4a0a      	ldr	r2, [pc, #40]	@ (8000e1c <__usart1_init+0x7c>)
 8000df2:	f443 63ee 	orr.w	r3, r3, #1904	@ 0x770
 8000df6:	6253      	str	r3, [r2, #36]	@ 0x24

  // enable usart, reciever, transiever
  USART1->CR1 |= USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
 8000df8:	4b09      	ldr	r3, [pc, #36]	@ (8000e20 <__usart1_init+0x80>)
 8000dfa:	68db      	ldr	r3, [r3, #12]
 8000dfc:	4a08      	ldr	r2, [pc, #32]	@ (8000e20 <__usart1_init+0x80>)
 8000dfe:	f443 5300 	orr.w	r3, r3, #8192	@ 0x2000
 8000e02:	f043 030c 	orr.w	r3, r3, #12
 8000e06:	60d3      	str	r3, [r2, #12]
  // set the baud rate (115200 in this case)
  USART1->BRR = 0x08B;
 8000e08:	4b05      	ldr	r3, [pc, #20]	@ (8000e20 <__usart1_init+0x80>)
 8000e0a:	228b      	movs	r2, #139	@ 0x8b
 8000e0c:	609a      	str	r2, [r3, #8]
}
 8000e0e:	bf00      	nop
 8000e10:	46bd      	mov	sp, r7
 8000e12:	bc80      	pop	{r7}
 8000e14:	4770      	bx	lr
 8000e16:	bf00      	nop
 8000e18:	40023800 	.word	0x40023800
 8000e1c:	40020000 	.word	0x40020000
 8000e20:	40011000 	.word	0x40011000

08000e24 <__usart1_print>:

void __usart1_print(const char *msg, uint32_t size) {
 8000e24:	b480      	push	{r7}
 8000e26:	b085      	sub	sp, #20
 8000e28:	af00      	add	r7, sp, #0
 8000e2a:	6078      	str	r0, [r7, #4]
 8000e2c:	6039      	str	r1, [r7, #0]

  // semaphore_lock(&sem_usart1);
  //enterCRITICAL();
  int i = 0;
 8000e2e:	2300      	movs	r3, #0
 8000e30:	60fb      	str	r3, [r7, #12]
  while (i < size && msg[i] != '\0') {
 8000e32:	e00f      	b.n	8000e54 <__usart1_print+0x30>
    while (!(USART1->SR & USART_SR_TXE))
 8000e34:	bf00      	nop
 8000e36:	4b13      	ldr	r3, [pc, #76]	@ (8000e84 <__usart1_print+0x60>)
 8000e38:	681b      	ldr	r3, [r3, #0]
 8000e3a:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8000e3e:	2b00      	cmp	r3, #0
 8000e40:	d0f9      	beq.n	8000e36 <__usart1_print+0x12>
      ;
    USART1->DR = msg[i++];
 8000e42:	68fb      	ldr	r3, [r7, #12]
 8000e44:	1c5a      	adds	r2, r3, #1
 8000e46:	60fa      	str	r2, [r7, #12]
 8000e48:	461a      	mov	r2, r3
 8000e4a:	687b      	ldr	r3, [r7, #4]
 8000e4c:	4413      	add	r3, r2
 8000e4e:	781a      	ldrb	r2, [r3, #0]
 8000e50:	4b0c      	ldr	r3, [pc, #48]	@ (8000e84 <__usart1_print+0x60>)
 8000e52:	605a      	str	r2, [r3, #4]
  while (i < size && msg[i] != '\0') {
 8000e54:	68fb      	ldr	r3, [r7, #12]
 8000e56:	683a      	ldr	r2, [r7, #0]
 8000e58:	429a      	cmp	r2, r3
 8000e5a:	d905      	bls.n	8000e68 <__usart1_print+0x44>
 8000e5c:	68fb      	ldr	r3, [r7, #12]
 8000e5e:	687a      	ldr	r2, [r7, #4]
 8000e60:	4413      	add	r3, r2
 8000e62:	781b      	ldrb	r3, [r3, #0]
 8000e64:	2b00      	cmp	r3, #0
 8000e66:	d1e5      	bne.n	8000e34 <__usart1_print+0x10>
  }
  while (!(USART1->SR & USART_SR_TC)) {
 8000e68:	bf00      	nop
 8000e6a:	4b06      	ldr	r3, [pc, #24]	@ (8000e84 <__usart1_print+0x60>)
 8000e6c:	681b      	ldr	r3, [r3, #0]
 8000e6e:	f003 0340 	and.w	r3, r3, #64	@ 0x40
 8000e72:	2b00      	cmp	r3, #0
 8000e74:	d0f9      	beq.n	8000e6a <__usart1_print+0x46>
  }
  //exitCRITICAL();
  // semaphore_unlock(&sem_usart1);
}
 8000e76:	bf00      	nop
 8000e78:	bf00      	nop
 8000e7a:	3714      	adds	r7, #20
 8000e7c:	46bd      	mov	sp, r7
 8000e7e:	bc80      	pop	{r7}
 8000e80:	4770      	bx	lr
 8000e82:	bf00      	nop
 8000e84:	40011000 	.word	0x40011000

08000e88 <__asm__set_psp>:

.global __asm__set_psp
.type __asm__set_psp, %function 
__asm__set_psp:
    /* r0 contains the argument*/
    msr psp, r0
 8000e88:	f380 8809 	msr	PSP, r0
    bx lr
 8000e8c:	4770      	bx	lr

08000e8e <__asm__set_msp>:

.global __asm__set_msp
.type __asm__set_msp, %function
__asm__set_msp:
    /* r0 contains the argument*/
    msr msp, r0
 8000e8e:	f380 8808 	msr	MSP, r0
    bx lr
 8000e92:	4770      	bx	lr

08000e94 <Reset_Handler>:
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
 8000e94:	f7ff f8d4 	bl	8000040 <resetHandlerHelper>
    B main
 8000e98:	f7ff bdc4 	b.w	8000a24 <main>

08000e9c <hang>:
hang:
    B .
 8000e9c:	e7fe      	b.n	8000e9c <hang>

08000e9e <Default_Handler>:

.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .
 8000e9e:	e7fe      	b.n	8000e9e <Default_Handler>

08000ea0 <NMI_Handler>:

.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .
 8000ea0:	e7fe      	b.n	8000ea0 <NMI_Handler>

08000ea2 <DebugMon_Handler>:

.section .text.DebugMon_Handler
.global DebugMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .
 8000ea2:	e7fe      	b.n	8000ea2 <DebugMon_Handler>

08000ea4 <PendSV_Handler>:
.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    cpsid i
 8000ea4:	b672      	cpsid	i

    push {lr}
 8000ea6:	b500      	push	{lr}
    bl schedular
 8000ea8:	f7ff fb6a 	bl	8000580 <schedular>
    pop {lr}
 8000eac:	f85d eb04 	ldr.w	lr, [sp], #4

    /************************ start saving reg*********************************/
    ldr r0, =RUNNING_PROCESS
 8000eb0:	4813      	ldr	r0, [pc, #76]	@ (8000f00 <PendSV_Handler+0x5c>)
    ldr r1, [r0]            // r1 now contain the struct address
 8000eb2:	6801      	ldr	r1, [r0, #0]
    

    stmia r1!, {r4-r11}     // r4->r11 stored in the runnging process struct
 8000eb4:	e8a1 0ff0 	stmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}

    mrs r0, psp
 8000eb8:	f3ef 8009 	mrs	r0, PSP
    str r0, [r1]
 8000ebc:	6008      	str	r0, [r1, #0]
    add r1, #4
 8000ebe:	f101 0104 	add.w	r1, r1, #4
    
    mrs r0, msp
 8000ec2:	f3ef 8008 	mrs	r0, MSP
    str r0, [r1]
 8000ec6:	6008      	str	r0, [r1, #0]
    add r1, #4
 8000ec8:	f101 0104 	add.w	r1, r1, #4
    
    str lr, [r1]            // important !!! store the exec_return value
 8000ecc:	f8c1 e000 	str.w	lr, [r1]
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
 8000ed0:	480c      	ldr	r0, [pc, #48]	@ (8000f04 <PendSV_Handler+0x60>)
    ldr r1, [r0]
 8000ed2:	6801      	ldr	r1, [r0, #0]
    ldmia r1!, {r4-r11}
 8000ed4:	e8b1 0ff0 	ldmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
   

    /* before setting psp, msp, faultmask, basepri -> mask all interrupt
    so that no interrupt can be fired in the middle of setting important regs*/

    ldr r0, [r1]
 8000ed8:	6808      	ldr	r0, [r1, #0]
    msr psp, r0
 8000eda:	f380 8809 	msr	PSP, r0
    add r1, #4
 8000ede:	f101 0104 	add.w	r1, r1, #4
    
    ldr r0, [r1]
 8000ee2:	6808      	ldr	r0, [r1, #0]
    msr msp, r0
 8000ee4:	f380 8808 	msr	MSP, r0
    add r1, #4
 8000ee8:	f101 0104 	add.w	r1, r1, #4
    
    ldr lr, [r1]
 8000eec:	f8d1 e000 	ldr.w	lr, [r1]

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
 8000ef0:	4804      	ldr	r0, [pc, #16]	@ (8000f04 <PendSV_Handler+0x60>)
    ldr r1, =RUNNING_PROCESS
 8000ef2:	4903      	ldr	r1, [pc, #12]	@ (8000f00 <PendSV_Handler+0x5c>)
    ldr r2, [r0]
 8000ef4:	6802      	ldr	r2, [r0, #0]
    str r2, [r1]
 8000ef6:	600a      	str	r2, [r1, #0]
    
    dsb
 8000ef8:	f3bf 8f4f 	dsb	sy

    cpsie i
 8000efc:	b662      	cpsie	i

    bx lr
 8000efe:	4770      	bx	lr
    ldr r0, =RUNNING_PROCESS
 8000f00:	20016004 	.word	0x20016004
    ldr r0, =PICKED_PROCESS
 8000f04:	20016008 	.word	0x20016008

08000f08 <SysTick_Handler>:
    caller saved register it will be recovered before returning from the isr*/
    

    /*****************set the PendSV interrupt*********************/
    
    ldr r0, =0xE000ED04      // Address of ICSR register
 8000f08:	4802      	ldr	r0, [pc, #8]	@ (8000f14 <SysTick_Handler+0xc>)
    ldr r1, =0x10000000      // Bit 28 (PENDSVSET)
 8000f0a:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
    str r1, [r0]             // Set PendSV pending
 8000f0e:	6001      	str	r1, [r0, #0]


    bx lr
 8000f10:	4770      	bx	lr
 8000f12:	0000      	.short	0x0000
    ldr r0, =0xE000ED04      // Address of ICSR register
 8000f14:	e000ed04 	.word	0xe000ed04

08000f18 <SVC_Handler>:
.section .text.SVC_Handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler:
    /* r0, r1, r2, r3 stores the arguments of systemcall */
    push {r0, r1, r2, r3}
 8000f18:	b40f      	push	{r0, r1, r2, r3}

    tst lr, #4
 8000f1a:	f01e 0f04 	tst.w	lr, #4
    ite eq
 8000f1e:	bf0c      	ite	eq
    mrseq r0, msp
 8000f20:	f3ef 8008 	mrseq	r0, MSP
    mrsne r0, psp
 8000f24:	f3ef 8009 	mrsne	r0, PSP

    add r0, #24 /* retrieve the old pc that is stacked*/
 8000f28:	f100 0018 	add.w	r0, r0, #24
    ldr r1, [r0]
 8000f2c:	6801      	ldr	r1, [r0, #0]
    sub r1, #2      /*move 2 bytes before to get the scv immidiate*/
 8000f2e:	f1a1 0102 	sub.w	r1, r1, #2
    ldrb r0, [r1]   /*r0 now contains the immidiate value*/
 8000f32:	7808      	ldrb	r0, [r1, #0]

    
    ldr r2, =SYSCALL_TABLE_AD
 8000f34:	4a07      	ldr	r2, [pc, #28]	@ (8000f54 <SVC_Handler+0x3c>)
    ldr r1, [r2]            // r1 contains the address of syscall_table
 8000f36:	6811      	ldr	r1, [r2, #0]
                            // r0 contains the immidate value
    
    mov r3, #4
 8000f38:	f04f 0304 	mov.w	r3, #4
    mul r0, r3 
 8000f3c:	fb03 f000 	mul.w	r0, r3, r0
    add r1, r0 
 8000f40:	4401      	add	r1, r0

    mov r12, r1            // store the address of service function in r12
 8000f42:	468c      	mov	ip, r1
    ldr r12, [r12]
 8000f44:	f8dc c000 	ldr.w	ip, [ip]

    pop {r0, r1, r2, r3}
 8000f48:	bc0f      	pop	{r0, r1, r2, r3}

    push {lr}
 8000f4a:	b500      	push	{lr}
    blx r12
 8000f4c:	47e0      	blx	ip
    pop {lr}
 8000f4e:	f85d eb04 	ldr.w	lr, [sp], #4


    bx lr
 8000f52:	4770      	bx	lr
    ldr r2, =SYSCALL_TABLE_AD
 8000f54:	2001600c 	.word	0x2001600c

08000f58 <BusFault_Handler>:
// r0 -> pc, r1 -> fault type, r2 -> fault in kernel / userproc
.section .text.BusFault_Handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler:
    ldr r0, =0xfffffffd
 8000f58:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0
 8000f5c:	4586      	cmp	lr, r0
    ittee eq 
 8000f5e:	bf07      	ittee	eq
    mrseq r0, psp
 8000f60:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000f64:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000f66:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000f6a:	2201      	movne	r2, #1

    /* find pc */
    ldr r0, [r0, #24]
 8000f6c:	6980      	ldr	r0, [r0, #24]
    mov r1, BusFault_Identifier
 8000f6e:	f04f 0100 	mov.w	r1, #0
    push {lr}
 8000f72:	b500      	push	{lr}
    bl fault_handler_helper
 8000f74:	f7ff f8ca 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000f78:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8000f7c:	4770      	bx	lr

08000f7e <MemManage_Handler>:
/***********************MemManage_Handler start************************/
.section .text.MemManage_Handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler:
    ldr r0, =0xfffffffd 
 8000f7e:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000f82:	4586      	cmp	lr, r0

    ittee eq 
 8000f84:	bf07      	ittee	eq
    mrseq r0, psp
 8000f86:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000f8a:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000f8c:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000f90:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8000f92:	6980      	ldr	r0, [r0, #24]
    mov r1, MemManage_Identifier
 8000f94:	f04f 0101 	mov.w	r1, #1
    push {lr}
 8000f98:	b500      	push	{lr}
    bl fault_handler_helper
 8000f9a:	f7ff f8b7 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000f9e:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8000fa2:	4770      	bx	lr

08000fa4 <UsageFault_Handler>:

.section .text.UsageFault_Handler
.global UsageFault_Handler 
.type UsageFault_Handler, %function
UsageFault_Handler:
    ldr r0, =0xfffffffd 
 8000fa4:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000fa8:	4586      	cmp	lr, r0

    ittee eq 
 8000faa:	bf07      	ittee	eq
    mrseq r0, psp
 8000fac:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8000fb0:	2200      	moveq	r2, #0
    mrsne r0, msp
 8000fb2:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8000fb6:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8000fb8:	6980      	ldr	r0, [r0, #24]
    mov r1, UsageFault_Identifier
 8000fba:	f04f 0102 	mov.w	r1, #2
    push {lr}
 8000fbe:	b500      	push	{lr}
    bl fault_handler_helper
 8000fc0:	f7ff f8a4 	bl	800010c <fault_handler_helper>
    pop {lr}
 8000fc4:	f85d eb04 	ldr.w	lr, [sp], #4
    
    bx lr
 8000fc8:	4770      	bx	lr
	...

08000fcc <HardFault_Handler>:
.section .text.HardFault_Handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler:

    ldr r0, =0xfffffffd 
 8000fcc:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8000fd0:	4586      	cmp	lr, r0
    ite eq 
 8000fd2:	bf0c      	ite	eq
    mrseq r0, psp
 8000fd4:	f3ef 8009 	mrseq	r0, PSP
    mrsne r0, msp
 8000fd8:	f3ef 8008 	mrsne	r0, MSP
    
    /* find pc */
    ldr r0, [r0, #24]
 8000fdc:	6980      	ldr	r0, [r0, #24]
    
    /* after getting the pc, msp can be safely altered !!!*/
    ldr r1, =_estack
 8000fde:	4904      	ldr	r1, [pc, #16]	@ (8000ff0 <HardFault_Handler+0x24>)
    msr msp, r1
 8000fe0:	f381 8808 	msr	MSP, r1

    push {lr}
 8000fe4:	b500      	push	{lr}
    bl HardFault_Handler_helper
 8000fe6:	f7ff f915 	bl	8000214 <HardFault_Handler_helper>
    pop {lr}
 8000fea:	f85d eb04 	ldr.w	lr, [sp], #4

    b .
 8000fee:	e7fe      	b.n	8000fee <HardFault_Handler+0x22>
    ldr r1, =_estack
 8000ff0:	20018000 	.word	0x20018000

Disassembly of section .usertext:

080014a8 <main10-0xeb58>:
	...

08010000 <main10>:
#include "kernel_api.h"

USER_CODE int main10 (void){
 8010000:	b580      	push	{r7, lr}
 8010002:	b082      	sub	sp, #8
 8010004:	af00      	add	r7, sp, #0
 
  int count = 10;
 8010006:	230a      	movs	r3, #10
 8010008:	607b      	str	r3, [r7, #4]
    while (count --){
 801000a:	e003      	b.n	8010014 <main10+0x14>
        user_printf ("==========hello from main10.c\n\r", 0x0);
 801000c:	2100      	movs	r1, #0
 801000e:	4806      	ldr	r0, [pc, #24]	@ (8010028 <main10+0x28>)
 8010010:	f000 f950 	bl	80102b4 <user_printf>
    while (count --){
 8010014:	687b      	ldr	r3, [r7, #4]
 8010016:	1e5a      	subs	r2, r3, #1
 8010018:	607a      	str	r2, [r7, #4]
 801001a:	2b00      	cmp	r3, #0
 801001c:	d1f6      	bne.n	801000c <main10+0xc>

    }



}
 801001e:	bf00      	nop
 8010020:	4618      	mov	r0, r3
 8010022:	3708      	adds	r7, #8
 8010024:	46bd      	mov	sp, r7
 8010026:	bd80      	pop	{r7, pc}
 8010028:	08001254 	.word	0x08001254

0801002c <main11>:
#include "kernel_api.h"

USER_CODE int main11 (void){
 801002c:	b580      	push	{r7, lr}
 801002e:	b082      	sub	sp, #8
 8010030:	af00      	add	r7, sp, #0
    int count = 10;   
 8010032:	230a      	movs	r3, #10
 8010034:	607b      	str	r3, [r7, #4]
    while (count --){
 8010036:	e003      	b.n	8010040 <main11+0x14>
        user_printf ("==========hello from main11.c\n\r", 0x0);
 8010038:	2100      	movs	r1, #0
 801003a:	4806      	ldr	r0, [pc, #24]	@ (8010054 <main11+0x28>)
 801003c:	f000 f93a 	bl	80102b4 <user_printf>
    while (count --){
 8010040:	687b      	ldr	r3, [r7, #4]
 8010042:	1e5a      	subs	r2, r3, #1
 8010044:	607a      	str	r2, [r7, #4]
 8010046:	2b00      	cmp	r3, #0
 8010048:	d1f6      	bne.n	8010038 <main11+0xc>

    }



}
 801004a:	bf00      	nop
 801004c:	4618      	mov	r0, r3
 801004e:	3708      	adds	r7, #8
 8010050:	46bd      	mov	sp, r7
 8010052:	bd80      	pop	{r7, pc}
 8010054:	08001274 	.word	0x08001274

08010058 <main12>:
#include "kernel_api.h"

USER_CODE int main12 (void){
 8010058:	b580      	push	{r7, lr}
 801005a:	b082      	sub	sp, #8
 801005c:	af00      	add	r7, sp, #0
 
  int count = 10;
 801005e:	230a      	movs	r3, #10
 8010060:	607b      	str	r3, [r7, #4]
    while (count --){
 8010062:	e003      	b.n	801006c <main12+0x14>
        user_printf ("==========hello from main12.c\n\r", 0x0);
 8010064:	2100      	movs	r1, #0
 8010066:	4806      	ldr	r0, [pc, #24]	@ (8010080 <main12+0x28>)
 8010068:	f000 f924 	bl	80102b4 <user_printf>
    while (count --){
 801006c:	687b      	ldr	r3, [r7, #4]
 801006e:	1e5a      	subs	r2, r3, #1
 8010070:	607a      	str	r2, [r7, #4]
 8010072:	2b00      	cmp	r3, #0
 8010074:	d1f6      	bne.n	8010064 <main12+0xc>

    }



}
 8010076:	bf00      	nop
 8010078:	4618      	mov	r0, r3
 801007a:	3708      	adds	r7, #8
 801007c:	46bd      	mov	sp, r7
 801007e:	bd80      	pop	{r7, pc}
 8010080:	08001294 	.word	0x08001294

08010084 <main13>:
#include "kernel_api.h"

USER_CODE int main13 (void){
 8010084:	b580      	push	{r7, lr}
 8010086:	b082      	sub	sp, #8
 8010088:	af00      	add	r7, sp, #0
  int count = 10;   
 801008a:	230a      	movs	r3, #10
 801008c:	607b      	str	r3, [r7, #4]
    while (count--){
 801008e:	e003      	b.n	8010098 <main13+0x14>
        user_printf ("==========hello from main13.c\n\r", 0x0);
 8010090:	2100      	movs	r1, #0
 8010092:	4806      	ldr	r0, [pc, #24]	@ (80100ac <main13+0x28>)
 8010094:	f000 f90e 	bl	80102b4 <user_printf>
    while (count--){
 8010098:	687b      	ldr	r3, [r7, #4]
 801009a:	1e5a      	subs	r2, r3, #1
 801009c:	607a      	str	r2, [r7, #4]
 801009e:	2b00      	cmp	r3, #0
 80100a0:	d1f6      	bne.n	8010090 <main13+0xc>

    }



}
 80100a2:	bf00      	nop
 80100a4:	4618      	mov	r0, r3
 80100a6:	3708      	adds	r7, #8
 80100a8:	46bd      	mov	sp, r7
 80100aa:	bd80      	pop	{r7, pc}
 80100ac:	080012b4 	.word	0x080012b4

080100b0 <main14>:
#include "kernel_api.h"

USER_CODE int main14 (void){
 80100b0:	b580      	push	{r7, lr}
 80100b2:	b082      	sub	sp, #8
 80100b4:	af00      	add	r7, sp, #0
  int count = 10;   
 80100b6:	230a      	movs	r3, #10
 80100b8:	607b      	str	r3, [r7, #4]
    while (count--){
 80100ba:	e003      	b.n	80100c4 <main14+0x14>
        user_printf ("==========hello from main14.c\n\r", 0x0);
 80100bc:	2100      	movs	r1, #0
 80100be:	4806      	ldr	r0, [pc, #24]	@ (80100d8 <main14+0x28>)
 80100c0:	f000 f8f8 	bl	80102b4 <user_printf>
    while (count--){
 80100c4:	687b      	ldr	r3, [r7, #4]
 80100c6:	1e5a      	subs	r2, r3, #1
 80100c8:	607a      	str	r2, [r7, #4]
 80100ca:	2b00      	cmp	r3, #0
 80100cc:	d1f6      	bne.n	80100bc <main14+0xc>

    }



}
 80100ce:	bf00      	nop
 80100d0:	4618      	mov	r0, r3
 80100d2:	3708      	adds	r7, #8
 80100d4:	46bd      	mov	sp, r7
 80100d6:	bd80      	pop	{r7, pc}
 80100d8:	080012d4 	.word	0x080012d4

080100dc <main15>:
#include "kernel_api.h"

USER_CODE int main15 (void){
 80100dc:	b580      	push	{r7, lr}
 80100de:	b082      	sub	sp, #8
 80100e0:	af00      	add	r7, sp, #0
  int count = 10;   
 80100e2:	230a      	movs	r3, #10
 80100e4:	607b      	str	r3, [r7, #4]
    while (count--){
 80100e6:	e003      	b.n	80100f0 <main15+0x14>
        user_printf ("==========hello from main15.c\n\r", 0x0);
 80100e8:	2100      	movs	r1, #0
 80100ea:	4806      	ldr	r0, [pc, #24]	@ (8010104 <main15+0x28>)
 80100ec:	f000 f8e2 	bl	80102b4 <user_printf>
    while (count--){
 80100f0:	687b      	ldr	r3, [r7, #4]
 80100f2:	1e5a      	subs	r2, r3, #1
 80100f4:	607a      	str	r2, [r7, #4]
 80100f6:	2b00      	cmp	r3, #0
 80100f8:	d1f6      	bne.n	80100e8 <main15+0xc>

    }



}
 80100fa:	bf00      	nop
 80100fc:	4618      	mov	r0, r3
 80100fe:	3708      	adds	r7, #8
 8010100:	46bd      	mov	sp, r7
 8010102:	bd80      	pop	{r7, pc}
 8010104:	080012f4 	.word	0x080012f4

08010108 <main2>:
#include "kernel_api.h"

USER_CODE int main2(void) {
 8010108:	b580      	push	{r7, lr}
 801010a:	b082      	sub	sp, #8
 801010c:	af00      	add	r7, sp, #0
  int count = 10;
 801010e:	230a      	movs	r3, #10
 8010110:	607b      	str	r3, [r7, #4]
  while (count --) {
 8010112:	e003      	b.n	801011c <main2+0x14>
    user_printf("((((((((((hello from main2.c\n\r", 0x0);
 8010114:	2100      	movs	r1, #0
 8010116:	4806      	ldr	r0, [pc, #24]	@ (8010130 <main2+0x28>)
 8010118:	f000 f8cc 	bl	80102b4 <user_printf>
  while (count --) {
 801011c:	687b      	ldr	r3, [r7, #4]
 801011e:	1e5a      	subs	r2, r3, #1
 8010120:	607a      	str	r2, [r7, #4]
 8010122:	2b00      	cmp	r3, #0
 8010124:	d1f6      	bne.n	8010114 <main2+0xc>
  }
}
 8010126:	bf00      	nop
 8010128:	4618      	mov	r0, r3
 801012a:	3708      	adds	r7, #8
 801012c:	46bd      	mov	sp, r7
 801012e:	bd80      	pop	{r7, pc}
 8010130:	08001314 	.word	0x08001314

08010134 <main3>:
#include "kernel_api.h"

USER_CODE int main3 (void){
 8010134:	b580      	push	{r7, lr}
 8010136:	b082      	sub	sp, #8
 8010138:	af00      	add	r7, sp, #0
  int count = 10;
 801013a:	230a      	movs	r3, #10
 801013c:	607b      	str	r3, [r7, #4]
  // returning
  user_printf ("returning from main3 before printing anything \n\r", 0x0);
 801013e:	2100      	movs	r1, #0
 8010140:	4809      	ldr	r0, [pc, #36]	@ (8010168 <main3+0x34>)
 8010142:	f000 f8b7 	bl	80102b4 <user_printf>
  user_process_exit();
 8010146:	f000 f8b7 	bl	80102b8 <user_process_exit>

    while (count--){
 801014a:	e003      	b.n	8010154 <main3+0x20>
        user_printf (">>>>>>>>>>hello from main3.c\n\r", 0x0);
 801014c:	2100      	movs	r1, #0
 801014e:	4807      	ldr	r0, [pc, #28]	@ (801016c <main3+0x38>)
 8010150:	f000 f8b0 	bl	80102b4 <user_printf>
    while (count--){
 8010154:	687b      	ldr	r3, [r7, #4]
 8010156:	1e5a      	subs	r2, r3, #1
 8010158:	607a      	str	r2, [r7, #4]
 801015a:	2b00      	cmp	r3, #0
 801015c:	d1f6      	bne.n	801014c <main3+0x18>
    }
}
 801015e:	bf00      	nop
 8010160:	4618      	mov	r0, r3
 8010162:	3708      	adds	r7, #8
 8010164:	46bd      	mov	sp, r7
 8010166:	bd80      	pop	{r7, pc}
 8010168:	08001334 	.word	0x08001334
 801016c:	08001368 	.word	0x08001368

08010170 <main4>:
#include "kernel_api.h"
USER_CODE int main4 (void){
 8010170:	b580      	push	{r7, lr}
 8010172:	b082      	sub	sp, #8
 8010174:	af00      	add	r7, sp, #0
    int count = 10;
 8010176:	230a      	movs	r3, #10
 8010178:	607b      	str	r3, [r7, #4]
    while (count--)
 801017a:	e003      	b.n	8010184 <main4+0x14>
    user_printf("++++++++++hello from main4.c\n\r", 0x0);
 801017c:	2100      	movs	r1, #0
 801017e:	4806      	ldr	r0, [pc, #24]	@ (8010198 <main4+0x28>)
 8010180:	f000 f898 	bl	80102b4 <user_printf>
    while (count--)
 8010184:	687b      	ldr	r3, [r7, #4]
 8010186:	1e5a      	subs	r2, r3, #1
 8010188:	607a      	str	r2, [r7, #4]
 801018a:	2b00      	cmp	r3, #0
 801018c:	d1f6      	bne.n	801017c <main4+0xc>

    
}
 801018e:	bf00      	nop
 8010190:	4618      	mov	r0, r3
 8010192:	3708      	adds	r7, #8
 8010194:	46bd      	mov	sp, r7
 8010196:	bd80      	pop	{r7, pc}
 8010198:	08001388 	.word	0x08001388

0801019c <main5>:
#include "kernel_api.h"

USER_CODE int main5 (void){
 801019c:	b580      	push	{r7, lr}
 801019e:	b082      	sub	sp, #8
 80101a0:	af00      	add	r7, sp, #0
    int count = 10;   
 80101a2:	230a      	movs	r3, #10
 80101a4:	607b      	str	r3, [r7, #4]
    while (count --){
 80101a6:	e003      	b.n	80101b0 <main5+0x14>
        user_printf ("==========hello from main5.c\n\r", 0x0);
 80101a8:	2100      	movs	r1, #0
 80101aa:	4806      	ldr	r0, [pc, #24]	@ (80101c4 <main5+0x28>)
 80101ac:	f000 f882 	bl	80102b4 <user_printf>
    while (count --){
 80101b0:	687b      	ldr	r3, [r7, #4]
 80101b2:	1e5a      	subs	r2, r3, #1
 80101b4:	607a      	str	r2, [r7, #4]
 80101b6:	2b00      	cmp	r3, #0
 80101b8:	d1f6      	bne.n	80101a8 <main5+0xc>

    }



}
 80101ba:	bf00      	nop
 80101bc:	4618      	mov	r0, r3
 80101be:	3708      	adds	r7, #8
 80101c0:	46bd      	mov	sp, r7
 80101c2:	bd80      	pop	{r7, pc}
 80101c4:	080013a8 	.word	0x080013a8

080101c8 <main6>:
#include "kernel_api.h"

USER_CODE int main6 (void){
 80101c8:	b580      	push	{r7, lr}
 80101ca:	b082      	sub	sp, #8
 80101cc:	af00      	add	r7, sp, #0
  
  int count = 10;
 80101ce:	230a      	movs	r3, #10
 80101d0:	607b      	str	r3, [r7, #4]
    while (count--){
 80101d2:	e003      	b.n	80101dc <main6+0x14>
        user_printf ("@@@@@@@@@@hello from main6.c\n\r", 0x0);
 80101d4:	2100      	movs	r1, #0
 80101d6:	4806      	ldr	r0, [pc, #24]	@ (80101f0 <main6+0x28>)
 80101d8:	f000 f86c 	bl	80102b4 <user_printf>
    while (count--){
 80101dc:	687b      	ldr	r3, [r7, #4]
 80101de:	1e5a      	subs	r2, r3, #1
 80101e0:	607a      	str	r2, [r7, #4]
 80101e2:	2b00      	cmp	r3, #0
 80101e4:	d1f6      	bne.n	80101d4 <main6+0xc>

    }



}
 80101e6:	bf00      	nop
 80101e8:	4618      	mov	r0, r3
 80101ea:	3708      	adds	r7, #8
 80101ec:	46bd      	mov	sp, r7
 80101ee:	bd80      	pop	{r7, pc}
 80101f0:	080013c8 	.word	0x080013c8

080101f4 <main7>:
#include "kernel_api.h"

USER_CODE int main7 (void){
 80101f4:	b580      	push	{r7, lr}
 80101f6:	b082      	sub	sp, #8
 80101f8:	af00      	add	r7, sp, #0
 
  int count = 10;
 80101fa:	230a      	movs	r3, #10
 80101fc:	607b      	str	r3, [r7, #4]
    while (count --){
 80101fe:	e003      	b.n	8010208 <main7+0x14>
        user_printf ("@@@@@@@@@@hello from main5.c\n\r", 0x0);
 8010200:	2100      	movs	r1, #0
 8010202:	4806      	ldr	r0, [pc, #24]	@ (801021c <main7+0x28>)
 8010204:	f000 f856 	bl	80102b4 <user_printf>
    while (count --){
 8010208:	687b      	ldr	r3, [r7, #4]
 801020a:	1e5a      	subs	r2, r3, #1
 801020c:	607a      	str	r2, [r7, #4]
 801020e:	2b00      	cmp	r3, #0
 8010210:	d1f6      	bne.n	8010200 <main7+0xc>

    }



}
 8010212:	bf00      	nop
 8010214:	4618      	mov	r0, r3
 8010216:	3708      	adds	r7, #8
 8010218:	46bd      	mov	sp, r7
 801021a:	bd80      	pop	{r7, pc}
 801021c:	080013e8 	.word	0x080013e8

08010220 <main8>:
#include "kernel_api.h"

USER_CODE int main8 (void){
 8010220:	b580      	push	{r7, lr}
 8010222:	b082      	sub	sp, #8
 8010224:	af00      	add	r7, sp, #0
  int count = 10;   
 8010226:	230a      	movs	r3, #10
 8010228:	607b      	str	r3, [r7, #4]
    while (count--){
 801022a:	e003      	b.n	8010234 <main8+0x14>
        user_printf ("==========hello from main8.c\n\r", 0x0);
 801022c:	2100      	movs	r1, #0
 801022e:	4806      	ldr	r0, [pc, #24]	@ (8010248 <main8+0x28>)
 8010230:	f000 f840 	bl	80102b4 <user_printf>
    while (count--){
 8010234:	687b      	ldr	r3, [r7, #4]
 8010236:	1e5a      	subs	r2, r3, #1
 8010238:	607a      	str	r2, [r7, #4]
 801023a:	2b00      	cmp	r3, #0
 801023c:	d1f6      	bne.n	801022c <main8+0xc>

    }



}
 801023e:	bf00      	nop
 8010240:	4618      	mov	r0, r3
 8010242:	3708      	adds	r7, #8
 8010244:	46bd      	mov	sp, r7
 8010246:	bd80      	pop	{r7, pc}
 8010248:	08001408 	.word	0x08001408

0801024c <main9>:
#include "kernel_api.h"

USER_CODE int main9 (void){
 801024c:	b580      	push	{r7, lr}
 801024e:	b082      	sub	sp, #8
 8010250:	af00      	add	r7, sp, #0
 
  int count = 10;
 8010252:	230a      	movs	r3, #10
 8010254:	607b      	str	r3, [r7, #4]
    while (count--){
 8010256:	e003      	b.n	8010260 <main9+0x14>
        user_printf ("==========hello from main9.c\n\r", 0x0);
 8010258:	2100      	movs	r1, #0
 801025a:	4806      	ldr	r0, [pc, #24]	@ (8010274 <main9+0x28>)
 801025c:	f000 f82a 	bl	80102b4 <user_printf>
    while (count--){
 8010260:	687b      	ldr	r3, [r7, #4]
 8010262:	1e5a      	subs	r2, r3, #1
 8010264:	607a      	str	r2, [r7, #4]
 8010266:	2b00      	cmp	r3, #0
 8010268:	d1f6      	bne.n	8010258 <main9+0xc>

    }



}
 801026a:	bf00      	nop
 801026c:	4618      	mov	r0, r3
 801026e:	3708      	adds	r7, #8
 8010270:	46bd      	mov	sp, r7
 8010272:	bd80      	pop	{r7, pc}
 8010274:	08001428 	.word	0x08001428

08010278 <main1>:
#include "kernel_api.h"

USER_CODE int main1(void) {
 8010278:	b580      	push	{r7, lr}
 801027a:	af00      	add	r7, sp, #0
  while (1) {

    user_printf("hello from main1.c\n\r", 0x0);
 801027c:	2100      	movs	r1, #0
 801027e:	4806      	ldr	r0, [pc, #24]	@ (8010298 <main1+0x20>)
 8010280:	f000 f818 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c second time\n\r", 0x0);
 8010284:	2100      	movs	r1, #0
 8010286:	4805      	ldr	r0, [pc, #20]	@ (801029c <main1+0x24>)
 8010288:	f000 f814 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c third time\n\r", 0x0);
 801028c:	2100      	movs	r1, #0
 801028e:	4804      	ldr	r0, [pc, #16]	@ (80102a0 <main1+0x28>)
 8010290:	f000 f810 	bl	80102b4 <user_printf>
    user_printf("hello from main1.c\n\r", 0x0);
 8010294:	e7f2      	b.n	801027c <main1+0x4>
 8010296:	bf00      	nop
 8010298:	08001448 	.word	0x08001448
 801029c:	08001460 	.word	0x08001460
 80102a0:	08001484 	.word	0x08001484

080102a4 <__asm__launch_main1>:
 80102a4:	f04f 0003 	mov.w	r0, #3
 80102a8:	f380 8814 	msr	CONTROL, r0
 80102ac:	f3bf 8f6f 	isb	sy
 80102b0:	f7ff ffe2 	bl	8010278 <main1>

080102b4 <user_printf>:
 80102b4:	df00      	svc	0
 80102b6:	4770      	bx	lr

080102b8 <user_process_exit>:
 80102b8:	df02      	svc	2
 80102ba:	4770      	bx	lr
