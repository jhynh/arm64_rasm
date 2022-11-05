// String_concat
// X0 - First byte of first string
// X1 - First byte of second string
// LR - Retun address

	.data

ptrStringA:	.quad	0
ptrStringB:   	.quad	0
ptrResult:	.quad	0

	.global String_concat
	.text

String_concat:
    LDR 	X2,=ptrStringA          // point to ptrStringA
    STR 	X0,[X2]            	// store X2 address
    LDR 	X3,=ptrStringB          // point to ptrStringB
    STR 	X1,[X3]            	// store X3 address
    STR		LR,[SP,#-16]!	    	// push to stack
    BL  	strlength           	// get string length

    LDR		LR,[SP],#16	    	// pop from stakc
    MOV 	X4,X2              	// move X2 to X4
    LDR 	X0,=ptrStringB     	// point to ptrStringB
    LDR 	X0,[X0]            	// point to X0 address
    STR		LR,[SP,#-16]!	    	// push to stack
    BL 		strlength            	// get string length

    LDR 	LR,[SP],#16	    	// pop from stack
    ADD 	X4,X4,X2          	// add lengths
    MOV 	X0,X4              	// move X4 to X0
    STR 	LR,[SP,#-16]!	    	// push to stack
    BL 		malloc               	// get malloc

    LDR 	LR,[SP],#16	    	// pop from stack

    LDR 	X1,=ptrResult      	// point to ptrResult
    STR 	X0,[X1]            	// store X1 address
    LDR 	X0,=ptrStringA          // point to ptrStringA
    LDR 	X0,[X0]            	// point to X0 address
    LDR 	X3,=ptrStringB          // point to ptrStringB
    LDR 	X3,[X3]            	// point to to X3 address
    LDR 	X1,[X1]          	// point to X1 address

next:
    LDRB 	W2,[X0],#1      	// point to W2 and increment
    CMP 	W2,#0             	// compare to 0
    BEQ 	cont         	   	// if equal goto cont

    STRB 	W2,[X1],#1      	// store W2 and increment
    B 		next                 	// goto next

cont:
    LDRB 	W2,[X3],#1     		// point to W2 and increment
    CMP 	W2,#0            	// compare to 0
    BEQ 	exit	          	// if equal goto exit

    STRB	W2,[X1],#1     		// store W2 and increment
    B 		cont                	// goto cont

exit:
    LDR 	X0,=ptrResult   	// point to ptrResult
    LDR 	X0,[X0]          	// point to X0 address
    RET 	LR      		// return

    .end
