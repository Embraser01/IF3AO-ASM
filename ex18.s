.section .init9

main:
	/* initialisatoin de la diode rouge */
	mov.b #2, &50
loop:
	/* eteindre */
	mov.b #0, &49

	/* allumer */
	mov.b #2, &49

	jmp loop
