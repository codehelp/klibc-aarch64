#
# arch/arm/setjmp.S
#
# setjmp/longjmp for the ARM architecture
#

#include <klibc/asmmacros.h>

#
# "Pure ARM" version
#
# The jmp_buf is assumed to contain the following, in order:
#		r4
#		r5
#		r6
#		r7
#		r8
#		r9
#		r10
#		fp
#		sp
#		lr
#

	.text
	.balign 8
	.globl setjmp
	.type setjmp, #function
setjmp:
	stp x4, x5, [x0]
	add x0, x0, #16		// add numeric 8 to register x0, store result in x0
	stp x6, x7, [x0]
	add x0, x0, #16
	stp x8, x9, [x0]
	add x0, x0, #16
	stp fp, sp, [x0]
	add x0, x0, #32
	str lr, [x0]
	mov	x0, #0
	BX(lr)
	.size setjmp,.-setjmp

	.text
	.balign 8
	.globl longjmp
	.type longjmp, #function
longjmp:
	ldp x4, x5, [x0]
	add x0, x0, #16		// add numeric 8 to register x0, store result in x0
	ldp x5, x6, [x0]
	add x0, x0, #16
	ldp x7, x8, [x0]
	add x0, x0, #16
	ldp x9, x10, [x0]
	add x0, x0, #16
	ldp fp, sp, [x0]
	movs	x0, x1
	moveq	x0, #1
	BX(lr)
	.size longjmp,.-longjmp
