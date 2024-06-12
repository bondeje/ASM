#include "../syscall_table.h"
.globl pexit
.type pexit, %function

.section .text
/*
process exit syscall
rdi - int - return value
*/
pexit:
	mov DOLLAR()SYSCALL(exit), %rax
	syscall
	ret 
