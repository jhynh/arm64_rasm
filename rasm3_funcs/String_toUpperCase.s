// String_toUpperCase
// X0 - First byte of string
// LR - Return address

	.data

	.global String_toUpperCase
	.text

String_toUpperCase:
	MOV	X5,X0		// move X0 to X5
	STR	LR,[SP,#-16]!	// push to stack
	BL	strlength	// get string length

	LDR	LR,[SP],#16	// pop from stack
	MOV	X6,X2		// move X2 to X6
	MOV	X0,X5		// move X5 to X0

loop:
	LDRB	W2,[X0] 	// point to W2
	CMP	W2,#0x61	// compare to 'Z'
	BGE	change		// if greater than goto change

	ADD	X0,X0,#1	// increment

compare:
	CMP	X6,#0		// compare to 0
	BEQ	exit		// if equal goto exit

	SUB	X6,X6,#1	// subtract
	B	loop		// goto loop

change:
	CMP	W2,#0x7a	// compare to 'A'
	BLE	convert		// if less than goto convert
	ADD	X0,X0,#1	// increment by 1
	B	compare		// goto compare

convert:
	SUB	X2,X2,#0x20	// add to convert to ASCII
	STRB	W2,[X0],#1    	// store W2 and increment
	B 	compare		// goto compare

exit:
	MOV	X0,X5		// move X5 to X0
	RET	LR		// return

	.end
