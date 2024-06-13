/*
assemble & link: clang asmlib.s hello_world.s -o hello_world

This largely follows: stackoverflow.com/questions/27594297/how-to-print-a-string-to-the-terminal-in-x86-64-assembly-nasm-without-syscall
Explanation of repnz scasb: stackoverflow.com/questions/26783797/repnz-scas-assembly-instruction-specifics

*/


.global main

.section	.text

main:
	lea message(%rip), %rdi
	call cstrlen

	mov %rax, %rsi
	lea message(%rip), %rdi /* not sure if this is necessary */
	call print

	/* exit(0) */
	xor %rdi, %rdi
	call pexit

.section	.rodata
message:
	.string "Hello, world!\n"

