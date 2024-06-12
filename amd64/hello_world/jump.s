.globl pexit
.type pexit, %function
.section .text
pexit:
 mov $ 1, %rax
 syscall
 ret
