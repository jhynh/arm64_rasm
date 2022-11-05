//--------------------------------------------------------------------------------------------------------------------------
//an external function that counts string length, returns int
//--------------------------------------------------------------------------------------------------------------------------
        .data                                   //data seg
        
        szInput:                        .skip 21//input

        .global String_Length                   //starting label
        .text                                   //text segment

String_Length:                          //program start
        //push registers that are used except X0

        //for perserving the register, place it on the stack, then restore by popping it off and back into X1
        STR X1, [SP, #-16]!     //push X1 to stack(waste 8 bytes) --SP address adjusted then place X1 inside--
        STR X2, [SP, #-16]!     //push X2 to stack
        STR X30, [SP, #-16]!     //push X2 to stack
        
        MOV X1, #0              //count = 0

        //X0 is pointing to a null terminated string
        //count =0 (use register, need to push it)
        /*
        do{
            getByte from pointer
            compare to null
            if byte != null {
            count++
            increate pointer by 1 (X0)
            }
        } while (char != null)
        X0 = to count;*/

loop:   LDRB W2, [X0], #1       //load character and incr pointer
        
        CMP X2, #0              //compare if null bit
        B.EQ exit               //exit if null

add:    ADD X1, X1, #1          //counter add
        B loop                  //loop

exit:   MOV X0, X1               //X1 = count

       //pop(restore) any registers used (except X0)
        LDR X30, [SP], #16       //restore X2 and increment stack 16
        LDR X2, [SP], #16       //restore X2 and increment stack 16
        LDR X1, [SP], #16       //restore the stack pointer +16 address and input X1 from the top of stack
        RET                     //return using LR
        .end
