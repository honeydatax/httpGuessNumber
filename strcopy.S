	.file	"strcopy.c"
	.section .text
	.align 1
	.global _strcopy
_strcopy:
	mov.w	r6,@-r7
	mov.w	r7,r6
	mov.w	#-6,r3
	add.w	r3,r7
	mov.w	r0,@(-2,r6)
	mov.w	r1,@(-4,r6)
	sub.w	r2,r2
	mov.w	r2,@(-6,r6)
.L2:
	mov.w	@(-4,r6),r3
	mov.w	@(-6,r6),r2
	add.w	r3,r2
	mov.b	@r2,r2l
	mov.b	r2l,r2l
	beq	.L3
	mov.w	@(-2,r6),r3
	mov.w	@(-6,r6),r2
	mov.w	r3,r0
	add.w	r2,r0
	mov.w	@(-4,r6),r3
	mov.w	@(-6,r6),r2
	add.w	r3,r2
	mov.b	@r2,r2l
	mov.b	r2l,@r0
	mov.w	@(-6,r6),r2
	adds	#1,r2
	mov.w	r2,@(-6,r6)
	bra	.L2
.L3:
	mov.w	@(-2,r6),r3
	mov.w	@(-6,r6),r2
	mov.w	r3,r0
	add.w	r2,r0
	mov.w	@(-4,r6),r3
	mov.w	@(-6,r6),r2
	add.w	r3,r2
	mov.b	@r2,r2l
	mov.b	r2l,@r0
	mov.w	@(-6,r6),r2
	mov.w	r2,r0
	mov.w	#6,r3
	add.w	r3,r7
	mov.w	@r7+,r6
	rts
	.section .rodata
.LC0:
	.ascii "hello world\12\0"
	.section .text
	.align 1
	.global _main
_main:
	mov.w	r6,@-r7
	mov.w	r7,r6
	mov.w	#-1026,r3
	add.w	r3,r7
	mov.w	#.LC0,r2
	mov.w	r2,@(-1026,r6)
	mov.w	r6,r2
	add.b	#252,r2h
	mov.w	@(-1026,r6),r1
	mov.w	r2,r0
	jsr	@_strcopy
	sub.w	r2,r2
	mov.w	r2,r0
	mov.w	#1026,r3
	add.w	r3,r7
	mov.w	@r7+,r6
	rts
	.end
	.ident	"GCC: (GNU) 3.4.6"
