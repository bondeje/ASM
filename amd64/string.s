.globl cstrlen
.type cstrlen, %function

.section	.text
/*
cstrlen - calculates the length of a null-terminated c-str
rdi - char * string
rax - length of string
*/
cstrlen:
	xor %rcx, %rcx 	/* zero count register rcx which will receive the string length */
	not %rcx		/* set rcx to all 1 bits (maximum count) or -1 in signed 2s complement */
	xor %al, %al	/* set al to 0 */
	cld				/* set direction flag to 0, this causes repnz scasb to increment rdi */
	repnz	scasb	/* checks rdi byte against al. if they do not match (al - *rdi != 0),
					ZF is set to 0, rdi is incremented and rcx is decremented, repeats */
	not %rcx		/* flip all bits in rcx. in signed 2s complement, this is -length - 1 -> length
					(from ~x + 1 = -x). logic works as well for unsigned *?
	dec %rcx		/* rcx--. rcx is now string length */
	mov %rcx, %rax 	/* move to return register */
	ret
