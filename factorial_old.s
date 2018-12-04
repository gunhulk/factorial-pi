	.global factorial
	.align 2
	.text
factorial:
	mov	r2,#1
	str	r2,[fp,#-12]
	b	loop1

loop2:
	ldr r2, [fp,#-12]
	ldr r1, [fp,#-8]
	mul r2,r1,r2
	str r2, [fp,#-12]
	ldr r2, [fp,#-8]
	sub r2,r2,#1
	str r2, [fp,#-8]

loop1:
	ldr r2, [fp,#-8]
	cmp r2,#1
	bgt	loop2
	ldr r2,[fp,#-12]
	mov r0,r2
	add sp,fp,#0
	ldr fp, [sp], #4
	bx	lr
