// String_lastIndexOf_2
// X0 - First byte of string
// X2 - Starting index
// X3 - Char
// LR - Return address

		.data

ptrChar:	.quad		0

	.global String_lastIndexOf_2
	.text

String_lastIndexOf_2:
	STR	X2,[SP,#-16]!	// push to stack
	LDR	X3,=ptrChar	// point to ptrChar
	STR	X1,[X3]		// store address to X1
	MOV	X5,X0		// move X0 to X5
	STR	LR,[SP,#-16]!	// push to stack
	BL	strlength	// get string length

	LDR	LR,[SP],#16	// pop to string
	MOV	X0,X5		// move X5 to X0
	MOV	X4,X2		// move X2 to X4
	LDR	X2,[SP],#16	// pop X2
	MOV	X6,#0		// set X6 to 0
	LDR	X1,=ptrChar	// point to ptrChar
	LDR	X1,[X1]		// point to X1 address
	LDRB 	W1,[X1]		// point to W1
	MOV 	X5,#0		// set X5 to 0
	ADD	X0,X0,X2	// increment
	MOV 	X8,X2           // move X2 to X8
//this LIO2
loop:
	LDRB 	W2,[X0],#1	// point to W2 an increment
	CMP	X2,X1		// compare
	BEQ	equal		// if equal goto equal

cont:
	CMP	X8,X6		// compare
	BEQ	iend		// if equal goto iend
	ADD	X6,X6,#1	// increment
	B 	loop		// goto loop

equal:
	MOV	X5,X6 		// move X6 to X5
	B 	cont		// goto cont

iend:
	CMP 	X5,#0		// compare
	BNE	end		// if not equal goto end
	MOV	X0,#-1		// set X0 to -1
	RET	LR		// return

end:
	MOV	X0,X5		// move X5 to X0
	RET	LR		// return

	.end
