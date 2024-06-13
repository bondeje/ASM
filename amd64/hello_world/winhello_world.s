# Windows_NT x64 equivalent. string length is hardcoded
# gcc winhello_world.s -o hello_world.exe
.globl	main
.extern GetStdHandle
.extern WriteFile

.section .rdata

message:
	.ascii "Hello, World!\12\0"

.section	.text
main:
	subq	$64, %rsp       	# WriteFile has 5 inputs
	
	movl	$-11, %ecx      	# stdout request to GetStdHandle
	call	GetStdHandle
	movq	%rax, %rcx      	# move stdout handle to 1st parameter

	movq	$0, 32(%rsp)   		# zeros out part of shadow space? Is this the lpOverLapped null
	movl	$0, %r9d        	# zeros out the 4th parameter (lpNumberOfBytesWritten)
	movl	$14, %r8d       	# passes nNumberOfBytesToWrite = 14
	leaq	message(%rip), %rdx    # load string to 2nd parameter
	call	WriteFile       
	addq	$64, %rsp   		# undo shadow storage
	ret
