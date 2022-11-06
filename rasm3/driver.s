//***************************************************************************** 
//Names: Homayoun Nistanaki, Jason Huynh
//Program:  RASM3.s 
//Class: CS 3B 
//Lab:  RASM3 
//Date: November 5, 2022 at 11:00 PM 
//Purpose: 
// practice creating external functions along side memory manipulation by creating
// functions instructed by Jeff Barnett
//******************************************************************************/
    .data               //data seg
//----------------------------------------------------------------------------------------------------
//PROMPTS
//----------------------------------------------------------------------------------------------------
//1. returns length
    szPrompt1:          .asciz "sz1.length()= "
    szPrompt2:          .asciz "sz2.length()= "
    szPrompt3:          .asciz "sz3.length()= "

//2-4. checks if they're equal, bool, and ignore case ignores upper/lower case
    szPromptA1:         .asciz "String_equals(s1, s3) = "
    szPromptA2:         .asciz "String_equals(s1, s1) = "
    szPromptA3:         .asciz "String_equalsIgnoreCase(s1, s3) = "
    szPromptA4:         .asciz "String_equalsIgnoreCase(s1, s2) = "

//6. copies s1 into s4
    szPromptB1:         .asciz "s4 = String_copy(s1)\n"                 
    szPromptB2:         .asciz "s1 = "
    szPromptB3:         .asciz "s4 = "

//7-8. finds s3 from index 4 to 14 and find substring from int to end
    szPromptC1:         .asciz "String_substring_1(s3,4,14) = "
    szPromptC2:         .asciz "String_substring_2(s3, 7) = "

//9. returns character at index
    szPromptD:          .asciz "String_charAt(s2, 4) = "

//10-11. takes string, finds substring in string from position int or if string begins with the string
    szPromptE1:         .asciz "String_startsWith_1(s1, 11, \"hat.\") = "
    szPromptE2:         .asciz "String_startsWith_2(s1, \"Cat\") = "

//12. if string ends with the string
    szPromptF:          .asciz "String_endsWith(s1, \"in the hat.\") = "

//13-15. returns index of character,starting at int, and returns index of occuring substring
    szPromptG:          .asciz "String_indexOf_1(s2,\'g\') = "
    szPromptG1:         .asciz "String_indexOf_2(s2,\'g\', 9) = "
    szPromptG2:         .asciz "String_indexOf_3(s2,\"eggs\") = "

//16-18. return last occurance of char,starting at int, and returns last occurance of string
    szPromptH:          .asciz "String_lastIndexOf_1(s2, \'g\') = "
    szPromptH1:         .asciz "String_lastIndexOf_2(s2,\'g\', 6) = "
    szPromptH2:         .asciz "String_lastIndexOf_3(s2,\"egg\") = "

//19. replaces the chars in a strng with another char
    szPromptI:          .asciz "String_replace(s1, \'a\',\'o\') = "

//20. to lowercase
    szPromptJ:          .asciz "String_toLowerCase(s1) = "

//21. to uppercase
    szPromptK:          .asciz "String_toUpperCase(s1) = "

//22. concatenate
    szPromptL1:         .asciz "String_concat(s1, \" \");\n"
    szPromptL2:         .asciz "String_concat(s1, s2) = "

//bools
    szTrue:             .asciz "TRUE"
    szFalse:            .asciz "FALSE"

//user input prompts
    szInput1:           .asciz "Enter sz1: "
    szInput2:           .asciz "Enter sz2: "
    szInput3:           .asciz "Enter sz3: "

//user input
    szUInput:           .asciz "hat."
    szUInput2:          .asciz "Cat"
    szUInput3:          .asciz "in the hat."

//pointers
    qdPtr1:             .quad 0
    qdPtr2:             .quad 0
    qdPtr3:             .quad 0
    qdPtr4:             .quad 0
//----------------------------------------------------------------------------------------------------
//VARS
//----------------------------------------------------------------------------------------------------
    chLF:       .byte 10    //newline
    chQuote:    .byte 0x22  //quote
    chSQuote:   .byte 0x27  //single
    sz1:    .skip 21    //var1  "Cat in the hat."
    sz2:    .skip 21    //var2  "Green eggs and ham."
    sz3:    .skip 21    //var3  "cat in the hat."
    sz4:    .skip 21    //var4  [copy]
    szInt:  .skip 21    //var for ascii ints
    dstPtr: .quad 0
//----------------------------------------------------------------------------------------------------
//****************************************************************************************************
//****************************************************************************************************
//****************************************************************************************************
//****************************************************************************************************
    szStr1:		.skip 	21
    szStr2: 	.skip 	21
    szStr3: 	.skip 	21
    .align 4
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

//    chLF: 		.byte	10
    chLetter:	.skip	1
    index: 		.quad 	0
//****************************************************************************************************
//****************************************************************************************************
//****************************************************************************************************
//****************************************************************************************************
    .global _start          //start label
    .text                   //text seg
_start:                     //program start
//----------------------------------------------------------------------------------------------------
//LENGTH()
//----------------------------------------------------------------------------------------------------

    LDR X0,=szInput1    //load
    BL putstring        //print

    LDR X0,=sz1         //load
    MOV X1, 21          //allocate
    BL getstring        //cin

    LDR X0,=szInput2    //load
    BL putstring        //print

    LDR X0,=sz2         //load
    MOV X1, 21          //allocate
    BL getstring        //cin

    LDR X0,=szInput3    //load
    BL putstring        //print

    LDR X0,=sz3         //load
    MOV X1, 21          //allocate
    BL getstring        //cin
//*****************SZ1***********************
//convert
    LDR X0,=sz1         //load
    BL String_Length    //convert/store into szString
    LDR X1,=szInt       //load
    BL int64asc         //convert/store into szInt
//print
    LDR X0,=szPrompt1   //load
    BL putstring        //print
    LDR X0,=szInt       //load
    BL putstring        //print
    LDR X0,=chLF        //load
    BL putch            //print
//*****************SZ2***********************
//convert
    LDR X0,=sz2         //load
    BL String_Length    //convert/store into szString
    LDR X1,=szInt       //load
    BL int64asc         //convert/store into szInt
//print
    LDR X0,=szPrompt2   //load
    BL putstring        //print
    LDR X0,=szInt       //load
    BL putstring        //print
    LDR X0,=chLF        //load
    BL putch            //print
//*****************SZ3***********************
//convert
    LDR X0,=sz3         //load
    BL String_Length    //convert/store into szString
    LDR X1,=szInt       //load
    BL int64asc         //convert/store into szInt
//print
    LDR X0,=szPrompt3   //load
    BL putstring        //print
    LDR X0,=szInt       //load
    BL putstring        //print
    LDR X0,=chLF        //load
    BL putch            //print
//----------------------------------------------------------------------------------------------------
//STRING_EQUALS(string, string)
//----------------------------------------------------------------------------------------------------
LDR X4,=szPromptA1      //load first prompt
MOV X3, #1              //flag for case
//case: (s1, s3)
    LDR X1,=sz1         //load
    LDR X2,=sz3         //load
    B equals            //branch
//case: (s1, s1)
case2:
    MOV X3, #0          //flag for case
    LDR X4,=szPromptA2  //load second prompt

    LDR X1,=sz1         //load
    LDR X2,=sz1         //load
    
equals:
    BL String_Equals    //call func
    
    CMP X0, #0          //if false
    B.NE true           //branch true

    LDR X5,=szFalse     //load bool
    B endif             //end

true:
    LDR X5,=szTrue      //load bool
endif:
    MOV X0,X4           //load prompt
    BL putstring        //print
    MOV X0,X5           //load bool
    BL putstring        //print

    LDR X0,=chLF        //load line feed
    BL putch            //print
    CMP X3, #1          //case 2
    B.EQ case2          //branch
//----------------------------------------------------------------------------------------------------
//STRING_EQUALS_IGNORECASE(string, string)
//----------------------------------------------------------------------------------------------------
    LDR X4,=szPromptA3              //load prompt
    MOV X3, #1                      //load flag
casea1:
    LDR X1,=sz1                     //load
    LDR X2,=sz3                     //load
    B equal_ignorecase              //branch
casea2:
    MOV X3, #0                      //set the flag
    LDR X4,=szPromptA4              //load prompt
    LDR X1,=sz1                     //load
    LDR X2,=sz2                     //load
equal_ignorecase:
    BL String_Equals_IgnoreCase     //branch link external func
    CMP X0, #0                      //compare bool
    B.NE true1                      //branch
false1:
    LDR X5,=szFalse                 //load bool
    B print                         //print
true1:
    LDR X5,=szTrue                  //load bool
print:
    MOV X0, X4                      //load prompt
    BL putstring                    //print
    MOV X0, X5                      //load bool
    BL putstring                    //print

    LDR X0,=chLF                    //load newline
    BL putstring                    //print
    CMP X3, #1                      //compare flag
    B.EQ casea2                     //branch

//----------------------------------------------------------------------------------------------------
//STRING_COPY(string)
//----------------------------------------------------------------------------------------------------
//allocates dynamically the storage to hold to copy of new character. will be using malloc. Double word. copies the character and returns the address of the newly creating string
    LDR X0,=szPromptB1              //load
    BL putstring                    //print
    
    LDR X0,=szPromptB2              //load
    BL putstring                    //print
    
    LDR X0,=sz1                     //load
    BL putstring                    //print
    
    LDR X0,=chLF                    //load
    BL putch                        //print
    
    LDR X0,=szPromptB3              //load
    BL putstring                    //print

    LDR X0,=sz1                     //load string to copy
    BL String_Copy                  //branch link
    LDR X19,=qdPtr1                 //load var
    STR X0, [X19]                   //store
    LDR X0,=qdPtr1                  //load
    LDR X0, [X0]                    //dereference returned pointer to new address
    LDR X0, [X0]                    //dereference
    BL putstring                    //print
    LDR X0,=qdPtr1                  //load
    LDR X0,[X0]                     //dereference
    LDR X0,[X0]                     //dereference
    BL free                         //free

    LDR X0,=chLF                    //load
    BL putch                        //print

//----------------------------------------------------------------------------------------------------
//STRING_SUBSTRING_1(string, int, int) [from int to int, find it] creates a new string of substring
//----------------------------------------------------------------------------------------------------
    LDR X0,=szPromptC1              //load
    BL putstring                    //print

    LDR X0,=chQuote                 //load
    BL putch                        //print
    
    LDR X0,=sz3                     //load
    MOV X5, #4                      //move first int
    MOV X6, #14                     //move second int
    BL String_Substring_1           //branch link

    LDR X19,=qdPtr2                 //load
    STR X0, [X19]                   //dereference
    LDR X0,=qdPtr2                  //load
    LDR X0, [X0]                    //dereference returned pointer to new address
    LDR X0, [X0]                    //dereference
    BL putstring                    //print
    LDR X0,=qdPtr2                  //load
    LDR X0,[X0]                     //dereference
    LDR X0,[X0]                     //dereference
    BL free                         //load

    LDR X0,=chQuote                 //load
    BL putch                        //print
    
    LDR X0,=chLF                    //load
    BL putch                        //print

//----------------------------------------------------------------------------------------------------
//STRING_SUBSTRING_2(string, "Cat") return bool
//----------------------------------------------------------------------------------------------------
    LDR X5,=sz3                     //pass string
    MOV X6, #7                      //pass index
    LDR X0,=szPromptC2              //load prompt
    BL putstring                    //print
    LDR X0,=chQuote                 //load quote
    BL putch                        //print
    LDR X0,=sz3                     //for string_length
    BL String_Substring_2           //call external func

    LDR X19,=qdPtr3                 //load
    STR X0, [X19]                   //dereference
    LDR X0,=qdPtr3                  //load
    LDR X0, [X0]                    //dereference returned pointer to new address
    LDR X0, [X0]                    //dereference
    BL putstring                    //print
    LDR X0,=qdPtr3                  //load
    LDR X0,[X0]                     //dereference
    LDR X0,[X0]                     //dereference
    BL free                         //free


    LDR X0,=chQuote                 //load quote
    BL putch                        //print

    LDR X0,=chLF                    //load
    BL putch                        //print

//----------------------------------------------------------------------------------------------------
//String_CharAt(String, Int)
//----------------------------------------------------------------------------------------------------
    LDR X0,=szPromptD               //load
    BL putstring                    //print
    LDR X0,=chSQuote                 //load
    BL putch                        //print
    LDR X5,=sz2                     //load
    MOV X6, #4                      //load
    BL String_CharAt                //branch

    LDR X19,=qdPtr4                 //load
    STR X0, [X19]                   //store and dereference ptr
    LDR X0,=qdPtr4                  //load
    LDR X0, [X0]                    //dereference returned pointer to new address
    BL putch                        //print
    LDR X0,=qdPtr4                  //load
    LDR X0,[X0]                     //dereference
    BL free                         //free

    LDR X0,=chSQuote                 //load
    BL putch                        //print
    LDR X0,=chLF                    //load
    BL putch                        //print
//----------------------------------------------------------------------------------------------------
//String_StartsWith_1(String, int, String)
//----------------------------------------------------------------------------------------------------
    LDR X0,=szPromptE1              //load
    BL putstring                    //print
    LDR X0,=sz1                     //load
    LDR X1,=szUInput                //load
    MOV X2, #11                     //load
    BL String_StartsWith_1          //branch
    CMP X0, #1                      //compare
    B.NE false2                     //branch false
    LDR X0,=szTrue                  //load true
    B endif2                        //end
false2:
    LDR X0,=szFalse                 //load false
endif2:
    BL putstring                    //print result
    LDR X0,=chLF                    //load
    BL putch                        //print


//----------------------------------------------------------------------------------------------------
//String_StartsWith_2(String, String)
//----------------------------------------------------------------------------------------------------
    LDR X0,=szPromptE2              //load
    BL putstring                    //print
    LDR X0,=sz1                     //load
    LDR X1,=szUInput2               //load
    BL String_StartsWith_2          //branch link
    CMP X0, #1                      //compare result
    B.NE false3                     //branch false
    LDR X0,=szTrue                  //load true
    B endif3                        //endif
false3:
    LDR X0,=szFalse                 //load false
endif3:
    BL putstring                    //print
    LDR X0,=chLF                    //load newline
    BL putch                        //print
//----------------------------------------------------------------------------------------------------
//String_EndsWith(String, String)
//----------------------------------------------------------------------------------------------------
    LDR X0,=szPromptF               //load prompt
    BL putstring                    //print
    LDR X0,=sz1                     //load
    LDR X1,=szUInput3               //load
    BL String_EndsWith              //branch
    CMP X0, #1                      //compare result
    B.NE false4                     //branch false
    LDR X0,=szTrue                  //load true
    B endif4                        //end
false4:
    LDR X0,=szFalse                 //load false
endif4:
    BL putstring                    //print
    LDR X0,=chLF                    //load newline
    BL putch                        //print

//----------------------------------------------------------------------------------------------------
//String_indexOf_1(String, char)
//----------------------------------------------------------------------------------------------------

	LDR 	X0, =szMsg16	// point to szMsg16
	BL 	putstring	// print string

	LDR 	X0,=sz2	// point to szStr2
	LDR 	X1,=chLetter	// point to chLetter
	MOV 	X6,'g'		// point to 'g'
	STRB 	W6,[X1]		// load W6
	BL 	String_lastIndexOf_1	// send to function

	LDR 	X1,=index	// point to index
	STR 	X0,[X1]		// load X0
	LDR 	X1,=szResult	// point to szResult
	LDR 	X0,=index	// point to index
	LDR 	X0,[X0]		// dereference X0
    SUB     X0, X0, #1
	BL 	int64asc	// convert

	LDR 	X0,=szResult	// point to szResult
	BL 	putstring	// print string

//----------------------------------------------------------------------------------------------------
//String_indexOf_2(String, char, int)
//----------------------------------------------------------------------------------------------------

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg14	// point to szMsg14
	BL 	putstring	// print string

	LDR 	X0,=sz2	// point to szStr2
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

//----------------------------------------------------------------------------------------------------
//String_indexOf_3(String, String)
//----------------------------------------------------------------------------------------------------

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

	LDR 	X0,=szMsg15	// point to szMsg15
	BL 	putstring	// print string

	LDR 	X0,=sz2	// point to szStr2
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

//----------------------------------------------------------------------------------------------------
//String_lastIndexof_1(String, char)
//----------------------------------------------------------------------------------------------------

	LDR 	X0,=chLF	// point to chLF
	BL 	putch 		// print char

	LDR 	X0, =szMsg16	// point to szMsg16
	BL 	putstring	// print string

	LDR 	X0,=sz2	// point to szStr2
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

//----------------------------------------------------------------------------------------------------
//String_lastIndexof_2(String, char, int)
//----------------------------------------------------------------------------------------------------
	LDR 	X0,=szMsg17	// point to szMsg17
	BL	putstring	// print string

	LDR 	X0,=sz2	// point to szStr2
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

//----------------------------------------------------------------------------------------------------
//String_lastIndexof_3(String, String)
//----------------------------------------------------------------------------------------------------
	LDR 	X0,=szMsg18	// point to szMsg18
	BL 	putstring	// print string

	LDR 	X0,=sz2	// point to szStr2
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

//----------------------------------------------------------------------------------------------------
//String_replace(String, char, char)
//----------------------------------------------------------------------------------------------------

	LDR 	X0,=szMsg19	// point to szMsg19
	BL 	putstring	// print string
    LDR     X0,=chQuote // load quote
    BL      putch   // print char

	LDR 	X0,=sz1	// point to szStr1
	MOV 	X1,'a'		// point to 'a'
	MOV 	X2,'o'		// point to 'o'
	BL 	String_replace	// send to function

	LDR 	X0,=sz1	// point to szStr1
	BL 	putstring	// print string

    LDR     X0,=chQuote // load quote
    BL      putch   // print char

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

//----------------------------------------------------------------------------------------------------
//String_toLowerCase(String)
//----------------------------------------------------------------------------------------------------

	LDR 	X0,=szMsg20	// point ot szMsg20
	BL 	putstring	// print string

    LDR X0,=chQuote //load
    BL putch        //print

	LDR 	X0,=sz1	// point to szStr1
	BL 	String_toLowerCase	// send to function

	LDR 	X0,=sz1	// point to szStr1
	BL 	putstring	// print string

    LDR X0,=chQuote //load
    BL putch        //print

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

//----------------------------------------------------------------------------------------------------
//String_toUpperCase(String)
//----------------------------------------------------------------------------------------------------

	LDR 	X0,=szMsg21	// point to szMsg21
	BL 	putstring	// print string

    LDR X0,=chQuote //load
    BL putch        //print

	LDR 	X0,=sz1	// point to szStr1
	BL 	String_toUpperCase	// send to function

	LDR 	X0,=sz1	// point to szStr1
	BL 	putstring 	// print string

    LDR X0,=chQuote //load
    BL putch        //print

	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

//----------------------------------------------------------------------------------------------------
//String_concat(String, String)
//----------------------------------------------------------------------------------------------------
	LDR 	X0,=szMsg22	// point to szMsg22
	BL 	putstring	// print string

	LDR 	X0,=sz1	// point to szStr1
	LDR 	X1,=szTemp3	// point to szTemp3
	BL 	String_concat	// send to function

	LDR 	X1,=szResult	// point to szResult
	STR 	X0,[X1]		// store X0
	LDR 	X0,=chLF 	// point to chLF
	BL 	putch 		// print char

// String_concat
	LDR 	X0,=szMsg23	// point to szMsg23
	BL 	putstring	// print string

    LDR X0,=chQuote //load
    BL putch        //print

	LDR 	X0,=szResult	// point to szResult
	LDR 	X0,[X0]		// dereference X0
	LDR 	X1,=sz2	// point to szStr2
	BL 	String_concat	// send to function

	LDR 	X1,=szResult	// point to szResult
	STR 	X0,[X1]		// store X0
	LDR 	X0,=szResult	// point to szResult
	LDR 	X0,[X0]		// dereference X0
	BL 	putstring	// print string

    LDR X0,=chQuote //load
    BL putch        //print

	LDR X0, =chLF 		// point to chLF
	BL putch 		// print char


    MOV X0, #0				    	//use 0 return code
    MOV X8, #93					    //service code 93 terminate
    SVC 0				    		//call linux to terminate
    .end
