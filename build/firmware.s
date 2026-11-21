
build/firmware.elf:     file format elf32-littlearm


Disassembly of section .text:

08020140 <mpu_setup>:
#include "core.h"

void mpu_setup(void) {
 8020140:	b480      	push	{r7}
 8020142:	af00      	add	r7, sp, #0

  /*dissable mpu*/
  MPU->CTRL = 0;
 8020144:	4b12      	ldr	r3, [pc, #72]	@ (8020190 <mpu_setup+0x50>)
 8020146:	2200      	movs	r2, #0
 8020148:	605a      	str	r2, [r3, #4]

  /*region 0*/
  MPU->RNR = 0;
 802014a:	4b11      	ldr	r3, [pc, #68]	@ (8020190 <mpu_setup+0x50>)
 802014c:	2200      	movs	r2, #0
 802014e:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sFLASHUserSpace);
 8020150:	4b0f      	ldr	r3, [pc, #60]	@ (8020190 <mpu_setup+0x50>)
 8020152:	4a10      	ldr	r2, [pc, #64]	@ (8020194 <mpu_setup+0x54>)
 8020154:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 8020156:	4b0e      	ldr	r3, [pc, #56]	@ (8020190 <mpu_setup+0x50>)
 8020158:	4a0f      	ldr	r2, [pc, #60]	@ (8020198 <mpu_setup+0x58>)
 802015a:	611a      	str	r2, [r3, #16]
      (0 << MPU_RASR_XN_Pos) |     // Executable (XN = 0)
      (0b110 << MPU_RASR_AP_Pos) | // Privileged read-only user read-only
      (15 << MPU_RASR_SIZE_Pos) |  // 64 KB region
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 1;
 802015c:	4b0c      	ldr	r3, [pc, #48]	@ (8020190 <mpu_setup+0x50>)
 802015e:	2201      	movs	r2, #1
 8020160:	609a      	str	r2, [r3, #8]
  MPU->RBAR = (uint32_t)(&_sSRAMUserSpace);
 8020162:	4b0b      	ldr	r3, [pc, #44]	@ (8020190 <mpu_setup+0x50>)
 8020164:	4a0d      	ldr	r2, [pc, #52]	@ (802019c <mpu_setup+0x5c>)
 8020166:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 8020168:	4b09      	ldr	r3, [pc, #36]	@ (8020190 <mpu_setup+0x50>)
 802016a:	4a0d      	ldr	r2, [pc, #52]	@ (80201a0 <mpu_setup+0x60>)
 802016c:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->RNR = 2;
 802016e:	4b08      	ldr	r3, [pc, #32]	@ (8020190 <mpu_setup+0x50>)
 8020170:	2202      	movs	r2, #2
 8020172:	609a      	str	r2, [r3, #8]
  MPU->RBAR = USER_STACK_END;
 8020174:	4b06      	ldr	r3, [pc, #24]	@ (8020190 <mpu_setup+0x50>)
 8020176:	4a0b      	ldr	r2, [pc, #44]	@ (80201a4 <mpu_setup+0x64>)
 8020178:	60da      	str	r2, [r3, #12]
  MPU->RASR =
 802017a:	4b05      	ldr	r3, [pc, #20]	@ (8020190 <mpu_setup+0x50>)
 802017c:	4a08      	ldr	r2, [pc, #32]	@ (80201a0 <mpu_setup+0x60>)
 802017e:	611a      	str	r2, [r3, #16]
      (1 << MPU_RASR_XN_Pos) |     // non Executable
      (0b011 << MPU_RASR_AP_Pos) | // privillage read write user read-write
      (14 << MPU_RASR_SIZE_Pos) |  // 32 KB size
      MPU_RASR_ENABLE_Msk;

  MPU->CTRL = MPU_CTRL_PRIVDEFENA_Msk | MPU_CTRL_ENABLE_Msk;
 8020180:	4b03      	ldr	r3, [pc, #12]	@ (8020190 <mpu_setup+0x50>)
 8020182:	2205      	movs	r2, #5
 8020184:	605a      	str	r2, [r3, #4]
}
 8020186:	bf00      	nop
 8020188:	46bd      	mov	sp, r7
 802018a:	bc80      	pop	{r7}
 802018c:	4770      	bx	lr
 802018e:	bf00      	nop
 8020190:	e000ed90 	.word	0xe000ed90
 8020194:	08030000 	.word	0x08030000
 8020198:	0600001f 	.word	0x0600001f
 802019c:	20004000 	.word	0x20004000
 80201a0:	1300001d 	.word	0x1300001d
 80201a4:	20008000 	.word	0x20008000

080201a8 <queue_init>:
#include "core.h"

/* queue functions */
void queue_init (queue_t* q){
 80201a8:	b480      	push	{r7}
 80201aa:	b083      	sub	sp, #12
 80201ac:	af00      	add	r7, sp, #0
 80201ae:	6078      	str	r0, [r7, #4]
    q->size = 0;
 80201b0:	687b      	ldr	r3, [r7, #4]
 80201b2:	2200      	movs	r2, #0
 80201b4:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    q->front = 0xff;
 80201b8:	687b      	ldr	r3, [r7, #4]
 80201ba:	22ff      	movs	r2, #255	@ 0xff
 80201bc:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    q->rare = 0;
 80201c0:	687b      	ldr	r3, [r7, #4]
 80201c2:	2200      	movs	r2, #0
 80201c4:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
}
 80201c8:	bf00      	nop
 80201ca:	370c      	adds	r7, #12
 80201cc:	46bd      	mov	sp, r7
 80201ce:	bc80      	pop	{r7}
 80201d0:	4770      	bx	lr

080201d2 <queue_push>:

uint8_t queue_push (queue_t* q, user_process_t* process){
 80201d2:	b480      	push	{r7}
 80201d4:	b083      	sub	sp, #12
 80201d6:	af00      	add	r7, sp, #0
 80201d8:	6078      	str	r0, [r7, #4]
 80201da:	6039      	str	r1, [r7, #0]
    if (q->front == 0xff){
 80201dc:	687b      	ldr	r3, [r7, #4]
 80201de:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 80201e2:	2bff      	cmp	r3, #255	@ 0xff
 80201e4:	d104      	bne.n	80201f0 <queue_push+0x1e>
        /* queue is empty */
        q->front = 0;
 80201e6:	687b      	ldr	r3, [r7, #4]
 80201e8:	2200      	movs	r2, #0
 80201ea:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
 80201ee:	e009      	b.n	8020204 <queue_push+0x32>
    }
    else if (q->rare == q->front) return -1;
 80201f0:	687b      	ldr	r3, [r7, #4]
 80201f2:	f893 207a 	ldrb.w	r2, [r3, #122]	@ 0x7a
 80201f6:	687b      	ldr	r3, [r7, #4]
 80201f8:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 80201fc:	429a      	cmp	r2, r3
 80201fe:	d101      	bne.n	8020204 <queue_push+0x32>
 8020200:	23ff      	movs	r3, #255	@ 0xff
 8020202:	e023      	b.n	802024c <queue_push+0x7a>

    q->processes [q->rare] = process;
 8020204:	687b      	ldr	r3, [r7, #4]
 8020206:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 802020a:	4619      	mov	r1, r3
 802020c:	687b      	ldr	r3, [r7, #4]
 802020e:	683a      	ldr	r2, [r7, #0]
 8020210:	f843 2021 	str.w	r2, [r3, r1, lsl #2]
    q->rare = (q->rare + 1) % MAX_PROCESS_NUM;
 8020214:	687b      	ldr	r3, [r7, #4]
 8020216:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 802021a:	1c5a      	adds	r2, r3, #1
 802021c:	4b0e      	ldr	r3, [pc, #56]	@ (8020258 <queue_push+0x86>)
 802021e:	fb83 1302 	smull	r1, r3, r3, r2
 8020222:	4413      	add	r3, r2
 8020224:	10d9      	asrs	r1, r3, #3
 8020226:	17d3      	asrs	r3, r2, #31
 8020228:	1ac9      	subs	r1, r1, r3
 802022a:	460b      	mov	r3, r1
 802022c:	011b      	lsls	r3, r3, #4
 802022e:	1a5b      	subs	r3, r3, r1
 8020230:	1ad1      	subs	r1, r2, r3
 8020232:	b2ca      	uxtb	r2, r1
 8020234:	687b      	ldr	r3, [r7, #4]
 8020236:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a

    q->size ++ ;
 802023a:	687b      	ldr	r3, [r7, #4]
 802023c:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 8020240:	3301      	adds	r3, #1
 8020242:	b2da      	uxtb	r2, r3
 8020244:	687b      	ldr	r3, [r7, #4]
 8020246:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 802024a:	2300      	movs	r3, #0
}
 802024c:	4618      	mov	r0, r3
 802024e:	370c      	adds	r7, #12
 8020250:	46bd      	mov	sp, r7
 8020252:	bc80      	pop	{r7}
 8020254:	4770      	bx	lr
 8020256:	bf00      	nop
 8020258:	88888889 	.word	0x88888889

0802025c <queue_pop>:

uint8_t queue_pop (queue_t* q){   
 802025c:	b480      	push	{r7}
 802025e:	b083      	sub	sp, #12
 8020260:	af00      	add	r7, sp, #0
 8020262:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff){
 8020264:	687b      	ldr	r3, [r7, #4]
 8020266:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 802026a:	2bff      	cmp	r3, #255	@ 0xff
 802026c:	d101      	bne.n	8020272 <queue_pop+0x16>
        /* q is empty*/
        return -1;
 802026e:	23ff      	movs	r3, #255	@ 0xff
 8020270:	e02b      	b.n	80202ca <queue_pop+0x6e>
    }
    q->front = (q->front + 1) % MAX_PROCESS_NUM;
 8020272:	687b      	ldr	r3, [r7, #4]
 8020274:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020278:	1c5a      	adds	r2, r3, #1
 802027a:	4b16      	ldr	r3, [pc, #88]	@ (80202d4 <queue_pop+0x78>)
 802027c:	fb83 1302 	smull	r1, r3, r3, r2
 8020280:	4413      	add	r3, r2
 8020282:	10d9      	asrs	r1, r3, #3
 8020284:	17d3      	asrs	r3, r2, #31
 8020286:	1ac9      	subs	r1, r1, r3
 8020288:	460b      	mov	r3, r1
 802028a:	011b      	lsls	r3, r3, #4
 802028c:	1a5b      	subs	r3, r3, r1
 802028e:	1ad1      	subs	r1, r2, r3
 8020290:	b2ca      	uxtb	r2, r1
 8020292:	687b      	ldr	r3, [r7, #4]
 8020294:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
    if (q->front == q->rare){
 8020298:	687b      	ldr	r3, [r7, #4]
 802029a:	f893 2079 	ldrb.w	r2, [r3, #121]	@ 0x79
 802029e:	687b      	ldr	r3, [r7, #4]
 80202a0:	f893 307a 	ldrb.w	r3, [r3, #122]	@ 0x7a
 80202a4:	429a      	cmp	r2, r3
 80202a6:	d107      	bne.n	80202b8 <queue_pop+0x5c>
        q->front = 0xff;
 80202a8:	687b      	ldr	r3, [r7, #4]
 80202aa:	22ff      	movs	r2, #255	@ 0xff
 80202ac:	f883 2079 	strb.w	r2, [r3, #121]	@ 0x79
        q->rare = 0;
 80202b0:	687b      	ldr	r3, [r7, #4]
 80202b2:	2200      	movs	r2, #0
 80202b4:	f883 207a 	strb.w	r2, [r3, #122]	@ 0x7a
    }
    q->size --;
 80202b8:	687b      	ldr	r3, [r7, #4]
 80202ba:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
 80202be:	3b01      	subs	r3, #1
 80202c0:	b2da      	uxtb	r2, r3
 80202c2:	687b      	ldr	r3, [r7, #4]
 80202c4:	f883 2078 	strb.w	r2, [r3, #120]	@ 0x78
    return 0;
 80202c8:	2300      	movs	r3, #0
}
 80202ca:	4618      	mov	r0, r3
 80202cc:	370c      	adds	r7, #12
 80202ce:	46bd      	mov	sp, r7
 80202d0:	bc80      	pop	{r7}
 80202d2:	4770      	bx	lr
 80202d4:	88888889 	.word	0x88888889

080202d8 <queue_front>:

user_process_t* queue_front (queue_t *q){
 80202d8:	b480      	push	{r7}
 80202da:	b083      	sub	sp, #12
 80202dc:	af00      	add	r7, sp, #0
 80202de:	6078      	str	r0, [r7, #4]
    if (q->front == 0xff)
 80202e0:	687b      	ldr	r3, [r7, #4]
 80202e2:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 80202e6:	2bff      	cmp	r3, #255	@ 0xff
 80202e8:	d101      	bne.n	80202ee <queue_front+0x16>
        return NULL;
 80202ea:	2300      	movs	r3, #0
 80202ec:	e006      	b.n	80202fc <queue_front+0x24>
    return q->processes [q->front];
 80202ee:	687b      	ldr	r3, [r7, #4]
 80202f0:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 80202f4:	461a      	mov	r2, r3
 80202f6:	687b      	ldr	r3, [r7, #4]
 80202f8:	f853 3022 	ldr.w	r3, [r3, r2, lsl #2]
}
 80202fc:	4618      	mov	r0, r3
 80202fe:	370c      	adds	r7, #12
 8020300:	46bd      	mov	sp, r7
 8020302:	bc80      	pop	{r7}
 8020304:	4770      	bx	lr

08020306 <queue_empty>:

uint32_t queue_empty (queue_t *q){
 8020306:	b480      	push	{r7}
 8020308:	b083      	sub	sp, #12
 802030a:	af00      	add	r7, sp, #0
 802030c:	6078      	str	r0, [r7, #4]
    return q->front == 0xff;
 802030e:	687b      	ldr	r3, [r7, #4]
 8020310:	f893 3079 	ldrb.w	r3, [r3, #121]	@ 0x79
 8020314:	2bff      	cmp	r3, #255	@ 0xff
 8020316:	bf0c      	ite	eq
 8020318:	2301      	moveq	r3, #1
 802031a:	2300      	movne	r3, #0
 802031c:	b2db      	uxtb	r3, r3
}
 802031e:	4618      	mov	r0, r3
 8020320:	370c      	adds	r7, #12
 8020322:	46bd      	mov	sp, r7
 8020324:	bc80      	pop	{r7}
 8020326:	4770      	bx	lr

08020328 <queue_size>:

uint32_t queue_size (queue_t *q){
 8020328:	b480      	push	{r7}
 802032a:	b083      	sub	sp, #12
 802032c:	af00      	add	r7, sp, #0
 802032e:	6078      	str	r0, [r7, #4]
    return q->size;
 8020330:	687b      	ldr	r3, [r7, #4]
 8020332:	f893 3078 	ldrb.w	r3, [r3, #120]	@ 0x78
}
 8020336:	4618      	mov	r0, r3
 8020338:	370c      	adds	r7, #12
 802033a:	46bd      	mov	sp, r7
 802033c:	bc80      	pop	{r7}
 802033e:	4770      	bx	lr

08020340 <__NVIC_SetPendingIRQ>:
  \details Sets the pending bit of a device specific interrupt in the NVIC pending register.
  \param [in]      IRQn  Device specific interrupt number.
  \note    IRQn must not be negative.
 */
__STATIC_INLINE void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
 8020340:	b480      	push	{r7}
 8020342:	b083      	sub	sp, #12
 8020344:	af00      	add	r7, sp, #0
 8020346:	4603      	mov	r3, r0
 8020348:	71fb      	strb	r3, [r7, #7]
  if ((int32_t)(IRQn) >= 0)
 802034a:	f997 3007 	ldrsb.w	r3, [r7, #7]
 802034e:	2b00      	cmp	r3, #0
 8020350:	db0c      	blt.n	802036c <__NVIC_SetPendingIRQ+0x2c>
  {
    NVIC->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
 8020352:	79fb      	ldrb	r3, [r7, #7]
 8020354:	f003 021f 	and.w	r2, r3, #31
 8020358:	4907      	ldr	r1, [pc, #28]	@ (8020378 <__NVIC_SetPendingIRQ+0x38>)
 802035a:	f997 3007 	ldrsb.w	r3, [r7, #7]
 802035e:	095b      	lsrs	r3, r3, #5
 8020360:	2001      	movs	r0, #1
 8020362:	fa00 f202 	lsl.w	r2, r0, r2
 8020366:	3340      	adds	r3, #64	@ 0x40
 8020368:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
  }
}
 802036c:	bf00      	nop
 802036e:	370c      	adds	r7, #12
 8020370:	46bd      	mov	sp, r7
 8020372:	bc80      	pop	{r7}
 8020374:	4770      	bx	lr
 8020376:	bf00      	nop
 8020378:	e000e100 	.word	0xe000e100

0802037c <semaphore_init>:
#include "core.h"

extern queue_t ready_queue;
extern uint8_t process_count;

void semaphore_init(semaphore_t *sema, uint8_t val) {
 802037c:	b580      	push	{r7, lr}
 802037e:	b082      	sub	sp, #8
 8020380:	af00      	add	r7, sp, #0
 8020382:	6078      	str	r0, [r7, #4]
 8020384:	460b      	mov	r3, r1
 8020386:	70fb      	strb	r3, [r7, #3]
  sema->value = val; // unlocked
 8020388:	687b      	ldr	r3, [r7, #4]
 802038a:	78fa      	ldrb	r2, [r7, #3]
 802038c:	701a      	strb	r2, [r3, #0]
  queue_init(&(sema->waiting_queue));
 802038e:	687b      	ldr	r3, [r7, #4]
 8020390:	3304      	adds	r3, #4
 8020392:	4618      	mov	r0, r3
 8020394:	f7ff ff08 	bl	80201a8 <queue_init>
}
 8020398:	bf00      	nop
 802039a:	3708      	adds	r7, #8
 802039c:	46bd      	mov	sp, r7
 802039e:	bd80      	pop	{r7, pc}

080203a0 <semaphore_lock>:

/* this has to be atomic */
void semaphore_lock(semaphore_t *sema) {
 80203a0:	b580      	push	{r7, lr}
 80203a2:	b084      	sub	sp, #16
 80203a4:	af00      	add	r7, sp, #0
 80203a6:	6078      	str	r0, [r7, #4]
  \details Disables IRQ interrupts by setting special-purpose register PRIMASK.
           Can only be executed in Privileged modes.
 */
__STATIC_FORCEINLINE void __disable_irq(void)
{
  __ASM volatile ("cpsid i" : : : "memory");
 80203a8:	b672      	cpsid	i
}
 80203aa:	bf00      	nop
  __disable_irq();
  if (sema->value == 0) { // semaphore cannot be locked ...
 80203ac:	687b      	ldr	r3, [r7, #4]
 80203ae:	781b      	ldrb	r3, [r3, #0]
 80203b0:	2b00      	cmp	r3, #0
 80203b2:	d112      	bne.n	80203da <semaphore_lock+0x3a>
    user_process_t *running_process =
        *((user_process_t **)(RUNNING_PROCESS_AD));
 80203b4:	4b0e      	ldr	r3, [pc, #56]	@ (80203f0 <semaphore_lock+0x50>)
    user_process_t *running_process =
 80203b6:	681b      	ldr	r3, [r3, #0]
 80203b8:	60fb      	str	r3, [r7, #12]
    queue_push(&(sema->waiting_queue), running_process);
 80203ba:	687b      	ldr	r3, [r7, #4]
 80203bc:	3304      	adds	r3, #4
 80203be:	68f9      	ldr	r1, [r7, #12]
 80203c0:	4618      	mov	r0, r3
 80203c2:	f7ff ff06 	bl	80201d2 <queue_push>
    running_process->state = WAITING_STATE;
 80203c6:	68fb      	ldr	r3, [r7, #12]
 80203c8:	2203      	movs	r2, #3
 80203ca:	62da      	str	r2, [r3, #44]	@ 0x2c

//    schedular ();

    /* call PendSV_Handler for context switching */
    //PendSV_Handler();
    NVIC_SetPendingIRQ (PendSV_IRQn);
 80203cc:	f06f 0001 	mvn.w	r0, #1
 80203d0:	f7ff ffb6 	bl	8020340 <__NVIC_SetPendingIRQ>
  __ASM volatile ("cpsie i" : : : "memory");
 80203d4:	b662      	cpsie	i
}
 80203d6:	bf00      	nop

    __enable_irq();
    return;
 80203d8:	e007      	b.n	80203ea <semaphore_lock+0x4a>
  }
  sema->value--;
 80203da:	687b      	ldr	r3, [r7, #4]
 80203dc:	781b      	ldrb	r3, [r3, #0]
 80203de:	3b01      	subs	r3, #1
 80203e0:	b2da      	uxtb	r2, r3
 80203e2:	687b      	ldr	r3, [r7, #4]
 80203e4:	701a      	strb	r2, [r3, #0]
  __ASM volatile ("cpsie i" : : : "memory");
 80203e6:	b662      	cpsie	i
}
 80203e8:	bf00      	nop
  __enable_irq();
}
 80203ea:	3710      	adds	r7, #16
 80203ec:	46bd      	mov	sp, r7
 80203ee:	bd80      	pop	{r7, pc}
 80203f0:	20016004 	.word	0x20016004

080203f4 <semaphore_unlock>:

void semaphore_unlock(semaphore_t *sema) {
 80203f4:	b580      	push	{r7, lr}
 80203f6:	b084      	sub	sp, #16
 80203f8:	af00      	add	r7, sp, #0
 80203fa:	6078      	str	r0, [r7, #4]
  __ASM volatile ("cpsid i" : : : "memory");
 80203fc:	b672      	cpsid	i
}
 80203fe:	bf00      	nop
  __disable_irq();
  sema->value++;
 8020400:	687b      	ldr	r3, [r7, #4]
 8020402:	781b      	ldrb	r3, [r3, #0]
 8020404:	3301      	adds	r3, #1
 8020406:	b2da      	uxtb	r2, r3
 8020408:	687b      	ldr	r3, [r7, #4]
 802040a:	701a      	strb	r2, [r3, #0]
  /* unlocked */
  user_process_t *process = queue_front(&(sema->waiting_queue));
 802040c:	687b      	ldr	r3, [r7, #4]
 802040e:	3304      	adds	r3, #4
 8020410:	4618      	mov	r0, r3
 8020412:	f7ff ff61 	bl	80202d8 <queue_front>
 8020416:	60f8      	str	r0, [r7, #12]
  if (!process) {
 8020418:	68fb      	ldr	r3, [r7, #12]
 802041a:	2b00      	cmp	r3, #0
 802041c:	d102      	bne.n	8020424 <semaphore_unlock+0x30>
  __ASM volatile ("cpsie i" : : : "memory");
 802041e:	b662      	cpsie	i
}
 8020420:	bf00      	nop
    /* no process is waiting */
    __enable_irq();
    return;
 8020422:	e00d      	b.n	8020440 <semaphore_unlock+0x4c>
  }
  queue_pop(&(sema->waiting_queue));
 8020424:	687b      	ldr	r3, [r7, #4]
 8020426:	3304      	adds	r3, #4
 8020428:	4618      	mov	r0, r3
 802042a:	f7ff ff17 	bl	802025c <queue_pop>
  process->state = READY_STATE;
 802042e:	68fb      	ldr	r3, [r7, #12]
 8020430:	2200      	movs	r2, #0
 8020432:	62da      	str	r2, [r3, #44]	@ 0x2c
  queue_push(&ready_queue, process);
 8020434:	68f9      	ldr	r1, [r7, #12]
 8020436:	4804      	ldr	r0, [pc, #16]	@ (8020448 <semaphore_unlock+0x54>)
 8020438:	f7ff fecb 	bl	80201d2 <queue_push>
  __ASM volatile ("cpsie i" : : : "memory");
 802043c:	b662      	cpsie	i
}
 802043e:	bf00      	nop
  __enable_irq();
}
 8020440:	3710      	adds	r7, #16
 8020442:	46bd      	mov	sp, r7
 8020444:	bd80      	pop	{r7, pc}
 8020446:	bf00      	nop
 8020448:	200003f4 	.word	0x200003f4

0802044c <strlen>:
#include "usart.h"
#include <stdarg.h>

#define MAX_STR_LENGTH 500 

uint32_t strlen(const char *msg) {
 802044c:	b480      	push	{r7}
 802044e:	b085      	sub	sp, #20
 8020450:	af00      	add	r7, sp, #0
 8020452:	6078      	str	r0, [r7, #4]

  int i = 0;
 8020454:	2300      	movs	r3, #0
 8020456:	60fb      	str	r3, [r7, #12]
  while (msg[i++] != '\0')
 8020458:	bf00      	nop
 802045a:	68fb      	ldr	r3, [r7, #12]
 802045c:	1c5a      	adds	r2, r3, #1
 802045e:	60fa      	str	r2, [r7, #12]
 8020460:	461a      	mov	r2, r3
 8020462:	687b      	ldr	r3, [r7, #4]
 8020464:	4413      	add	r3, r2
 8020466:	781b      	ldrb	r3, [r3, #0]
 8020468:	2b00      	cmp	r3, #0
 802046a:	d1f6      	bne.n	802045a <strlen+0xe>
    ;
  return i - 1;
 802046c:	68fb      	ldr	r3, [r7, #12]
 802046e:	3b01      	subs	r3, #1
}
 8020470:	4618      	mov	r0, r3
 8020472:	3714      	adds	r7, #20
 8020474:	46bd      	mov	sp, r7
 8020476:	bc80      	pop	{r7}
 8020478:	4770      	bx	lr

0802047a <concat>:

 uint32_t concat (char *s, uint32_t ind, uint32_t MAX_S_SIZE, char *t){
 802047a:	b480      	push	{r7}
 802047c:	b087      	sub	sp, #28
 802047e:	af00      	add	r7, sp, #0
 8020480:	60f8      	str	r0, [r7, #12]
 8020482:	60b9      	str	r1, [r7, #8]
 8020484:	607a      	str	r2, [r7, #4]
 8020486:	603b      	str	r3, [r7, #0]
  int t_ind = 0;
 8020488:	2300      	movs	r3, #0
 802048a:	617b      	str	r3, [r7, #20]
  while (ind < MAX_S_SIZE-1 && t[t_ind]){
 802048c:	e00c      	b.n	80204a8 <concat+0x2e>
    s[ind++] = t[t_ind++];
 802048e:	697b      	ldr	r3, [r7, #20]
 8020490:	1c5a      	adds	r2, r3, #1
 8020492:	617a      	str	r2, [r7, #20]
 8020494:	461a      	mov	r2, r3
 8020496:	683b      	ldr	r3, [r7, #0]
 8020498:	441a      	add	r2, r3
 802049a:	68bb      	ldr	r3, [r7, #8]
 802049c:	1c59      	adds	r1, r3, #1
 802049e:	60b9      	str	r1, [r7, #8]
 80204a0:	68f9      	ldr	r1, [r7, #12]
 80204a2:	440b      	add	r3, r1
 80204a4:	7812      	ldrb	r2, [r2, #0]
 80204a6:	701a      	strb	r2, [r3, #0]
  while (ind < MAX_S_SIZE-1 && t[t_ind]){
 80204a8:	687b      	ldr	r3, [r7, #4]
 80204aa:	3b01      	subs	r3, #1
 80204ac:	68ba      	ldr	r2, [r7, #8]
 80204ae:	429a      	cmp	r2, r3
 80204b0:	d205      	bcs.n	80204be <concat+0x44>
 80204b2:	697b      	ldr	r3, [r7, #20]
 80204b4:	683a      	ldr	r2, [r7, #0]
 80204b6:	4413      	add	r3, r2
 80204b8:	781b      	ldrb	r3, [r3, #0]
 80204ba:	2b00      	cmp	r3, #0
 80204bc:	d1e7      	bne.n	802048e <concat+0x14>
  }
  return ind;
 80204be:	68bb      	ldr	r3, [r7, #8]
}
 80204c0:	4618      	mov	r0, r3
 80204c2:	371c      	adds	r7, #28
 80204c4:	46bd      	mov	sp, r7
 80204c6:	bc80      	pop	{r7}
 80204c8:	4770      	bx	lr

080204ca <hex_str>:

void hex_str(uint32_t value, char out[11]) {
 80204ca:	b4b0      	push	{r4, r5, r7}
 80204cc:	b08b      	sub	sp, #44	@ 0x2c
 80204ce:	af00      	add	r7, sp, #0
 80204d0:	6078      	str	r0, [r7, #4]
 80204d2:	6039      	str	r1, [r7, #0]
// put the string representation of hex value in out
  char hex_char[] = "0123456789abcdef";
 80204d4:	4b1d      	ldr	r3, [pc, #116]	@ (802054c <hex_str+0x82>)
 80204d6:	f107 0408 	add.w	r4, r7, #8
 80204da:	461d      	mov	r5, r3
 80204dc:	cd0f      	ldmia	r5!, {r0, r1, r2, r3}
 80204de:	c40f      	stmia	r4!, {r0, r1, r2, r3}
 80204e0:	682b      	ldr	r3, [r5, #0]
 80204e2:	7023      	strb	r3, [r4, #0]
  out [10] = '\0';
 80204e4:	683b      	ldr	r3, [r7, #0]
 80204e6:	330a      	adds	r3, #10
 80204e8:	2200      	movs	r2, #0
 80204ea:	701a      	strb	r2, [r3, #0]
  out[0] = '0';
 80204ec:	683b      	ldr	r3, [r7, #0]
 80204ee:	2230      	movs	r2, #48	@ 0x30
 80204f0:	701a      	strb	r2, [r3, #0]
  out[1] = 'x';
 80204f2:	683b      	ldr	r3, [r7, #0]
 80204f4:	3301      	adds	r3, #1
 80204f6:	2278      	movs	r2, #120	@ 0x78
 80204f8:	701a      	strb	r2, [r3, #0]

  for (int i = 0; i < 8; i++) {
 80204fa:	2300      	movs	r3, #0
 80204fc:	627b      	str	r3, [r7, #36]	@ 0x24
 80204fe:	e01c      	b.n	802053a <hex_str+0x70>
    uint32_t ind = (value & (15 << (i * 4))) >> (i * 4);
 8020500:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8020502:	009b      	lsls	r3, r3, #2
 8020504:	220f      	movs	r2, #15
 8020506:	fa02 f303 	lsl.w	r3, r2, r3
 802050a:	461a      	mov	r2, r3
 802050c:	687b      	ldr	r3, [r7, #4]
 802050e:	401a      	ands	r2, r3
 8020510:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8020512:	009b      	lsls	r3, r3, #2
 8020514:	fa22 f303 	lsr.w	r3, r2, r3
 8020518:	623b      	str	r3, [r7, #32]
    int j = 9 - i;
 802051a:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 802051c:	f1c3 0309 	rsb	r3, r3, #9
 8020520:	61fb      	str	r3, [r7, #28]
    out[j] = hex_char[ind];
 8020522:	69fb      	ldr	r3, [r7, #28]
 8020524:	683a      	ldr	r2, [r7, #0]
 8020526:	4413      	add	r3, r2
 8020528:	f107 0108 	add.w	r1, r7, #8
 802052c:	6a3a      	ldr	r2, [r7, #32]
 802052e:	440a      	add	r2, r1
 8020530:	7812      	ldrb	r2, [r2, #0]
 8020532:	701a      	strb	r2, [r3, #0]
  for (int i = 0; i < 8; i++) {
 8020534:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 8020536:	3301      	adds	r3, #1
 8020538:	627b      	str	r3, [r7, #36]	@ 0x24
 802053a:	6a7b      	ldr	r3, [r7, #36]	@ 0x24
 802053c:	2b07      	cmp	r3, #7
 802053e:	dddf      	ble.n	8020500 <hex_str+0x36>
  }
}
 8020540:	bf00      	nop
 8020542:	bf00      	nop
 8020544:	372c      	adds	r7, #44	@ 0x2c
 8020546:	46bd      	mov	sp, r7
 8020548:	bcb0      	pop	{r4, r5, r7}
 802054a:	4770      	bx	lr
 802054c:	08021110 	.word	0x08021110

08020550 <int_str>:

void int_str (uint32_t value, char out[11]){
 8020550:	b480      	push	{r7}
 8020552:	b085      	sub	sp, #20
 8020554:	af00      	add	r7, sp, #0
 8020556:	6078      	str	r0, [r7, #4]
 8020558:	6039      	str	r1, [r7, #0]
  // put the string representation of value in out;
  int32_t i = 9;
 802055a:	2309      	movs	r3, #9
 802055c:	60fb      	str	r3, [r7, #12]
  out[10] = '\0';
 802055e:	683b      	ldr	r3, [r7, #0]
 8020560:	330a      	adds	r3, #10
 8020562:	2200      	movs	r2, #0
 8020564:	701a      	strb	r2, [r3, #0]
  while (i >= 0){
 8020566:	e01b      	b.n	80205a0 <int_str+0x50>

    uint8_t digit = value % 10;
 8020568:	6879      	ldr	r1, [r7, #4]
 802056a:	4b12      	ldr	r3, [pc, #72]	@ (80205b4 <int_str+0x64>)
 802056c:	fba3 2301 	umull	r2, r3, r3, r1
 8020570:	08da      	lsrs	r2, r3, #3
 8020572:	4613      	mov	r3, r2
 8020574:	009b      	lsls	r3, r3, #2
 8020576:	4413      	add	r3, r2
 8020578:	005b      	lsls	r3, r3, #1
 802057a:	1aca      	subs	r2, r1, r3
 802057c:	4613      	mov	r3, r2
 802057e:	72fb      	strb	r3, [r7, #11]
    value /= 10;
 8020580:	687b      	ldr	r3, [r7, #4]
 8020582:	4a0c      	ldr	r2, [pc, #48]	@ (80205b4 <int_str+0x64>)
 8020584:	fba2 2303 	umull	r2, r3, r2, r3
 8020588:	08db      	lsrs	r3, r3, #3
 802058a:	607b      	str	r3, [r7, #4]
    out[i--] = '0' + digit;
 802058c:	68fb      	ldr	r3, [r7, #12]
 802058e:	1e5a      	subs	r2, r3, #1
 8020590:	60fa      	str	r2, [r7, #12]
 8020592:	461a      	mov	r2, r3
 8020594:	683b      	ldr	r3, [r7, #0]
 8020596:	4413      	add	r3, r2
 8020598:	7afa      	ldrb	r2, [r7, #11]
 802059a:	3230      	adds	r2, #48	@ 0x30
 802059c:	b2d2      	uxtb	r2, r2
 802059e:	701a      	strb	r2, [r3, #0]
  while (i >= 0){
 80205a0:	68fb      	ldr	r3, [r7, #12]
 80205a2:	2b00      	cmp	r3, #0
 80205a4:	dae0      	bge.n	8020568 <int_str+0x18>
  }
}
 80205a6:	bf00      	nop
 80205a8:	bf00      	nop
 80205aa:	3714      	adds	r7, #20
 80205ac:	46bd      	mov	sp, r7
 80205ae:	bc80      	pop	{r7}
 80205b0:	4770      	bx	lr
 80205b2:	bf00      	nop
 80205b4:	cccccccd 	.word	0xcccccccd

080205b8 <printf>:

void printf(const char *msg, ...) {
 80205b8:	b40f      	push	{r0, r1, r2, r3}
 80205ba:	b580      	push	{r7, lr}
 80205bc:	f5ad 7d0a 	sub.w	sp, sp, #552	@ 0x228
 80205c0:	af00      	add	r7, sp, #0
  va_list args;
  va_start (args, msg);
 80205c2:	f507 730d 	add.w	r3, r7, #564	@ 0x234
 80205c6:	f8c7 320c 	str.w	r3, [r7, #524]	@ 0x20c

  uint32_t size = strlen (msg);
 80205ca:	f8d7 0230 	ldr.w	r0, [r7, #560]	@ 0x230
 80205ce:	f7ff ff3d 	bl	802044c <strlen>
 80205d2:	f8c7 021c 	str.w	r0, [r7, #540]	@ 0x21c
  char __msg[MAX_STR_LENGTH];

  int msg_ind = 0;
 80205d6:	2300      	movs	r3, #0
 80205d8:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
  int __msg_ind = 0;
 80205dc:	2300      	movs	r3, #0
 80205de:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
  while (msg_ind < size){
 80205e2:	e0a1      	b.n	8020728 <printf+0x170>
    if (msg[msg_ind] != '%'){
 80205e4:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80205e8:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 80205ec:	4413      	add	r3, r2
 80205ee:	781b      	ldrb	r3, [r3, #0]
 80205f0:	2b25      	cmp	r3, #37	@ 0x25
 80205f2:	d014      	beq.n	802061e <printf+0x66>
      __msg[__msg_ind++] = msg [msg_ind++];
 80205f4:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80205f8:	1c5a      	adds	r2, r3, #1
 80205fa:	f8c7 2224 	str.w	r2, [r7, #548]	@ 0x224
 80205fe:	461a      	mov	r2, r3
 8020600:	f8d7 3230 	ldr.w	r3, [r7, #560]	@ 0x230
 8020604:	441a      	add	r2, r3
 8020606:	f8d7 3220 	ldr.w	r3, [r7, #544]	@ 0x220
 802060a:	1c59      	adds	r1, r3, #1
 802060c:	f8c7 1220 	str.w	r1, [r7, #544]	@ 0x220
 8020610:	7811      	ldrb	r1, [r2, #0]
 8020612:	f507 720a 	add.w	r2, r7, #552	@ 0x228
 8020616:	f5a2 7204 	sub.w	r2, r2, #528	@ 0x210
 802061a:	54d1      	strb	r1, [r2, r3]
      continue;
 802061c:	e084      	b.n	8020728 <printf+0x170>
    }
    
    // msg[msg_ind] == '%'
    if (msg_ind+1 >= size) break;
 802061e:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8020622:	3301      	adds	r3, #1
 8020624:	461a      	mov	r2, r3
 8020626:	f8d7 321c 	ldr.w	r3, [r7, #540]	@ 0x21c
 802062a:	4293      	cmp	r3, r2
 802062c:	f240 8084 	bls.w	8020738 <printf+0x180>
    if (msg[msg_ind+1] == 's'){
 8020630:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8020634:	3301      	adds	r3, #1
 8020636:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 802063a:	4413      	add	r3, r2
 802063c:	781b      	ldrb	r3, [r3, #0]
 802063e:	2b73      	cmp	r3, #115	@ 0x73
 8020640:	d11a      	bne.n	8020678 <printf+0xc0>

      char* address = va_arg (args, char*);
 8020642:	f8d7 320c 	ldr.w	r3, [r7, #524]	@ 0x20c
 8020646:	1d1a      	adds	r2, r3, #4
 8020648:	f8c7 220c 	str.w	r2, [r7, #524]	@ 0x20c
 802064c:	681b      	ldr	r3, [r3, #0]
 802064e:	f8c7 3210 	str.w	r3, [r7, #528]	@ 0x210
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, address);
 8020652:	f8d7 1220 	ldr.w	r1, [r7, #544]	@ 0x220
 8020656:	f107 0018 	add.w	r0, r7, #24
 802065a:	f8d7 3210 	ldr.w	r3, [r7, #528]	@ 0x210
 802065e:	f44f 72fa 	mov.w	r2, #500	@ 0x1f4
 8020662:	f7ff ff0a 	bl	802047a <concat>
 8020666:	4603      	mov	r3, r0
 8020668:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
      msg_ind ++;
 802066c:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8020670:	3301      	adds	r3, #1
 8020672:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
 8020676:	e052      	b.n	802071e <printf+0x166>
    }
    else if (msg[msg_ind+1] == 'd'){
 8020678:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 802067c:	3301      	adds	r3, #1
 802067e:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 8020682:	4413      	add	r3, r2
 8020684:	781b      	ldrb	r3, [r3, #0]
 8020686:	2b64      	cmp	r3, #100	@ 0x64
 8020688:	d121      	bne.n	80206ce <printf+0x116>

      char target [11];
      uint32_t value = va_arg (args, uint32_t);
 802068a:	f8d7 320c 	ldr.w	r3, [r7, #524]	@ 0x20c
 802068e:	1d1a      	adds	r2, r3, #4
 8020690:	f8c7 220c 	str.w	r2, [r7, #524]	@ 0x20c
 8020694:	681b      	ldr	r3, [r3, #0]
 8020696:	f8c7 3214 	str.w	r3, [r7, #532]	@ 0x214
      int_str (value, target);
 802069a:	f107 030c 	add.w	r3, r7, #12
 802069e:	4619      	mov	r1, r3
 80206a0:	f8d7 0214 	ldr.w	r0, [r7, #532]	@ 0x214
 80206a4:	f7ff ff54 	bl	8020550 <int_str>
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, target);
 80206a8:	f8d7 1220 	ldr.w	r1, [r7, #544]	@ 0x220
 80206ac:	f107 030c 	add.w	r3, r7, #12
 80206b0:	f107 0018 	add.w	r0, r7, #24
 80206b4:	f44f 72fa 	mov.w	r2, #500	@ 0x1f4
 80206b8:	f7ff fedf 	bl	802047a <concat>
 80206bc:	4603      	mov	r3, r0
 80206be:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
      msg_ind ++;
 80206c2:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80206c6:	3301      	adds	r3, #1
 80206c8:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
 80206cc:	e027      	b.n	802071e <printf+0x166>
    }
    else if (msg[msg_ind+1] == 'x'){
 80206ce:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 80206d2:	3301      	adds	r3, #1
 80206d4:	f8d7 2230 	ldr.w	r2, [r7, #560]	@ 0x230
 80206d8:	4413      	add	r3, r2
 80206da:	781b      	ldrb	r3, [r3, #0]
 80206dc:	2b78      	cmp	r3, #120	@ 0x78
 80206de:	d11e      	bne.n	802071e <printf+0x166>

      char target [11];
      uint32_t value = va_arg (args, uint32_t);
 80206e0:	f8d7 320c 	ldr.w	r3, [r7, #524]	@ 0x20c
 80206e4:	1d1a      	adds	r2, r3, #4
 80206e6:	f8c7 220c 	str.w	r2, [r7, #524]	@ 0x20c
 80206ea:	681b      	ldr	r3, [r3, #0]
 80206ec:	f8c7 3218 	str.w	r3, [r7, #536]	@ 0x218
      hex_str (value, target);
 80206f0:	463b      	mov	r3, r7
 80206f2:	4619      	mov	r1, r3
 80206f4:	f8d7 0218 	ldr.w	r0, [r7, #536]	@ 0x218
 80206f8:	f7ff fee7 	bl	80204ca <hex_str>
      __msg_ind = concat (__msg, __msg_ind, MAX_STR_LENGTH, target);
 80206fc:	f8d7 1220 	ldr.w	r1, [r7, #544]	@ 0x220
 8020700:	463b      	mov	r3, r7
 8020702:	f107 0018 	add.w	r0, r7, #24
 8020706:	f44f 72fa 	mov.w	r2, #500	@ 0x1f4
 802070a:	f7ff feb6 	bl	802047a <concat>
 802070e:	4603      	mov	r3, r0
 8020710:	f8c7 3220 	str.w	r3, [r7, #544]	@ 0x220
      msg_ind ++;
 8020714:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8020718:	3301      	adds	r3, #1
 802071a:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
    }
    msg_ind ++;
 802071e:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 8020722:	3301      	adds	r3, #1
 8020724:	f8c7 3224 	str.w	r3, [r7, #548]	@ 0x224
  while (msg_ind < size){
 8020728:	f8d7 3224 	ldr.w	r3, [r7, #548]	@ 0x224
 802072c:	f8d7 221c 	ldr.w	r2, [r7, #540]	@ 0x21c
 8020730:	429a      	cmp	r2, r3
 8020732:	f63f af57 	bhi.w	80205e4 <printf+0x2c>
 8020736:	e000      	b.n	802073a <printf+0x182>
    if (msg_ind+1 >= size) break;
 8020738:	bf00      	nop

  }
  va_end (args);
  __msg[__msg_ind] = '\0';
 802073a:	f507 730a 	add.w	r3, r7, #552	@ 0x228
 802073e:	f5a3 7204 	sub.w	r2, r3, #528	@ 0x210
 8020742:	f8d7 3220 	ldr.w	r3, [r7, #544]	@ 0x220
 8020746:	4413      	add	r3, r2
 8020748:	2200      	movs	r2, #0
 802074a:	701a      	strb	r2, [r3, #0]
  __usart1_print (__msg, strlen (__msg));
 802074c:	f107 0318 	add.w	r3, r7, #24
 8020750:	4618      	mov	r0, r3
 8020752:	f7ff fe7b 	bl	802044c <strlen>
 8020756:	4602      	mov	r2, r0
 8020758:	f107 0318 	add.w	r3, r7, #24
 802075c:	4611      	mov	r1, r2
 802075e:	4618      	mov	r0, r3
 8020760:	f000 fbee 	bl	8020f40 <__usart1_print>

}
 8020764:	bf00      	nop
 8020766:	f507 770a 	add.w	r7, r7, #552	@ 0x228
 802076a:	46bd      	mov	sp, r7
 802076c:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
 8020770:	b004      	add	sp, #16
 8020772:	4770      	bx	lr

08020774 <schedular>:
extern user_process_t process[MAX_PROCESS_NUM];
extern queue_t ready_queue;
extern semaphore_t sem_usart1;
extern bool context_switch_dissabled;

void schedular(void) {
 8020774:	b580      	push	{r7, lr}
 8020776:	b084      	sub	sp, #16
 8020778:	af00      	add	r7, sp, #0

  /* Round Robin (FCFS + time slice)*/
  user_process_t *picked_process = NULL;
 802077a:	2300      	movs	r3, #0
 802077c:	60fb      	str	r3, [r7, #12]
  user_process_t *running_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 802077e:	4b1d      	ldr	r3, [pc, #116]	@ (80207f4 <schedular+0x80>)
 8020780:	681b      	ldr	r3, [r3, #0]
 8020782:	60bb      	str	r3, [r7, #8]


  // we could use a priority queue here to support priority...
  picked_process = queue_front(&ready_queue);
 8020784:	481c      	ldr	r0, [pc, #112]	@ (80207f8 <schedular+0x84>)
 8020786:	f7ff fda7 	bl	80202d8 <queue_front>
 802078a:	60f8      	str	r0, [r7, #12]
  uint8_t status = queue_pop(&ready_queue);
 802078c:	481a      	ldr	r0, [pc, #104]	@ (80207f8 <schedular+0x84>)
 802078e:	f7ff fd65 	bl	802025c <queue_pop>
 8020792:	4603      	mov	r3, r0
 8020794:	71fb      	strb	r3, [r7, #7]


  // if ready queue is empty, then pick the runnung process
  if (0xff == status || !picked_process){
 8020796:	79fb      	ldrb	r3, [r7, #7]
 8020798:	2bff      	cmp	r3, #255	@ 0xff
 802079a:	d002      	beq.n	80207a2 <schedular+0x2e>
 802079c:	68fb      	ldr	r3, [r7, #12]
 802079e:	2b00      	cmp	r3, #0
 80207a0:	d10f      	bne.n	80207c2 <schedular+0x4e>
    picked_process = *(user_process_t **)(RUNNING_PROCESS_AD);
 80207a2:	4b14      	ldr	r3, [pc, #80]	@ (80207f4 <schedular+0x80>)
 80207a4:	681b      	ldr	r3, [r3, #0]
 80207a6:	60fb      	str	r3, [r7, #12]
    // dissable systick to remove the context switching overhead if there is only one process .

    printf ("ready queue is empty, turning off context switching\n\r", 0x0);
 80207a8:	2100      	movs	r1, #0
 80207aa:	4814      	ldr	r0, [pc, #80]	@ (80207fc <schedular+0x88>)
 80207ac:	f7ff ff04 	bl	80205b8 <printf>
    SysTick->CTRL &= ~(SysTick_CTRL_ENABLE_Msk);
 80207b0:	4b13      	ldr	r3, [pc, #76]	@ (8020800 <schedular+0x8c>)
 80207b2:	681b      	ldr	r3, [r3, #0]
 80207b4:	4a12      	ldr	r2, [pc, #72]	@ (8020800 <schedular+0x8c>)
 80207b6:	f023 0301 	bic.w	r3, r3, #1
 80207ba:	6013      	str	r3, [r2, #0]
    context_switch_dissabled = true;
 80207bc:	4b11      	ldr	r3, [pc, #68]	@ (8020804 <schedular+0x90>)
 80207be:	2201      	movs	r2, #1
 80207c0:	701a      	strb	r2, [r3, #0]

    // better if the last standing process is too large  or there is only one process to begin with
  }

  *(uint32_t *)(PICKED_PROCESS_AD) = (uint32_t)(picked_process);
 80207c2:	4a11      	ldr	r2, [pc, #68]	@ (8020808 <schedular+0x94>)
 80207c4:	68fb      	ldr	r3, [r7, #12]
 80207c6:	6013      	str	r3, [r2, #0]
  /* if the running process is suspended -> donot push it into the
   * ready queue !!!! .. user process will be suspended if a fault
   * occures (done by fault handler)
   */

  if (running_process->state != SUSPEND_STATE &&
 80207c8:	68bb      	ldr	r3, [r7, #8]
 80207ca:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 80207cc:	2b02      	cmp	r3, #2
 80207ce:	d00a      	beq.n	80207e6 <schedular+0x72>
      running_process->state != WAITING_STATE) {
 80207d0:	68bb      	ldr	r3, [r7, #8]
 80207d2:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
  if (running_process->state != SUSPEND_STATE &&
 80207d4:	2b03      	cmp	r3, #3
 80207d6:	d006      	beq.n	80207e6 <schedular+0x72>
    queue_push(&ready_queue, running_process);
 80207d8:	68b9      	ldr	r1, [r7, #8]
 80207da:	4807      	ldr	r0, [pc, #28]	@ (80207f8 <schedular+0x84>)
 80207dc:	f7ff fcf9 	bl	80201d2 <queue_push>
    running_process->state = READY_STATE;
 80207e0:	68bb      	ldr	r3, [r7, #8]
 80207e2:	2200      	movs	r2, #0
 80207e4:	62da      	str	r2, [r3, #44]	@ 0x2c
  }

  picked_process->state = RUNNING_STATE;
 80207e6:	68fb      	ldr	r3, [r7, #12]
 80207e8:	2201      	movs	r2, #1
 80207ea:	62da      	str	r2, [r3, #44]	@ 0x2c
}
 80207ec:	bf00      	nop
 80207ee:	3710      	adds	r7, #16
 80207f0:	46bd      	mov	sp, r7
 80207f2:	bd80      	pop	{r7, pc}
 80207f4:	20016004 	.word	0x20016004
 80207f8:	200003f4 	.word	0x200003f4
 80207fc:	08021124 	.word	0x08021124
 8020800:	e000e010 	.word	0xe000e010
 8020804:	20000470 	.word	0x20000470
 8020808:	20016008 	.word	0x20016008

0802080c <kernel_hang>:


extern semaphore_t sem_usart1;
extern uint8_t process_count;

void kernel_hang(const char* msg){
 802080c:	b580      	push	{r7, lr}
 802080e:	b082      	sub	sp, #8
 8020810:	af00      	add	r7, sp, #0
 8020812:	6078      	str	r0, [r7, #4]
  printf ("kernel entered hang state\n\r");
 8020814:	4804      	ldr	r0, [pc, #16]	@ (8020828 <kernel_hang+0x1c>)
 8020816:	f7ff fecf 	bl	80205b8 <printf>
  printf (msg);
 802081a:	6878      	ldr	r0, [r7, #4]
 802081c:	f7ff fecc 	bl	80205b8 <printf>
  printf ("restart the system\n\r");
 8020820:	4802      	ldr	r0, [pc, #8]	@ (802082c <kernel_hang+0x20>)
 8020822:	f7ff fec9 	bl	80205b8 <printf>

  while (1);
 8020826:	e7fe      	b.n	8020826 <kernel_hang+0x1a>
 8020828:	0802115c 	.word	0x0802115c
 802082c:	08021178 	.word	0x08021178

08020830 <enterCRITICAL>:
}

void enterCRITICAL(void) { __disable_irq(); }
 8020830:	b480      	push	{r7}
 8020832:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsid i" : : : "memory");
 8020834:	b672      	cpsid	i
}
 8020836:	bf00      	nop
 8020838:	bf00      	nop
 802083a:	46bd      	mov	sp, r7
 802083c:	bc80      	pop	{r7}
 802083e:	4770      	bx	lr

08020840 <exitCRITICAL>:

void exitCRITICAL(void) { __enable_irq(); }
 8020840:	b480      	push	{r7}
 8020842:	af00      	add	r7, sp, #0
  __ASM volatile ("cpsie i" : : : "memory");
 8020844:	b662      	cpsie	i
}
 8020846:	bf00      	nop
 8020848:	bf00      	nop
 802084a:	46bd      	mov	sp, r7
 802084c:	bc80      	pop	{r7}
 802084e:	4770      	bx	lr

08020850 <syscall__printf>:

void syscall__printf(const char *msg, ...) {
 8020850:	b40f      	push	{r0, r1, r2, r3}
 8020852:	b580      	push	{r7, lr}
 8020854:	b082      	sub	sp, #8
 8020856:	af00      	add	r7, sp, #0
  semaphore_lock(&sem_usart1);
 8020858:	4809      	ldr	r0, [pc, #36]	@ (8020880 <syscall__printf+0x30>)
 802085a:	f7ff fda1 	bl	80203a0 <semaphore_lock>
  
  // pass all the function parameter to printf ();

  va_list args;
  va_start (args, msg);
 802085e:	f107 0314 	add.w	r3, r7, #20
 8020862:	607b      	str	r3, [r7, #4]

  printf (msg, args);
 8020864:	6879      	ldr	r1, [r7, #4]
 8020866:	6938      	ldr	r0, [r7, #16]
 8020868:	f7ff fea6 	bl	80205b8 <printf>

  va_end(args);
  semaphore_unlock(&sem_usart1);
 802086c:	4804      	ldr	r0, [pc, #16]	@ (8020880 <syscall__printf+0x30>)
 802086e:	f7ff fdc1 	bl	80203f4 <semaphore_unlock>
}
 8020872:	bf00      	nop
 8020874:	3708      	adds	r7, #8
 8020876:	46bd      	mov	sp, r7
 8020878:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
 802087c:	b004      	add	sp, #16
 802087e:	4770      	bx	lr
 8020880:	2000002c 	.word	0x2000002c

08020884 <syscall__scanf>:

void syscall__scanf(const char* msg, ...) {
 8020884:	b40f      	push	{r0, r1, r2, r3}
 8020886:	b480      	push	{r7}
 8020888:	af00      	add	r7, sp, #0

  while (1)
 802088a:	e7fe      	b.n	802088a <syscall__scanf+0x6>

0802088c <syscall__process_exit>:
    ;
}

void syscall__process_exit () {
 802088c:	b580      	push	{r7, lr}
 802088e:	af00      	add	r7, sp, #0
  process_exit ();
 8020890:	f000 f92e 	bl	8020af0 <process_exit>
}
 8020894:	bf00      	nop
 8020896:	bd80      	pop	{r7, pc}

08020898 <resetHandlerHelper>:
extern uint32_t _euserdata;
extern uint32_t _suserbss;
extern uint32_t _euserbss;


void resetHandlerHelper(void) {
 8020898:	b480      	push	{r7}
 802089a:	b089      	sub	sp, #36	@ 0x24
 802089c:	af00      	add	r7, sp, #0
  uint32_t dest = (uint32_t)&_sdata;
 802089e:	4b27      	ldr	r3, [pc, #156]	@ (802093c <resetHandlerHelper+0xa4>)
 80208a0:	60bb      	str	r3, [r7, #8]
  uint32_t dest_end = (uint32_t)&_edata;
 80208a2:	4b27      	ldr	r3, [pc, #156]	@ (8020940 <resetHandlerHelper+0xa8>)
 80208a4:	607b      	str	r3, [r7, #4]
  uint32_t src = (uint32_t)&_sidata;
 80208a6:	4b27      	ldr	r3, [pc, #156]	@ (8020944 <resetHandlerHelper+0xac>)
 80208a8:	61fb      	str	r3, [r7, #28]

  /*copy data from data section to ram
   * init .bss section*/
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 80208aa:	68bb      	ldr	r3, [r7, #8]
 80208ac:	61bb      	str	r3, [r7, #24]
 80208ae:	e009      	b.n	80208c4 <resetHandlerHelper+0x2c>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 80208b0:	69fa      	ldr	r2, [r7, #28]
 80208b2:	69bb      	ldr	r3, [r7, #24]
 80208b4:	6812      	ldr	r2, [r2, #0]
 80208b6:	601a      	str	r2, [r3, #0]
    src += 4;
 80208b8:	69fb      	ldr	r3, [r7, #28]
 80208ba:	3304      	adds	r3, #4
 80208bc:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 80208be:	69bb      	ldr	r3, [r7, #24]
 80208c0:	3304      	adds	r3, #4
 80208c2:	61bb      	str	r3, [r7, #24]
 80208c4:	69ba      	ldr	r2, [r7, #24]
 80208c6:	687b      	ldr	r3, [r7, #4]
 80208c8:	429a      	cmp	r2, r3
 80208ca:	d9f1      	bls.n	80208b0 <resetHandlerHelper+0x18>
  }

  dest = (uint32_t)&_suserdata;
 80208cc:	4b1e      	ldr	r3, [pc, #120]	@ (8020948 <resetHandlerHelper+0xb0>)
 80208ce:	60bb      	str	r3, [r7, #8]
  dest_end = (uint32_t)&_euserdata;
 80208d0:	4b1e      	ldr	r3, [pc, #120]	@ (802094c <resetHandlerHelper+0xb4>)
 80208d2:	607b      	str	r3, [r7, #4]
  src = (uint32_t)&_siuserdata;       // present in flash
 80208d4:	4b1e      	ldr	r3, [pc, #120]	@ (8020950 <resetHandlerHelper+0xb8>)
 80208d6:	61fb      	str	r3, [r7, #28]

  for (uint32_t i = dest; i <= dest_end; i += 4) {
 80208d8:	68bb      	ldr	r3, [r7, #8]
 80208da:	617b      	str	r3, [r7, #20]
 80208dc:	e009      	b.n	80208f2 <resetHandlerHelper+0x5a>
    *(uint32_t *)(i) = *(uint32_t *)(src);
 80208de:	69fa      	ldr	r2, [r7, #28]
 80208e0:	697b      	ldr	r3, [r7, #20]
 80208e2:	6812      	ldr	r2, [r2, #0]
 80208e4:	601a      	str	r2, [r3, #0]
    src += 4;
 80208e6:	69fb      	ldr	r3, [r7, #28]
 80208e8:	3304      	adds	r3, #4
 80208ea:	61fb      	str	r3, [r7, #28]
  for (uint32_t i = dest; i <= dest_end; i += 4) {
 80208ec:	697b      	ldr	r3, [r7, #20]
 80208ee:	3304      	adds	r3, #4
 80208f0:	617b      	str	r3, [r7, #20]
 80208f2:	697a      	ldr	r2, [r7, #20]
 80208f4:	687b      	ldr	r3, [r7, #4]
 80208f6:	429a      	cmp	r2, r3
 80208f8:	d9f1      	bls.n	80208de <resetHandlerHelper+0x46>
  }

  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 80208fa:	4b16      	ldr	r3, [pc, #88]	@ (8020954 <resetHandlerHelper+0xbc>)
 80208fc:	613b      	str	r3, [r7, #16]
 80208fe:	e005      	b.n	802090c <resetHandlerHelper+0x74>
    *(uint32_t *)(i) = 0;
 8020900:	693b      	ldr	r3, [r7, #16]
 8020902:	2200      	movs	r2, #0
 8020904:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_sbss; i <= (uint32_t)&_ebss; i += 4) {
 8020906:	693b      	ldr	r3, [r7, #16]
 8020908:	3304      	adds	r3, #4
 802090a:	613b      	str	r3, [r7, #16]
 802090c:	4a12      	ldr	r2, [pc, #72]	@ (8020958 <resetHandlerHelper+0xc0>)
 802090e:	693b      	ldr	r3, [r7, #16]
 8020910:	4293      	cmp	r3, r2
 8020912:	d9f5      	bls.n	8020900 <resetHandlerHelper+0x68>
  }
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 8020914:	4b11      	ldr	r3, [pc, #68]	@ (802095c <resetHandlerHelper+0xc4>)
 8020916:	60fb      	str	r3, [r7, #12]
 8020918:	e005      	b.n	8020926 <resetHandlerHelper+0x8e>
    *(uint32_t *)(i) = 0;
 802091a:	68fb      	ldr	r3, [r7, #12]
 802091c:	2200      	movs	r2, #0
 802091e:	601a      	str	r2, [r3, #0]
  for (uint32_t i = (uint32_t)&_suserbss; i <= (uint32_t)&_euserbss; i += 4) {
 8020920:	68fb      	ldr	r3, [r7, #12]
 8020922:	3304      	adds	r3, #4
 8020924:	60fb      	str	r3, [r7, #12]
 8020926:	4a0e      	ldr	r2, [pc, #56]	@ (8020960 <resetHandlerHelper+0xc8>)
 8020928:	68fb      	ldr	r3, [r7, #12]
 802092a:	4293      	cmp	r3, r2
 802092c:	d9f5      	bls.n	802091a <resetHandlerHelper+0x82>
  }
}
 802092e:	bf00      	nop
 8020930:	bf00      	nop
 8020932:	3724      	adds	r7, #36	@ 0x24
 8020934:	46bd      	mov	sp, r7
 8020936:	bc80      	pop	{r7}
 8020938:	4770      	bx	lr
 802093a:	bf00      	nop
 802093c:	20000000 	.word	0x20000000
 8020940:	20000001 	.word	0x20000001
 8020944:	0802161c 	.word	0x0802161c
 8020948:	20004000 	.word	0x20004000
 802094c:	20004000 	.word	0x20004000
 8020950:	080302c8 	.word	0x080302c8
 8020954:	20000004 	.word	0x20000004
 8020958:	20000471 	.word	0x20000471
 802095c:	20004000 	.word	0x20004000
 8020960:	20004000 	.word	0x20004000

08020964 <fault_handler_helper>:

void fault_handler_helper(uint32_t pc, uint8_t fault_identifier,
                          uint32_t fault_place) {
 8020964:	b580      	push	{r7, lr}
 8020966:	b086      	sub	sp, #24
 8020968:	af00      	add	r7, sp, #0
 802096a:	60f8      	str	r0, [r7, #12]
 802096c:	460b      	mov	r3, r1
 802096e:	607a      	str	r2, [r7, #4]
 8020970:	72fb      	strb	r3, [r7, #11]

  /* bus fault diagnosis */
  if (fault_identifier == BUSFAULT_IDENTIFIER) {
 8020972:	7afb      	ldrb	r3, [r7, #11]
 8020974:	2b00      	cmp	r3, #0
 8020976:	d10f      	bne.n	8020998 <fault_handler_helper+0x34>
    printf("busdault !!\n\r");
 8020978:	482a      	ldr	r0, [pc, #168]	@ (8020a24 <fault_handler_helper+0xc0>)
 802097a:	f7ff fe1d 	bl	80205b8 <printf>
    if (SCB->CFSR & SCB_CFSR_BFARVALID_Msk)
 802097e:	4b2a      	ldr	r3, [pc, #168]	@ (8020a28 <fault_handler_helper+0xc4>)
 8020980:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 8020982:	f403 4300 	and.w	r3, r3, #32768	@ 0x8000
 8020986:	2b00      	cmp	r3, #0
 8020988:	d01f      	beq.n	80209ca <fault_handler_helper+0x66>
      printf("busfault address -> %x\r", SCB->BFAR);
 802098a:	4b27      	ldr	r3, [pc, #156]	@ (8020a28 <fault_handler_helper+0xc4>)
 802098c:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
 802098e:	4619      	mov	r1, r3
 8020990:	4826      	ldr	r0, [pc, #152]	@ (8020a2c <fault_handler_helper+0xc8>)
 8020992:	f7ff fe11 	bl	80205b8 <printf>
 8020996:	e018      	b.n	80209ca <fault_handler_helper+0x66>
  }

  /* MemManagement diagnosis */
  else if (fault_identifier == MEMMANAGE_IDENTIFIER) {
 8020998:	7afb      	ldrb	r3, [r7, #11]
 802099a:	2b01      	cmp	r3, #1
 802099c:	d10f      	bne.n	80209be <fault_handler_helper+0x5a>
    printf("MemManagement exception !!\n\r");
 802099e:	4824      	ldr	r0, [pc, #144]	@ (8020a30 <fault_handler_helper+0xcc>)
 80209a0:	f7ff fe0a 	bl	80205b8 <printf>
    if (SCB->CFSR & SCB_CFSR_MMARVALID_Msk)
 80209a4:	4b20      	ldr	r3, [pc, #128]	@ (8020a28 <fault_handler_helper+0xc4>)
 80209a6:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
 80209a8:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 80209ac:	2b00      	cmp	r3, #0
 80209ae:	d00c      	beq.n	80209ca <fault_handler_helper+0x66>
      printf("address caused MemManage Fault -> %x\n\r", SCB->MMFAR);
 80209b0:	4b1d      	ldr	r3, [pc, #116]	@ (8020a28 <fault_handler_helper+0xc4>)
 80209b2:	6b5b      	ldr	r3, [r3, #52]	@ 0x34
 80209b4:	4619      	mov	r1, r3
 80209b6:	481f      	ldr	r0, [pc, #124]	@ (8020a34 <fault_handler_helper+0xd0>)
 80209b8:	f7ff fdfe 	bl	80205b8 <printf>
 80209bc:	e005      	b.n	80209ca <fault_handler_helper+0x66>
  }

  /* UsageFault diagnosis */
  else if (fault_identifier == USAGEFAULT_IDENTIFIER) {
 80209be:	7afb      	ldrb	r3, [r7, #11]
 80209c0:	2b02      	cmp	r3, #2
 80209c2:	d12a      	bne.n	8020a1a <fault_handler_helper+0xb6>
    printf("UsageFault !!\n\r");
 80209c4:	481c      	ldr	r0, [pc, #112]	@ (8020a38 <fault_handler_helper+0xd4>)
 80209c6:	f7ff fdf7 	bl	80205b8 <printf>
    /* there is no address access that can cause USAGE FAULT */
  } else {
    return;
  }

  uint32_t instruction = *(uint32_t *)(pc);
 80209ca:	68fb      	ldr	r3, [r7, #12]
 80209cc:	681b      	ldr	r3, [r3, #0]
 80209ce:	617b      	str	r3, [r7, #20]

  printf("configrable fault status reg (SCB->CFSR) => %x\n\r",
         SCB->CFSR);
 80209d0:	4b15      	ldr	r3, [pc, #84]	@ (8020a28 <fault_handler_helper+0xc4>)
 80209d2:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
  printf("configrable fault status reg (SCB->CFSR) => %x\n\r",
 80209d4:	4619      	mov	r1, r3
 80209d6:	4819      	ldr	r0, [pc, #100]	@ (8020a3c <fault_handler_helper+0xd8>)
 80209d8:	f7ff fdee 	bl	80205b8 <printf>
  printf("PC -> %x\n\r", pc);
 80209dc:	68f9      	ldr	r1, [r7, #12]
 80209de:	4818      	ldr	r0, [pc, #96]	@ (8020a40 <fault_handler_helper+0xdc>)
 80209e0:	f7ff fdea 	bl	80205b8 <printf>
  printf("instruction that caused the fault-> %x\n\r", instruction);
 80209e4:	6979      	ldr	r1, [r7, #20]
 80209e6:	4817      	ldr	r0, [pc, #92]	@ (8020a44 <fault_handler_helper+0xe0>)
 80209e8:	f7ff fde6 	bl	80205b8 <printf>

  /* KERNEL PANIC if fault in kernel
   * PROCESSES TERMINATION if fault in user process */

  if (fault_place == FAULT_IN_KERNEL) {
 80209ec:	687b      	ldr	r3, [r7, #4]
 80209ee:	2b01      	cmp	r3, #1
 80209f0:	d103      	bne.n	80209fa <fault_handler_helper+0x96>
    printf("\n\n\rKERNEL PANIC......\n\n\r");
 80209f2:	4815      	ldr	r0, [pc, #84]	@ (8020a48 <fault_handler_helper+0xe4>)
 80209f4:	f7ff fde0 	bl	80205b8 <printf>
    while (1)
 80209f8:	e7fe      	b.n	80209f8 <fault_handler_helper+0x94>
      ;
  }
  /* change state from running to suspend and set pendsv */
  else if (fault_place == FAULT_IN_USERPROC) {
 80209fa:	687b      	ldr	r3, [r7, #4]
 80209fc:	2b00      	cmp	r3, #0
 80209fe:	d10d      	bne.n	8020a1c <fault_handler_helper+0xb8>
    printf("terminating user process...\n\r");
 8020a00:	4812      	ldr	r0, [pc, #72]	@ (8020a4c <fault_handler_helper+0xe8>)
 8020a02:	f7ff fdd9 	bl	80205b8 <printf>
    printf("reason -> fault\n\r");
 8020a06:	4812      	ldr	r0, [pc, #72]	@ (8020a50 <fault_handler_helper+0xec>)
 8020a08:	f7ff fdd6 	bl	80205b8 <printf>

    (*(user_process_t **)(RUNNING_PROCESS_AD))->state = SUSPEND_STATE;
 8020a0c:	4b11      	ldr	r3, [pc, #68]	@ (8020a54 <fault_handler_helper+0xf0>)
 8020a0e:	681b      	ldr	r3, [r3, #0]
 8020a10:	2202      	movs	r2, #2
 8020a12:	62da      	str	r2, [r3, #44]	@ 0x2c

    /* trigger context switching*/
    PendSV_Handler();
 8020a14:	f000 fad4 	bl	8020fc0 <PendSV_Handler>
 8020a18:	e000      	b.n	8020a1c <fault_handler_helper+0xb8>
    return;
 8020a1a:	bf00      	nop
  }
}
 8020a1c:	3718      	adds	r7, #24
 8020a1e:	46bd      	mov	sp, r7
 8020a20:	bd80      	pop	{r7, pc}
 8020a22:	bf00      	nop
 8020a24:	08021190 	.word	0x08021190
 8020a28:	e000ed00 	.word	0xe000ed00
 8020a2c:	080211a0 	.word	0x080211a0
 8020a30:	080211b8 	.word	0x080211b8
 8020a34:	080211d8 	.word	0x080211d8
 8020a38:	08021200 	.word	0x08021200
 8020a3c:	08021210 	.word	0x08021210
 8020a40:	08021244 	.word	0x08021244
 8020a44:	08021250 	.word	0x08021250
 8020a48:	0802127c 	.word	0x0802127c
 8020a4c:	08021298 	.word	0x08021298
 8020a50:	080212b8 	.word	0x080212b8
 8020a54:	20016004 	.word	0x20016004

08020a58 <HardFault_Handler_helper>:

void HardFault_Handler_helper(uint32_t pc) {
 8020a58:	b580      	push	{r7, lr}
 8020a5a:	b084      	sub	sp, #16
 8020a5c:	af00      	add	r7, sp, #0
 8020a5e:	6078      	str	r0, [r7, #4]

  uint32_t instruction = *(uint32_t *)(pc);
 8020a60:	687b      	ldr	r3, [r7, #4]
 8020a62:	681b      	ldr	r3, [r3, #0]
 8020a64:	60fb      	str	r3, [r7, #12]

  printf("HARD_FAULT !!!\n\r");
 8020a66:	480d      	ldr	r0, [pc, #52]	@ (8020a9c <HardFault_Handler_helper+0x44>)
 8020a68:	f7ff fda6 	bl	80205b8 <printf>
  printf("configrable fault status reg (SCB->CFSR) => %x\n\r",
         SCB->CFSR);
 8020a6c:	4b0c      	ldr	r3, [pc, #48]	@ (8020aa0 <HardFault_Handler_helper+0x48>)
 8020a6e:	6a9b      	ldr	r3, [r3, #40]	@ 0x28
  printf("configrable fault status reg (SCB->CFSR) => %x\n\r",
 8020a70:	4619      	mov	r1, r3
 8020a72:	480c      	ldr	r0, [pc, #48]	@ (8020aa4 <HardFault_Handler_helper+0x4c>)
 8020a74:	f7ff fda0 	bl	80205b8 <printf>
  printf("Hard Fault Status Register -> %x\n\r", SCB->HFSR);
 8020a78:	4b09      	ldr	r3, [pc, #36]	@ (8020aa0 <HardFault_Handler_helper+0x48>)
 8020a7a:	6adb      	ldr	r3, [r3, #44]	@ 0x2c
 8020a7c:	4619      	mov	r1, r3
 8020a7e:	480a      	ldr	r0, [pc, #40]	@ (8020aa8 <HardFault_Handler_helper+0x50>)
 8020a80:	f7ff fd9a 	bl	80205b8 <printf>
  printf("PC -> %x\n\r", pc);
 8020a84:	6879      	ldr	r1, [r7, #4]
 8020a86:	4809      	ldr	r0, [pc, #36]	@ (8020aac <HardFault_Handler_helper+0x54>)
 8020a88:	f7ff fd96 	bl	80205b8 <printf>
  printf("instruction that triggered HardFault -> %x\n\r",
 8020a8c:	68f9      	ldr	r1, [r7, #12]
 8020a8e:	4808      	ldr	r0, [pc, #32]	@ (8020ab0 <HardFault_Handler_helper+0x58>)
 8020a90:	f7ff fd92 	bl	80205b8 <printf>
         instruction);
}
 8020a94:	bf00      	nop
 8020a96:	3710      	adds	r7, #16
 8020a98:	46bd      	mov	sp, r7
 8020a9a:	bd80      	pop	{r7, pc}
 8020a9c:	080212cc 	.word	0x080212cc
 8020aa0:	e000ed00 	.word	0xe000ed00
 8020aa4:	08021210 	.word	0x08021210
 8020aa8:	080212e0 	.word	0x080212e0
 8020aac:	08021244 	.word	0x08021244
 8020ab0:	08021304 	.word	0x08021304

08020ab4 <__NVIC_SetPendingIRQ>:
{
 8020ab4:	b480      	push	{r7}
 8020ab6:	b083      	sub	sp, #12
 8020ab8:	af00      	add	r7, sp, #0
 8020aba:	4603      	mov	r3, r0
 8020abc:	71fb      	strb	r3, [r7, #7]
  if ((int32_t)(IRQn) >= 0)
 8020abe:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8020ac2:	2b00      	cmp	r3, #0
 8020ac4:	db0c      	blt.n	8020ae0 <__NVIC_SetPendingIRQ+0x2c>
    NVIC->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
 8020ac6:	79fb      	ldrb	r3, [r7, #7]
 8020ac8:	f003 021f 	and.w	r2, r3, #31
 8020acc:	4907      	ldr	r1, [pc, #28]	@ (8020aec <__NVIC_SetPendingIRQ+0x38>)
 8020ace:	f997 3007 	ldrsb.w	r3, [r7, #7]
 8020ad2:	095b      	lsrs	r3, r3, #5
 8020ad4:	2001      	movs	r0, #1
 8020ad6:	fa00 f202 	lsl.w	r2, r0, r2
 8020ada:	3340      	adds	r3, #64	@ 0x40
 8020adc:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
}
 8020ae0:	bf00      	nop
 8020ae2:	370c      	adds	r7, #12
 8020ae4:	46bd      	mov	sp, r7
 8020ae6:	bc80      	pop	{r7}
 8020ae8:	4770      	bx	lr
 8020aea:	bf00      	nop
 8020aec:	e000e100 	.word	0xe000e100

08020af0 <process_exit>:
void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t ind);
void launch_process (void);


// if any of the process returns from mainx funcktion, this function wwill be called
void process_exit () {
 8020af0:	b580      	push	{r7, lr}
 8020af2:	b082      	sub	sp, #8
 8020af4:	af00      	add	r7, sp, #0
  // do what ever you want with the status

  // i dont know why i was getting hardfault when using <*(user_process_t **) RUNNING_PROCESS_AD> T_T 
  // got it .. should have used () to enclosed the constant in define.h file !!!
  user_process_t *process = *(user_process_t **)(RUNNING_PROCESS_AD);
 8020af6:	4b0e      	ldr	r3, [pc, #56]	@ (8020b30 <process_exit+0x40>)
 8020af8:	681b      	ldr	r3, [r3, #0]
 8020afa:	607b      	str	r3, [r7, #4]
  uint32_t process_id = process->process_id;
 8020afc:	687b      	ldr	r3, [r7, #4]
 8020afe:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8020b00:	603b      	str	r3, [r7, #0]
  printf ("process with process id <%d> is terminated \n\r",
 8020b02:	6839      	ldr	r1, [r7, #0]
 8020b04:	480b      	ldr	r0, [pc, #44]	@ (8020b34 <process_exit+0x44>)
 8020b06:	f7ff fd57 	bl	80205b8 <printf>
            process_id);
  // remove the process from the queue , call context switching and return
  
  // suspend the process
  process -> state = SUSPEND_STATE;
 8020b0a:	687b      	ldr	r3, [r7, #4]
 8020b0c:	2202      	movs	r2, #2
 8020b0e:	62da      	str	r2, [r3, #44]	@ 0x2c
 
  if (context_switch_dissabled){
 8020b10:	4b09      	ldr	r3, [pc, #36]	@ (8020b38 <process_exit+0x48>)
 8020b12:	781b      	ldrb	r3, [r3, #0]
 8020b14:	2b00      	cmp	r3, #0
 8020b16:	d002      	beq.n	8020b1e <process_exit+0x2e>
    kernel_hang("no available process\n");
 8020b18:	4808      	ldr	r0, [pc, #32]	@ (8020b3c <process_exit+0x4c>)
 8020b1a:	f7ff fe77 	bl	802080c <kernel_hang>
  }
  // set the pendsv (to trigger context switching)
  NVIC_SetPendingIRQ (PendSV_IRQn);
 8020b1e:	f06f 0001 	mvn.w	r0, #1
 8020b22:	f7ff ffc7 	bl	8020ab4 <__NVIC_SetPendingIRQ>
}
 8020b26:	bf00      	nop
 8020b28:	3708      	adds	r7, #8
 8020b2a:	46bd      	mov	sp, r7
 8020b2c:	bd80      	pop	{r7, pc}
 8020b2e:	bf00      	nop
 8020b30:	20016004 	.word	0x20016004
 8020b34:	08021334 	.word	0x08021334
 8020b38:	20000470 	.word	0x20000470
 8020b3c:	08021364 	.word	0x08021364

08020b40 <main>:

int main() {
 8020b40:	b580      	push	{r7, lr}
 8020b42:	b086      	sub	sp, #24
 8020b44:	af00      	add	r7, sp, #0

    SCB->SHP[10] = 0xff;    // set the PendSV to be the lowest priority...
 8020b46:	4b53      	ldr	r3, [pc, #332]	@ (8020c94 <main+0x154>)
 8020b48:	22ff      	movs	r2, #255	@ 0xff
 8020b4a:	f883 2022 	strb.w	r2, [r3, #34]	@ 0x22

    /* some init code */
    __usart1_init ();
 8020b4e:	f000 f9b5 	bl	8020ebc <__usart1_init>
    queue_init (&ready_queue);
 8020b52:	4851      	ldr	r0, [pc, #324]	@ (8020c98 <main+0x158>)
 8020b54:	f7ff fb28 	bl	80201a8 <queue_init>
    semaphore_init (&sem_usart1, 1);
 8020b58:	2101      	movs	r1, #1
 8020b5a:	4850      	ldr	r0, [pc, #320]	@ (8020c9c <main+0x15c>)
 8020b5c:	f7ff fc0e 	bl	802037c <semaphore_init>

    if (process_count < 1 || process_count > MAX_PROCESS_NUM){
 8020b60:	4b4f      	ldr	r3, [pc, #316]	@ (8020ca0 <main+0x160>)
 8020b62:	781b      	ldrb	r3, [r3, #0]
 8020b64:	2b00      	cmp	r3, #0
 8020b66:	d003      	beq.n	8020b70 <main+0x30>
 8020b68:	4b4d      	ldr	r3, [pc, #308]	@ (8020ca0 <main+0x160>)
 8020b6a:	781b      	ldrb	r3, [r3, #0]
 8020b6c:	2b0f      	cmp	r3, #15
 8020b6e:	d903      	bls.n	8020b78 <main+0x38>
        printf ("ERROR in the number of process ....\n\r");
 8020b70:	484c      	ldr	r0, [pc, #304]	@ (8020ca4 <main+0x164>)
 8020b72:	f7ff fd21 	bl	80205b8 <printf>
        while (1);
 8020b76:	e7fe      	b.n	8020b76 <main+0x36>
    }

    /******************** fault handler init ***************************/
    
    // enable faults (without this any fault = hardfault)
    SCB->SHCSR |= SCB_SHCSR_BUSFAULTENA_Msk;
 8020b78:	4b46      	ldr	r3, [pc, #280]	@ (8020c94 <main+0x154>)
 8020b7a:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020b7c:	4a45      	ldr	r2, [pc, #276]	@ (8020c94 <main+0x154>)
 8020b7e:	f443 3300 	orr.w	r3, r3, #131072	@ 0x20000
 8020b82:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_USGFAULTENA_Msk;
 8020b84:	4b43      	ldr	r3, [pc, #268]	@ (8020c94 <main+0x154>)
 8020b86:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020b88:	4a42      	ldr	r2, [pc, #264]	@ (8020c94 <main+0x154>)
 8020b8a:	f443 2380 	orr.w	r3, r3, #262144	@ 0x40000
 8020b8e:	6253      	str	r3, [r2, #36]	@ 0x24
    SCB->SHCSR |= SCB_SHCSR_MEMFAULTENA_Msk;
 8020b90:	4b40      	ldr	r3, [pc, #256]	@ (8020c94 <main+0x154>)
 8020b92:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020b94:	4a3f      	ldr	r2, [pc, #252]	@ (8020c94 <main+0x154>)
 8020b96:	f443 3380 	orr.w	r3, r3, #65536	@ 0x10000
 8020b9a:	6253      	str	r3, [r2, #36]	@ 0x24



    /* init syscall table */
    Syscall_Table[0] =  (void (*) (void))syscall__printf;
 8020b9c:	4b42      	ldr	r3, [pc, #264]	@ (8020ca8 <main+0x168>)
 8020b9e:	4a43      	ldr	r2, [pc, #268]	@ (8020cac <main+0x16c>)
 8020ba0:	601a      	str	r2, [r3, #0]
    Syscall_Table[1] =  (void (*) (void))syscall__scanf;
 8020ba2:	4b41      	ldr	r3, [pc, #260]	@ (8020ca8 <main+0x168>)
 8020ba4:	4a42      	ldr	r2, [pc, #264]	@ (8020cb0 <main+0x170>)
 8020ba6:	605a      	str	r2, [r3, #4]
    Syscall_Table[2] =  (void (*) (void))syscall__process_exit;
 8020ba8:	4b3f      	ldr	r3, [pc, #252]	@ (8020ca8 <main+0x168>)
 8020baa:	4a42      	ldr	r2, [pc, #264]	@ (8020cb4 <main+0x174>)
 8020bac:	609a      	str	r2, [r3, #8]

    *(uint32_t *)(SYSCALL_TABLE_AD) = (uint32_t)(Syscall_Table);
 8020bae:	4b42      	ldr	r3, [pc, #264]	@ (8020cb8 <main+0x178>)
 8020bb0:	4a3d      	ldr	r2, [pc, #244]	@ (8020ca8 <main+0x168>)
 8020bb2:	601a      	str	r2, [r3, #0]
    
    uint32_t psp_val = USER_STACK_INIT;
 8020bb4:	4b41      	ldr	r3, [pc, #260]	@ (8020cbc <main+0x17c>)
 8020bb6:	617b      	str	r3, [r7, #20]
    uint32_t msp_val = KERNEL_STACK_INIT;
 8020bb8:	4b41      	ldr	r3, [pc, #260]	@ (8020cc0 <main+0x180>)
 8020bba:	613b      	str	r3, [r7, #16]
    uint32_t user_stack_size = USER_STACK_SIZE / process_count;
 8020bbc:	4b38      	ldr	r3, [pc, #224]	@ (8020ca0 <main+0x160>)
 8020bbe:	781b      	ldrb	r3, [r3, #0]
 8020bc0:	461a      	mov	r2, r3
 8020bc2:	f44f 4300 	mov.w	r3, #32768	@ 0x8000
 8020bc6:	fb93 f3f2 	sdiv	r3, r3, r2
 8020bca:	60bb      	str	r3, [r7, #8]
    uint32_t kernel_stack_size = KERNEL_STACK_SIZE / process_count;
 8020bcc:	4b34      	ldr	r3, [pc, #208]	@ (8020ca0 <main+0x160>)
 8020bce:	781b      	ldrb	r3, [r3, #0]
 8020bd0:	461a      	mov	r2, r3
 8020bd2:	f44f 43c0 	mov.w	r3, #24576	@ 0x6000
 8020bd6:	fb93 f3f2 	sdiv	r3, r3, r2
 8020bda:	607b      	str	r3, [r7, #4]

    /* fill the pcs */
    process_pc [0] = main1;
 8020bdc:	4b39      	ldr	r3, [pc, #228]	@ (8020cc4 <main+0x184>)
 8020bde:	4a3a      	ldr	r2, [pc, #232]	@ (8020cc8 <main+0x188>)
 8020be0:	601a      	str	r2, [r3, #0]
    process_pc [1] = main2;
 8020be2:	4b38      	ldr	r3, [pc, #224]	@ (8020cc4 <main+0x184>)
 8020be4:	4a39      	ldr	r2, [pc, #228]	@ (8020ccc <main+0x18c>)
 8020be6:	605a      	str	r2, [r3, #4]
    process_pc [2] = main3;
 8020be8:	4b36      	ldr	r3, [pc, #216]	@ (8020cc4 <main+0x184>)
 8020bea:	4a39      	ldr	r2, [pc, #228]	@ (8020cd0 <main+0x190>)
 8020bec:	609a      	str	r2, [r3, #8]
    process_pc [3] = main4;
 8020bee:	4b35      	ldr	r3, [pc, #212]	@ (8020cc4 <main+0x184>)
 8020bf0:	4a38      	ldr	r2, [pc, #224]	@ (8020cd4 <main+0x194>)
 8020bf2:	60da      	str	r2, [r3, #12]
    process_pc [4] = main5;
 8020bf4:	4b33      	ldr	r3, [pc, #204]	@ (8020cc4 <main+0x184>)
 8020bf6:	4a38      	ldr	r2, [pc, #224]	@ (8020cd8 <main+0x198>)
 8020bf8:	611a      	str	r2, [r3, #16]
    process_pc [5] = main6;
 8020bfa:	4b32      	ldr	r3, [pc, #200]	@ (8020cc4 <main+0x184>)
 8020bfc:	4a37      	ldr	r2, [pc, #220]	@ (8020cdc <main+0x19c>)
 8020bfe:	615a      	str	r2, [r3, #20]
    process_pc [6] = main7;
 8020c00:	4b30      	ldr	r3, [pc, #192]	@ (8020cc4 <main+0x184>)
 8020c02:	4a37      	ldr	r2, [pc, #220]	@ (8020ce0 <main+0x1a0>)
 8020c04:	619a      	str	r2, [r3, #24]
    process_pc [7] = main8;
 8020c06:	4b2f      	ldr	r3, [pc, #188]	@ (8020cc4 <main+0x184>)
 8020c08:	4a36      	ldr	r2, [pc, #216]	@ (8020ce4 <main+0x1a4>)
 8020c0a:	61da      	str	r2, [r3, #28]
    process_pc [8] = main9;
 8020c0c:	4b2d      	ldr	r3, [pc, #180]	@ (8020cc4 <main+0x184>)
 8020c0e:	4a36      	ldr	r2, [pc, #216]	@ (8020ce8 <main+0x1a8>)
 8020c10:	621a      	str	r2, [r3, #32]
    process_pc [9] = main10;
 8020c12:	4b2c      	ldr	r3, [pc, #176]	@ (8020cc4 <main+0x184>)
 8020c14:	4a35      	ldr	r2, [pc, #212]	@ (8020cec <main+0x1ac>)
 8020c16:	625a      	str	r2, [r3, #36]	@ 0x24
    process_pc [10] = main11;
 8020c18:	4b2a      	ldr	r3, [pc, #168]	@ (8020cc4 <main+0x184>)
 8020c1a:	4a35      	ldr	r2, [pc, #212]	@ (8020cf0 <main+0x1b0>)
 8020c1c:	629a      	str	r2, [r3, #40]	@ 0x28
    process_pc [11] = main12;
 8020c1e:	4b29      	ldr	r3, [pc, #164]	@ (8020cc4 <main+0x184>)
 8020c20:	4a34      	ldr	r2, [pc, #208]	@ (8020cf4 <main+0x1b4>)
 8020c22:	62da      	str	r2, [r3, #44]	@ 0x2c
    process_pc [12] = main13;
 8020c24:	4b27      	ldr	r3, [pc, #156]	@ (8020cc4 <main+0x184>)
 8020c26:	4a34      	ldr	r2, [pc, #208]	@ (8020cf8 <main+0x1b8>)
 8020c28:	631a      	str	r2, [r3, #48]	@ 0x30
    process_pc [13] = main14;
 8020c2a:	4b26      	ldr	r3, [pc, #152]	@ (8020cc4 <main+0x184>)
 8020c2c:	4a33      	ldr	r2, [pc, #204]	@ (8020cfc <main+0x1bc>)
 8020c2e:	635a      	str	r2, [r3, #52]	@ 0x34
    process_pc [14] = main15;
 8020c30:	4b24      	ldr	r3, [pc, #144]	@ (8020cc4 <main+0x184>)
 8020c32:	4a33      	ldr	r2, [pc, #204]	@ (8020d00 <main+0x1c0>)
 8020c34:	639a      	str	r2, [r3, #56]	@ 0x38

    for (uint8_t i=0; i<process_count; i++){
 8020c36:	2300      	movs	r3, #0
 8020c38:	73fb      	strb	r3, [r7, #15]
 8020c3a:	e01d      	b.n	8020c78 <main+0x138>
        /* make stack pointers word aligned */
        psp_val &= ~(3);
 8020c3c:	697b      	ldr	r3, [r7, #20]
 8020c3e:	f023 0303 	bic.w	r3, r3, #3
 8020c42:	617b      	str	r3, [r7, #20]
        msp_val &= ~(3);
 8020c44:	693b      	ldr	r3, [r7, #16]
 8020c46:	f023 0303 	bic.w	r3, r3, #3
 8020c4a:	613b      	str	r3, [r7, #16]

        make_process (&process[i], psp_val, msp_val, i);
 8020c4c:	7bfb      	ldrb	r3, [r7, #15]
 8020c4e:	2234      	movs	r2, #52	@ 0x34
 8020c50:	fb02 f303 	mul.w	r3, r2, r3
 8020c54:	4a2b      	ldr	r2, [pc, #172]	@ (8020d04 <main+0x1c4>)
 8020c56:	1898      	adds	r0, r3, r2
 8020c58:	7bfb      	ldrb	r3, [r7, #15]
 8020c5a:	693a      	ldr	r2, [r7, #16]
 8020c5c:	6979      	ldr	r1, [r7, #20]
 8020c5e:	f000 f855 	bl	8020d0c <make_process>
        psp_val -= user_stack_size;
 8020c62:	697a      	ldr	r2, [r7, #20]
 8020c64:	68bb      	ldr	r3, [r7, #8]
 8020c66:	1ad3      	subs	r3, r2, r3
 8020c68:	617b      	str	r3, [r7, #20]
        msp_val -= kernel_stack_size;
 8020c6a:	693a      	ldr	r2, [r7, #16]
 8020c6c:	687b      	ldr	r3, [r7, #4]
 8020c6e:	1ad3      	subs	r3, r2, r3
 8020c70:	613b      	str	r3, [r7, #16]
    for (uint8_t i=0; i<process_count; i++){
 8020c72:	7bfb      	ldrb	r3, [r7, #15]
 8020c74:	3301      	adds	r3, #1
 8020c76:	73fb      	strb	r3, [r7, #15]
 8020c78:	4b09      	ldr	r3, [pc, #36]	@ (8020ca0 <main+0x160>)
 8020c7a:	781b      	ldrb	r3, [r3, #0]
 8020c7c:	7bfa      	ldrb	r2, [r7, #15]
 8020c7e:	429a      	cmp	r2, r3
 8020c80:	d3dc      	bcc.n	8020c3c <main+0xfc>
 
    /* accessing illegal address in kernel code -> Kernel Panic*/
//    *(uint32_t*) (0xffffffff) = 5;

    /*impose user restriction*/
    mpu_setup ();
 8020c82:	f7ff fa5d 	bl	8020140 <mpu_setup>

    /* start the processes */
    launch_process();
 8020c86:	f000 f8bd 	bl	8020e04 <launch_process>
    // TODO
    // transfer the control to this section from user space if there is no process to be run


    // if all the processes are done
    printf ("all the processes are done executing \n\r");
 8020c8a:	481f      	ldr	r0, [pc, #124]	@ (8020d08 <main+0x1c8>)
 8020c8c:	f7ff fc94 	bl	80205b8 <printf>
    while (1);
 8020c90:	e7fe      	b.n	8020c90 <main+0x150>
 8020c92:	bf00      	nop
 8020c94:	e000ed00 	.word	0xe000ed00
 8020c98:	200003f4 	.word	0x200003f4
 8020c9c:	2000002c 	.word	0x2000002c
 8020ca0:	20000000 	.word	0x20000000
 8020ca4:	0802137c 	.word	0x0802137c
 8020ca8:	20000004 	.word	0x20000004
 8020cac:	08020851 	.word	0x08020851
 8020cb0:	08020885 	.word	0x08020885
 8020cb4:	0802088d 	.word	0x0802088d
 8020cb8:	2001600c 	.word	0x2001600c
 8020cbc:	20010000 	.word	0x20010000
 8020cc0:	20016000 	.word	0x20016000
 8020cc4:	200003b8 	.word	0x200003b8
 8020cc8:	08030279 	.word	0x08030279
 8020ccc:	08030135 	.word	0x08030135
 8020cd0:	08030161 	.word	0x08030161
 8020cd4:	0803019d 	.word	0x0803019d
 8020cd8:	080301c9 	.word	0x080301c9
 8020cdc:	080301f5 	.word	0x080301f5
 8020ce0:	08030221 	.word	0x08030221
 8020ce4:	08030109 	.word	0x08030109
 8020ce8:	0803024d 	.word	0x0803024d
 8020cec:	08030001 	.word	0x08030001
 8020cf0:	0803002d 	.word	0x0803002d
 8020cf4:	08030059 	.word	0x08030059
 8020cf8:	08030085 	.word	0x08030085
 8020cfc:	080300b1 	.word	0x080300b1
 8020d00:	080300dd 	.word	0x080300dd
 8020d04:	200000ac 	.word	0x200000ac
 8020d08:	080213a4 	.word	0x080213a4

08020d0c <make_process>:
}

void make_process (user_process_t* process, uint32_t psp, uint32_t msp, uint8_t process_id){
 8020d0c:	b480      	push	{r7}
 8020d0e:	b087      	sub	sp, #28
 8020d10:	af00      	add	r7, sp, #0
 8020d12:	60f8      	str	r0, [r7, #12]
 8020d14:	60b9      	str	r1, [r7, #8]
 8020d16:	607a      	str	r2, [r7, #4]
 8020d18:	70fb      	strb	r3, [r7, #3]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
        = process->r9 = process->r10 = process->r11 = 0;
 8020d1a:	68fb      	ldr	r3, [r7, #12]
 8020d1c:	2200      	movs	r2, #0
 8020d1e:	61da      	str	r2, [r3, #28]
 8020d20:	68fb      	ldr	r3, [r7, #12]
 8020d22:	69da      	ldr	r2, [r3, #28]
 8020d24:	68fb      	ldr	r3, [r7, #12]
 8020d26:	619a      	str	r2, [r3, #24]
 8020d28:	68fb      	ldr	r3, [r7, #12]
 8020d2a:	699a      	ldr	r2, [r3, #24]
 8020d2c:	68fb      	ldr	r3, [r7, #12]
 8020d2e:	615a      	str	r2, [r3, #20]
 8020d30:	68fb      	ldr	r3, [r7, #12]
 8020d32:	695a      	ldr	r2, [r3, #20]
 8020d34:	68fb      	ldr	r3, [r7, #12]
 8020d36:	611a      	str	r2, [r3, #16]
    process->r4 = process->r5 = process->r6 = process->r7 = process->r8 
 8020d38:	68fb      	ldr	r3, [r7, #12]
 8020d3a:	691a      	ldr	r2, [r3, #16]
 8020d3c:	68fb      	ldr	r3, [r7, #12]
 8020d3e:	60da      	str	r2, [r3, #12]
 8020d40:	68fb      	ldr	r3, [r7, #12]
 8020d42:	68da      	ldr	r2, [r3, #12]
 8020d44:	68fb      	ldr	r3, [r7, #12]
 8020d46:	609a      	str	r2, [r3, #8]
 8020d48:	68fb      	ldr	r3, [r7, #12]
 8020d4a:	689a      	ldr	r2, [r3, #8]
 8020d4c:	68fb      	ldr	r3, [r7, #12]
 8020d4e:	605a      	str	r2, [r3, #4]
 8020d50:	68fb      	ldr	r3, [r7, #12]
 8020d52:	685a      	ldr	r2, [r3, #4]
 8020d54:	68fb      	ldr	r3, [r7, #12]
 8020d56:	601a      	str	r2, [r3, #0]

    /* set the lr to a valid EXEC_RETURN value as .. if p1 is running and we want to 
switch to p2, bx lr will be called => starting -> set lr to a valid EXEC_RETURN value
*/
    process-> lr = 0xfffffffd;
 8020d58:	68fb      	ldr	r3, [r7, #12]
 8020d5a:	f06f 0202 	mvn.w	r2, #2
 8020d5e:	629a      	str	r2, [r3, #40]	@ 0x28



    //process->pc = (uint32_t) fun;
    process->psp = psp;
 8020d60:	68fb      	ldr	r3, [r7, #12]
 8020d62:	68ba      	ldr	r2, [r7, #8]
 8020d64:	621a      	str	r2, [r3, #32]
    process->msp = msp;
 8020d66:	68fb      	ldr	r3, [r7, #12]
 8020d68:	687a      	ldr	r2, [r7, #4]
 8020d6a:	625a      	str	r2, [r3, #36]	@ 0x24
    process->psp -= 8*4;        // start from 8 word below the base of the stack
 8020d6c:	68fb      	ldr	r3, [r7, #12]
 8020d6e:	6a1b      	ldr	r3, [r3, #32]
 8020d70:	f1a3 0220 	sub.w	r2, r3, #32
 8020d74:	68fb      	ldr	r3, [r7, #12]
 8020d76:	621a      	str	r2, [r3, #32]
    represent thumb state 
    */

    // put the lr value in stack if you want to be able to return from the user process
  
    for (int i=0; i<8; i++){
 8020d78:	2300      	movs	r3, #0
 8020d7a:	617b      	str	r3, [r7, #20]
 8020d7c:	e032      	b.n	8020de4 <make_process+0xd8>
        if (i == 5) {
 8020d7e:	697b      	ldr	r3, [r7, #20]
 8020d80:	2b05      	cmp	r3, #5
 8020d82:	d108      	bne.n	8020d96 <make_process+0x8a>
          *(uint32_t *)(process->psp+i*4) = (uint32_t ) user_process_exit;
 8020d84:	68fb      	ldr	r3, [r7, #12]
 8020d86:	6a1b      	ldr	r3, [r3, #32]
 8020d88:	697a      	ldr	r2, [r7, #20]
 8020d8a:	0092      	lsls	r2, r2, #2
 8020d8c:	4413      	add	r3, r2
 8020d8e:	461a      	mov	r2, r3
 8020d90:	4b1a      	ldr	r3, [pc, #104]	@ (8020dfc <make_process+0xf0>)
 8020d92:	6013      	str	r3, [r2, #0]
 8020d94:	e023      	b.n	8020dde <make_process+0xd2>
        }
        else if (i == 6)
 8020d96:	697b      	ldr	r3, [r7, #20]
 8020d98:	2b06      	cmp	r3, #6
 8020d9a:	d10b      	bne.n	8020db4 <make_process+0xa8>
            *(uint32_t *)(process->psp+i*4) =
                    (uint32_t) process_pc [process_id];
 8020d9c:	78fb      	ldrb	r3, [r7, #3]
 8020d9e:	4a18      	ldr	r2, [pc, #96]	@ (8020e00 <make_process+0xf4>)
 8020da0:	f852 1023 	ldr.w	r1, [r2, r3, lsl #2]
            *(uint32_t *)(process->psp+i*4) =
 8020da4:	68fb      	ldr	r3, [r7, #12]
 8020da6:	6a1b      	ldr	r3, [r3, #32]
 8020da8:	697a      	ldr	r2, [r7, #20]
 8020daa:	0092      	lsls	r2, r2, #2
 8020dac:	4413      	add	r3, r2
                    (uint32_t) process_pc [process_id];
 8020dae:	460a      	mov	r2, r1
            *(uint32_t *)(process->psp+i*4) =
 8020db0:	601a      	str	r2, [r3, #0]
 8020db2:	e014      	b.n	8020dde <make_process+0xd2>
        else if (i == 7)
 8020db4:	697b      	ldr	r3, [r7, #20]
 8020db6:	2b07      	cmp	r3, #7
 8020db8:	d109      	bne.n	8020dce <make_process+0xc2>
            *(uint32_t *)(process->psp+i*4) = 0x01000000;
 8020dba:	68fb      	ldr	r3, [r7, #12]
 8020dbc:	6a1b      	ldr	r3, [r3, #32]
 8020dbe:	697a      	ldr	r2, [r7, #20]
 8020dc0:	0092      	lsls	r2, r2, #2
 8020dc2:	4413      	add	r3, r2
 8020dc4:	461a      	mov	r2, r3
 8020dc6:	f04f 7380 	mov.w	r3, #16777216	@ 0x1000000
 8020dca:	6013      	str	r3, [r2, #0]
 8020dcc:	e007      	b.n	8020dde <make_process+0xd2>
        else 
            *(uint32_t *)(process->psp+i*4) = 0x0;
 8020dce:	68fb      	ldr	r3, [r7, #12]
 8020dd0:	6a1b      	ldr	r3, [r3, #32]
 8020dd2:	697a      	ldr	r2, [r7, #20]
 8020dd4:	0092      	lsls	r2, r2, #2
 8020dd6:	4413      	add	r3, r2
 8020dd8:	461a      	mov	r2, r3
 8020dda:	2300      	movs	r3, #0
 8020ddc:	6013      	str	r3, [r2, #0]
    for (int i=0; i<8; i++){
 8020dde:	697b      	ldr	r3, [r7, #20]
 8020de0:	3301      	adds	r3, #1
 8020de2:	617b      	str	r3, [r7, #20]
 8020de4:	697b      	ldr	r3, [r7, #20]
 8020de6:	2b07      	cmp	r3, #7
 8020de8:	ddc9      	ble.n	8020d7e <make_process+0x72>
    }
    
    process-> process_id = process_id;
 8020dea:	78fa      	ldrb	r2, [r7, #3]
 8020dec:	68fb      	ldr	r3, [r7, #12]
 8020dee:	631a      	str	r2, [r3, #48]	@ 0x30

}
 8020df0:	bf00      	nop
 8020df2:	371c      	adds	r7, #28
 8020df4:	46bd      	mov	sp, r7
 8020df6:	bc80      	pop	{r7}
 8020df8:	4770      	bx	lr
 8020dfa:	bf00      	nop
 8020dfc:	080302c5 	.word	0x080302c5
 8020e00:	200003b8 	.word	0x200003b8

08020e04 <launch_process>:

void  launch_process (void){
 8020e04:	b580      	push	{r7, lr}
 8020e06:	b082      	sub	sp, #8
 8020e08:	af00      	add	r7, sp, #0
     * interrupt enable, set clock source to AHB (16MHz default),
     * enable the counter
     *
     * dont enable interrupt in NVIC ( NVIC is for external interrupts )
     * */
    __asm__set_psp (process[0].psp);
 8020e0a:	4b27      	ldr	r3, [pc, #156]	@ (8020ea8 <launch_process+0xa4>)
 8020e0c:	6a1b      	ldr	r3, [r3, #32]
 8020e0e:	4618      	mov	r0, r3
 8020e10:	f000 f8c8 	bl	8020fa4 <__asm__set_psp>
    __asm__set_msp (process[0].msp);
 8020e14:	4b24      	ldr	r3, [pc, #144]	@ (8020ea8 <launch_process+0xa4>)
 8020e16:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020e18:	4618      	mov	r0, r3
 8020e1a:	f000 f8c6 	bl	8020faa <__asm__set_msp>
       

    SysTick->LOAD = 16000 - 1;
 8020e1e:	4b23      	ldr	r3, [pc, #140]	@ (8020eac <launch_process+0xa8>)
 8020e20:	f643 627f 	movw	r2, #15999	@ 0x3e7f
 8020e24:	605a      	str	r2, [r3, #4]
    SysTick->CTRL |= (SysTick_CTRL_CLKSOURCE_Msk | SysTick_CTRL_TICKINT_Msk
 8020e26:	4b21      	ldr	r3, [pc, #132]	@ (8020eac <launch_process+0xa8>)
 8020e28:	681b      	ldr	r3, [r3, #0]
 8020e2a:	4a20      	ldr	r2, [pc, #128]	@ (8020eac <launch_process+0xa8>)
 8020e2c:	f043 0307 	orr.w	r3, r3, #7
 8020e30:	6013      	str	r3, [r2, #0]
            | SysTick_CTRL_ENABLE_Msk);

    // put the address of process1 in RUNNING_PROCESS_AD
    // change the state field in process

    *(uint32_t *)(RUNNING_PROCESS_AD) = (uint32_t)(&process[0]);
 8020e32:	4b1f      	ldr	r3, [pc, #124]	@ (8020eb0 <launch_process+0xac>)
 8020e34:	4a1c      	ldr	r2, [pc, #112]	@ (8020ea8 <launch_process+0xa4>)
 8020e36:	601a      	str	r2, [r3, #0]

    /* initially all the processes will be placed in the ready queue except the first one (entry point) */
    for (uint8_t i=1; i<process_count; i++){
 8020e38:	2301      	movs	r3, #1
 8020e3a:	71fb      	strb	r3, [r7, #7]
 8020e3c:	e012      	b.n	8020e64 <launch_process+0x60>
        int status = queue_push (&ready_queue, &process[i]);
 8020e3e:	79fb      	ldrb	r3, [r7, #7]
 8020e40:	2234      	movs	r2, #52	@ 0x34
 8020e42:	fb02 f303 	mul.w	r3, r2, r3
 8020e46:	4a18      	ldr	r2, [pc, #96]	@ (8020ea8 <launch_process+0xa4>)
 8020e48:	4413      	add	r3, r2
 8020e4a:	4619      	mov	r1, r3
 8020e4c:	4819      	ldr	r0, [pc, #100]	@ (8020eb4 <launch_process+0xb0>)
 8020e4e:	f7ff f9c0 	bl	80201d2 <queue_push>
 8020e52:	4603      	mov	r3, r0
 8020e54:	603b      	str	r3, [r7, #0]
        if (status){
 8020e56:	683b      	ldr	r3, [r7, #0]
 8020e58:	2b00      	cmp	r3, #0
 8020e5a:	d000      	beq.n	8020e5e <launch_process+0x5a>
            while (1);
 8020e5c:	e7fe      	b.n	8020e5c <launch_process+0x58>
    for (uint8_t i=1; i<process_count; i++){
 8020e5e:	79fb      	ldrb	r3, [r7, #7]
 8020e60:	3301      	adds	r3, #1
 8020e62:	71fb      	strb	r3, [r7, #7]
 8020e64:	4b14      	ldr	r3, [pc, #80]	@ (8020eb8 <launch_process+0xb4>)
 8020e66:	781b      	ldrb	r3, [r3, #0]
 8020e68:	79fa      	ldrb	r2, [r7, #7]
 8020e6a:	429a      	cmp	r2, r3
 8020e6c:	d3e7      	bcc.n	8020e3e <launch_process+0x3a>
        }
    }

    process[0].state = RUNNING_STATE;
 8020e6e:	4b0e      	ldr	r3, [pc, #56]	@ (8020ea8 <launch_process+0xa4>)
 8020e70:	2201      	movs	r2, #1
 8020e72:	62da      	str	r2, [r3, #44]	@ 0x2c
    for (uint8_t i=1; i<process_count; i++){
 8020e74:	2301      	movs	r3, #1
 8020e76:	71bb      	strb	r3, [r7, #6]
 8020e78:	e00b      	b.n	8020e92 <launch_process+0x8e>
        process[i].state = READY_STATE;
 8020e7a:	79bb      	ldrb	r3, [r7, #6]
 8020e7c:	4a0a      	ldr	r2, [pc, #40]	@ (8020ea8 <launch_process+0xa4>)
 8020e7e:	2134      	movs	r1, #52	@ 0x34
 8020e80:	fb01 f303 	mul.w	r3, r1, r3
 8020e84:	4413      	add	r3, r2
 8020e86:	332c      	adds	r3, #44	@ 0x2c
 8020e88:	2200      	movs	r2, #0
 8020e8a:	601a      	str	r2, [r3, #0]
    for (uint8_t i=1; i<process_count; i++){
 8020e8c:	79bb      	ldrb	r3, [r7, #6]
 8020e8e:	3301      	adds	r3, #1
 8020e90:	71bb      	strb	r3, [r7, #6]
 8020e92:	4b09      	ldr	r3, [pc, #36]	@ (8020eb8 <launch_process+0xb4>)
 8020e94:	781b      	ldrb	r3, [r3, #0]
 8020e96:	79ba      	ldrb	r2, [r7, #6]
 8020e98:	429a      	cmp	r2, r3
 8020e9a:	d3ee      	bcc.n	8020e7a <launch_process+0x76>
    }
 
    __asm__launch_main1();
 8020e9c:	f00f fa08 	bl	80302b0 <__asm__launch_main1>

}
 8020ea0:	bf00      	nop
 8020ea2:	3708      	adds	r7, #8
 8020ea4:	46bd      	mov	sp, r7
 8020ea6:	bd80      	pop	{r7, pc}
 8020ea8:	200000ac 	.word	0x200000ac
 8020eac:	e000e010 	.word	0xe000e010
 8020eb0:	20016004 	.word	0x20016004
 8020eb4:	200003f4 	.word	0x200003f4
 8020eb8:	20000000 	.word	0x20000000

08020ebc <__usart1_init>:
#include "core.h"
#include "usart.h"

void __usart1_init(void) {
 8020ebc:	b480      	push	{r7}
 8020ebe:	af00      	add	r7, sp, #0

  RCC->APB2ENR |= RCC_APB2ENR_USART1EN_Msk;
 8020ec0:	4b1c      	ldr	r3, [pc, #112]	@ (8020f34 <__usart1_init+0x78>)
 8020ec2:	6c5b      	ldr	r3, [r3, #68]	@ 0x44
 8020ec4:	4a1b      	ldr	r2, [pc, #108]	@ (8020f34 <__usart1_init+0x78>)
 8020ec6:	f043 0310 	orr.w	r3, r3, #16
 8020eca:	6453      	str	r3, [r2, #68]	@ 0x44
  RCC->AHB1ENR |= RCC_AHB1ENR_GPIOAEN;
 8020ecc:	4b19      	ldr	r3, [pc, #100]	@ (8020f34 <__usart1_init+0x78>)
 8020ece:	6b1b      	ldr	r3, [r3, #48]	@ 0x30
 8020ed0:	4a18      	ldr	r2, [pc, #96]	@ (8020f34 <__usart1_init+0x78>)
 8020ed2:	f043 0301 	orr.w	r3, r3, #1
 8020ed6:	6313      	str	r3, [r2, #48]	@ 0x30
  // alternate function mode
  GPIOA->MODER &= ~((3 << (2 * TX_PIN)) | (3 << (2 * RX_PIN)));
 8020ed8:	4b17      	ldr	r3, [pc, #92]	@ (8020f38 <__usart1_init+0x7c>)
 8020eda:	681b      	ldr	r3, [r3, #0]
 8020edc:	4a16      	ldr	r2, [pc, #88]	@ (8020f38 <__usart1_init+0x7c>)
 8020ede:	f423 1370 	bic.w	r3, r3, #3932160	@ 0x3c0000
 8020ee2:	6013      	str	r3, [r2, #0]
  GPIOA->MODER |= 2 << (2 * TX_PIN) | 2 << (2 * RX_PIN);
 8020ee4:	4b14      	ldr	r3, [pc, #80]	@ (8020f38 <__usart1_init+0x7c>)
 8020ee6:	681b      	ldr	r3, [r3, #0]
 8020ee8:	4a13      	ldr	r2, [pc, #76]	@ (8020f38 <__usart1_init+0x7c>)
 8020eea:	f443 1320 	orr.w	r3, r3, #2621440	@ 0x280000
 8020eee:	6013      	str	r3, [r2, #0]
  // high speed
  GPIOA->OSPEEDR |= (3 << (TX_PIN * 2)) | (3 << (RX_PIN * 2));
 8020ef0:	4b11      	ldr	r3, [pc, #68]	@ (8020f38 <__usart1_init+0x7c>)
 8020ef2:	689b      	ldr	r3, [r3, #8]
 8020ef4:	4a10      	ldr	r2, [pc, #64]	@ (8020f38 <__usart1_init+0x7c>)
 8020ef6:	f443 1370 	orr.w	r3, r3, #3932160	@ 0x3c0000
 8020efa:	6093      	str	r3, [r2, #8]
  // clear the bits in AFR register
  GPIOA->AFR[1] &= ~((0xf << 4) | (0xf << 8));
 8020efc:	4b0e      	ldr	r3, [pc, #56]	@ (8020f38 <__usart1_init+0x7c>)
 8020efe:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020f00:	4a0d      	ldr	r2, [pc, #52]	@ (8020f38 <__usart1_init+0x7c>)
 8020f02:	f423 637f 	bic.w	r3, r3, #4080	@ 0xff0
 8020f06:	6253      	str	r3, [r2, #36]	@ 0x24
  // set for af7
  GPIOA->AFR[1] |= (7 << 4) | (7 << 8);
 8020f08:	4b0b      	ldr	r3, [pc, #44]	@ (8020f38 <__usart1_init+0x7c>)
 8020f0a:	6a5b      	ldr	r3, [r3, #36]	@ 0x24
 8020f0c:	4a0a      	ldr	r2, [pc, #40]	@ (8020f38 <__usart1_init+0x7c>)
 8020f0e:	f443 63ee 	orr.w	r3, r3, #1904	@ 0x770
 8020f12:	6253      	str	r3, [r2, #36]	@ 0x24

  // enable usart, reciever, transiever
  USART1->CR1 |= USART_CR1_TE | USART_CR1_RE | USART_CR1_UE;
 8020f14:	4b09      	ldr	r3, [pc, #36]	@ (8020f3c <__usart1_init+0x80>)
 8020f16:	68db      	ldr	r3, [r3, #12]
 8020f18:	4a08      	ldr	r2, [pc, #32]	@ (8020f3c <__usart1_init+0x80>)
 8020f1a:	f443 5300 	orr.w	r3, r3, #8192	@ 0x2000
 8020f1e:	f043 030c 	orr.w	r3, r3, #12
 8020f22:	60d3      	str	r3, [r2, #12]
  // set the baud rate (115200 in this case)
  USART1->BRR = 0x08B;
 8020f24:	4b05      	ldr	r3, [pc, #20]	@ (8020f3c <__usart1_init+0x80>)
 8020f26:	228b      	movs	r2, #139	@ 0x8b
 8020f28:	609a      	str	r2, [r3, #8]
}
 8020f2a:	bf00      	nop
 8020f2c:	46bd      	mov	sp, r7
 8020f2e:	bc80      	pop	{r7}
 8020f30:	4770      	bx	lr
 8020f32:	bf00      	nop
 8020f34:	40023800 	.word	0x40023800
 8020f38:	40020000 	.word	0x40020000
 8020f3c:	40011000 	.word	0x40011000

08020f40 <__usart1_print>:

void __usart1_print(const char *msg, uint32_t size) {
 8020f40:	b480      	push	{r7}
 8020f42:	b085      	sub	sp, #20
 8020f44:	af00      	add	r7, sp, #0
 8020f46:	6078      	str	r0, [r7, #4]
 8020f48:	6039      	str	r1, [r7, #0]

  // semaphore_lock(&sem_usart1);
  //enterCRITICAL();
  int i = 0;
 8020f4a:	2300      	movs	r3, #0
 8020f4c:	60fb      	str	r3, [r7, #12]
  while (i < size && msg[i] != '\0') {
 8020f4e:	e00f      	b.n	8020f70 <__usart1_print+0x30>
    while (!(USART1->SR & USART_SR_TXE))
 8020f50:	bf00      	nop
 8020f52:	4b13      	ldr	r3, [pc, #76]	@ (8020fa0 <__usart1_print+0x60>)
 8020f54:	681b      	ldr	r3, [r3, #0]
 8020f56:	f003 0380 	and.w	r3, r3, #128	@ 0x80
 8020f5a:	2b00      	cmp	r3, #0
 8020f5c:	d0f9      	beq.n	8020f52 <__usart1_print+0x12>
      ;
    USART1->DR = msg[i++];
 8020f5e:	68fb      	ldr	r3, [r7, #12]
 8020f60:	1c5a      	adds	r2, r3, #1
 8020f62:	60fa      	str	r2, [r7, #12]
 8020f64:	461a      	mov	r2, r3
 8020f66:	687b      	ldr	r3, [r7, #4]
 8020f68:	4413      	add	r3, r2
 8020f6a:	781a      	ldrb	r2, [r3, #0]
 8020f6c:	4b0c      	ldr	r3, [pc, #48]	@ (8020fa0 <__usart1_print+0x60>)
 8020f6e:	605a      	str	r2, [r3, #4]
  while (i < size && msg[i] != '\0') {
 8020f70:	68fb      	ldr	r3, [r7, #12]
 8020f72:	683a      	ldr	r2, [r7, #0]
 8020f74:	429a      	cmp	r2, r3
 8020f76:	d905      	bls.n	8020f84 <__usart1_print+0x44>
 8020f78:	68fb      	ldr	r3, [r7, #12]
 8020f7a:	687a      	ldr	r2, [r7, #4]
 8020f7c:	4413      	add	r3, r2
 8020f7e:	781b      	ldrb	r3, [r3, #0]
 8020f80:	2b00      	cmp	r3, #0
 8020f82:	d1e5      	bne.n	8020f50 <__usart1_print+0x10>
  }
  while (!(USART1->SR & USART_SR_TC)) {
 8020f84:	bf00      	nop
 8020f86:	4b06      	ldr	r3, [pc, #24]	@ (8020fa0 <__usart1_print+0x60>)
 8020f88:	681b      	ldr	r3, [r3, #0]
 8020f8a:	f003 0340 	and.w	r3, r3, #64	@ 0x40
 8020f8e:	2b00      	cmp	r3, #0
 8020f90:	d0f9      	beq.n	8020f86 <__usart1_print+0x46>
  }
  //exitCRITICAL();
  // semaphore_unlock(&sem_usart1);
}
 8020f92:	bf00      	nop
 8020f94:	bf00      	nop
 8020f96:	3714      	adds	r7, #20
 8020f98:	46bd      	mov	sp, r7
 8020f9a:	bc80      	pop	{r7}
 8020f9c:	4770      	bx	lr
 8020f9e:	bf00      	nop
 8020fa0:	40011000 	.word	0x40011000

08020fa4 <__asm__set_psp>:

.global __asm__set_psp
.type __asm__set_psp, %function 
__asm__set_psp:
    /* r0 contains the argument*/
    msr psp, r0
 8020fa4:	f380 8809 	msr	PSP, r0
    bx lr
 8020fa8:	4770      	bx	lr

08020faa <__asm__set_msp>:

.global __asm__set_msp
.type __asm__set_msp, %function
__asm__set_msp:
    /* r0 contains the argument*/
    msr msp, r0
 8020faa:	f380 8808 	msr	MSP, r0
    bx lr
 8020fae:	4770      	bx	lr

08020fb0 <Reset_Handler>:
.global Reset_Handler
.type Reset_Handler, %function


Reset_Handler:                           
    BL resetHandlerHelper
 8020fb0:	f7ff fc72 	bl	8020898 <resetHandlerHelper>
    B main
 8020fb4:	f7ff bdc4 	b.w	8020b40 <main>

08020fb8 <hang>:
hang:
    B .
 8020fb8:	e7fe      	b.n	8020fb8 <hang>

08020fba <Default_Handler>:

.section .text.Default_Handler
.global Default_Handler
.type Default_Handler, %function
Default_Handler :
    B .
 8020fba:	e7fe      	b.n	8020fba <Default_Handler>

08020fbc <NMI_Handler>:

.section .text.NMI_Handler
.global NMI_Handler
.type NMI_Handler, %function
NMI_Handler :
    B .
 8020fbc:	e7fe      	b.n	8020fbc <NMI_Handler>

08020fbe <DebugMon_Handler>:

.section .text.DebugMon_Handler
.global DebugMon_Handler
.type DebugMon_Handler, %function
DebugMon_Handler :
    B .
 8020fbe:	e7fe      	b.n	8020fbe <DebugMon_Handler>

08020fc0 <PendSV_Handler>:
.section .text.PendSV_Handler
.global PendSV_Handler
.type PendSV_Handler, %function
PendSV_Handler:
    
    cpsid i
 8020fc0:	b672      	cpsid	i

    push {lr}
 8020fc2:	b500      	push	{lr}
    bl schedular
 8020fc4:	f7ff fbd6 	bl	8020774 <schedular>
    pop {lr}
 8020fc8:	f85d eb04 	ldr.w	lr, [sp], #4

    /************************ start saving reg*********************************/
    ldr r0, =RUNNING_PROCESS
 8020fcc:	4813      	ldr	r0, [pc, #76]	@ (802101c <PendSV_Handler+0x5c>)
    ldr r1, [r0]            // r1 now contain the struct address
 8020fce:	6801      	ldr	r1, [r0, #0]
    

    stmia r1!, {r4-r11}     // r4->r11 stored in the runnging process struct
 8020fd0:	e8a1 0ff0 	stmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}

    mrs r0, psp
 8020fd4:	f3ef 8009 	mrs	r0, PSP
    str r0, [r1]
 8020fd8:	6008      	str	r0, [r1, #0]
    add r1, #4
 8020fda:	f101 0104 	add.w	r1, r1, #4
    
    mrs r0, msp
 8020fde:	f3ef 8008 	mrs	r0, MSP
    str r0, [r1]
 8020fe2:	6008      	str	r0, [r1, #0]
    add r1, #4
 8020fe4:	f101 0104 	add.w	r1, r1, #4
    
    str lr, [r1]            // important !!! store the exec_return value
 8020fe8:	f8c1 e000 	str.w	lr, [r1]
    /* now copy the struct into register => run different process */
    
    /************************ start restoring reg*********************************/
    
    // dont need to restore the caller saved register !!!
    ldr r0, =PICKED_PROCESS
 8020fec:	480c      	ldr	r0, [pc, #48]	@ (8021020 <PendSV_Handler+0x60>)
    ldr r1, [r0]
 8020fee:	6801      	ldr	r1, [r0, #0]
    ldmia r1!, {r4-r11}
 8020ff0:	e8b1 0ff0 	ldmia.w	r1!, {r4, r5, r6, r7, r8, r9, sl, fp}
   

    /* before setting psp, msp, faultmask, basepri -> mask all interrupt
    so that no interrupt can be fired in the middle of setting important regs*/

    ldr r0, [r1]
 8020ff4:	6808      	ldr	r0, [r1, #0]
    msr psp, r0
 8020ff6:	f380 8809 	msr	PSP, r0
    add r1, #4
 8020ffa:	f101 0104 	add.w	r1, r1, #4
    
    ldr r0, [r1]
 8020ffe:	6808      	ldr	r0, [r1, #0]
    msr msp, r0
 8021000:	f380 8808 	msr	MSP, r0
    add r1, #4
 8021004:	f101 0104 	add.w	r1, r1, #4
    
    ldr lr, [r1]
 8021008:	f8d1 e000 	ldr.w	lr, [r1]

    /* whatever is picked by the schedular, make it running ... picked -----> running*/
    ldr r0, =PICKED_PROCESS
 802100c:	4804      	ldr	r0, [pc, #16]	@ (8021020 <PendSV_Handler+0x60>)
    ldr r1, =RUNNING_PROCESS
 802100e:	4903      	ldr	r1, [pc, #12]	@ (802101c <PendSV_Handler+0x5c>)
    ldr r2, [r0]
 8021010:	6802      	ldr	r2, [r0, #0]
    str r2, [r1]
 8021012:	600a      	str	r2, [r1, #0]
    
    dsb
 8021014:	f3bf 8f4f 	dsb	sy

    cpsie i
 8021018:	b662      	cpsie	i

    bx lr
 802101a:	4770      	bx	lr
    ldr r0, =RUNNING_PROCESS
 802101c:	20016004 	.word	0x20016004
    ldr r0, =PICKED_PROCESS
 8021020:	20016008 	.word	0x20016008

08021024 <SysTick_Handler>:
    caller saved register it will be recovered before returning from the isr*/
    

    /*****************set the PendSV interrupt*********************/
    
    ldr r0, =0xE000ED04      // Address of ICSR register
 8021024:	4802      	ldr	r0, [pc, #8]	@ (8021030 <SysTick_Handler+0xc>)
    ldr r1, =0x10000000      // Bit 28 (PENDSVSET)
 8021026:	f04f 5180 	mov.w	r1, #268435456	@ 0x10000000
    str r1, [r0]             // Set PendSV pending
 802102a:	6001      	str	r1, [r0, #0]


    bx lr
 802102c:	4770      	bx	lr
 802102e:	0000      	.short	0x0000
    ldr r0, =0xE000ED04      // Address of ICSR register
 8021030:	e000ed04 	.word	0xe000ed04

08021034 <SVC_Handler>:
.section .text.SVC_Handler
.global SVC_Handler
.type SVC_Handler, %function
SVC_Handler:
    /* r0, r1, r2, r3 stores the arguments of systemcall */
    push {r0, r1, r2, r3}
 8021034:	b40f      	push	{r0, r1, r2, r3}

    tst lr, #4
 8021036:	f01e 0f04 	tst.w	lr, #4
    ite eq
 802103a:	bf0c      	ite	eq
    mrseq r0, msp
 802103c:	f3ef 8008 	mrseq	r0, MSP
    mrsne r0, psp
 8021040:	f3ef 8009 	mrsne	r0, PSP

    add r0, #24 /* retrieve the old pc that is stacked*/
 8021044:	f100 0018 	add.w	r0, r0, #24
    ldr r1, [r0]
 8021048:	6801      	ldr	r1, [r0, #0]
    sub r1, #2      /*move 2 bytes before to get the scv immidiate*/
 802104a:	f1a1 0102 	sub.w	r1, r1, #2
    ldrb r0, [r1]   /*r0 now contains the immidiate value*/
 802104e:	7808      	ldrb	r0, [r1, #0]

    
    ldr r2, =SYSCALL_TABLE_AD
 8021050:	4a07      	ldr	r2, [pc, #28]	@ (8021070 <SVC_Handler+0x3c>)
    ldr r1, [r2]            // r1 contains the address of syscall_table
 8021052:	6811      	ldr	r1, [r2, #0]
                            // r0 contains the immidate value
    
    mov r3, #4
 8021054:	f04f 0304 	mov.w	r3, #4
    mul r0, r3 
 8021058:	fb03 f000 	mul.w	r0, r3, r0
    add r1, r0 
 802105c:	4401      	add	r1, r0

    mov r12, r1            // store the address of service function in r12
 802105e:	468c      	mov	ip, r1
    ldr r12, [r12]
 8021060:	f8dc c000 	ldr.w	ip, [ip]

    pop {r0, r1, r2, r3}
 8021064:	bc0f      	pop	{r0, r1, r2, r3}

    push {lr}
 8021066:	b500      	push	{lr}
    blx r12
 8021068:	47e0      	blx	ip
    pop {lr}
 802106a:	f85d eb04 	ldr.w	lr, [sp], #4


    bx lr
 802106e:	4770      	bx	lr
    ldr r2, =SYSCALL_TABLE_AD
 8021070:	2001600c 	.word	0x2001600c

08021074 <BusFault_Handler>:
// r0 -> pc, r1 -> fault type, r2 -> fault in kernel / userproc
.section .text.BusFault_Handler
.global BusFault_Handler
.type BusFault_Handler, %function
BusFault_Handler:
    ldr r0, =0xfffffffd
 8021074:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0
 8021078:	4586      	cmp	lr, r0
    ittee eq 
 802107a:	bf07      	ittee	eq
    mrseq r0, psp
 802107c:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 8021080:	2200      	moveq	r2, #0
    mrsne r0, msp
 8021082:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 8021086:	2201      	movne	r2, #1

    /* find pc */
    ldr r0, [r0, #24]
 8021088:	6980      	ldr	r0, [r0, #24]
    mov r1, BusFault_Identifier
 802108a:	f04f 0100 	mov.w	r1, #0
    push {lr}
 802108e:	b500      	push	{lr}
    bl fault_handler_helper
 8021090:	f7ff fc68 	bl	8020964 <fault_handler_helper>
    pop {lr}
 8021094:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 8021098:	4770      	bx	lr

0802109a <MemManage_Handler>:
/***********************MemManage_Handler start************************/
.section .text.MemManage_Handler
.global MemManage_Handler
.type MemManage_Handler, %function
MemManage_Handler:
    ldr r0, =0xfffffffd 
 802109a:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 802109e:	4586      	cmp	lr, r0

    ittee eq 
 80210a0:	bf07      	ittee	eq
    mrseq r0, psp
 80210a2:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 80210a6:	2200      	moveq	r2, #0
    mrsne r0, msp
 80210a8:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 80210ac:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 80210ae:	6980      	ldr	r0, [r0, #24]
    mov r1, MemManage_Identifier
 80210b0:	f04f 0101 	mov.w	r1, #1
    push {lr}
 80210b4:	b500      	push	{lr}
    bl fault_handler_helper
 80210b6:	f7ff fc55 	bl	8020964 <fault_handler_helper>
    pop {lr}
 80210ba:	f85d eb04 	ldr.w	lr, [sp], #4

    bx lr
 80210be:	4770      	bx	lr

080210c0 <UsageFault_Handler>:

.section .text.UsageFault_Handler
.global UsageFault_Handler 
.type UsageFault_Handler, %function
UsageFault_Handler:
    ldr r0, =0xfffffffd 
 80210c0:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 80210c4:	4586      	cmp	lr, r0

    ittee eq 
 80210c6:	bf07      	ittee	eq
    mrseq r0, psp
 80210c8:	f3ef 8009 	mrseq	r0, PSP
    moveq r2, FAULT_IN_USERPROC// third argument to faulthandler helper
 80210cc:	2200      	moveq	r2, #0
    mrsne r0, msp
 80210ce:	f3ef 8008 	mrsne	r0, MSP
    movne r2, FAULT_IN_KERNEL // third argument to faulthandler helper
 80210d2:	2201      	movne	r2, #1
    
    /* find pc */
    ldr r0, [r0, #24]
 80210d4:	6980      	ldr	r0, [r0, #24]
    mov r1, UsageFault_Identifier
 80210d6:	f04f 0102 	mov.w	r1, #2
    push {lr}
 80210da:	b500      	push	{lr}
    bl fault_handler_helper
 80210dc:	f7ff fc42 	bl	8020964 <fault_handler_helper>
    pop {lr}
 80210e0:	f85d eb04 	ldr.w	lr, [sp], #4
    
    bx lr
 80210e4:	4770      	bx	lr
	...

080210e8 <HardFault_Handler>:
.section .text.HardFault_Handler
.global HardFault_Handler
.type HardFault_Handler, %function
HardFault_Handler:

    ldr r0, =0xfffffffd 
 80210e8:	f06f 0002 	mvn.w	r0, #2
    cmp lr, r0 
 80210ec:	4586      	cmp	lr, r0
    ite eq 
 80210ee:	bf0c      	ite	eq
    mrseq r0, psp
 80210f0:	f3ef 8009 	mrseq	r0, PSP
    mrsne r0, msp
 80210f4:	f3ef 8008 	mrsne	r0, MSP
    
    /* find pc */
    ldr r0, [r0, #24]
 80210f8:	6980      	ldr	r0, [r0, #24]
    
    /* after getting the pc, msp can be safely altered !!!*/
    ldr r1, =_estack
 80210fa:	4904      	ldr	r1, [pc, #16]	@ (802110c <HardFault_Handler+0x24>)
    msr msp, r1
 80210fc:	f381 8808 	msr	MSP, r1

    push {lr}
 8021100:	b500      	push	{lr}
    bl HardFault_Handler_helper
 8021102:	f7ff fca9 	bl	8020a58 <HardFault_Handler_helper>
    pop {lr}
 8021106:	f85d eb04 	ldr.w	lr, [sp], #4

    b .
 802110a:	e7fe      	b.n	802110a <HardFault_Handler+0x22>
    ldr r1, =_estack
 802110c:	20018000 	.word	0x20018000

Disassembly of section .usertext:

08021620 <main10-0xe9e0>:
	...

08030000 <main10>:
#include "kernel_api.h"

USER_CODE int main10 (void){
 8030000:	b580      	push	{r7, lr}
 8030002:	b082      	sub	sp, #8
 8030004:	af00      	add	r7, sp, #0
 
  int count = 10;
 8030006:	230a      	movs	r3, #10
 8030008:	607b      	str	r3, [r7, #4]
    while (count --){
 803000a:	e003      	b.n	8030014 <main10+0x14>
        user_printf ("==========hello from main10.c\n\r", 0x0);
 803000c:	2100      	movs	r1, #0
 803000e:	4806      	ldr	r0, [pc, #24]	@ (8030028 <main10+0x28>)
 8030010:	f000 f956 	bl	80302c0 <user_printf>
    while (count --){
 8030014:	687b      	ldr	r3, [r7, #4]
 8030016:	1e5a      	subs	r2, r3, #1
 8030018:	607a      	str	r2, [r7, #4]
 803001a:	2b00      	cmp	r3, #0
 803001c:	d1f6      	bne.n	803000c <main10+0xc>

    }



}
 803001e:	bf00      	nop
 8030020:	4618      	mov	r0, r3
 8030022:	3708      	adds	r7, #8
 8030024:	46bd      	mov	sp, r7
 8030026:	bd80      	pop	{r7, pc}
 8030028:	080213cc 	.word	0x080213cc

0803002c <main11>:
#include "kernel_api.h"

USER_CODE int main11 (void){
 803002c:	b580      	push	{r7, lr}
 803002e:	b082      	sub	sp, #8
 8030030:	af00      	add	r7, sp, #0
    int count = 10;   
 8030032:	230a      	movs	r3, #10
 8030034:	607b      	str	r3, [r7, #4]
    while (count --){
 8030036:	e003      	b.n	8030040 <main11+0x14>
        user_printf ("==========hello from main11.c\n\r", 0x0);
 8030038:	2100      	movs	r1, #0
 803003a:	4806      	ldr	r0, [pc, #24]	@ (8030054 <main11+0x28>)
 803003c:	f000 f940 	bl	80302c0 <user_printf>
    while (count --){
 8030040:	687b      	ldr	r3, [r7, #4]
 8030042:	1e5a      	subs	r2, r3, #1
 8030044:	607a      	str	r2, [r7, #4]
 8030046:	2b00      	cmp	r3, #0
 8030048:	d1f6      	bne.n	8030038 <main11+0xc>

    }



}
 803004a:	bf00      	nop
 803004c:	4618      	mov	r0, r3
 803004e:	3708      	adds	r7, #8
 8030050:	46bd      	mov	sp, r7
 8030052:	bd80      	pop	{r7, pc}
 8030054:	080213ec 	.word	0x080213ec

08030058 <main12>:
#include "kernel_api.h"

USER_CODE int main12 (void){
 8030058:	b580      	push	{r7, lr}
 803005a:	b082      	sub	sp, #8
 803005c:	af00      	add	r7, sp, #0
 
  int count = 10;
 803005e:	230a      	movs	r3, #10
 8030060:	607b      	str	r3, [r7, #4]
    while (count --){
 8030062:	e003      	b.n	803006c <main12+0x14>
        user_printf ("==========hello from main12.c\n\r", 0x0);
 8030064:	2100      	movs	r1, #0
 8030066:	4806      	ldr	r0, [pc, #24]	@ (8030080 <main12+0x28>)
 8030068:	f000 f92a 	bl	80302c0 <user_printf>
    while (count --){
 803006c:	687b      	ldr	r3, [r7, #4]
 803006e:	1e5a      	subs	r2, r3, #1
 8030070:	607a      	str	r2, [r7, #4]
 8030072:	2b00      	cmp	r3, #0
 8030074:	d1f6      	bne.n	8030064 <main12+0xc>

    }



}
 8030076:	bf00      	nop
 8030078:	4618      	mov	r0, r3
 803007a:	3708      	adds	r7, #8
 803007c:	46bd      	mov	sp, r7
 803007e:	bd80      	pop	{r7, pc}
 8030080:	0802140c 	.word	0x0802140c

08030084 <main13>:
#include "kernel_api.h"

USER_CODE int main13 (void){
 8030084:	b580      	push	{r7, lr}
 8030086:	b082      	sub	sp, #8
 8030088:	af00      	add	r7, sp, #0
  int count = 10;   
 803008a:	230a      	movs	r3, #10
 803008c:	607b      	str	r3, [r7, #4]
    while (count--){
 803008e:	e003      	b.n	8030098 <main13+0x14>
        user_printf ("==========hello from main13.c\n\r", 0x0);
 8030090:	2100      	movs	r1, #0
 8030092:	4806      	ldr	r0, [pc, #24]	@ (80300ac <main13+0x28>)
 8030094:	f000 f914 	bl	80302c0 <user_printf>
    while (count--){
 8030098:	687b      	ldr	r3, [r7, #4]
 803009a:	1e5a      	subs	r2, r3, #1
 803009c:	607a      	str	r2, [r7, #4]
 803009e:	2b00      	cmp	r3, #0
 80300a0:	d1f6      	bne.n	8030090 <main13+0xc>

    }



}
 80300a2:	bf00      	nop
 80300a4:	4618      	mov	r0, r3
 80300a6:	3708      	adds	r7, #8
 80300a8:	46bd      	mov	sp, r7
 80300aa:	bd80      	pop	{r7, pc}
 80300ac:	0802142c 	.word	0x0802142c

080300b0 <main14>:
#include "kernel_api.h"

USER_CODE int main14 (void){
 80300b0:	b580      	push	{r7, lr}
 80300b2:	b082      	sub	sp, #8
 80300b4:	af00      	add	r7, sp, #0
  int count = 10;   
 80300b6:	230a      	movs	r3, #10
 80300b8:	607b      	str	r3, [r7, #4]
    while (count--){
 80300ba:	e003      	b.n	80300c4 <main14+0x14>
        user_printf ("==========hello from main14.c\n\r", 0x0);
 80300bc:	2100      	movs	r1, #0
 80300be:	4806      	ldr	r0, [pc, #24]	@ (80300d8 <main14+0x28>)
 80300c0:	f000 f8fe 	bl	80302c0 <user_printf>
    while (count--){
 80300c4:	687b      	ldr	r3, [r7, #4]
 80300c6:	1e5a      	subs	r2, r3, #1
 80300c8:	607a      	str	r2, [r7, #4]
 80300ca:	2b00      	cmp	r3, #0
 80300cc:	d1f6      	bne.n	80300bc <main14+0xc>

    }



}
 80300ce:	bf00      	nop
 80300d0:	4618      	mov	r0, r3
 80300d2:	3708      	adds	r7, #8
 80300d4:	46bd      	mov	sp, r7
 80300d6:	bd80      	pop	{r7, pc}
 80300d8:	0802144c 	.word	0x0802144c

080300dc <main15>:
#include "kernel_api.h"

USER_CODE int main15 (void){
 80300dc:	b580      	push	{r7, lr}
 80300de:	b082      	sub	sp, #8
 80300e0:	af00      	add	r7, sp, #0
  int count = 10;   
 80300e2:	230a      	movs	r3, #10
 80300e4:	607b      	str	r3, [r7, #4]
    while (count--){
 80300e6:	e003      	b.n	80300f0 <main15+0x14>
        user_printf ("==========hello from main15.c\n\r", 0x0);
 80300e8:	2100      	movs	r1, #0
 80300ea:	4806      	ldr	r0, [pc, #24]	@ (8030104 <main15+0x28>)
 80300ec:	f000 f8e8 	bl	80302c0 <user_printf>
    while (count--){
 80300f0:	687b      	ldr	r3, [r7, #4]
 80300f2:	1e5a      	subs	r2, r3, #1
 80300f4:	607a      	str	r2, [r7, #4]
 80300f6:	2b00      	cmp	r3, #0
 80300f8:	d1f6      	bne.n	80300e8 <main15+0xc>

    }



}
 80300fa:	bf00      	nop
 80300fc:	4618      	mov	r0, r3
 80300fe:	3708      	adds	r7, #8
 8030100:	46bd      	mov	sp, r7
 8030102:	bd80      	pop	{r7, pc}
 8030104:	0802146c 	.word	0x0802146c

08030108 <main8>:
#include "kernel_api.h"

USER_CODE int main8 (void){
 8030108:	b580      	push	{r7, lr}
 803010a:	b082      	sub	sp, #8
 803010c:	af00      	add	r7, sp, #0
  int count = 10;   
 803010e:	230a      	movs	r3, #10
 8030110:	607b      	str	r3, [r7, #4]
    while (count--){
 8030112:	e003      	b.n	803011c <main8+0x14>
        user_printf ("==========hello from main8.c\n\r", 0x0);
 8030114:	2100      	movs	r1, #0
 8030116:	4806      	ldr	r0, [pc, #24]	@ (8030130 <main8+0x28>)
 8030118:	f000 f8d2 	bl	80302c0 <user_printf>
    while (count--){
 803011c:	687b      	ldr	r3, [r7, #4]
 803011e:	1e5a      	subs	r2, r3, #1
 8030120:	607a      	str	r2, [r7, #4]
 8030122:	2b00      	cmp	r3, #0
 8030124:	d1f6      	bne.n	8030114 <main8+0xc>

    }



}
 8030126:	bf00      	nop
 8030128:	4618      	mov	r0, r3
 803012a:	3708      	adds	r7, #8
 803012c:	46bd      	mov	sp, r7
 803012e:	bd80      	pop	{r7, pc}
 8030130:	0802148c 	.word	0x0802148c

08030134 <main2>:
#include "kernel_api.h"

USER_CODE int main2(void) {
 8030134:	b580      	push	{r7, lr}
 8030136:	b082      	sub	sp, #8
 8030138:	af00      	add	r7, sp, #0
  int count = 10;
 803013a:	230a      	movs	r3, #10
 803013c:	607b      	str	r3, [r7, #4]
  while (count --) {
 803013e:	e003      	b.n	8030148 <main2+0x14>
    user_printf("((((((((((hello from main2.c\n\r", 0x0);
 8030140:	2100      	movs	r1, #0
 8030142:	4806      	ldr	r0, [pc, #24]	@ (803015c <main2+0x28>)
 8030144:	f000 f8bc 	bl	80302c0 <user_printf>
  while (count --) {
 8030148:	687b      	ldr	r3, [r7, #4]
 803014a:	1e5a      	subs	r2, r3, #1
 803014c:	607a      	str	r2, [r7, #4]
 803014e:	2b00      	cmp	r3, #0
 8030150:	d1f6      	bne.n	8030140 <main2+0xc>
  }
//  while (1);
}
 8030152:	bf00      	nop
 8030154:	4618      	mov	r0, r3
 8030156:	3708      	adds	r7, #8
 8030158:	46bd      	mov	sp, r7
 803015a:	bd80      	pop	{r7, pc}
 803015c:	080214ac 	.word	0x080214ac

08030160 <main3>:
#include "kernel_api.h"

USER_CODE int main3 (void){
 8030160:	b580      	push	{r7, lr}
 8030162:	b082      	sub	sp, #8
 8030164:	af00      	add	r7, sp, #0
  int count = 10;
 8030166:	230a      	movs	r3, #10
 8030168:	607b      	str	r3, [r7, #4]
  // returning
  user_printf ("returning from main3 before printing anything \n\r", 0x0);
 803016a:	2100      	movs	r1, #0
 803016c:	4809      	ldr	r0, [pc, #36]	@ (8030194 <main3+0x34>)
 803016e:	f000 f8a7 	bl	80302c0 <user_printf>
  user_process_exit();
 8030172:	f000 f8a7 	bl	80302c4 <user_process_exit>

    while (count--){
 8030176:	e003      	b.n	8030180 <main3+0x20>
        user_printf (">>>>>>>>>>hello from main3.c\n\r", 0x0);
 8030178:	2100      	movs	r1, #0
 803017a:	4807      	ldr	r0, [pc, #28]	@ (8030198 <main3+0x38>)
 803017c:	f000 f8a0 	bl	80302c0 <user_printf>
    while (count--){
 8030180:	687b      	ldr	r3, [r7, #4]
 8030182:	1e5a      	subs	r2, r3, #1
 8030184:	607a      	str	r2, [r7, #4]
 8030186:	2b00      	cmp	r3, #0
 8030188:	d1f6      	bne.n	8030178 <main3+0x18>
    }
}
 803018a:	bf00      	nop
 803018c:	4618      	mov	r0, r3
 803018e:	3708      	adds	r7, #8
 8030190:	46bd      	mov	sp, r7
 8030192:	bd80      	pop	{r7, pc}
 8030194:	080214cc 	.word	0x080214cc
 8030198:	08021500 	.word	0x08021500

0803019c <main4>:
#include "kernel_api.h"
USER_CODE int main4 (void){
 803019c:	b580      	push	{r7, lr}
 803019e:	b082      	sub	sp, #8
 80301a0:	af00      	add	r7, sp, #0
    int count = 10;
 80301a2:	230a      	movs	r3, #10
 80301a4:	607b      	str	r3, [r7, #4]
    while (count--)
 80301a6:	e003      	b.n	80301b0 <main4+0x14>
    user_printf("++++++++++hello from main4.c\n\r", 0x0);
 80301a8:	2100      	movs	r1, #0
 80301aa:	4806      	ldr	r0, [pc, #24]	@ (80301c4 <main4+0x28>)
 80301ac:	f000 f888 	bl	80302c0 <user_printf>
    while (count--)
 80301b0:	687b      	ldr	r3, [r7, #4]
 80301b2:	1e5a      	subs	r2, r3, #1
 80301b4:	607a      	str	r2, [r7, #4]
 80301b6:	2b00      	cmp	r3, #0
 80301b8:	d1f6      	bne.n	80301a8 <main4+0xc>

    
}
 80301ba:	bf00      	nop
 80301bc:	4618      	mov	r0, r3
 80301be:	3708      	adds	r7, #8
 80301c0:	46bd      	mov	sp, r7
 80301c2:	bd80      	pop	{r7, pc}
 80301c4:	08021520 	.word	0x08021520

080301c8 <main5>:
#include "kernel_api.h"

USER_CODE int main5 (void){
 80301c8:	b580      	push	{r7, lr}
 80301ca:	b082      	sub	sp, #8
 80301cc:	af00      	add	r7, sp, #0
    int count = 10;   
 80301ce:	230a      	movs	r3, #10
 80301d0:	607b      	str	r3, [r7, #4]
    while (count --){
 80301d2:	e003      	b.n	80301dc <main5+0x14>
        user_printf ("==========hello from main5.c\n\r", 0x0);
 80301d4:	2100      	movs	r1, #0
 80301d6:	4806      	ldr	r0, [pc, #24]	@ (80301f0 <main5+0x28>)
 80301d8:	f000 f872 	bl	80302c0 <user_printf>
    while (count --){
 80301dc:	687b      	ldr	r3, [r7, #4]
 80301de:	1e5a      	subs	r2, r3, #1
 80301e0:	607a      	str	r2, [r7, #4]
 80301e2:	2b00      	cmp	r3, #0
 80301e4:	d1f6      	bne.n	80301d4 <main5+0xc>

    }



}
 80301e6:	bf00      	nop
 80301e8:	4618      	mov	r0, r3
 80301ea:	3708      	adds	r7, #8
 80301ec:	46bd      	mov	sp, r7
 80301ee:	bd80      	pop	{r7, pc}
 80301f0:	08021540 	.word	0x08021540

080301f4 <main6>:
#include "kernel_api.h"

USER_CODE int main6 (void){
 80301f4:	b580      	push	{r7, lr}
 80301f6:	b082      	sub	sp, #8
 80301f8:	af00      	add	r7, sp, #0
  
  int count = 10;
 80301fa:	230a      	movs	r3, #10
 80301fc:	607b      	str	r3, [r7, #4]
    while (count--){
 80301fe:	e003      	b.n	8030208 <main6+0x14>
        user_printf ("@@@@@@@@@@hello from main6.c\n\r", 0x0);
 8030200:	2100      	movs	r1, #0
 8030202:	4806      	ldr	r0, [pc, #24]	@ (803021c <main6+0x28>)
 8030204:	f000 f85c 	bl	80302c0 <user_printf>
    while (count--){
 8030208:	687b      	ldr	r3, [r7, #4]
 803020a:	1e5a      	subs	r2, r3, #1
 803020c:	607a      	str	r2, [r7, #4]
 803020e:	2b00      	cmp	r3, #0
 8030210:	d1f6      	bne.n	8030200 <main6+0xc>

    }



}
 8030212:	bf00      	nop
 8030214:	4618      	mov	r0, r3
 8030216:	3708      	adds	r7, #8
 8030218:	46bd      	mov	sp, r7
 803021a:	bd80      	pop	{r7, pc}
 803021c:	08021560 	.word	0x08021560

08030220 <main7>:
#include "kernel_api.h"

USER_CODE int main7 (void){
 8030220:	b580      	push	{r7, lr}
 8030222:	b082      	sub	sp, #8
 8030224:	af00      	add	r7, sp, #0
 
  int count = 10;
 8030226:	230a      	movs	r3, #10
 8030228:	607b      	str	r3, [r7, #4]
    while (count --){
 803022a:	e003      	b.n	8030234 <main7+0x14>
        user_printf ("@@@@@@@@@@hello from main5.c\n\r", 0x0);
 803022c:	2100      	movs	r1, #0
 803022e:	4806      	ldr	r0, [pc, #24]	@ (8030248 <main7+0x28>)
 8030230:	f000 f846 	bl	80302c0 <user_printf>
    while (count --){
 8030234:	687b      	ldr	r3, [r7, #4]
 8030236:	1e5a      	subs	r2, r3, #1
 8030238:	607a      	str	r2, [r7, #4]
 803023a:	2b00      	cmp	r3, #0
 803023c:	d1f6      	bne.n	803022c <main7+0xc>

    }



}
 803023e:	bf00      	nop
 8030240:	4618      	mov	r0, r3
 8030242:	3708      	adds	r7, #8
 8030244:	46bd      	mov	sp, r7
 8030246:	bd80      	pop	{r7, pc}
 8030248:	08021580 	.word	0x08021580

0803024c <main9>:
#include "kernel_api.h"

USER_CODE int main9 (void){
 803024c:	b580      	push	{r7, lr}
 803024e:	b082      	sub	sp, #8
 8030250:	af00      	add	r7, sp, #0
 
  int count = 10;
 8030252:	230a      	movs	r3, #10
 8030254:	607b      	str	r3, [r7, #4]
    while (count--){
 8030256:	e003      	b.n	8030260 <main9+0x14>
        user_printf ("==========hello from main9.c\n\r", 0x0);
 8030258:	2100      	movs	r1, #0
 803025a:	4806      	ldr	r0, [pc, #24]	@ (8030274 <main9+0x28>)
 803025c:	f000 f830 	bl	80302c0 <user_printf>
    while (count--){
 8030260:	687b      	ldr	r3, [r7, #4]
 8030262:	1e5a      	subs	r2, r3, #1
 8030264:	607a      	str	r2, [r7, #4]
 8030266:	2b00      	cmp	r3, #0
 8030268:	d1f6      	bne.n	8030258 <main9+0xc>

    }



}
 803026a:	bf00      	nop
 803026c:	4618      	mov	r0, r3
 803026e:	3708      	adds	r7, #8
 8030270:	46bd      	mov	sp, r7
 8030272:	bd80      	pop	{r7, pc}
 8030274:	080215a0 	.word	0x080215a0

08030278 <main1>:
#include "kernel_api.h"
#include <stdint.h>

USER_CODE int main1(void) {
 8030278:	b580      	push	{r7, lr}
 803027a:	b082      	sub	sp, #8
 803027c:	af00      	add	r7, sp, #0
  uint32_t count = 10;
 803027e:	230a      	movs	r3, #10
 8030280:	607b      	str	r3, [r7, #4]
  while (count--) {
 8030282:	e008      	b.n	8030296 <main1+0x1e>

    user_printf("hello from main1.c\n\r");
 8030284:	4807      	ldr	r0, [pc, #28]	@ (80302a4 <main1+0x2c>)
 8030286:	f000 f81b 	bl	80302c0 <user_printf>
    user_printf("hello from main1.c second time\n\r");
 803028a:	4807      	ldr	r0, [pc, #28]	@ (80302a8 <main1+0x30>)
 803028c:	f000 f818 	bl	80302c0 <user_printf>
    user_printf("hello from main1.c third time\n\r");
 8030290:	4806      	ldr	r0, [pc, #24]	@ (80302ac <main1+0x34>)
 8030292:	f000 f815 	bl	80302c0 <user_printf>
  while (count--) {
 8030296:	687b      	ldr	r3, [r7, #4]
 8030298:	1e5a      	subs	r2, r3, #1
 803029a:	607a      	str	r2, [r7, #4]
 803029c:	2b00      	cmp	r3, #0
 803029e:	d1f1      	bne.n	8030284 <main1+0xc>
  }
  // atleast one process must be there
  while (1);
 80302a0:	e7fe      	b.n	80302a0 <main1+0x28>
 80302a2:	bf00      	nop
 80302a4:	080215c0 	.word	0x080215c0
 80302a8:	080215d8 	.word	0x080215d8
 80302ac:	080215fc 	.word	0x080215fc

080302b0 <__asm__launch_main1>:
 80302b0:	f04f 0003 	mov.w	r0, #3
 80302b4:	f380 8814 	msr	CONTROL, r0
 80302b8:	f3bf 8f6f 	isb	sy
 80302bc:	f7ff ffdc 	bl	8030278 <main1>

080302c0 <user_printf>:
 80302c0:	df00      	svc	0
 80302c2:	4770      	bx	lr

080302c4 <user_process_exit>:
 80302c4:	df02      	svc	2
 80302c6:	4770      	bx	lr
