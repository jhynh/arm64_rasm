#will compile all external functions into object files in rasm3_obj
#for testing
CC=as

all: String_concat String_toUpperCase String_toLowerCase String_replace String_lastIndexof_3 String_lastIndexof_2 String_lastIndexof_1 String_indexOf_3 String_indexOf_2 String_indexOf_1 String_EndsWith String_CharAt String_StartsWith_2 String_StartsWith_1 String_Equals String_Length String_Equals_IgnoreCase String_Copy String_Substring_1 String_Substring_2

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

String_Substring_2: String_Substring_2.s
	$(CC) -g -o ../rasm3_obj/String_Substring_2.o String_Substring_2.s

String_CharAt: String_CharAt.s
	$(CC) -g -o ../rasm3_obj/String_CharAt.o String_CharAt.s
#here
String_StartsWith_1: String_StartsWith_1.s
	$(CC) -g -o ../rasm3_obj/String_StartsWith_1.o String_StartsWith_1.s

String_StartsWith_2: String_StartsWith_2.s
	$(CC) -g -o ../rasm3_obj/String_StartsWith_2.o String_StartsWith_2.s

String_EndsWith: String_EndsWith.s
	$(CC) -g -o ../rasm3_obj/String_EndsWith.o String_EndsWith.s

String_indexOf_1: String_indexOf_1.s
	$(CC) -g -o ../rasm3_obj/String_indexOf_1.o String_indexOf_1.s

String_indexOf_2: String_indexOf_2.s
	$(CC) -g -o ../rasm3_obj/String_indexOf_2.o String_indexOf_2.s

String_indexOf_3: String_indexOf_3.s
	$(CC) -g -o ../rasm3_obj/String_indexOf_3.o String_indexOf_3.s

String_lastIndexof_1: String_lastIndexof_1.s
	$(CC) -g -o ../rasm3_obj/String_lastIndexof_1.o String_lastIndexof_1.s

String_lastIndexof_2: String_lastIndexof_2.s
	$(CC) -g -o ../rasm3_obj/String_lastIndexof_2.o String_lastIndexof_2.s

String_lastIndexof_3: String_lastIndexof_3.s
	$(CC) -g -o ../rasm3_obj/String_lastIndexof_3.o String_lastIndexof_3.s

String_replace: String_replace.s
	$(CC) -g -o ../rasm3_obj/String_replace.o String_replace.s

String_toLowerCase: String_toLowerCase.s
	$(CC) -g -o ../rasm3_obj/String_toLowerCase.o String_toLowerCase.s

String_toUpperCase: String_toUpperCase.s
	$(CC) -g -o ../rasm3_obj/String_toUpperCase.o String_toUpperCase.s

String_concat: String_concat.s
	$(CC) -g -o ../rasm3_obj/String_concat.o String_concat.s
