.section .init9

main:
	mov.b #2, &50 /* initialisation de la diode rouge */
	mov   #2, r15 /* valeur initiale de la valeur de la diode */
loop:
	mov.b r15, &49 /* transferer r15 vers la diode */
	xor   #2, r15 /* alterne entre #2 et #0 */
	jmp loop
