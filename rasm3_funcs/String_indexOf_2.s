// String_indexOf_2
// X0 - First byte of string
// X2 - Starting index
// X3 - Char
// LR - Return address
	.data
ptrChar:	.quad		0

	.global String_indexOf_2
	.text

String_indexOf_2:
	STR	X2,[SP, #-16]!	// push to the stack
	LDR	X3,=ptrChar	// point to ptrChar
	STR	X1,[X3]		// store X1
	MOV	X5,X0		// move X0 to X5
	STR	LR,[SP, #-16]!	// push to the stack
	BL	strlength	// get string length

	LDR	LR,[SP], #16	// pop from stack
	MOV	X0,X5		// move X5 to X0
	MOV	X4,X2		// move X2 to X4
	LDR	X2,[SP], #16	// point to X2
	MOV	X6,X2		// move X2 to X6
	LDR	X1,=ptrChar	// point to ptrChar
	LDR	X1,[X1]		// point to X1 address
	LDRB 	W1,[X1]		// point to W1 address
	ADD	X0,X0,X2	// add to get bytes
//this2 IO
loop:
	LDRB W2,[X0],#1		// point to W2 and increment
	CMP	X2,X1		// compare
	BEQ	equal		// if equal goto equal

	CMP	X4,X6		// compare
	BEQ	end		// if equal goto end

	ADD	X6,X6,#1	// increment
	B 	loop		// goto loop

equal:
	MOV	X0, X6 		// move X6 to X0
	RET	LR		// return

end:
	MOV	X0, #-1		// move -1 if error
	RET	LR		// return

	.end
