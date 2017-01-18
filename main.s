.section .init9

.set dc, 85 /* double croche */
.set c, 2*dc /* croche */
.set n, 2*c /* noire */
.set np, 3*c /* nore pointée */
.set b, 2*n /* blanche */
.set bp, 3*n /* blanche pointée */
.set r, 2*b /* ronde */

.set multiplier, 100 /* Duration multiplier*/


/* Notes */

.set f3, 214
.set gb3, 202
.set g3, 191
.set ab3, 180
.set a3, 170
.set bb3, 161
.set b3, 152
.set c4, 143
.set db4, 135
.set d4, 127
.set eb4, 120
.set e4, 114
.set f4, 107
.set gb4, 101
.set g4, 96
.set ab4, 90
.set a4, 85
.set bb4, 80
.set b4, 80
.set c5, 72
.set db5, 68
.set d5, 64
.set eb5, 60
.set e5, 57
.set f5, 54

.set s, 0


.set sortie, 0x36 /* Buzzer : 0x1A, Casque : 0x36*/
.set sortieValue, 0x35 /* Buzzer : 0x19, Casque : 0x35*/

main:
	mov.b #32, &sortie /* Buzzer */
	mov   #32, r15 /* valeur initiale de la valeur de la buzzer */

	mov   #0, r14 /* Pause counter */
	mov   #0, r13 /* Counter before next overtone (r11) */
	mov   #0, r10 /* Overtone multiplier */
	
init:
	push #0
	push #0

	/* Ajout de la musique */
	call #final_countdown

loop:

	mov #0, r13 /* reset pitch counter */
	mov #0, r10 /* Reset multiplier */
	mov #0, r14 /* Reset tone */
	
	pop r12 /* Pitch */
	pop r11 /* Duration */

	cmp #0, r11
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
	mov.b r15, &sortieValue /* transferer r15 vers le buzzer */
	mov #0, r14
	jmp switch_return

tetris:

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
	
	push #loop
	ret


final_countdown:

	push #bp
	push #e5

	push #n
	push #d5

	push #n
	push #d5

	push #bp
	push #e5

	push #dc
	push #d5

	push #dc
	push #e5

	push #dc
	push #f5

	push #dc
	push #e5

	push #bp
	push #e5

	push #n
	push #f5

	push #n
	push #a4

	push #c
	push #b4

	push #c
	push #c5

	push #c
	push #d5

	push #c
	push #e5

	push #dc
	push #d5

	push #dc
	push #c5

	push #np
	push #d5

	push #dc
	push #c5

	push #dc
	push #b4

	push #np
	push #c5

	push #c
	push #d5

	push #c
	push #b4

	push #c
	push #c5

	push #c
	push #d5

	push #dc
	push #c5

	push #dc
	push #d5

	push #np
	push #s

	push #n
	push #a4

	push #n
	push #f5

	push #dc
	push #e5

	push #dc
	push #f5

	push #n
	push #s

	push #np
	push #d5

	push #c
	push #e5

	push #c
	push #f5

	push #dc
	push #e5

	push #dc
	push #f5

	push #np
	push #s

	push #n
	push #a4

	push #n
	push #e5

	push #dc
	push #d5

	push #dc
	push #e5

	push #np
	push #c5

	push #c
	push #d5

	push #c
	push #b4

	push #c
	push #c5

	push #c
	push #d5

	push #dc
	push #c5

	push #dc
	push #d5

	push #np
	push #s

	push #n
	push #a4

	push #n
	push #f5

	push #dc
	push #e5

	push #dc
	push #f5

	push #n
	push #s

	push #np
	push #d5

	push #c
	push #e5

	push #c
	push #f5

	push #dc
	push #e5

	push #dc
	push #f5

	push #np
	push #s

	push #n
	push #a4

	push #n
	push #e5

	push #dc
	push #d5

	push #dc
	push #e5

	push #np
	push #s

	push #r
	push #e5

	push #dc
	push #d5

	push #dc
	push #e5

	push #dc
	push #f5

	push #dc
	push #e5

	push #bp
	push #e5

	push #n
	push #f5

	push #n
	push #a4

	push #c
	push #b4

	push #c
	push #c5

	push #c
	push #d5

	push #c
	push #e5

	push #dc
	push #d5

	push #dc
	push #c5

	push #np
	push #d5

	push #dc
	push #c5

	push #dc
	push #b4

	push #np
	push #c5

	push #c
	push #d5

	push #c
	push #b4

	push #c
	push #c5

	push #c
	push #d5

	push #dc
	push #c5

	push #dc
	push #d5

	push #np
	push #s

	push #n
	push #a4

	push #n
	push #f5

	push #dc
	push #e5

	push #dc
	push #f5

	push #n
	push #s

	push #np
	push #d5

	push #c
	push #e5

	push #c
	push #f5

	push #dc
	push #e5

	push #dc
	push #f5

	push #np
	push #s

	push #n
	push #a4

	push #n
	push #e5

	push #dc
	push #d5

	push #dc
	push #e5

	push #np
	push #c5

	push #c
	push #d5

	push #c
	push #b4

	push #c
	push #c5

	push #c
	push #d5

	push #dc
	push #c5

	push #dc
	push #d5

	push #np
	push #s

	push #n
	push #a4

	push #n
	push #f5

	push #dc
	push #e5

	push #dc
	push #f5

	push #n
	push #s

	push #np
	push #d5

	push #c
	push #e5

	push #c
	push #f5

	push #dc
	push #e5

	push #dc
	push #f5

	push #np
	push #s

	push #n
	push #a4

	push #n
	push #e5

	push #dc
	push #d5

	push #dc
	push #e5

	push #np
	push #s

	push #loop
	ret
