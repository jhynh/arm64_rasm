    .data
    ptrCh:      .quad 0
    .global String_CharAt
    .text
    //takes in a string at X5 and an int at X6 and returns a char in X0
String_CharAt:
    STR X19, [SP,#-16]!     //push
    STR X20, [SP,#-16]!     //push
    STR X21, [SP,#-16]!     //push
    STR X22, [SP,#-16]!     //push
    STR X23, [SP,#-16]!     //push
    STR X24, [SP,#-16]!     //push
    STR X25, [SP,#-16]!     //push
    STR X26, [SP,#-16]!     //push
    STR X27, [SP,#-16]!     //push
    STR X28, [SP,#-16]!     //push
    STR X29, [SP,#-16]!     //push
    STR X30, [SP,#-16]!     //push

    ADD X6, X6, #1
    MOV X19, X5
    MOV X0, #2
    BL malloc
    LDR X25,=ptrCh
    STR X0,[X25]

traverse:
    //our counter is X6 already, so we traverse until it reaches zero.
    LDRB W22,[X19],#1       //grab a byte
    SUB X6, X6, #1          //subtract the index counter
    CMP X6, #0              //compare
    B.EQ done               //done
    B traverse              //loop

done:
    STRB W22, [X0]
    LDR X0,=ptrCh
    LDR X0,[X0]             //grab char & exit
    LDR X30,[SP], #16       //pop
    LDR X29,[SP], #16       //pop
    LDR X28,[SP], #16       //pop
    LDR X27,[SP], #16       //pop
    LDR X26,[SP], #16       //pop
    LDR X25,[SP], #16       //pop
    LDR X24,[SP], #16       //pop
    LDR X23,[SP], #16       //pop
    LDR X22,[SP], #16       //pop
    LDR X21,[SP], #16       //pop
    LDR X20,[SP], #16       //pop
    LDR X19,[SP], #16       //pop
    RET LR
    .end
