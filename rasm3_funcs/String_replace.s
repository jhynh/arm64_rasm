// String_replace
// X0 - First byte of string
// X1 - Old char
// X2 - New char
// LR - Return address

	.data

	.global String_replace
	.text

String_replace:
	STR	X0,[SP,#-16]!	// push to stack
	STR	X1,[SP,#-16]!	// push to stack
	STR	X2,[SP,#-16]!	// push to stack
	STR	LR,[SP,#-16]!	// push to stack
	BL	strlength	// get string length

	LDR	LR,[SP],#16	// pop from stack
	MOV	X6,X2		// move X2 to X6
	LDR	X2,[sp],#16	// pop from stack
	LDR	X1,[sp],#16	// pop from stack
	LDR	X0,[sp],#16	// pop from stack

loop:
	LDRB 	W4,[X0]    	// point to W4
	CMP	X4,X1		// compare
	BEQ	change		// if equal goto change

continue:
	CMP	X6,#0		// compare
	BEQ	exit		// if equal goto exit

	SUB	X6,X6,#1	// subtract
	ADD	X0,X0,#1	// increment
	B 	loop		// goto loop

change:
	STRB 	W2,[X0],#1	// store address to W2 and increment
	B 	continue	// goto continue

exit:
	RET	LR		// return

	.end
