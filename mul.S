	.file	"mul.c"
	.section .text
	.align 1
	.global _mul
_mul:
	mov.w	r6,@-r7
	mov.w	r7,r6
	subs	#2,r7
	subs	#2,r7
	mov.w	r0,@(-2,r6)
	mov.w	r1,@(-4,r6)
	mov.w	@(-4,r6),r1
	mov.w	@(-2,r6),r0
	jsr	@___mulhi3
	mov.w	r0,r2
	mov.w	r2,r0
	adds	#2,r7
	adds	#2,r7
	mov.w	@r7+,r6
	rts
	.align 1
	.global _main
_main:
	mov.w	r6,@-r7
	mov.w	r7,r6
	subs	#2,r7
	mov.w	#10,r1
	mov.w	#10,r0
	jsr	@_mul
	mov.w	r0,r2
	mov.w	r2,@(-2,r6)
	sub.w	r2,r2
	mov.w	r2,r0
	adds	#2,r7
	mov.w	@r7+,r6
	rts
	.end
	.ident	"GCC: (GNU) 3.4.6"
