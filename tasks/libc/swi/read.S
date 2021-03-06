/*
 * read.S: read sycall wrapper
 * Author:  Sridhar  Srinivasan <sridhar1@andrew.cmu.edu>
 *         Vinay Prasad <vinayp1@andrew.cmu.edu>
 *         Ramya Bolla <rbolla@andrew.cmu.edu>
 */

#include <asm.h>
#include <bits/swi.h>

	.file "read.S"
FUNC(read)
read:
	swi READ_SWI
	cmp r0, #0
	movge pc, lr
	rsb r1, r0, #0
	ldr r2, =errno
	str r1, [r2]
	mov r0, #-1
	mov pc, lr
