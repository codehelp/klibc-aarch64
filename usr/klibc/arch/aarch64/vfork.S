/*
 * arch/aarch64/vfork.S
 *
 * vfork - nasty system call which must not use the stack.
 */

#include <klibc/asmmacros.h>
#include <asm/unistd.h>

// FIXME: no save or restore PID support

	.type	vfork,#function
	.globl	vfork
	.balign	8
vfork:
	mov	x0, #0x4111	/* CLONE_VM | CLONE_VFORK | SIGCHLD */
	mov	x1, sp
	cmn	x0, #4095
	b.cs    1f
	RET
1:
	.word	errno
