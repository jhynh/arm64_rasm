#will compile all external functions into object files in rasm3_obj
#for testing
CC=as

all: String_Equals String_Length String_Equals_IgnoreCase String_Copy String_Substring_1

String_Equals: String_Equals.s
	$(CC) -g -o ../rasm3_obj/String_Equals.o String_Equals.s

String_Length: String_Length.s
	$(CC) -g -o ../rasm3_obj/String_Length.o String_Length.s

String_Equals_IgnoreCase: String_Equals_IgnoreCase.s
	$(CC) -g -o ../rasm3_obj/String_Equals_IgnoreCase.o String_Equals_IgnoreCase.s

String_Copy: String_Copy.s
	$(CC) -g -o ../rasm3_obj/String_Copy.o String_Copy.s

String_Substring_1: String_Substring_1.s
	$(CC) -g -o ../rasm3_obj/String_Substring_1.o String_Substring_1.s