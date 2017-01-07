.section .init9

.set dc, 80 /* double croche */
.set c, 2*dc /* croche */
.set n, 2*c /* noire */

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
	mov   #0, r13 /* Pitch counter */
	mov   #528, r12 /* Pitch value */
	mov   #120, r11 /* Time value */
	mov   #2, r10 /* Index value */
	
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
	
	pop r12
	pop r11
	
	
	
		
soundmaker:

	mov.b r15, &0x19 /* transferer r15 vers le buzzer */
	xor   #32, r15 /* alterne entre #32 et #0 */
	
	
	mov #0, r14 /* Reset counter */
	
	add #1, r13	
	cmp   r11, r13
	jeq   loop
	
	
miniloop:
	add   #1, r14
	cmp   r12, r14
	jne   miniloop
	jmp   soundmaker
