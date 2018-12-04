	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"fac.c"
	.text
	.align	2
	.global	factorial_inefficient
	.syntax unified
	.arm
	.fpu vfp
	.type	factorial_inefficient, %function
factorial_inefficient:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	mul	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bgt	.L3
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	factorial_inefficient, .-factorial_inefficient
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Efficient: %d\012\000"
	.align	2
.LC1:
	.ascii	"Inefficient: %d\012\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	strh	r3, [fp, #-6]	@ movhi
	mov	r0, #5
	bl	factorial
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	mov	r0, #5
	bl	factorial_inefficient
	str	r0, [fp, #-12]
	ldrsh	r3, [fp, #-6]
	mov	r1, r3
	ldr	r0, .L7
	bl	printf
	ldr	r1, [fp, #-12]
	ldr	r0, .L7+4
	bl	printf
	mov	r0, #5
	bl	factorial
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Raspbian 6.3.0-18+rpi1+deb9u1) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
