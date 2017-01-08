.section .init9

.set dc, 237 /* double croche */
.set c, 2*dc /* croche */
.set n, 2*c /* noire */

.set multiplier, 100 /* Duration multiplier*/

.set d4, 444
.set e4, 396
.set f4, 373
.set g4, 333
.set a4, 296
.set bb4, 280
.set c5, 249
.set d5, 222
.set s, 1

main:
	mov.b #32, &0x1A /* Buzzer */
	mov   #32, r15 /* valeur initiale de la valeur de la buzzer */
	
	mov   #0, r14 /* Pause counter */
	mov   #a4, r12 /* Pitch value (default : a4) */
	mov   #0, r13 /* Counter before next overtone (r11) */
	mov   #n, r11 /* Overtone duration part 1 (default: 120) */
	mov   #0, r10 /* Overtone multiplier */
	
init:
	push #n
	push #d4
	
	push #n
	push #d4
	
	push #n
	push #f4
	
	push #n
	push #a4
	
	push #n
	push #g4
	
	push #c
	push #f4
	
	push #c
	push #e4
	
	push #n
	push #e4
	
	push #c
	push #f4
	
	push #c
	push #g4
	
	push #dc
	push #a4
	
	push #dc
	push #bb4
	
	push #c
	push #a4
	
	push #c
	push #f4
	
	push #c
	push #s
	
	push #n
	push #a4
	
	push #c
	push #bb4
	
	push #c
	push #c5
	
	push #n
	push #d5
	
	push #c
	push #bb4
	
	push #n
	push #g4
	
	push #c
	push #s
	
	push #n
	push #s
	
	push #n
	push #d4
	
	push #n
	push #d4
	
	push #n
	push #f4
	
	push #n
	push #a4
	
	push #n
	push #g4
	
	push #c
	push #f4
	
	push #c
	push #s
	
	push #n
	push #e4
	
	push #c
	push #f4
	
	push #c
	push #g4
	
	push #n
	push #a4
	
	push #c
	push #f4
	
	push #c
	push #d4
	
	push #n
	push #d4
	
	push #c
	push #e4
	
	push #c
	push #f4
	
	push #dc
	push #g4
	
	push #dc
	push #a4
	
	push #c
	push #g4
	
	push #c
	push #f4
	
	push #c
	push #e4
	
	push #n
	push #a4
	
	
loop:

	mov #0, r13 /* reset pitch counter */
	mov #0, r10 /* Reset multiplier */
	
	pop r12 /* Pitch */
	pop r11 /* Duration */
	
		
soundmaker:

	mov.b r15, &0x19 /* transferer r15 vers le buzzer */
	xor   #32, r15 /* alterne entre #32 et #0 */
	
	
	mov #0, r14 /* Reset counter */
	
	add #1, r13	
	cmp   r11, r13
	jeq   loop
	
	
miniloop:
	/* Overtone duration controller */
	
	add   #1, r10 /* Add to the multiplier */
	cmp   #multiplier, r10
	jeq   duration_part_counter /* si == alors r13++ */
	
	
	/* Miniloop */
	
	add   #1, r14
	cmp   r12, r14
	jne   miniloop
	jmp   soundmaker

duration_part_counter: /* Add 1 to the overtone duration counter (every <multiplier> times) */
	add #1, r13
	mov #0, r10
	jmp soundmaker
