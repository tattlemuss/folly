; This is a simple test harness to play the Tim Follin music
; and switch the tune/sfx when you press a key.

	opt	s+,d+

; Set this to non-zero to play the sound effects.
PLAY_SFX	=	0

LEFT_PIXEL	=	3
PIXEL_WIDTH	=	314
BUFFER_SIZE	=	PIXEL_WIDTH+2		;+2 needed for screen swapping

VOLUME_TOP	= 	0
VOLUME_BASE	= 	16*2+4			; add 2 pixels top and bottom

NOTE_TOP	=	VOLUME_BASE+4
NOTE_BASE	=	NOTE_TOP+96+4		; (there are 96 notes)

TUNE_COUNT	=	7
SFX_COUNT	=	10

; Buffer description
		rsreset
o_buffer	rs.w	(BUFFER_SIZE)*2		; 2 copies of the buffer
o_head		rs.w	1			; Position of head, times 2
o_bufsize	rs.w	1

; Box description
		rsreset
box_top		rs.w	1
box_bottom	rs.w	1
box_height	rs.w	1

	clr.l	-(a7)
	move.w	#$20,-(a7)
	trap	#1
	addq.l	#6,a7

	; Set screen
	move.l	#screen,d0
	sub.b	d0,d0
	move.l	d0,physic
	add.l	#160*200,d0
	move.l	d0,logic

	move.l	logic,a0
	bsr	draw_background
	move.l	physic,a0
	bsr	draw_background

	moveq	#0,d0
	move.w	d0,tune_id
	bsr	follin_init
	bsr	reset_buffers

	clr.b	$484.w			;key beep off
	move.b	#2,$ffff820a.w		;50Hz
	move.l	$70.w,old_vbl
	move.l	#vbl,$70.w
	clr.w	$ffff8240.w

loop:
	move.l	$466.w,d0
.wait_vbl:
	cmp.l	$466.w,d0
	beq.s	.wait_vbl

draw_volume:
	lea	a6_base,a6

	; Pitch
	move.b	o_last_note+0(a6),d0
	moveq	#0,d1
	lea	buffer_1,a0
	bsr	render_pitch

	move.b	o_last_note+1(a6),d0
	lea	buffer_2,a0
	moveq	#2,d1
	bsr	render_pitch

	move.b	o_last_note+2(a6),d0
	lea	buffer_3,a0
	moveq	#4,d1
	bsr	render_pitch

	; Volume
	move.b	o_volume+0(a6),d0
	moveq	#0,d1
	lea	vol_buffer_1,a0
	bsr	render_volume

	move.b	o_volume+1(a6),d0
	moveq	#2,d1
	lea	vol_buffer_2,a0
	bsr	render_volume

	move.b	o_volume+2(a6),d0
	moveq	#4,d1
	lea	vol_buffer_3,a0
	bsr	render_volume

	; Key checks
	move.w	#11,-(a7)
	trap	#1
	addq.l	#2,a7
	tst.l	d0
	beq	no_key

	; Read it
	move.w    #7,-(sp)     ; Offset 0
	trap      #1           ; GEMDOS
	addq.l    #2,sp        ; Correct stack

	tst.b	d0
	beq.s	no_key

	;Change tune
	bsr	input_next_tune

no_key:
	; Screen swap
	movem.l	physic,d0/d1
	move.l	d1,physic
	move.l	d0,logic
	lsr.w	#8,d1
	move.l	d1,$ffff8200.w
	bra	loop

render_pitch:
	; d0 - level
	; d1 - screen offset
	and.w	#$ff,d0
	move.w	#NOTE_BASE-2,d2
	sub.w	d0,d2
	move.l	logic,a3
	add.l	d1,a3
	bra	render_channel

render_volume:
	and.w	#$ff,d0
	add.w	d0,d0			; two rows per step
	move.w	#VOLUME_BASE-2,d2
	sub.w	d0,d2
	move.l	logic,a3
	add.l	d1,a3
	bra	render_channel

render_channel:
	; a0 buffer data
	; a3 screen base
	; d2 input level
	movem.l	d2/a0/a3,-(a7)
	move.w	o_head(a0),d0
	lea.l	2(a0,d0.w),a1			;a1 height values
	bsr	apply_clear
	movem.l	(a7)+,d2/a0/a3

	; Store current value at head
	move.w	o_head(a0),d1
	mulu.w	#160,d2

	; Store value at current head position, and a buffer's width along
	lea	(a0,d1.w),a1
	move.w	d2,(a1)
	move.w	d2,(BUFFER_SIZE)*2(a1)		;store twice to avoid wrap logic

	; Move head on
	addq.w	#2,d1
	cmp.w	#(BUFFER_SIZE)*2,d1
	blt.s	.no_wrap
	move.w	#0,d1
.no_wrap:
	move.w	d1,o_head(a0)

	; We've now moved on so that o_head points
	; to just after the added point.
	; To render, we need to jump 2 more points so that
	; our last point added is just on the RHS
	move.w	o_head(a0),d0
	lea.l	4(a0,d0.w),a1			;a1 height values
; a1 - value (height) buffer
; a3 - screen
o	set	LEFT_PIXEL
	rept	PIXEL_WIDTH
	 move.w	(a1)+,d0		; read offset from buffer
	 or.w	#$8000>>(o&$f),(a3,d0.w); write to screen
	ifeq	(o&15)-15		; only skip on pixel 15
	 addq.w	#8,a3
	endif
o	set	o+1
	endr
	rts

apply_clear:
; a1 - value (height) buffer
; a3 - screen
	moveq	#0,d1
o	set	LEFT_PIXEL
	rept	PIXEL_WIDTH
	 move.w	(a1)+,d0	; read offset from buffer
	 move.w	d1,(a3,d0.w)	; write to screen
	ifeq	(o&15)-15	; only skip on pixel 15
	 addq.w	#8,a3
	endif
o	set	o+1
	endr
	rts

; -----------------------------------------------------------------------------
; VBL running at 50Hz will update the music, then jump to the pre-existing VBL handler
vbl:
	movem.l	d0-a6,-(a7)
	bsr	follin_update
	movem.l	(a7)+,d0-a6

	; Jump to old VBL
	move.l	old_vbl,-(a7)
	rts

; -----------------------------------------------------------------------------
draw_background:
	lea	box_1,a4
	bsr	draw_box
	lea	box_2,a4
	bsr	draw_box
	rts

draw_box:
	; top row
	move.w	box_top(a4),d0		; offset
	bsr	draw_row

	; bottom row
	move.w	box_bottom(a4),d0	; offset
	bsr	draw_row

	; sides
	move.w	box_top(a4),d0		; offset
	move.w	#$8000,d1		; bit
	move.w	box_height(a4),d2	; length
	bsr	draw_col

	move.w	box_top(a4),d0		; offset
	add.w	#160-8,d0		; offset
	move.w	#$0001,d1		; bit
	move.w	box_height(a4),d2	; length
	bsr	draw_col
	rts

draw_row:
	move.w	#-1,d1		; value
	move.w	#20,d2		; count
	move.w	#8,d3		; offset
	bra	draw_shared

draw_col:
	move.w	#160,d3
draw_shared:
	lea	6(a0,d0.w),a1
	subq.w	#1,d2
.loop:	or.w	d1,(a1)
	add.w	d3,a1
	dbf	d2,.loop
	rts

box_1	dc.w	VOLUME_TOP*160
	dc.w	(VOLUME_BASE)*160
	dc.w	VOLUME_BASE-VOLUME_TOP

box_2	dc.w	NOTE_TOP*160
	dc.w	NOTE_BASE*160
	dc.w	NOTE_BASE-NOTE_TOP

; -----------------------------------------------------------------------------
reset_buffers:
	move.w	#(NOTE_BASE-2)*160,d0
	lea	buffer_1,a0
	bsr	.clear
	lea	buffer_2,a0
	bsr	.clear
	lea	buffer_3,a0
	bsr	.clear
	move.w	#(VOLUME_BASE-2)*160,d0
	lea	vol_buffer_1,a0
	bsr	.clear
	lea	vol_buffer_2,a0
	bsr	.clear
	lea	vol_buffer_3,a0
	bsr	.clear
	rts

.clear:
	move.w	#BUFFER_SIZE*2-1,d7
.loop:	move.w	d0,(a0)+
	dbf	d7,.loop
	clr.w	o_head(a0)
	rts

; -----------------------------------------------------------------------------
input_next_tune:
	move.w	our_tune_id,d0
	add.w	#1,d0
	cmp.w	#TUNE_COUNT+SFX_COUNT,d0
	blt.s	.no_wrap
	clr.w	d0
.no_wrap:
	move.w	d0,our_tune_id

	; Decide whether to trigger a tune or a SFX
	cmp.w	#TUNE_COUNT,d0
	blt.s	.is_tune

	; Trigger SFX
	sub.w	#TUNE_COUNT,d0
	bsr	follin_sfx_init
	rts
.is_tune:
	; Trigger tune
	move.w	our_tune_id,d0
	move.w	d0,tune_id
	bsr	follin_init
	rts
	
		; The player code itself.
		include	LEDSTOR2.S

		section	bss
our_tune_id:	ds.w	1
physic:		ds.l	1
logic:		ds.l	1
old_vbl:	ds.l	1
sfx_id:		ds.w	1

buffer_1	ds.b	o_bufsize
buffer_2	ds.b	o_bufsize
buffer_3	ds.b	o_bufsize

vol_buffer_1	ds.b	o_bufsize
vol_buffer_2	ds.b	o_bufsize
vol_buffer_3	ds.b	o_bufsize

		ds.b	256
screen		ds.b	32000*2


