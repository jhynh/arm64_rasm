//--------------------------------------------------------------------------------------------------------------------------
//search for the window from X5 to X6, and return the substring in X0. be sure to allocate a new block in heap
//--------------------------------------------------------------------------------------------------------------------------
    .data
    ptrString:      .quad 0 //ptr to traverse blocks
    ptrStart:       .quad 0 //starting address is stored
    .global String_Substring_1
    .text

String_Substring_1:
    //need stack here since malloc and ptr for starting
    STR X19, [SP, #-16]!		    // PUSH for ptr
    STR X20, [SP, #-16]!		    // PUSH for ptrStart
    STR X21, [SP, #-16]!		    // PUSH for grabbing a char
    STR X22, [SP, #-16]!		    // PUSH for counter
    STR X23, [SP, #-16]!		    // PUSH for var
    STR X30, [SP, #-16]!		    // PUSH LR
    
    MOV X23, X0
    BL String_Length
    ADD X0, X0, #1
	BL malloc			            //X0 now contains address of 4-byte block requested
    LDR X19,=ptrString              //load ptr
    STR X0,[X19]                    //save the address of new string

    LDR X20,=ptrStart               //load the pointer
    STR X19,[x20]                   //loads the address of X20 into X19, meaning ptrStart now refrences X19 which contains the address of X20

    //x1-int, x2-int, x3-string
loop:
    LDRB W21, [X23], #1             //grab a byte
    
    CMP X21, #0                     //see if null
    B.EQ done                       //done

    ADD X22, X22, #1                //increase counter
    CMP X22, X5                     //compare the current index to starting
    B.GT store                      //if it's greater than the index, continue until null byte
    B loop
store:
    STRB W21, [X0], #1              //store a byte and increment index
    B loop                          //loop
done:
    LDR X0,=ptrStart
    LDR X0,[X0]
    LDR X30, [SP], #16			    // POP print
    LDR X23, [SP], #16			    // POP print
    LDR X22, [SP], #16			    // POP print
    LDR X21, [SP], #16			    // POP print
    LDR X20, [SP], #16			    // POP print
    LDR X19, [SP], #16			    // POP print
    RET LR
    //loop through the string, only store if within the range
    .end
