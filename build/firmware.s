
build/firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

08020140 <resetHandlerHelper>:
extern uint32_t _euserdata;
extern uint32_t _suserbss;
extern uint32_t _euserbss;


void resetHandlerHelper(void) {
 8020140:	b480      	push	{r7}
 8020142:	b089      	sub	sp, #36	@ 0x24
 8020144:	af00      	add	r7, sp, #0
  uint32_t dest = (uint32_t)&_sdata;
 8020146:	4b27      	ldr	r3, [pc, #156]	@ (80201e4 <resetHandlerHelper+0xa4>)
 8020148:	60bb      	str	r3, [r7, #8]
  uint32_t dest_end = (uint32_t)&_edata;
 802014a:	4b27      	ldr	r3, [pc, #156]	@ (80201e8 <resetHandlerHelper+0xa8>)
 802014c:	607b      	str	r3, [r7, #4]
  uint32_t src = (uint32_t)&_sidata;
 802014e:	4b27      	ldr	r3, [pc, #156]	@ (80201ec <resetHandlerHelper+0xac>)
 8020150:	61fb      	str	r3, [r7, #28]

  /*copy data from data section to ram
   * init .bss section*/
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8020152:	68bb      	ldr	r3, [r7, #8]
 8020154:	61bb      	str	r3, [r7, #24]
 8020156:	e009      	b.n	802016c <resetHandlerHelper+0x2c>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 8020158:	69fa      	ldr	r2, [r7, #28]
 802015a:	69bb      	ldr	r3, [r7, #24]
 802015c:	6812      	ldr	r2, [r2, #0]
 802015e:	601a      	str	r2, [r3, #0]
    src += 4;
 8020160:	69fb      	ldr	r3, [r7, #28]
 8020162:	3304      	adds	r3, #4
 8020164:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8020166:	69bb      	ldr	r3, [r7, #24]
 8020168:	3304      	adds	r3, #4
 802016a:	61bb      	str	r3, [r7, #24]
 802016c:	69ba      	ldr	r2, [r7, #24]
 802016e:	687b      	ldr	r3, [r7, #4]
 8020170:	429a      	cmp	r2, r3
 8020172:	d9f1      	bls.n	8020158 <resetHandlerHelper+0x18>
  }

  dest = (uint32_t)&_suserdata;
 8020174:	4b1e      	ldr	r3, [pc, #120]	@ (80201f0 <resetHandlerHelper+0xb0>)
 8020176:	60bb      	str	r3, [r7, #8]
  dest_end = (uint32_t)&_euserdata;
 8020178:	4b1e      	ldr	r3, [pc, #120]	@ (80201f4 <resetHandlerHelper+0xb4>)
 802017a:	607b      	str	r3, [r7, #4]
  src = (uint32_t)&_siuserdata;
 802017c:	4b1e      	ldr	r3, [pc, #120]	@ (80201f8 <resetHandlerHelper+0xb8>)
 802017e:	61fb      	str	r3, [r7, #28]

  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8020180:	68bb      	ldr	r3, [r7, #8]
 8020182:	617b      	str	r3, [r7, #20]
 8020184:	e009      	b.n	802019a <resetHandlerHelper+0x5a>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 8020186:	69fa      	ldr	r2, [r7, #28]
 8020188:	697b      	ldr	r3, [r7, #20]
 802018a:	6812      	ldr	r2, [r2, #0]
 802018c:	601a      	str	r2, [r3, #0]
    src += 4;
 802018e:	69fb      	ldr	r3, [r7, #28]
 8020190:	3304      	adds	r3, #4
 8020192:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8020194:	697b      	ldr	r3, [r7, #20]
 8020196:	3304      	adds	r3, #4
 8020198:	617b      	str	r3, [r7, #20]
 802019a:	697a      	ldr	r2, [r7, #20]
 802019c:	687b      	ldr	r3, [r7, #4]
 802019e:	429a      	cmp	r2, r3
 80201a0:	d9f1      	bls.n	8020186 <resetHandlerHelper+0x46>
  }

  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 80201a2:	4b16      	ldr	r3, [pc, #88]	@ (80201fc <resetHandlerHelper+0xbc>)
 80201a4:	613b      	str	r3, [r7, #16]
 80201a6:	e005      	b.n	80201b4 <resetHandlerHelper+0x74>
    *(uint32_t *)(i) = 0;
 80201a8:	693b      	ldr	r3, [r7, #16]
 80201aa:	2200      	movs	r2, #0
 80201ac:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 80201ae:	693b      	ldr	r3, [r7, #16]
 80201b0:	3304      	adds	r3, #4
 80201b2:	613b      	str	r3, [r7, #16]
 80201b4:	4a12      	ldr	r2, [pc, #72]	@ (8020200 <resetHandlerHelper+0xc0>)
 80201b6:	693b      	ldr	r3, [r7, #16]
 80201b8:	4293      	cmp	r3, r2
 80201ba:	d9f5      	bls.n	80201a8 <resetHandlerHelper+0x68>
  }
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 80201bc:	4b11      	ldr	r3, [pc, #68]	@ (8020204 <resetHandlerHelper+0xc4>)
 80201be:	60fb      	str	r3, [r7, #12]
 80201c0:	e005      	b.n	80201ce <resetHandlerHelper+0x8e>
    *(uint32_t *)(i) = 0;
 80201c2:	68fb      	ldr	r3, [r7, #12]
 80201c4:	2200      	movs	r2, #0
 80201c6:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 80201c8:	68fb      	ldr	r3, [r7, #12]
 80201ca:	3304      	adds	r3, #4
 80201cc:	60fb      	str	r3, [r7, #12]
 80201ce:	4a0e      	ldr	r2, [pc, #56]	@ (8020208 <resetHandlerHelper+0xc8>)
 80201d0:	68fb      	ldr	r3, [r7, #12]
 80201d2:	4293      	cmp	r3, r2
 80201d4:	d9f5      	bls.n	80201c2 <resetHandlerHelper+0x82>
  }
}
 80201d6:	bf00      	nop
 80201d8:	bf00      	nop
 80201da:	3724      	adds	r7, #36	@ 0x24
 80201dc:	46bd      	mov	sp, r7
 80201de:	bc80      	pop	{r7}
 80201e0:	4770      	bx	lr
 80201e2:	bf00      	nop
 80201e4:	20000000 	.word	0x20000000
 80201e8:	20000001 	.word	0x20000001
 80201ec:	0802126f 	.word	0x0802126f
 80201f0:	20004000 	.word	0x20004000
 80201f4:	20004000 	.word	0x20004000
 80201f8:	08030158 	.word	0x08030158
 80201fc:	20000004 	.word	0x20000004
 8020200:	20000434 	.word	0x20000434
 8020204:	20004000 	.word	0x20004000
 8020208:	20004000 	.word	0x20004000

0802020c <fault_handler_helper>:

void fault_handler_helper(uint32_t pc, uint8_t fault_identifier,
                          uint32_t fault_place) {
 802020c:	b580      	push	{r7, lr}
 802020e:	b086      	sub	sp, #24
 8020210:	af00      	add	r7, sp, #0
 8020212:	60f8      	str	r0, [r7, #12]
 8020214:	460b      	mov	r3, r1
 8020216:	607a      	str	r2, [r7, #4]
 8020218:	72fb      	strb	r3, [r7, #11]

  /* bus fault diagnosis */
  if (fault_identifier == BUSFAULT_IDENTIFIER) {
 802021a:	7afb      	ldrb	r3, [r7, #11]
 802021c:	2b00      	cmp	r3, #0
 802021e:	d10e      	bne.n	802023e <fault_handler_helper+0x32>
    printf("busdault !!\n\r", 0x0);
 8020220:	2100      	movs	r1, #0
 8020222:	482d      	ldr	r0, [pc, #180]	@ (80202d8 <fault_handler_helper+0xcc>)
 8020224:	f000 f90c 	bl	8020440 <printf>
    if (SCB->CFSR & SCB_CFSR_BFARVALID_Msk)
 8020228:	4b2c      	ldr	r3, [pc, #176]	@ (80202dc <fault_handler_helper+0xd0>)
 802022a:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 802022c:	f403 4300 	and.w	r3, r3, #32768	@ 0x8000
 8020230:	2b00      	cmp	r3, #0
 8020232:	d01f      	beq.n	8020274 <fault_handler_helper+0x68>
      printf("busfault address -> %\n\r", (uint32_t)(&SCB->BFAR));
 8020234:	492a      	ldr	r1, [pc, #168]	@ (80202e0 <fault_handler_helper+0xd4>)
 8020236:	482b      	ldr	r0, [pc, #172]	@ (80202e4 <fault_handler_helper+0xd8>)
 8020238:	f000 f902 	bl	8020440 <printf>
 802023c:	e01a      	b.n	8020274 <fault_handler_helper+0x68>
  }

  /* MemManagement diagnosis */
  else if (fault_identifier == MEMMANAGE_IDENTIFIER) {
 802023e:	7afb      	ldrb	r3, [r7, #11]
 8020240:	2b01      	cmp	r3, #1
 8020242:	d110      	bne.n	8020266 <fault_handler_helper+0x5a>
    printf("MemManagement exception !!\n\r", 0x0);
 8020244:	2100      	movs	r1, #0
 8020246:	4828      	ldr	r0, [pc, #160]	@ (80202e8 <fault_handler_helper+0xdc>)
 8020248:	f000 f8fa 	bl	8020440 <printf>
    if (SCB->CFSR & SCB_CFSR_MMARVALID_Msk)
 802024c:	4b23      	ldr	r3, [pc, #140]	@ (80202dc <fault_handler_helper+0xd0>)
 802024e:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 8020250:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8020254:	2b00      	cmp	r3, #0
 8020256:	d00d      	beq.n	8020274 <fault_handler_helper+0x68>
      printf("address caused MemManage Fault -> %\n\r", SCB->MMFAR);
 8020258:	4b20      	ldr	r3, [pc, #128]	@ (80202dc <fault_handler_helper+0xd0>)
 802025a:	6b5b      	ldr	r3, [r3, #52]	@ 0x34
 802025c:	4619      	mov	r1, r3
 802025e:	4823      	ldr	r0, [pc, #140]	@ (80202ec <fault_handler_helper+0xe0>)
 8020260:	f000 f8ee 	bl	8020440 <printf>
 8020264:	e006      	b.n	8020274 <fault_handler_helper+0x68>
  }

  /* UsageFault diagnosis */
  else if (fault_identifier == USAGEFAULT_IDENTIFIER) {
 8020266:	7afb      	ldrb	r3, [r7, #11]
 8020268:	2b02      	cmp	r3, #2
 802026a:	d130      	bne.n	80202ce <fault_handler_helper+0xc2>
    printf("UsageFault !!\n\r", 0x0);
 802026c:	2100      	movs	r1, #0
 802026e:	4820      	ldr	r0, [pc, #128]	@ (80202f0 <fault_handler_helper+0xe4>)
 8020270:	f000 f8e6 	bl	8020440 <printf>
    /* there is no address access that can cause USAGE FAULT */
  } else {
    return;
  }

  uint32_t instruction = *(uint32_t *)(pc);
 8020274:	68fb      	ldr	r3, [r7, #12]
 8020276:	681b      	ldr	r3, [r3, #0]
 8020278:	617b      	str	r3, [r7, #20]

  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 802027a:	491e      	ldr	r1, [pc, #120]	@ (80202f4 <fault_handler_helper+0xe8>)
 802027c:	481e      	ldr	r0, [pc, #120]	@ (80202f8 <fault_handler_helper+0xec>)
 802027e:	f000 f8df 	bl	8020440 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("PC -> %\n\r", (uint32_t)&pc);
 8020282:	f107 030c 	add.w	r3, r7, #12
 8020286:	4619      	mov	r1, r3
 8020288:	481c      	ldr	r0, [pc, #112]	@ (80202fc <fault_handler_helper+0xf0>)
 802028a:	f000 f8d9 	bl	8020440 <printf>
  printf("instruction that caused the fault-> %\n\r", (uint32_t)(&instruction));
 802028e:	f107 0314 	add.w	r3, r7, #20
 8020292:	4619      	mov	r1, r3
 8020294:	481a      	ldr	r0, [pc, #104]	@ (8020300 <fault_handler_helper+0xf4>)
 8020296:	f000 f8d3 	bl	8020440 <printf>

  /* KERNEL PANIC if fault in kernel
   * PROCESSES TERMINATION if fault in user process */

  if (fault_place == FAULT_IN_KERNEL) {
 802029a:	687b      	ldr	r3, [r7, #4]
 802029c:	2b01      	cmp	r3, #1
 802029e:	d104      	bne.n	80202aa <fault_handler_helper+0x9e>
    printf("\n\n\rKERNEL PANIC......\n\n\r", 0x0);
 80202a0:	2100      	movs	r1, #0
 80202a2:	4818      	ldr	r0, [pc, #96]	@ (8020304 <fault_handler_helper+0xf8>)
 80202a4:	f000 f8cc 	bl	8020440 <printf>
    while (1)
 80202a8:	e7fe      	b.n	80202a8 <fault_handler_helper+0x9c>
      ;
  }
  /* change state from running to suspend and set pendsv */
  else if (fault_place == FAULT_IN_USERPROC) {
 80202aa:	687b      	ldr	r3, [r7, #4]
 80202ac:	2b00      	cmp	r3, #0
 80202ae:	d10f      	bne.n	80202d0 <fault_handler_helper+0xc4>
    printf("terminating user process...\n\r", 0x0);
 80202b0:	2100      	movs	r1, #0
 80202b2:	4815      	ldr	r0, [pc, #84]	@ (8020308 <fault_handler_helper+0xfc>)
 80202b4:	f000 f8c4 	bl	8020440 <printf>
    printf("reason -> fault", 0x0);
 80202b8:	2100      	movs	r1, #0
 80202ba:	4814      	ldr	r0, [pc, #80]	@ (802030c <fault_handler_helper+0x100>)
 80202bc:	f000 f8c0 	bl	8020440 <printf>

    (*(user_process_t **)(RUNNING_PROCESS_AD))->state = SUSPEND_STATE;
 80202c0:	4b13      	ldr	r3, [pc, #76]	@ (8020310 <fault_handler_helper+0x104>)
 80202c2:	681b      	ldr	r3, [r3, #0]
 80202c4:	2202      	movs	r2, #2
 80202c6:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* trigger context switching*/
    PendSV_Handler();
 80202c8:	f000 fd1e 	bl	8020d08 <PendSV_Handler>
 80202cc:	e000      	b.n	80202d0 <fault_handler_helper+0xc4>
    return;
 80202ce:	bf00      	nop
  }
}
 80202d0:	3718      	adds	r7, #24
 80202d2:	46bd      	mov	sp, r7
 80202d4:	bd80      	pop	{r7, pc}
 80202d6:	bf00      	nop
 80202d8:	08020e64 	.word	0x08020e64
 80202dc:	e000ed00 	.word	0xe000ed00
 80202e0:	e000ed38 	.word	0xe000ed38
 80202e4:	08020e74 	.word	0x08020e74
 80202e8:	08020e8c 	.word	0x08020e8c
 80202ec:	08020eac 	.word	0x08020eac
 80202f0:	08020ed4 	.word	0x08020ed4
 80202f4:	e000ed28 	.word	0xe000ed28
 80202f8:	08020ee4 	.word	0x08020ee4
 80202fc:	08020f14 	.word	0x08020f14
 8020300:	08020f20 	.word	0x08020f20
 8020304:	08020f48 	.word	0x08020f48
 8020308:	08020f64 	.word	0x08020f64
 802030c:	08020f84 	.word	0x08020f84
 8020310:	20016004 	.word	0x20016004

08020314 <HardFault_Handler_helper>:

void HardFault_Handler_helper(uint32_t pc) {
 8020314:	b580      	push	{r7, lr}
 8020316:	b084      	sub	sp, #16
 8020318:	af00      	add	r7, sp, #0
 802031a:	6078      	str	r0, [r7, #4]

  uint32_t instruction = *(uint32_t *)(pc);
 802031c:	687b      	ldr	r3, [r7, #4]
 802031e:	681b      	ldr	r3, [r3, #0]
 8020320:	60fb      	str	r3, [r7, #12]

  printf("HARD_FAULT !!!\n\r", 0x0);
 8020322:	2100      	movs	r1, #0
 8020324:	480c      	ldr	r0, [pc, #48]	@ (8020358 <HardFault_Handler_helper+0x44>)
 8020326:	f000 f88b 	bl	8020440 <printf>
  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 802032a:	490c      	ldr	r1, [pc, #48]	@ (802035c <HardFault_Handler_helper+0x48>)
 802032c:	480c      	ldr	r0, [pc, #48]	@ (8020360 <HardFault_Handler_helper+0x4c>)
 802032e:	f000 f887 	bl	8020440 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
 8020332:	490c      	ldr	r1, [pc, #48]	@ (8020364 <HardFault_Handler_helper+0x50>)
 8020334:	480c      	ldr	r0, [pc, #48]	@ (8020368 <HardFault_Handler_helper+0x54>)
 8020336:	f000 f883 	bl	8020440 <printf>
  printf("PC -> %\n\r", (uint32_t)(&pc));
 802033a:	1d3b      	adds	r3, r7, #4
 802033c:	4619      	mov	r1, r3
 802033e:	480b      	ldr	r0, [pc, #44]	@ (802036c <HardFault_Handler_helper+0x58>)
 8020340:	f000 f87e 	bl	8020440 <printf>
  printf("instruction that triggered HardFault -> %\n\r",
 8020344:	f107 030c 	add.w	r3, r7, #12
 8020348:	4619      	mov	r1, r3
 802034a:	4809      	ldr	r0, [pc, #36]	@ (8020370 <HardFault_Handler_helper+0x5c>)
 802034c:	f000 f878 	bl	8020440 <printf>
         (uint32_t)&instruction);
}
 8020350:	bf00      	nop
 8020352:	3710      	adds	r7, #16
 8020354:	46bd      	mov	sp, r7
 8020356:	bd80      	pop	{r7, pc}
 8020358:	08020f94 	.word	0x08020f94
 802035c:	e000ed28 	.word	0xe000ed28
 8020360:	08020ee4 	.word	0x08020ee4
 8020364:	e000ed2c 	.word	0xe000ed2c
 8020368:	08020fa8 	.word	0x08020fa8
 802036c:	08020f14 	.word	0x08020f14
 8020370:	08020fcc 	.word	0x08020fcc

08020374 <enterCRITICAL>:
#include "core.h"
#include "usart.h"
#include <stdint.h>

void enterCRITICAL(void) { __disable_irq(); }
 8020374:	b480      	push	{r7}
 8020376:	af00      	add	r7, sp, #0
  \details Disables IRQ interrupts by setting special-purpose register PRIMASK.
           Can only be executed in Privileged modes.
 */
__STATIC_FORCEINLINE void __disable_irq(void)
{
  __ASM volatile ("cpsid i" : : : "memory");
 8020378:	b672      	cpsid	i
}
 802037a:	bf00      	nop
 802037c:	bf00      	nop
 802037e:	46bd      	mov	sp, r7
 8020380:	bc80      	pop	{r7}
 8020382:	4770      	bx	lr

08020384 <exitCRITICAL>:

void exitCRITICAL(void) { __enable_irq(); }
 8020384:	b480      	push	{r7}
 8020386:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsie i" : : : "memory");
 8020388:	b662      	cpsie	i
}
 802038a:	bf00      	nop
 802038c:	bf00      	nop
 802038e:	46bd      	mov	sp, r7
 8020390:	bc80      	pop	{r7}
 8020392:	4770      	bx	lr

08020394 <_strlen>:

uint32_t _strlen(const char *msg) {
 8020394:	b480      	push	{r7}
 8020396:	b085      	sub	sp, #20
 8020398:	af00      	add	r7, sp, #0
 802039a:	6078      	str	r0, [r7, #4]

  int i = 0;
 802039c:	2300      	movs	r3, #0
 802039e:	60fb      	str	r3, [r7, #12]
  while (msg[i++] != '\0')
 80203a0:	bf00      	nop
 80203a2:	68fb      	ldr	r3, [r7, #12]
 80203a4:	1c5a      	adds	r2, r3, #1
 80203a6:	60fa      	str	r2, [r7, #12]
 80203a8:	461a      	mov	r2, r3
 80203aa:	687b      	ldr	r3, [r7, #4]
 80203ac:	4413      	add	r3, r2
 80203ae:	781b      	ldrb	r3, [r3, #0]
 80203b0:	2b00      	cmp	r3, #0
 80203b2:	d1f6      	bne.n	80203a2 <_strlen+0xe>
    ;
  return i - 1;
 80203b4:	68fb      	ldr	r3, [r7, #12]
 80203b6:	3b01      	subs	r3, #1
}
 80203b8:	4618      	mov	r0, r3
 80203ba:	3714      	adds	r7, #20
 80203bc:	46bd      	mov	sp, r7
 80203be:	bc80      	pop	{r7}
 80203c0:	4770      	bx	lr

080203c2 <hex_str>:

char *hex_str(uint32_t value, char *out) {
 80203c2:	b4b0      	push	{r4, r5, r7}
 80203c4:	b08b      	sub	sp, #44	@ 0x2c
 80203c6:	af00      	add	r7, sp, #0
 80203c8:	6078      	str	r0, [r7, #4]
 80203ca:	6039      	str	r1, [r7, #0]

  char hex_char[] = "0123456789abcdef";
 80203cc:	4b1b      	ldr	r3, [pc, #108]	@ (802043c <hex_str+0x7a>)
 80203ce:	f107 0408 	add.w	r4, r7, #8
 80203d2:	461d      	mov	r5, r3
 80203d4:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
 80203d6:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 80203d8:	682b      	ldr	r3, [r5, #0]
 80203da:	7023      	strb	r3, [r4, #0]
  out[0] = '0';
 80203dc:	683b      	ldr	r3, [r7, #0]
 80203de:	2230      	movs	r2, #48	@ 0x30
 80203e0:	701a      	strb	r2, [r3, #0]
  out[1] = 'x';
 80203e2:	683b      	ldr	r3, [r7, #0]
 80203e4:	3301      	adds	r3, #1
 80203e6:	2278      	movs	r2, #120	@ 0x78
 80203e8:	701a      	strb	r2, [r3, #0]

  for (int i = 0; i < 8; i++) {
 80203ea:	2300      	movs	r3, #0
 80203ec:	627b      	str	r3, [r7, #36]	@ 0x24
 80203ee:	e01c      	b.n	802042a <hex_str+0x68>
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
 80203f0:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80203f2:	009b      	lsls	r3, r3, #2
 80203f4:	220f      	movs	r2, #15
 80203f6:	fa02 f303 	lsl.w	r3, r2, r3
 80203fa:	461a      	mov	r2, r3
 80203fc:	687b      	ldr	r3, [r7, #4]
 80203fe:	401a      	ands	r2, r3
 8020400:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8020402:	009b      	lsls	r3, r3, #2
 8020404:	fa22 f303 	lsr.w	r3, r2, r3
 8020408:	623b      	str	r3, [r7, #32]
    int j = 9 - i;
 802040a:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 802040c:	f1c3 0309 	rsb	r3, r3, #9
 8020410:	61fb      	str	r3, [r7, #28]
    out[j] = hex_char[ind];
 8020412:	69fb      	ldr	r3, [r7, #28]
 8020414:	683a      	ldr	r2, [r7, #0]
 8020416:	4413      	add	r3, r2
 8020418:	f107 0108 	add.w	r1, r7, #8
 802041c:	6a3a      	ldr	r2, [r7, #32]
 802041e:	440a      	add	r2, r1
 8020420:	7812      	ldrb	r2, [r2, #0]
 8020422:	701a      	strb	r2, [r3, #0]
  for (int i = 0; i < 8; i++) {
 8020424:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8020426:	3301      	adds	r3, #1
 8020428:	627b      	str	r3, [r7, #36]	@ 0x24
 802042a:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 802042c:	2b07      	cmp	r3, #7
 802042e:	dddf      	ble.n	80203f0 <hex_str+0x2e>
  }
}
 8020430:	bf00      	nop
 8020432:	4618      	mov	r0, r3
 8020434:	372c      	adds	r7, #44	@ 0x2c
 8020436:	46bd      	mov	sp, r7
 8020438:	bcb0      	pop	{r4, r5, r7}
 802043a:	4770      	bx	lr
 802043c:	08020ff8 	.word	0x08020ff8

08020440 <printf>:

void printf(const char *msg, uint32_t address) {
 8020440:	b580      	push	{r7, lr}
 8020442:	b0a4      	sub	sp, #144	@ 0x90
 8020444:	af00      	add	r7, sp, #0
 8020446:	6078      	str	r0, [r7, #4]
 8020448:	6039      	str	r1, [r7, #0]

  uint32_t value = *((uint32_t *)address);
 802044a:	683b      	ldr	r3, [r7, #0]
 802044c:	681b      	ldr	r3, [r3, #0]
 802044e:	67fb      	str	r3, [r7, #124]	@ 0x7c
  uint32_t msg_size = _strlen(msg);
 8020450:	6878      	ldr	r0, [r7, #4]
 8020452:	f7ff ff9f 	bl	8020394 <_strlen>
 8020456:	67b8      	str	r0, [r7, #120]	@ 0x78

  if (msg_size + 9 > MAX_STR_SIZE) {
 8020458:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 802045a:	3309      	adds	r3, #9
 802045c:	2b64      	cmp	r3, #100	@ 0x64
 802045e:	d904      	bls.n	802046a <printf+0x2a>
    __usart1_print("too large error message !!\n\r", MAX_STR_SIZE);
 8020460:	2164      	movs	r1, #100	@ 0x64
 8020462:	483d      	ldr	r0, [pc, #244]	@ (8020558 <printf+0x118>)
 8020464:	f000 fc16 	bl	8020c94 <__usart1_print>
 8020468:	e072      	b.n	8020550 <printf+0x110>
    return;
  }
  char hex[10];
  char __msg[MAX_STR_SIZE];

  uint32_t i = 0;
 802046a:	2300      	movs	r3, #0
 802046c:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
  int p = 0, q = 0;
 8020470:	2300      	movs	r3, #0
 8020472:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
 8020476:	2300      	movs	r3, #0
 8020478:	f8c7 3084 	str.w	r3, [r7, #132]	@ 0x84
  bool single_sub = false;
 802047c:	2300      	movs	r3, #0
 802047e:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83

  for (; i < msg_size; i++) {
 8020482:	e04d      	b.n	8020520 <printf+0xe0>

    if (msg[i] == '%' && !single_sub) {
 8020484:	687a      	ldr	r2, [r7, #4]
 8020486:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 802048a:	4413      	add	r3, r2
 802048c:	781b      	ldrb	r3, [r3, #0]
 802048e:	2b25      	cmp	r3, #37	@ 0x25
 8020490:	d12f      	bne.n	80204f2 <printf+0xb2>
 8020492:	f897 3083 	ldrb.w	r3, [r7, #131]	@ 0x83
 8020496:	f083 0301 	eor.w	r3, r3, #1
 802049a:	b2db      	uxtb	r3, r3
 802049c:	2b00      	cmp	r3, #0
 802049e:	d028      	beq.n	80204f2 <printf+0xb2>
      hex_str(value, hex);
 80204a0:	f107 036c 	add.w	r3, r7, #108	@ 0x6c
 80204a4:	4619      	mov	r1, r3
 80204a6:	6ff8      	ldr	r0, [r7, #124]	@ 0x7c
 80204a8:	f7ff ff8b 	bl	80203c2 <hex_str>

      while (q - p < 10) {
 80204ac:	e011      	b.n	80204d2 <printf+0x92>
        __msg[q++] = hex[q - p];
 80204ae:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 80204b2:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 80204b6:	1ad2      	subs	r2, r2, r3
 80204b8:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 80204bc:	1c59      	adds	r1, r3, #1
 80204be:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 80204c2:	3290      	adds	r2, #144	@ 0x90
 80204c4:	443a      	add	r2, r7
 80204c6:	f812 2c24 	ldrb.w	r2, [r2, #-36]
 80204ca:	3390      	adds	r3, #144	@ 0x90
 80204cc:	443b      	add	r3, r7
 80204ce:	f803 2c88 	strb.w	r2, [r3, #-136]
      while (q - p < 10) {
 80204d2:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 80204d6:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 80204da:	1ad3      	subs	r3, r2, r3
 80204dc:	2b09      	cmp	r3, #9
 80204de:	dde6      	ble.n	80204ae <printf+0x6e>
      }
      p++;
 80204e0:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 80204e4:	3301      	adds	r3, #1
 80204e6:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
      single_sub = true;
 80204ea:	2301      	movs	r3, #1
 80204ec:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83
 80204f0:	e011      	b.n	8020516 <printf+0xd6>
    } else
      __msg[q++] = msg[p++];
 80204f2:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 80204f6:	1c5a      	adds	r2, r3, #1
 80204f8:	f8c7 2088 	str.w	r2, [r7, #136]	@ 0x88
 80204fc:	461a      	mov	r2, r3
 80204fe:	687b      	ldr	r3, [r7, #4]
 8020500:	441a      	add	r2, r3
 8020502:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 8020506:	1c59      	adds	r1, r3, #1
 8020508:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 802050c:	7812      	ldrb	r2, [r2, #0]
 802050e:	3390      	adds	r3, #144	@ 0x90
 8020510:	443b      	add	r3, r7
 8020512:	f803 2c88 	strb.w	r2, [r3, #-136]
  for (; i < msg_size; i++) {
 8020516:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 802051a:	3301      	adds	r3, #1
 802051c:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
 8020520:	f8d7 208c 	ldr.w	r2, [r7, #140]	@ 0x8c
 8020524:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 8020526:	429a      	cmp	r2, r3
 8020528:	d3ac      	bcc.n	8020484 <printf+0x44>
  }
  __msg[q] = '\0';
 802052a:	f107 0208 	add.w	r2, r7, #8
 802052e:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 8020532:	4413      	add	r3, r2
 8020534:	2200      	movs	r2, #0
 8020536:	701a      	strb	r2, [r3, #0]
  __usart1_print(__msg, _strlen(__msg));
 8020538:	f107 0308 	add.w	r3, r7, #8
 802053c:	4618      	mov	r0, r3
 802053e:	f7ff ff29 	bl	8020394 <_strlen>
 8020542:	4602      	mov	r2, r0
 8020544:	f107 0308 	add.w	r3, r7, #8
 8020548:	4611      	mov	r1, r2
 802054a:	4618      	mov	r0, r3
 802054c:	f000 fba2 	bl	8020c94 <__usart1_print>
}
 8020550:	3790      	adds	r7, #144	@ 0x90
 8020552:	46bd      	mov	sp, r7
 8020554:	bd80      	pop	{r7, pc}
 8020556:	bf00      	nop
 8020558:	0802100c 	.word	0x0802100c

0802055c <syscall__printf>:

void syscall__printf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 802055c:	b580      	push	{r7, lr}
 802055e:	b084      	sub	sp, #16
 8020560:	af00      	add	r7, sp, #0
 8020562:	60f8      	str	r0, [r7, #12]
 8020564:	60b9      	str	r1, [r7, #8]
 8020566:	607a      	str	r2, [r7, #4]
 8020568:	603b      	str	r3, [r7, #0]
  // semaphore_lock(&sem_usart1);
  printf((const char *)a, b);
 802056a:	68fb      	ldr	r3, [r7, #12]
 802056c:	68b9      	ldr	r1, [r7, #8]
 802056e:	4618      	mov	r0, r3
 8020570:	f7ff ff66 	bl	8020440 <printf>
  // semaphore_unlock(&sem_usart1);
}
 8020574:	bf00      	nop
 8020576:	3710      	adds	r7, #16
 8020578:	46bd      	mov	sp, r7
 802057a:	bd80      	pop	{r7, pc}

0802057c <syscall__scanf>:

void syscall__scanf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 802057c:	b480      	push	{r7}
 802057e:	b085      	sub	sp, #20
 8020580:	af00      	add	r7, sp, #0
 8020582:	60f8      	str	r0, [r7, #12]
 8020584:	60b9      	str	r1, [r7, #8]
 8020586:	607a      	str	r2, [r7, #4]
 8020588:	603b      	str	r3, [r7, #0]

  while (1)
 802058a:	e7fe      	b.n	802058a <syscall__scanf+0xe>

0802058c <main>:
void main15 (void);

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind);
void launch_process (void);

int main() {
 802058c:	b580      	push	{r7, lr}
 802058e:	b086      	sub	sp, #24
 8020590:	af00      	add	r7, sp, #0

    SCB->SHP[10] = 0xff;    // set the PendSV to be the lowest priority...
 8020592:	4b51      	ldr	r3, [pc, #324]	@ (80206d8 <main+0x14c>)
 8020594:	22ff      	movs	r2, #255	@ 0xff
 8020596:	f883 2022 	strb.w	r2, [r3, #34]	@ 0x22

    /* some init code */
    __usart1_init ();
 802059a:	f000 fb39 	bl	8020c10 <__usart1_init>
    queue_init (&ready_queue);
 802059e:	484f      	ldr	r0, [pc, #316]	@ (80206dc <main+0x150>)
 80205a0:	f000 f9d0 	bl	8020944 <queue_init>
    semaphore_init (&sem_usart1, 1);
 80205a4:	2101      	movs	r1, #1
 80205a6:	484e      	ldr	r0, [pc, #312]	@ (80206e0 <main+0x154>)
 80205a8:	f000 facc 	bl	8020b44 <semaphore_init>

    if (process_count < 1 || process_count > MAX_PROCESS_NUM){
 80205ac:	4b4d      	ldr	r3, [pc, #308]	@ (80206e4 <main+0x158>)
 80205ae:	781b      	ldrb	r3, [r3, #0]
 80205b0:	2b00      	cmp	r3, #0
 80205b2:	d003      	beq.n	80205bc <main+0x30>
 80205b4:	4b4b      	ldr	r3, [pc, #300]	@ (80206e4 <main+0x158>)
 80205b6:	781b      	ldrb	r3, [r3, #0]
 80205b8:	2b0f      	cmp	r3, #15
 80205ba:	d904      	bls.n	80205c6 <main+0x3a>
        printf ("ERROR in the number of process ....\n\r", 0x0);
 80205bc:	2100      	movs	r1, #0
 80205be:	484a      	ldr	r0, [pc, #296]	@ (80206e8 <main+0x15c>)
 80205c0:	f7ff ff3e 	bl	8020440 <printf>
        while (1);
 80205c4:	e7fe      	b.n	80205c4 <main+0x38>
    }

    /******************** fault handler init ***************************/
    
    // enable faults (without this any fault = hardfault)
    SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;
 80205c6:	4b44      	ldr	r3, [pc, #272]	@ (80206d8 <main+0x14c>)
 80205c8:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80205ca:	4a43      	ldr	r2, [pc, #268]	@ (80206d8 <main+0x14c>)
 80205cc:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
 80205d0:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;
 80205d2:	4b41      	ldr	r3, [pc, #260]	@ (80206d8 <main+0x14c>)
 80205d4:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80205d6:	4a40      	ldr	r2, [pc, #256]	@ (80206d8 <main+0x14c>)
 80205d8:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
 80205dc:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;
 80205de:	4b3e      	ldr	r3, [pc, #248]	@ (80206d8 <main+0x14c>)
 80205e0:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80205e2:	4a3d      	ldr	r2, [pc, #244]	@ (80206d8 <main+0x14c>)
 80205e4:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 80205e8:	6253      	str	r3, [r2, #36]	@ 0x24



    /* init syscall table */
    Syscall_Table[0] =  syscall__printf;
 80205ea:	4b40      	ldr	r3, [pc, #256]	@ (80206ec <main+0x160>)
 80205ec:	4a40      	ldr	r2, [pc, #256]	@ (80206f0 <main+0x164>)
 80205ee:	601a      	str	r2, [r3, #0]
    Syscall_Table[1] =  syscall__scanf;
 80205f0:	4b3e      	ldr	r3, [pc, #248]	@ (80206ec <main+0x160>)
 80205f2:	4a40      	ldr	r2, [pc, #256]	@ (80206f4 <main+0x168>)
 80205f4:	605a      	str	r2, [r3, #4]
    *(uint32_t *)(SYSCALL_TABLE_AD) = (uint32_t)(Syscall_Table);
 80205f6:	4b40      	ldr	r3, [pc, #256]	@ (80206f8 <main+0x16c>)
 80205f8:	4a3c      	ldr	r2, [pc, #240]	@ (80206ec <main+0x160>)
 80205fa:	601a      	str	r2, [r3, #0]
    
    uint32_t psp_val = USER_STACK_INIT;
 80205fc:	4b3f      	ldr	r3, [pc, #252]	@ (80206fc <main+0x170>)
 80205fe:	617b      	str	r3, [r7, #20]
    uint32_t msp_val = KERNEL_STACK_INIT;
 8020600:	4b3f      	ldr	r3, [pc, #252]	@ (8020700 <main+0x174>)
 8020602:	613b      	str	r3, [r7, #16]
    uint32_t user_stack_size = USER_STACK_SIZE / process_count;
 8020604:	4b37      	ldr	r3, [pc, #220]	@ (80206e4 <main+0x158>)
 8020606:	781b      	ldrb	r3, [r3, #0]
 8020608:	461a      	mov	r2, r3
 802060a:	f44f 4300 	mov.w	r3, #32768	@ 0x8000
 802060e:	fb93 f3f2 	sdiv	r3, r3, r2
 8020612:	60bb      	str	r3, [r7, #8]
    uint32_t kernel_stack_size = KERNEL_STACK_SIZE / process_count;
 8020614:	4b33      	ldr	r3, [pc, #204]	@ (80206e4 <main+0x158>)
 8020616:	781b      	ldrb	r3, [r3, #0]
 8020618:	461a      	mov	r2, r3
 802061a:	f44f 43c0 	mov.w	r3, #24576	@ 0x6000
 802061e:	fb93 f3f2 	sdiv	r3, r3, r2
 8020622:	607b      	str	r3, [r7, #4]

    /* fill the pcs */
    process_pc [0] = main1;
 8020624:	4b37      	ldr	r3, [pc, #220]	@ (8020704 <main+0x178>)
 8020626:	4a38      	ldr	r2, [pc, #224]	@ (8020708 <main+0x17c>)
 8020628:	601a      	str	r2, [r3, #0]
    process_pc [1] = main2;
 802062a:	4b36      	ldr	r3, [pc, #216]	@ (8020704 <main+0x178>)
 802062c:	4a37      	ldr	r2, [pc, #220]	@ (802070c <main+0x180>)
 802062e:	605a      	str	r2, [r3, #4]
    process_pc [2] = main3;
 8020630:	4b34      	ldr	r3, [pc, #208]	@ (8020704 <main+0x178>)
 8020632:	4a37      	ldr	r2, [pc, #220]	@ (8020710 <main+0x184>)
 8020634:	609a      	str	r2, [r3, #8]
    process_pc [3] = main4;
 8020636:	4b33      	ldr	r3, [pc, #204]	@ (8020704 <main+0x178>)
 8020638:	4a36      	ldr	r2, [pc, #216]	@ (8020714 <main+0x188>)
 802063a:	60da      	str	r2, [r3, #12]
    process_pc [4] = main5;
 802063c:	4b31      	ldr	r3, [pc, #196]	@ (8020704 <main+0x178>)
 802063e:	4a36      	ldr	r2, [pc, #216]	@ (8020718 <main+0x18c>)
 8020640:	611a      	str	r2, [r3, #16]
    process_pc [5] = main6;
 8020642:	4b30      	ldr	r3, [pc, #192]	@ (8020704 <main+0x178>)
 8020644:	4a35      	ldr	r2, [pc, #212]	@ (802071c <main+0x190>)
 8020646:	615a      	str	r2, [r3, #20]
    process_pc [6] = main7;
 8020648:	4b2e      	ldr	r3, [pc, #184]	@ (8020704 <main+0x178>)
 802064a:	4a35      	ldr	r2, [pc, #212]	@ (8020720 <main+0x194>)
 802064c:	619a      	str	r2, [r3, #24]
    process_pc [7] = main8;
 802064e:	4b2d      	ldr	r3, [pc, #180]	@ (8020704 <main+0x178>)
 8020650:	4a34      	ldr	r2, [pc, #208]	@ (8020724 <main+0x198>)
 8020652:	61da      	str	r2, [r3, #28]
    process_pc [8] = main9;
 8020654:	4b2b      	ldr	r3, [pc, #172]	@ (8020704 <main+0x178>)
 8020656:	4a34      	ldr	r2, [pc, #208]	@ (8020728 <main+0x19c>)
 8020658:	621a      	str	r2, [r3, #32]
    process_pc [9] = main10;
 802065a:	4b2a      	ldr	r3, [pc, #168]	@ (8020704 <main+0x178>)
 802065c:	4a33      	ldr	r2, [pc, #204]	@ (802072c <main+0x1a0>)
 802065e:	625a      	str	r2, [r3, #36]	@ 0x24
    process_pc [10] = main11;
 8020660:	4b28      	ldr	r3, [pc, #160]	@ (8020704 <main+0x178>)
 8020662:	4a33      	ldr	r2, [pc, #204]	@ (8020730 <main+0x1a4>)
 8020664:	629a      	str	r2, [r3, #40]	@ 0x28
    process_pc [11] = main12;
 8020666:	4b27      	ldr	r3, [pc, #156]	@ (8020704 <main+0x178>)
 8020668:	4a32      	ldr	r2, [pc, #200]	@ (8020734 <main+0x1a8>)
 802066a:	62da      	str	r2, [r3, #44]	@ 0x2c
    process_pc [12] = main13;
 802066c:	4b25      	ldr	r3, [pc, #148]	@ (8020704 <main+0x178>)
 802066e:	4a32      	ldr	r2, [pc, #200]	@ (8020738 <main+0x1ac>)
 8020670:	631a      	str	r2, [r3, #48]	@ 0x30
    process_pc [13] = main14;
 8020672:	4b24      	ldr	r3, [pc, #144]	@ (8020704 <main+0x178>)
 8020674:	4a31      	ldr	r2, [pc, #196]	@ (802073c <main+0x1b0>)
 8020676:	635a      	str	r2, [r3, #52]	@ 0x34
    process_pc [14] = main15;
 8020678:	4b22      	ldr	r3, [pc, #136]	@ (8020704 <main+0x178>)
 802067a:	4a31      	ldr	r2, [pc, #196]	@ (8020740 <main+0x1b4>)
 802067c:	639a      	str	r2, [r3, #56]	@ 0x38

    for (uint8_t i=0; i<process_count; i++){
 802067e:	2300      	movs	r3, #0
 8020680:	73fb      	strb	r3, [r7, #15]
 8020682:	e01e      	b.n	80206c2 <main+0x136>
        make_process (&process[i], psp_val, msp_val, i);
 8020684:	7bfa      	ldrb	r2, [r7, #15]
 8020686:	4613      	mov	r3, r2
 8020688:	005b      	lsls	r3, r3, #1
 802068a:	4413      	add	r3, r2
 802068c:	011b      	lsls	r3, r3, #4
 802068e:	4a2d      	ldr	r2, [pc, #180]	@ (8020744 <main+0x1b8>)
 8020690:	1898      	adds	r0, r3, r2
 8020692:	7bfb      	ldrb	r3, [r7, #15]
 8020694:	693a      	ldr	r2, [r7, #16]
 8020696:	6979      	ldr	r1, [r7, #20]
 8020698:	f000 f856 	bl	8020748 <make_process>
        psp_val -= user_stack_size;
 802069c:	697a      	ldr	r2, [r7, #20]
 802069e:	68bb      	ldr	r3, [r7, #8]
 80206a0:	1ad3      	subs	r3, r2, r3
 80206a2:	617b      	str	r3, [r7, #20]
        msp_val -= kernel_stack_size;
 80206a4:	693a      	ldr	r2, [r7, #16]
 80206a6:	687b      	ldr	r3, [r7, #4]
 80206a8:	1ad3      	subs	r3, r2, r3
 80206aa:	613b      	str	r3, [r7, #16]
        /* make stack pointers word aligned */
        psp_val &= ~(3);
 80206ac:	697b      	ldr	r3, [r7, #20]
 80206ae:	f023 0303 	bic.w	r3, r3, #3
 80206b2:	617b      	str	r3, [r7, #20]
        msp_val &= ~(3);
 80206b4:	693b      	ldr	r3, [r7, #16]
 80206b6:	f023 0303 	bic.w	r3, r3, #3
 80206ba:	613b      	str	r3, [r7, #16]
    for (uint8_t i=0; i<process_count; i++){
 80206bc:	7bfb      	ldrb	r3, [r7, #15]
 80206be:	3301      	adds	r3, #1
 80206c0:	73fb      	strb	r3, [r7, #15]
 80206c2:	4b08      	ldr	r3, [pc, #32]	@ (80206e4 <main+0x158>)
 80206c4:	781b      	ldrb	r3, [r3, #0]
 80206c6:	7bfa      	ldrb	r2, [r7, #15]
 80206c8:	429a      	cmp	r2, r3
 80206ca:	d3db      	bcc.n	8020684 <main+0xf8>
 
    /* accessing illegal address in kernel code -> Kernel Panic*/
//    *(uint32_t*) (0xffffffff) = 5;

    /*impose user restriction*/
    mpu_setup ();
 80206cc:	f000 f906 	bl	80208dc <mpu_setup>

    /* start the processes */
    launch_process();
 80206d0:	f000 f8a6 	bl	8020820 <launch_process>
    /* should never fall to this section */
    while (1);
 80206d4:	e7fe      	b.n	80206d4 <main+0x148>
 80206d6:	bf00      	nop
 80206d8:	e000ed00 	.word	0xe000ed00
 80206dc:	200003b8 	.word	0x200003b8
 80206e0:	2000002c 	.word	0x2000002c
 80206e4:	20000000 	.word	0x20000000
 80206e8:	0802102c 	.word	0x0802102c
 80206ec:	20000004 	.word	0x20000004
 80206f0:	0802055d 	.word	0x0802055d
 80206f4:	0802057d 	.word	0x0802057d
 80206f8:	2001600c 	.word	0x2001600c
 80206fc:	20010000 	.word	0x20010000
 8020700:	20016000 	.word	0x20016000
 8020704:	2000037c 	.word	0x2000037c
 8020708:	08030001 	.word	0x08030001
 802070c:	080300a5 	.word	0x080300a5
 8020710:	080300b9 	.word	0x080300b9
 8020714:	080300cd 	.word	0x080300cd
 8020718:	080300e1 	.word	0x080300e1
 802071c:	080300f5 	.word	0x080300f5
 8020720:	08030109 	.word	0x08030109
 8020724:	0803011d 	.word	0x0803011d
 8020728:	08030131 	.word	0x08030131
 802072c:	0803002d 	.word	0x0803002d
 8020730:	08030041 	.word	0x08030041
 8020734:	08030055 	.word	0x08030055
 8020738:	08030069 	.word	0x08030069
 802073c:	0803007d 	.word	0x0803007d
 8020740:	08030091 	.word	0x08030091
 8020744:	200000ac 	.word	0x200000ac

08020748 <make_process>:
}

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind){
 8020748:	b480      	push	{r7}
 802074a:	b087      	sub	sp, #28
 802074c:	af00      	add	r7, sp, #0
 802074e:	60f8      	str	r0, [r7, #12]
 8020750:	60b9      	str	r1, [r7, #8]
 8020752:	607a      	str	r2, [r7, #4]
 8020754:	70fb      	strb	r3, [r7, #3]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;
 8020756:	68fb      	ldr	r3, [r7, #12]
 8020758:	2200      	movs	r2, #0
 802075a:	61da      	str	r2, [r3, #28]
 802075c:	68fb      	ldr	r3, [r7, #12]
 802075e:	69da      	ldr	r2, [r3, #28]
 8020760:	68fb      	ldr	r3, [r7, #12]
 8020762:	619a      	str	r2, [r3, #24]
 8020764:	68fb      	ldr	r3, [r7, #12]
 8020766:	699a      	ldr	r2, [r3, #24]
 8020768:	68fb      	ldr	r3, [r7, #12]
 802076a:	615a      	str	r2, [r3, #20]
 802076c:	68fb      	ldr	r3, [r7, #12]
 802076e:	695a      	ldr	r2, [r3, #20]
 8020770:	68fb      	ldr	r3, [r7, #12]
 8020772:	611a      	str	r2, [r3, #16]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
 8020774:	68fb      	ldr	r3, [r7, #12]
 8020776:	691a      	ldr	r2, [r3, #16]
 8020778:	68fb      	ldr	r3, [r7, #12]
 802077a:	60da      	str	r2, [r3, #12]
 802077c:	68fb      	ldr	r3, [r7, #12]
 802077e:	68da      	ldr	r2, [r3, #12]
 8020780:	68fb      	ldr	r3, [r7, #12]
 8020782:	609a      	str	r2, [r3, #8]
 8020784:	68fb      	ldr	r3, [r7, #12]
 8020786:	689a      	ldr	r2, [r3, #8]
 8020788:	68fb      	ldr	r3, [r7, #12]
 802078a:	605a      	str	r2, [r3, #4]
 802078c:	68fb      	ldr	r3, [r7, #12]
 802078e:	685a      	ldr	r2, [r3, #4]
 8020790:	68fb      	ldr	r3, [r7, #12]
 8020792:	601a      	str	r2, [r3, #0]

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;
 8020794:	68fb      	ldr	r3, [r7, #12]
 8020796:	f06f 0202 	mvn.w	r2, #2
 802079a:	629a      	str	r2, [r3, #40]	@ 0x28



    //process->pc = (uint32_t) fun;
    process->psp = psp;
 802079c:	68fb      	ldr	r3, [r7, #12]
 802079e:	68ba      	ldr	r2, [r7, #8]
 80207a0:	621a      	str	r2, [r3, #32]
    process->msp = msp;
 80207a2:	68fb      	ldr	r3, [r7, #12]
 80207a4:	687a      	ldr	r2, [r7, #4]
 80207a6:	625a      	str	r2, [r3, #36]	@ 0x24
    process->psp -= 8*4;        // start from 8 word below the base of the stack
 80207a8:	68fb      	ldr	r3, [r7, #12]
 80207aa:	6a1b      	ldr	r3, [r3, #32]
 80207ac:	f1a3 0220 	sub.w	r2, r3, #32
 80207b0:	68fb      	ldr	r3, [r7, #12]
 80207b2:	621a      	str	r2, [r3, #32]
    the values in the padding is random -> make them 0x0 

    set the xPSR word in the stack to 0x01000000 as 24th bit must ne 1 for xPSR to 
    represent thumb state 
    */
    for (int i=0; i<8; i++){
 80207b4:	2300      	movs	r3, #0
 80207b6:	617b      	str	r3, [r7, #20]
 80207b8:	e026      	b.n	8020808 <make_process+0xc0>
        if (i == 6)
 80207ba:	697b      	ldr	r3, [r7, #20]
 80207bc:	2b06      	cmp	r3, #6
 80207be:	d10b      	bne.n	80207d8 <make_process+0x90>
            *(uint32_t *)(process->psp+i*4) = (uint32_t) process_pc [ind];
 80207c0:	78fb      	ldrb	r3, [r7, #3]
 80207c2:	4a16      	ldr	r2, [pc, #88]	@ (802081c <make_process+0xd4>)
 80207c4:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
 80207c8:	68fb      	ldr	r3, [r7, #12]
 80207ca:	6a1b      	ldr	r3, [r3, #32]
 80207cc:	697a      	ldr	r2, [r7, #20]
 80207ce:	0092      	lsls	r2, r2, #2
 80207d0:	4413      	add	r3, r2
 80207d2:	460a      	mov	r2, r1
 80207d4:	601a      	str	r2, [r3, #0]
 80207d6:	e014      	b.n	8020802 <make_process+0xba>
        else if (i == 7)
 80207d8:	697b      	ldr	r3, [r7, #20]
 80207da:	2b07      	cmp	r3, #7
 80207dc:	d109      	bne.n	80207f2 <make_process+0xaa>
            *(uint32_t *)(process->psp+i*4) = 0x01000000;
 80207de:	68fb      	ldr	r3, [r7, #12]
 80207e0:	6a1b      	ldr	r3, [r3, #32]
 80207e2:	697a      	ldr	r2, [r7, #20]
 80207e4:	0092      	lsls	r2, r2, #2
 80207e6:	4413      	add	r3, r2
 80207e8:	461a      	mov	r2, r3
 80207ea:	f04f 7380 	mov.w	r3, #16777216	@ 0x1000000
 80207ee:	6013      	str	r3, [r2, #0]
 80207f0:	e007      	b.n	8020802 <make_process+0xba>
        else 
            *(uint32_t *)(process->psp+i*4) = 0x0;
 80207f2:	68fb      	ldr	r3, [r7, #12]
 80207f4:	6a1b      	ldr	r3, [r3, #32]
 80207f6:	697a      	ldr	r2, [r7, #20]
 80207f8:	0092      	lsls	r2, r2, #2
 80207fa:	4413      	add	r3, r2
 80207fc:	461a      	mov	r2, r3
 80207fe:	2300      	movs	r3, #0
 8020800:	6013      	str	r3, [r2, #0]
    for (int i=0; i<8; i++){
 8020802:	697b      	ldr	r3, [r7, #20]
 8020804:	3301      	adds	r3, #1
 8020806:	617b      	str	r3, [r7, #20]
 8020808:	697b      	ldr	r3, [r7, #20]
 802080a:	2b07      	cmp	r3, #7
 802080c:	ddd5      	ble.n	80207ba <make_process+0x72>
    }
    

}
 802080e:	bf00      	nop
 8020810:	bf00      	nop
 8020812:	371c      	adds	r7, #28
 8020814:	46bd      	mov	sp, r7
 8020816:	bc80      	pop	{r7}
 8020818:	4770      	bx	lr
 802081a:	bf00      	nop
 802081c:	2000037c 	.word	0x2000037c

08020820 <launch_process>:

void  launch_process (void){
 8020820:	b580      	push	{r7, lr}
 8020822:	b082      	sub	sp, #8
 8020824:	af00      	add	r7, sp, #0
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process[0].psp);
 8020826:	4b28      	ldr	r3, [pc, #160]	@ (80208c8 <launch_process+0xa8>)
 8020828:	6a1b      	ldr	r3, [r3, #32]
 802082a:	4618      	mov	r0, r3
 802082c:	f000 fb14 	bl	8020e58 <__asm__set_psp>
    __asm__set_msp (process[0].msp);
 8020830:	4b25      	ldr	r3, [pc, #148]	@ (80208c8 <launch_process+0xa8>)
 8020832:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020834:	4618      	mov	r0, r3
 8020836:	f000 fb12 	bl	8020e5e <__asm__set_msp>
       

    SysTick->LOAD = 16000 - 1;
 802083a:	4b24      	ldr	r3, [pc, #144]	@ (80208cc <launch_process+0xac>)
 802083c:	f643 627f 	movw	r2, #15999	@ 0x3e7f
 8020840:	605a      	str	r2, [r3, #4]
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
 8020842:	4b22      	ldr	r3, [pc, #136]	@ (80208cc <launch_process+0xac>)
 8020844:	681b      	ldr	r3, [r3, #0]
 8020846:	4a21      	ldr	r2, [pc, #132]	@ (80208cc <launch_process+0xac>)
 8020848:	f043 0307 	orr.w	r3, r3, #7
 802084c:	6013      	str	r3, [r2, #0]
            | SysTick_CTRL_ENABLE_Msk);

    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process[0]);
 802084e:	4b20      	ldr	r3, [pc, #128]	@ (80208d0 <launch_process+0xb0>)
 8020850:	4a1d      	ldr	r2, [pc, #116]	@ (80208c8 <launch_process+0xa8>)
 8020852:	601a      	str	r2, [r3, #0]

    /* initially all the processes will be placed in the ready queue except the first one (entry point) */
    for (uint8_t i=1; i<process_count; i++){
 8020854:	2301      	movs	r3, #1
 8020856:	71fb      	strb	r3, [r7, #7]
 8020858:	e013      	b.n	8020882 <launch_process+0x62>
        int status = queue_push (&ready_queue, &process[i]);
 802085a:	79fa      	ldrb	r2, [r7, #7]
 802085c:	4613      	mov	r3, r2
 802085e:	005b      	lsls	r3, r3, #1
 8020860:	4413      	add	r3, r2
 8020862:	011b      	lsls	r3, r3, #4
 8020864:	4a18      	ldr	r2, [pc, #96]	@ (80208c8 <launch_process+0xa8>)
 8020866:	4413      	add	r3, r2
 8020868:	4619      	mov	r1, r3
 802086a:	481a      	ldr	r0, [pc, #104]	@ (80208d4 <launch_process+0xb4>)
 802086c:	f000 f87f 	bl	802096e <queue_push>
 8020870:	4603      	mov	r3, r0
 8020872:	603b      	str	r3, [r7, #0]
        if (status){
 8020874:	683b      	ldr	r3, [r7, #0]
 8020876:	2b00      	cmp	r3, #0
 8020878:	d000      	beq.n	802087c <launch_process+0x5c>
            while (1);
 802087a:	e7fe      	b.n	802087a <launch_process+0x5a>
    for (uint8_t i=1; i<process_count; i++){
 802087c:	79fb      	ldrb	r3, [r7, #7]
 802087e:	3301      	adds	r3, #1
 8020880:	71fb      	strb	r3, [r7, #7]
 8020882:	4b15      	ldr	r3, [pc, #84]	@ (80208d8 <launch_process+0xb8>)
 8020884:	781b      	ldrb	r3, [r3, #0]
 8020886:	79fa      	ldrb	r2, [r7, #7]
 8020888:	429a      	cmp	r2, r3
 802088a:	d3e6      	bcc.n	802085a <launch_process+0x3a>
        }
    }

    process[0].state = RUNNING_STATE;
 802088c:	4b0e      	ldr	r3, [pc, #56]	@ (80208c8 <launch_process+0xa8>)
 802088e:	2201      	movs	r2, #1
 8020890:	62da      	str	r2, [r3, #44]	@ 0x2c
    for (uint8_t i=1; i<process_count; i++){
 8020892:	2301      	movs	r3, #1
 8020894:	71bb      	strb	r3, [r7, #6]
 8020896:	e00c      	b.n	80208b2 <launch_process+0x92>
        process[i].state = READY_STATE;
 8020898:	79ba      	ldrb	r2, [r7, #6]
 802089a:	490b      	ldr	r1, [pc, #44]	@ (80208c8 <launch_process+0xa8>)
 802089c:	4613      	mov	r3, r2
 802089e:	005b      	lsls	r3, r3, #1
 80208a0:	4413      	add	r3, r2
 80208a2:	011b      	lsls	r3, r3, #4
 80208a4:	440b      	add	r3, r1
 80208a6:	332c      	adds	r3, #44	@ 0x2c
 80208a8:	2200      	movs	r2, #0
 80208aa:	601a      	str	r2, [r3, #0]
    for (uint8_t i=1; i<process_count; i++){
 80208ac:	79bb      	ldrb	r3, [r7, #6]
 80208ae:	3301      	adds	r3, #1
 80208b0:	71bb      	strb	r3, [r7, #6]
 80208b2:	4b09      	ldr	r3, [pc, #36]	@ (80208d8 <launch_process+0xb8>)
 80208b4:	781b      	ldrb	r3, [r3, #0]
 80208b6:	79ba      	ldrb	r2, [r7, #6]
 80208b8:	429a      	cmp	r2, r3
 80208ba:	d3ed      	bcc.n	8020898 <launch_process+0x78>
    }
 
    __asm__launch_main1();
 80208bc:	f00f fc42 	bl	8030144 <__asm__launch_main1>

}
 80208c0:	bf00      	nop
 80208c2:	3708      	adds	r7, #8
 80208c4:	46bd      	mov	sp, r7
 80208c6:	bd80      	pop	{r7, pc}
 80208c8:	200000ac 	.word	0x200000ac
 80208cc:	e000e010 	.word	0xe000e010
 80208d0:	20016004 	.word	0x20016004
 80208d4:	200003b8 	.word	0x200003b8
 80208d8:	20000000 	.word	0x20000000

080208dc <mpu_setup>:
#include "core.h"

void mpu_setup(void) {
 80208dc:	b480      	push	{r7}
 80208de:	af00      	add	r7, sp, #0

  /*dissable mpu*/
  MPU->CTRL = 0;
 80208e0:	4b12      	ldr	r3, [pc, #72]	@ (802092c <mpu_setup+0x50>)
 80208e2:	2200      	movs	r2, #0
 80208e4:	605a      	str	r2, [r3, #4]

  /*region 0*/
  MPU->RNR = 0;
 80208e6:	4b11      	ldr	r3, [pc, #68]	@ (802092c <mpu_setup+0x50>)
 80208e8:	2200      	movs	r2, #0
 80208ea:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sFLASHUserSpace);
 80208ec:	4b0f      	ldr	r3, [pc, #60]	@ (802092c <mpu_setup+0x50>)
 80208ee:	4a10      	ldr	r2, [pc, #64]	@ (8020930 <mpu_setup+0x54>)
 80208f0:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 80208f2:	4b0e      	ldr	r3, [pc, #56]	@ (802092c <mpu_setup+0x50>)
 80208f4:	4a0f      	ldr	r2, [pc, #60]	@ (8020934 <mpu_setup+0x58>)
 80208f6:	611a      	str	r2, [r3, #16]
      (0 << MPU_RASR_XN_Pos) |     // Executable (XN = 0)
      (0b110 << MPU_RASR_AP_Pos) | // Privileged read-only user read-only
      (15 << MPU_RASR_SIZE_Pos) |  // 64 KB region
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 1;
 80208f8:	4b0c      	ldr	r3, [pc, #48]	@ (802092c <mpu_setup+0x50>)
 80208fa:	2201      	movs	r2, #1
 80208fc:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sSRAMUserSpace);
 80208fe:	4b0b      	ldr	r3, [pc, #44]	@ (802092c <mpu_setup+0x50>)
 8020900:	4a0d      	ldr	r2, [pc, #52]	@ (8020938 <mpu_setup+0x5c>)
 8020902:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 8020904:	4b09      	ldr	r3, [pc, #36]	@ (802092c <mpu_setup+0x50>)
 8020906:	4a0d      	ldr	r2, [pc, #52]	@ (802093c <mpu_setup+0x60>)
 8020908:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 2;
 802090a:	4b08      	ldr	r3, [pc, #32]	@ (802092c <mpu_setup+0x50>)
 802090c:	2202      	movs	r2, #2
 802090e:	609a      	str	r2, [r3, #8]
  MPU->RBAR = USER_STACK_END;
 8020910:	4b06      	ldr	r3, [pc, #24]	@ (802092c <mpu_setup+0x50>)
 8020912:	4a0b      	ldr	r2, [pc, #44]	@ (8020940 <mpu_setup+0x64>)
 8020914:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 8020916:	4b05      	ldr	r3, [pc, #20]	@ (802092c <mpu_setup+0x50>)
 8020918:	4a08      	ldr	r2, [pc, #32]	@ (802093c <mpu_setup+0x60>)
 802091a:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->CTRL = MPU_CTRL_PRIVDEFENA_Msk | MPU_CTRL_ENABLE_Msk;
 802091c:	4b03      	ldr	r3, [pc, #12]	@ (802092c <mpu_setup+0x50>)
 802091e:	2205      	movs	r2, #5
 8020920:	605a      	str	r2, [r3, #4]
}
 8020922:	bf00      	nop
 8020924:	46bd      	mov	sp, r7
 8020926:	bc80      	pop	{r7}
 8020928:	4770      	bx	lr
 802092a:	bf00      	nop
 802092c:	e000ed90 	.word	0xe000ed90
 8020930:	08030000 	.word	0x08030000
 8020934:	0600001f 	.word	0x0600001f
 8020938:	20004000 	.word	0x20004000
 802093c:	1300001d 	.word	0x1300001d
 8020940:	20008000 	.word	0x20008000

08020944 <queue_init>:
#include "core.h"

/* queue functions */
void queue_init (queue_t* q){
 8020944:	b480      	push	{r7}
 8020946:	b083      	sub	sp, #12
 8020948:	af00      	add	r7, sp, #0
 802094a:	6078      	str	r0, [r7, #4]
    q->size = 0;
 802094c:	687b      	ldr	r3, [r7, #4]
 802094e:	2200      	movs	r2, #0
 8020950:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    q->front = 0xff;
 8020954:	687b      	ldr	r3, [r7, #4]
 8020956:	22ff      	movs	r2, #255	@ 0xff
 8020958:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    q->rare = 0;
 802095c:	687b      	ldr	r3, [r7, #4]
 802095e:	2200      	movs	r2, #0
 8020960:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
}
 8020964:	bf00      	nop
 8020966:	370c      	adds	r7, #12
 8020968:	46bd      	mov	sp, r7
 802096a:	bc80      	pop	{r7}
 802096c:	4770      	bx	lr

0802096e <queue_push>:

uint8_t queue_push (queue_t* q, user_process_t* process){
 802096e:	b480      	push	{r7}
 8020970:	b083      	sub	sp, #12
 8020972:	af00      	add	r7, sp, #0
 8020974:	6078      	str	r0, [r7, #4]
 8020976:	6039      	str	r1, [r7, #0]
    if (q->front == 0xff){
 8020978:	687b      	ldr	r3, [r7, #4]
 802097a:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 802097e:	2bff      	cmp	r3, #255	@ 0xff
 8020980:	d104      	bne.n	802098c <queue_push+0x1e>
        /* queue is empty */
        q->front = 0;
 8020982:	687b      	ldr	r3, [r7, #4]
 8020984:	2200      	movs	r2, #0
 8020986:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
 802098a:	e009      	b.n	80209a0 <queue_push+0x32>
    }
    else if (q->rare == q->front) return -1;
 802098c:	687b      	ldr	r3, [r7, #4]
 802098e:	f893 207a 	ldrb.w	r2, [r3, #122]	@ 0x7a
 8020992:	687b      	ldr	r3, [r7, #4]
 8020994:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020998:	429a      	cmp	r2, r3
 802099a:	d101      	bne.n	80209a0 <queue_push+0x32>
 802099c:	23ff      	movs	r3, #255	@ 0xff
 802099e:	e023      	b.n	80209e8 <queue_push+0x7a>

    q->processes [q->rare] = process;
 80209a0:	687b      	ldr	r3, [r7, #4]
 80209a2:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 80209a6:	4619      	mov	r1, r3
 80209a8:	687b      	ldr	r3, [r7, #4]
 80209aa:	683a      	ldr	r2, [r7, #0]
 80209ac:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
    q->rare = (q->rare + 1) % MAX_PROCESS_NUM;
 80209b0:	687b      	ldr	r3, [r7, #4]
 80209b2:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 80209b6:	1c5a      	adds	r2, r3, #1
 80209b8:	4b0e      	ldr	r3, [pc, #56]	@ (80209f4 <queue_push+0x86>)
 80209ba:	fb83 1302 	smull	r1, r3, r3, r2
 80209be:	4413      	add	r3, r2
 80209c0:	10d9      	asrs	r1, r3, #3
 80209c2:	17d3      	asrs	r3, r2, #31
 80209c4:	1ac9      	subs	r1, r1, r3
 80209c6:	460b      	mov	r3, r1
 80209c8:	011b      	lsls	r3, r3, #4
 80209ca:	1a5b      	subs	r3, r3, r1
 80209cc:	1ad1      	subs	r1, r2, r3
 80209ce:	b2ca      	uxtb	r2, r1
 80209d0:	687b      	ldr	r3, [r7, #4]
 80209d2:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a

    q->size ++ ;
 80209d6:	687b      	ldr	r3, [r7, #4]
 80209d8:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 80209dc:	3301      	adds	r3, #1
 80209de:	b2da      	uxtb	r2, r3
 80209e0:	687b      	ldr	r3, [r7, #4]
 80209e2:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 80209e6:	2300      	movs	r3, #0
}
 80209e8:	4618      	mov	r0, r3
 80209ea:	370c      	adds	r7, #12
 80209ec:	46bd      	mov	sp, r7
 80209ee:	bc80      	pop	{r7}
 80209f0:	4770      	bx	lr
 80209f2:	bf00      	nop
 80209f4:	88888889 	.word	0x88888889

080209f8 <queue_pop>:

uint8_t queue_pop (queue_t* q){   
 80209f8:	b480      	push	{r7}
 80209fa:	b083      	sub	sp, #12
 80209fc:	af00      	add	r7, sp, #0
 80209fe:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff){
 8020a00:	687b      	ldr	r3, [r7, #4]
 8020a02:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020a06:	2bff      	cmp	r3, #255	@ 0xff
 8020a08:	d101      	bne.n	8020a0e <queue_pop+0x16>
        /* q is empty*/
        return -1;
 8020a0a:	23ff      	movs	r3, #255	@ 0xff
 8020a0c:	e02b      	b.n	8020a66 <queue_pop+0x6e>
    }
    q->front = (q->front + 1) % MAX_PROCESS_NUM;
 8020a0e:	687b      	ldr	r3, [r7, #4]
 8020a10:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020a14:	1c5a      	adds	r2, r3, #1
 8020a16:	4b16      	ldr	r3, [pc, #88]	@ (8020a70 <queue_pop+0x78>)
 8020a18:	fb83 1302 	smull	r1, r3, r3, r2
 8020a1c:	4413      	add	r3, r2
 8020a1e:	10d9      	asrs	r1, r3, #3
 8020a20:	17d3      	asrs	r3, r2, #31
 8020a22:	1ac9      	subs	r1, r1, r3
 8020a24:	460b      	mov	r3, r1
 8020a26:	011b      	lsls	r3, r3, #4
 8020a28:	1a5b      	subs	r3, r3, r1
 8020a2a:	1ad1      	subs	r1, r2, r3
 8020a2c:	b2ca      	uxtb	r2, r1
 8020a2e:	687b      	ldr	r3, [r7, #4]
 8020a30:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    if (q->front == q->rare){
 8020a34:	687b      	ldr	r3, [r7, #4]
 8020a36:	f893 2079 	ldrb.w	r2, [r3, #121]	@ 0x79
 8020a3a:	687b      	ldr	r3, [r7, #4]
 8020a3c:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 8020a40:	429a      	cmp	r2, r3
 8020a42:	d107      	bne.n	8020a54 <queue_pop+0x5c>
        q->front = 0xff;
 8020a44:	687b      	ldr	r3, [r7, #4]
 8020a46:	22ff      	movs	r2, #255	@ 0xff
 8020a48:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
        q->rare = 0;
 8020a4c:	687b      	ldr	r3, [r7, #4]
 8020a4e:	2200      	movs	r2, #0
 8020a50:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
    }
    q->size --;
 8020a54:	687b      	ldr	r3, [r7, #4]
 8020a56:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 8020a5a:	3b01      	subs	r3, #1
 8020a5c:	b2da      	uxtb	r2, r3
 8020a5e:	687b      	ldr	r3, [r7, #4]
 8020a60:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 8020a64:	2300      	movs	r3, #0
}
 8020a66:	4618      	mov	r0, r3
 8020a68:	370c      	adds	r7, #12
 8020a6a:	46bd      	mov	sp, r7
 8020a6c:	bc80      	pop	{r7}
 8020a6e:	4770      	bx	lr
 8020a70:	88888889 	.word	0x88888889

08020a74 <queue_front>:

user_process_t* queue_front (queue_t *q){
 8020a74:	b480      	push	{r7}
 8020a76:	b083      	sub	sp, #12
 8020a78:	af00      	add	r7, sp, #0
 8020a7a:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff)
 8020a7c:	687b      	ldr	r3, [r7, #4]
 8020a7e:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020a82:	2bff      	cmp	r3, #255	@ 0xff
 8020a84:	d101      	bne.n	8020a8a <queue_front+0x16>
        return NULL;
 8020a86:	2300      	movs	r3, #0
 8020a88:	e006      	b.n	8020a98 <queue_front+0x24>
    return q->processes [q->front];
 8020a8a:	687b      	ldr	r3, [r7, #4]
 8020a8c:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020a90:	461a      	mov	r2, r3
 8020a92:	687b      	ldr	r3, [r7, #4]
 8020a94:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
}
 8020a98:	4618      	mov	r0, r3
 8020a9a:	370c      	adds	r7, #12
 8020a9c:	46bd      	mov	sp, r7
 8020a9e:	bc80      	pop	{r7}
 8020aa0:	4770      	bx	lr

08020aa2 <queue_empty>:

uint32_t queue_empty (queue_t *q){
 8020aa2:	b480      	push	{r7}
 8020aa4:	b083      	sub	sp, #12
 8020aa6:	af00      	add	r7, sp, #0
 8020aa8:	6078      	str	r0, [r7, #4]
    return q->front == 0xff;
 8020aaa:	687b      	ldr	r3, [r7, #4]
 8020aac:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020ab0:	2bff      	cmp	r3, #255	@ 0xff
 8020ab2:	bf0c      	ite	eq
 8020ab4:	2301      	moveq	r3, #1
 8020ab6:	2300      	movne	r3, #0
 8020ab8:	b2db      	uxtb	r3, r3
}
 8020aba:	4618      	mov	r0, r3
 8020abc:	370c      	adds	r7, #12
 8020abe:	46bd      	mov	sp, r7
 8020ac0:	bc80      	pop	{r7}
 8020ac2:	4770      	bx	lr

08020ac4 <queue_size>:

uint32_t queue_size (queue_t *q){
 8020ac4:	b480      	push	{r7}
 8020ac6:	b083      	sub	sp, #12
 8020ac8:	af00      	add	r7, sp, #0
 8020aca:	6078      	str	r0, [r7, #4]
    return q->size;
 8020acc:	687b      	ldr	r3, [r7, #4]
 8020ace:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
}
 8020ad2:	4618      	mov	r0, r3
 8020ad4:	370c      	adds	r7, #12
 8020ad6:	46bd      	mov	sp, r7
 8020ad8:	bc80      	pop	{r7}
 8020ada:	4770      	bx	lr

08020adc <schedular>:
/* important variable from main.c */
extern user_process_t process[MAX_PROCESS_NUM];
extern queue_t ready_queue;
extern semaphore_t sem_usart1;

void schedular(void) {
 8020adc:	b580      	push	{r7, lr}
 8020ade:	b084      	sub	sp, #16
 8020ae0:	af00      	add	r7, sp, #0

  /* Round Robin (FCFS + time slice)*/
  user_process_t *picked_process = NULL;
 8020ae2:	2300      	movs	r3, #0
 8020ae4:	60fb      	str	r3, [r7, #12]
  user_process_t *running_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 8020ae6:	4b14      	ldr	r3, [pc, #80]	@ (8020b38 <schedular+0x5c>)
 8020ae8:	681b      	ldr	r3, [r3, #0]
 8020aea:	60bb      	str	r3, [r7, #8]

  picked_process = queue_front(&ready_queue);
 8020aec:	4813      	ldr	r0, [pc, #76]	@ (8020b3c <schedular+0x60>)
 8020aee:	f7ff ffc1 	bl	8020a74 <queue_front>
 8020af2:	60f8      	str	r0, [r7, #12]
  uint8_t status = queue_pop(&ready_queue);
 8020af4:	4811      	ldr	r0, [pc, #68]	@ (8020b3c <schedular+0x60>)
 8020af6:	f7ff ff7f 	bl	80209f8 <queue_pop>
 8020afa:	4603      	mov	r3, r0
 8020afc:	71fb      	strb	r3, [r7, #7]

  if (-1 == status || !picked_process)
 8020afe:	68fb      	ldr	r3, [r7, #12]
 8020b00:	2b00      	cmp	r3, #0
 8020b02:	d015      	beq.n	8020b30 <schedular+0x54>
    return;

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);
 8020b04:	4a0e      	ldr	r2, [pc, #56]	@ (8020b40 <schedular+0x64>)
 8020b06:	68fb      	ldr	r3, [r7, #12]
 8020b08:	6013      	str	r3, [r2, #0]
  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE &&
 8020b0a:	68bb      	ldr	r3, [r7, #8]
 8020b0c:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8020b0e:	2b02      	cmp	r3, #2
 8020b10:	d00a      	beq.n	8020b28 <schedular+0x4c>
      running_process->state != WAITING_STATE) {
 8020b12:	68bb      	ldr	r3, [r7, #8]
 8020b14:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
  if (running_process->state != SUSPEND_STATE &&
 8020b16:	2b03      	cmp	r3, #3
 8020b18:	d006      	beq.n	8020b28 <schedular+0x4c>
    queue_push(&ready_queue, running_process);
 8020b1a:	68b9      	ldr	r1, [r7, #8]
 8020b1c:	4807      	ldr	r0, [pc, #28]	@ (8020b3c <schedular+0x60>)
 8020b1e:	f7ff ff26 	bl	802096e <queue_push>
    running_process->state = READY_STATE;
 8020b22:	68bb      	ldr	r3, [r7, #8]
 8020b24:	2200      	movs	r2, #0
 8020b26:	62da      	str	r2, [r3, #44]	@ 0x2c
  }

  picked_process->state = RUNNING_STATE;
 8020b28:	68fb      	ldr	r3, [r7, #12]
 8020b2a:	2201      	movs	r2, #1
 8020b2c:	62da      	str	r2, [r3, #44]	@ 0x2c
 8020b2e:	e000      	b.n	8020b32 <schedular+0x56>
    return;
 8020b30:	bf00      	nop
}
 8020b32:	3710      	adds	r7, #16
 8020b34:	46bd      	mov	sp, r7
 8020b36:	bd80      	pop	{r7, pc}
 8020b38:	20016004 	.word	0x20016004
 8020b3c:	200003b8 	.word	0x200003b8
 8020b40:	20016008 	.word	0x20016008

08020b44 <semaphore_init>:
#include "core.h"

extern queue_t ready_queue;
extern uint8_t process_count;

void semaphore_init(semaphore_t *sema, uint8_t val) {
 8020b44:	b580      	push	{r7, lr}
 8020b46:	b082      	sub	sp, #8
 8020b48:	af00      	add	r7, sp, #0
 8020b4a:	6078      	str	r0, [r7, #4]
 8020b4c:	460b      	mov	r3, r1
 8020b4e:	70fb      	strb	r3, [r7, #3]
  sema->value = val; // unlocked
 8020b50:	687b      	ldr	r3, [r7, #4]
 8020b52:	78fa      	ldrb	r2, [r7, #3]
 8020b54:	701a      	strb	r2, [r3, #0]
  queue_init(&(sema->waiting_queue));
 8020b56:	687b      	ldr	r3, [r7, #4]
 8020b58:	3304      	adds	r3, #4
 8020b5a:	4618      	mov	r0, r3
 8020b5c:	f7ff fef2 	bl	8020944 <queue_init>
}
 8020b60:	bf00      	nop
 8020b62:	3708      	adds	r7, #8
 8020b64:	46bd      	mov	sp, r7
 8020b66:	bd80      	pop	{r7, pc}

08020b68 <semaphore_lock>:

/* this has to be atomic */
void semaphore_lock(semaphore_t *sema) {
 8020b68:	b580      	push	{r7, lr}
 8020b6a:	b084      	sub	sp, #16
 8020b6c:	af00      	add	r7, sp, #0
 8020b6e:	6078      	str	r0, [r7, #4]
  __ASM volatile ("cpsid i" : : : "memory");
 8020b70:	b672      	cpsid	i
}
 8020b72:	bf00      	nop
  __disable_irq();
  if (sema->value == 0) { // semaphore cannot be locked ...
 8020b74:	687b      	ldr	r3, [r7, #4]
 8020b76:	781b      	ldrb	r3, [r3, #0]
 8020b78:	2b00      	cmp	r3, #0
 8020b7a:	d110      	bne.n	8020b9e <semaphore_lock+0x36>
    user_process_t *running_process =
        *((user_process_t **)(RUNNING_PROCESS_AD));
 8020b7c:	4b0d      	ldr	r3, [pc, #52]	@ (8020bb4 <semaphore_lock+0x4c>)
    user_process_t *running_process =
 8020b7e:	681b      	ldr	r3, [r3, #0]
 8020b80:	60fb      	str	r3, [r7, #12]
    queue_push(&(sema->waiting_queue), running_process);
 8020b82:	687b      	ldr	r3, [r7, #4]
 8020b84:	3304      	adds	r3, #4
 8020b86:	68f9      	ldr	r1, [r7, #12]
 8020b88:	4618      	mov	r0, r3
 8020b8a:	f7ff fef0 	bl	802096e <queue_push>
    running_process->state = WAITING_STATE;
 8020b8e:	68fb      	ldr	r3, [r7, #12]
 8020b90:	2203      	movs	r2, #3
 8020b92:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* call PendSV_Handler for context switching */
    PendSV_Handler();
 8020b94:	f000 f8b8 	bl	8020d08 <PendSV_Handler>
  __ASM volatile ("cpsie i" : : : "memory");
 8020b98:	b662      	cpsie	i
}
 8020b9a:	bf00      	nop
//    schedular ();

    __enable_irq();
    return;
 8020b9c:	e007      	b.n	8020bae <semaphore_lock+0x46>
  }
  sema->value--;
 8020b9e:	687b      	ldr	r3, [r7, #4]
 8020ba0:	781b      	ldrb	r3, [r3, #0]
 8020ba2:	3b01      	subs	r3, #1
 8020ba4:	b2da      	uxtb	r2, r3
 8020ba6:	687b      	ldr	r3, [r7, #4]
 8020ba8:	701a      	strb	r2, [r3, #0]
  __ASM volatile ("cpsie i" : : : "memory");
 8020baa:	b662      	cpsie	i
}
 8020bac:	bf00      	nop
  __enable_irq();
}
 8020bae:	3710      	adds	r7, #16
 8020bb0:	46bd      	mov	sp, r7
 8020bb2:	bd80      	pop	{r7, pc}
 8020bb4:	20016004 	.word	0x20016004

08020bb8 <semaphore_unlock>:

void semaphore_unlock(semaphore_t *sema) {
 8020bb8:	b580      	push	{r7, lr}
 8020bba:	b084      	sub	sp, #16
 8020bbc:	af00      	add	r7, sp, #0
 8020bbe:	6078      	str	r0, [r7, #4]
  __ASM volatile ("cpsid i" : : : "memory");
 8020bc0:	b672      	cpsid	i
}
 8020bc2:	bf00      	nop
  __disable_irq();
  sema->value++;
 8020bc4:	687b      	ldr	r3, [r7, #4]
 8020bc6:	781b      	ldrb	r3, [r3, #0]
 8020bc8:	3301      	adds	r3, #1
 8020bca:	b2da      	uxtb	r2, r3
 8020bcc:	687b      	ldr	r3, [r7, #4]
 8020bce:	701a      	strb	r2, [r3, #0]
  /* unlocked */
  user_process_t *process = queue_front(&(sema->waiting_queue));
 8020bd0:	687b      	ldr	r3, [r7, #4]
 8020bd2:	3304      	adds	r3, #4
 8020bd4:	4618      	mov	r0, r3
 8020bd6:	f7ff ff4d 	bl	8020a74 <queue_front>
 8020bda:	60f8      	str	r0, [r7, #12]
  if (!process) {
 8020bdc:	68fb      	ldr	r3, [r7, #12]
 8020bde:	2b00      	cmp	r3, #0
 8020be0:	d102      	bne.n	8020be8 <semaphore_unlock+0x30>
  __ASM volatile ("cpsie i" : : : "memory");
 8020be2:	b662      	cpsie	i
}
 8020be4:	bf00      	nop
    /* no process is waiting */
    __enable_irq();
    return;
 8020be6:	e00d      	b.n	8020c04 <semaphore_unlock+0x4c>
  }
  queue_pop(&(sema->waiting_queue));
 8020be8:	687b      	ldr	r3, [r7, #4]
 8020bea:	3304      	adds	r3, #4
 8020bec:	4618      	mov	r0, r3
 8020bee:	f7ff ff03 	bl	80209f8 <queue_pop>
  process->state = READY_STATE;
 8020bf2:	68fb      	ldr	r3, [r7, #12]
 8020bf4:	2200      	movs	r2, #0
 8020bf6:	62da      	str	r2, [r3, #44]	@ 0x2c
  queue_push(&ready_queue, process);
 8020bf8:	68f9      	ldr	r1, [r7, #12]
 8020bfa:	4804      	ldr	r0, [pc, #16]	@ (8020c0c <semaphore_unlock+0x54>)
 8020bfc:	f7ff feb7 	bl	802096e <queue_push>
  __ASM volatile ("cpsie i" : : : "memory");
 8020c00:	b662      	cpsie	i
}
 8020c02:	bf00      	nop
  __enable_irq();
}
 8020c04:	3710      	adds	r7, #16
 8020c06:	46bd      	mov	sp, r7
 8020c08:	bd80      	pop	{r7, pc}
 8020c0a:	bf00      	nop
 8020c0c:	200003b8 	.word	0x200003b8

08020c10 <__usart1_init>:
#include "core.h"
#include "usart.h"

void __usart1_init(void) {
 8020c10:	b480      	push	{r7}
 8020c12:	af00      	add	r7, sp, #0

  RCC->APB2ENR |= RCC_APB2ENR_USART1EN_Msk;
 8020c14:	4b1c      	ldr	r3, [pc, #112]	@ (8020c88 <__usart1_init+0x78>)
 8020c16:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 8020c18:	4a1b      	ldr	r2, [pc, #108]	@ (8020c88 <__usart1_init+0x78>)
 8020c1a:	f043 0310 	orr.w	r3, r3, #16
 8020c1e:	6453      	str	r3, [r2, #68]	@ 0x44
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
 8020c20:	4b19      	ldr	r3, [pc, #100]	@ (8020c88 <__usart1_init+0x78>)
 8020c22:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8020c24:	4a18      	ldr	r2, [pc, #96]	@ (8020c88 <__usart1_init+0x78>)
 8020c26:	f043 0301 	orr.w	r3, r3, #1
 8020c2a:	6313      	str	r3, [r2, #48]	@ 0x30
  // alternate function mode
  GPIOA->MODER &= ~((3 << (2 * TX_PIN)) | (3 << (2 * RX_PIN)));
 8020c2c:	4b17      	ldr	r3, [pc, #92]	@ (8020c8c <__usart1_init+0x7c>)
 8020c2e:	681b      	ldr	r3, [r3, #0]
 8020c30:	4a16      	ldr	r2, [pc, #88]	@ (8020c8c <__usart1_init+0x7c>)
 8020c32:	f423 1370 	bic.w	r3, r3, #3932160	@ 0x3c0000
 8020c36:	6013      	str	r3, [r2, #0]
  GPIOA->MODER |= 2 << (2 * TX_PIN) | 2 << (2 * RX_PIN);
 8020c38:	4b14      	ldr	r3, [pc, #80]	@ (8020c8c <__usart1_init+0x7c>)
 8020c3a:	681b      	ldr	r3, [r3, #0]
 8020c3c:	4a13      	ldr	r2, [pc, #76]	@ (8020c8c <__usart1_init+0x7c>)
 8020c3e:	f443 1320 	orr.w	r3, r3, #2621440	@ 0x280000
 8020c42:	6013      	str	r3, [r2, #0]
  // high speed
  GPIOA->OSPEEDR |= (3 << (TX_PIN * 2)) | (3 << (RX_PIN * 2));
 8020c44:	4b11      	ldr	r3, [pc, #68]	@ (8020c8c <__usart1_init+0x7c>)
 8020c46:	689b      	ldr	r3, [r3, #8]
 8020c48:	4a10      	ldr	r2, [pc, #64]	@ (8020c8c <__usart1_init+0x7c>)
 8020c4a:	f443 1370 	orr.w	r3, r3, #3932160	@ 0x3c0000
 8020c4e:	6093      	str	r3, [r2, #8]
  // clear the bits in AFR register
  GPIOA->AFR[1] &= ~((0xf << 4) | (0xf << 8));
 8020c50:	4b0e      	ldr	r3, [pc, #56]	@ (8020c8c <__usart1_init+0x7c>)
 8020c52:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020c54:	4a0d      	ldr	r2, [pc, #52]	@ (8020c8c <__usart1_init+0x7c>)
 8020c56:	f423 637f 	bic.w	r3, r3, #4080	@ 0xff0
 8020c5a:	6253      	str	r3, [r2, #36]	@ 0x24
  // set for af7
  GPIOA->AFR[1] |= (7 << 4) | (7 << 8);
 8020c5c:	4b0b      	ldr	r3, [pc, #44]	@ (8020c8c <__usart1_init+0x7c>)
 8020c5e:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020c60:	4a0a      	ldr	r2, [pc, #40]	@ (8020c8c <__usart1_init+0x7c>)
 8020c62:	f443 63ee 	orr.w	r3, r3, #1904	@ 0x770
 8020c66:	6253      	str	r3, [r2, #36]	@ 0x24

  // enable usart, reciever, transiever
  USART1->CR1 |= USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
 8020c68:	4b09      	ldr	r3, [pc, #36]	@ (8020c90 <__usart1_init+0x80>)
 8020c6a:	68db      	ldr	r3, [r3, #12]
 8020c6c:	4a08      	ldr	r2, [pc, #32]	@ (8020c90 <__usart1_init+0x80>)
 8020c6e:	f443 5300 	orr.w	r3, r3, #8192	@ 0x2000
 8020c72:	f043 030c 	orr.w	r3, r3, #12
 8020c76:	60d3      	str	r3, [r2, #12]
  // set the baud rate (115200 in this case)
  USART1->BRR = 0x08B;
 8020c78:	4b05      	ldr	r3, [pc, #20]	@ (8020c90 <__usart1_init+0x80>)
 8020c7a:	228b      	movs	r2, #139	@ 0x8b
 8020c7c:	609a      	str	r2, [r3, #8]
}
 8020c7e:	bf00      	nop
 8020c80:	46bd      	mov	sp, r7
 8020c82:	bc80      	pop	{r7}
 8020c84:	4770      	bx	lr
 8020c86:	bf00      	nop
 8020c88:	40023800 	.word	0x40023800
 8020c8c:	40020000 	.word	0x40020000
 8020c90:	40011000 	.word	0x40011000

08020c94 <__usart1_print>:

void __usart1_print(const char *msg, uint32_t size) {
 8020c94:	b480      	push	{r7}
 8020c96:	b085      	sub	sp, #20
 8020c98:	af00      	add	r7, sp, #0
 8020c9a:	6078      	str	r0, [r7, #4]
 8020c9c:	6039      	str	r1, [r7, #0]

  // semaphore_lock(&sem_usart1);
  //enterCRITICAL();
  int i = 0;
 8020c9e:	2300      	movs	r3, #0
 8020ca0:	60fb      	str	r3, [r7, #12]
  while (i < size && msg[i] != '\0') {
 8020ca2:	e00f      	b.n	8020cc4 <__usart1_print+0x30>
    while (!(USART1->SR & USART_SR_TXE))
 8020ca4:	bf00      	nop
 8020ca6:	4b13      	ldr	r3, [pc, #76]	@ (8020cf4 <__usart1_print+0x60>)
 8020ca8:	681b      	ldr	r3, [r3, #0]
 8020caa:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8020cae:	2b00      	cmp	r3, #0
 8020cb0:	d0f9      	beq.n	8020ca6 <__usart1_print+0x12>
      ;
    USART1->DR = msg[i++];
 8020cb2:	68fb      	ldr	r3, [r7, #12]
 8020cb4:	1c5a      	adds	r2, r3, #1
 8020cb6:	60fa      	str	r2, [r7, #12]
 8020cb8:	461a      	mov	r2, r3
 8020cba:	687b      	ldr	r3, [r7, #4]
 8020cbc:	4413      	add	r3, r2
 8020cbe:	781a      	ldrb	r2, [r3, #0]
 8020cc0:	4b0c      	ldr	r3, [pc, #48]	@ (8020cf4 <__usart1_print+0x60>)
 8020cc2:	605a      	str	r2, [r3, #4]
  while (i < size && msg[i] != '\0') {
 8020cc4:	68fb      	ldr	r3, [r7, #12]
 8020cc6:	683a      	ldr	r2, [r7, #0]
 8020cc8:	429a      	cmp	r2, r3
 8020cca:	d905      	bls.n	8020cd8 <__usart1_print+0x44>
 8020ccc:	68fb      	ldr	r3, [r7, #12]
 8020cce:	687a      	ldr	r2, [r7, #4]
 8020cd0:	4413      	add	r3, r2
 8020cd2:	781b      	ldrb	r3, [r3, #0]
 8020cd4:	2b00      	cmp	r3, #0
 8020cd6:	d1e5      	bne.n	8020ca4 <__usart1_print+0x10>
  }
  while (!(USART1->SR & USART_SR_TC)) {
 8020cd8:	bf00      	nop
 8020cda:	4b06      	ldr	r3, [pc, #24]	@ (8020cf4 <__usart1_print+0x60>)
 8020cdc:	681b      	ldr	r3, [r3, #0]
 8020cde:	f003 0340 	and.w	r3, r3, #64	@ 0x40
 8020ce2:	2b00      	cmp	r3, #0
 8020ce4:	d0f9      	beq.n	8020cda <__usart1_print+0x46>
  }
  //exitCRITICAL();
  // semaphore_unlock(&sem_usart1);
}
 8020ce6:	bf00      	nop
 8020ce8:	bf00      	nop
 8020cea:	3714      	adds	r7, #20
 8020cec:	46bd      	mov	sp, r7
 8020cee:	bc80      	pop	{r7}
 8020cf0:	4770      	bx	lr
 8020cf2:	bf00      	nop
 8020cf4:	40011000 	.word	0x40011000

08020cf8 <Reset_Handler>:
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
 8020cf8:	f7ff fa22 	bl	8020140 <resetHandlerHelper>
    B main
 8020cfc:	f7ff bc46 	b.w	802058c <main>

08020d00 <hang>:
hang:
    B .
 8020d00:	e7fe      	b.n	8020d00 <hang>

08020d02 <Default_Handler>:

.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .
 8020d02:	e7fe      	b.n	8020d02 <Default_Handler>

08020d04 <NMI_Handler>:

.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .
 8020d04:	e7fe      	b.n	8020d04 <NMI_Handler>

08020d06 <DebugMon_Handler>:

.section .text.DebugMon_Handler
.global DebugMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .
 8020d06:	e7fe      	b.n	8020d06 <DebugMon_Handler>

08020d08 <PendSV_Handler>:
.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    cpsid i
 8020d08:	b672      	cpsid	i

    push {lr}
 8020d0a:	b500      	push	{lr}
    bl schedular
 8020d0c:	f7ff fee6 	bl	8020adc <schedular>
    pop {lr}
 8020d10:	f85d eb04 	ldr.w	lr, [sp], #4

    /************************ start saving reg*********************************/
    ldr r0, =RUNNING_PROCESS
 8020d14:	4813      	ldr	r0, [pc, #76]	@ (8020d64 <PendSV_Handler+0x5c>)
    ldr r1, [r0]            // r1 now contain the struct address
 8020d16:	6801      	ldr	r1, [r0, #0]
    

    stmia r1!, {r4-r11}     // r4->r11 stored in the runnging process struct
 8020d18:	e8a1 0ff0 	stmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}

    mrs r0, psp
 8020d1c:	f3ef 8009 	mrs	r0, PSP
    str r0, [r1]
 8020d20:	6008      	str	r0, [r1, #0]
    add r1, #4
 8020d22:	f101 0104 	add.w	r1, r1, #4
    
    mrs r0, msp
 8020d26:	f3ef 8008 	mrs	r0, MSP
    str r0, [r1]
 8020d2a:	6008      	str	r0, [r1, #0]
    add r1, #4
 8020d2c:	f101 0104 	add.w	r1, r1, #4
    
    str lr, [r1]            // important !!! store the exec_return value
 8020d30:	f8c1 e000 	str.w	lr, [r1]
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
 8020d34:	480c      	ldr	r0, [pc, #48]	@ (8020d68 <PendSV_Handler+0x60>)
    ldr r1, [r0]
 8020d36:	6801      	ldr	r1, [r0, #0]
    ldmia r1!, {r4-r11}
 8020d38:	e8b1 0ff0 	ldmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
   

    /* before setting psp, msp, faultmask, basepri -> mask all interrupt
    so that no interrupt can be fired in the middle of setting important regs*/

    ldr r0, [r1]
 8020d3c:	6808      	ldr	r0, [r1, #0]
    msr psp, r0
 8020d3e:	f380 8809 	msr	PSP, r0
    add r1, #4
 8020d42:	f101 0104 	add.w	r1, r1, #4
    
    ldr r0, [r1]
 8020d46:	6808      	ldr	r0, [r1, #0]
    msr msp, r0
 8020d48:	f380 8808 	msr	MSP, r0
    add r1, #4
 8020d4c:	f101 0104 	add.w	r1, r1, #4
    
    ldr lr, [r1]
 8020d50:	f8d1 e000 	ldr.w	lr, [r1]

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
 8020d54:	4804      	ldr	r0, [pc, #16]	@ (8020d68 <PendSV_Handler+0x60>)
    ldr r1, =RUNNING_PROCESS
 8020d56:	4903      	ldr	r1, [pc, #12]	@ (8020d64 <PendSV_Handler+0x5c>)
    ldr r2, [r0]
 8020d58:	6802      	ldr	r2, [r0, #0]
    str r2, [r1]
 8020d5a:	600a      	str	r2, [r1, #0]
    
    dsb
 8020d5c:	f3bf 8f4f 	dsb	sy

    cpsie i
 8020d60:	b662      	cpsie	i

    bx lr
 8020d62:	4770      	bx	lr
    ldr r0, =RUNNING_PROCESS
 8020d64:	20016004 	.word	0x20016004
    ldr r0, =PICKED_PROCESS
 8020d68:	20016008 	.word	0x20016008

08020d6c <SysTick_Handler>:
    caller saved register it will be recovered before returning from the isr*/
    

    /*****************set the PendSV interrupt*********************/
    
    ldr r0, =0xE000ED04      // Address of ICSR register
 8020d6c:	4802      	ldr	r0, [pc, #8]	@ (8020d78 <SysTick_Handler+0xc>)
    ldr r1, =0x10000000      // Bit 28 (PENDSVSET)
 8020d6e:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
    str r1, [r0]             // Set PendSV pending
 8020d72:	6001      	str	r1, [r0, #0]


    bx lr
 8020d74:	4770      	bx	lr
 8020d76:	0000      	.short	0x0000
    ldr r0, =0xE000ED04      // Address of ICSR register
 8020d78:	e000ed04 	.word	0xe000ed04

08020d7c <SVC_Handler>:
.section .text.SVC_Handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler:
    /* r0, r1, r2, r3 stores the arguments of systemcall */
    push {r0, r1, r2, r3}
 8020d7c:	b40f      	push	{r0, r1, r2, r3}

    tst lr, #4
 8020d7e:	f01e 0f04 	tst.w	lr, #4
    ite eq
 8020d82:	bf0c      	ite	eq
    mrseq r0, msp
 8020d84:	f3ef 8008 	mrseq	r0, MSP
    mrsne r0, psp
 8020d88:	f3ef 8009 	mrsne	r0, PSP

    add r0, #24 /* retrieve the old pc that is stacked*/
 8020d8c:	f100 0018 	add.w	r0, r0, #24
    ldr r1, [r0]
 8020d90:	6801      	ldr	r1, [r0, #0]
    sub r1, #2      /*move 2 bytes before to get the scv immidiate*/
 8020d92:	f1a1 0102 	sub.w	r1, r1, #2
    ldrb r0, [r1]   /*r0 now contains the immidiate value*/
 8020d96:	7808      	ldrb	r0, [r1, #0]

    
    ldr r2, =SYSCALL_TABLE_AD
 8020d98:	4a07      	ldr	r2, [pc, #28]	@ (8020db8 <SVC_Handler+0x3c>)
    ldr r1, [r2]            // r1 contains the address of syscall_table
 8020d9a:	6811      	ldr	r1, [r2, #0]
                            // r0 contains the immidate value
    
    mov r3, #4
 8020d9c:	f04f 0304 	mov.w	r3, #4
    mul r0, r3 
 8020da0:	fb03 f000 	mul.w	r0, r3, r0
    add r1, r0 
 8020da4:	4401      	add	r1, r0

    mov r12, r1            // store the address of service function in r12
 8020da6:	468c      	mov	ip, r1
    ldr r12, [r12]
 8020da8:	f8dc c000 	ldr.w	ip, [ip]

    pop {r0, r1, r2, r3}
 8020dac:	bc0f      	pop	{r0, r1, r2, r3}

    push {lr}
 8020dae:	b500      	push	{lr}
    blx r12
 8020db0:	47e0      	blx	ip
    pop {lr}
 8020db2:	f85d eb04 	ldr.w	lr, [sp], #4


    bx lr
 8020db6:	4770      	bx	lr
    ldr r2, =SYSCALL_TABLE_AD
 8020db8:	2001600c 	.word	0x2001600c

08020dbc <BusFault_Handler>:
// r0 -> pc, r1 -> fault type, r2 -> fault in kernel / userproc
.section .text.BusFault_Handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler:
    ldr r0, =0xfffffffd
 8020dbc:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0
 8020dc0:	4586      	cmp	lr, r0
    ittee eq 
 8020dc2:	bf07      	ittee	eq
    mrseq r0, psp
 8020dc4:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8020dc8:	2200      	moveq	r2, #0
    mrsne r0, msp
 8020dca:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8020dce:	2201      	movne	r2, #1

    /* find pc */
    ldr r0, [r0, #24]
 8020dd0:	6980      	ldr	r0, [r0, #24]
    mov r1, BusFault_Identifier
 8020dd2:	f04f 0100 	mov.w	r1, #0
    push {lr}
 8020dd6:	b500      	push	{lr}
    bl fault_handler_helper
 8020dd8:	f7ff fa18 	bl	802020c <fault_handler_helper>
    pop {lr}
 8020ddc:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8020de0:	4770      	bx	lr

08020de2 <MemManage_Handler>:
/***********************MemManage_Handler start************************/
.section .text.MemManage_Handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler:
    ldr r0, =0xfffffffd 
 8020de2:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8020de6:	4586      	cmp	lr, r0

    ittee eq 
 8020de8:	bf07      	ittee	eq
    mrseq r0, psp
 8020dea:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8020dee:	2200      	moveq	r2, #0
    mrsne r0, msp
 8020df0:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8020df4:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8020df6:	6980      	ldr	r0, [r0, #24]
    mov r1, MemManage_Identifier
 8020df8:	f04f 0101 	mov.w	r1, #1
    push {lr}
 8020dfc:	b500      	push	{lr}
    bl fault_handler_helper
 8020dfe:	f7ff fa05 	bl	802020c <fault_handler_helper>
    pop {lr}
 8020e02:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8020e06:	4770      	bx	lr

08020e08 <UsageFault_Handler>:

.section .text.UsageFault_Handler
.global UsageFault_Handler 
.type UsageFault_Handler, %function
UsageFault_Handler:
    ldr r0, =0xfffffffd 
 8020e08:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8020e0c:	4586      	cmp	lr, r0

    ittee eq 
 8020e0e:	bf07      	ittee	eq
    mrseq r0, psp
 8020e10:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8020e14:	2200      	moveq	r2, #0
    mrsne r0, msp
 8020e16:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8020e1a:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8020e1c:	6980      	ldr	r0, [r0, #24]
    mov r1, UsageFault_Identifier
 8020e1e:	f04f 0102 	mov.w	r1, #2
    push {lr}
 8020e22:	b500      	push	{lr}
    bl fault_handler_helper
 8020e24:	f7ff f9f2 	bl	802020c <fault_handler_helper>
    pop {lr}
 8020e28:	f85d eb04 	ldr.w	lr, [sp], #4
    
    bx lr
 8020e2c:	4770      	bx	lr
	...

08020e30 <HardFault_Handler>:
.section .text.HardFault_Handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler:

    ldr r0, =0xfffffffd 
 8020e30:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8020e34:	4586      	cmp	lr, r0
    ite eq 
 8020e36:	bf0c      	ite	eq
    mrseq r0, psp
 8020e38:	f3ef 8009 	mrseq	r0, PSP
    mrsne r0, msp
 8020e3c:	f3ef 8008 	mrsne	r0, MSP
    
    /* find pc */
    ldr r0, [r0, #24]
 8020e40:	6980      	ldr	r0, [r0, #24]
    
    /* after getting the pc, msp can be safely altered !!!*/
    ldr r1, =_estack
 8020e42:	4904      	ldr	r1, [pc, #16]	@ (8020e54 <HardFault_Handler+0x24>)
    msr msp, r1
 8020e44:	f381 8808 	msr	MSP, r1

    push {lr}
 8020e48:	b500      	push	{lr}
    bl HardFault_Handler_helper
 8020e4a:	f7ff fa63 	bl	8020314 <HardFault_Handler_helper>
    pop {lr}
 8020e4e:	f85d eb04 	ldr.w	lr, [sp], #4

    b .
 8020e52:	e7fe      	b.n	8020e52 <HardFault_Handler+0x22>
    ldr r1, =_estack
 8020e54:	20018000 	.word	0x20018000

08020e58 <__asm__set_psp>:

.global __asm__set_psp
.type __asm__set_psp, %function 
__asm__set_psp:
    /* r0 contains the argument*/
    msr psp, r0
 8020e58:	f380 8809 	msr	PSP, r0
    bx lr
 8020e5c:	4770      	bx	lr

08020e5e <__asm__set_msp>:

.global __asm__set_msp
.type __asm__set_msp, %function
__asm__set_msp:
    /* r0 contains the argument*/
    msr msp, r0
 8020e5e:	f380 8808 	msr	MSP, r0
    bx lr
 8020e62:	4770      	bx	lr

Disassembly of section .usertext:

08021270 <main1-0xed90>:
	...

08030000 <main1>:
#include "kernel_api.h"

USER_CODE int main1(void) {
 8030000:	b580      	push	{r7, lr}
 8030002:	af00      	add	r7, sp, #0
  while (1) {

    user_printf("hello from main1.c\n\r", 0x0);
 8030004:	2100      	movs	r1, #0
 8030006:	4806      	ldr	r0, [pc, #24]	@ (8030020 <main1+0x20>)
 8030008:	f000 f8a4 	bl	8030154 <user_printf>
    user_printf("hello from main1.c second time\n\r", 0x0);
 803000c:	2100      	movs	r1, #0
 803000e:	4805      	ldr	r0, [pc, #20]	@ (8030024 <main1+0x24>)
 8030010:	f000 f8a0 	bl	8030154 <user_printf>
    user_printf("hello from main1.c third time\n\r", 0x0);
 8030014:	2100      	movs	r1, #0
 8030016:	4804      	ldr	r0, [pc, #16]	@ (8030028 <main1+0x28>)
 8030018:	f000 f89c 	bl	8030154 <user_printf>
    user_printf("hello from main1.c\n\r", 0x0);
 803001c:	e7f2      	b.n	8030004 <main1+0x4>
 803001e:	bf00      	nop
 8030020:	08021054 	.word	0x08021054
 8030024:	0802106c 	.word	0x0802106c
 8030028:	08021090 	.word	0x08021090

0803002c <main10>:
#include "kernel_api.h"

USER_CODE int main10 (void){
 803002c:	b580      	push	{r7, lr}
 803002e:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main10.c\n\r", 0x0);
 8030030:	2100      	movs	r1, #0
 8030032:	4802      	ldr	r0, [pc, #8]	@ (803003c <main10+0x10>)
 8030034:	f000 f88e 	bl	8030154 <user_printf>
 8030038:	e7fa      	b.n	8030030 <main10+0x4>
 803003a:	bf00      	nop
 803003c:	080210b0 	.word	0x080210b0

08030040 <main11>:
#include "kernel_api.h"

USER_CODE int main11 (void){
 8030040:	b580      	push	{r7, lr}
 8030042:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main11.c\n\r", 0x0);
 8030044:	2100      	movs	r1, #0
 8030046:	4802      	ldr	r0, [pc, #8]	@ (8030050 <main11+0x10>)
 8030048:	f000 f884 	bl	8030154 <user_printf>
 803004c:	e7fa      	b.n	8030044 <main11+0x4>
 803004e:	bf00      	nop
 8030050:	080210d0 	.word	0x080210d0

08030054 <main12>:
#include "kernel_api.h"

USER_CODE int main12 (void){
 8030054:	b580      	push	{r7, lr}
 8030056:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main12.c\n\r", 0x0);
 8030058:	2100      	movs	r1, #0
 803005a:	4802      	ldr	r0, [pc, #8]	@ (8030064 <main12+0x10>)
 803005c:	f000 f87a 	bl	8030154 <user_printf>
 8030060:	e7fa      	b.n	8030058 <main12+0x4>
 8030062:	bf00      	nop
 8030064:	080210f0 	.word	0x080210f0

08030068 <main13>:
#include "kernel_api.h"

USER_CODE int main13 (void){
 8030068:	b580      	push	{r7, lr}
 803006a:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main13.c\n\r", 0x0);
 803006c:	2100      	movs	r1, #0
 803006e:	4802      	ldr	r0, [pc, #8]	@ (8030078 <main13+0x10>)
 8030070:	f000 f870 	bl	8030154 <user_printf>
 8030074:	e7fa      	b.n	803006c <main13+0x4>
 8030076:	bf00      	nop
 8030078:	08021110 	.word	0x08021110

0803007c <main14>:
#include "kernel_api.h"

USER_CODE int main14 (void){
 803007c:	b580      	push	{r7, lr}
 803007e:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main14.c\n\r", 0x0);
 8030080:	2100      	movs	r1, #0
 8030082:	4802      	ldr	r0, [pc, #8]	@ (803008c <main14+0x10>)
 8030084:	f000 f866 	bl	8030154 <user_printf>
 8030088:	e7fa      	b.n	8030080 <main14+0x4>
 803008a:	bf00      	nop
 803008c:	08021130 	.word	0x08021130

08030090 <main15>:
#include "kernel_api.h"

USER_CODE int main15 (void){
 8030090:	b580      	push	{r7, lr}
 8030092:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main15.c\n\r", 0x0);
 8030094:	2100      	movs	r1, #0
 8030096:	4802      	ldr	r0, [pc, #8]	@ (80300a0 <main15+0x10>)
 8030098:	f000 f85c 	bl	8030154 <user_printf>
 803009c:	e7fa      	b.n	8030094 <main15+0x4>
 803009e:	bf00      	nop
 80300a0:	08021150 	.word	0x08021150

080300a4 <main2>:
#include "kernel_api.h"

USER_CODE int main2(void) {
 80300a4:	b580      	push	{r7, lr}
 80300a6:	af00      	add	r7, sp, #0

  while (1) {
    user_printf("((((((((((hello from main2.c\n\r", 0x0);
 80300a8:	2100      	movs	r1, #0
 80300aa:	4802      	ldr	r0, [pc, #8]	@ (80300b4 <main2+0x10>)
 80300ac:	f000 f852 	bl	8030154 <user_printf>
 80300b0:	e7fa      	b.n	80300a8 <main2+0x4>
 80300b2:	bf00      	nop
 80300b4:	08021170 	.word	0x08021170

080300b8 <main3>:
#include "kernel_api.h"

USER_CODE int main3 (void){
 80300b8:	b580      	push	{r7, lr}
 80300ba:	af00      	add	r7, sp, #0
    while (1){
        user_printf (">>>>>>>>>>hello from main3.c\n\r", 0x0);
 80300bc:	2100      	movs	r1, #0
 80300be:	4802      	ldr	r0, [pc, #8]	@ (80300c8 <main3+0x10>)
 80300c0:	f000 f848 	bl	8030154 <user_printf>
 80300c4:	e7fa      	b.n	80300bc <main3+0x4>
 80300c6:	bf00      	nop
 80300c8:	08021190 	.word	0x08021190

080300cc <main4>:
#include "kernel_api.h"
USER_CODE int main4 (void){
 80300cc:	b580      	push	{r7, lr}
 80300ce:	af00      	add	r7, sp, #0

    while (1)
    user_printf("++++++++++hello from main4.c\n\r", 0x0);
 80300d0:	2100      	movs	r1, #0
 80300d2:	4802      	ldr	r0, [pc, #8]	@ (80300dc <main4+0x10>)
 80300d4:	f000 f83e 	bl	8030154 <user_printf>
 80300d8:	e7fa      	b.n	80300d0 <main4+0x4>
 80300da:	bf00      	nop
 80300dc:	080211b0 	.word	0x080211b0

080300e0 <main5>:
#include "kernel_api.h"

USER_CODE int main5 (void){
 80300e0:	b580      	push	{r7, lr}
 80300e2:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main5.c\n\r", 0x0);
 80300e4:	2100      	movs	r1, #0
 80300e6:	4802      	ldr	r0, [pc, #8]	@ (80300f0 <main5+0x10>)
 80300e8:	f000 f834 	bl	8030154 <user_printf>
 80300ec:	e7fa      	b.n	80300e4 <main5+0x4>
 80300ee:	bf00      	nop
 80300f0:	080211d0 	.word	0x080211d0

080300f4 <main6>:
#include "kernel_api.h"

USER_CODE int main6 (void){
 80300f4:	b580      	push	{r7, lr}
 80300f6:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("@@@@@@@@@@hello from main6.c\n\r", 0x0);
 80300f8:	2100      	movs	r1, #0
 80300fa:	4802      	ldr	r0, [pc, #8]	@ (8030104 <main6+0x10>)
 80300fc:	f000 f82a 	bl	8030154 <user_printf>
 8030100:	e7fa      	b.n	80300f8 <main6+0x4>
 8030102:	bf00      	nop
 8030104:	080211f0 	.word	0x080211f0

08030108 <main7>:
#include "kernel_api.h"

USER_CODE int main7 (void){
 8030108:	b580      	push	{r7, lr}
 803010a:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("@@@@@@@@@@hello from main5.c\n\r", 0x0);
 803010c:	2100      	movs	r1, #0
 803010e:	4802      	ldr	r0, [pc, #8]	@ (8030118 <main7+0x10>)
 8030110:	f000 f820 	bl	8030154 <user_printf>
 8030114:	e7fa      	b.n	803010c <main7+0x4>
 8030116:	bf00      	nop
 8030118:	08021210 	.word	0x08021210

0803011c <main8>:
#include "kernel_api.h"

USER_CODE int main8 (void){
 803011c:	b580      	push	{r7, lr}
 803011e:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main8.c\n\r", 0x0);
 8030120:	2100      	movs	r1, #0
 8030122:	4802      	ldr	r0, [pc, #8]	@ (803012c <main8+0x10>)
 8030124:	f000 f816 	bl	8030154 <user_printf>
 8030128:	e7fa      	b.n	8030120 <main8+0x4>
 803012a:	bf00      	nop
 803012c:	08021230 	.word	0x08021230

08030130 <main9>:
#include "kernel_api.h"

USER_CODE int main9 (void){
 8030130:	b580      	push	{r7, lr}
 8030132:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main9.c\n\r", 0x0);
 8030134:	2100      	movs	r1, #0
 8030136:	4802      	ldr	r0, [pc, #8]	@ (8030140 <main9+0x10>)
 8030138:	f000 f80c 	bl	8030154 <user_printf>
 803013c:	e7fa      	b.n	8030134 <main9+0x4>
 803013e:	bf00      	nop
 8030140:	08021250 	.word	0x08021250

08030144 <__asm__launch_main1>:
 8030144:	f04f 0003 	mov.w	r0, #3
 8030148:	f380 8814 	msr	CONTROL, r0
 803014c:	f3bf 8f6f 	isb	sy
 8030150:	f7ff ff56 	bl	8030000 <main1>

08030154 <user_printf>:
 8030154:	df00      	svc	0
 8030156:	4770      	bx	lr

build/firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

08020140 <resetHandlerHelper>:
extern uint32_t _euserdata;
extern uint32_t _suserbss;
extern uint32_t _euserbss;


void resetHandlerHelper(void) {
 8020140:	b480      	push	{r7}
 8020142:	b089      	sub	sp, #36	@ 0x24
 8020144:	af00      	add	r7, sp, #0
  uint32_t dest = (uint32_t)&_sdata;
 8020146:	4b27      	ldr	r3, [pc, #156]	@ (80201e4 <resetHandlerHelper+0xa4>)
 8020148:	60bb      	str	r3, [r7, #8]
  uint32_t dest_end = (uint32_t)&_edata;
 802014a:	4b27      	ldr	r3, [pc, #156]	@ (80201e8 <resetHandlerHelper+0xa8>)
 802014c:	607b      	str	r3, [r7, #4]
  uint32_t src = (uint32_t)&_sidata;
 802014e:	4b27      	ldr	r3, [pc, #156]	@ (80201ec <resetHandlerHelper+0xac>)
 8020150:	61fb      	str	r3, [r7, #28]

  /*copy data from data section to ram
   * init .bss section*/
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8020152:	68bb      	ldr	r3, [r7, #8]
 8020154:	61bb      	str	r3, [r7, #24]
 8020156:	e009      	b.n	802016c <resetHandlerHelper+0x2c>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 8020158:	69fa      	ldr	r2, [r7, #28]
 802015a:	69bb      	ldr	r3, [r7, #24]
 802015c:	6812      	ldr	r2, [r2, #0]
 802015e:	601a      	str	r2, [r3, #0]
    src += 4;
 8020160:	69fb      	ldr	r3, [r7, #28]
 8020162:	3304      	adds	r3, #4
 8020164:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8020166:	69bb      	ldr	r3, [r7, #24]
 8020168:	3304      	adds	r3, #4
 802016a:	61bb      	str	r3, [r7, #24]
 802016c:	69ba      	ldr	r2, [r7, #24]
 802016e:	687b      	ldr	r3, [r7, #4]
 8020170:	429a      	cmp	r2, r3
 8020172:	d9f1      	bls.n	8020158 <resetHandlerHelper+0x18>
  }

  dest = (uint32_t)&_suserdata;
 8020174:	4b1e      	ldr	r3, [pc, #120]	@ (80201f0 <resetHandlerHelper+0xb0>)
 8020176:	60bb      	str	r3, [r7, #8]
  dest_end = (uint32_t)&_euserdata;
 8020178:	4b1e      	ldr	r3, [pc, #120]	@ (80201f4 <resetHandlerHelper+0xb4>)
 802017a:	607b      	str	r3, [r7, #4]
  src = (uint32_t)&_siuserdata;
 802017c:	4b1e      	ldr	r3, [pc, #120]	@ (80201f8 <resetHandlerHelper+0xb8>)
 802017e:	61fb      	str	r3, [r7, #28]

  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8020180:	68bb      	ldr	r3, [r7, #8]
 8020182:	617b      	str	r3, [r7, #20]
 8020184:	e009      	b.n	802019a <resetHandlerHelper+0x5a>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 8020186:	69fa      	ldr	r2, [r7, #28]
 8020188:	697b      	ldr	r3, [r7, #20]
 802018a:	6812      	ldr	r2, [r2, #0]
 802018c:	601a      	str	r2, [r3, #0]
    src += 4;
 802018e:	69fb      	ldr	r3, [r7, #28]
 8020190:	3304      	adds	r3, #4
 8020192:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 8020194:	697b      	ldr	r3, [r7, #20]
 8020196:	3304      	adds	r3, #4
 8020198:	617b      	str	r3, [r7, #20]
 802019a:	697a      	ldr	r2, [r7, #20]
 802019c:	687b      	ldr	r3, [r7, #4]
 802019e:	429a      	cmp	r2, r3
 80201a0:	d9f1      	bls.n	8020186 <resetHandlerHelper+0x46>
  }

  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 80201a2:	4b16      	ldr	r3, [pc, #88]	@ (80201fc <resetHandlerHelper+0xbc>)
 80201a4:	613b      	str	r3, [r7, #16]
 80201a6:	e005      	b.n	80201b4 <resetHandlerHelper+0x74>
    *(uint32_t *)(i) = 0;
 80201a8:	693b      	ldr	r3, [r7, #16]
 80201aa:	2200      	movs	r2, #0
 80201ac:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 80201ae:	693b      	ldr	r3, [r7, #16]
 80201b0:	3304      	adds	r3, #4
 80201b2:	613b      	str	r3, [r7, #16]
 80201b4:	4a12      	ldr	r2, [pc, #72]	@ (8020200 <resetHandlerHelper+0xc0>)
 80201b6:	693b      	ldr	r3, [r7, #16]
 80201b8:	4293      	cmp	r3, r2
 80201ba:	d9f5      	bls.n	80201a8 <resetHandlerHelper+0x68>
  }
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 80201bc:	4b11      	ldr	r3, [pc, #68]	@ (8020204 <resetHandlerHelper+0xc4>)
 80201be:	60fb      	str	r3, [r7, #12]
 80201c0:	e005      	b.n	80201ce <resetHandlerHelper+0x8e>
    *(uint32_t *)(i) = 0;
 80201c2:	68fb      	ldr	r3, [r7, #12]
 80201c4:	2200      	movs	r2, #0
 80201c6:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 80201c8:	68fb      	ldr	r3, [r7, #12]
 80201ca:	3304      	adds	r3, #4
 80201cc:	60fb      	str	r3, [r7, #12]
 80201ce:	4a0e      	ldr	r2, [pc, #56]	@ (8020208 <resetHandlerHelper+0xc8>)
 80201d0:	68fb      	ldr	r3, [r7, #12]
 80201d2:	4293      	cmp	r3, r2
 80201d4:	d9f5      	bls.n	80201c2 <resetHandlerHelper+0x82>
  }
}
 80201d6:	bf00      	nop
 80201d8:	bf00      	nop
 80201da:	3724      	adds	r7, #36	@ 0x24
 80201dc:	46bd      	mov	sp, r7
 80201de:	bc80      	pop	{r7}
 80201e0:	4770      	bx	lr
 80201e2:	bf00      	nop
 80201e4:	20000000 	.word	0x20000000
 80201e8:	20000001 	.word	0x20000001
 80201ec:	0802126f 	.word	0x0802126f
 80201f0:	20004000 	.word	0x20004000
 80201f4:	20004000 	.word	0x20004000
 80201f8:	08030158 	.word	0x08030158
 80201fc:	20000004 	.word	0x20000004
 8020200:	20000434 	.word	0x20000434
 8020204:	20004000 	.word	0x20004000
 8020208:	20004000 	.word	0x20004000

0802020c <fault_handler_helper>:

void fault_handler_helper(uint32_t pc, uint8_t fault_identifier,
                          uint32_t fault_place) {
 802020c:	b580      	push	{r7, lr}
 802020e:	b086      	sub	sp, #24
 8020210:	af00      	add	r7, sp, #0
 8020212:	60f8      	str	r0, [r7, #12]
 8020214:	460b      	mov	r3, r1
 8020216:	607a      	str	r2, [r7, #4]
 8020218:	72fb      	strb	r3, [r7, #11]

  /* bus fault diagnosis */
  if (fault_identifier == BUSFAULT_IDENTIFIER) {
 802021a:	7afb      	ldrb	r3, [r7, #11]
 802021c:	2b00      	cmp	r3, #0
 802021e:	d10e      	bne.n	802023e <fault_handler_helper+0x32>
    printf("busdault !!\n\r", 0x0);
 8020220:	2100      	movs	r1, #0
 8020222:	482d      	ldr	r0, [pc, #180]	@ (80202d8 <fault_handler_helper+0xcc>)
 8020224:	f000 f90c 	bl	8020440 <printf>
    if (SCB->CFSR & SCB_CFSR_BFARVALID_Msk)
 8020228:	4b2c      	ldr	r3, [pc, #176]	@ (80202dc <fault_handler_helper+0xd0>)
 802022a:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 802022c:	f403 4300 	and.w	r3, r3, #32768	@ 0x8000
 8020230:	2b00      	cmp	r3, #0
 8020232:	d01f      	beq.n	8020274 <fault_handler_helper+0x68>
      printf("busfault address -> %\n\r", (uint32_t)(&SCB->BFAR));
 8020234:	492a      	ldr	r1, [pc, #168]	@ (80202e0 <fault_handler_helper+0xd4>)
 8020236:	482b      	ldr	r0, [pc, #172]	@ (80202e4 <fault_handler_helper+0xd8>)
 8020238:	f000 f902 	bl	8020440 <printf>
 802023c:	e01a      	b.n	8020274 <fault_handler_helper+0x68>
  }

  /* MemManagement diagnosis */
  else if (fault_identifier == MEMMANAGE_IDENTIFIER) {
 802023e:	7afb      	ldrb	r3, [r7, #11]
 8020240:	2b01      	cmp	r3, #1
 8020242:	d110      	bne.n	8020266 <fault_handler_helper+0x5a>
    printf("MemManagement exception !!\n\r", 0x0);
 8020244:	2100      	movs	r1, #0
 8020246:	4828      	ldr	r0, [pc, #160]	@ (80202e8 <fault_handler_helper+0xdc>)
 8020248:	f000 f8fa 	bl	8020440 <printf>
    if (SCB->CFSR & SCB_CFSR_MMARVALID_Msk)
 802024c:	4b23      	ldr	r3, [pc, #140]	@ (80202dc <fault_handler_helper+0xd0>)
 802024e:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 8020250:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8020254:	2b00      	cmp	r3, #0
 8020256:	d00d      	beq.n	8020274 <fault_handler_helper+0x68>
      printf("address caused MemManage Fault -> %\n\r", SCB->MMFAR);
 8020258:	4b20      	ldr	r3, [pc, #128]	@ (80202dc <fault_handler_helper+0xd0>)
 802025a:	6b5b      	ldr	r3, [r3, #52]	@ 0x34
 802025c:	4619      	mov	r1, r3
 802025e:	4823      	ldr	r0, [pc, #140]	@ (80202ec <fault_handler_helper+0xe0>)
 8020260:	f000 f8ee 	bl	8020440 <printf>
 8020264:	e006      	b.n	8020274 <fault_handler_helper+0x68>
  }

  /* UsageFault diagnosis */
  else if (fault_identifier == USAGEFAULT_IDENTIFIER) {
 8020266:	7afb      	ldrb	r3, [r7, #11]
 8020268:	2b02      	cmp	r3, #2
 802026a:	d130      	bne.n	80202ce <fault_handler_helper+0xc2>
    printf("UsageFault !!\n\r", 0x0);
 802026c:	2100      	movs	r1, #0
 802026e:	4820      	ldr	r0, [pc, #128]	@ (80202f0 <fault_handler_helper+0xe4>)
 8020270:	f000 f8e6 	bl	8020440 <printf>
    /* there is no address access that can cause USAGE FAULT */
  } else {
    return;
  }

  uint32_t instruction = *(uint32_t *)(pc);
 8020274:	68fb      	ldr	r3, [r7, #12]
 8020276:	681b      	ldr	r3, [r3, #0]
 8020278:	617b      	str	r3, [r7, #20]

  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 802027a:	491e      	ldr	r1, [pc, #120]	@ (80202f4 <fault_handler_helper+0xe8>)
 802027c:	481e      	ldr	r0, [pc, #120]	@ (80202f8 <fault_handler_helper+0xec>)
 802027e:	f000 f8df 	bl	8020440 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("PC -> %\n\r", (uint32_t)&pc);
 8020282:	f107 030c 	add.w	r3, r7, #12
 8020286:	4619      	mov	r1, r3
 8020288:	481c      	ldr	r0, [pc, #112]	@ (80202fc <fault_handler_helper+0xf0>)
 802028a:	f000 f8d9 	bl	8020440 <printf>
  printf("instruction that caused the fault-> %\n\r", (uint32_t)(&instruction));
 802028e:	f107 0314 	add.w	r3, r7, #20
 8020292:	4619      	mov	r1, r3
 8020294:	481a      	ldr	r0, [pc, #104]	@ (8020300 <fault_handler_helper+0xf4>)
 8020296:	f000 f8d3 	bl	8020440 <printf>

  /* KERNEL PANIC if fault in kernel
   * PROCESSES TERMINATION if fault in user process */

  if (fault_place == FAULT_IN_KERNEL) {
 802029a:	687b      	ldr	r3, [r7, #4]
 802029c:	2b01      	cmp	r3, #1
 802029e:	d104      	bne.n	80202aa <fault_handler_helper+0x9e>
    printf("\n\n\rKERNEL PANIC......\n\n\r", 0x0);
 80202a0:	2100      	movs	r1, #0
 80202a2:	4818      	ldr	r0, [pc, #96]	@ (8020304 <fault_handler_helper+0xf8>)
 80202a4:	f000 f8cc 	bl	8020440 <printf>
    while (1)
 80202a8:	e7fe      	b.n	80202a8 <fault_handler_helper+0x9c>
      ;
  }
  /* change state from running to suspend and set pendsv */
  else if (fault_place == FAULT_IN_USERPROC) {
 80202aa:	687b      	ldr	r3, [r7, #4]
 80202ac:	2b00      	cmp	r3, #0
 80202ae:	d10f      	bne.n	80202d0 <fault_handler_helper+0xc4>
    printf("terminating user process...\n\r", 0x0);
 80202b0:	2100      	movs	r1, #0
 80202b2:	4815      	ldr	r0, [pc, #84]	@ (8020308 <fault_handler_helper+0xfc>)
 80202b4:	f000 f8c4 	bl	8020440 <printf>
    printf("reason -> fault", 0x0);
 80202b8:	2100      	movs	r1, #0
 80202ba:	4814      	ldr	r0, [pc, #80]	@ (802030c <fault_handler_helper+0x100>)
 80202bc:	f000 f8c0 	bl	8020440 <printf>

    (*(user_process_t **)(RUNNING_PROCESS_AD))->state = SUSPEND_STATE;
 80202c0:	4b13      	ldr	r3, [pc, #76]	@ (8020310 <fault_handler_helper+0x104>)
 80202c2:	681b      	ldr	r3, [r3, #0]
 80202c4:	2202      	movs	r2, #2
 80202c6:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* trigger context switching*/
    PendSV_Handler();
 80202c8:	f000 fd1e 	bl	8020d08 <PendSV_Handler>
 80202cc:	e000      	b.n	80202d0 <fault_handler_helper+0xc4>
    return;
 80202ce:	bf00      	nop
  }
}
 80202d0:	3718      	adds	r7, #24
 80202d2:	46bd      	mov	sp, r7
 80202d4:	bd80      	pop	{r7, pc}
 80202d6:	bf00      	nop
 80202d8:	08020e64 	.word	0x08020e64
 80202dc:	e000ed00 	.word	0xe000ed00
 80202e0:	e000ed38 	.word	0xe000ed38
 80202e4:	08020e74 	.word	0x08020e74
 80202e8:	08020e8c 	.word	0x08020e8c
 80202ec:	08020eac 	.word	0x08020eac
 80202f0:	08020ed4 	.word	0x08020ed4
 80202f4:	e000ed28 	.word	0xe000ed28
 80202f8:	08020ee4 	.word	0x08020ee4
 80202fc:	08020f14 	.word	0x08020f14
 8020300:	08020f20 	.word	0x08020f20
 8020304:	08020f48 	.word	0x08020f48
 8020308:	08020f64 	.word	0x08020f64
 802030c:	08020f84 	.word	0x08020f84
 8020310:	20016004 	.word	0x20016004

08020314 <HardFault_Handler_helper>:

void HardFault_Handler_helper(uint32_t pc) {
 8020314:	b580      	push	{r7, lr}
 8020316:	b084      	sub	sp, #16
 8020318:	af00      	add	r7, sp, #0
 802031a:	6078      	str	r0, [r7, #4]

  uint32_t instruction = *(uint32_t *)(pc);
 802031c:	687b      	ldr	r3, [r7, #4]
 802031e:	681b      	ldr	r3, [r3, #0]
 8020320:	60fb      	str	r3, [r7, #12]

  printf("HARD_FAULT !!!\n\r", 0x0);
 8020322:	2100      	movs	r1, #0
 8020324:	480c      	ldr	r0, [pc, #48]	@ (8020358 <HardFault_Handler_helper+0x44>)
 8020326:	f000 f88b 	bl	8020440 <printf>
  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 802032a:	490c      	ldr	r1, [pc, #48]	@ (802035c <HardFault_Handler_helper+0x48>)
 802032c:	480c      	ldr	r0, [pc, #48]	@ (8020360 <HardFault_Handler_helper+0x4c>)
 802032e:	f000 f887 	bl	8020440 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
 8020332:	490c      	ldr	r1, [pc, #48]	@ (8020364 <HardFault_Handler_helper+0x50>)
 8020334:	480c      	ldr	r0, [pc, #48]	@ (8020368 <HardFault_Handler_helper+0x54>)
 8020336:	f000 f883 	bl	8020440 <printf>
  printf("PC -> %\n\r", (uint32_t)(&pc));
 802033a:	1d3b      	adds	r3, r7, #4
 802033c:	4619      	mov	r1, r3
 802033e:	480b      	ldr	r0, [pc, #44]	@ (802036c <HardFault_Handler_helper+0x58>)
 8020340:	f000 f87e 	bl	8020440 <printf>
  printf("instruction that triggered HardFault -> %\n\r",
 8020344:	f107 030c 	add.w	r3, r7, #12
 8020348:	4619      	mov	r1, r3
 802034a:	4809      	ldr	r0, [pc, #36]	@ (8020370 <HardFault_Handler_helper+0x5c>)
 802034c:	f000 f878 	bl	8020440 <printf>
         (uint32_t)&instruction);
}
 8020350:	bf00      	nop
 8020352:	3710      	adds	r7, #16
 8020354:	46bd      	mov	sp, r7
 8020356:	bd80      	pop	{r7, pc}
 8020358:	08020f94 	.word	0x08020f94
 802035c:	e000ed28 	.word	0xe000ed28
 8020360:	08020ee4 	.word	0x08020ee4
 8020364:	e000ed2c 	.word	0xe000ed2c
 8020368:	08020fa8 	.word	0x08020fa8
 802036c:	08020f14 	.word	0x08020f14
 8020370:	08020fcc 	.word	0x08020fcc

08020374 <enterCRITICAL>:
#include "core.h"
#include "usart.h"
#include <stdint.h>

void enterCRITICAL(void) { __disable_irq(); }
 8020374:	b480      	push	{r7}
 8020376:	af00      	add	r7, sp, #0
  \details Disables IRQ interrupts by setting special-purpose register PRIMASK.
           Can only be executed in Privileged modes.
 */
__STATIC_FORCEINLINE void __disable_irq(void)
{
  __ASM volatile ("cpsid i" : : : "memory");
 8020378:	b672      	cpsid	i
}
 802037a:	bf00      	nop
 802037c:	bf00      	nop
 802037e:	46bd      	mov	sp, r7
 8020380:	bc80      	pop	{r7}
 8020382:	4770      	bx	lr

08020384 <exitCRITICAL>:

void exitCRITICAL(void) { __enable_irq(); }
 8020384:	b480      	push	{r7}
 8020386:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsie i" : : : "memory");
 8020388:	b662      	cpsie	i
}
 802038a:	bf00      	nop
 802038c:	bf00      	nop
 802038e:	46bd      	mov	sp, r7
 8020390:	bc80      	pop	{r7}
 8020392:	4770      	bx	lr

08020394 <_strlen>:

uint32_t _strlen(const char *msg) {
 8020394:	b480      	push	{r7}
 8020396:	b085      	sub	sp, #20
 8020398:	af00      	add	r7, sp, #0
 802039a:	6078      	str	r0, [r7, #4]

  int i = 0;
 802039c:	2300      	movs	r3, #0
 802039e:	60fb      	str	r3, [r7, #12]
  while (msg[i++] != '\0')
 80203a0:	bf00      	nop
 80203a2:	68fb      	ldr	r3, [r7, #12]
 80203a4:	1c5a      	adds	r2, r3, #1
 80203a6:	60fa      	str	r2, [r7, #12]
 80203a8:	461a      	mov	r2, r3
 80203aa:	687b      	ldr	r3, [r7, #4]
 80203ac:	4413      	add	r3, r2
 80203ae:	781b      	ldrb	r3, [r3, #0]
 80203b0:	2b00      	cmp	r3, #0
 80203b2:	d1f6      	bne.n	80203a2 <_strlen+0xe>
    ;
  return i - 1;
 80203b4:	68fb      	ldr	r3, [r7, #12]
 80203b6:	3b01      	subs	r3, #1
}
 80203b8:	4618      	mov	r0, r3
 80203ba:	3714      	adds	r7, #20
 80203bc:	46bd      	mov	sp, r7
 80203be:	bc80      	pop	{r7}
 80203c0:	4770      	bx	lr

080203c2 <hex_str>:

char *hex_str(uint32_t value, char *out) {
 80203c2:	b4b0      	push	{r4, r5, r7}
 80203c4:	b08b      	sub	sp, #44	@ 0x2c
 80203c6:	af00      	add	r7, sp, #0
 80203c8:	6078      	str	r0, [r7, #4]
 80203ca:	6039      	str	r1, [r7, #0]

  char hex_char[] = "0123456789abcdef";
 80203cc:	4b1b      	ldr	r3, [pc, #108]	@ (802043c <hex_str+0x7a>)
 80203ce:	f107 0408 	add.w	r4, r7, #8
 80203d2:	461d      	mov	r5, r3
 80203d4:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
 80203d6:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 80203d8:	682b      	ldr	r3, [r5, #0]
 80203da:	7023      	strb	r3, [r4, #0]
  out[0] = '0';
 80203dc:	683b      	ldr	r3, [r7, #0]
 80203de:	2230      	movs	r2, #48	@ 0x30
 80203e0:	701a      	strb	r2, [r3, #0]
  out[1] = 'x';
 80203e2:	683b      	ldr	r3, [r7, #0]
 80203e4:	3301      	adds	r3, #1
 80203e6:	2278      	movs	r2, #120	@ 0x78
 80203e8:	701a      	strb	r2, [r3, #0]

  for (int i = 0; i < 8; i++) {
 80203ea:	2300      	movs	r3, #0
 80203ec:	627b      	str	r3, [r7, #36]	@ 0x24
 80203ee:	e01c      	b.n	802042a <hex_str+0x68>
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
 80203f0:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80203f2:	009b      	lsls	r3, r3, #2
 80203f4:	220f      	movs	r2, #15
 80203f6:	fa02 f303 	lsl.w	r3, r2, r3
 80203fa:	461a      	mov	r2, r3
 80203fc:	687b      	ldr	r3, [r7, #4]
 80203fe:	401a      	ands	r2, r3
 8020400:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8020402:	009b      	lsls	r3, r3, #2
 8020404:	fa22 f303 	lsr.w	r3, r2, r3
 8020408:	623b      	str	r3, [r7, #32]
    int j = 9 - i;
 802040a:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 802040c:	f1c3 0309 	rsb	r3, r3, #9
 8020410:	61fb      	str	r3, [r7, #28]
    out[j] = hex_char[ind];
 8020412:	69fb      	ldr	r3, [r7, #28]
 8020414:	683a      	ldr	r2, [r7, #0]
 8020416:	4413      	add	r3, r2
 8020418:	f107 0108 	add.w	r1, r7, #8
 802041c:	6a3a      	ldr	r2, [r7, #32]
 802041e:	440a      	add	r2, r1
 8020420:	7812      	ldrb	r2, [r2, #0]
 8020422:	701a      	strb	r2, [r3, #0]
  for (int i = 0; i < 8; i++) {
 8020424:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8020426:	3301      	adds	r3, #1
 8020428:	627b      	str	r3, [r7, #36]	@ 0x24
 802042a:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 802042c:	2b07      	cmp	r3, #7
 802042e:	dddf      	ble.n	80203f0 <hex_str+0x2e>
  }
}
 8020430:	bf00      	nop
 8020432:	4618      	mov	r0, r3
 8020434:	372c      	adds	r7, #44	@ 0x2c
 8020436:	46bd      	mov	sp, r7
 8020438:	bcb0      	pop	{r4, r5, r7}
 802043a:	4770      	bx	lr
 802043c:	08020ff8 	.word	0x08020ff8

08020440 <printf>:

void printf(const char *msg, uint32_t address) {
 8020440:	b580      	push	{r7, lr}
 8020442:	b0a4      	sub	sp, #144	@ 0x90
 8020444:	af00      	add	r7, sp, #0
 8020446:	6078      	str	r0, [r7, #4]
 8020448:	6039      	str	r1, [r7, #0]

  uint32_t value = *((uint32_t *)address);
 802044a:	683b      	ldr	r3, [r7, #0]
 802044c:	681b      	ldr	r3, [r3, #0]
 802044e:	67fb      	str	r3, [r7, #124]	@ 0x7c
  uint32_t msg_size = _strlen(msg);
 8020450:	6878      	ldr	r0, [r7, #4]
 8020452:	f7ff ff9f 	bl	8020394 <_strlen>
 8020456:	67b8      	str	r0, [r7, #120]	@ 0x78

  if (msg_size + 9 > MAX_STR_SIZE) {
 8020458:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 802045a:	3309      	adds	r3, #9
 802045c:	2b64      	cmp	r3, #100	@ 0x64
 802045e:	d904      	bls.n	802046a <printf+0x2a>
    __usart1_print("too large error message !!\n\r", MAX_STR_SIZE);
 8020460:	2164      	movs	r1, #100	@ 0x64
 8020462:	483d      	ldr	r0, [pc, #244]	@ (8020558 <printf+0x118>)
 8020464:	f000 fc16 	bl	8020c94 <__usart1_print>
 8020468:	e072      	b.n	8020550 <printf+0x110>
    return;
  }
  char hex[10];
  char __msg[MAX_STR_SIZE];

  uint32_t i = 0;
 802046a:	2300      	movs	r3, #0
 802046c:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
  int p = 0, q = 0;
 8020470:	2300      	movs	r3, #0
 8020472:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
 8020476:	2300      	movs	r3, #0
 8020478:	f8c7 3084 	str.w	r3, [r7, #132]	@ 0x84
  bool single_sub = false;
 802047c:	2300      	movs	r3, #0
 802047e:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83

  for (; i < msg_size; i++) {
 8020482:	e04d      	b.n	8020520 <printf+0xe0>

    if (msg[i] == '%' && !single_sub) {
 8020484:	687a      	ldr	r2, [r7, #4]
 8020486:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 802048a:	4413      	add	r3, r2
 802048c:	781b      	ldrb	r3, [r3, #0]
 802048e:	2b25      	cmp	r3, #37	@ 0x25
 8020490:	d12f      	bne.n	80204f2 <printf+0xb2>
 8020492:	f897 3083 	ldrb.w	r3, [r7, #131]	@ 0x83
 8020496:	f083 0301 	eor.w	r3, r3, #1
 802049a:	b2db      	uxtb	r3, r3
 802049c:	2b00      	cmp	r3, #0
 802049e:	d028      	beq.n	80204f2 <printf+0xb2>
      hex_str(value, hex);
 80204a0:	f107 036c 	add.w	r3, r7, #108	@ 0x6c
 80204a4:	4619      	mov	r1, r3
 80204a6:	6ff8      	ldr	r0, [r7, #124]	@ 0x7c
 80204a8:	f7ff ff8b 	bl	80203c2 <hex_str>

      while (q - p < 10) {
 80204ac:	e011      	b.n	80204d2 <printf+0x92>
        __msg[q++] = hex[q - p];
 80204ae:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 80204b2:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 80204b6:	1ad2      	subs	r2, r2, r3
 80204b8:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 80204bc:	1c59      	adds	r1, r3, #1
 80204be:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 80204c2:	3290      	adds	r2, #144	@ 0x90
 80204c4:	443a      	add	r2, r7
 80204c6:	f812 2c24 	ldrb.w	r2, [r2, #-36]
 80204ca:	3390      	adds	r3, #144	@ 0x90
 80204cc:	443b      	add	r3, r7
 80204ce:	f803 2c88 	strb.w	r2, [r3, #-136]
      while (q - p < 10) {
 80204d2:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 80204d6:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 80204da:	1ad3      	subs	r3, r2, r3
 80204dc:	2b09      	cmp	r3, #9
 80204de:	dde6      	ble.n	80204ae <printf+0x6e>
      }
      p++;
 80204e0:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 80204e4:	3301      	adds	r3, #1
 80204e6:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
      single_sub = true;
 80204ea:	2301      	movs	r3, #1
 80204ec:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83
 80204f0:	e011      	b.n	8020516 <printf+0xd6>
    } else
      __msg[q++] = msg[p++];
 80204f2:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 80204f6:	1c5a      	adds	r2, r3, #1
 80204f8:	f8c7 2088 	str.w	r2, [r7, #136]	@ 0x88
 80204fc:	461a      	mov	r2, r3
 80204fe:	687b      	ldr	r3, [r7, #4]
 8020500:	441a      	add	r2, r3
 8020502:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 8020506:	1c59      	adds	r1, r3, #1
 8020508:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 802050c:	7812      	ldrb	r2, [r2, #0]
 802050e:	3390      	adds	r3, #144	@ 0x90
 8020510:	443b      	add	r3, r7
 8020512:	f803 2c88 	strb.w	r2, [r3, #-136]
  for (; i < msg_size; i++) {
 8020516:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 802051a:	3301      	adds	r3, #1
 802051c:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
 8020520:	f8d7 208c 	ldr.w	r2, [r7, #140]	@ 0x8c
 8020524:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 8020526:	429a      	cmp	r2, r3
 8020528:	d3ac      	bcc.n	8020484 <printf+0x44>
  }
  __msg[q] = '\0';
 802052a:	f107 0208 	add.w	r2, r7, #8
 802052e:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 8020532:	4413      	add	r3, r2
 8020534:	2200      	movs	r2, #0
 8020536:	701a      	strb	r2, [r3, #0]
  __usart1_print(__msg, _strlen(__msg));
 8020538:	f107 0308 	add.w	r3, r7, #8
 802053c:	4618      	mov	r0, r3
 802053e:	f7ff ff29 	bl	8020394 <_strlen>
 8020542:	4602      	mov	r2, r0
 8020544:	f107 0308 	add.w	r3, r7, #8
 8020548:	4611      	mov	r1, r2
 802054a:	4618      	mov	r0, r3
 802054c:	f000 fba2 	bl	8020c94 <__usart1_print>
}
 8020550:	3790      	adds	r7, #144	@ 0x90
 8020552:	46bd      	mov	sp, r7
 8020554:	bd80      	pop	{r7, pc}
 8020556:	bf00      	nop
 8020558:	0802100c 	.word	0x0802100c

0802055c <syscall__printf>:

void syscall__printf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 802055c:	b580      	push	{r7, lr}
 802055e:	b084      	sub	sp, #16
 8020560:	af00      	add	r7, sp, #0
 8020562:	60f8      	str	r0, [r7, #12]
 8020564:	60b9      	str	r1, [r7, #8]
 8020566:	607a      	str	r2, [r7, #4]
 8020568:	603b      	str	r3, [r7, #0]
  // semaphore_lock(&sem_usart1);
  printf((const char *)a, b);
 802056a:	68fb      	ldr	r3, [r7, #12]
 802056c:	68b9      	ldr	r1, [r7, #8]
 802056e:	4618      	mov	r0, r3
 8020570:	f7ff ff66 	bl	8020440 <printf>
  // semaphore_unlock(&sem_usart1);
}
 8020574:	bf00      	nop
 8020576:	3710      	adds	r7, #16
 8020578:	46bd      	mov	sp, r7
 802057a:	bd80      	pop	{r7, pc}

0802057c <syscall__scanf>:

void syscall__scanf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 802057c:	b480      	push	{r7}
 802057e:	b085      	sub	sp, #20
 8020580:	af00      	add	r7, sp, #0
 8020582:	60f8      	str	r0, [r7, #12]
 8020584:	60b9      	str	r1, [r7, #8]
 8020586:	607a      	str	r2, [r7, #4]
 8020588:	603b      	str	r3, [r7, #0]

  while (1)
 802058a:	e7fe      	b.n	802058a <syscall__scanf+0xe>

0802058c <main>:
void main15 (void);

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind);
void launch_process (void);

int main() {
 802058c:	b580      	push	{r7, lr}
 802058e:	b086      	sub	sp, #24
 8020590:	af00      	add	r7, sp, #0

    SCB->SHP[10] = 0xff;    // set the PendSV to be the lowest priority...
 8020592:	4b51      	ldr	r3, [pc, #324]	@ (80206d8 <main+0x14c>)
 8020594:	22ff      	movs	r2, #255	@ 0xff
 8020596:	f883 2022 	strb.w	r2, [r3, #34]	@ 0x22

    /* some init code */
    __usart1_init ();
 802059a:	f000 fb39 	bl	8020c10 <__usart1_init>
    queue_init (&ready_queue);
 802059e:	484f      	ldr	r0, [pc, #316]	@ (80206dc <main+0x150>)
 80205a0:	f000 f9d0 	bl	8020944 <queue_init>
    semaphore_init (&sem_usart1, 1);
 80205a4:	2101      	movs	r1, #1
 80205a6:	484e      	ldr	r0, [pc, #312]	@ (80206e0 <main+0x154>)
 80205a8:	f000 facc 	bl	8020b44 <semaphore_init>

    if (process_count < 1 || process_count > MAX_PROCESS_NUM){
 80205ac:	4b4d      	ldr	r3, [pc, #308]	@ (80206e4 <main+0x158>)
 80205ae:	781b      	ldrb	r3, [r3, #0]
 80205b0:	2b00      	cmp	r3, #0
 80205b2:	d003      	beq.n	80205bc <main+0x30>
 80205b4:	4b4b      	ldr	r3, [pc, #300]	@ (80206e4 <main+0x158>)
 80205b6:	781b      	ldrb	r3, [r3, #0]
 80205b8:	2b0f      	cmp	r3, #15
 80205ba:	d904      	bls.n	80205c6 <main+0x3a>
        printf ("ERROR in the number of process ....\n\r", 0x0);
 80205bc:	2100      	movs	r1, #0
 80205be:	484a      	ldr	r0, [pc, #296]	@ (80206e8 <main+0x15c>)
 80205c0:	f7ff ff3e 	bl	8020440 <printf>
        while (1);
 80205c4:	e7fe      	b.n	80205c4 <main+0x38>
    }

    /******************** fault handler init ***************************/
    
    // enable faults (without this any fault = hardfault)
    SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;
 80205c6:	4b44      	ldr	r3, [pc, #272]	@ (80206d8 <main+0x14c>)
 80205c8:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80205ca:	4a43      	ldr	r2, [pc, #268]	@ (80206d8 <main+0x14c>)
 80205cc:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
 80205d0:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;
 80205d2:	4b41      	ldr	r3, [pc, #260]	@ (80206d8 <main+0x14c>)
 80205d4:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80205d6:	4a40      	ldr	r2, [pc, #256]	@ (80206d8 <main+0x14c>)
 80205d8:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
 80205dc:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;
 80205de:	4b3e      	ldr	r3, [pc, #248]	@ (80206d8 <main+0x14c>)
 80205e0:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80205e2:	4a3d      	ldr	r2, [pc, #244]	@ (80206d8 <main+0x14c>)
 80205e4:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 80205e8:	6253      	str	r3, [r2, #36]	@ 0x24



    /* init syscall table */
    Syscall_Table[0] =  syscall__printf;
 80205ea:	4b40      	ldr	r3, [pc, #256]	@ (80206ec <main+0x160>)
 80205ec:	4a40      	ldr	r2, [pc, #256]	@ (80206f0 <main+0x164>)
 80205ee:	601a      	str	r2, [r3, #0]
    Syscall_Table[1] =  syscall__scanf;
 80205f0:	4b3e      	ldr	r3, [pc, #248]	@ (80206ec <main+0x160>)
 80205f2:	4a40      	ldr	r2, [pc, #256]	@ (80206f4 <main+0x168>)
 80205f4:	605a      	str	r2, [r3, #4]
    *(uint32_t *)(SYSCALL_TABLE_AD) = (uint32_t)(Syscall_Table);
 80205f6:	4b40      	ldr	r3, [pc, #256]	@ (80206f8 <main+0x16c>)
 80205f8:	4a3c      	ldr	r2, [pc, #240]	@ (80206ec <main+0x160>)
 80205fa:	601a      	str	r2, [r3, #0]
    
    uint32_t psp_val = USER_STACK_INIT;
 80205fc:	4b3f      	ldr	r3, [pc, #252]	@ (80206fc <main+0x170>)
 80205fe:	617b      	str	r3, [r7, #20]
    uint32_t msp_val = KERNEL_STACK_INIT;
 8020600:	4b3f      	ldr	r3, [pc, #252]	@ (8020700 <main+0x174>)
 8020602:	613b      	str	r3, [r7, #16]
    uint32_t user_stack_size = USER_STACK_SIZE / process_count;
 8020604:	4b37      	ldr	r3, [pc, #220]	@ (80206e4 <main+0x158>)
 8020606:	781b      	ldrb	r3, [r3, #0]
 8020608:	461a      	mov	r2, r3
 802060a:	f44f 4300 	mov.w	r3, #32768	@ 0x8000
 802060e:	fb93 f3f2 	sdiv	r3, r3, r2
 8020612:	60bb      	str	r3, [r7, #8]
    uint32_t kernel_stack_size = KERNEL_STACK_SIZE / process_count;
 8020614:	4b33      	ldr	r3, [pc, #204]	@ (80206e4 <main+0x158>)
 8020616:	781b      	ldrb	r3, [r3, #0]
 8020618:	461a      	mov	r2, r3
 802061a:	f44f 43c0 	mov.w	r3, #24576	@ 0x6000
 802061e:	fb93 f3f2 	sdiv	r3, r3, r2
 8020622:	607b      	str	r3, [r7, #4]

    /* fill the pcs */
    process_pc [0] = main1;
 8020624:	4b37      	ldr	r3, [pc, #220]	@ (8020704 <main+0x178>)
 8020626:	4a38      	ldr	r2, [pc, #224]	@ (8020708 <main+0x17c>)
 8020628:	601a      	str	r2, [r3, #0]
    process_pc [1] = main2;
 802062a:	4b36      	ldr	r3, [pc, #216]	@ (8020704 <main+0x178>)
 802062c:	4a37      	ldr	r2, [pc, #220]	@ (802070c <main+0x180>)
 802062e:	605a      	str	r2, [r3, #4]
    process_pc [2] = main3;
 8020630:	4b34      	ldr	r3, [pc, #208]	@ (8020704 <main+0x178>)
 8020632:	4a37      	ldr	r2, [pc, #220]	@ (8020710 <main+0x184>)
 8020634:	609a      	str	r2, [r3, #8]
    process_pc [3] = main4;
 8020636:	4b33      	ldr	r3, [pc, #204]	@ (8020704 <main+0x178>)
 8020638:	4a36      	ldr	r2, [pc, #216]	@ (8020714 <main+0x188>)
 802063a:	60da      	str	r2, [r3, #12]
    process_pc [4] = main5;
 802063c:	4b31      	ldr	r3, [pc, #196]	@ (8020704 <main+0x178>)
 802063e:	4a36      	ldr	r2, [pc, #216]	@ (8020718 <main+0x18c>)
 8020640:	611a      	str	r2, [r3, #16]
    process_pc [5] = main6;
 8020642:	4b30      	ldr	r3, [pc, #192]	@ (8020704 <main+0x178>)
 8020644:	4a35      	ldr	r2, [pc, #212]	@ (802071c <main+0x190>)
 8020646:	615a      	str	r2, [r3, #20]
    process_pc [6] = main7;
 8020648:	4b2e      	ldr	r3, [pc, #184]	@ (8020704 <main+0x178>)
 802064a:	4a35      	ldr	r2, [pc, #212]	@ (8020720 <main+0x194>)
 802064c:	619a      	str	r2, [r3, #24]
    process_pc [7] = main8;
 802064e:	4b2d      	ldr	r3, [pc, #180]	@ (8020704 <main+0x178>)
 8020650:	4a34      	ldr	r2, [pc, #208]	@ (8020724 <main+0x198>)
 8020652:	61da      	str	r2, [r3, #28]
    process_pc [8] = main9;
 8020654:	4b2b      	ldr	r3, [pc, #172]	@ (8020704 <main+0x178>)
 8020656:	4a34      	ldr	r2, [pc, #208]	@ (8020728 <main+0x19c>)
 8020658:	621a      	str	r2, [r3, #32]
    process_pc [9] = main10;
 802065a:	4b2a      	ldr	r3, [pc, #168]	@ (8020704 <main+0x178>)
 802065c:	4a33      	ldr	r2, [pc, #204]	@ (802072c <main+0x1a0>)
 802065e:	625a      	str	r2, [r3, #36]	@ 0x24
    process_pc [10] = main11;
 8020660:	4b28      	ldr	r3, [pc, #160]	@ (8020704 <main+0x178>)
 8020662:	4a33      	ldr	r2, [pc, #204]	@ (8020730 <main+0x1a4>)
 8020664:	629a      	str	r2, [r3, #40]	@ 0x28
    process_pc [11] = main12;
 8020666:	4b27      	ldr	r3, [pc, #156]	@ (8020704 <main+0x178>)
 8020668:	4a32      	ldr	r2, [pc, #200]	@ (8020734 <main+0x1a8>)
 802066a:	62da      	str	r2, [r3, #44]	@ 0x2c
    process_pc [12] = main13;
 802066c:	4b25      	ldr	r3, [pc, #148]	@ (8020704 <main+0x178>)
 802066e:	4a32      	ldr	r2, [pc, #200]	@ (8020738 <main+0x1ac>)
 8020670:	631a      	str	r2, [r3, #48]	@ 0x30
    process_pc [13] = main14;
 8020672:	4b24      	ldr	r3, [pc, #144]	@ (8020704 <main+0x178>)
 8020674:	4a31      	ldr	r2, [pc, #196]	@ (802073c <main+0x1b0>)
 8020676:	635a      	str	r2, [r3, #52]	@ 0x34
    process_pc [14] = main15;
 8020678:	4b22      	ldr	r3, [pc, #136]	@ (8020704 <main+0x178>)
 802067a:	4a31      	ldr	r2, [pc, #196]	@ (8020740 <main+0x1b4>)
 802067c:	639a      	str	r2, [r3, #56]	@ 0x38

    for (uint8_t i=0; i<process_count; i++){
 802067e:	2300      	movs	r3, #0
 8020680:	73fb      	strb	r3, [r7, #15]
 8020682:	e01e      	b.n	80206c2 <main+0x136>
        make_process (&process[i], psp_val, msp_val, i);
 8020684:	7bfa      	ldrb	r2, [r7, #15]
 8020686:	4613      	mov	r3, r2
 8020688:	005b      	lsls	r3, r3, #1
 802068a:	4413      	add	r3, r2
 802068c:	011b      	lsls	r3, r3, #4
 802068e:	4a2d      	ldr	r2, [pc, #180]	@ (8020744 <main+0x1b8>)
 8020690:	1898      	adds	r0, r3, r2
 8020692:	7bfb      	ldrb	r3, [r7, #15]
 8020694:	693a      	ldr	r2, [r7, #16]
 8020696:	6979      	ldr	r1, [r7, #20]
 8020698:	f000 f856 	bl	8020748 <make_process>
        psp_val -= user_stack_size;
 802069c:	697a      	ldr	r2, [r7, #20]
 802069e:	68bb      	ldr	r3, [r7, #8]
 80206a0:	1ad3      	subs	r3, r2, r3
 80206a2:	617b      	str	r3, [r7, #20]
        msp_val -= kernel_stack_size;
 80206a4:	693a      	ldr	r2, [r7, #16]
 80206a6:	687b      	ldr	r3, [r7, #4]
 80206a8:	1ad3      	subs	r3, r2, r3
 80206aa:	613b      	str	r3, [r7, #16]
        /* make stack pointers word aligned */
        psp_val &= ~(3);
 80206ac:	697b      	ldr	r3, [r7, #20]
 80206ae:	f023 0303 	bic.w	r3, r3, #3
 80206b2:	617b      	str	r3, [r7, #20]
        msp_val &= ~(3);
 80206b4:	693b      	ldr	r3, [r7, #16]
 80206b6:	f023 0303 	bic.w	r3, r3, #3
 80206ba:	613b      	str	r3, [r7, #16]
    for (uint8_t i=0; i<process_count; i++){
 80206bc:	7bfb      	ldrb	r3, [r7, #15]
 80206be:	3301      	adds	r3, #1
 80206c0:	73fb      	strb	r3, [r7, #15]
 80206c2:	4b08      	ldr	r3, [pc, #32]	@ (80206e4 <main+0x158>)
 80206c4:	781b      	ldrb	r3, [r3, #0]
 80206c6:	7bfa      	ldrb	r2, [r7, #15]
 80206c8:	429a      	cmp	r2, r3
 80206ca:	d3db      	bcc.n	8020684 <main+0xf8>
 
    /* accessing illegal address in kernel code -> Kernel Panic*/
//    *(uint32_t*) (0xffffffff) = 5;

    /*impose user restriction*/
    mpu_setup ();
 80206cc:	f000 f906 	bl	80208dc <mpu_setup>

    /* start the processes */
    launch_process();
 80206d0:	f000 f8a6 	bl	8020820 <launch_process>
    /* should never fall to this section */
    while (1);
 80206d4:	e7fe      	b.n	80206d4 <main+0x148>
 80206d6:	bf00      	nop
 80206d8:	e000ed00 	.word	0xe000ed00
 80206dc:	200003b8 	.word	0x200003b8
 80206e0:	2000002c 	.word	0x2000002c
 80206e4:	20000000 	.word	0x20000000
 80206e8:	0802102c 	.word	0x0802102c
 80206ec:	20000004 	.word	0x20000004
 80206f0:	0802055d 	.word	0x0802055d
 80206f4:	0802057d 	.word	0x0802057d
 80206f8:	2001600c 	.word	0x2001600c
 80206fc:	20010000 	.word	0x20010000
 8020700:	20016000 	.word	0x20016000
 8020704:	2000037c 	.word	0x2000037c
 8020708:	08030001 	.word	0x08030001
 802070c:	080300a5 	.word	0x080300a5
 8020710:	080300b9 	.word	0x080300b9
 8020714:	080300cd 	.word	0x080300cd
 8020718:	080300e1 	.word	0x080300e1
 802071c:	080300f5 	.word	0x080300f5
 8020720:	08030109 	.word	0x08030109
 8020724:	0803011d 	.word	0x0803011d
 8020728:	08030131 	.word	0x08030131
 802072c:	0803002d 	.word	0x0803002d
 8020730:	08030041 	.word	0x08030041
 8020734:	08030055 	.word	0x08030055
 8020738:	08030069 	.word	0x08030069
 802073c:	0803007d 	.word	0x0803007d
 8020740:	08030091 	.word	0x08030091
 8020744:	200000ac 	.word	0x200000ac

08020748 <make_process>:
}

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind){
 8020748:	b480      	push	{r7}
 802074a:	b087      	sub	sp, #28
 802074c:	af00      	add	r7, sp, #0
 802074e:	60f8      	str	r0, [r7, #12]
 8020750:	60b9      	str	r1, [r7, #8]
 8020752:	607a      	str	r2, [r7, #4]
 8020754:	70fb      	strb	r3, [r7, #3]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;
 8020756:	68fb      	ldr	r3, [r7, #12]
 8020758:	2200      	movs	r2, #0
 802075a:	61da      	str	r2, [r3, #28]
 802075c:	68fb      	ldr	r3, [r7, #12]
 802075e:	69da      	ldr	r2, [r3, #28]
 8020760:	68fb      	ldr	r3, [r7, #12]
 8020762:	619a      	str	r2, [r3, #24]
 8020764:	68fb      	ldr	r3, [r7, #12]
 8020766:	699a      	ldr	r2, [r3, #24]
 8020768:	68fb      	ldr	r3, [r7, #12]
 802076a:	615a      	str	r2, [r3, #20]
 802076c:	68fb      	ldr	r3, [r7, #12]
 802076e:	695a      	ldr	r2, [r3, #20]
 8020770:	68fb      	ldr	r3, [r7, #12]
 8020772:	611a      	str	r2, [r3, #16]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
 8020774:	68fb      	ldr	r3, [r7, #12]
 8020776:	691a      	ldr	r2, [r3, #16]
 8020778:	68fb      	ldr	r3, [r7, #12]
 802077a:	60da      	str	r2, [r3, #12]
 802077c:	68fb      	ldr	r3, [r7, #12]
 802077e:	68da      	ldr	r2, [r3, #12]
 8020780:	68fb      	ldr	r3, [r7, #12]
 8020782:	609a      	str	r2, [r3, #8]
 8020784:	68fb      	ldr	r3, [r7, #12]
 8020786:	689a      	ldr	r2, [r3, #8]
 8020788:	68fb      	ldr	r3, [r7, #12]
 802078a:	605a      	str	r2, [r3, #4]
 802078c:	68fb      	ldr	r3, [r7, #12]
 802078e:	685a      	ldr	r2, [r3, #4]
 8020790:	68fb      	ldr	r3, [r7, #12]
 8020792:	601a      	str	r2, [r3, #0]

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;
 8020794:	68fb      	ldr	r3, [r7, #12]
 8020796:	f06f 0202 	mvn.w	r2, #2
 802079a:	629a      	str	r2, [r3, #40]	@ 0x28



    //process->pc = (uint32_t) fun;
    process->psp = psp;
 802079c:	68fb      	ldr	r3, [r7, #12]
 802079e:	68ba      	ldr	r2, [r7, #8]
 80207a0:	621a      	str	r2, [r3, #32]
    process->msp = msp;
 80207a2:	68fb      	ldr	r3, [r7, #12]
 80207a4:	687a      	ldr	r2, [r7, #4]
 80207a6:	625a      	str	r2, [r3, #36]	@ 0x24
    process->psp -= 8*4;        // start from 8 word below the base of the stack
 80207a8:	68fb      	ldr	r3, [r7, #12]
 80207aa:	6a1b      	ldr	r3, [r3, #32]
 80207ac:	f1a3 0220 	sub.w	r2, r3, #32
 80207b0:	68fb      	ldr	r3, [r7, #12]
 80207b2:	621a      	str	r2, [r3, #32]
    the values in the padding is random -> make them 0x0 

    set the xPSR word in the stack to 0x01000000 as 24th bit must ne 1 for xPSR to 
    represent thumb state 
    */
    for (int i=0; i<8; i++){
 80207b4:	2300      	movs	r3, #0
 80207b6:	617b      	str	r3, [r7, #20]
 80207b8:	e026      	b.n	8020808 <make_process+0xc0>
        if (i == 6)
 80207ba:	697b      	ldr	r3, [r7, #20]
 80207bc:	2b06      	cmp	r3, #6
 80207be:	d10b      	bne.n	80207d8 <make_process+0x90>
            *(uint32_t *)(process->psp+i*4) = (uint32_t) process_pc [ind];
 80207c0:	78fb      	ldrb	r3, [r7, #3]
 80207c2:	4a16      	ldr	r2, [pc, #88]	@ (802081c <make_process+0xd4>)
 80207c4:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
 80207c8:	68fb      	ldr	r3, [r7, #12]
 80207ca:	6a1b      	ldr	r3, [r3, #32]
 80207cc:	697a      	ldr	r2, [r7, #20]
 80207ce:	0092      	lsls	r2, r2, #2
 80207d0:	4413      	add	r3, r2
 80207d2:	460a      	mov	r2, r1
 80207d4:	601a      	str	r2, [r3, #0]
 80207d6:	e014      	b.n	8020802 <make_process+0xba>
        else if (i == 7)
 80207d8:	697b      	ldr	r3, [r7, #20]
 80207da:	2b07      	cmp	r3, #7
 80207dc:	d109      	bne.n	80207f2 <make_process+0xaa>
            *(uint32_t *)(process->psp+i*4) = 0x01000000;
 80207de:	68fb      	ldr	r3, [r7, #12]
 80207e0:	6a1b      	ldr	r3, [r3, #32]
 80207e2:	697a      	ldr	r2, [r7, #20]
 80207e4:	0092      	lsls	r2, r2, #2
 80207e6:	4413      	add	r3, r2
 80207e8:	461a      	mov	r2, r3
 80207ea:	f04f 7380 	mov.w	r3, #16777216	@ 0x1000000
 80207ee:	6013      	str	r3, [r2, #0]
 80207f0:	e007      	b.n	8020802 <make_process+0xba>
        else 
            *(uint32_t *)(process->psp+i*4) = 0x0;
 80207f2:	68fb      	ldr	r3, [r7, #12]
 80207f4:	6a1b      	ldr	r3, [r3, #32]
 80207f6:	697a      	ldr	r2, [r7, #20]
 80207f8:	0092      	lsls	r2, r2, #2
 80207fa:	4413      	add	r3, r2
 80207fc:	461a      	mov	r2, r3
 80207fe:	2300      	movs	r3, #0
 8020800:	6013      	str	r3, [r2, #0]
    for (int i=0; i<8; i++){
 8020802:	697b      	ldr	r3, [r7, #20]
 8020804:	3301      	adds	r3, #1
 8020806:	617b      	str	r3, [r7, #20]
 8020808:	697b      	ldr	r3, [r7, #20]
 802080a:	2b07      	cmp	r3, #7
 802080c:	ddd5      	ble.n	80207ba <make_process+0x72>
    }
    

}
 802080e:	bf00      	nop
 8020810:	bf00      	nop
 8020812:	371c      	adds	r7, #28
 8020814:	46bd      	mov	sp, r7
 8020816:	bc80      	pop	{r7}
 8020818:	4770      	bx	lr
 802081a:	bf00      	nop
 802081c:	2000037c 	.word	0x2000037c

08020820 <launch_process>:

void  launch_process (void){
 8020820:	b580      	push	{r7, lr}
 8020822:	b082      	sub	sp, #8
 8020824:	af00      	add	r7, sp, #0
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process[0].psp);
 8020826:	4b28      	ldr	r3, [pc, #160]	@ (80208c8 <launch_process+0xa8>)
 8020828:	6a1b      	ldr	r3, [r3, #32]
 802082a:	4618      	mov	r0, r3
 802082c:	f000 fb14 	bl	8020e58 <__asm__set_psp>
    __asm__set_msp (process[0].msp);
 8020830:	4b25      	ldr	r3, [pc, #148]	@ (80208c8 <launch_process+0xa8>)
 8020832:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020834:	4618      	mov	r0, r3
 8020836:	f000 fb12 	bl	8020e5e <__asm__set_msp>
       

    SysTick->LOAD = 16000 - 1;
 802083a:	4b24      	ldr	r3, [pc, #144]	@ (80208cc <launch_process+0xac>)
 802083c:	f643 627f 	movw	r2, #15999	@ 0x3e7f
 8020840:	605a      	str	r2, [r3, #4]
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
 8020842:	4b22      	ldr	r3, [pc, #136]	@ (80208cc <launch_process+0xac>)
 8020844:	681b      	ldr	r3, [r3, #0]
 8020846:	4a21      	ldr	r2, [pc, #132]	@ (80208cc <launch_process+0xac>)
 8020848:	f043 0307 	orr.w	r3, r3, #7
 802084c:	6013      	str	r3, [r2, #0]
            | SysTick_CTRL_ENABLE_Msk);

    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process[0]);
 802084e:	4b20      	ldr	r3, [pc, #128]	@ (80208d0 <launch_process+0xb0>)
 8020850:	4a1d      	ldr	r2, [pc, #116]	@ (80208c8 <launch_process+0xa8>)
 8020852:	601a      	str	r2, [r3, #0]

    /* initially all the processes will be placed in the ready queue except the first one (entry point) */
    for (uint8_t i=1; i<process_count; i++){
 8020854:	2301      	movs	r3, #1
 8020856:	71fb      	strb	r3, [r7, #7]
 8020858:	e013      	b.n	8020882 <launch_process+0x62>
        int status = queue_push (&ready_queue, &process[i]);
 802085a:	79fa      	ldrb	r2, [r7, #7]
 802085c:	4613      	mov	r3, r2
 802085e:	005b      	lsls	r3, r3, #1
 8020860:	4413      	add	r3, r2
 8020862:	011b      	lsls	r3, r3, #4
 8020864:	4a18      	ldr	r2, [pc, #96]	@ (80208c8 <launch_process+0xa8>)
 8020866:	4413      	add	r3, r2
 8020868:	4619      	mov	r1, r3
 802086a:	481a      	ldr	r0, [pc, #104]	@ (80208d4 <launch_process+0xb4>)
 802086c:	f000 f87f 	bl	802096e <queue_push>
 8020870:	4603      	mov	r3, r0
 8020872:	603b      	str	r3, [r7, #0]
        if (status){
 8020874:	683b      	ldr	r3, [r7, #0]
 8020876:	2b00      	cmp	r3, #0
 8020878:	d000      	beq.n	802087c <launch_process+0x5c>
            while (1);
 802087a:	e7fe      	b.n	802087a <launch_process+0x5a>
    for (uint8_t i=1; i<process_count; i++){
 802087c:	79fb      	ldrb	r3, [r7, #7]
 802087e:	3301      	adds	r3, #1
 8020880:	71fb      	strb	r3, [r7, #7]
 8020882:	4b15      	ldr	r3, [pc, #84]	@ (80208d8 <launch_process+0xb8>)
 8020884:	781b      	ldrb	r3, [r3, #0]
 8020886:	79fa      	ldrb	r2, [r7, #7]
 8020888:	429a      	cmp	r2, r3
 802088a:	d3e6      	bcc.n	802085a <launch_process+0x3a>
        }
    }

    process[0].state = RUNNING_STATE;
 802088c:	4b0e      	ldr	r3, [pc, #56]	@ (80208c8 <launch_process+0xa8>)
 802088e:	2201      	movs	r2, #1
 8020890:	62da      	str	r2, [r3, #44]	@ 0x2c
    for (uint8_t i=1; i<process_count; i++){
 8020892:	2301      	movs	r3, #1
 8020894:	71bb      	strb	r3, [r7, #6]
 8020896:	e00c      	b.n	80208b2 <launch_process+0x92>
        process[i].state = READY_STATE;
 8020898:	79ba      	ldrb	r2, [r7, #6]
 802089a:	490b      	ldr	r1, [pc, #44]	@ (80208c8 <launch_process+0xa8>)
 802089c:	4613      	mov	r3, r2
 802089e:	005b      	lsls	r3, r3, #1
 80208a0:	4413      	add	r3, r2
 80208a2:	011b      	lsls	r3, r3, #4
 80208a4:	440b      	add	r3, r1
 80208a6:	332c      	adds	r3, #44	@ 0x2c
 80208a8:	2200      	movs	r2, #0
 80208aa:	601a      	str	r2, [r3, #0]
    for (uint8_t i=1; i<process_count; i++){
 80208ac:	79bb      	ldrb	r3, [r7, #6]
 80208ae:	3301      	adds	r3, #1
 80208b0:	71bb      	strb	r3, [r7, #6]
 80208b2:	4b09      	ldr	r3, [pc, #36]	@ (80208d8 <launch_process+0xb8>)
 80208b4:	781b      	ldrb	r3, [r3, #0]
 80208b6:	79ba      	ldrb	r2, [r7, #6]
 80208b8:	429a      	cmp	r2, r3
 80208ba:	d3ed      	bcc.n	8020898 <launch_process+0x78>
    }
 
    __asm__launch_main1();
 80208bc:	f00f fc42 	bl	8030144 <__asm__launch_main1>

}
 80208c0:	bf00      	nop
 80208c2:	3708      	adds	r7, #8
 80208c4:	46bd      	mov	sp, r7
 80208c6:	bd80      	pop	{r7, pc}
 80208c8:	200000ac 	.word	0x200000ac
 80208cc:	e000e010 	.word	0xe000e010
 80208d0:	20016004 	.word	0x20016004
 80208d4:	200003b8 	.word	0x200003b8
 80208d8:	20000000 	.word	0x20000000

080208dc <mpu_setup>:
#include "core.h"

void mpu_setup(void) {
 80208dc:	b480      	push	{r7}
 80208de:	af00      	add	r7, sp, #0

  /*dissable mpu*/
  MPU->CTRL = 0;
 80208e0:	4b12      	ldr	r3, [pc, #72]	@ (802092c <mpu_setup+0x50>)
 80208e2:	2200      	movs	r2, #0
 80208e4:	605a      	str	r2, [r3, #4]

  /*region 0*/
  MPU->RNR = 0;
 80208e6:	4b11      	ldr	r3, [pc, #68]	@ (802092c <mpu_setup+0x50>)
 80208e8:	2200      	movs	r2, #0
 80208ea:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sFLASHUserSpace);
 80208ec:	4b0f      	ldr	r3, [pc, #60]	@ (802092c <mpu_setup+0x50>)
 80208ee:	4a10      	ldr	r2, [pc, #64]	@ (8020930 <mpu_setup+0x54>)
 80208f0:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 80208f2:	4b0e      	ldr	r3, [pc, #56]	@ (802092c <mpu_setup+0x50>)
 80208f4:	4a0f      	ldr	r2, [pc, #60]	@ (8020934 <mpu_setup+0x58>)
 80208f6:	611a      	str	r2, [r3, #16]
      (0 << MPU_RASR_XN_Pos) |     // Executable (XN = 0)
      (0b110 << MPU_RASR_AP_Pos) | // Privileged read-only user read-only
      (15 << MPU_RASR_SIZE_Pos) |  // 64 KB region
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 1;
 80208f8:	4b0c      	ldr	r3, [pc, #48]	@ (802092c <mpu_setup+0x50>)
 80208fa:	2201      	movs	r2, #1
 80208fc:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sSRAMUserSpace);
 80208fe:	4b0b      	ldr	r3, [pc, #44]	@ (802092c <mpu_setup+0x50>)
 8020900:	4a0d      	ldr	r2, [pc, #52]	@ (8020938 <mpu_setup+0x5c>)
 8020902:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 8020904:	4b09      	ldr	r3, [pc, #36]	@ (802092c <mpu_setup+0x50>)
 8020906:	4a0d      	ldr	r2, [pc, #52]	@ (802093c <mpu_setup+0x60>)
 8020908:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 2;
 802090a:	4b08      	ldr	r3, [pc, #32]	@ (802092c <mpu_setup+0x50>)
 802090c:	2202      	movs	r2, #2
 802090e:	609a      	str	r2, [r3, #8]
  MPU->RBAR = USER_STACK_END;
 8020910:	4b06      	ldr	r3, [pc, #24]	@ (802092c <mpu_setup+0x50>)
 8020912:	4a0b      	ldr	r2, [pc, #44]	@ (8020940 <mpu_setup+0x64>)
 8020914:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 8020916:	4b05      	ldr	r3, [pc, #20]	@ (802092c <mpu_setup+0x50>)
 8020918:	4a08      	ldr	r2, [pc, #32]	@ (802093c <mpu_setup+0x60>)
 802091a:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->CTRL = MPU_CTRL_PRIVDEFENA_Msk | MPU_CTRL_ENABLE_Msk;
 802091c:	4b03      	ldr	r3, [pc, #12]	@ (802092c <mpu_setup+0x50>)
 802091e:	2205      	movs	r2, #5
 8020920:	605a      	str	r2, [r3, #4]
}
 8020922:	bf00      	nop
 8020924:	46bd      	mov	sp, r7
 8020926:	bc80      	pop	{r7}
 8020928:	4770      	bx	lr
 802092a:	bf00      	nop
 802092c:	e000ed90 	.word	0xe000ed90
 8020930:	08030000 	.word	0x08030000
 8020934:	0600001f 	.word	0x0600001f
 8020938:	20004000 	.word	0x20004000
 802093c:	1300001d 	.word	0x1300001d
 8020940:	20008000 	.word	0x20008000

08020944 <queue_init>:
#include "core.h"

/* queue functions */
void queue_init (queue_t* q){
 8020944:	b480      	push	{r7}
 8020946:	b083      	sub	sp, #12
 8020948:	af00      	add	r7, sp, #0
 802094a:	6078      	str	r0, [r7, #4]
    q->size = 0;
 802094c:	687b      	ldr	r3, [r7, #4]
 802094e:	2200      	movs	r2, #0
 8020950:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    q->front = 0xff;
 8020954:	687b      	ldr	r3, [r7, #4]
 8020956:	22ff      	movs	r2, #255	@ 0xff
 8020958:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    q->rare = 0;
 802095c:	687b      	ldr	r3, [r7, #4]
 802095e:	2200      	movs	r2, #0
 8020960:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
}
 8020964:	bf00      	nop
 8020966:	370c      	adds	r7, #12
 8020968:	46bd      	mov	sp, r7
 802096a:	bc80      	pop	{r7}
 802096c:	4770      	bx	lr

0802096e <queue_push>:

uint8_t queue_push (queue_t* q, user_process_t* process){
 802096e:	b480      	push	{r7}
 8020970:	b083      	sub	sp, #12
 8020972:	af00      	add	r7, sp, #0
 8020974:	6078      	str	r0, [r7, #4]
 8020976:	6039      	str	r1, [r7, #0]
    if (q->front == 0xff){
 8020978:	687b      	ldr	r3, [r7, #4]
 802097a:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 802097e:	2bff      	cmp	r3, #255	@ 0xff
 8020980:	d104      	bne.n	802098c <queue_push+0x1e>
        /* queue is empty */
        q->front = 0;
 8020982:	687b      	ldr	r3, [r7, #4]
 8020984:	2200      	movs	r2, #0
 8020986:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
 802098a:	e009      	b.n	80209a0 <queue_push+0x32>
    }
    else if (q->rare == q->front) return -1;
 802098c:	687b      	ldr	r3, [r7, #4]
 802098e:	f893 207a 	ldrb.w	r2, [r3, #122]	@ 0x7a
 8020992:	687b      	ldr	r3, [r7, #4]
 8020994:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020998:	429a      	cmp	r2, r3
 802099a:	d101      	bne.n	80209a0 <queue_push+0x32>
 802099c:	23ff      	movs	r3, #255	@ 0xff
 802099e:	e023      	b.n	80209e8 <queue_push+0x7a>

    q->processes [q->rare] = process;
 80209a0:	687b      	ldr	r3, [r7, #4]
 80209a2:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 80209a6:	4619      	mov	r1, r3
 80209a8:	687b      	ldr	r3, [r7, #4]
 80209aa:	683a      	ldr	r2, [r7, #0]
 80209ac:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
    q->rare = (q->rare + 1) % MAX_PROCESS_NUM;
 80209b0:	687b      	ldr	r3, [r7, #4]
 80209b2:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 80209b6:	1c5a      	adds	r2, r3, #1
 80209b8:	4b0e      	ldr	r3, [pc, #56]	@ (80209f4 <queue_push+0x86>)
 80209ba:	fb83 1302 	smull	r1, r3, r3, r2
 80209be:	4413      	add	r3, r2
 80209c0:	10d9      	asrs	r1, r3, #3
 80209c2:	17d3      	asrs	r3, r2, #31
 80209c4:	1ac9      	subs	r1, r1, r3
 80209c6:	460b      	mov	r3, r1
 80209c8:	011b      	lsls	r3, r3, #4
 80209ca:	1a5b      	subs	r3, r3, r1
 80209cc:	1ad1      	subs	r1, r2, r3
 80209ce:	b2ca      	uxtb	r2, r1
 80209d0:	687b      	ldr	r3, [r7, #4]
 80209d2:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a

    q->size ++ ;
 80209d6:	687b      	ldr	r3, [r7, #4]
 80209d8:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 80209dc:	3301      	adds	r3, #1
 80209de:	b2da      	uxtb	r2, r3
 80209e0:	687b      	ldr	r3, [r7, #4]
 80209e2:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 80209e6:	2300      	movs	r3, #0
}
 80209e8:	4618      	mov	r0, r3
 80209ea:	370c      	adds	r7, #12
 80209ec:	46bd      	mov	sp, r7
 80209ee:	bc80      	pop	{r7}
 80209f0:	4770      	bx	lr
 80209f2:	bf00      	nop
 80209f4:	88888889 	.word	0x88888889

080209f8 <queue_pop>:

uint8_t queue_pop (queue_t* q){   
 80209f8:	b480      	push	{r7}
 80209fa:	b083      	sub	sp, #12
 80209fc:	af00      	add	r7, sp, #0
 80209fe:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff){
 8020a00:	687b      	ldr	r3, [r7, #4]
 8020a02:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020a06:	2bff      	cmp	r3, #255	@ 0xff
 8020a08:	d101      	bne.n	8020a0e <queue_pop+0x16>
        /* q is empty*/
        return -1;
 8020a0a:	23ff      	movs	r3, #255	@ 0xff
 8020a0c:	e02b      	b.n	8020a66 <queue_pop+0x6e>
    }
    q->front = (q->front + 1) % MAX_PROCESS_NUM;
 8020a0e:	687b      	ldr	r3, [r7, #4]
 8020a10:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020a14:	1c5a      	adds	r2, r3, #1
 8020a16:	4b16      	ldr	r3, [pc, #88]	@ (8020a70 <queue_pop+0x78>)
 8020a18:	fb83 1302 	smull	r1, r3, r3, r2
 8020a1c:	4413      	add	r3, r2
 8020a1e:	10d9      	asrs	r1, r3, #3
 8020a20:	17d3      	asrs	r3, r2, #31
 8020a22:	1ac9      	subs	r1, r1, r3
 8020a24:	460b      	mov	r3, r1
 8020a26:	011b      	lsls	r3, r3, #4
 8020a28:	1a5b      	subs	r3, r3, r1
 8020a2a:	1ad1      	subs	r1, r2, r3
 8020a2c:	b2ca      	uxtb	r2, r1
 8020a2e:	687b      	ldr	r3, [r7, #4]
 8020a30:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    if (q->front == q->rare){
 8020a34:	687b      	ldr	r3, [r7, #4]
 8020a36:	f893 2079 	ldrb.w	r2, [r3, #121]	@ 0x79
 8020a3a:	687b      	ldr	r3, [r7, #4]
 8020a3c:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 8020a40:	429a      	cmp	r2, r3
 8020a42:	d107      	bne.n	8020a54 <queue_pop+0x5c>
        q->front = 0xff;
 8020a44:	687b      	ldr	r3, [r7, #4]
 8020a46:	22ff      	movs	r2, #255	@ 0xff
 8020a48:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
        q->rare = 0;
 8020a4c:	687b      	ldr	r3, [r7, #4]
 8020a4e:	2200      	movs	r2, #0
 8020a50:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
    }
    q->size --;
 8020a54:	687b      	ldr	r3, [r7, #4]
 8020a56:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 8020a5a:	3b01      	subs	r3, #1
 8020a5c:	b2da      	uxtb	r2, r3
 8020a5e:	687b      	ldr	r3, [r7, #4]
 8020a60:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 8020a64:	2300      	movs	r3, #0
}
 8020a66:	4618      	mov	r0, r3
 8020a68:	370c      	adds	r7, #12
 8020a6a:	46bd      	mov	sp, r7
 8020a6c:	bc80      	pop	{r7}
 8020a6e:	4770      	bx	lr
 8020a70:	88888889 	.word	0x88888889

08020a74 <queue_front>:

user_process_t* queue_front (queue_t *q){
 8020a74:	b480      	push	{r7}
 8020a76:	b083      	sub	sp, #12
 8020a78:	af00      	add	r7, sp, #0
 8020a7a:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff)
 8020a7c:	687b      	ldr	r3, [r7, #4]
 8020a7e:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020a82:	2bff      	cmp	r3, #255	@ 0xff
 8020a84:	d101      	bne.n	8020a8a <queue_front+0x16>
        return NULL;
 8020a86:	2300      	movs	r3, #0
 8020a88:	e006      	b.n	8020a98 <queue_front+0x24>
    return q->processes [q->front];
 8020a8a:	687b      	ldr	r3, [r7, #4]
 8020a8c:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020a90:	461a      	mov	r2, r3
 8020a92:	687b      	ldr	r3, [r7, #4]
 8020a94:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
}
 8020a98:	4618      	mov	r0, r3
 8020a9a:	370c      	adds	r7, #12
 8020a9c:	46bd      	mov	sp, r7
 8020a9e:	bc80      	pop	{r7}
 8020aa0:	4770      	bx	lr

08020aa2 <queue_empty>:

uint32_t queue_empty (queue_t *q){
 8020aa2:	b480      	push	{r7}
 8020aa4:	b083      	sub	sp, #12
 8020aa6:	af00      	add	r7, sp, #0
 8020aa8:	6078      	str	r0, [r7, #4]
    return q->front == 0xff;
 8020aaa:	687b      	ldr	r3, [r7, #4]
 8020aac:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020ab0:	2bff      	cmp	r3, #255	@ 0xff
 8020ab2:	bf0c      	ite	eq
 8020ab4:	2301      	moveq	r3, #1
 8020ab6:	2300      	movne	r3, #0
 8020ab8:	b2db      	uxtb	r3, r3
}
 8020aba:	4618      	mov	r0, r3
 8020abc:	370c      	adds	r7, #12
 8020abe:	46bd      	mov	sp, r7
 8020ac0:	bc80      	pop	{r7}
 8020ac2:	4770      	bx	lr

08020ac4 <queue_size>:

uint32_t queue_size (queue_t *q){
 8020ac4:	b480      	push	{r7}
 8020ac6:	b083      	sub	sp, #12
 8020ac8:	af00      	add	r7, sp, #0
 8020aca:	6078      	str	r0, [r7, #4]
    return q->size;
 8020acc:	687b      	ldr	r3, [r7, #4]
 8020ace:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
}
 8020ad2:	4618      	mov	r0, r3
 8020ad4:	370c      	adds	r7, #12
 8020ad6:	46bd      	mov	sp, r7
 8020ad8:	bc80      	pop	{r7}
 8020ada:	4770      	bx	lr

08020adc <schedular>:
/* important variable from main.c */
extern user_process_t process[MAX_PROCESS_NUM];
extern queue_t ready_queue;
extern semaphore_t sem_usart1;

void schedular(void) {
 8020adc:	b580      	push	{r7, lr}
 8020ade:	b084      	sub	sp, #16
 8020ae0:	af00      	add	r7, sp, #0

  /* Round Robin (FCFS + time slice)*/
  user_process_t *picked_process = NULL;
 8020ae2:	2300      	movs	r3, #0
 8020ae4:	60fb      	str	r3, [r7, #12]
  user_process_t *running_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 8020ae6:	4b14      	ldr	r3, [pc, #80]	@ (8020b38 <schedular+0x5c>)
 8020ae8:	681b      	ldr	r3, [r3, #0]
 8020aea:	60bb      	str	r3, [r7, #8]

  picked_process = queue_front(&ready_queue);
 8020aec:	4813      	ldr	r0, [pc, #76]	@ (8020b3c <schedular+0x60>)
 8020aee:	f7ff ffc1 	bl	8020a74 <queue_front>
 8020af2:	60f8      	str	r0, [r7, #12]
  uint8_t status = queue_pop(&ready_queue);
 8020af4:	4811      	ldr	r0, [pc, #68]	@ (8020b3c <schedular+0x60>)
 8020af6:	f7ff ff7f 	bl	80209f8 <queue_pop>
 8020afa:	4603      	mov	r3, r0
 8020afc:	71fb      	strb	r3, [r7, #7]

  if (-1 == status || !picked_process)
 8020afe:	68fb      	ldr	r3, [r7, #12]
 8020b00:	2b00      	cmp	r3, #0
 8020b02:	d015      	beq.n	8020b30 <schedular+0x54>
    return;

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);
 8020b04:	4a0e      	ldr	r2, [pc, #56]	@ (8020b40 <schedular+0x64>)
 8020b06:	68fb      	ldr	r3, [r7, #12]
 8020b08:	6013      	str	r3, [r2, #0]
  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE &&
 8020b0a:	68bb      	ldr	r3, [r7, #8]
 8020b0c:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8020b0e:	2b02      	cmp	r3, #2
 8020b10:	d00a      	beq.n	8020b28 <schedular+0x4c>
      running_process->state != WAITING_STATE) {
 8020b12:	68bb      	ldr	r3, [r7, #8]
 8020b14:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
  if (running_process->state != SUSPEND_STATE &&
 8020b16:	2b03      	cmp	r3, #3
 8020b18:	d006      	beq.n	8020b28 <schedular+0x4c>
    queue_push(&ready_queue, running_process);
 8020b1a:	68b9      	ldr	r1, [r7, #8]
 8020b1c:	4807      	ldr	r0, [pc, #28]	@ (8020b3c <schedular+0x60>)
 8020b1e:	f7ff ff26 	bl	802096e <queue_push>
    running_process->state = READY_STATE;
 8020b22:	68bb      	ldr	r3, [r7, #8]
 8020b24:	2200      	movs	r2, #0
 8020b26:	62da      	str	r2, [r3, #44]	@ 0x2c
  }

  picked_process->state = RUNNING_STATE;
 8020b28:	68fb      	ldr	r3, [r7, #12]
 8020b2a:	2201      	movs	r2, #1
 8020b2c:	62da      	str	r2, [r3, #44]	@ 0x2c
 8020b2e:	e000      	b.n	8020b32 <schedular+0x56>
    return;
 8020b30:	bf00      	nop
}
 8020b32:	3710      	adds	r7, #16
 8020b34:	46bd      	mov	sp, r7
 8020b36:	bd80      	pop	{r7, pc}
 8020b38:	20016004 	.word	0x20016004
 8020b3c:	200003b8 	.word	0x200003b8
 8020b40:	20016008 	.word	0x20016008

08020b44 <semaphore_init>:
#include "core.h"

extern queue_t ready_queue;
extern uint8_t process_count;

void semaphore_init(semaphore_t *sema, uint8_t val) {
 8020b44:	b580      	push	{r7, lr}
 8020b46:	b082      	sub	sp, #8
 8020b48:	af00      	add	r7, sp, #0
 8020b4a:	6078      	str	r0, [r7, #4]
 8020b4c:	460b      	mov	r3, r1
 8020b4e:	70fb      	strb	r3, [r7, #3]
  sema->value = val; // unlocked
 8020b50:	687b      	ldr	r3, [r7, #4]
 8020b52:	78fa      	ldrb	r2, [r7, #3]
 8020b54:	701a      	strb	r2, [r3, #0]
  queue_init(&(sema->waiting_queue));
 8020b56:	687b      	ldr	r3, [r7, #4]
 8020b58:	3304      	adds	r3, #4
 8020b5a:	4618      	mov	r0, r3
 8020b5c:	f7ff fef2 	bl	8020944 <queue_init>
}
 8020b60:	bf00      	nop
 8020b62:	3708      	adds	r7, #8
 8020b64:	46bd      	mov	sp, r7
 8020b66:	bd80      	pop	{r7, pc}

08020b68 <semaphore_lock>:

/* this has to be atomic */
void semaphore_lock(semaphore_t *sema) {
 8020b68:	b580      	push	{r7, lr}
 8020b6a:	b084      	sub	sp, #16
 8020b6c:	af00      	add	r7, sp, #0
 8020b6e:	6078      	str	r0, [r7, #4]
  __ASM volatile ("cpsid i" : : : "memory");
 8020b70:	b672      	cpsid	i
}
 8020b72:	bf00      	nop
  __disable_irq();
  if (sema->value == 0) { // semaphore cannot be locked ...
 8020b74:	687b      	ldr	r3, [r7, #4]
 8020b76:	781b      	ldrb	r3, [r3, #0]
 8020b78:	2b00      	cmp	r3, #0
 8020b7a:	d110      	bne.n	8020b9e <semaphore_lock+0x36>
    user_process_t *running_process =
        *((user_process_t **)(RUNNING_PROCESS_AD));
 8020b7c:	4b0d      	ldr	r3, [pc, #52]	@ (8020bb4 <semaphore_lock+0x4c>)
    user_process_t *running_process =
 8020b7e:	681b      	ldr	r3, [r3, #0]
 8020b80:	60fb      	str	r3, [r7, #12]
    queue_push(&(sema->waiting_queue), running_process);
 8020b82:	687b      	ldr	r3, [r7, #4]
 8020b84:	3304      	adds	r3, #4
 8020b86:	68f9      	ldr	r1, [r7, #12]
 8020b88:	4618      	mov	r0, r3
 8020b8a:	f7ff fef0 	bl	802096e <queue_push>
    running_process->state = WAITING_STATE;
 8020b8e:	68fb      	ldr	r3, [r7, #12]
 8020b90:	2203      	movs	r2, #3
 8020b92:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* call PendSV_Handler for context switching */
    PendSV_Handler();
 8020b94:	f000 f8b8 	bl	8020d08 <PendSV_Handler>
  __ASM volatile ("cpsie i" : : : "memory");
 8020b98:	b662      	cpsie	i
}
 8020b9a:	bf00      	nop
//    schedular ();

    __enable_irq();
    return;
 8020b9c:	e007      	b.n	8020bae <semaphore_lock+0x46>
  }
  sema->value--;
 8020b9e:	687b      	ldr	r3, [r7, #4]
 8020ba0:	781b      	ldrb	r3, [r3, #0]
 8020ba2:	3b01      	subs	r3, #1
 8020ba4:	b2da      	uxtb	r2, r3
 8020ba6:	687b      	ldr	r3, [r7, #4]
 8020ba8:	701a      	strb	r2, [r3, #0]
  __ASM volatile ("cpsie i" : : : "memory");
 8020baa:	b662      	cpsie	i
}
 8020bac:	bf00      	nop
  __enable_irq();
}
 8020bae:	3710      	adds	r7, #16
 8020bb0:	46bd      	mov	sp, r7
 8020bb2:	bd80      	pop	{r7, pc}
 8020bb4:	20016004 	.word	0x20016004

08020bb8 <semaphore_unlock>:

void semaphore_unlock(semaphore_t *sema) {
 8020bb8:	b580      	push	{r7, lr}
 8020bba:	b084      	sub	sp, #16
 8020bbc:	af00      	add	r7, sp, #0
 8020bbe:	6078      	str	r0, [r7, #4]
  __ASM volatile ("cpsid i" : : : "memory");
 8020bc0:	b672      	cpsid	i
}
 8020bc2:	bf00      	nop
  __disable_irq();
  sema->value++;
 8020bc4:	687b      	ldr	r3, [r7, #4]
 8020bc6:	781b      	ldrb	r3, [r3, #0]
 8020bc8:	3301      	adds	r3, #1
 8020bca:	b2da      	uxtb	r2, r3
 8020bcc:	687b      	ldr	r3, [r7, #4]
 8020bce:	701a      	strb	r2, [r3, #0]
  /* unlocked */
  user_process_t *process = queue_front(&(sema->waiting_queue));
 8020bd0:	687b      	ldr	r3, [r7, #4]
 8020bd2:	3304      	adds	r3, #4
 8020bd4:	4618      	mov	r0, r3
 8020bd6:	f7ff ff4d 	bl	8020a74 <queue_front>
 8020bda:	60f8      	str	r0, [r7, #12]
  if (!process) {
 8020bdc:	68fb      	ldr	r3, [r7, #12]
 8020bde:	2b00      	cmp	r3, #0
 8020be0:	d102      	bne.n	8020be8 <semaphore_unlock+0x30>
  __ASM volatile ("cpsie i" : : : "memory");
 8020be2:	b662      	cpsie	i
}
 8020be4:	bf00      	nop
    /* no process is waiting */
    __enable_irq();
    return;
 8020be6:	e00d      	b.n	8020c04 <semaphore_unlock+0x4c>
  }
  queue_pop(&(sema->waiting_queue));
 8020be8:	687b      	ldr	r3, [r7, #4]
 8020bea:	3304      	adds	r3, #4
 8020bec:	4618      	mov	r0, r3
 8020bee:	f7ff ff03 	bl	80209f8 <queue_pop>
  process->state = READY_STATE;
 8020bf2:	68fb      	ldr	r3, [r7, #12]
 8020bf4:	2200      	movs	r2, #0
 8020bf6:	62da      	str	r2, [r3, #44]	@ 0x2c
  queue_push(&ready_queue, process);
 8020bf8:	68f9      	ldr	r1, [r7, #12]
 8020bfa:	4804      	ldr	r0, [pc, #16]	@ (8020c0c <semaphore_unlock+0x54>)
 8020bfc:	f7ff feb7 	bl	802096e <queue_push>
  __ASM volatile ("cpsie i" : : : "memory");
 8020c00:	b662      	cpsie	i
}
 8020c02:	bf00      	nop
  __enable_irq();
}
 8020c04:	3710      	adds	r7, #16
 8020c06:	46bd      	mov	sp, r7
 8020c08:	bd80      	pop	{r7, pc}
 8020c0a:	bf00      	nop
 8020c0c:	200003b8 	.word	0x200003b8

08020c10 <__usart1_init>:
#include "core.h"
#include "usart.h"

void __usart1_init(void) {
 8020c10:	b480      	push	{r7}
 8020c12:	af00      	add	r7, sp, #0

  RCC->APB2ENR |= RCC_APB2ENR_USART1EN_Msk;
 8020c14:	4b1c      	ldr	r3, [pc, #112]	@ (8020c88 <__usart1_init+0x78>)
 8020c16:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 8020c18:	4a1b      	ldr	r2, [pc, #108]	@ (8020c88 <__usart1_init+0x78>)
 8020c1a:	f043 0310 	orr.w	r3, r3, #16
 8020c1e:	6453      	str	r3, [r2, #68]	@ 0x44
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
 8020c20:	4b19      	ldr	r3, [pc, #100]	@ (8020c88 <__usart1_init+0x78>)
 8020c22:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8020c24:	4a18      	ldr	r2, [pc, #96]	@ (8020c88 <__usart1_init+0x78>)
 8020c26:	f043 0301 	orr.w	r3, r3, #1
 8020c2a:	6313      	str	r3, [r2, #48]	@ 0x30
  // alternate function mode
  GPIOA->MODER &= ~((3 << (2 * TX_PIN)) | (3 << (2 * RX_PIN)));
 8020c2c:	4b17      	ldr	r3, [pc, #92]	@ (8020c8c <__usart1_init+0x7c>)
 8020c2e:	681b      	ldr	r3, [r3, #0]
 8020c30:	4a16      	ldr	r2, [pc, #88]	@ (8020c8c <__usart1_init+0x7c>)
 8020c32:	f423 1370 	bic.w	r3, r3, #3932160	@ 0x3c0000
 8020c36:	6013      	str	r3, [r2, #0]
  GPIOA->MODER |= 2 << (2 * TX_PIN) | 2 << (2 * RX_PIN);
 8020c38:	4b14      	ldr	r3, [pc, #80]	@ (8020c8c <__usart1_init+0x7c>)
 8020c3a:	681b      	ldr	r3, [r3, #0]
 8020c3c:	4a13      	ldr	r2, [pc, #76]	@ (8020c8c <__usart1_init+0x7c>)
 8020c3e:	f443 1320 	orr.w	r3, r3, #2621440	@ 0x280000
 8020c42:	6013      	str	r3, [r2, #0]
  // high speed
  GPIOA->OSPEEDR |= (3 << (TX_PIN * 2)) | (3 << (RX_PIN * 2));
 8020c44:	4b11      	ldr	r3, [pc, #68]	@ (8020c8c <__usart1_init+0x7c>)
 8020c46:	689b      	ldr	r3, [r3, #8]
 8020c48:	4a10      	ldr	r2, [pc, #64]	@ (8020c8c <__usart1_init+0x7c>)
 8020c4a:	f443 1370 	orr.w	r3, r3, #3932160	@ 0x3c0000
 8020c4e:	6093      	str	r3, [r2, #8]
  // clear the bits in AFR register
  GPIOA->AFR[1] &= ~((0xf << 4) | (0xf << 8));
 8020c50:	4b0e      	ldr	r3, [pc, #56]	@ (8020c8c <__usart1_init+0x7c>)
 8020c52:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020c54:	4a0d      	ldr	r2, [pc, #52]	@ (8020c8c <__usart1_init+0x7c>)
 8020c56:	f423 637f 	bic.w	r3, r3, #4080	@ 0xff0
 8020c5a:	6253      	str	r3, [r2, #36]	@ 0x24
  // set for af7
  GPIOA->AFR[1] |= (7 << 4) | (7 << 8);
 8020c5c:	4b0b      	ldr	r3, [pc, #44]	@ (8020c8c <__usart1_init+0x7c>)
 8020c5e:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020c60:	4a0a      	ldr	r2, [pc, #40]	@ (8020c8c <__usart1_init+0x7c>)
 8020c62:	f443 63ee 	orr.w	r3, r3, #1904	@ 0x770
 8020c66:	6253      	str	r3, [r2, #36]	@ 0x24

  // enable usart, reciever, transiever
  USART1->CR1 |= USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
 8020c68:	4b09      	ldr	r3, [pc, #36]	@ (8020c90 <__usart1_init+0x80>)
 8020c6a:	68db      	ldr	r3, [r3, #12]
 8020c6c:	4a08      	ldr	r2, [pc, #32]	@ (8020c90 <__usart1_init+0x80>)
 8020c6e:	f443 5300 	orr.w	r3, r3, #8192	@ 0x2000
 8020c72:	f043 030c 	orr.w	r3, r3, #12
 8020c76:	60d3      	str	r3, [r2, #12]
  // set the baud rate (115200 in this case)
  USART1->BRR = 0x08B;
 8020c78:	4b05      	ldr	r3, [pc, #20]	@ (8020c90 <__usart1_init+0x80>)
 8020c7a:	228b      	movs	r2, #139	@ 0x8b
 8020c7c:	609a      	str	r2, [r3, #8]
}
 8020c7e:	bf00      	nop
 8020c80:	46bd      	mov	sp, r7
 8020c82:	bc80      	pop	{r7}
 8020c84:	4770      	bx	lr
 8020c86:	bf00      	nop
 8020c88:	40023800 	.word	0x40023800
 8020c8c:	40020000 	.word	0x40020000
 8020c90:	40011000 	.word	0x40011000

08020c94 <__usart1_print>:

void __usart1_print(const char *msg, uint32_t size) {
 8020c94:	b480      	push	{r7}
 8020c96:	b085      	sub	sp, #20
 8020c98:	af00      	add	r7, sp, #0
 8020c9a:	6078      	str	r0, [r7, #4]
 8020c9c:	6039      	str	r1, [r7, #0]

  // semaphore_lock(&sem_usart1);
  //enterCRITICAL();
  int i = 0;
 8020c9e:	2300      	movs	r3, #0
 8020ca0:	60fb      	str	r3, [r7, #12]
  while (i < size && msg[i] != '\0') {
 8020ca2:	e00f      	b.n	8020cc4 <__usart1_print+0x30>
    while (!(USART1->SR & USART_SR_TXE))
 8020ca4:	bf00      	nop
 8020ca6:	4b13      	ldr	r3, [pc, #76]	@ (8020cf4 <__usart1_print+0x60>)
 8020ca8:	681b      	ldr	r3, [r3, #0]
 8020caa:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8020cae:	2b00      	cmp	r3, #0
 8020cb0:	d0f9      	beq.n	8020ca6 <__usart1_print+0x12>
      ;
    USART1->DR = msg[i++];
 8020cb2:	68fb      	ldr	r3, [r7, #12]
 8020cb4:	1c5a      	adds	r2, r3, #1
 8020cb6:	60fa      	str	r2, [r7, #12]
 8020cb8:	461a      	mov	r2, r3
 8020cba:	687b      	ldr	r3, [r7, #4]
 8020cbc:	4413      	add	r3, r2
 8020cbe:	781a      	ldrb	r2, [r3, #0]
 8020cc0:	4b0c      	ldr	r3, [pc, #48]	@ (8020cf4 <__usart1_print+0x60>)
 8020cc2:	605a      	str	r2, [r3, #4]
  while (i < size && msg[i] != '\0') {
 8020cc4:	68fb      	ldr	r3, [r7, #12]
 8020cc6:	683a      	ldr	r2, [r7, #0]
 8020cc8:	429a      	cmp	r2, r3
 8020cca:	d905      	bls.n	8020cd8 <__usart1_print+0x44>
 8020ccc:	68fb      	ldr	r3, [r7, #12]
 8020cce:	687a      	ldr	r2, [r7, #4]
 8020cd0:	4413      	add	r3, r2
 8020cd2:	781b      	ldrb	r3, [r3, #0]
 8020cd4:	2b00      	cmp	r3, #0
 8020cd6:	d1e5      	bne.n	8020ca4 <__usart1_print+0x10>
  }
  while (!(USART1->SR & USART_SR_TC)) {
 8020cd8:	bf00      	nop
 8020cda:	4b06      	ldr	r3, [pc, #24]	@ (8020cf4 <__usart1_print+0x60>)
 8020cdc:	681b      	ldr	r3, [r3, #0]
 8020cde:	f003 0340 	and.w	r3, r3, #64	@ 0x40
 8020ce2:	2b00      	cmp	r3, #0
 8020ce4:	d0f9      	beq.n	8020cda <__usart1_print+0x46>
  }
  //exitCRITICAL();
  // semaphore_unlock(&sem_usart1);
}
 8020ce6:	bf00      	nop
 8020ce8:	bf00      	nop
 8020cea:	3714      	adds	r7, #20
 8020cec:	46bd      	mov	sp, r7
 8020cee:	bc80      	pop	{r7}
 8020cf0:	4770      	bx	lr
 8020cf2:	bf00      	nop
 8020cf4:	40011000 	.word	0x40011000

08020cf8 <Reset_Handler>:
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
 8020cf8:	f7ff fa22 	bl	8020140 <resetHandlerHelper>
    B main
 8020cfc:	f7ff bc46 	b.w	802058c <main>

08020d00 <hang>:
hang:
    B .
 8020d00:	e7fe      	b.n	8020d00 <hang>

08020d02 <Default_Handler>:

.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .
 8020d02:	e7fe      	b.n	8020d02 <Default_Handler>

08020d04 <NMI_Handler>:

.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .
 8020d04:	e7fe      	b.n	8020d04 <NMI_Handler>

08020d06 <DebugMon_Handler>:

.section .text.DebugMon_Handler
.global DebugMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .
 8020d06:	e7fe      	b.n	8020d06 <DebugMon_Handler>

08020d08 <PendSV_Handler>:
.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    cpsid i
 8020d08:	b672      	cpsid	i

    push {lr}
 8020d0a:	b500      	push	{lr}
    bl schedular
 8020d0c:	f7ff fee6 	bl	8020adc <schedular>
    pop {lr}
 8020d10:	f85d eb04 	ldr.w	lr, [sp], #4

    /************************ start saving reg*********************************/
    ldr r0, =RUNNING_PROCESS
 8020d14:	4813      	ldr	r0, [pc, #76]	@ (8020d64 <PendSV_Handler+0x5c>)
    ldr r1, [r0]            // r1 now contain the struct address
 8020d16:	6801      	ldr	r1, [r0, #0]
    

    stmia r1!, {r4-r11}     // r4->r11 stored in the runnging process struct
 8020d18:	e8a1 0ff0 	stmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}

    mrs r0, psp
 8020d1c:	f3ef 8009 	mrs	r0, PSP
    str r0, [r1]
 8020d20:	6008      	str	r0, [r1, #0]
    add r1, #4
 8020d22:	f101 0104 	add.w	r1, r1, #4
    
    mrs r0, msp
 8020d26:	f3ef 8008 	mrs	r0, MSP
    str r0, [r1]
 8020d2a:	6008      	str	r0, [r1, #0]
    add r1, #4
 8020d2c:	f101 0104 	add.w	r1, r1, #4
    
    str lr, [r1]            // important !!! store the exec_return value
 8020d30:	f8c1 e000 	str.w	lr, [r1]
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
 8020d34:	480c      	ldr	r0, [pc, #48]	@ (8020d68 <PendSV_Handler+0x60>)
    ldr r1, [r0]
 8020d36:	6801      	ldr	r1, [r0, #0]
    ldmia r1!, {r4-r11}
 8020d38:	e8b1 0ff0 	ldmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
   

    /* before setting psp, msp, faultmask, basepri -> mask all interrupt
    so that no interrupt can be fired in the middle of setting important regs*/

    ldr r0, [r1]
 8020d3c:	6808      	ldr	r0, [r1, #0]
    msr psp, r0
 8020d3e:	f380 8809 	msr	PSP, r0
    add r1, #4
 8020d42:	f101 0104 	add.w	r1, r1, #4
    
    ldr r0, [r1]
 8020d46:	6808      	ldr	r0, [r1, #0]
    msr msp, r0
 8020d48:	f380 8808 	msr	MSP, r0
    add r1, #4
 8020d4c:	f101 0104 	add.w	r1, r1, #4
    
    ldr lr, [r1]
 8020d50:	f8d1 e000 	ldr.w	lr, [r1]

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
 8020d54:	4804      	ldr	r0, [pc, #16]	@ (8020d68 <PendSV_Handler+0x60>)
    ldr r1, =RUNNING_PROCESS
 8020d56:	4903      	ldr	r1, [pc, #12]	@ (8020d64 <PendSV_Handler+0x5c>)
    ldr r2, [r0]
 8020d58:	6802      	ldr	r2, [r0, #0]
    str r2, [r1]
 8020d5a:	600a      	str	r2, [r1, #0]
    
    dsb
 8020d5c:	f3bf 8f4f 	dsb	sy

    cpsie i
 8020d60:	b662      	cpsie	i

    bx lr
 8020d62:	4770      	bx	lr
    ldr r0, =RUNNING_PROCESS
 8020d64:	20016004 	.word	0x20016004
    ldr r0, =PICKED_PROCESS
 8020d68:	20016008 	.word	0x20016008

08020d6c <SysTick_Handler>:
    caller saved register it will be recovered before returning from the isr*/
    

    /*****************set the PendSV interrupt*********************/
    
    ldr r0, =0xE000ED04      // Address of ICSR register
 8020d6c:	4802      	ldr	r0, [pc, #8]	@ (8020d78 <SysTick_Handler+0xc>)
    ldr r1, =0x10000000      // Bit 28 (PENDSVSET)
 8020d6e:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
    str r1, [r0]             // Set PendSV pending
 8020d72:	6001      	str	r1, [r0, #0]


    bx lr
 8020d74:	4770      	bx	lr
 8020d76:	0000      	.short	0x0000
    ldr r0, =0xE000ED04      // Address of ICSR register
 8020d78:	e000ed04 	.word	0xe000ed04

08020d7c <SVC_Handler>:
.section .text.SVC_Handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler:
    /* r0, r1, r2, r3 stores the arguments of systemcall */
    push {r0, r1, r2, r3}
 8020d7c:	b40f      	push	{r0, r1, r2, r3}

    tst lr, #4
 8020d7e:	f01e 0f04 	tst.w	lr, #4
    ite eq
 8020d82:	bf0c      	ite	eq
    mrseq r0, msp
 8020d84:	f3ef 8008 	mrseq	r0, MSP
    mrsne r0, psp
 8020d88:	f3ef 8009 	mrsne	r0, PSP

    add r0, #24 /* retrieve the old pc that is stacked*/
 8020d8c:	f100 0018 	add.w	r0, r0, #24
    ldr r1, [r0]
 8020d90:	6801      	ldr	r1, [r0, #0]
    sub r1, #2      /*move 2 bytes before to get the scv immidiate*/
 8020d92:	f1a1 0102 	sub.w	r1, r1, #2
    ldrb r0, [r1]   /*r0 now contains the immidiate value*/
 8020d96:	7808      	ldrb	r0, [r1, #0]

    
    ldr r2, =SYSCALL_TABLE_AD
 8020d98:	4a07      	ldr	r2, [pc, #28]	@ (8020db8 <SVC_Handler+0x3c>)
    ldr r1, [r2]            // r1 contains the address of syscall_table
 8020d9a:	6811      	ldr	r1, [r2, #0]
                            // r0 contains the immidate value
    
    mov r3, #4
 8020d9c:	f04f 0304 	mov.w	r3, #4
    mul r0, r3 
 8020da0:	fb03 f000 	mul.w	r0, r3, r0
    add r1, r0 
 8020da4:	4401      	add	r1, r0

    mov r12, r1            // store the address of service function in r12
 8020da6:	468c      	mov	ip, r1
    ldr r12, [r12]
 8020da8:	f8dc c000 	ldr.w	ip, [ip]

    pop {r0, r1, r2, r3}
 8020dac:	bc0f      	pop	{r0, r1, r2, r3}

    push {lr}
 8020dae:	b500      	push	{lr}
    blx r12
 8020db0:	47e0      	blx	ip
    pop {lr}
 8020db2:	f85d eb04 	ldr.w	lr, [sp], #4


    bx lr
 8020db6:	4770      	bx	lr
    ldr r2, =SYSCALL_TABLE_AD
 8020db8:	2001600c 	.word	0x2001600c

08020dbc <BusFault_Handler>:
// r0 -> pc, r1 -> fault type, r2 -> fault in kernel / userproc
.section .text.BusFault_Handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler:
    ldr r0, =0xfffffffd
 8020dbc:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0
 8020dc0:	4586      	cmp	lr, r0
    ittee eq 
 8020dc2:	bf07      	ittee	eq
    mrseq r0, psp
 8020dc4:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8020dc8:	2200      	moveq	r2, #0
    mrsne r0, msp
 8020dca:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8020dce:	2201      	movne	r2, #1

    /* find pc */
    ldr r0, [r0, #24]
 8020dd0:	6980      	ldr	r0, [r0, #24]
    mov r1, BusFault_Identifier
 8020dd2:	f04f 0100 	mov.w	r1, #0
    push {lr}
 8020dd6:	b500      	push	{lr}
    bl fault_handler_helper
 8020dd8:	f7ff fa18 	bl	802020c <fault_handler_helper>
    pop {lr}
 8020ddc:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8020de0:	4770      	bx	lr

08020de2 <MemManage_Handler>:
/***********************MemManage_Handler start************************/
.section .text.MemManage_Handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler:
    ldr r0, =0xfffffffd 
 8020de2:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8020de6:	4586      	cmp	lr, r0

    ittee eq 
 8020de8:	bf07      	ittee	eq
    mrseq r0, psp
 8020dea:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8020dee:	2200      	moveq	r2, #0
    mrsne r0, msp
 8020df0:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8020df4:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8020df6:	6980      	ldr	r0, [r0, #24]
    mov r1, MemManage_Identifier
 8020df8:	f04f 0101 	mov.w	r1, #1
    push {lr}
 8020dfc:	b500      	push	{lr}
    bl fault_handler_helper
 8020dfe:	f7ff fa05 	bl	802020c <fault_handler_helper>
    pop {lr}
 8020e02:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8020e06:	4770      	bx	lr

08020e08 <UsageFault_Handler>:

.section .text.UsageFault_Handler
.global UsageFault_Handler 
.type UsageFault_Handler, %function
UsageFault_Handler:
    ldr r0, =0xfffffffd 
 8020e08:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8020e0c:	4586      	cmp	lr, r0

    ittee eq 
 8020e0e:	bf07      	ittee	eq
    mrseq r0, psp
 8020e10:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8020e14:	2200      	moveq	r2, #0
    mrsne r0, msp
 8020e16:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8020e1a:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8020e1c:	6980      	ldr	r0, [r0, #24]
    mov r1, UsageFault_Identifier
 8020e1e:	f04f 0102 	mov.w	r1, #2
    push {lr}
 8020e22:	b500      	push	{lr}
    bl fault_handler_helper
 8020e24:	f7ff f9f2 	bl	802020c <fault_handler_helper>
    pop {lr}
 8020e28:	f85d eb04 	ldr.w	lr, [sp], #4
    
    bx lr
 8020e2c:	4770      	bx	lr
	...

08020e30 <HardFault_Handler>:
.section .text.HardFault_Handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler:

    ldr r0, =0xfffffffd 
 8020e30:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8020e34:	4586      	cmp	lr, r0
    ite eq 
 8020e36:	bf0c      	ite	eq
    mrseq r0, psp
 8020e38:	f3ef 8009 	mrseq	r0, PSP
    mrsne r0, msp
 8020e3c:	f3ef 8008 	mrsne	r0, MSP
    
    /* find pc */
    ldr r0, [r0, #24]
 8020e40:	6980      	ldr	r0, [r0, #24]
    
    /* after getting the pc, msp can be safely altered !!!*/
    ldr r1, =_estack
 8020e42:	4904      	ldr	r1, [pc, #16]	@ (8020e54 <HardFault_Handler+0x24>)
    msr msp, r1
 8020e44:	f381 8808 	msr	MSP, r1

    push {lr}
 8020e48:	b500      	push	{lr}
    bl HardFault_Handler_helper
 8020e4a:	f7ff fa63 	bl	8020314 <HardFault_Handler_helper>
    pop {lr}
 8020e4e:	f85d eb04 	ldr.w	lr, [sp], #4

    b .
 8020e52:	e7fe      	b.n	8020e52 <HardFault_Handler+0x22>
    ldr r1, =_estack
 8020e54:	20018000 	.word	0x20018000

08020e58 <__asm__set_psp>:

.global __asm__set_psp
.type __asm__set_psp, %function 
__asm__set_psp:
    /* r0 contains the argument*/
    msr psp, r0
 8020e58:	f380 8809 	msr	PSP, r0
    bx lr
 8020e5c:	4770      	bx	lr

08020e5e <__asm__set_msp>:

.global __asm__set_msp
.type __asm__set_msp, %function
__asm__set_msp:
    /* r0 contains the argument*/
    msr msp, r0
 8020e5e:	f380 8808 	msr	MSP, r0
    bx lr
 8020e62:	4770      	bx	lr

Disassembly of section .usertext:

08021270 <main1-0xed90>:
	...

08030000 <main1>:
#include "kernel_api.h"

USER_CODE int main1(void) {
 8030000:	b580      	push	{r7, lr}
 8030002:	af00      	add	r7, sp, #0
  while (1) {

    user_printf("hello from main1.c\n\r", 0x0);
 8030004:	2100      	movs	r1, #0
 8030006:	4806      	ldr	r0, [pc, #24]	@ (8030020 <main1+0x20>)
 8030008:	f000 f8a4 	bl	8030154 <user_printf>
    user_printf("hello from main1.c second time\n\r", 0x0);
 803000c:	2100      	movs	r1, #0
 803000e:	4805      	ldr	r0, [pc, #20]	@ (8030024 <main1+0x24>)
 8030010:	f000 f8a0 	bl	8030154 <user_printf>
    user_printf("hello from main1.c third time\n\r", 0x0);
 8030014:	2100      	movs	r1, #0
 8030016:	4804      	ldr	r0, [pc, #16]	@ (8030028 <main1+0x28>)
 8030018:	f000 f89c 	bl	8030154 <user_printf>
    user_printf("hello from main1.c\n\r", 0x0);
 803001c:	e7f2      	b.n	8030004 <main1+0x4>
 803001e:	bf00      	nop
 8030020:	08021054 	.word	0x08021054
 8030024:	0802106c 	.word	0x0802106c
 8030028:	08021090 	.word	0x08021090

0803002c <main10>:
#include "kernel_api.h"

USER_CODE int main10 (void){
 803002c:	b580      	push	{r7, lr}
 803002e:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main10.c\n\r", 0x0);
 8030030:	2100      	movs	r1, #0
 8030032:	4802      	ldr	r0, [pc, #8]	@ (803003c <main10+0x10>)
 8030034:	f000 f88e 	bl	8030154 <user_printf>
 8030038:	e7fa      	b.n	8030030 <main10+0x4>
 803003a:	bf00      	nop
 803003c:	080210b0 	.word	0x080210b0

08030040 <main11>:
#include "kernel_api.h"

USER_CODE int main11 (void){
 8030040:	b580      	push	{r7, lr}
 8030042:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main11.c\n\r", 0x0);
 8030044:	2100      	movs	r1, #0
 8030046:	4802      	ldr	r0, [pc, #8]	@ (8030050 <main11+0x10>)
 8030048:	f000 f884 	bl	8030154 <user_printf>
 803004c:	e7fa      	b.n	8030044 <main11+0x4>
 803004e:	bf00      	nop
 8030050:	080210d0 	.word	0x080210d0

08030054 <main12>:
#include "kernel_api.h"

USER_CODE int main12 (void){
 8030054:	b580      	push	{r7, lr}
 8030056:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main12.c\n\r", 0x0);
 8030058:	2100      	movs	r1, #0
 803005a:	4802      	ldr	r0, [pc, #8]	@ (8030064 <main12+0x10>)
 803005c:	f000 f87a 	bl	8030154 <user_printf>
 8030060:	e7fa      	b.n	8030058 <main12+0x4>
 8030062:	bf00      	nop
 8030064:	080210f0 	.word	0x080210f0

08030068 <main13>:
#include "kernel_api.h"

USER_CODE int main13 (void){
 8030068:	b580      	push	{r7, lr}
 803006a:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main13.c\n\r", 0x0);
 803006c:	2100      	movs	r1, #0
 803006e:	4802      	ldr	r0, [pc, #8]	@ (8030078 <main13+0x10>)
 8030070:	f000 f870 	bl	8030154 <user_printf>
 8030074:	e7fa      	b.n	803006c <main13+0x4>
 8030076:	bf00      	nop
 8030078:	08021110 	.word	0x08021110

0803007c <main14>:
#include "kernel_api.h"

USER_CODE int main14 (void){
 803007c:	b580      	push	{r7, lr}
 803007e:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main14.c\n\r", 0x0);
 8030080:	2100      	movs	r1, #0
 8030082:	4802      	ldr	r0, [pc, #8]	@ (803008c <main14+0x10>)
 8030084:	f000 f866 	bl	8030154 <user_printf>
 8030088:	e7fa      	b.n	8030080 <main14+0x4>
 803008a:	bf00      	nop
 803008c:	08021130 	.word	0x08021130

08030090 <main15>:
#include "kernel_api.h"

USER_CODE int main15 (void){
 8030090:	b580      	push	{r7, lr}
 8030092:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main15.c\n\r", 0x0);
 8030094:	2100      	movs	r1, #0
 8030096:	4802      	ldr	r0, [pc, #8]	@ (80300a0 <main15+0x10>)
 8030098:	f000 f85c 	bl	8030154 <user_printf>
 803009c:	e7fa      	b.n	8030094 <main15+0x4>
 803009e:	bf00      	nop
 80300a0:	08021150 	.word	0x08021150

080300a4 <main2>:
#include "kernel_api.h"

USER_CODE int main2(void) {
 80300a4:	b580      	push	{r7, lr}
 80300a6:	af00      	add	r7, sp, #0

  while (1) {
    user_printf("((((((((((hello from main2.c\n\r", 0x0);
 80300a8:	2100      	movs	r1, #0
 80300aa:	4802      	ldr	r0, [pc, #8]	@ (80300b4 <main2+0x10>)
 80300ac:	f000 f852 	bl	8030154 <user_printf>
 80300b0:	e7fa      	b.n	80300a8 <main2+0x4>
 80300b2:	bf00      	nop
 80300b4:	08021170 	.word	0x08021170

080300b8 <main3>:
#include "kernel_api.h"

USER_CODE int main3 (void){
 80300b8:	b580      	push	{r7, lr}
 80300ba:	af00      	add	r7, sp, #0
    while (1){
        user_printf (">>>>>>>>>>hello from main3.c\n\r", 0x0);
 80300bc:	2100      	movs	r1, #0
 80300be:	4802      	ldr	r0, [pc, #8]	@ (80300c8 <main3+0x10>)
 80300c0:	f000 f848 	bl	8030154 <user_printf>
 80300c4:	e7fa      	b.n	80300bc <main3+0x4>
 80300c6:	bf00      	nop
 80300c8:	08021190 	.word	0x08021190

080300cc <main4>:
#include "kernel_api.h"
USER_CODE int main4 (void){
 80300cc:	b580      	push	{r7, lr}
 80300ce:	af00      	add	r7, sp, #0

    while (1)
    user_printf("++++++++++hello from main4.c\n\r", 0x0);
 80300d0:	2100      	movs	r1, #0
 80300d2:	4802      	ldr	r0, [pc, #8]	@ (80300dc <main4+0x10>)
 80300d4:	f000 f83e 	bl	8030154 <user_printf>
 80300d8:	e7fa      	b.n	80300d0 <main4+0x4>
 80300da:	bf00      	nop
 80300dc:	080211b0 	.word	0x080211b0

080300e0 <main5>:
#include "kernel_api.h"

USER_CODE int main5 (void){
 80300e0:	b580      	push	{r7, lr}
 80300e2:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main5.c\n\r", 0x0);
 80300e4:	2100      	movs	r1, #0
 80300e6:	4802      	ldr	r0, [pc, #8]	@ (80300f0 <main5+0x10>)
 80300e8:	f000 f834 	bl	8030154 <user_printf>
 80300ec:	e7fa      	b.n	80300e4 <main5+0x4>
 80300ee:	bf00      	nop
 80300f0:	080211d0 	.word	0x080211d0

080300f4 <main6>:
#include "kernel_api.h"

USER_CODE int main6 (void){
 80300f4:	b580      	push	{r7, lr}
 80300f6:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("@@@@@@@@@@hello from main6.c\n\r", 0x0);
 80300f8:	2100      	movs	r1, #0
 80300fa:	4802      	ldr	r0, [pc, #8]	@ (8030104 <main6+0x10>)
 80300fc:	f000 f82a 	bl	8030154 <user_printf>
 8030100:	e7fa      	b.n	80300f8 <main6+0x4>
 8030102:	bf00      	nop
 8030104:	080211f0 	.word	0x080211f0

08030108 <main7>:
#include "kernel_api.h"

USER_CODE int main7 (void){
 8030108:	b580      	push	{r7, lr}
 803010a:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("@@@@@@@@@@hello from main5.c\n\r", 0x0);
 803010c:	2100      	movs	r1, #0
 803010e:	4802      	ldr	r0, [pc, #8]	@ (8030118 <main7+0x10>)
 8030110:	f000 f820 	bl	8030154 <user_printf>
 8030114:	e7fa      	b.n	803010c <main7+0x4>
 8030116:	bf00      	nop
 8030118:	08021210 	.word	0x08021210

0803011c <main8>:
#include "kernel_api.h"

USER_CODE int main8 (void){
 803011c:	b580      	push	{r7, lr}
 803011e:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main8.c\n\r", 0x0);
 8030120:	2100      	movs	r1, #0
 8030122:	4802      	ldr	r0, [pc, #8]	@ (803012c <main8+0x10>)
 8030124:	f000 f816 	bl	8030154 <user_printf>
 8030128:	e7fa      	b.n	8030120 <main8+0x4>
 803012a:	bf00      	nop
 803012c:	08021230 	.word	0x08021230

08030130 <main9>:
#include "kernel_api.h"

USER_CODE int main9 (void){
 8030130:	b580      	push	{r7, lr}
 8030132:	af00      	add	r7, sp, #0
    
    while (1){
        user_printf ("==========hello from main9.c\n\r", 0x0);
 8030134:	2100      	movs	r1, #0
 8030136:	4802      	ldr	r0, [pc, #8]	@ (8030140 <main9+0x10>)
 8030138:	f000 f80c 	bl	8030154 <user_printf>
 803013c:	e7fa      	b.n	8030134 <main9+0x4>
 803013e:	bf00      	nop
 8030140:	08021250 	.word	0x08021250

08030144 <__asm__launch_main1>:
 8030144:	f04f 0003 	mov.w	r0, #3
 8030148:	f380 8814 	msr	CONTROL, r0
 803014c:	f3bf 8f6f 	isb	sy
 8030150:	f7ff ff56 	bl	8030000 <main1>

08030154 <user_printf>:
 8030154:	df00      	svc	0
 8030156:	4770      	bx	lr
