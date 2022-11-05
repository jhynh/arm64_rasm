#creates the final driver
#alias
CC=as
#creation target
TARGET = driver
#dependencies and trigger word
all: driver.s	
	$(CC) -g -o driver.o driver.s
	ld -o $(TARGET)  /usr/lib/aarch64-linux-gnu/libc.so driver.o -dynamic-linker /lib/ld-linux-aarch64.so.1 ../rasm3_obj/String_EndsWith.o ../rasm3_obj/String_StartsWith_2.o ../rasm3_obj/String_StartsWith_1.o ../rasm3_obj/String_CharAt.o ../rasm3_obj/String_Substring_2.o ../rasm3_obj/String_Substring_1.o ../rasm3_obj/String_Copy.o ../rasm3_obj/String_Equals_IgnoreCase.o ../rasm3_obj/String_Length.o ../rasm3_obj/String_Equals.o ../obj/String_length.o ../obj/int64asc.o ../obj/ascint64.o ../obj/putch.o ../obj/putstring.o ../obj/getstring.o
functions:
	make -C ../rasm3_funcs/