// String_lastIndexOf_3
// X0 - First byte of string
// X1 - Substring
// LR - Return address

	.data

ptrString: .quad 0
ptrSubString: .quad	0

	.global String_lastIndexOf_3
	.text

String_lastIndexOf_3:
	LDR	X3,=ptrString		// point to ptrString
	STR	X0,[X3]			// store X0
	LDR	X2,=ptrSubString	// point to ptrSubString
	STR	X1,[X2]			// store address to X1
	LDR	X0,=ptrString		// point to ptrString
	LDR	X0,[X0]			// point to X0 address
	STR	LR,[SP, #-16]!		// push to stack
	BL	strlength		// get string length

	LDR	LR,[SP],#16		// pop from stack
	STR	X2,[SP,#-16]!		// push to stack
	LDR 	X0,=ptrSubString	// point to ptrSubString
	LDR	X0,[X0]			// point to X0 address
	STR	LR,[SP,#-16]!		// push to stack
	BL 	strlength		// get string length

	LDR	LR,[SP],#16		// pop from stack
	STR	X2,[SP,#-16]!		// push to stack
	LDR	X2,[SP],#16		// pop from stack
	MOV 	X7,X2			// move X2 to X7
	LDR	X2,[SP],#16		// pop from stack
	MOV 	X4,X2			// move X2 to X4
	MOV	X5,#-1			// set X5 to -1
	MOV	X3,#0			// set X3 to 0
	MOV	X6,#0			// set X6 to 0

loop:
	LDR	X0,=ptrString		// point to ptrString
	LDR	X0,[X0]			// point to X0 address
	ADD	X0,X0,X6		// increment
	LDR	X1,=ptrSubString	// point to ptrSubString
	LDR	X1,[X1]			// point to X1 address
	LDRB 	W0,[X0]    		// point to W0
	LDRB 	W1,[X1]    		// point to W1
	CMP	X0,X1			// compare
	BEQ	equal			// if equal goto equal

continue:
	CMP	X4,X6			// compare
	BEQ	iend			// if equal goto iend

	ADD	X6,X6,#1		// increment
	B 	loop			// goto loop

equal:
	LDR	X0,=ptrString		// point to ptrString
	LDR	X0,[X0]			// point to X0 address
	ADD	X0,X0,X6		// increment
	MOV	X2,X0			// move X0 to X2
	ADD	X2,X2,#1		// increment
	LDR	X1,=ptrSubString	// point to ptrSubString
	LDR	X1,[X1]			// point to X1 address
	ADD	X1,X1,#1		// increment

loop2:
	STR 	X2,[SP,#-16]!		// push to stock
	LDRB 	W0,[X2]    		// point to W0
	LDRB 	W1,[X1]			// point to W1
 	CMP	W1,W0			// compare
	BNE	endloop			// if not equal goto endloop

	ADD	X3,X3,#1		// increment
	CMP	X7,X3			// compare
	BEQ	loop3			// if equal goto loop3

	LDR	X1,=ptrSubString	// point to ptrSubString
	LDR	X1,[X1]			// point to X1 address
	LDR	X2,[sp],#16		// pop from stack
	ADD	X2,X2,X3		// increment
	SUB	X2,X2,#1		// subtract null
	ADD	X1,X1,X3		// increment
	B 	loop			// goto loop

iend:
	CMP	X5,#-1			// compare
	BNE	ending			// if not equal goto ending

	RET	LR			// return

ending:
	MOV	X0,X5			// move X5 to X0
	RET	LR			// return

loop3:
	MOV	X5,X6		    	// move X6 to X5
	MOV	X3,#0			// set X3 to 0

	B 	continue		// goto continue

endloop:
	MOV	X3,#0			// set X3 to 0
	B 	continue		// goto continue

	.end
