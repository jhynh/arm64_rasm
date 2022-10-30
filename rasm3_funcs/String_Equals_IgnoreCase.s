//--------------------------------------------------------------------------------------------------------------------------
//same as String_Equals, but a switchcase of upper and lower case
//--------------------------------------------------------------------------------------------------------------------------
    .data
    .global String_Equals_IgnoreCase
    .text

//we will store the starting address and increment register 1 and 2 until we reach a null byte,
//afterwards we will restore 1 and 2 to their starting address
String_Equals_IgnoreCase:

    STR X1, [SP, #-16]!         //push starting address of both string
    STR X2, [SP, #-16]!         //push
    STR X19, [SP, #-16]!        //push
    STR X20, [SP, #-16]!        //push
    STR X21, [SP, #-16]!        //push
loop:
    LDRB W19, [X1], #1          //load character and incr pointer
    LDRB W20, [X2], #1          //load character and incr pointer

    CMP X19, #0                 //compare if null byte
    B.EQ check                  //branch if equal
    CMP X20, #0                 //compare if null byte
    B.EQ check                  //branch if equal

//--------------------------------------------------------------------------------------------------------------------------
//difference between String_Equals and String_Equals_IgnoreCase
//--------------------------------------------------------------------------------------------------------------------------
    CMP X19, X20                //compare if equal
    B.EQ loop                   //loop
    //add/sub 32 for upper <-> lower
    CMP X19, X20                //compare if less
    B.LT less                   //branch

greater:
    ADD X21, X20, #32           //check if X20 is lowercase
    CMP X19, X21                //compare
    B.EQ loop                   //loop
    SUB X21, X19, #32           //check if x20 is uppercase
    CMP X20, X21                //compare
    B.EQ loop                   //loop
    B out                       //exit mini loop

less:
    ADD X21, X19, #32           //check if x19 is lowercase
    CMP X20, X21                //compare
    B.EQ loop                   //loop
    ADD X21, X20, #32           //check if x19 is uppercase
    CMP X19, X21                //compare
    B.EQ loop                   //loop

//--------------------------------------------------------------------------------------------------------------------------
out: 
    B false                     //branch false

check:
    CMP X19, #0                 //compare if null byte
    B.EQ true
    CMP X20, #0                 //compare if null byte
    B.EQ true                   //branch if equal
    B false
false:
    MOV X0, #0                  //move false
    B exit                      //exit
true:
    MOV X0, #1                  //move true

exit:
    LDR X21, [SP], #16          //restore
    LDR X20, [SP], #16          //restore
    LDR X19, [SP], #16          //restore
    LDR X2, [SP], #16           //restore starting address
    LDR X1, [SP], #16           //restore
    
    RET LR                      //return
    .end
