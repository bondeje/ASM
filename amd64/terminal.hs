#include "../syscall_table.h"
.global print
.type print, %function

/*
print - prints a simple null-terminated c-str to STDOUT
rdi - char * string
rsi - length of string
*/
print:
	mov DOLLAR()SYSCALL(write), %rax	/* set instruction to BSD write() syscall */
	mov %rsi, %rdx 	/* move string length from 2nd arg reg to 3rd arg reg */
	mov %rdi, %rsi 	/* move string from 1st arg reg to 2nd arg reg */
	mov $1, %rdi	/* set 1st arg reg to STDOUT */
	syscall
	xor %rax, %rax	/* zero return */
	ret