// String_indexOf_1
// X0 - First byte of string
// X6 - char to search
// LR - Return address
	.data

ptrChar:	.quad 0

	.global String_indexOf_1
	.text

String_indexOf_1:
	LDR	X2,=ptrChar	// point to ptrChar
	STR	X1,[X2]		// store X1
	MOV	X5,X0		// move X0 to X5
	STR	LR,[SP, #-16]!	// push to stack
	BL	strlength	// get strlength

	LDR	LR,[sp], #16	// pop link
	MOV	X3,#0		// set accumulator
	MOV	X0,X5		// set X0
	MOV	X4,X2		// set X4
	LDR	X1,=ptrChar	// point to ptrChar
	LDR	X1,[X1]		// point to address
	LDRB 	W1,[X1]		// point to W1
//this1 IO
loop:
	LDRB 	W2,[X0], #1	// point to byte and increment
	CMP	X2,X1		// compare
	BEQ	equal		// if equal goto equal
	CMP	X4,X3		// compare
	BEQ	end		// if equal goto end
	ADD	X3,X3,#1	// increment index
	B 	loop		// loop

equal:
	MOV	X0,X3 		// return accumulator
	RET	LR		// return

end:
	MOV	X0,#-1		// -1 if false
	RET	LR		// return

	.end
