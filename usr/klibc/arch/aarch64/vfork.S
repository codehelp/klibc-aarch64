/*
 * arch/arm/vfork.S
 *
 * vfork - nasty system call which must not use the stack.
 */

#include <klibc/asmmacros.h>
#include <asm/unistd.h>

	.type	vfork,#function
	.globl	vfork

	.balign	4
vfork:
	mov	r3, r7
	mov	r7, # __NR_vfork
	swi	0
	mov	r7, r3

        cmn     r0, #4096
        rsbcs	r2, r0, #0
        ldrcs	r3, 1f
        mvncs	r0, #0
        strcs	r2, [r3]
	BX(lr)

	.balign 4
1:
	.word	errno
