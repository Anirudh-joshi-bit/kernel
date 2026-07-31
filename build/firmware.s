
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
 80201ec:	080212bf 	.word	0x080212bf
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
 8020224:	f000 fbe8 	bl	80209f8 <printf>
    if (SCB->CFSR & SCB_CFSR_BFARVALID_Msk)
 8020228:	4b2c      	ldr	r3, [pc, #176]	@ (80202dc <fault_handler_helper+0xd0>)
 802022a:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 802022c:	f403 4300 	and.w	r3, r3, #32768	@ 0x8000
 8020230:	2b00      	cmp	r3, #0
 8020232:	d01f      	beq.n	8020274 <fault_handler_helper+0x68>
      printf("busfault address -> %\n\r", (uint32_t)(&SCB->BFAR));
 8020234:	492a      	ldr	r1, [pc, #168]	@ (80202e0 <fault_handler_helper+0xd4>)
 8020236:	482b      	ldr	r0, [pc, #172]	@ (80202e4 <fault_handler_helper+0xd8>)
 8020238:	f000 fbde 	bl	80209f8 <printf>
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
 8020248:	f000 fbd6 	bl	80209f8 <printf>
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
 8020260:	f000 fbca 	bl	80209f8 <printf>
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
 8020270:	f000 fbc2 	bl	80209f8 <printf>
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
 802027e:	f000 fbbb 	bl	80209f8 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("PC -> %\n\r", (uint32_t)&pc);
 8020282:	f107 030c 	add.w	r3, r7, #12
 8020286:	4619      	mov	r1, r3
 8020288:	481c      	ldr	r0, [pc, #112]	@ (80202fc <fault_handler_helper+0xf0>)
 802028a:	f000 fbb5 	bl	80209f8 <printf>
  printf("instruction that caused the fault-> %\n\r", (uint32_t)(&instruction));
 802028e:	f107 0314 	add.w	r3, r7, #20
 8020292:	4619      	mov	r1, r3
 8020294:	481a      	ldr	r0, [pc, #104]	@ (8020300 <fault_handler_helper+0xf4>)
 8020296:	f000 fbaf 	bl	80209f8 <printf>

  /* KERNEL PANIC if fault in kernel
   * PROCESSES TERMINATION if fault in user process */

  if (fault_place == FAULT_IN_KERNEL) {
 802029a:	687b      	ldr	r3, [r7, #4]
 802029c:	2b01      	cmp	r3, #1
 802029e:	d104      	bne.n	80202aa <fault_handler_helper+0x9e>
    printf("\n\n\rKERNEL PANIC......\n\n\r", 0x0);
 80202a0:	2100      	movs	r1, #0
 80202a2:	4818      	ldr	r0, [pc, #96]	@ (8020304 <fault_handler_helper+0xf8>)
 80202a4:	f000 fba8 	bl	80209f8 <printf>
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
 80202b4:	f000 fba0 	bl	80209f8 <printf>
    printf("reason -> fault", 0x0);
 80202b8:	2100      	movs	r1, #0
 80202ba:	4814      	ldr	r0, [pc, #80]	@ (802030c <fault_handler_helper+0x100>)
 80202bc:	f000 fb9c 	bl	80209f8 <printf>

    (*(user_process_t **)(RUNNING_PROCESS_AD))->state = SUSPEND_STATE;
 80202c0:	4b13      	ldr	r3, [pc, #76]	@ (8020310 <fault_handler_helper+0x104>)
 80202c2:	681b      	ldr	r3, [r3, #0]
 80202c4:	2202      	movs	r2, #2
 80202c6:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* trigger context switching*/
    PendSV_Handler();
 80202c8:	f000 fd46 	bl	8020d58 <PendSV_Handler>
 80202cc:	e000      	b.n	80202d0 <fault_handler_helper+0xc4>
    return;
 80202ce:	bf00      	nop
  }
}
 80202d0:	3718      	adds	r7, #24
 80202d2:	46bd      	mov	sp, r7
 80202d4:	bd80      	pop	{r7, pc}
 80202d6:	bf00      	nop
 80202d8:	08020eb4 	.word	0x08020eb4
 80202dc:	e000ed00 	.word	0xe000ed00
 80202e0:	e000ed38 	.word	0xe000ed38
 80202e4:	08020ec4 	.word	0x08020ec4
 80202e8:	08020edc 	.word	0x08020edc
 80202ec:	08020efc 	.word	0x08020efc
 80202f0:	08020f24 	.word	0x08020f24
 80202f4:	e000ed28 	.word	0xe000ed28
 80202f8:	08020f34 	.word	0x08020f34
 80202fc:	08020f64 	.word	0x08020f64
 8020300:	08020f70 	.word	0x08020f70
 8020304:	08020f98 	.word	0x08020f98
 8020308:	08020fb4 	.word	0x08020fb4
 802030c:	08020fd4 	.word	0x08020fd4
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
 8020326:	f000 fb67 	bl	80209f8 <printf>
  printf("configrable fault status reg (SCB->CFSR) => %\n\r",
 802032a:	490c      	ldr	r1, [pc, #48]	@ (802035c <HardFault_Handler_helper+0x48>)
 802032c:	480c      	ldr	r0, [pc, #48]	@ (8020360 <HardFault_Handler_helper+0x4c>)
 802032e:	f000 fb63 	bl	80209f8 <printf>
         (uint32_t)(&SCB->CFSR));
  printf("Hard Fault Status Register -> %\n\r", (uint32_t)(&SCB->HFSR));
 8020332:	490c      	ldr	r1, [pc, #48]	@ (8020364 <HardFault_Handler_helper+0x50>)
 8020334:	480c      	ldr	r0, [pc, #48]	@ (8020368 <HardFault_Handler_helper+0x54>)
 8020336:	f000 fb5f 	bl	80209f8 <printf>
  printf("PC -> %\n\r", (uint32_t)(&pc));
 802033a:	1d3b      	adds	r3, r7, #4
 802033c:	4619      	mov	r1, r3
 802033e:	480b      	ldr	r0, [pc, #44]	@ (802036c <HardFault_Handler_helper+0x58>)
 8020340:	f000 fb5a 	bl	80209f8 <printf>
  printf("instruction that triggered HardFault -> %\n\r",
 8020344:	f107 030c 	add.w	r3, r7, #12
 8020348:	4619      	mov	r1, r3
 802034a:	4809      	ldr	r0, [pc, #36]	@ (8020370 <HardFault_Handler_helper+0x5c>)
 802034c:	f000 fb54 	bl	80209f8 <printf>
         (uint32_t)&instruction);
}
 8020350:	bf00      	nop
 8020352:	3710      	adds	r7, #16
 8020354:	46bd      	mov	sp, r7
 8020356:	bd80      	pop	{r7, pc}
 8020358:	08020fe4 	.word	0x08020fe4
 802035c:	e000ed28 	.word	0xe000ed28
 8020360:	08020f34 	.word	0x08020f34
 8020364:	e000ed2c 	.word	0xe000ed2c
 8020368:	08020ff8 	.word	0x08020ff8
 802036c:	08020f64 	.word	0x08020f64
 8020370:	0802101c 	.word	0x0802101c

08020374 <main>:
void main15 (void);

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind);
void launch_process (void);

int main() {
 8020374:	b580      	push	{r7, lr}
 8020376:	b086      	sub	sp, #24
 8020378:	af00      	add	r7, sp, #0

    SCB->SHP[10] = 0xff;    // set the PendSV to be the lowest priority...
 802037a:	4b51      	ldr	r3, [pc, #324]	@ (80204c0 <main+0x14c>)
 802037c:	22ff      	movs	r2, #255	@ 0xff
 802037e:	f883 2022 	strb.w	r2, [r3, #34]	@ 0x22

    /* some init code */
    __usart1_init ();
 8020382:	f000 fc6d 	bl	8020c60 <__usart1_init>
    queue_init (&ready_queue);
 8020386:	484f      	ldr	r0, [pc, #316]	@ (80204c4 <main+0x150>)
 8020388:	f000 f9d0 	bl	802072c <queue_init>
    semaphore_init (&sem_usart1, 1);
 802038c:	2101      	movs	r1, #1
 802038e:	484e      	ldr	r0, [pc, #312]	@ (80204c8 <main+0x154>)
 8020390:	f000 fbfe 	bl	8020b90 <semaphore_init>

    if (process_count < 1 || process_count > MAX_PROCESS_NUM){
 8020394:	4b4d      	ldr	r3, [pc, #308]	@ (80204cc <main+0x158>)
 8020396:	781b      	ldrb	r3, [r3, #0]
 8020398:	2b00      	cmp	r3, #0
 802039a:	d003      	beq.n	80203a4 <main+0x30>
 802039c:	4b4b      	ldr	r3, [pc, #300]	@ (80204cc <main+0x158>)
 802039e:	781b      	ldrb	r3, [r3, #0]
 80203a0:	2b0f      	cmp	r3, #15
 80203a2:	d904      	bls.n	80203ae <main+0x3a>
        printf ("ERROR in the number of process ....\n\r", 0x0);
 80203a4:	2100      	movs	r1, #0
 80203a6:	484a      	ldr	r0, [pc, #296]	@ (80204d0 <main+0x15c>)
 80203a8:	f000 fb26 	bl	80209f8 <printf>
        while (1);
 80203ac:	e7fe      	b.n	80203ac <main+0x38>
    }

    /******************** fault handler init ***************************/
    
    // enable faults (without this any fault = hardfault)
    SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;
 80203ae:	4b44      	ldr	r3, [pc, #272]	@ (80204c0 <main+0x14c>)
 80203b0:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80203b2:	4a43      	ldr	r2, [pc, #268]	@ (80204c0 <main+0x14c>)
 80203b4:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
 80203b8:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;
 80203ba:	4b41      	ldr	r3, [pc, #260]	@ (80204c0 <main+0x14c>)
 80203bc:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80203be:	4a40      	ldr	r2, [pc, #256]	@ (80204c0 <main+0x14c>)
 80203c0:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
 80203c4:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;
 80203c6:	4b3e      	ldr	r3, [pc, #248]	@ (80204c0 <main+0x14c>)
 80203c8:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 80203ca:	4a3d      	ldr	r2, [pc, #244]	@ (80204c0 <main+0x14c>)
 80203cc:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 80203d0:	6253      	str	r3, [r2, #36]	@ 0x24



    /* init syscall table */
    Syscall_Table[0] =  syscall__printf;
 80203d2:	4b40      	ldr	r3, [pc, #256]	@ (80204d4 <main+0x160>)
 80203d4:	4a40      	ldr	r2, [pc, #256]	@ (80204d8 <main+0x164>)
 80203d6:	601a      	str	r2, [r3, #0]
    Syscall_Table[1] =  syscall__scanf;
 80203d8:	4b3e      	ldr	r3, [pc, #248]	@ (80204d4 <main+0x160>)
 80203da:	4a40      	ldr	r2, [pc, #256]	@ (80204dc <main+0x168>)
 80203dc:	605a      	str	r2, [r3, #4]
    *(uint32_t *)(SYSCALL_TABLE_AD) = (uint32_t)(Syscall_Table);
 80203de:	4b40      	ldr	r3, [pc, #256]	@ (80204e0 <main+0x16c>)
 80203e0:	4a3c      	ldr	r2, [pc, #240]	@ (80204d4 <main+0x160>)
 80203e2:	601a      	str	r2, [r3, #0]
    
    uint32_t psp_val = USER_STACK_INIT;
 80203e4:	4b3f      	ldr	r3, [pc, #252]	@ (80204e4 <main+0x170>)
 80203e6:	617b      	str	r3, [r7, #20]
    uint32_t msp_val = KERNEL_STACK_INIT;
 80203e8:	4b3f      	ldr	r3, [pc, #252]	@ (80204e8 <main+0x174>)
 80203ea:	613b      	str	r3, [r7, #16]
    uint32_t user_stack_size = USER_STACK_SIZE / process_count;
 80203ec:	4b37      	ldr	r3, [pc, #220]	@ (80204cc <main+0x158>)
 80203ee:	781b      	ldrb	r3, [r3, #0]
 80203f0:	461a      	mov	r2, r3
 80203f2:	f44f 4300 	mov.w	r3, #32768	@ 0x8000
 80203f6:	fb93 f3f2 	sdiv	r3, r3, r2
 80203fa:	60bb      	str	r3, [r7, #8]
    uint32_t kernel_stack_size = KERNEL_STACK_SIZE / process_count;
 80203fc:	4b33      	ldr	r3, [pc, #204]	@ (80204cc <main+0x158>)
 80203fe:	781b      	ldrb	r3, [r3, #0]
 8020400:	461a      	mov	r2, r3
 8020402:	f44f 43c0 	mov.w	r3, #24576	@ 0x6000
 8020406:	fb93 f3f2 	sdiv	r3, r3, r2
 802040a:	607b      	str	r3, [r7, #4]

    /* fill the pcs */
    process_pc [0] = main1;
 802040c:	4b37      	ldr	r3, [pc, #220]	@ (80204ec <main+0x178>)
 802040e:	4a38      	ldr	r2, [pc, #224]	@ (80204f0 <main+0x17c>)
 8020410:	601a      	str	r2, [r3, #0]
    process_pc [1] = main2;
 8020412:	4b36      	ldr	r3, [pc, #216]	@ (80204ec <main+0x178>)
 8020414:	4a37      	ldr	r2, [pc, #220]	@ (80204f4 <main+0x180>)
 8020416:	605a      	str	r2, [r3, #4]
    process_pc [2] = main3;
 8020418:	4b34      	ldr	r3, [pc, #208]	@ (80204ec <main+0x178>)
 802041a:	4a37      	ldr	r2, [pc, #220]	@ (80204f8 <main+0x184>)
 802041c:	609a      	str	r2, [r3, #8]
    process_pc [3] = main4;
 802041e:	4b33      	ldr	r3, [pc, #204]	@ (80204ec <main+0x178>)
 8020420:	4a36      	ldr	r2, [pc, #216]	@ (80204fc <main+0x188>)
 8020422:	60da      	str	r2, [r3, #12]
    process_pc [4] = main5;
 8020424:	4b31      	ldr	r3, [pc, #196]	@ (80204ec <main+0x178>)
 8020426:	4a36      	ldr	r2, [pc, #216]	@ (8020500 <main+0x18c>)
 8020428:	611a      	str	r2, [r3, #16]
    process_pc [5] = main6;
 802042a:	4b30      	ldr	r3, [pc, #192]	@ (80204ec <main+0x178>)
 802042c:	4a35      	ldr	r2, [pc, #212]	@ (8020504 <main+0x190>)
 802042e:	615a      	str	r2, [r3, #20]
    process_pc [6] = main7;
 8020430:	4b2e      	ldr	r3, [pc, #184]	@ (80204ec <main+0x178>)
 8020432:	4a35      	ldr	r2, [pc, #212]	@ (8020508 <main+0x194>)
 8020434:	619a      	str	r2, [r3, #24]
    process_pc [7] = main8;
 8020436:	4b2d      	ldr	r3, [pc, #180]	@ (80204ec <main+0x178>)
 8020438:	4a34      	ldr	r2, [pc, #208]	@ (802050c <main+0x198>)
 802043a:	61da      	str	r2, [r3, #28]
    process_pc [8] = main9;
 802043c:	4b2b      	ldr	r3, [pc, #172]	@ (80204ec <main+0x178>)
 802043e:	4a34      	ldr	r2, [pc, #208]	@ (8020510 <main+0x19c>)
 8020440:	621a      	str	r2, [r3, #32]
    process_pc [9] = main10;
 8020442:	4b2a      	ldr	r3, [pc, #168]	@ (80204ec <main+0x178>)
 8020444:	4a33      	ldr	r2, [pc, #204]	@ (8020514 <main+0x1a0>)
 8020446:	625a      	str	r2, [r3, #36]	@ 0x24
    process_pc [10] = main11;
 8020448:	4b28      	ldr	r3, [pc, #160]	@ (80204ec <main+0x178>)
 802044a:	4a33      	ldr	r2, [pc, #204]	@ (8020518 <main+0x1a4>)
 802044c:	629a      	str	r2, [r3, #40]	@ 0x28
    process_pc [11] = main12;
 802044e:	4b27      	ldr	r3, [pc, #156]	@ (80204ec <main+0x178>)
 8020450:	4a32      	ldr	r2, [pc, #200]	@ (802051c <main+0x1a8>)
 8020452:	62da      	str	r2, [r3, #44]	@ 0x2c
    process_pc [12] = main13;
 8020454:	4b25      	ldr	r3, [pc, #148]	@ (80204ec <main+0x178>)
 8020456:	4a32      	ldr	r2, [pc, #200]	@ (8020520 <main+0x1ac>)
 8020458:	631a      	str	r2, [r3, #48]	@ 0x30
    process_pc [13] = main14;
 802045a:	4b24      	ldr	r3, [pc, #144]	@ (80204ec <main+0x178>)
 802045c:	4a31      	ldr	r2, [pc, #196]	@ (8020524 <main+0x1b0>)
 802045e:	635a      	str	r2, [r3, #52]	@ 0x34
    process_pc [14] = main15;
 8020460:	4b22      	ldr	r3, [pc, #136]	@ (80204ec <main+0x178>)
 8020462:	4a31      	ldr	r2, [pc, #196]	@ (8020528 <main+0x1b4>)
 8020464:	639a      	str	r2, [r3, #56]	@ 0x38

    for (uint8_t i=0; i<process_count; i++){
 8020466:	2300      	movs	r3, #0
 8020468:	73fb      	strb	r3, [r7, #15]
 802046a:	e01e      	b.n	80204aa <main+0x136>
        make_process (&process[i], psp_val, msp_val, i);
 802046c:	7bfa      	ldrb	r2, [r7, #15]
 802046e:	4613      	mov	r3, r2
 8020470:	005b      	lsls	r3, r3, #1
 8020472:	4413      	add	r3, r2
 8020474:	011b      	lsls	r3, r3, #4
 8020476:	4a2d      	ldr	r2, [pc, #180]	@ (802052c <main+0x1b8>)
 8020478:	1898      	adds	r0, r3, r2
 802047a:	7bfb      	ldrb	r3, [r7, #15]
 802047c:	693a      	ldr	r2, [r7, #16]
 802047e:	6979      	ldr	r1, [r7, #20]
 8020480:	f000 f856 	bl	8020530 <make_process>
        psp_val -= user_stack_size;
 8020484:	697a      	ldr	r2, [r7, #20]
 8020486:	68bb      	ldr	r3, [r7, #8]
 8020488:	1ad3      	subs	r3, r2, r3
 802048a:	617b      	str	r3, [r7, #20]
        msp_val -= kernel_stack_size;
 802048c:	693a      	ldr	r2, [r7, #16]
 802048e:	687b      	ldr	r3, [r7, #4]
 8020490:	1ad3      	subs	r3, r2, r3
 8020492:	613b      	str	r3, [r7, #16]
        /* make stack pointers word aligned */
        psp_val &= ~(3);
 8020494:	697b      	ldr	r3, [r7, #20]
 8020496:	f023 0303 	bic.w	r3, r3, #3
 802049a:	617b      	str	r3, [r7, #20]
        msp_val &= ~(3);
 802049c:	693b      	ldr	r3, [r7, #16]
 802049e:	f023 0303 	bic.w	r3, r3, #3
 80204a2:	613b      	str	r3, [r7, #16]
    for (uint8_t i=0; i<process_count; i++){
 80204a4:	7bfb      	ldrb	r3, [r7, #15]
 80204a6:	3301      	adds	r3, #1
 80204a8:	73fb      	strb	r3, [r7, #15]
 80204aa:	4b08      	ldr	r3, [pc, #32]	@ (80204cc <main+0x158>)
 80204ac:	781b      	ldrb	r3, [r3, #0]
 80204ae:	7bfa      	ldrb	r2, [r7, #15]
 80204b0:	429a      	cmp	r2, r3
 80204b2:	d3db      	bcc.n	802046c <main+0xf8>
 
    /* accessing illegal address in kernel code -> Kernel Panic*/
//    *(uint32_t*) (0xffffffff) = 5;

    /*impose user restriction*/
    mpu_setup ();
 80204b4:	f000 f906 	bl	80206c4 <mpu_setup>

    /* start the processes */
    launch_process();
 80204b8:	f000 f8a6 	bl	8020608 <launch_process>
    /* should never fall to this section */
    while (1);
 80204bc:	e7fe      	b.n	80204bc <main+0x148>
 80204be:	bf00      	nop
 80204c0:	e000ed00 	.word	0xe000ed00
 80204c4:	200003b8 	.word	0x200003b8
 80204c8:	2000002c 	.word	0x2000002c
 80204cc:	20000000 	.word	0x20000000
 80204d0:	08021048 	.word	0x08021048
 80204d4:	20000004 	.word	0x20000004
 80204d8:	08020b15 	.word	0x08020b15
 80204dc:	08020b45 	.word	0x08020b45
 80204e0:	2001600c 	.word	0x2001600c
 80204e4:	20010000 	.word	0x20010000
 80204e8:	20016000 	.word	0x20016000
 80204ec:	2000037c 	.word	0x2000037c
 80204f0:	08030001 	.word	0x08030001
 80204f4:	080300a5 	.word	0x080300a5
 80204f8:	080300b9 	.word	0x080300b9
 80204fc:	080300cd 	.word	0x080300cd
 8020500:	080300e1 	.word	0x080300e1
 8020504:	080300f5 	.word	0x080300f5
 8020508:	08030109 	.word	0x08030109
 802050c:	0803011d 	.word	0x0803011d
 8020510:	08030131 	.word	0x08030131
 8020514:	0803002d 	.word	0x0803002d
 8020518:	08030041 	.word	0x08030041
 802051c:	08030055 	.word	0x08030055
 8020520:	08030069 	.word	0x08030069
 8020524:	0803007d 	.word	0x0803007d
 8020528:	08030091 	.word	0x08030091
 802052c:	200000ac 	.word	0x200000ac

08020530 <make_process>:
}

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind){
 8020530:	b480      	push	{r7}
 8020532:	b087      	sub	sp, #28
 8020534:	af00      	add	r7, sp, #0
 8020536:	60f8      	str	r0, [r7, #12]
 8020538:	60b9      	str	r1, [r7, #8]
 802053a:	607a      	str	r2, [r7, #4]
 802053c:	70fb      	strb	r3, [r7, #3]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;
 802053e:	68fb      	ldr	r3, [r7, #12]
 8020540:	2200      	movs	r2, #0
 8020542:	61da      	str	r2, [r3, #28]
 8020544:	68fb      	ldr	r3, [r7, #12]
 8020546:	69da      	ldr	r2, [r3, #28]
 8020548:	68fb      	ldr	r3, [r7, #12]
 802054a:	619a      	str	r2, [r3, #24]
 802054c:	68fb      	ldr	r3, [r7, #12]
 802054e:	699a      	ldr	r2, [r3, #24]
 8020550:	68fb      	ldr	r3, [r7, #12]
 8020552:	615a      	str	r2, [r3, #20]
 8020554:	68fb      	ldr	r3, [r7, #12]
 8020556:	695a      	ldr	r2, [r3, #20]
 8020558:	68fb      	ldr	r3, [r7, #12]
 802055a:	611a      	str	r2, [r3, #16]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
 802055c:	68fb      	ldr	r3, [r7, #12]
 802055e:	691a      	ldr	r2, [r3, #16]
 8020560:	68fb      	ldr	r3, [r7, #12]
 8020562:	60da      	str	r2, [r3, #12]
 8020564:	68fb      	ldr	r3, [r7, #12]
 8020566:	68da      	ldr	r2, [r3, #12]
 8020568:	68fb      	ldr	r3, [r7, #12]
 802056a:	609a      	str	r2, [r3, #8]
 802056c:	68fb      	ldr	r3, [r7, #12]
 802056e:	689a      	ldr	r2, [r3, #8]
 8020570:	68fb      	ldr	r3, [r7, #12]
 8020572:	605a      	str	r2, [r3, #4]
 8020574:	68fb      	ldr	r3, [r7, #12]
 8020576:	685a      	ldr	r2, [r3, #4]
 8020578:	68fb      	ldr	r3, [r7, #12]
 802057a:	601a      	str	r2, [r3, #0]

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;
 802057c:	68fb      	ldr	r3, [r7, #12]
 802057e:	f06f 0202 	mvn.w	r2, #2
 8020582:	629a      	str	r2, [r3, #40]	@ 0x28



    //process->pc = (uint32_t) fun;
    process->psp = psp;
 8020584:	68fb      	ldr	r3, [r7, #12]
 8020586:	68ba      	ldr	r2, [r7, #8]
 8020588:	621a      	str	r2, [r3, #32]
    process->msp = msp;
 802058a:	68fb      	ldr	r3, [r7, #12]
 802058c:	687a      	ldr	r2, [r7, #4]
 802058e:	625a      	str	r2, [r3, #36]	@ 0x24
    process->psp -= 8*4;        // start from 8 word below the base of the stack
 8020590:	68fb      	ldr	r3, [r7, #12]
 8020592:	6a1b      	ldr	r3, [r3, #32]
 8020594:	f1a3 0220 	sub.w	r2, r3, #32
 8020598:	68fb      	ldr	r3, [r7, #12]
 802059a:	621a      	str	r2, [r3, #32]
    the values in the padding is random -> make them 0x0 

    set the xPSR word in the stack to 0x01000000 as 24th bit must ne 1 for xPSR to 
    represent thumb state 
    */
    for (int i=0; i<8; i++){
 802059c:	2300      	movs	r3, #0
 802059e:	617b      	str	r3, [r7, #20]
 80205a0:	e026      	b.n	80205f0 <make_process+0xc0>
        if (i == 6)
 80205a2:	697b      	ldr	r3, [r7, #20]
 80205a4:	2b06      	cmp	r3, #6
 80205a6:	d10b      	bne.n	80205c0 <make_process+0x90>
            *(uint32_t *)(process->psp+i*4) = (uint32_t) process_pc [ind];
 80205a8:	78fb      	ldrb	r3, [r7, #3]
 80205aa:	4a16      	ldr	r2, [pc, #88]	@ (8020604 <make_process+0xd4>)
 80205ac:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
 80205b0:	68fb      	ldr	r3, [r7, #12]
 80205b2:	6a1b      	ldr	r3, [r3, #32]
 80205b4:	697a      	ldr	r2, [r7, #20]
 80205b6:	0092      	lsls	r2, r2, #2
 80205b8:	4413      	add	r3, r2
 80205ba:	460a      	mov	r2, r1
 80205bc:	601a      	str	r2, [r3, #0]
 80205be:	e014      	b.n	80205ea <make_process+0xba>
        else if (i == 7)
 80205c0:	697b      	ldr	r3, [r7, #20]
 80205c2:	2b07      	cmp	r3, #7
 80205c4:	d109      	bne.n	80205da <make_process+0xaa>
            *(uint32_t *)(process->psp+i*4) = 0x01000000;
 80205c6:	68fb      	ldr	r3, [r7, #12]
 80205c8:	6a1b      	ldr	r3, [r3, #32]
 80205ca:	697a      	ldr	r2, [r7, #20]
 80205cc:	0092      	lsls	r2, r2, #2
 80205ce:	4413      	add	r3, r2
 80205d0:	461a      	mov	r2, r3
 80205d2:	f04f 7380 	mov.w	r3, #16777216	@ 0x1000000
 80205d6:	6013      	str	r3, [r2, #0]
 80205d8:	e007      	b.n	80205ea <make_process+0xba>
        else 
            *(uint32_t *)(process->psp+i*4) = 0x0;
 80205da:	68fb      	ldr	r3, [r7, #12]
 80205dc:	6a1b      	ldr	r3, [r3, #32]
 80205de:	697a      	ldr	r2, [r7, #20]
 80205e0:	0092      	lsls	r2, r2, #2
 80205e2:	4413      	add	r3, r2
 80205e4:	461a      	mov	r2, r3
 80205e6:	2300      	movs	r3, #0
 80205e8:	6013      	str	r3, [r2, #0]
    for (int i=0; i<8; i++){
 80205ea:	697b      	ldr	r3, [r7, #20]
 80205ec:	3301      	adds	r3, #1
 80205ee:	617b      	str	r3, [r7, #20]
 80205f0:	697b      	ldr	r3, [r7, #20]
 80205f2:	2b07      	cmp	r3, #7
 80205f4:	ddd5      	ble.n	80205a2 <make_process+0x72>
    }
    

}
 80205f6:	bf00      	nop
 80205f8:	bf00      	nop
 80205fa:	371c      	adds	r7, #28
 80205fc:	46bd      	mov	sp, r7
 80205fe:	bc80      	pop	{r7}
 8020600:	4770      	bx	lr
 8020602:	bf00      	nop
 8020604:	2000037c 	.word	0x2000037c

08020608 <launch_process>:

void  launch_process (void){
 8020608:	b580      	push	{r7, lr}
 802060a:	b082      	sub	sp, #8
 802060c:	af00      	add	r7, sp, #0
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process[0].psp);
 802060e:	4b28      	ldr	r3, [pc, #160]	@ (80206b0 <launch_process+0xa8>)
 8020610:	6a1b      	ldr	r3, [r3, #32]
 8020612:	4618      	mov	r0, r3
 8020614:	f000 fc48 	bl	8020ea8 <__asm__set_psp>
    __asm__set_msp (process[0].msp);
 8020618:	4b25      	ldr	r3, [pc, #148]	@ (80206b0 <launch_process+0xa8>)
 802061a:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 802061c:	4618      	mov	r0, r3
 802061e:	f000 fc46 	bl	8020eae <__asm__set_msp>
       

    SysTick->LOAD = 16000 - 1;
 8020622:	4b24      	ldr	r3, [pc, #144]	@ (80206b4 <launch_process+0xac>)
 8020624:	f643 627f 	movw	r2, #15999	@ 0x3e7f
 8020628:	605a      	str	r2, [r3, #4]
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
 802062a:	4b22      	ldr	r3, [pc, #136]	@ (80206b4 <launch_process+0xac>)
 802062c:	681b      	ldr	r3, [r3, #0]
 802062e:	4a21      	ldr	r2, [pc, #132]	@ (80206b4 <launch_process+0xac>)
 8020630:	f043 0307 	orr.w	r3, r3, #7
 8020634:	6013      	str	r3, [r2, #0]
            | SysTick_CTRL_ENABLE_Msk);

    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process[0]);
 8020636:	4b20      	ldr	r3, [pc, #128]	@ (80206b8 <launch_process+0xb0>)
 8020638:	4a1d      	ldr	r2, [pc, #116]	@ (80206b0 <launch_process+0xa8>)
 802063a:	601a      	str	r2, [r3, #0]

    /* initially all the processes will be placed in the ready queue except the first one (entry point) */
    for (uint8_t i=1; i<process_count; i++){
 802063c:	2301      	movs	r3, #1
 802063e:	71fb      	strb	r3, [r7, #7]
 8020640:	e013      	b.n	802066a <launch_process+0x62>
        int status = queue_push (&ready_queue, &process[i]);
 8020642:	79fa      	ldrb	r2, [r7, #7]
 8020644:	4613      	mov	r3, r2
 8020646:	005b      	lsls	r3, r3, #1
 8020648:	4413      	add	r3, r2
 802064a:	011b      	lsls	r3, r3, #4
 802064c:	4a18      	ldr	r2, [pc, #96]	@ (80206b0 <launch_process+0xa8>)
 802064e:	4413      	add	r3, r2
 8020650:	4619      	mov	r1, r3
 8020652:	481a      	ldr	r0, [pc, #104]	@ (80206bc <launch_process+0xb4>)
 8020654:	f000 f87f 	bl	8020756 <queue_push>
 8020658:	4603      	mov	r3, r0
 802065a:	603b      	str	r3, [r7, #0]
        if (status){
 802065c:	683b      	ldr	r3, [r7, #0]
 802065e:	2b00      	cmp	r3, #0
 8020660:	d000      	beq.n	8020664 <launch_process+0x5c>
            while (1);
 8020662:	e7fe      	b.n	8020662 <launch_process+0x5a>
    for (uint8_t i=1; i<process_count; i++){
 8020664:	79fb      	ldrb	r3, [r7, #7]
 8020666:	3301      	adds	r3, #1
 8020668:	71fb      	strb	r3, [r7, #7]
 802066a:	4b15      	ldr	r3, [pc, #84]	@ (80206c0 <launch_process+0xb8>)
 802066c:	781b      	ldrb	r3, [r3, #0]
 802066e:	79fa      	ldrb	r2, [r7, #7]
 8020670:	429a      	cmp	r2, r3
 8020672:	d3e6      	bcc.n	8020642 <launch_process+0x3a>
        }
    }

    process[0].state = RUNNING_STATE;
 8020674:	4b0e      	ldr	r3, [pc, #56]	@ (80206b0 <launch_process+0xa8>)
 8020676:	2201      	movs	r2, #1
 8020678:	62da      	str	r2, [r3, #44]	@ 0x2c
    for (uint8_t i=1; i<process_count; i++){
 802067a:	2301      	movs	r3, #1
 802067c:	71bb      	strb	r3, [r7, #6]
 802067e:	e00c      	b.n	802069a <launch_process+0x92>
        process[i].state = READY_STATE;
 8020680:	79ba      	ldrb	r2, [r7, #6]
 8020682:	490b      	ldr	r1, [pc, #44]	@ (80206b0 <launch_process+0xa8>)
 8020684:	4613      	mov	r3, r2
 8020686:	005b      	lsls	r3, r3, #1
 8020688:	4413      	add	r3, r2
 802068a:	011b      	lsls	r3, r3, #4
 802068c:	440b      	add	r3, r1
 802068e:	332c      	adds	r3, #44	@ 0x2c
 8020690:	2200      	movs	r2, #0
 8020692:	601a      	str	r2, [r3, #0]
    for (uint8_t i=1; i<process_count; i++){
 8020694:	79bb      	ldrb	r3, [r7, #6]
 8020696:	3301      	adds	r3, #1
 8020698:	71bb      	strb	r3, [r7, #6]
 802069a:	4b09      	ldr	r3, [pc, #36]	@ (80206c0 <launch_process+0xb8>)
 802069c:	781b      	ldrb	r3, [r3, #0]
 802069e:	79ba      	ldrb	r2, [r7, #6]
 80206a0:	429a      	cmp	r2, r3
 80206a2:	d3ed      	bcc.n	8020680 <launch_process+0x78>
    }
 
    __asm__launch_main1();
 80206a4:	f00f fd4e 	bl	8030144 <__asm__launch_main1>

}
 80206a8:	bf00      	nop
 80206aa:	3708      	adds	r7, #8
 80206ac:	46bd      	mov	sp, r7
 80206ae:	bd80      	pop	{r7, pc}
 80206b0:	200000ac 	.word	0x200000ac
 80206b4:	e000e010 	.word	0xe000e010
 80206b8:	20016004 	.word	0x20016004
 80206bc:	200003b8 	.word	0x200003b8
 80206c0:	20000000 	.word	0x20000000

080206c4 <mpu_setup>:
#include "core.h"

void mpu_setup(void) {
 80206c4:	b480      	push	{r7}
 80206c6:	af00      	add	r7, sp, #0

  /*dissable mpu*/
  MPU->CTRL = 0;
 80206c8:	4b12      	ldr	r3, [pc, #72]	@ (8020714 <mpu_setup+0x50>)
 80206ca:	2200      	movs	r2, #0
 80206cc:	605a      	str	r2, [r3, #4]

  /*region 0*/
  MPU->RNR = 0;
 80206ce:	4b11      	ldr	r3, [pc, #68]	@ (8020714 <mpu_setup+0x50>)
 80206d0:	2200      	movs	r2, #0
 80206d2:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sFLASHUserSpace);
 80206d4:	4b0f      	ldr	r3, [pc, #60]	@ (8020714 <mpu_setup+0x50>)
 80206d6:	4a10      	ldr	r2, [pc, #64]	@ (8020718 <mpu_setup+0x54>)
 80206d8:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 80206da:	4b0e      	ldr	r3, [pc, #56]	@ (8020714 <mpu_setup+0x50>)
 80206dc:	4a0f      	ldr	r2, [pc, #60]	@ (802071c <mpu_setup+0x58>)
 80206de:	611a      	str	r2, [r3, #16]
      (0 << MPU_RASR_XN_Pos) |     // Executable (XN = 0)
      (0b110 << MPU_RASR_AP_Pos) | // Privileged read-only user read-only
      (15 << MPU_RASR_SIZE_Pos) |  // 64 KB region
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 1;
 80206e0:	4b0c      	ldr	r3, [pc, #48]	@ (8020714 <mpu_setup+0x50>)
 80206e2:	2201      	movs	r2, #1
 80206e4:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sSRAMUserSpace);
 80206e6:	4b0b      	ldr	r3, [pc, #44]	@ (8020714 <mpu_setup+0x50>)
 80206e8:	4a0d      	ldr	r2, [pc, #52]	@ (8020720 <mpu_setup+0x5c>)
 80206ea:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 80206ec:	4b09      	ldr	r3, [pc, #36]	@ (8020714 <mpu_setup+0x50>)
 80206ee:	4a0d      	ldr	r2, [pc, #52]	@ (8020724 <mpu_setup+0x60>)
 80206f0:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 2;
 80206f2:	4b08      	ldr	r3, [pc, #32]	@ (8020714 <mpu_setup+0x50>)
 80206f4:	2202      	movs	r2, #2
 80206f6:	609a      	str	r2, [r3, #8]
  MPU->RBAR = USER_STACK_END;
 80206f8:	4b06      	ldr	r3, [pc, #24]	@ (8020714 <mpu_setup+0x50>)
 80206fa:	4a0b      	ldr	r2, [pc, #44]	@ (8020728 <mpu_setup+0x64>)
 80206fc:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 80206fe:	4b05      	ldr	r3, [pc, #20]	@ (8020714 <mpu_setup+0x50>)
 8020700:	4a08      	ldr	r2, [pc, #32]	@ (8020724 <mpu_setup+0x60>)
 8020702:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->CTRL = MPU_CTRL_PRIVDEFENA_Msk | MPU_CTRL_ENABLE_Msk;
 8020704:	4b03      	ldr	r3, [pc, #12]	@ (8020714 <mpu_setup+0x50>)
 8020706:	2205      	movs	r2, #5
 8020708:	605a      	str	r2, [r3, #4]
}
 802070a:	bf00      	nop
 802070c:	46bd      	mov	sp, r7
 802070e:	bc80      	pop	{r7}
 8020710:	4770      	bx	lr
 8020712:	bf00      	nop
 8020714:	e000ed90 	.word	0xe000ed90
 8020718:	08030000 	.word	0x08030000
 802071c:	0600001f 	.word	0x0600001f
 8020720:	20004000 	.word	0x20004000
 8020724:	1300001d 	.word	0x1300001d
 8020728:	20008000 	.word	0x20008000

0802072c <queue_init>:
#include "core.h"

/* queue functions */
void queue_init (queue_t* q){
 802072c:	b480      	push	{r7}
 802072e:	b083      	sub	sp, #12
 8020730:	af00      	add	r7, sp, #0
 8020732:	6078      	str	r0, [r7, #4]
    q->size = 0;
 8020734:	687b      	ldr	r3, [r7, #4]
 8020736:	2200      	movs	r2, #0
 8020738:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    q->front = 0xff;
 802073c:	687b      	ldr	r3, [r7, #4]
 802073e:	22ff      	movs	r2, #255	@ 0xff
 8020740:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    q->rare = 0;
 8020744:	687b      	ldr	r3, [r7, #4]
 8020746:	2200      	movs	r2, #0
 8020748:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
}
 802074c:	bf00      	nop
 802074e:	370c      	adds	r7, #12
 8020750:	46bd      	mov	sp, r7
 8020752:	bc80      	pop	{r7}
 8020754:	4770      	bx	lr

08020756 <queue_push>:

uint8_t queue_push (queue_t* q, user_process_t* process){
 8020756:	b480      	push	{r7}
 8020758:	b083      	sub	sp, #12
 802075a:	af00      	add	r7, sp, #0
 802075c:	6078      	str	r0, [r7, #4]
 802075e:	6039      	str	r1, [r7, #0]
    if (q->front == 0xff){
 8020760:	687b      	ldr	r3, [r7, #4]
 8020762:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020766:	2bff      	cmp	r3, #255	@ 0xff
 8020768:	d104      	bne.n	8020774 <queue_push+0x1e>
        /* queue is empty */
        q->front = 0;
 802076a:	687b      	ldr	r3, [r7, #4]
 802076c:	2200      	movs	r2, #0
 802076e:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
 8020772:	e009      	b.n	8020788 <queue_push+0x32>
    }
    else if (q->rare == q->front) return -1;
 8020774:	687b      	ldr	r3, [r7, #4]
 8020776:	f893 207a 	ldrb.w	r2, [r3, #122]	@ 0x7a
 802077a:	687b      	ldr	r3, [r7, #4]
 802077c:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020780:	429a      	cmp	r2, r3
 8020782:	d101      	bne.n	8020788 <queue_push+0x32>
 8020784:	23ff      	movs	r3, #255	@ 0xff
 8020786:	e023      	b.n	80207d0 <queue_push+0x7a>

    q->processes [q->rare] = process;
 8020788:	687b      	ldr	r3, [r7, #4]
 802078a:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 802078e:	4619      	mov	r1, r3
 8020790:	687b      	ldr	r3, [r7, #4]
 8020792:	683a      	ldr	r2, [r7, #0]
 8020794:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
    q->rare = (q->rare + 1) % MAX_PROCESS_NUM;
 8020798:	687b      	ldr	r3, [r7, #4]
 802079a:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 802079e:	1c5a      	adds	r2, r3, #1
 80207a0:	4b0e      	ldr	r3, [pc, #56]	@ (80207dc <queue_push+0x86>)
 80207a2:	fb83 1302 	smull	r1, r3, r3, r2
 80207a6:	4413      	add	r3, r2
 80207a8:	10d9      	asrs	r1, r3, #3
 80207aa:	17d3      	asrs	r3, r2, #31
 80207ac:	1ac9      	subs	r1, r1, r3
 80207ae:	460b      	mov	r3, r1
 80207b0:	011b      	lsls	r3, r3, #4
 80207b2:	1a5b      	subs	r3, r3, r1
 80207b4:	1ad1      	subs	r1, r2, r3
 80207b6:	b2ca      	uxtb	r2, r1
 80207b8:	687b      	ldr	r3, [r7, #4]
 80207ba:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a

    q->size ++ ;
 80207be:	687b      	ldr	r3, [r7, #4]
 80207c0:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 80207c4:	3301      	adds	r3, #1
 80207c6:	b2da      	uxtb	r2, r3
 80207c8:	687b      	ldr	r3, [r7, #4]
 80207ca:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 80207ce:	2300      	movs	r3, #0
}
 80207d0:	4618      	mov	r0, r3
 80207d2:	370c      	adds	r7, #12
 80207d4:	46bd      	mov	sp, r7
 80207d6:	bc80      	pop	{r7}
 80207d8:	4770      	bx	lr
 80207da:	bf00      	nop
 80207dc:	88888889 	.word	0x88888889

080207e0 <queue_pop>:

uint8_t queue_pop (queue_t* q){   
 80207e0:	b480      	push	{r7}
 80207e2:	b083      	sub	sp, #12
 80207e4:	af00      	add	r7, sp, #0
 80207e6:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff){
 80207e8:	687b      	ldr	r3, [r7, #4]
 80207ea:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 80207ee:	2bff      	cmp	r3, #255	@ 0xff
 80207f0:	d101      	bne.n	80207f6 <queue_pop+0x16>
        /* q is empty*/
        return -1;
 80207f2:	23ff      	movs	r3, #255	@ 0xff
 80207f4:	e02b      	b.n	802084e <queue_pop+0x6e>
    }
    q->front = (q->front + 1) % MAX_PROCESS_NUM;
 80207f6:	687b      	ldr	r3, [r7, #4]
 80207f8:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 80207fc:	1c5a      	adds	r2, r3, #1
 80207fe:	4b16      	ldr	r3, [pc, #88]	@ (8020858 <queue_pop+0x78>)
 8020800:	fb83 1302 	smull	r1, r3, r3, r2
 8020804:	4413      	add	r3, r2
 8020806:	10d9      	asrs	r1, r3, #3
 8020808:	17d3      	asrs	r3, r2, #31
 802080a:	1ac9      	subs	r1, r1, r3
 802080c:	460b      	mov	r3, r1
 802080e:	011b      	lsls	r3, r3, #4
 8020810:	1a5b      	subs	r3, r3, r1
 8020812:	1ad1      	subs	r1, r2, r3
 8020814:	b2ca      	uxtb	r2, r1
 8020816:	687b      	ldr	r3, [r7, #4]
 8020818:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    if (q->front == q->rare){
 802081c:	687b      	ldr	r3, [r7, #4]
 802081e:	f893 2079 	ldrb.w	r2, [r3, #121]	@ 0x79
 8020822:	687b      	ldr	r3, [r7, #4]
 8020824:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 8020828:	429a      	cmp	r2, r3
 802082a:	d107      	bne.n	802083c <queue_pop+0x5c>
        q->front = 0xff;
 802082c:	687b      	ldr	r3, [r7, #4]
 802082e:	22ff      	movs	r2, #255	@ 0xff
 8020830:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
        q->rare = 0;
 8020834:	687b      	ldr	r3, [r7, #4]
 8020836:	2200      	movs	r2, #0
 8020838:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
    }
    q->size --;
 802083c:	687b      	ldr	r3, [r7, #4]
 802083e:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 8020842:	3b01      	subs	r3, #1
 8020844:	b2da      	uxtb	r2, r3
 8020846:	687b      	ldr	r3, [r7, #4]
 8020848:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 802084c:	2300      	movs	r3, #0
}
 802084e:	4618      	mov	r0, r3
 8020850:	370c      	adds	r7, #12
 8020852:	46bd      	mov	sp, r7
 8020854:	bc80      	pop	{r7}
 8020856:	4770      	bx	lr
 8020858:	88888889 	.word	0x88888889

0802085c <queue_front>:

user_process_t* queue_front (queue_t *q){
 802085c:	b480      	push	{r7}
 802085e:	b083      	sub	sp, #12
 8020860:	af00      	add	r7, sp, #0
 8020862:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff)
 8020864:	687b      	ldr	r3, [r7, #4]
 8020866:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 802086a:	2bff      	cmp	r3, #255	@ 0xff
 802086c:	d101      	bne.n	8020872 <queue_front+0x16>
        return NULL;
 802086e:	2300      	movs	r3, #0
 8020870:	e006      	b.n	8020880 <queue_front+0x24>
    return q->processes [q->front];
 8020872:	687b      	ldr	r3, [r7, #4]
 8020874:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020878:	461a      	mov	r2, r3
 802087a:	687b      	ldr	r3, [r7, #4]
 802087c:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
}
 8020880:	4618      	mov	r0, r3
 8020882:	370c      	adds	r7, #12
 8020884:	46bd      	mov	sp, r7
 8020886:	bc80      	pop	{r7}
 8020888:	4770      	bx	lr

0802088a <queue_empty>:

uint32_t queue_empty (queue_t *q){
 802088a:	b480      	push	{r7}
 802088c:	b083      	sub	sp, #12
 802088e:	af00      	add	r7, sp, #0
 8020890:	6078      	str	r0, [r7, #4]
    return q->front == 0xff;
 8020892:	687b      	ldr	r3, [r7, #4]
 8020894:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020898:	2bff      	cmp	r3, #255	@ 0xff
 802089a:	bf0c      	ite	eq
 802089c:	2301      	moveq	r3, #1
 802089e:	2300      	movne	r3, #0
 80208a0:	b2db      	uxtb	r3, r3
}
 80208a2:	4618      	mov	r0, r3
 80208a4:	370c      	adds	r7, #12
 80208a6:	46bd      	mov	sp, r7
 80208a8:	bc80      	pop	{r7}
 80208aa:	4770      	bx	lr

080208ac <queue_size>:

uint32_t queue_size (queue_t *q){
 80208ac:	b480      	push	{r7}
 80208ae:	b083      	sub	sp, #12
 80208b0:	af00      	add	r7, sp, #0
 80208b2:	6078      	str	r0, [r7, #4]
    return q->size;
 80208b4:	687b      	ldr	r3, [r7, #4]
 80208b6:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
}
 80208ba:	4618      	mov	r0, r3
 80208bc:	370c      	adds	r7, #12
 80208be:	46bd      	mov	sp, r7
 80208c0:	bc80      	pop	{r7}
 80208c2:	4770      	bx	lr

080208c4 <schedular>:
/* important variable from main.c */
extern user_process_t process[MAX_PROCESS_NUM];
extern queue_t ready_queue;
extern semaphore_t sem_usart1;

void schedular(void) {
 80208c4:	b580      	push	{r7, lr}
 80208c6:	b084      	sub	sp, #16
 80208c8:	af00      	add	r7, sp, #0

  /* Round Robin (FCFS + time slice)*/
  user_process_t *picked_process = NULL;
 80208ca:	2300      	movs	r3, #0
 80208cc:	60fb      	str	r3, [r7, #12]
  user_process_t *running_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 80208ce:	4b14      	ldr	r3, [pc, #80]	@ (8020920 <schedular+0x5c>)
 80208d0:	681b      	ldr	r3, [r3, #0]
 80208d2:	60bb      	str	r3, [r7, #8]

  picked_process = queue_front(&ready_queue);
 80208d4:	4813      	ldr	r0, [pc, #76]	@ (8020924 <schedular+0x60>)
 80208d6:	f7ff ffc1 	bl	802085c <queue_front>
 80208da:	60f8      	str	r0, [r7, #12]
  uint8_t status = queue_pop(&ready_queue);
 80208dc:	4811      	ldr	r0, [pc, #68]	@ (8020924 <schedular+0x60>)
 80208de:	f7ff ff7f 	bl	80207e0 <queue_pop>
 80208e2:	4603      	mov	r3, r0
 80208e4:	71fb      	strb	r3, [r7, #7]

  if (-1 == status || !picked_process)
 80208e6:	68fb      	ldr	r3, [r7, #12]
 80208e8:	2b00      	cmp	r3, #0
 80208ea:	d015      	beq.n	8020918 <schedular+0x54>
    return;

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);
 80208ec:	4a0e      	ldr	r2, [pc, #56]	@ (8020928 <schedular+0x64>)
 80208ee:	68fb      	ldr	r3, [r7, #12]
 80208f0:	6013      	str	r3, [r2, #0]
  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE &&
 80208f2:	68bb      	ldr	r3, [r7, #8]
 80208f4:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 80208f6:	2b02      	cmp	r3, #2
 80208f8:	d00a      	beq.n	8020910 <schedular+0x4c>
      running_process->state != WAITING_STATE) {
 80208fa:	68bb      	ldr	r3, [r7, #8]
 80208fc:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
  if (running_process->state != SUSPEND_STATE &&
 80208fe:	2b03      	cmp	r3, #3
 8020900:	d006      	beq.n	8020910 <schedular+0x4c>
    queue_push(&ready_queue, running_process);
 8020902:	68b9      	ldr	r1, [r7, #8]
 8020904:	4807      	ldr	r0, [pc, #28]	@ (8020924 <schedular+0x60>)
 8020906:	f7ff ff26 	bl	8020756 <queue_push>
    running_process->state = READY_STATE;
 802090a:	68bb      	ldr	r3, [r7, #8]
 802090c:	2200      	movs	r2, #0
 802090e:	62da      	str	r2, [r3, #44]	@ 0x2c
  }

  picked_process->state = RUNNING_STATE;
 8020910:	68fb      	ldr	r3, [r7, #12]
 8020912:	2201      	movs	r2, #1
 8020914:	62da      	str	r2, [r3, #44]	@ 0x2c
 8020916:	e000      	b.n	802091a <schedular+0x56>
    return;
 8020918:	bf00      	nop
}
 802091a:	3710      	adds	r7, #16
 802091c:	46bd      	mov	sp, r7
 802091e:	bd80      	pop	{r7, pc}
 8020920:	20016004 	.word	0x20016004
 8020924:	200003b8 	.word	0x200003b8
 8020928:	20016008 	.word	0x20016008

0802092c <enterCRITICAL>:
#include "core.h"
#include "defines.h"
#include "usart.h"
#include <stdint.h>

void enterCRITICAL(void) { __disable_irq(); }
 802092c:	b480      	push	{r7}
 802092e:	af00      	add	r7, sp, #0
  \details Disables IRQ interrupts by setting special-purpose register PRIMASK.
           Can only be executed in Privileged modes.
 */
__STATIC_FORCEINLINE void __disable_irq(void)
{
  __ASM volatile ("cpsid i" : : : "memory");
 8020930:	b672      	cpsid	i
}
 8020932:	bf00      	nop
 8020934:	bf00      	nop
 8020936:	46bd      	mov	sp, r7
 8020938:	bc80      	pop	{r7}
 802093a:	4770      	bx	lr

0802093c <exitCRITICAL>:

void exitCRITICAL(void) { __enable_irq(); }
 802093c:	b480      	push	{r7}
 802093e:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsie i" : : : "memory");
 8020940:	b662      	cpsie	i
}
 8020942:	bf00      	nop
 8020944:	bf00      	nop
 8020946:	46bd      	mov	sp, r7
 8020948:	bc80      	pop	{r7}
 802094a:	4770      	bx	lr

0802094c <_strlen>:

extern semaphore_t sem_usart1;

uint32_t _strlen(const char *msg) {
 802094c:	b480      	push	{r7}
 802094e:	b085      	sub	sp, #20
 8020950:	af00      	add	r7, sp, #0
 8020952:	6078      	str	r0, [r7, #4]

  int i = 0;
 8020954:	2300      	movs	r3, #0
 8020956:	60fb      	str	r3, [r7, #12]
  while (msg[i++] != '\0')
 8020958:	bf00      	nop
 802095a:	68fb      	ldr	r3, [r7, #12]
 802095c:	1c5a      	adds	r2, r3, #1
 802095e:	60fa      	str	r2, [r7, #12]
 8020960:	461a      	mov	r2, r3
 8020962:	687b      	ldr	r3, [r7, #4]
 8020964:	4413      	add	r3, r2
 8020966:	781b      	ldrb	r3, [r3, #0]
 8020968:	2b00      	cmp	r3, #0
 802096a:	d1f6      	bne.n	802095a <_strlen+0xe>
    ;
  return i - 1;
 802096c:	68fb      	ldr	r3, [r7, #12]
 802096e:	3b01      	subs	r3, #1
}
 8020970:	4618      	mov	r0, r3
 8020972:	3714      	adds	r7, #20
 8020974:	46bd      	mov	sp, r7
 8020976:	bc80      	pop	{r7}
 8020978:	4770      	bx	lr

0802097a <hex_str>:

char *hex_str(uint32_t value, char *out) {
 802097a:	b4b0      	push	{r4, r5, r7}
 802097c:	b08b      	sub	sp, #44	@ 0x2c
 802097e:	af00      	add	r7, sp, #0
 8020980:	6078      	str	r0, [r7, #4]
 8020982:	6039      	str	r1, [r7, #0]

  char hex_char[] = "0123456789abcdef";
 8020984:	4b1b      	ldr	r3, [pc, #108]	@ (80209f4 <hex_str+0x7a>)
 8020986:	f107 0408 	add.w	r4, r7, #8
 802098a:	461d      	mov	r5, r3
 802098c:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
 802098e:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 8020990:	682b      	ldr	r3, [r5, #0]
 8020992:	7023      	strb	r3, [r4, #0]
  out[0] = '0';
 8020994:	683b      	ldr	r3, [r7, #0]
 8020996:	2230      	movs	r2, #48	@ 0x30
 8020998:	701a      	strb	r2, [r3, #0]
  out[1] = 'x';
 802099a:	683b      	ldr	r3, [r7, #0]
 802099c:	3301      	adds	r3, #1
 802099e:	2278      	movs	r2, #120	@ 0x78
 80209a0:	701a      	strb	r2, [r3, #0]

  for (int i = 0; i < 8; i++) {
 80209a2:	2300      	movs	r3, #0
 80209a4:	627b      	str	r3, [r7, #36]	@ 0x24
 80209a6:	e01c      	b.n	80209e2 <hex_str+0x68>
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
 80209a8:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80209aa:	009b      	lsls	r3, r3, #2
 80209ac:	220f      	movs	r2, #15
 80209ae:	fa02 f303 	lsl.w	r3, r2, r3
 80209b2:	461a      	mov	r2, r3
 80209b4:	687b      	ldr	r3, [r7, #4]
 80209b6:	401a      	ands	r2, r3
 80209b8:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80209ba:	009b      	lsls	r3, r3, #2
 80209bc:	fa22 f303 	lsr.w	r3, r2, r3
 80209c0:	623b      	str	r3, [r7, #32]
    int j = 9 - i;
 80209c2:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80209c4:	f1c3 0309 	rsb	r3, r3, #9
 80209c8:	61fb      	str	r3, [r7, #28]
    out[j] = hex_char[ind];
 80209ca:	69fb      	ldr	r3, [r7, #28]
 80209cc:	683a      	ldr	r2, [r7, #0]
 80209ce:	4413      	add	r3, r2
 80209d0:	f107 0108 	add.w	r1, r7, #8
 80209d4:	6a3a      	ldr	r2, [r7, #32]
 80209d6:	440a      	add	r2, r1
 80209d8:	7812      	ldrb	r2, [r2, #0]
 80209da:	701a      	strb	r2, [r3, #0]
  for (int i = 0; i < 8; i++) {
 80209dc:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80209de:	3301      	adds	r3, #1
 80209e0:	627b      	str	r3, [r7, #36]	@ 0x24
 80209e2:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 80209e4:	2b07      	cmp	r3, #7
 80209e6:	dddf      	ble.n	80209a8 <hex_str+0x2e>
  }
}
 80209e8:	bf00      	nop
 80209ea:	4618      	mov	r0, r3
 80209ec:	372c      	adds	r7, #44	@ 0x2c
 80209ee:	46bd      	mov	sp, r7
 80209f0:	bcb0      	pop	{r4, r5, r7}
 80209f2:	4770      	bx	lr
 80209f4:	08021070 	.word	0x08021070

080209f8 <printf>:

void printf(const char *msg, uint32_t address) {
 80209f8:	b580      	push	{r7, lr}
 80209fa:	b0a4      	sub	sp, #144	@ 0x90
 80209fc:	af00      	add	r7, sp, #0
 80209fe:	6078      	str	r0, [r7, #4]
 8020a00:	6039      	str	r1, [r7, #0]

  uint32_t value = *((uint32_t *)address);
 8020a02:	683b      	ldr	r3, [r7, #0]
 8020a04:	681b      	ldr	r3, [r3, #0]
 8020a06:	67fb      	str	r3, [r7, #124]	@ 0x7c
  uint32_t msg_size = _strlen(msg);
 8020a08:	6878      	ldr	r0, [r7, #4]
 8020a0a:	f7ff ff9f 	bl	802094c <_strlen>
 8020a0e:	67b8      	str	r0, [r7, #120]	@ 0x78

  if (msg_size + 9 > MAX_STR_SIZE) {
 8020a10:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 8020a12:	3309      	adds	r3, #9
 8020a14:	2b64      	cmp	r3, #100	@ 0x64
 8020a16:	d904      	bls.n	8020a22 <printf+0x2a>
    __usart1_print("too large error message !!\n\r", MAX_STR_SIZE);
 8020a18:	2164      	movs	r1, #100	@ 0x64
 8020a1a:	483d      	ldr	r0, [pc, #244]	@ (8020b10 <printf+0x118>)
 8020a1c:	f000 f962 	bl	8020ce4 <__usart1_print>
 8020a20:	e072      	b.n	8020b08 <printf+0x110>
    return;
  }
  char hex[10];
  char __msg[MAX_STR_SIZE];

  uint32_t i = 0;
 8020a22:	2300      	movs	r3, #0
 8020a24:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
  int p = 0, q = 0;
 8020a28:	2300      	movs	r3, #0
 8020a2a:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
 8020a2e:	2300      	movs	r3, #0
 8020a30:	f8c7 3084 	str.w	r3, [r7, #132]	@ 0x84
  bool single_sub = false;
 8020a34:	2300      	movs	r3, #0
 8020a36:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83

  for (; i < msg_size; i++) {
 8020a3a:	e04d      	b.n	8020ad8 <printf+0xe0>

    if (msg[i] == '%' && !single_sub) {
 8020a3c:	687a      	ldr	r2, [r7, #4]
 8020a3e:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 8020a42:	4413      	add	r3, r2
 8020a44:	781b      	ldrb	r3, [r3, #0]
 8020a46:	2b25      	cmp	r3, #37	@ 0x25
 8020a48:	d12f      	bne.n	8020aaa <printf+0xb2>
 8020a4a:	f897 3083 	ldrb.w	r3, [r7, #131]	@ 0x83
 8020a4e:	f083 0301 	eor.w	r3, r3, #1
 8020a52:	b2db      	uxtb	r3, r3
 8020a54:	2b00      	cmp	r3, #0
 8020a56:	d028      	beq.n	8020aaa <printf+0xb2>
      hex_str(value, hex);
 8020a58:	f107 036c 	add.w	r3, r7, #108	@ 0x6c
 8020a5c:	4619      	mov	r1, r3
 8020a5e:	6ff8      	ldr	r0, [r7, #124]	@ 0x7c
 8020a60:	f7ff ff8b 	bl	802097a <hex_str>

      while (q - p < 10) {
 8020a64:	e011      	b.n	8020a8a <printf+0x92>
        __msg[q++] = hex[q - p];
 8020a66:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 8020a6a:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8020a6e:	1ad2      	subs	r2, r2, r3
 8020a70:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 8020a74:	1c59      	adds	r1, r3, #1
 8020a76:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 8020a7a:	3290      	adds	r2, #144	@ 0x90
 8020a7c:	443a      	add	r2, r7
 8020a7e:	f812 2c24 	ldrb.w	r2, [r2, #-36]
 8020a82:	3390      	adds	r3, #144	@ 0x90
 8020a84:	443b      	add	r3, r7
 8020a86:	f803 2c88 	strb.w	r2, [r3, #-136]
      while (q - p < 10) {
 8020a8a:	f8d7 2084 	ldr.w	r2, [r7, #132]	@ 0x84
 8020a8e:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8020a92:	1ad3      	subs	r3, r2, r3
 8020a94:	2b09      	cmp	r3, #9
 8020a96:	dde6      	ble.n	8020a66 <printf+0x6e>
      }
      p++;
 8020a98:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8020a9c:	3301      	adds	r3, #1
 8020a9e:	f8c7 3088 	str.w	r3, [r7, #136]	@ 0x88
      single_sub = true;
 8020aa2:	2301      	movs	r3, #1
 8020aa4:	f887 3083 	strb.w	r3, [r7, #131]	@ 0x83
 8020aa8:	e011      	b.n	8020ace <printf+0xd6>
    } else
      __msg[q++] = msg[p++];
 8020aaa:	f8d7 3088 	ldr.w	r3, [r7, #136]	@ 0x88
 8020aae:	1c5a      	adds	r2, r3, #1
 8020ab0:	f8c7 2088 	str.w	r2, [r7, #136]	@ 0x88
 8020ab4:	461a      	mov	r2, r3
 8020ab6:	687b      	ldr	r3, [r7, #4]
 8020ab8:	441a      	add	r2, r3
 8020aba:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 8020abe:	1c59      	adds	r1, r3, #1
 8020ac0:	f8c7 1084 	str.w	r1, [r7, #132]	@ 0x84
 8020ac4:	7812      	ldrb	r2, [r2, #0]
 8020ac6:	3390      	adds	r3, #144	@ 0x90
 8020ac8:	443b      	add	r3, r7
 8020aca:	f803 2c88 	strb.w	r2, [r3, #-136]
  for (; i < msg_size; i++) {
 8020ace:	f8d7 308c 	ldr.w	r3, [r7, #140]	@ 0x8c
 8020ad2:	3301      	adds	r3, #1
 8020ad4:	f8c7 308c 	str.w	r3, [r7, #140]	@ 0x8c
 8020ad8:	f8d7 208c 	ldr.w	r2, [r7, #140]	@ 0x8c
 8020adc:	6fbb      	ldr	r3, [r7, #120]	@ 0x78
 8020ade:	429a      	cmp	r2, r3
 8020ae0:	d3ac      	bcc.n	8020a3c <printf+0x44>
  }
  __msg[q] = '\0';
 8020ae2:	f107 0208 	add.w	r2, r7, #8
 8020ae6:	f8d7 3084 	ldr.w	r3, [r7, #132]	@ 0x84
 8020aea:	4413      	add	r3, r2
 8020aec:	2200      	movs	r2, #0
 8020aee:	701a      	strb	r2, [r3, #0]
  __usart1_print(__msg, _strlen(__msg));
 8020af0:	f107 0308 	add.w	r3, r7, #8
 8020af4:	4618      	mov	r0, r3
 8020af6:	f7ff ff29 	bl	802094c <_strlen>
 8020afa:	4602      	mov	r2, r0
 8020afc:	f107 0308 	add.w	r3, r7, #8
 8020b00:	4611      	mov	r1, r2
 8020b02:	4618      	mov	r0, r3
 8020b04:	f000 f8ee 	bl	8020ce4 <__usart1_print>
}
 8020b08:	3790      	adds	r7, #144	@ 0x90
 8020b0a:	46bd      	mov	sp, r7
 8020b0c:	bd80      	pop	{r7, pc}
 8020b0e:	bf00      	nop
 8020b10:	08021084 	.word	0x08021084

08020b14 <syscall__printf>:

void syscall__printf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 8020b14:	b580      	push	{r7, lr}
 8020b16:	b084      	sub	sp, #16
 8020b18:	af00      	add	r7, sp, #0
 8020b1a:	60f8      	str	r0, [r7, #12]
 8020b1c:	60b9      	str	r1, [r7, #8]
 8020b1e:	607a      	str	r2, [r7, #4]
 8020b20:	603b      	str	r3, [r7, #0]
  semaphore_lock(&sem_usart1);
 8020b22:	4807      	ldr	r0, [pc, #28]	@ (8020b40 <syscall__printf+0x2c>)
 8020b24:	f000 f846 	bl	8020bb4 <semaphore_lock>
  printf((const char *)a, b);
 8020b28:	68fb      	ldr	r3, [r7, #12]
 8020b2a:	68b9      	ldr	r1, [r7, #8]
 8020b2c:	4618      	mov	r0, r3
 8020b2e:	f7ff ff63 	bl	80209f8 <printf>
  semaphore_unlock(&sem_usart1);
 8020b32:	4803      	ldr	r0, [pc, #12]	@ (8020b40 <syscall__printf+0x2c>)
 8020b34:	f000 f868 	bl	8020c08 <semaphore_unlock>
}
 8020b38:	bf00      	nop
 8020b3a:	3710      	adds	r7, #16
 8020b3c:	46bd      	mov	sp, r7
 8020b3e:	bd80      	pop	{r7, pc}
 8020b40:	2000002c 	.word	0x2000002c

08020b44 <syscall__scanf>:

void syscall__scanf(uint32_t a, uint32_t b, uint32_t c, uint32_t d) {
 8020b44:	b480      	push	{r7}
 8020b46:	b085      	sub	sp, #20
 8020b48:	af00      	add	r7, sp, #0
 8020b4a:	60f8      	str	r0, [r7, #12]
 8020b4c:	60b9      	str	r1, [r7, #8]
 8020b4e:	607a      	str	r2, [r7, #4]
 8020b50:	603b      	str	r3, [r7, #0]

  while (1)
 8020b52:	e7fe      	b.n	8020b52 <syscall__scanf+0xe>

08020b54 <__NVIC_SetPendingIRQ>:
  \details Sets the pending bit of a device specific interrupt in the NVIC pending register.
  \param [in]      IRQn  Device specific interrupt number.
  \note    IRQn must not be negative.
 */
__STATIC_INLINE void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
 8020b54:	b480      	push	{r7}
 8020b56:	b083      	sub	sp, #12
 8020b58:	af00      	add	r7, sp, #0
 8020b5a:	4603      	mov	r3, r0
 8020b5c:	71fb      	strb	r3, [r7, #7]
  if ((int32_t)(IRQn) >= 0)
 8020b5e:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8020b62:	2b00      	cmp	r3, #0
 8020b64:	db0c      	blt.n	8020b80 <__NVIC_SetPendingIRQ+0x2c>
  {
    NVIC->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
 8020b66:	79fb      	ldrb	r3, [r7, #7]
 8020b68:	f003 021f 	and.w	r2, r3, #31
 8020b6c:	4907      	ldr	r1, [pc, #28]	@ (8020b8c <__NVIC_SetPendingIRQ+0x38>)
 8020b6e:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8020b72:	095b      	lsrs	r3, r3, #5
 8020b74:	2001      	movs	r0, #1
 8020b76:	fa00 f202 	lsl.w	r2, r0, r2
 8020b7a:	3340      	adds	r3, #64	@ 0x40
 8020b7c:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
  }
}
 8020b80:	bf00      	nop
 8020b82:	370c      	adds	r7, #12
 8020b84:	46bd      	mov	sp, r7
 8020b86:	bc80      	pop	{r7}
 8020b88:	4770      	bx	lr
 8020b8a:	bf00      	nop
 8020b8c:	e000e100 	.word	0xe000e100

08020b90 <semaphore_init>:
#include "core.h"

extern queue_t ready_queue;
extern uint8_t process_count;

void semaphore_init(semaphore_t *sema, uint8_t val) {
 8020b90:	b580      	push	{r7, lr}
 8020b92:	b082      	sub	sp, #8
 8020b94:	af00      	add	r7, sp, #0
 8020b96:	6078      	str	r0, [r7, #4]
 8020b98:	460b      	mov	r3, r1
 8020b9a:	70fb      	strb	r3, [r7, #3]
  sema->value = val; // unlocked
 8020b9c:	687b      	ldr	r3, [r7, #4]
 8020b9e:	78fa      	ldrb	r2, [r7, #3]
 8020ba0:	701a      	strb	r2, [r3, #0]
  queue_init(&(sema->waiting_queue));
 8020ba2:	687b      	ldr	r3, [r7, #4]
 8020ba4:	3304      	adds	r3, #4
 8020ba6:	4618      	mov	r0, r3
 8020ba8:	f7ff fdc0 	bl	802072c <queue_init>
}
 8020bac:	bf00      	nop
 8020bae:	3708      	adds	r7, #8
 8020bb0:	46bd      	mov	sp, r7
 8020bb2:	bd80      	pop	{r7, pc}

08020bb4 <semaphore_lock>:

/* this has to be atomic */
void semaphore_lock(semaphore_t *sema) {
 8020bb4:	b580      	push	{r7, lr}
 8020bb6:	b084      	sub	sp, #16
 8020bb8:	af00      	add	r7, sp, #0
 8020bba:	6078      	str	r0, [r7, #4]
  __ASM volatile ("cpsid i" : : : "memory");
 8020bbc:	b672      	cpsid	i
}
 8020bbe:	bf00      	nop
  __disable_irq();
  if (sema->value == 0) { // semaphore cannot be locked ...
 8020bc0:	687b      	ldr	r3, [r7, #4]
 8020bc2:	781b      	ldrb	r3, [r3, #0]
 8020bc4:	2b00      	cmp	r3, #0
 8020bc6:	d112      	bne.n	8020bee <semaphore_lock+0x3a>
    user_process_t *running_process =
        *((user_process_t **)(RUNNING_PROCESS_AD));
 8020bc8:	4b0e      	ldr	r3, [pc, #56]	@ (8020c04 <semaphore_lock+0x50>)
    user_process_t *running_process =
 8020bca:	681b      	ldr	r3, [r3, #0]
 8020bcc:	60fb      	str	r3, [r7, #12]
    queue_push(&(sema->waiting_queue), running_process);
 8020bce:	687b      	ldr	r3, [r7, #4]
 8020bd0:	3304      	adds	r3, #4
 8020bd2:	68f9      	ldr	r1, [r7, #12]
 8020bd4:	4618      	mov	r0, r3
 8020bd6:	f7ff fdbe 	bl	8020756 <queue_push>
    running_process->state = WAITING_STATE;
 8020bda:	68fb      	ldr	r3, [r7, #12]
 8020bdc:	2203      	movs	r2, #3
 8020bde:	62da      	str	r2, [r3, #44]	@ 0x2c

//    schedular ();

    /* call PendSV_Handler for context switching */
    //PendSV_Handler();
    NVIC_SetPendingIRQ (PendSV_IRQn);
 8020be0:	f06f 0001 	mvn.w	r0, #1
 8020be4:	f7ff ffb6 	bl	8020b54 <__NVIC_SetPendingIRQ>
  __ASM volatile ("cpsie i" : : : "memory");
 8020be8:	b662      	cpsie	i
}
 8020bea:	bf00      	nop

    __enable_irq();
    return;
 8020bec:	e007      	b.n	8020bfe <semaphore_lock+0x4a>
  }
  sema->value--;
 8020bee:	687b      	ldr	r3, [r7, #4]
 8020bf0:	781b      	ldrb	r3, [r3, #0]
 8020bf2:	3b01      	subs	r3, #1
 8020bf4:	b2da      	uxtb	r2, r3
 8020bf6:	687b      	ldr	r3, [r7, #4]
 8020bf8:	701a      	strb	r2, [r3, #0]
  __ASM volatile ("cpsie i" : : : "memory");
 8020bfa:	b662      	cpsie	i
}
 8020bfc:	bf00      	nop
  __enable_irq();
}
 8020bfe:	3710      	adds	r7, #16
 8020c00:	46bd      	mov	sp, r7
 8020c02:	bd80      	pop	{r7, pc}
 8020c04:	20016004 	.word	0x20016004

08020c08 <semaphore_unlock>:

void semaphore_unlock(semaphore_t *sema) {
 8020c08:	b580      	push	{r7, lr}
 8020c0a:	b084      	sub	sp, #16
 8020c0c:	af00      	add	r7, sp, #0
 8020c0e:	6078      	str	r0, [r7, #4]
  __ASM volatile ("cpsid i" : : : "memory");
 8020c10:	b672      	cpsid	i
}
 8020c12:	bf00      	nop
  __disable_irq();
  sema->value++;
 8020c14:	687b      	ldr	r3, [r7, #4]
 8020c16:	781b      	ldrb	r3, [r3, #0]
 8020c18:	3301      	adds	r3, #1
 8020c1a:	b2da      	uxtb	r2, r3
 8020c1c:	687b      	ldr	r3, [r7, #4]
 8020c1e:	701a      	strb	r2, [r3, #0]
  /* unlocked */
  user_process_t *process = queue_front(&(sema->waiting_queue));
 8020c20:	687b      	ldr	r3, [r7, #4]
 8020c22:	3304      	adds	r3, #4
 8020c24:	4618      	mov	r0, r3
 8020c26:	f7ff fe19 	bl	802085c <queue_front>
 8020c2a:	60f8      	str	r0, [r7, #12]
  if (!process) {
 8020c2c:	68fb      	ldr	r3, [r7, #12]
 8020c2e:	2b00      	cmp	r3, #0
 8020c30:	d102      	bne.n	8020c38 <semaphore_unlock+0x30>
  __ASM volatile ("cpsie i" : : : "memory");
 8020c32:	b662      	cpsie	i
}
 8020c34:	bf00      	nop
    /* no process is waiting */
    __enable_irq();
    return;
 8020c36:	e00d      	b.n	8020c54 <semaphore_unlock+0x4c>
  }
  queue_pop(&(sema->waiting_queue));
 8020c38:	687b      	ldr	r3, [r7, #4]
 8020c3a:	3304      	adds	r3, #4
 8020c3c:	4618      	mov	r0, r3
 8020c3e:	f7ff fdcf 	bl	80207e0 <queue_pop>
  process->state = READY_STATE;
 8020c42:	68fb      	ldr	r3, [r7, #12]
 8020c44:	2200      	movs	r2, #0
 8020c46:	62da      	str	r2, [r3, #44]	@ 0x2c
  queue_push(&ready_queue, process);
 8020c48:	68f9      	ldr	r1, [r7, #12]
 8020c4a:	4804      	ldr	r0, [pc, #16]	@ (8020c5c <semaphore_unlock+0x54>)
 8020c4c:	f7ff fd83 	bl	8020756 <queue_push>
  __ASM volatile ("cpsie i" : : : "memory");
 8020c50:	b662      	cpsie	i
}
 8020c52:	bf00      	nop
  __enable_irq();
}
 8020c54:	3710      	adds	r7, #16
 8020c56:	46bd      	mov	sp, r7
 8020c58:	bd80      	pop	{r7, pc}
 8020c5a:	bf00      	nop
 8020c5c:	200003b8 	.word	0x200003b8

08020c60 <__usart1_init>:
#include "core.h"
#include "usart.h"

void __usart1_init(void) {
 8020c60:	b480      	push	{r7}
 8020c62:	af00      	add	r7, sp, #0

  RCC->APB2ENR |= RCC_APB2ENR_USART1EN_Msk;
 8020c64:	4b1c      	ldr	r3, [pc, #112]	@ (8020cd8 <__usart1_init+0x78>)
 8020c66:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 8020c68:	4a1b      	ldr	r2, [pc, #108]	@ (8020cd8 <__usart1_init+0x78>)
 8020c6a:	f043 0310 	orr.w	r3, r3, #16
 8020c6e:	6453      	str	r3, [r2, #68]	@ 0x44
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
 8020c70:	4b19      	ldr	r3, [pc, #100]	@ (8020cd8 <__usart1_init+0x78>)
 8020c72:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8020c74:	4a18      	ldr	r2, [pc, #96]	@ (8020cd8 <__usart1_init+0x78>)
 8020c76:	f043 0301 	orr.w	r3, r3, #1
 8020c7a:	6313      	str	r3, [r2, #48]	@ 0x30
  // alternate function mode
  GPIOA->MODER &= ~((3 << (2 * TX_PIN)) | (3 << (2 * RX_PIN)));
 8020c7c:	4b17      	ldr	r3, [pc, #92]	@ (8020cdc <__usart1_init+0x7c>)
 8020c7e:	681b      	ldr	r3, [r3, #0]
 8020c80:	4a16      	ldr	r2, [pc, #88]	@ (8020cdc <__usart1_init+0x7c>)
 8020c82:	f423 1370 	bic.w	r3, r3, #3932160	@ 0x3c0000
 8020c86:	6013      	str	r3, [r2, #0]
  GPIOA->MODER |= 2 << (2 * TX_PIN) | 2 << (2 * RX_PIN);
 8020c88:	4b14      	ldr	r3, [pc, #80]	@ (8020cdc <__usart1_init+0x7c>)
 8020c8a:	681b      	ldr	r3, [r3, #0]
 8020c8c:	4a13      	ldr	r2, [pc, #76]	@ (8020cdc <__usart1_init+0x7c>)
 8020c8e:	f443 1320 	orr.w	r3, r3, #2621440	@ 0x280000
 8020c92:	6013      	str	r3, [r2, #0]
  // high speed
  GPIOA->OSPEEDR |= (3 << (TX_PIN * 2)) | (3 << (RX_PIN * 2));
 8020c94:	4b11      	ldr	r3, [pc, #68]	@ (8020cdc <__usart1_init+0x7c>)
 8020c96:	689b      	ldr	r3, [r3, #8]
 8020c98:	4a10      	ldr	r2, [pc, #64]	@ (8020cdc <__usart1_init+0x7c>)
 8020c9a:	f443 1370 	orr.w	r3, r3, #3932160	@ 0x3c0000
 8020c9e:	6093      	str	r3, [r2, #8]
  // clear the bits in AFR register
  GPIOA->AFR[1] &= ~((0xf << 4) | (0xf << 8));
 8020ca0:	4b0e      	ldr	r3, [pc, #56]	@ (8020cdc <__usart1_init+0x7c>)
 8020ca2:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020ca4:	4a0d      	ldr	r2, [pc, #52]	@ (8020cdc <__usart1_init+0x7c>)
 8020ca6:	f423 637f 	bic.w	r3, r3, #4080	@ 0xff0
 8020caa:	6253      	str	r3, [r2, #36]	@ 0x24
  // set for af7
  GPIOA->AFR[1] |= (7 << 4) | (7 << 8);
 8020cac:	4b0b      	ldr	r3, [pc, #44]	@ (8020cdc <__usart1_init+0x7c>)
 8020cae:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020cb0:	4a0a      	ldr	r2, [pc, #40]	@ (8020cdc <__usart1_init+0x7c>)
 8020cb2:	f443 63ee 	orr.w	r3, r3, #1904	@ 0x770
 8020cb6:	6253      	str	r3, [r2, #36]	@ 0x24

  // enable usart, reciever, transiever
  USART1->CR1 |= USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
 8020cb8:	4b09      	ldr	r3, [pc, #36]	@ (8020ce0 <__usart1_init+0x80>)
 8020cba:	68db      	ldr	r3, [r3, #12]
 8020cbc:	4a08      	ldr	r2, [pc, #32]	@ (8020ce0 <__usart1_init+0x80>)
 8020cbe:	f443 5300 	orr.w	r3, r3, #8192	@ 0x2000
 8020cc2:	f043 030c 	orr.w	r3, r3, #12
 8020cc6:	60d3      	str	r3, [r2, #12]
  // set the baud rate (115200 in this case)
  USART1->BRR = 0x08B;
 8020cc8:	4b05      	ldr	r3, [pc, #20]	@ (8020ce0 <__usart1_init+0x80>)
 8020cca:	228b      	movs	r2, #139	@ 0x8b
 8020ccc:	609a      	str	r2, [r3, #8]
}
 8020cce:	bf00      	nop
 8020cd0:	46bd      	mov	sp, r7
 8020cd2:	bc80      	pop	{r7}
 8020cd4:	4770      	bx	lr
 8020cd6:	bf00      	nop
 8020cd8:	40023800 	.word	0x40023800
 8020cdc:	40020000 	.word	0x40020000
 8020ce0:	40011000 	.word	0x40011000

08020ce4 <__usart1_print>:

void __usart1_print(const char *msg, uint32_t size) {
 8020ce4:	b480      	push	{r7}
 8020ce6:	b085      	sub	sp, #20
 8020ce8:	af00      	add	r7, sp, #0
 8020cea:	6078      	str	r0, [r7, #4]
 8020cec:	6039      	str	r1, [r7, #0]

  // semaphore_lock(&sem_usart1);
  //enterCRITICAL();
  int i = 0;
 8020cee:	2300      	movs	r3, #0
 8020cf0:	60fb      	str	r3, [r7, #12]
  while (i < size && msg[i] != '\0') {
 8020cf2:	e00f      	b.n	8020d14 <__usart1_print+0x30>
    while (!(USART1->SR & USART_SR_TXE))
 8020cf4:	bf00      	nop
 8020cf6:	4b13      	ldr	r3, [pc, #76]	@ (8020d44 <__usart1_print+0x60>)
 8020cf8:	681b      	ldr	r3, [r3, #0]
 8020cfa:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8020cfe:	2b00      	cmp	r3, #0
 8020d00:	d0f9      	beq.n	8020cf6 <__usart1_print+0x12>
      ;
    USART1->DR = msg[i++];
 8020d02:	68fb      	ldr	r3, [r7, #12]
 8020d04:	1c5a      	adds	r2, r3, #1
 8020d06:	60fa      	str	r2, [r7, #12]
 8020d08:	461a      	mov	r2, r3
 8020d0a:	687b      	ldr	r3, [r7, #4]
 8020d0c:	4413      	add	r3, r2
 8020d0e:	781a      	ldrb	r2, [r3, #0]
 8020d10:	4b0c      	ldr	r3, [pc, #48]	@ (8020d44 <__usart1_print+0x60>)
 8020d12:	605a      	str	r2, [r3, #4]
  while (i < size && msg[i] != '\0') {
 8020d14:	68fb      	ldr	r3, [r7, #12]
 8020d16:	683a      	ldr	r2, [r7, #0]
 8020d18:	429a      	cmp	r2, r3
 8020d1a:	d905      	bls.n	8020d28 <__usart1_print+0x44>
 8020d1c:	68fb      	ldr	r3, [r7, #12]
 8020d1e:	687a      	ldr	r2, [r7, #4]
 8020d20:	4413      	add	r3, r2
 8020d22:	781b      	ldrb	r3, [r3, #0]
 8020d24:	2b00      	cmp	r3, #0
 8020d26:	d1e5      	bne.n	8020cf4 <__usart1_print+0x10>
  }
  while (!(USART1->SR & USART_SR_TC)) {
 8020d28:	bf00      	nop
 8020d2a:	4b06      	ldr	r3, [pc, #24]	@ (8020d44 <__usart1_print+0x60>)
 8020d2c:	681b      	ldr	r3, [r3, #0]
 8020d2e:	f003 0340 	and.w	r3, r3, #64	@ 0x40
 8020d32:	2b00      	cmp	r3, #0
 8020d34:	d0f9      	beq.n	8020d2a <__usart1_print+0x46>
  }
  //exitCRITICAL();
  // semaphore_unlock(&sem_usart1);
}
 8020d36:	bf00      	nop
 8020d38:	bf00      	nop
 8020d3a:	3714      	adds	r7, #20
 8020d3c:	46bd      	mov	sp, r7
 8020d3e:	bc80      	pop	{r7}
 8020d40:	4770      	bx	lr
 8020d42:	bf00      	nop
 8020d44:	40011000 	.word	0x40011000

08020d48 <Reset_Handler>:
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
 8020d48:	f7ff f9fa 	bl	8020140 <resetHandlerHelper>
    B main
 8020d4c:	f7ff bb12 	b.w	8020374 <main>

08020d50 <hang>:
hang:
    B .
 8020d50:	e7fe      	b.n	8020d50 <hang>

08020d52 <Default_Handler>:

.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .
 8020d52:	e7fe      	b.n	8020d52 <Default_Handler>

08020d54 <NMI_Handler>:

.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .
 8020d54:	e7fe      	b.n	8020d54 <NMI_Handler>

08020d56 <DebugMon_Handler>:

.section .text.DebugMon_Handler
.global DebugMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .
 8020d56:	e7fe      	b.n	8020d56 <DebugMon_Handler>

08020d58 <PendSV_Handler>:
.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    cpsid i
 8020d58:	b672      	cpsid	i

    push {lr}
 8020d5a:	b500      	push	{lr}
    bl schedular
 8020d5c:	f7ff fdb2 	bl	80208c4 <schedular>
    pop {lr}
 8020d60:	f85d eb04 	ldr.w	lr, [sp], #4

    /************************ start saving reg*********************************/
    ldr r0, =RUNNING_PROCESS
 8020d64:	4813      	ldr	r0, [pc, #76]	@ (8020db4 <PendSV_Handler+0x5c>)
    ldr r1, [r0]            // r1 now contain the struct address
 8020d66:	6801      	ldr	r1, [r0, #0]
    

    stmia r1!, {r4-r11}     // r4->r11 stored in the runnging process struct
 8020d68:	e8a1 0ff0 	stmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}

    mrs r0, psp
 8020d6c:	f3ef 8009 	mrs	r0, PSP
    str r0, [r1]
 8020d70:	6008      	str	r0, [r1, #0]
    add r1, #4
 8020d72:	f101 0104 	add.w	r1, r1, #4
    
    mrs r0, msp
 8020d76:	f3ef 8008 	mrs	r0, MSP
    str r0, [r1]
 8020d7a:	6008      	str	r0, [r1, #0]
    add r1, #4
 8020d7c:	f101 0104 	add.w	r1, r1, #4
    
    str lr, [r1]            // important !!! store the exec_return value
 8020d80:	f8c1 e000 	str.w	lr, [r1]
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
 8020d84:	480c      	ldr	r0, [pc, #48]	@ (8020db8 <PendSV_Handler+0x60>)
    ldr r1, [r0]
 8020d86:	6801      	ldr	r1, [r0, #0]
    ldmia r1!, {r4-r11}
 8020d88:	e8b1 0ff0 	ldmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
   

    /* before setting psp, msp, faultmask, basepri -> mask all interrupt
    so that no interrupt can be fired in the middle of setting important regs*/

    ldr r0, [r1]
 8020d8c:	6808      	ldr	r0, [r1, #0]
    msr psp, r0
 8020d8e:	f380 8809 	msr	PSP, r0
    add r1, #4
 8020d92:	f101 0104 	add.w	r1, r1, #4
    
    ldr r0, [r1]
 8020d96:	6808      	ldr	r0, [r1, #0]
    msr msp, r0
 8020d98:	f380 8808 	msr	MSP, r0
    add r1, #4
 8020d9c:	f101 0104 	add.w	r1, r1, #4
    
    ldr lr, [r1]
 8020da0:	f8d1 e000 	ldr.w	lr, [r1]

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
 8020da4:	4804      	ldr	r0, [pc, #16]	@ (8020db8 <PendSV_Handler+0x60>)
    ldr r1, =RUNNING_PROCESS
 8020da6:	4903      	ldr	r1, [pc, #12]	@ (8020db4 <PendSV_Handler+0x5c>)
    ldr r2, [r0]
 8020da8:	6802      	ldr	r2, [r0, #0]
    str r2, [r1]
 8020daa:	600a      	str	r2, [r1, #0]
    
    dsb
 8020dac:	f3bf 8f4f 	dsb	sy

    cpsie i
 8020db0:	b662      	cpsie	i

    bx lr
 8020db2:	4770      	bx	lr
    ldr r0, =RUNNING_PROCESS
 8020db4:	20016004 	.word	0x20016004
    ldr r0, =PICKED_PROCESS
 8020db8:	20016008 	.word	0x20016008

08020dbc <SysTick_Handler>:
    caller saved register it will be recovered before returning from the isr*/
    

    /*****************set the PendSV interrupt*********************/
    
    ldr r0, =0xE000ED04      // Address of ICSR register
 8020dbc:	4802      	ldr	r0, [pc, #8]	@ (8020dc8 <SysTick_Handler+0xc>)
    ldr r1, =0x10000000      // Bit 28 (PENDSVSET)
 8020dbe:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
    str r1, [r0]             // Set PendSV pending
 8020dc2:	6001      	str	r1, [r0, #0]


    bx lr
 8020dc4:	4770      	bx	lr
 8020dc6:	0000      	.short	0x0000
    ldr r0, =0xE000ED04      // Address of ICSR register
 8020dc8:	e000ed04 	.word	0xe000ed04

08020dcc <SVC_Handler>:
.section .text.SVC_Handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler:
    /* r0, r1, r2, r3 stores the arguments of systemcall */
    push {r0, r1, r2, r3}
 8020dcc:	b40f      	push	{r0, r1, r2, r3}

    tst lr, #4
 8020dce:	f01e 0f04 	tst.w	lr, #4
    ite eq
 8020dd2:	bf0c      	ite	eq
    mrseq r0, msp
 8020dd4:	f3ef 8008 	mrseq	r0, MSP
    mrsne r0, psp
 8020dd8:	f3ef 8009 	mrsne	r0, PSP

    add r0, #24 /* retrieve the old pc that is stacked*/
 8020ddc:	f100 0018 	add.w	r0, r0, #24
    ldr r1, [r0]
 8020de0:	6801      	ldr	r1, [r0, #0]
    sub r1, #2      /*move 2 bytes before to get the scv immidiate*/
 8020de2:	f1a1 0102 	sub.w	r1, r1, #2
    ldrb r0, [r1]   /*r0 now contains the immidiate value*/
 8020de6:	7808      	ldrb	r0, [r1, #0]

    
    ldr r2, =SYSCALL_TABLE_AD
 8020de8:	4a07      	ldr	r2, [pc, #28]	@ (8020e08 <SVC_Handler+0x3c>)
    ldr r1, [r2]            // r1 contains the address of syscall_table
 8020dea:	6811      	ldr	r1, [r2, #0]
                            // r0 contains the immidate value
    
    mov r3, #4
 8020dec:	f04f 0304 	mov.w	r3, #4
    mul r0, r3 
 8020df0:	fb03 f000 	mul.w	r0, r3, r0
    add r1, r0 
 8020df4:	4401      	add	r1, r0

    mov r12, r1            // store the address of service function in r12
 8020df6:	468c      	mov	ip, r1
    ldr r12, [r12]
 8020df8:	f8dc c000 	ldr.w	ip, [ip]

    pop {r0, r1, r2, r3}
 8020dfc:	bc0f      	pop	{r0, r1, r2, r3}

    push {lr}
 8020dfe:	b500      	push	{lr}
    blx r12
 8020e00:	47e0      	blx	ip
    pop {lr}
 8020e02:	f85d eb04 	ldr.w	lr, [sp], #4


    bx lr
 8020e06:	4770      	bx	lr
    ldr r2, =SYSCALL_TABLE_AD
 8020e08:	2001600c 	.word	0x2001600c

08020e0c <BusFault_Handler>:
// r0 -> pc, r1 -> fault type, r2 -> fault in kernel / userproc
.section .text.BusFault_Handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler:
    ldr r0, =0xfffffffd
 8020e0c:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0
 8020e10:	4586      	cmp	lr, r0
    ittee eq 
 8020e12:	bf07      	ittee	eq
    mrseq r0, psp
 8020e14:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8020e18:	2200      	moveq	r2, #0
    mrsne r0, msp
 8020e1a:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8020e1e:	2201      	movne	r2, #1

    /* find pc */
    ldr r0, [r0, #24]
 8020e20:	6980      	ldr	r0, [r0, #24]
    mov r1, BusFault_Identifier
 8020e22:	f04f 0100 	mov.w	r1, #0
    push {lr}
 8020e26:	b500      	push	{lr}
    bl fault_handler_helper
 8020e28:	f7ff f9f0 	bl	802020c <fault_handler_helper>
    pop {lr}
 8020e2c:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8020e30:	4770      	bx	lr

08020e32 <MemManage_Handler>:
/***********************MemManage_Handler start************************/
.section .text.MemManage_Handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler:
    ldr r0, =0xfffffffd 
 8020e32:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8020e36:	4586      	cmp	lr, r0

    ittee eq 
 8020e38:	bf07      	ittee	eq
    mrseq r0, psp
 8020e3a:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8020e3e:	2200      	moveq	r2, #0
    mrsne r0, msp
 8020e40:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8020e44:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8020e46:	6980      	ldr	r0, [r0, #24]
    mov r1, MemManage_Identifier
 8020e48:	f04f 0101 	mov.w	r1, #1
    push {lr}
 8020e4c:	b500      	push	{lr}
    bl fault_handler_helper
 8020e4e:	f7ff f9dd 	bl	802020c <fault_handler_helper>
    pop {lr}
 8020e52:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8020e56:	4770      	bx	lr

08020e58 <UsageFault_Handler>:

.section .text.UsageFault_Handler
.global UsageFault_Handler 
.type UsageFault_Handler, %function
UsageFault_Handler:
    ldr r0, =0xfffffffd 
 8020e58:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8020e5c:	4586      	cmp	lr, r0

    ittee eq 
 8020e5e:	bf07      	ittee	eq
    mrseq r0, psp
 8020e60:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8020e64:	2200      	moveq	r2, #0
    mrsne r0, msp
 8020e66:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8020e6a:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 8020e6c:	6980      	ldr	r0, [r0, #24]
    mov r1, UsageFault_Identifier
 8020e6e:	f04f 0102 	mov.w	r1, #2
    push {lr}
 8020e72:	b500      	push	{lr}
    bl fault_handler_helper
 8020e74:	f7ff f9ca 	bl	802020c <fault_handler_helper>
    pop {lr}
 8020e78:	f85d eb04 	ldr.w	lr, [sp], #4
    
    bx lr
 8020e7c:	4770      	bx	lr
	...

08020e80 <HardFault_Handler>:
.section .text.HardFault_Handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler:

    ldr r0, =0xfffffffd 
 8020e80:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 8020e84:	4586      	cmp	lr, r0
    ite eq 
 8020e86:	bf0c      	ite	eq
    mrseq r0, psp
 8020e88:	f3ef 8009 	mrseq	r0, PSP
    mrsne r0, msp
 8020e8c:	f3ef 8008 	mrsne	r0, MSP
    
    /* find pc */
    ldr r0, [r0, #24]
 8020e90:	6980      	ldr	r0, [r0, #24]
    
    /* after getting the pc, msp can be safely altered !!!*/
    ldr r1, =_estack
 8020e92:	4904      	ldr	r1, [pc, #16]	@ (8020ea4 <HardFault_Handler+0x24>)
    msr msp, r1
 8020e94:	f381 8808 	msr	MSP, r1

    push {lr}
 8020e98:	b500      	push	{lr}
    bl HardFault_Handler_helper
 8020e9a:	f7ff fa3b 	bl	8020314 <HardFault_Handler_helper>
    pop {lr}
 8020e9e:	f85d eb04 	ldr.w	lr, [sp], #4

    b .
 8020ea2:	e7fe      	b.n	8020ea2 <HardFault_Handler+0x22>
    ldr r1, =_estack
 8020ea4:	20018000 	.word	0x20018000

08020ea8 <__asm__set_psp>:

.global __asm__set_psp
.type __asm__set_psp, %function 
__asm__set_psp:
    /* r0 contains the argument*/
    msr psp, r0
 8020ea8:	f380 8809 	msr	PSP, r0
    bx lr
 8020eac:	4770      	bx	lr

08020eae <__asm__set_msp>:

.global __asm__set_msp
.type __asm__set_msp, %function
__asm__set_msp:
    /* r0 contains the argument*/
    msr msp, r0
 8020eae:	f380 8808 	msr	MSP, r0
    bx lr
 8020eb2:	4770      	bx	lr

Disassembly of section .usertext:

080212c0 <main1-0xed40>:
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
 8030020:	080210a4 	.word	0x080210a4
 8030024:	080210bc 	.word	0x080210bc
 8030028:	080210e0 	.word	0x080210e0

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
 803003c:	08021100 	.word	0x08021100

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
 8030050:	08021120 	.word	0x08021120

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
 8030064:	08021140 	.word	0x08021140

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
 8030078:	08021160 	.word	0x08021160

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
 803008c:	08021180 	.word	0x08021180

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
 80300a0:	080211a0 	.word	0x080211a0

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
 80300b4:	080211c0 	.word	0x080211c0

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
 80300c8:	080211e0 	.word	0x080211e0

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
 80300dc:	08021200 	.word	0x08021200

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
 80300f0:	08021220 	.word	0x08021220

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
 8030104:	08021240 	.word	0x08021240

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
 8030118:	08021260 	.word	0x08021260

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
 803012c:	08021280 	.word	0x08021280

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
 8030140:	080212a0 	.word	0x080212a0

08030144 <__asm__launch_main1>:
 8030144:	f04f 0003 	mov.w	r0, #3
 8030148:	f380 8814 	msr	CONTROL, r0
 803014c:	f3bf 8f6f 	isb	sy
 8030150:	f7ff ff56 	bl	8030000 <main1>

08030154 <user_printf>:
 8030154:	df00      	svc	0
 8030156:	4770      	bx	lr
