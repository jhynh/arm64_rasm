    .data
    .global String_StartsWith_2
    .text
//Strings passed in X0 and X1, returns true or false in X0
String_StartsWith_2:
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

    MOV X19, X0             //move into safe register
    MOV X20, X1             //move into safe register
    MOV X0, X1              //move quaried string for string_length
    BL String_Length        //call
    MOV X21, X0             //move quaried string slize

loop:
    //our counter is length of X1, so we traverse until it reaches zero.
    LDRB W22,[X19],#1       //grab a byte (original)
    LDRB W23,[X20],#1       //grab a byte (quaried)

    CMP X22, X23            //false if unequal
    B.NE false              //branch

    SUB X21, X21, #1        //subtract the index counter
    CMP X21, #0             //compare
    B.EQ true               //done
    B loop                  //loop

false:
    MOV X0, #0
    B done
    //always returns true unless mismatch
true:
    MOV X0, #1
done:

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