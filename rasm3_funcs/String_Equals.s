//--------------------------------------------------------------------------------------------------------------------------
//an external function that compares two strings in register 1 and 2
//traverse and compare both strings for same ascii valuse
//--------------------------------------------------------------------------------------------------------------------------
    .data
    .global String_Equals
    .text

//we will store the starting address and increment register 1 and 2 until we reach a null byte,
//afterwards we will restore 1 and 2 to their starting address
String_Equals:

    STR X1, [SP, #-16]!      //push starting address of both string
    STR X2, [SP, #-16]!      //push
    STR X19, [SP, #-16]!     //push
    STR X20, [SP, #-16]!     //push
loop:
    LDRB W19, [X1], #1       //load character and incr pointer
    LDRB W20, [X2], #1       //load character and incr pointer

    CMP X19, #0              //compare if null byte
    B.EQ check               //branch if equal
    CMP X20, #0              //compare if null byte
    B.EQ check               //branch if equal

    CMP X19, X20             //compare if equal
    B.EQ loop
    B false

check:
    CMP X19, #0              //compare if null byte
    B.EQ true
    CMP X20, #0              //compare if null byte
    B.EQ true                //branch if equal
    B false
false:
    MOV X0, #0
    B exit
true:
    MOV X0, #1

exit:
    LDR X20, [SP], #16       //restore
    LDR X19, [SP], #16       //restore
    LDR X2, [SP], #16        //restore starting address
    LDR X1, [SP], #16        //restore
    
    RET LR                   //return
    .end
