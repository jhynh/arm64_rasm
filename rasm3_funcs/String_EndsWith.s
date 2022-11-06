.data

.global String_EndsWith
.text
//pass string in X0 and X1 and finds if the string ends with substring
String_EndsWith:
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
    MOV X0, X1              //get length of quaried string
    BL String_Length        //call
    MOV X21, X0             //store
    MOV X0, X19             //get length of original
    BL String_Length
    MOV X22, X0             //store
    SUB X23, X22, X21

traverse:
    //subtract the substring from the string and parse them from that index
    //traverse using X23
    LDRB W24, [X19], #1     //load byte and traverse
    SUB X23, X23, #1        //reduce counter
    CMP X23, #0             //compare if null
    B.EQ loop               //loop
    B traverse              //done

//now at proper pos
loop:
    LDRB W25,[X19],#1       //grab a byte (original)
    LDRB W26,[X20],#1       //grab a byte (quaried)

    CMP X25, X26            //false if unequal
    B.NE false              //branch

    SUB X21, X21, #1        //subtract the index counter
    CMP X21, #0             //compare
    B.EQ true               //done
    B loop                  //loop

false:
    MOV X0, #0              //load false
    B done                  //done
true:
    MOV X0, #1             //true
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