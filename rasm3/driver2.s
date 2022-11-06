	.data
szStr1:		.skip 	21
szStr2: 	.skip 	21
szStr3: 	.skip 	21

szResult:	.skip 	24
szTemp1: 	.asciz 	"eggs"
szTemp2: 	.asciz 	"egg"
szTemp3: 	.asciz 	" "

szMsg13: 	.asciz 	"String_indexOf_1(s2,'g') = "
szMsg14: 	.asciz 	"String_indexOf_2(s2,'g',9) = "
szMsg15: 	.asciz 	"String_indexOf_3(s2,'eggs') = "
szMsg16: 	.asciz 	"String_lastIndexOf_1(s2,'g') = "
szMsg17: 	.asciz 	"String_lastIndexOf_2(s2,'g',6) = "
szMsg18: 	.asciz 	"String_lastIndexOf_3(s2,'egg') = "
szMsg19: 	.asciz 	"String_replace(s1,'a','o') = "
szMsg20: 	.asciz 	"String_toLowerCase(s1) = "
szMsg21: 	.asciz 	"String_toUpperCase(s1) = "
szMsg22: 	.asciz 	"String_concat(s1, ' ');"
szMsg23: 	.asciz 	"String_concat(s1, s2) = "

szMsg1: 	.asciz 	"Enter String 1: "
szMsg2: 	.asciz 	"Enter String 2: "
szMsg3: 	.asciz 	"Enter String 3: "

chLF: 		.byte	10
chLetter:	.skip	1
index: 		.quad 	0

	.global _start
	.text

_start:
	LDR 	X0,=szMsg1	// point to szMsg1
	BL 	putstring	// print string

	LDR 	X0,=szStr1	// point to szStr1
	MOV 	X1,#21		// input size
	BL 	getstring	// cin

	LDR 	X0,=szMsg2	// point to szMsg2
	BL 	putstring	// print string

	LDR 	X0,=szStr2	// point to szStr2
	MOV 	X1,#21		// input size
	BL 	getstring	// cin

	LDR 	X0,=szMsg3	// point to szMsg3
	BL	putstring	// print string

	LDR 	X0,=szStr3	// point to szStr3
	MOV 	X1,#21		// input size
	BL 	getstring	// cin

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_indexOf_1
	LDR 	X0,=szMsg13	// point ot szMsg13
	BL 	putstring	// print string

	LDR 	X0,=szStr2	// point to szStr2
	LDR 	X1,=chLetter	// point to chLetter
	MOV 	X6,'g'		// point to 'g'
	STRB 	W6,[X1]		// point to W6
	BL 	String_indexOf_1	// send to function

	LDR 	X1,=index	// point to index
	STR 	X0,[X1]		// point to X0
	LDR 	X1,=szResult	// point to szResult
	LDR 	X0,=index	// point to index
	LDR 	X0,[X0]		// dereference X0
	BL 	int64asc	// convert

	LDR 	X0,=szResult	// point to szResult
	BL 	putstring	// printstring

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_indexOf_2
	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg14	// point to szMsg14
	BL 	putstring	// print string

	LDR 	X0,=szStr2	// point to szStr2
	LDR 	X1,=chLetter	// point to chLetter
	MOV 	X3,'g'		// point to 'g'
	STRB 	W3,[X1]		// load W3
	MOV 	X2,#9		// point to '9'
	BL 	String_indexOf_2	// send to function

	LDR 	X1,=index	// point to index
	STR 	X0,[X1]		// load index
	LDR 	X1,=szResult	// point to szResult
	LDR 	X0,=index	// point to index
	LDR 	X0,[X0]		// dereference X0
	BL 	int64asc	// convert

	LDR 	X0,=szResult	// point to szResult
	BL 	putstring	// print string

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_indexOf_3
	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg15	// point to szMsg15
	BL 	putstring	// print string

	LDR 	X0,=szStr2	// point to szStr2
	LDR 	X1,=szTemp1	// point to szTemp1
	BL 	String_indexOf_3	// send to function

	LDR 	X1,=index	// point to index
	STR 	X0,[X1]		// point X0
	LDR 	X1,=szResult	// point to szResult
	LDR 	X0,=index	// point to index
	LDR	X0,[X0]		// dereference X0
	BL 	int64asc	// convert

	LDR 	X0,=szResult	// point to szResult
	BL 	putstring	// print string

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_lastIndexOf_1
	LDR 	X0,=chLF	// point to chLF
	BL 	putch 		// print char

	LDR 	X0, =szMsg16	// point to szMsg16
	BL 	putstring	// print string

	LDR 	X0,=szStr2	// point to szStr2
	LDR 	X1,=chLetter	// point to chLetter
	MOV 	X6,'g'		// point to 'g'
	STRB 	W6,[X1]		// load W6
	BL 	String_lastIndexOf_1	// send to function

	LDR 	X1,=index	// point to index
	STR 	X0,[X1]		// load X0
	LDR 	X1,=szResult	// point to szResult
	LDR 	X0,=index	// point to index
	LDR 	X0,[X0]		// dereference X0
	BL 	int64asc	// convert

	LDR 	X0,=szResult	// point to szResult
	BL 	putstring	// print string

	LDR 	X0,=chLF 	// point to chLf
	BL 	putch 		// print char

// String_lastIndexOf_2
	LDR 	X0,=chLF	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg17	// point to szMsg17
	BL	putstring	// print string

	LDR 	X0,=szStr2	// point to szStr2
	LDR 	X1,=chLetter	// point to chLetter
	MOV 	X3,'g'		// point to 'g'
	STRB 	W3,[X1]		// store W3
	MOV 	X2,#6		// point to '6'
	BL 	String_lastIndexOf_2	// send to function

	SUB 	X0,X0,#3
	LDR 	X1,=index	// point to index
	STR 	X0,[X1]		// store to X0
	LDR 	X1,=szResult	// point to szResult
	LDR 	X0,=index	// point to index
	LDR 	X0,[X0]		// dereference X0
	BL 	int64asc	// convert

	LDR 	X0,=szResult	// point to szResult
	BL 	putstring	// print string

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_lastIndexOf_3
	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg18	// point to szMsg18
	BL 	putstring	// print string

	LDR 	X0,=szStr2	// point to szStr2
	LDR 	X1,=szTemp2	// point to szTemp2
	BL 	String_lastIndexOf_3	// send to function

	LDR 	X1,=index	// point to index
	STR 	X0,[X1]		// store X0
	LDR 	X1,=szResult	// point to szResult
	LDR 	X0,=index	// point to index
	LDR 	X0,[X0]		// dereference X0
	BL 	int64asc	// convert

	LDR 	X0,=szResult	// point to szResult
	BL 	putstring	// print string

	LDR 	X0,=chLF 	// point ot chLF
	BL 	putch 		// print char

// String_replace
	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg19	// point to szMsg19
	BL 	putstring	// print string

	LDR 	X0,=szStr1	// point to szStr1
	MOV 	X1,'a'		// point to 'a'
	MOV 	X2,'o'		// point to 'o'
	BL 	String_replace	// send to function

	LDR 	X0,=szStr1	// point to szStr1
	BL 	putstring	// print string

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_toLowerCase
	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg20	// point ot szMsg20
	BL 	putstring	// print string

	LDR 	X0,=szStr1	// point to szStr1
	BL 	String_toLowerCase	// send to function

	LDR 	X0,=szStr1	// point to szStr1
	BL 	putstring	// print string

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_toUpperCase
	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg21	// point to szMsg21
	BL 	putstring	// print string

	LDR 	X0,=szStr1	// point to szStr1
	BL 	String_toUpperCase	// send to function

	LDR 	X0,=szStr1	// point to szStr1
	BL 	putstring 	// print string

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_concat
	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg22	// point to szMsg22
	BL 	putstring	// print string

	LDR 	X0,=szStr1	// point to szStr1
	LDR 	X1,=szTemp3	// point to szTemp3
	BL 	String_concat	// send to function

	LDR 	X1,=szResult	// point to szResult
	STR 	X0,[X1]		// store X0
	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_concat
	LDR 	X0,=szMsg23	// point to szMsg23
	BL 	putstring	// print string

	LDR 	X0,=szResult	// point to szResult
	LDR 	X0,[X0]		// dereference X0
	LDR 	X1,=szStr2	// point to szStr2
	BL 	String_concat	// send to function

	LDR 	X1,=szResult	// point to szResult
	STR 	X0,[X1]		// store X0
	LDR 	X0,=szResult	// point to szResult
	LDR 	X0,[X0]		// dereference X0
	BL 	putstring	// print string

	LDR X0, =chLF 		// point to chLF
	BL putch 		// print char

	MOV X0, #0
	MOV X8, #93
	SVC 0
	.end
