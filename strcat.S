	.file	"strcat.c"
	.section .text
	.align 1
	.global _strslen
_strslen:
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
	.align 1
	.global _strcats
_strcats:
	mov.w	r6,@-r7
	mov.w	r7,r6
	mov.w	#-8,r3
	add.w	r3,r7
	mov.w	r0,@(-2,r6)
	mov.w	r1,@(-4,r6)
	sub.w	r2,r2
	mov.w	r2,@(-6,r6)
	mov.w	@(-2,r6),r0
	jsr	@_strslen
	mov.w	r0,r3
	mov.w	@(-2,r6),r2
	add.w	r3,r2
	mov.w	r2,@(-8,r6)
.L5:
	mov.w	@(-4,r6),r3
	mov.w	@(-6,r6),r2
	add.w	r3,r2
	mov.b	@r2,r2l
	mov.b	r2l,r2l
	beq	.L6
	mov.w	@(-8,r6),r3
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
	bra	.L5
.L6:
	mov.w	@(-8,r6),r3
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
	mov.w	#8,r3
	add.w	r3,r7
	mov.w	@r7+,r6
	rts
	.section .rodata
.LC0:
	.ascii "hello \0"
	.space 43
.LC1:
	.ascii "world\12\0"
	.section .text
	.align 1
	.global _main
_main:
	mov.w	r6,@-r7
	mov.w	r7,r6
	mov.w	#-52,r3
	add.w	r3,r7
	mov.w	r6,r0
	add.b	#206,r0l
	addx	#255,r0h
	mov.w	#.LC0,r3
	mov.w	#7,r2
	mov.w	r3,r1
	jsr	@_memcpy
	mov.w	r6,r3
	add.b	#213,r3l
	addx	#255,r3h
	mov.w	#43,r2
	sub.w	r1,r1
	mov.w	r3,r0
	jsr	@_memset
	mov.w	#.LC1,r2
	mov.w	r2,@(-52,r6)
	mov.w	r6,r2
	add.b	#206,r2l
	addx	#255,r2h
	mov.w	@(-52,r6),r1
	mov.w	r2,r0
	jsr	@_strcats
	sub.w	r2,r2
	mov.w	r2,r0
	mov.w	#52,r3
	add.w	r3,r7
	mov.w	@r7+,r6
	rts
	.end
	.ident	"GCC: (GNU) 3.4.6"
