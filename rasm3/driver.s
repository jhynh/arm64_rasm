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
//----------------------------------------------------------------------------------------------------
//VARS
//----------------------------------------------------------------------------------------------------
    chLF:       .byte 10    //newline
    chQuote:    .byte 0x22  //quote
    .align 1
    sz1:    .skip 21    //var1  "Cat in the hat."
    sz2:    .skip 21    //var2  "Green eggs and ham."
    sz3:    .skip 21    //var3  "cat in the hat."
    sz4:    .skip 21    //var4  [copy]
    szInt:  .skip 21    //var for ascii ints
//----------------------------------------------------------------------------------------------------
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
    LDR X0,=szPromptB1
    BL putstring
    
    LDR X0,=szPromptB2
    BL putstring
    
    LDR X0,=sz1
    BL putstring
    
    LDR X0,=chLF
    
    BL putch
    LDR X0,=szPromptB3
    BL putstring

    LDR X0,=sz1         //load string to copy
    BL String_Copy      //branch
    LDR X0, [X0]        //dereference returned pointer to new address
    BL putstring        //print

    LDR X0,=chLF
    BL putch 

//----------------------------------------------------------------------------------------------------
//STRING_SUBSTRING_1(string, int, int) [from int to int, find it] creates a new string of substring
//----------------------------------------------------------------------------------------------------
    LDR X0,=szPromptC1
    BL putstring
    LDR X0,=chQuote
    BL putch
    LDR X0,=sz3
    MOV X5, #4
    MOV X6, #14
    BL String_Substring_1
    LDR X0,[X0]
    BL putstring
    LDR X0,=chQuote
    BL putch
    LDR X0,=chLF
    BL putch

//----------------------------------------------------------------------------------------------------
//STRING_SUBSTRING_2(string, "Cat") return bool
//----------------------------------------------------------------------------------------------------

    MOV X0, #0
    MOV X8, #93
    SVC 0
    .end
