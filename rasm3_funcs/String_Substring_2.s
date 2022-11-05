    .data
    ptrString:      .quad 0
    ptrStart:       .quad 0
    .global String_Substring_2
    .text
    String_Substring_2:
//String_Substring but starting at an int to end
//assume X5 holds a string and X6 holds an int
    STR X19, [SP,#-16]!     //push
    STR X20, [SP,#-16]!     //push
    STR X21, [SP,#-16]!     //push
    STR X22, [SP,#-16]!     //push
    STR X30, [SP,#-16]!     //push

    MOV X19, X5             //move input into another register
    BL String_Length

    ADD X0, X0, #1
    BL malloc               //create mem in the heap at X0
    
    LDR X20,=ptrString      //load ptr into X20
    STR X0,[X20]            //ptrString(X20) now references X0(malloc) since it's address is stored there

    LDR X21,=ptrStart       //load ptr into X21
    STR X20,[X21]           //ptrStart(X21) now references X20(ptrString -> malloc) containing X21

traverse:
    //our counter is X6 already, so we traverse until it reaches zero.
    LDRB W22,[X19],#1       //grab a byte
    SUB X6, X6, #1          //subtract the index counter
    CMP X6, #0              //compare
    B.EQ loop               //done
    B traverse              //loop
loop:
    LDRB W22,[X19], #1      //grab byte & increment
    CMP X22, #0             //compare
    B.EQ exit               //exit if null
    STRB W22, [X0], #1      //store the byte into X22 into address space of X0, our malloc
    B loop                  //loop

exit:
    LDR X0,=ptrStart
    LDR X0,[X0]
    LDR X30,[SP], #16
    LDR X22,[SP], #16
    LDR X21,[SP], #16
    LDR X20,[SP], #16
    LDR X19,[SP], #16
    RET LR
    .end
