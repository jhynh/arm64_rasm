//--------------------------------------------------------------------------------------------------------------------------
//takes in a string, creates a copy of it by allocating space for it in the heap, return the starting address
//--------------------------------------------------------------------------------------------------------------------------
    .data
    ptrString:      .quad 0         //used to traverse block
    ptrStart:       .quad 0            //the starting address we will return
    
    .global String_Copy
    .text

String_Copy:
    STR X19, [SP, #-16]!		// PUSH
    STR X20, [SP, #-16]!	    // PUSH
    STR X21, [SP, #-16]!		// PUSH
    STR X22, [SP, #-16]!		// PUSH
    STR X30, [SP, #-16]!		// PUSH LR
    MOV X19, X0             //move X19 into a safer register

	MOV X0, #16 		    //create block for string
	BL malloc			    //X0 now contains address of 4-byte block requested

    LDR X22,=ptrString       //load ptr
    STR X0,[X22]             //save address of new string
    
    LDR X20,=ptrStart       //load ptr
    STR X22,[X20]            //copy address in X1, creating ptr-> ptr -> starting

    //now populate the block with string(x19)
    //traverse from X19 to first null byte
    //populating each byte as we increment both ptrString and X19 indecies
loop:
    LDRB W21, [X19], #1     //grab byte
    CMP X21, #0             //see if null
    B.EQ done               //if null done

    STRB W21, [X0], #1      //store the byte into block
    B loop                  //loop

done:
    LDR X0,=ptrStart        //load starting address
    LDR X0, [X0]             //returns the address, need to be dereferenced once more to
    LDR X30, [SP], #16			// POP print
    LDR X22, [SP], #16			// POP print
    LDR X21, [SP], #16			// POP print
    LDR X20, [SP], #16			// POP print
    LDR X19, [SP], #16			// POP print
    RET     LR
    .end
