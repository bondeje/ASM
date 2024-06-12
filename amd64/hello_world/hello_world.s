/*
assemble & link: clang asmlib.s hello_world.s -o hello_world

This largely follows: stackoverflow.com/questions/27594297/how-to-print-a-string-to-the-terminal-in-x86-64-assembly-nasm-without-syscall
Explanation of repnz scasb: stackoverflow.com/questions/26783797/repnz-scas-assembly-instruction-specifics

*/


.global main

.section	.text

main:

	/* calculate the length of the string */
	#lea message(%rip), %rdi	/* move string from .rodata to string destination register */
	#xor %rcx, %rcx	/* zero count register rcx which will receive the string length */
	#not %rcx		/* set rcx to all 1 bits (maximum count) or -1 in signed 2s complement */
	#xor %al, %al	/* set al to 0 */
	#cld				/* set direction flag to 0, this causes repnz scasb to increment rdi */
	#repnz	scasb	/* checks rdi byte against al. if they do not match (al - *rdi != 0), 
	#				ZF is set to 0, rdi is incremented and rcx is decremented, repeats*/
	#not %rcx		/* flip all bits in rcx. in signed 2s complement this is -length - 1 -> length (from ~x + 1 = -x).
	#				logic works as well for unsigned */
	#dec %rcx		/* rcx--. rcx is not string length */
	#mov %rcx, %rax
	#
	#mov $4, %rax	/* set instruction to BSD write() syscall */
	#lea message(%rip), %rsi	/* move string from .rodata to source index 
	#						(rdi points to null terminator...probably could unwind this) */
	#mov $1, %rdi	/* set rdi to STDOUT */
	#mov %rcx, %rdx	/* set rdx to string length */
	#syscall
	
	lea message(%rip), %rdi
	call cstrlen

	mov %rax, %rsi
	lea message(%rip), %rdi /* not sure if this is necessary */
	call print

	/* exit(0) */
	mov $1, %rax	/* FreeBSD exit syscall */
	xor %rdi, %rdi
	syscall

.section	.rodata
message:
	.string "Hello, world!\n"

