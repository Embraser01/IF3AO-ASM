.section .init9

.set dc, 85 /* double croche */
.set c, 2*dc /* croche */
.set n, 2*c /* noire */
.set b, 2*n /* blanche */
.set r, 2*b /* ronde */

.set multiplier, 100 /* Duration multiplier*/

/*.set d4, 444
.set e4, 396
.set f4, 373
.set g4, 333
.set a4, 296
.set bb4, 280
.set c5, 249
.set d5, 222
.set s, 0xFFFF*/

.set d4, 233
.set e4, 208
.set f4, 196
.set g4, 175
.set a4, 156
.set bb4, 147
.set c5, 131
.set d5, 117

.set s, 0xFFFF

main:
	mov.b #32, &0x1A /* Buzzer */
	mov   #32, r15 /* valeur initiale de la valeur de la buzzer */

	mov   #0, r14 /* Pause counter */
	mov   #0, r13 /* Counter before next overtone (r11) */
	mov   #0, r10 /* Overtone multiplier */
	
init:
	push #0
	push #0


	push #r
	push #s

	push #r
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
	mov #0, r14 /* Reset tone */
	
	pop r12 /* Pitch */
	pop r11 /* Duration */

	cmp #0, r12
	jeq init
	

main_loop:
	add #1, r10 /* Add to the multiplier */
	add #1, r14 /* Add to the tone */
	

	cmp r14, r12
	jeq switch /* Si il est temps de changer le buzzer */

switch_return:

	/* Multiplier controller */
	cmp   #multiplier, r10	
	jne   main_loop_next /* si == alors r13++ */
	mov #0, r10
	add #1, r13

main_loop_next:

	cmp r13, r11
	jeq loop /* Si c'est la fin de la note */
	
	jmp main_loop


switch:
	xor   #32, r15 /* alterne entre #32 et #0 */
	mov.b r15, &0x19 /* transferer r15 vers le buzzer */
	mov #0, r14
	jmp switch_return
	
