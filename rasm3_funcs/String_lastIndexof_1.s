// String_lastIndexOf_1
// X0 - First byte of string
// X1 - Substring
// X3 - Char
// LR - Return address

	.data

ptrChar:		.quad		0

	.global String_lastIndexOf_1
	.text

String_lastIndexOf_1:
	LDR	X2,=ptrChar	// point to ptrChar
	STR	X1,[X2]		// store to X1
	MOV	X5,X0		// move X0 to X5
	STR	LR,[SP,#-16]!	// push to stack
	BL	strlength	// get string length

	LDR	LR,[SP],#16	// pop from string
	MOV	X6,#0		// set X6
	MOV	X0,X5		// set X0
	MOV	X4,X2		// set X4
	LDR	X1,=ptrChar	// point to ptrChar
	LDR	X1,[X1]		// point to X1 address
	LDRB 	W1,[X1]		// point to W1
	MOV	X5,#0		// set X5

loop:
	LDRB 	W2,[X0],#1	// point to W2 and increment
	CMP	X2,X1		// compare value
	BEQ	equal		// if equal goto equal

cont:
	CMP	X4,X6		// compare
	BEQ	iend		// if equal goto iend
	ADD	X6,X6,#1	// increment
	B 	loop		// goto loop

equal:
	MOV	X5,X6 		// move X6 to X5
	B 	cont		// goto continue

iend:
	CMP	X5,#0		// compare to 0
	BNE	end		// if not equal goto end

	MOV	X0,#-1		// move -1 error
	RET	LR		// return

end:
	MOV	X0,X5		// move X5 to X0
	RET	LR		// return

	.end
