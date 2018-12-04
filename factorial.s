	.global factorial
	.align 2
	.text
factorial:
mov	r2,r0
b	loop1

loop2:
	sub r2,r2,#1
mul r0,r2	
loop1:
	cmp r2,#1
	bgt	loop2
	bx	lr
