	.file	"lcase.c"
	.section .text
	.align 1
	.global _lcase
_lcase:
	mov.w	r6,@-r7
	mov.w	r7,r6
	subs	#2,r7
	subs	#2,r7
	mov.w	r0,@(-2,r6)
	sub.w	r2,r2
	mov.w	r2,@(-4,r6)
.L2:
	mov.w	@(-2,r6),r3
	mov.w	@(-4,r6),r2
	add.w	r3,r2
	mov.b	@r2,r2l
	mov.b	r2l,r2l
	beq	.L3
	mov.w	@(-2,r6),r3
	mov.w	@(-4,r6),r2
	add.w	r3,r2
	mov.b	@r2,r2l
	cmp.b	#64,r2l
	bls	.L4
	mov.w	@(-2,r6),r3
	mov.w	@(-4,r6),r2
	add.w	r3,r2
	mov.b	@r2,r2l
	cmp.b	#90,r2l
	bhi	.L4
	mov.w	@(-2,r6),r3
	mov.w	@(-4,r6),r2
	mov.w	r3,r0
	add.w	r2,r0
	mov.w	@(-2,r6),r3
	mov.w	@(-4,r6),r2
	add.w	r3,r2
	mov.b	@r2,r2l
	add.b	#32,r2l
	mov.b	r2l,@r0
.L4:
	mov.w	@(-4,r6),r2
	adds	#1,r2
	mov.w	r2,@(-4,r6)
	bra	.L2
.L3:
	mov.w	@(-4,r6),r2
	mov.w	r2,r0
	adds	#2,r7
	adds	#2,r7
	mov.w	@r7+,r6
	rts
	.section .rodata
.LC0:
	.ascii "HeLlO WoRlD\12\0"
	.section .text
	.align 1
	.global _main
_main:
	mov.w	r6,@-r7
	mov.w	r7,r6
	mov.w	#-16,r3
	add.w	r3,r7
	sub.w	r2,r2
	mov.w	r2,@(-2,r6)
	mov.w	r6,r0
	add.b	#240,r0l
	addx	#255,r0h
	mov.w	#.LC0,r3
	mov.w	#13,r2
	mov.w	r3,r1
	jsr	@_memcpy
	mov.w	r6,r2
	add.b	#240,r2l
	addx	#255,r2h
	mov.w	r2,r0
	jsr	@_lcase
	mov.w	r0,r2
	mov.w	r2,@(-2,r6)
	sub.w	r2,r2
	mov.w	r2,r0
	mov.w	#16,r3
	add.w	r3,r7
	mov.w	@r7+,r6
	rts
	.end
	.ident	"GCC: (GNU) 3.4.6"
