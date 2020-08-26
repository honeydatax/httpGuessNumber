	.file	"chrnfill.c"
	.section .text
	.align 1
	.global _strnfill
_strnfill:
	mov.w	r6,@-r7
	mov.w	r7,r6
	mov.w	#-8,r3
	add.w	r3,r7
	mov.w	r0,@(-2,r6)
	mov.b	r1l,@(-3,r6)
	mov.w	r2,@(-6,r6)
	sub.w	r2,r2
	mov.w	r2,@(-8,r6)
.L2:
	mov.w	@(-8,r6),r3
	mov.w	@(-6,r6),r2
	cmp.w	r2,r3
	bgt	.L3
	mov.w	@(-2,r6),r3
	mov.w	@(-8,r6),r2
	add.w	r2,r3
	mov.b	@(-3,r6),r2l
	mov.b	r2l,@r3
	mov.w	@(-8,r6),r2
	adds	#1,r2
	mov.w	r2,@(-8,r6)
	bra	.L2
.L3:
	mov.w	@(-8,r6),r2
	mov.w	r2,r0
	mov.w	#8,r3
	add.w	r3,r7
	mov.w	@r7+,r6
	rts
	.align 1
	.global _main
_main:
	mov.w	r6,@-r7
	mov.w	r7,r6
	mov.w	#-124,r3
	add.w	r3,r7
	mov.w	r6,r3
	add.b	#132,r3l
	addx	#255,r3h
	mov.w	#80,r2
	mov.b	#42,r1l
	mov.w	r3,r0
	jsr	@_strnfill
	sub.b	r2l,r2l
	mov.b	r2l,@(-44,r6)
	sub.w	r2,r2
	mov.w	r2,r0
	mov.w	#124,r3
	add.w	r3,r7
	mov.w	@r7+,r6
	rts
	.end
	.ident	"GCC: (GNU) 3.4.6"
