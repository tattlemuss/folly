; Tim Follin's Atari ST driver for "LED Storm", annotated in 2017.

; "o_" offsets are offsets into the data area specified by a6_base
; They are usually referenced by x(A6,D?.W) addressing,
; where D6 is an offset of 0/1/2 (per-channel) most byte values
;       D5 is an offset of 0/2/4, the 16-bit values (eg pitch)
;       D4 is an offset of 0/4/7, the 32-bit values (eg addresses for loops/stacks)

o_vibrato		= -$78		; raw YM delta to apply in vibrato, in YM period space
o_vibrato_dir		= -$74		; current vibrato direction
o_vibrato_cntr		= -$70
o_vibrato_spd		= -$6c
o_arp_cntr		= -$68
o_arp_spd_up		= -$64
o_arp_delta		= -$60
o_last_note		= -$5c
o_slide_delta		= -$58
o_slide_target_note	= -$54
o_raw_period_adj	= -$50		; raw delta to apply to notes in YM period space
o_next_note_cntr	= -$4c
o_vibrato_startdir	= -$48		; whether vibrato is going up or down at note start
o_reset_adsr_on_note	= -$44
o_start_adsr_step	= -$40
o_instr_volume		= -$3c
o_loop_cnt		= -$38
o_note_transpose        = -$34
o_skip_transpose	= -$30		; Don't apply transpose (on next note only) e.g. for fixed freq instruments
o_default_note_time	= -$2c		; if set, notes don't take a time
o_fixed_mixer		= -$28		; Fixed mixer value when fixed values enabled.
o_unknown_1		= -$24		; set at init, not changed?
o_instr_mixer		= -$20
o_mute_cntr		= -$1c		; counts down to point where instrument mute happens
o_mute_time		= -$18		; time after which instrument is muted
o_volume		= -$14
o_channel_stop		= -$10		; if set, do no channel update
o_fixed_period_time	= -$c		; set at init. if set used fixed YM values
o_skip_update_counter	= -$8		; if nonzero suppress update + count down
o_nomute		= -$4

o_arp_spd_down		= $58		; number of frames to do arp jumps down
o_mixer			= $5c
o_adsr_step		= $60
o_env_counter		= $64		; counter to the next envelope volume update
o_attack_spd		= $68		; number of steps for attack
o_decay_spd		= $6c		; number of steps for decay
o_instr_min_volume	= $70		; drop to this level in the release
o_vibrato_delay		= $74		; set at init
o_vibrato_delay_cntr	= $78		; counts down to vibrato start

; o4, these use d4 as the offset (channel number * 4)
o4_command_ptr		= 0		; address of next command/note to read
o4_loop_addr		= $10
o4_cmd_stack		= $30

; o5, these use d5 as the base offset (channel number * 2)

o5_fixed_period_hi	= $40		; Fixed period to apply (high part)
o5_fixed_period_lo	= $41
o5_ym_period_hi		= $48		; Current period value (during vibrato)
o5_ym_period_lo		= $49

follin_init:
	CLR.L     D0
	MOVE.W    tune_id,D0  			; tune ID
	ASL.W     #1,D0
	CLR.L     D1
	MOVE.W    D0,D1
	ADDI.L    #channel_a_start_table,D1	; channel_a_start_table
	MOVEA.L   D1,A0
	BSR       get_ch_cmd_start
	MOVE.L    D1,tune_base_a
	CLR.L     D1
	MOVE.W    D0,D1
	ADDI.L    #channel_b_start_table,D1
	MOVEA.L   D1,A0
	BSR       get_ch_cmd_start
	MOVE.L    D1,tune_base_b
	CLR.L     D1
	MOVE.W    D0,D1
	ADDI.L    #channel_c_start_table,D1
	MOVEA.L   D1,A0
	BSR       get_ch_cmd_start
	MOVE.L    D1,tune_base_c
	MOVE.B    #-1,D0
	MOVE.B    D0,a6_base-$10
	MOVE.B    D0,a6_base-$10+1
	MOVE.B    D0,a6_base-$10+2
shared_init:	
	MOVE.B    D0,a6_base-$24
	MOVE.B    D0,a6_base-$24+1
	MOVE.B    D0,a6_base-$24+2
	CLR.L     a6_base-$34             ; o_note_transpose
	CLR.L     a6_base-$2c             ; o_default_note_time
	CLR.L     a6_base-$30             ; o_skip_transpose
	CLR.L     a6_base-$68             ; o_arp_cntr
	CLR.L     a6_base-$64             ; o_arp_spd_up
	CLR.L     a6_base+$58             ; o_arp_spd_down
	CLR.L     a6_base-$58             ; o_slide_delta
	CLR.L     a6_base+$74             ; o_vibrato_delay
	CLR.L     a6_base-$c		  ; o_fixed_period_time
	CLR.L     a6_base-$38             ; o_loop_cnt
	CLR.L     a6_base-$50             ; o_raw_period_adj
	CLR.L     a6_base-$4c             ; o_next_note_cntr
	MOVE.B    #1,D0
	MOVE.B    D0,a6_base-$4c          ; o_next_note_cntr
	MOVE.B    D0,a6_base-$4c+1
	MOVE.B    D0,a6_base-$4c+2
	MOVE.B    D0,a6_base-$44      	  ; o_reset_adsr_on_note
	MOVE.B    D0,a6_base-$44+1
	MOVE.B    D0,a6_base-$44+2
	MOVE.B    #9,D1
	MOVE.B    D1,a6_base+$5c          ; o_mixer
	ASL.B     #1,D1
	MOVE.B    D1,a6_base+$5c+1
	ASL.B     #1,D1
	MOVE.B    D1,a6_base+$5c+2
	MOVE.L    #channel_a_stack_start,a6_base+$30	; o4_cmd_stack
	MOVE.L    #channel_b_stack_start,a6_base+$30+4
	MOVE.L    #channel_c_stack_start,a6_base+$30+8
follin_end:
	RTS

; "Stop"
follin_stop:
	CLR.B     D2
	MOVE.B    #8,D0
	BSR       write_ym_reg
	CLR.B     D2
	MOVE.B    #9,D0
	BSR       write_ym_reg
	CLR.B     D2
	MOVE.B    #$A,D0
	BSR       write_ym_reg
	CLR.L     D0
	MOVE.B    D0,a6_base-$10		; o_channel_stop
	MOVE.B    D0,a6_base-$10+1
	MOVE.B    D0,a6_base-$10+2
	MOVE.B    #-1,D0
	BRA       shared_init

; Initialise sfx.
; The sfx is a list of channel IDs and "tune" starts to use,
; followed by $ff.
follin_sfx_init:
	ASL.B     #1,D0
	ANDI.L    #$1F,D0
	LEA       sfx_table,A0
	MOVE.B    0(A0,D0.W),tmp_swap_2
	MOVE.B    1(A0,D0.W),tmp_swap_1
	CLR.L     D0
	MOVE.W    tmp_swap_1,D0
	SUBI.L    #0,D0
	ADDI.L    #tune_start_table,D0
	MOVEA.L   D0,A0
	CLR.L     D0

channel_tune_reset_loop:
	MOVE.B    (A0),D0             ; some sort of command byte
	BMI       follin_end
	LSR.B     #1,D0               ; shift down
	LEA       a6_base-$10,A1      ; o_channel_stop
	MOVE.B    #-1,0(A1,D0.W)
	LEA       a6_base-$4c,A1
	MOVE.B    #1,0(A1,D0.W)       ; o_next_note_cntr

	MOVE.B    (A0)+,D0            ; d0 is now the channel
	ASL.B     #1,D0
	LEA       tune_base_a,A1
	; lookup "tune" start
	MOVE.B    (A0)+,tmp_swap_2
	MOVE.B    (A0)+,tmp_swap_1
	CLR.L     D1
	MOVE.W    tmp_swap_1,D1
	SUBI.L    #0,D1
	ADDI.L    #tune_start_table,D1
	MOVE.L    D1,0(A1,D0.W)		; set tune ptr
	BRA       channel_tune_reset_loop

; The main update function.
; This should be called at a rate of 50Hz
; It updates each channel in turn, writing to the YM
; as it goes.
follin_update:
	CLR.B     channel_delay_mask
	LEA       tune_base_a,A6
	LEA       mixer_mute_table,A5
	CLR.L     D6
	CLR.L     D5
	CLR.L     D4
; per-channel loop:
L0023:	MOVE.B    D6,D5               ; d6 = 0/1/2
	ASL.W     #1,D5               ; d5 = 0/2/4
	MOVE.B    D5,D4
	ASL.W     #1,D4               ; d4 = 0/4/8
	BSR       update_channel
	ADDQ.B    #1,D6
	CMP.B     #3,D6
	BNE       L0023
	RTS

write_ym_period:
	MOVE.B    o5_ym_period_lo(A6,D5.W),D2
	MOVE.B    D6,D0
	ASL.B     #1,D0
	BSR       write_ym_reg
	MOVE.B    o5_ym_period_hi(A6,D5.W),D2
	MOVE.B    D6,D0
	ASL.B     #1,D0
	ADDQ.B    #1,D0
; d0 = register index
; d2 = register value
write_ym_reg:
	MOVE.L    D2,temp_d2_store
	CMP.B     #7,D0
	BEQ       write_mixer
	MOVE.B    D0,$FF8800.L
	MOVE.B    D2,$FF8802.L
	MOVE.L    temp_d2_store,D2
	MOVE.L    D2,D0
	RTS
write_mixer:
	MOVE.B    D0,$FF8800.L
	MOVE.B    $FF8800.L,D1
	ANDI.B    #-$40,D1		; preserve top bits
	ANDI.B    #$3F,D2
	OR.B      D2,D1
	MOVE.B    D1,$FF8802.L
	MOVE.L    temp_d2_store,D2
	MOVE.L    D2,D0
	RTS
generate_mixer:
	MOVE.B    a6_base+$5c,D2                 ; = $5C(A6)
	OR.B      a6_base+$5c+1,D2
	OR.B      a6_base+$5c+2,D2
	MOVE.B    #7,D0
	BRA       write_ym_reg

; Read 2 bytes from A0 which constitute an offset into the tune data
; A0: address of little-endian value for offset into tune data
; D1: absolute address of resulting data
get_ch_cmd_start:
	MOVE.B    (A0)+,tmp_swap_2        ; get offset as little-endian
	MOVE.B    (A0)+,tmp_swap_1
	CLR.L     D1
	MOVE.W    tmp_swap_1,D1
	SUBI.W    #0,D1
	ADDI.L    #tune_start_table,D1
	RTS

update_channel:
	MOVE.B    o_channel_stop(A6,D6.W),D7
	OR.B      D7,channel_delay_mask
	TST.B     o_channel_stop(A6,D6.W)
	BPL       channel_done
	
	; Apply ADSR
	TST.B     o_adsr_step(A6,D6.W)
	BNE       L002A
	; Step 0 -- attack
	SUBQ.B    #1,o_env_counter(A6,D6.W)
	BPL       L002C
	MOVE.B    o_attack_spd(A6,D6.W),o_env_counter(A6,D6.W)
	ADDQ.B    #1,o_volume(A6,D6.W)
	CMPI.B    #$F,o_volume(A6,D6.W)
	BNE       L002C
	; move to step 1
	MOVE.B    #1,o_adsr_step(A6,D6.W)
	MOVE.B    o_decay_spd(A6,D6.W),o_env_counter(A6,D6.W)
	BRA       L002C
L002A:	CMPI.B    #1,o_adsr_step(A6,D6.W)
	BNE       L002C
  	; Step 1 -- decay
	SUBQ.B    #1,o_env_counter(A6,D6.W)
	BPL       L002C
	MOVE.B    o_decay_spd(A6,D6.W),o_env_counter(A6,D6.W)
	MOVE.B    o_volume(A6,D6.W),D0
  	; Clip to min volume
	CMP.B     o_instr_min_volume(A6,D6.W),D0
	BEQ       L002B
	SUBQ.B    #1,o_volume(A6,D6.W)
	BPL       L002C
L002B:	MOVE.B    #2,o_adsr_step(A6,D6.W)	; Step 2 is effectively "sustain"
	; -$14 is now the volume?
L002C:	
	; Set the volume register
	MOVE.B    o_volume(A6,D6.W),D2
	MOVE.B    D6,D0
	ADDQ.B    #8,D0               		; 8 + channel: volume
	BSR       write_ym_reg
	
	; Period adjust
	TST.B     o_fixed_period_time(A6,D6.W)
	BEQ       period_update
	TST.B     o_skip_update_counter(A6,D6.W)
	BEQ       period_update
	SUBQ.B    #1,o_skip_update_counter(A6,D6.W)
	BNE       period_update_complete

	; o_skip_update_counter has counted down, force
	; an initial period+mixer update
	BSR       write_ym_period
	MOVE.B    o_instr_mixer(A6,D6.W),o_mixer(A6,D6.W)
	BSR       generate_mixer
	
period_update:
	TST.B     o_vibrato_delay(A6,D6.W)
	BEQ       apply_arp
	TST.B     o_vibrato_delay_cntr(A6,D6.W)
	BEQ       apply_vibrato
	SUBQ.B    #1,o_vibrato_delay_cntr(A6,D6.W)
	BNE       apply_arp
apply_vibrato:	
	MOVE.W    o5_ym_period_hi(A6,D5.W),D0
	CLR.L     D1
	MOVE.B    o_vibrato(A6,D6.W),D1		; -$78 period adjust
	TST.B     o_vibrato_dir(A6,D6.W)	; -$74 period direction
	; Decide whether to go up or down
	BEQ       apply_vibrato_down
	ADD.W     D1,D0				; apply period adjust
	BRA       L0030
apply_vibrato_down:
	SUB.W     D1,D0
L0030:	MOVE.W    D0,o5_ym_period_hi(A6,D5.W)
	BSR       write_ym_period
	SUBQ.B    #1,o_vibrato_cntr(A6,D6.W)
	BNE       apply_slide				; don't apply any further modulation

	MOVE.B    o_vibrato_spd(A6,D6.W),D0
	BEQ       apply_slide				; if speed = 0, skip all this

	; the vibrato counter is doubled from the original here, so it goes up a half,
	; down a full, up a full (i.e. oscillates around the base level)
	ASL.B     #1,D0					; double the counter, and reapply
	MOVE.B    D0,o_vibrato_cntr(A6,D6.W) 
	EORI.B    #-1,o_vibrato_dir(A6,D6.W)		; change direction
	BRA       apply_slide

apply_arp:
	; This effect works a bit like vibrato but is
	; applied to whole notes and can have different up/down delays
	TST.B     o_arp_cntr(A6,D6.W)
	BEQ       apply_slide
	SUBQ.B    #1,o_arp_cntr(A6,D6.W)
	BNE       apply_slide
	MOVE.B    o_arp_spd_up(A6,D6.W),o_arp_cntr(A6,D6.W)
	MOVE.B    o_arp_delta(A6,D6.W),D1
	MOVE.B    o_last_note(A6,D6.W),D0		; get the base note
	EORI.B    #-1,o_vibrato_dir(A6,D6.W)
	BEQ       L0032
	ADD.B     D1,D0					; apply arp offset
	BRA       slide_updated
L0032:	MOVE.B    o_arp_spd_down(A6,D6.W),o_arp_cntr(A6,D6.W)
	SUB.B     D1,D0
	BRA       slide_updated
	
	; Next effect, I think this is "slide" from the previous note
	; to the target note. Like arp, this works in note space.
apply_slide:
	TST.B     o_slide_delta(A6,D6.W)
	BEQ       period_update_complete
	MOVE.B    o_slide_delta(A6,D6.W),D2
	MOVE.B    o_last_note(A6,D6.W),D0

	; Do we need to go up or down?
	CMP.B     o_slide_target_note(A6,D6.W),D0
	BEQ       period_update_complete		; neither, slide is done
	BCS       L0034
	SUB.B     D2,D0					; go down
	CMP.B     o_slide_target_note(A6,D6.W),D0	; check for overshoot
	BCC       slide_updated
	BRA       clip_slide
L0034:	ADD.B     D2,D0
	CMP.B     o_slide_target_note(A6,D6.W),D0
	BCS       slide_updated
clip_slide:
	; This fires in the case that the slide jump overshoots
	; the target note.
	MOVE.B    o_slide_target_note(A6,D6.W),D0

slide_updated:
	; lookup the final note value in the period table again
	; (this is why it's incompatible with vibrato)
	MOVE.B    D0,o_last_note(A6,D6.W)
	ANDI.W    #$FF,D0
	ASL.B     #1,D0
	LEA       note_table,A2
	MOVE.W    0(A2,D0.W),D0
	CLR.W     D1
	MOVE.B    o_raw_period_adj(A6,D6.W),D1
	ADD.W     D1,D0
	MOVE.W    D0,o5_ym_period_hi(A6,D5.W)	; this also writes to lo value
	BSR       write_ym_period

period_update_complete:
	; Reduce time to next note
	SUBQ.B    #1,o_next_note_cntr(A6,D6.W)
	MOVE.B    o_next_note_cntr(A6,D6.W),D0
	CMP.B     o_nomute(A6,D6.W),D0		; -4 forces mute if 0
	BEQ       force_mute

	TST.B     o_mute_cntr(A6,D6.W)		; withhold mute until counter is down to 0
	BNE       no_mute

force_mute:
	MOVE.B    1(A5,D5.W),o_mixer(A6,D6.W)	; look up alternative mixer values
	BSR       generate_mixer
	ADDQ.B    #1,o_mute_cntr(A6,D6.W)	; inc mystery counter to 1 again (then immediately zeroed)

no_mute:SUBQ.B    #1,o_mute_cntr(A6,D6.W)	; count down to mute
	TST.B     o_next_note_cntr(A6,D6.W)
	BNE       channel_done

	; This is the main command processing loop.
	; The first byte is either a command if (top bit is set
	; or value is 0),
	; or a new note value to play.
	MOVEA.L   o4_command_ptr(A6,D4.W),A0
fetch_cmd:
	CLR.L     D0
	MOVE.B    (A0)+,D0
	BEQ       L003B				;0 is a command
	BPL       not_a_command			;test top bit
L003B:	ANDI.W    #$1F,D0  			;command mask is 31
	ASL.W     #2,D0				;jump table lookup
	LEA       jmptable,A1
	MOVEA.L   0(A1,D0.W),A1			;look up jump address
	CMPA.L    #note_table,A1      		;safety check
	BEQ       error_lockup			;should this be BGE to be more effective?
	JMP       (A1)				;process command. Commands jump back to fetch_cmd.

; A rather brutal but effective way of detecting something is wrong.
error_lockup:	
	JMP       error_lockup

not_a_command:
	; if it's not a command it must be a note
	; d0 is the note value.
	MOVE.B    D0,D2
	TST.B     o_skip_transpose(A6,D6.W)	; if o_skip_transpose is non-zero, force transpose to 0
	BEQ       .apply_transpose		; go set note
	CLR.B     D0                 		; use 0 for transpose
	MOVE.B    D0,o_skip_transpose(A6,D6.W)	; clear the flag for next time
	BRA       .skip_transpose
.apply_transpose:
	MOVE.B    o_note_transpose(A6,D6.W),D0  ; note transpose?
.skip_transpose:
	ADD.B     D2,D0				; apply transpose

	TST.B     o_slide_delta(A6,D6.W)
	BEQ       .apply_note

	; If we're applying slide, save this new note as the slide target,
	; and use the previous note as the current note position.
	MOVE.B    D0,o_slide_target_note(A6,D6.W)
	MOVE.B    o_last_note(A6,D6.W),D0	; use previous note

.apply_note:
	; Look up the note value and poke it into the YM.
	ANDI.W    #$FF,D0
	MOVE.B    D0,o_last_note(A6,D6.W)	; last note
	ASL.B     #1,D0
	LEA       note_table,A2			; look up note (d0)
	MOVE.W    0(A2,D0.W),D0

	; Apply fine-tune direct period adjust. This can only
	; be a positive value...
	CLR.W     D1
	MOVE.B    o_raw_period_adj(A6,D6.W),D1
	ADD.W     D1,D0
	MOVE.W    D0,o5_ym_period_hi(A6,D5.W)
	BSR       write_ym_period

	; set delay to next note
	; If the default note time is 0, the next command byte
	; is time-to-next-cmd/note
	MOVE.B    o_default_note_time(A6,D6.W),D0
	TST.B     D0
	BNE       .no_extra_note_time
	MOVE.B    (A0)+,D0            ; extra value

.no_extra_note_time:
	MOVE.B    D0,o_next_note_cntr(A6,D6.W)
	MOVE.L    A0,o4_command_ptr(A6,D4.W)
	
	; Retrigger the note envelope
	MOVE.B    o_arp_spd_up(A6,D6.W),o_arp_cntr(A6,D6.W)
	MOVE.B    o_mute_time(A6,D6.W),o_mute_cntr(A6,D6.W)
	MOVE.B    o_instr_mixer(A6,D6.W),o_mixer(A6,D6.W)
	BSR       generate_mixer

	MOVE.B    o_vibrato_delay(A6,D6.W),D0
	BEQ       .set_vibrato_dir			; No vibrato?

	MOVE.B    D0,o_vibrato_delay_cntr(A6,D6.W)
	MOVE.B    o_vibrato_spd(A6,D6.W),o_vibrato_cntr(A6,D6.W)
	MOVE.B    o_vibrato_startdir(A6,D6.W),D0
.set_vibrato_dir:
	MOVE.B    D0,o_vibrato_dir(A6,D6.W)

	; Retrigger ADSR check
	TST.B     o_reset_adsr_on_note(A6,D6.W)
	BEQ       skip_adsr_reset

	; Copy the instrument settings into current values
	MOVE.B    o_start_adsr_step(A6,D6.W),o_adsr_step(A6,D6.W)

	; Get the right speed for the starting ADSR step
	MOVE.B    o_attack_spd(A6,D6.W),D0
	TST.B     o_adsr_step(A6,D6.W)
	BEQ       .in_attack				; if in attack, we're done
	MOVE.B    o_decay_spd(A6,D6.W),D0
.in_attack:
	MOVE.B    D0,o_env_counter(A6,D6.W)
	MOVE.B    o_instr_volume(A6,D6.W),o_volume(A6,D6.W)
skip_adsr_reset:
	TST.B     o_fixed_period_time(A6,D6.W)
	BEQ       channel_done

	; Write fixed period to YM
	MOVE.B    o_fixed_period_time(A6,D6.W),o_skip_update_counter(A6,D6.W)
	MOVE.B    o_fixed_mixer(A6,D6.W),o_mixer(A6,D6.W)
	BSR       generate_mixer
	
	; Write fixed period values to YM.
	MOVE.B    o5_fixed_period_lo(A6,D5.W),D2   	; write the period again?
	MOVE.B    D6,D0
	ASL.B     #1,D0
	BSR       write_ym_reg
	MOVE.B    o5_fixed_period_hi(A6,D5.W),D2
	MOVE.B    D6,D0
	ASL.B     #1,D0
	ADDQ.B    #1,D0
	BSR       write_ym_reg
channel_done:
	RTS

; =============================================================================
cmd_0_start_loop:					; START LOOP
	MOVE.B    (A0)+,o_loop_cnt(A6,D6.W)		; Byte 1: loop counter
	MOVE.L    A0,o4_loop_addr(A6,D4.W)		; Save this loop address
	BRA       fetch_cmd

; =============================================================================
cmd_1_end_loop:						; END LOOP
	SUBQ.B    #1,o_loop_cnt(A6,D6.W)    		; decrement looper
	BEQ       fetch_cmd				; loop done, go to next command, or ...
	MOVEA.L   o4_loop_addr(A6,D4.W),A0    		; ... restore command position to start of loop
	BRA       fetch_cmd

; =============================================================================
cmd_2_default_note_time:
	MOVE.B    (A0)+,o_default_note_time(A6,D6.W)
	BRA       fetch_cmd

; =============================================================================
cmd_3_stop:
	ADDQ.B    #1,o_channel_stop(A6,D6.W) 		; add to channel delay?
	BRA       channel_done

; =============================================================================
cmd_10_jump:						; jump to position
	MOVE.B    (A0)+,tmp_swap_2			; fetch new offset-address (little-endian)
	MOVE.B    (A0)+,tmp_swap_1
	CLR.L     D0
	MOVE.W    tmp_swap_1,D0				; swizzle
	SUBI.L    #0,D0
	ADDI.L    #tune_start_table,D0			; generate absolute address
	MOVEA.L   D0,A0
	BRA       fetch_cmd

; =============================================================================
cmd_4_gosub:
	BSR       get_ch_cmd_start			; read 2 bytes and generate an addr in d1
	MOVEA.L   o4_cmd_stack(A6,D4.W),A1
	MOVE.L    A0,-(A1)				; save current cmd pointer on stack
	MOVE.L    A1,o4_cmd_stack(A6,D4.W)		; save stack position
	MOVEA.L   D1,A0					; change cmd pointer
	BRA       fetch_cmd

; =============================================================================
cmd_5_return:						; pop cmd stack
	MOVEA.L   o4_cmd_stack(A6,D4.W),A1		; restore command position
	MOVEA.L   (A1)+,A0
	MOVE.L    A1,o4_cmd_stack(A6,D4.W)
	BRA       fetch_cmd

; =============================================================================
cmd_6_set_transpose:
	MOVE.B    (A0)+,o_note_transpose(A6,D6.W)
	BRA       fetch_cmd

; =============================================================================
cmd_8_direct_write:			
	; Write directly to a register.
	; Used for things like noise frequency
	MOVE.B    (A0)+,D0
	MOVE.B    (A0)+,D2
	CMP.B     #7,D0				; Mixer reg? Special case
	BNE       .not_mixer

	; Mixer value needs to be saved since it's needed elsewhere
	MOVE.B    D2,D0
	MOVE.B    D0,o_mixer(A6,D6.W)  		; save written mixer
	MOVE.B    D0,o_instr_mixer(A6,D6.W)    	; save written mixer
	BSR       generate_mixer
	BRA       fetch_cmd
.not_mixer:
	BSR       write_ym_reg
	BRA       fetch_cmd

; =============================================================================
cmd_9_set_adsr:							; Set instrument envelope
	MOVE.B    (A0),D0					; 4:4
	LSR.B     #4,D0
	MOVE.B    D0,o_instr_volume(A6,D6.W)
	MOVE.B    (A0)+,D0
	ANDI.B    #$F,D0
	MOVE.B    D0,o_instr_min_volume(A6,D6.W)
	MOVE.B    (A0),D0             ; 4:4
	LSR.B     #4,D0
	MOVE.B    D0,o_attack_spd(A6,D6.W)
	MOVE.B    (A0)+,o_decay_spd(A6,D6.W)
	ANDI.B    #$F,o_decay_spd(A6,D6.W)
	MOVE.B    (A0)+,o_start_adsr_step(A6,D6.W) ;byte
	BRA       fetch_cmd

; =============================================================================
; The rest of the routine is the commands which provide control flow and
; persistent state setup.
; =============================================================================
cmd_a_set_adsr_reset:
	; Controls whether a new note resets envelope
	; (used for custom pitch effects after initial envelope trigger)
	MOVE.B    (A0)+,o_reset_adsr_on_note(A6,D6.W)
	BRA       fetch_cmd

; =============================================================================
cmd_b_set_arpeggio:
	MOVE.B    (A0)+,o_arp_delta(A6,D6.W)
	MOVE.B    (A0)+,o_arp_spd_up(A6,D6.W)
	MOVE.B    (A0)+,o_arp_spd_down(A6,D6.W)
	BRA       fetch_cmd

; =============================================================================
cmd_c_set_slide:
	MOVE.B    (A0)+,o_slide_delta(A6,D6.W)
	BRA       fetch_cmd

; =============================================================================
cmd_d_set_vibrato:
	MOVE.B    (A0)+,o_vibrato_delay(A6,D6.W)
	MOVE.B    (A0)+,o_vibrato(A6,D6.W)
	MOVE.B    (A0)+,o_vibrato_spd(A6,D6.W)
	MOVE.B    (A0)+,o_vibrato_startdir(A6,D6.W)
	BRA       fetch_cmd

; =============================================================================
cmd_e_skip_transpose:
	; Skips transposing the *next note only*
	MOVE.B    #-1,o_skip_transpose(A6,D6.W)
	BRA       fetch_cmd

; =============================================================================
cmd_f_set_fixfreq:
	; This turns fixed period on and off
	MOVE.B    (A0)+,o_fixed_period_time(A6,D6.W)
	BNE       .fixedfreq_on
	; Fixed period is turned off, go back to dynamic
	MOVE.B    o_instr_mixer(A6,D6.W),o_mixer(A6,D6.W)
	BSR       generate_mixer
	BRA       fetch_cmd
.fixedfreq_on:
	MOVE.B    (A0)+,o_fixed_mixer(A6,D6.W)		; mixer value
	MOVE.B    (A0)+,o5_fixed_period_hi(A6,D5.W)	; I think this might be fixed period
	MOVE.B    (A0)+,o5_fixed_period_lo(A6,D5.W)
	BRA       fetch_cmd

; =============================================================================
cmd_7_set_raw_detune:
	; Add a fixed value to the note's YM period
	MOVE.B    (A0)+,o_raw_period_adj(A6,D6.W)
	BRA       fetch_cmd

; =============================================================================
cmd_12_set_nomute:
	MOVE.B    (A0)+,o_nomute(A6,D6.W)
	BRA       fetch_cmd

; =============================================================================
cmd_11_set_mute_time:
	; This had to be located in Hatari since Easy Rider missed it
	; Set time before full mute is applied
	move.b    (a0)+,o_mute_time(A6,D6.W)
	bra       fetch_cmd

; These are the stack areas used by gosub/return
	  DCB.L	4,0
channel_a_stack_start:			; Channel A stack pos

	  DCB.L	4,0
channel_b_stack_start:			; Channel B stack pos

	  DCB.L	4,0
channel_c_stack_start:			; Channel C stack pos

; Mystery unused bytes
	  DC.B      $00,$00,$00,$00
	  DCB.W     4,0

channel_delay_mask:
	  DC.B      $FF,$00

jmptable:
	; Jump table to the commands.
	DC.L	cmd_0_start_loop 	;+ 1 byte  set loop
	DC.L	cmd_1_end_loop 		;+ 0 byte
	DC.L	cmd_2_default_note_time ;+ 1 byte  set_note_encoding
	DC.L	cmd_3_stop 		;+ 0 byte
	DC.L	cmd_4_gosub 		;+ 2 byte  gosub_pos
	DC.L	cmd_5_return 		;+ 0 byte  return
	DC.L	cmd_6_set_transpose 	;+ 1 byte  set_transpose
	DC.L	cmd_7_set_raw_detune 	;+ 1 byte  set_period_adjust
	DC.L	cmd_8_direct_write 	;+ 2 bytes direct reg write
	DC.L	cmd_9_set_adsr 		;+ 3 byte
	DC.L	cmd_a_set_adsr_reset 	;+ 1 byte
	DC.L	cmd_b_set_arpeggio 	;+ 3 bytes
	DC.L	cmd_c_set_slide 	;+ 1 byte
	DC.L	cmd_d_set_vibrato 	;+ 4 bytes vibrato
	DC.L	cmd_e_skip_transpose 	;+ 0
	DC.L	cmd_f_set_fixfreq 	;+ 1 byte (if 0), else 4 bytes
	DC.L	cmd_10_jump		;+ 2 bytes   jump_to_pos
	DC.L	cmd_11_set_mute_time	;+ 1 byte
	DC.L	cmd_12_set_nomute	;+ 1 byte

; Runtime variable area.
; In the update function, these are all referenced relative to "a6_base"
	DC.B	$00,$00

L70EC4   DCB.W     3,0
L70ECA   DC.B      $01,$00,$00,$00,$00,$00,$00,$00
L70ED2   DC.B      $FD,$F5,$E8,$00,$00,$00,$00,$00
L70EDA:  DC.B      $00,$00,$01,$00
L70EDE:  DC.B      $00,$00,$02,$00
L70EE2   DC.B      $00,$00,$05,$00,$48,$15,$37,$00
L70EEA:  DC.B      0,0,0,0
L70EEE   DC.B      $00,$37,$01,$00,$00,$00,$00,$00
L70EF6   DC.B      $07,$09,$03,$00,$00,$00,$00,$00
L70EFE   DC.B      $01,$01,$00,$00,$01,$01,$01,$00
L70F06   DC.B      $0B,$0F,$0D,$00,$03,$00,$0A,$00
L70F0E:  DC.B      $00,$FB,$FE,$00
L70F12:	 DC.B      $00,$00,$00,$00
L70F16:  DC.B      $00,$00,$04,$00
	 DC.B	   $00,$02,$20,$00

L70F1E  DC.B      $FF
L70F1F  DC.B      $FF
L70F20  DC.B      $FF
	DC.B      $00,$08,$10,$20,$00
L70F26  DC.B      $FC,$FC,$FE,$00,$FF,$FF,$FF,$00
L70F2E  DC.B      $0A,$0E,$0C,$00
L703F2	DC.B	$FF
L703F3	DC.B	$FF
L703F4	DC.B	$FF
		DC.B	$00
L70F36      DC.B      $00,$02,$00,$00,$00,$00,$00,$00
L70F3E      DC.B      $FF,$FF,$FF,$00

; This is the base area used for the runtime variables
a6_base:
L70F42:
tune_base_a	DC.B	    $00,$07,$1F,$13		; +0
tune_base_b     DC.B        $00,$07,$1F,$C3		; +4
tune_base_c	DC.B	    $00,$07,$1F,$73		; +8

	DCB.W     2,0
	DC.B      $00,$07,$1E,$8C,$00,$07,$1C,$2F
	DC.B      $00,$07,$1F,$6E,$00,$00,$00,$00
	DCB.W     8,0
	DC.B      $00,$07,$0E,$48,$00,$07,$0E,$58
	DC.B      $00,$07,$0E,$60,$00,$00,$00,$00
	DC.B      $00,$00,$01,$00,$AA,$AA,$00,$00
	DC.B      $00,$35,$02,$38,$00,$8E,$00,$00
	DC.B      0,0,0,0,0,0,0,0
	DC.B	    0,0
	DC.B      $02,$00
;a6_base+$5c
      DC.B      $08,$02,$20,$00,$02,$01             ; mixer info
	DC.B      $01,$00,$00,$00,$01,$00,$00,$00
	DC.B      $00,$00,$00,$01,$0A,$00,$00,$00
	DC.W      0
	DCB.W     390,0

tune_id:	  DC.B	$00,$02
temp_d2_store:    DC.B	$00,$06
		  DC.B	$89,$0A

tmp_swap_1:			  DC.B      $0C
tmp_swap_2:			  DC.B      $4A
		DC.B      $00,$00

; The second of these values appears to be used as alternative mixer values for
; muting.
; The first value seems to be unused.
mixer_mute_table:
	DC.B      $36,$09	; %1001 force mute on noise and square
	DC.B      $2D,$12
	DC.B	  $1B,$24

; Standard YM note -> period table.
; For each byte pair, the first byte is the high period value, the second
; is the low value. So the first note here (C#0) is $0eee.
; The table has 24*4 = 96 entries, or 8 octaves of 12 notes.
; (You can see the period halve for each octave.)
note_table:
	DC.B      $0E,$EE,$0E,$18,$0D,$4D,$0C,$8E	; Octave 0
	DC.B      $0B,$DA,$0B,$2F,$0A,$8F,$09,$F7
	DC.B      $09,$68,$08,$E1,$08,$61,$07,$E9

	DC.B      $07,$77,$07,$0C,$06,$A7,$06,$47	; Octave 1
	DC.B      $05,$ED,$05,$98,$05,$47,$04,$FC
	DC.B      $04,$B4,$04,$70,$04,$31,$03,$F4

	DC.B      $03,$BC,$03,$86,$03,$53,$03,$24	; Octave 2
	DC.B      $02,$F6,$02,$CC,$02,$A4,$02,$7E
	DC.B      $02,$5A,$02,$38,$02,$18,$01,$FA

	DC.B      $01,$DE,$01,$C3,$01,$AA,$01,$92	; Octave 3
	DC.B      $01,$7B,$01,$66,$01,$52,$01,$3F
	DC.B      $01,$2D,$01,$1C,$01,$0C,$00,$FD

	DC.B      $00,$EF,$00,$E1,$00,$D5,$00,$C9	; Octave 4
	DC.B      $00,$BE,$00,$B3,$00,$A9,$00,$9F
	DC.B      $00,$96,$00,$8E,$00,$86,$00,$7F

	DC.B      $00,$77,$00,$71,$00,$6A,$00,$64	; Octave 5
	DC.B      $00,$5F,$00,$59,$00,$54,$00,$50
	DC.B      $00,$4B,$00,$47,$00,$43,$00,$3F

	DC.B      $00,$3C,$00,$38,$00,$35,$00,$32	; Octave 6
	DC.B      $00,$2F,$00,$2D,$00,$2A,$00,$28
	DC.B      $00,$26,$00,$24,$00,$22,$00,$20

	DC.B      $00,$1E,$00,$1C,$00,$1B,$00,$19	; Octave 7
	DC.B      $00,$18,$00,$16,$00,$15,$00,$14
	DC.B      $00,$13,$00,$12,$00,$11,$00,$10

; All the data after this is the tune.

tune_start_table:
	DC.B      $40,$16,$07,$0B			;Mystery header, seemingly unused.

; Offsets from tune_start_table to the data for each tune's channel, in low-endian byte-pairs.
; It looks like the valid start slots here are 0-6 (entries 7/8/9 look like dummy values)
channel_a_start_table:
	DC.B	$63,$02
	DC.B	$DA,$07 			;start 0 = $263 = 715F5
	DC.B	$98,$0A
	DC.B	$62,$02
	DC.B	$62,$02
	DC.B	$62,$02
	DC.B    $8B,$15
	DC.B	$07,$00
	DC.B	$08,$00
	DC.B	$09,$00
channel_b_start_table:
	DC.B	$4E,$03 	;start 0 = $34e
	DC.B	$60,$08
	DC.B	$01,$0B
	DC.B	$66,$0C
	DC.B	$68,$0E
	DC.B	$B8,$11
	DC.B	$B1,$15
	DC.B	$07,$00
	DC.B	$08,$00
	DC.B	$09,$00
channel_c_start_table
	DC.B	$45,$05
	DC.B	$C6,$08 			;start 0 = $545
	DC.B	$3D,$0B
	DC.B	$DB,$0C
	DC.B	$28,$0F
	DC.B	$50,$12
	DC.B	$D4,$15
	DC.B	$07,$00
	DC.B	$08,$00
	DC.B	$09,$00

; Lookup into SFX data, done in the same way as tunes.
sfx_table:
	DC.B      $56,$00,$5A,$00,$5E,$00,$62,$00
	DC.B      $6C,$00,$70,$00,$74,$00,$78,$00
	DC.B      $7C,$00,$80,$00,$84,$00,$00,$88
	DC.B      $00,$FF,$00,$A4,$00,$FF,$00,$C8
	DC.B      $00,$FF,$00,$E3,$00,$02,$04,$01
	DC.B      $04,$27,$01,$FF,$00,$4E,$01,$FF
	DC.B      $00,$70,$01,$FF,$00,$B3,$01,$FF
	DC.B      $00,$D8,$01,$FF,$00,$F6,$01,$FF
	DC.B      $00,$22,$02,$FF,$00,$39,$02,$FF
	DC.B      $8D,$01,$07,$00,$01,$91,$FF,$92
	DC.B      $FF,$8A,$01,$88,$07,$08,$89,$F0
	DC.B      $03,$01,$3C,$01,$80,$08,$41,$0A
	DC.B      $8A,$00,$81,$83,$8D,$00,$00,$00
	DC.B      $00,$91,$FF,$92,$FF,$8A,$01,$88
	DC.B      $07,$01,$88,$06,$1F,$89,$C0,$01
	DC.B      $01,$50,$0E,$89,$90,$01,$01,$50
	DC.B      $0E,$89,$00,$00,$01,$1E,$02,$83
	DC.B      $8D,$01,$01,$00,$00,$91,$FF,$92
	DC.B      $FF,$8A,$01,$88,$07,$08,$89,$CC
	DC.B      $00,$01,$50,$0A,$89,$00,$00,$01
	DC.B      $5A,$02,$83,$8D,$01,$01,$00,$01
	DC.B      $91,$FF,$92,$FF,$8A,$01,$88,$07
	DC.B      $08,$89,$EE,$00,$01,$4B,$1E,$88
	DC.B      $07,$01,$88,$06,$1F,$89,$E0,$07
	DC.B      $01,$5A,$80,$83,$8D,$01,$01,$00
	DC.B      $01,$91,$FF,$92,$FF,$8A,$01,$89
	DC.B      $BB,$00,$01,$88,$07,$12,$32,$0A
	DC.B      $88,$07,$10,$4B,$1E,$88,$07,$02
	DC.B      $89,$B0,$07,$01,$5A,$80,$83,$8D
	DC.B      $01,$01,$00,$01,$8B,$00,$00,$00
	DC.B      $91,$FF,$92,$FF,$8A,$01,$88,$07
	DC.B      $24,$89,$88,$00,$01,$32,$14,$88
	DC.B      $07,$20,$4B,$1E,$88,$07,$04,$89
	DC.B      $80,$07,$01,$5A,$80,$83,$8D,$00
	DC.B      $00,$00,$00,$91,$14,$92,$FF,$8A
	DC.B      $01,$88,$07,$08,$89,$EE,$00,$01
	DC.B      $80,$03,$3C,$32,$81,$91,$FF,$48
	DC.B      $32,$89,$00,$00,$01,$48,$04,$83
	DC.B      $8D,$00,$00,$00,$00,$91,$FF,$92
	DC.B      $FF,$8B,$00,$00,$00,$8A,$01,$88
	DC.B      $07,$01,$89,$EE,$00,$01,$88,$06
	DC.B      $0F,$50,$04,$88,$06,$1E,$50,$14
	DC.B      $89,$E0,$01,$02,$88,$06,$1B,$50
	DC.B      $04,$8A,$00,$88,$06,$19,$50,$04
	DC.B      $88,$06,$17,$50,$04,$88,$06,$15
	DC.B      $50,$04,$8A,$01,$89,$00,$00,$01
	DC.B      $1E,$04,$83,$8D,$00,$00,$00,$00
	DC.B      $8B,$00,$00,$00,$91,$06,$92,$FF
	DC.B      $8A,$01,$88,$07,$08,$89,$F0,$01
	DC.B      $01,$46,$0C,$91,$FF,$4D,$06,$48
	DC.B      $0C,$89,$00,$00,$01,$48,$04,$83
	DC.B      $8D,$01,$01,$00,$00,$91,$FF,$92
	DC.B      $FF,$8A,$01,$88,$07,$08,$89,$D0
	DC.B      $01,$01,$80,$05,$50,$06,$81,$89
	DC.B      $00,$00,$01,$50,$04,$83,$8D,$00
	DC.B      $00,$00,$00,$91,$FF,$92,$FF,$8A
	DC.B      $01,$88,$07,$08,$89,$C0,$03,$01
	DC.B      $8B,$07,$02,$02,$80,$08,$2D,$04
	DC.B      $8A,$00,$31,$04,$32,$04,$39,$04
	DC.B      $3D,$04,$3E,$04,$81,$8B,$00,$00
	DC.B      $00,$83,$8D,$01,$19,$00,$00,$91
	DC.B      $FF,$92,$FF,$8A,$01,$88,$07,$08
	DC.B      $89,$CC,$00,$01,$19,$0C,$90,$34
	DC.B      $02,$8D,$00,$00,$00,$00,$91,$FF
	DC.B      $92,$FF,$8A,$01,$88,$07,$08,$89
	DC.B      $CC,$00,$01,$14,$04,$20,$04,$2C
	DC.B      $04,$38,$04,$16,$04,$22,$04,$2E
	DC.B      $04,$3A,$04,$89,$00,$00,$01,$14
	DC.B      $04,$83,$83

; This is the channel data for channel A of tune 0, at offset $263
;tune_0_channel_a:
        DC.B      $91,$FF,$92,$FF,$8A
	DC.B      $01,$89,$DD,$00,$01,$88,$07,$08
	DC.B      $84,$1C,$07,$86,$03,$84,$2E,$07
	DC.B      $80,$02,$86,$02,$84,$2E,$07,$86
	DC.B      $FD,$84,$2E,$07,$81,$86,$00,$82
	DC.B      $02,$89,$F0,$02,$01,$80,$07,$84
	DC.B      $B4,$07,$84,$D5,$06,$84,$E6,$06
	DC.B      $84,$D5,$06,$84,$E6,$06,$84,$D5
	DC.B      $06,$84,$D5,$06,$8B,$F4,$01,$01
	DC.B      $81,$80,$02,$84,$C7,$07,$84,$D5
	DC.B      $06,$84,$E6,$06,$84,$D5,$06,$84
	DC.B      $E6,$06,$84,$D5,$06,$84,$D5,$06
	DC.B      $81,$84,$C7,$07,$86,$07,$84,$99
	DC.B      $06,$84,$99,$06,$84,$AA,$06,$86
	DC.B      $05,$84,$99,$06,$84,$99,$06,$84
	DC.B      $AA,$06,$80,$04,$86,$03,$84,$B4
	DC.B      $07,$86,$01,$84,$C7,$07,$81,$80
	DC.B      $02,$86,$FF,$84,$B4,$07,$86,$01
	DC.B      $84,$C7,$07,$81,$80,$04,$86,$03
	DC.B      $84,$B4,$07,$86,$01,$84,$C7,$07
	DC.B      $81,$8B,$00,$00,$00,$80,$02,$86
	DC.B      $F7,$84,$B4,$07,$86,$F5,$84,$C7
	DC.B      $07,$86,$F3,$84,$B4,$07,$86,$F5
	DC.B      $84,$C7,$07,$81,$88,$07,$09,$82
	DC.B      $00,$32,$0F,$88,$07,$08,$89,$BB
	DC.B      $00,$01,$82,$04,$80,$03,$86,$05
	DC.B      $84,$2E,$07,$86,$03,$84,$2E,$07
	DC.B      $81,$89,$B0,$0F,$01,$80,$02,$86
	DC.B      $05,$84,$4F,$07,$86,$03,$84,$4F
	DC.B      $07,$81,$88,$07,$09,$83
;tune 0 channel B start
	DC.B      $91,$FF 				
	DC.B      $92,$FF
	DC.B      $8A,$01
	DC.B      $88,$07,$12
	DC.B      $32,$0F
	DC.B      $88,$07,$10
	DC.B	  $89,$AA
	DC.B	  $00,$01
	DC.B      $84,$1C,$07,$86,$03,$84,$2E,$07
	DC.B      $86,$02,$84,$2E,$07,$86,$FD,$84
	DC.B      $2E,$07,$86,$02,$84,$2E,$07,$86
	DC.B      $FD,$44,$45,$44,$40,$3D,$3B,$39
	DC.B      $38,$34,$31,$2F,$2D,$2C,$28,$25
	DC.B      $23,$21,$23,$25,$28,$2C,$2D,$2F
	DC.B      $31,$34,$38,$39,$3B,$82,$00,$39
	DC.B      $01,$89,$DD,$00,$01,$82,$04,$80
	DC.B      $02,$86,$02,$84,$93,$07,$86,$FD
	DC.B      $84,$93,$07,$8B,$0C,$01,$03,$81
	DC.B      $82,$00,$8C,$02,$89,$FF,$00,$01
	DC.B      $8B,$00,$00,$00,$86,$00,$8D,$10
	DC.B      $03,$03,$00,$80,$02,$3A,$08,$38
	DC.B      $08,$36,$08,$38,$08,$36,$08,$35
	DC.B      $08,$33,$10,$35,$10,$36,$10,$33
	DC.B      $08,$31,$08,$2F,$10,$31,$10,$33
	DC.B      $08,$31,$10,$36,$18,$38,$10,$35
	DC.B      $10,$3D,$20,$81,$8C,$00,$89,$EE
	DC.B      $00,$01,$8B,$13,$01,$FF,$80,$05
	DC.B      $3D,$08,$3A,$08,$36,$08,$81,$3A
	DC.B      $08,$80,$05,$3D,$08,$38,$08,$35
	DC.B      $08,$81,$38,$08,$80,$05,$3A,$08
	DC.B      $36,$08,$33,$08,$81,$36,$08,$80
	DC.B      $05,$38,$08,$35,$08,$31,$08,$81
	DC.B      $35,$08,$91,$40,$36,$60,$38,$20
	DC.B      $35,$60,$31,$20,$33,$40,$34,$10
	DC.B      $33,$10,$36,$20,$35,$40,$31,$40
	DC.B      $36,$60,$38,$20,$35,$60,$31,$20
	DC.B      $33,$40,$34,$10,$33,$10,$34,$20
	DC.B      $91,$FF,$36,$80,$82,$04,$86,$FE
	DC.B      $84,$93,$07,$86,$FC,$84,$93,$07
	DC.B      $8B,$00,$00,$00,$86,$00,$82,$00
	DC.B      $89,$99,$CC,$00,$8D,$00,$00,$00
	DC.B      $00,$8B,$3C,$02,$0E,$12,$80,$13
	DC.B      $80,$8B,$00,$00,$00,$89,$EE,$00
	DC.B      $01,$80,$02,$42,$20,$43,$10,$42
	DC.B      $10,$3E,$20,$42,$20,$40,$1D,$3E
	DC.B      $03,$3B,$1D,$3C,$03,$3E,$1D,$3B
	DC.B      $03,$39,$20,$86,$F4,$8B,$13,$01
	DC.B      $0F,$81,$8B,$00,$00,$00,$86,$00
	DC.B      $8C,$01,$89,$AE,$00,$00,$8D,$20
	DC.B      $01,$03,$00,$39,$80,$37,$20,$39
	DC.B      $20,$35,$20,$37,$20,$39,$40,$3A
	DC.B      $40,$3C,$40,$37,$40,$89,$E0,$0F
	DC.B      $01,$8B,$F4,$03,$02,$8D,$00,$00
	DC.B      $00,$00,$8C,$00,$39,$80,$37,$20
	DC.B      $39,$20,$36,$20,$37,$20,$39,$40
	DC.B      $3B,$40,$3C,$40,$37,$40,$8B,$18
	DC.B      $02,$01,$89,$E0,$0A,$01,$82,$40
	DC.B      $36,$32,$34,$2F,$31,$2D,$2F,$2B
	DC.B      $82,$04,$89,$EE,$00,$01,$80,$02
	DC.B      $8B,$00,$00,$00,$86,$05,$84,$2E
	DC.B      $07,$8B,$13,$01,$FF,$86,$03,$84
	DC.B      $93,$07,$8B,$00,$00,$00,$86,$01
	DC.B      $84,$2E,$07,$8B,$13,$01,$FF,$86
	DC.B      $03,$84,$93,$07,$81,$8B,$00,$00
	DC.B      $00,$82,$04,$80,$03,$86,$05,$84
	DC.B      $2E,$07,$86,$03,$84,$2E,$07,$81
	DC.B      $89,$E0,$0F,$01,$80,$02,$86,$05
	DC.B      $84,$4F,$07,$86,$03,$84,$4F,$07
	DC.B      $81,$88,$07,$12,$83,$91,$FF,$92
	DC.B      $FF,$8A,$01,$88,$07,$24,$32,$1E
	DC.B      $88,$06,$19,$88,$07,$00,$89,$88
	DC.B      $00,$01,$84,$1C,$07,$86,$03,$44
	DC.B      $45,$44,$40,$3D,$3B,$39,$38,$34
	DC.B      $31,$2F,$2D,$2C,$28,$25,$23,$21
	DC.B      $23,$25,$28,$82,$00,$34,$02,$89
	DC.B      $90,$20,$00,$86,$00,$1E,$10,$88
	DC.B      $07,$20,$88,$06,$0F,$89,$F0,$02
	DC.B      $01,$8F,$01,$04,$01,$01,$80,$1C
	DC.B      $84,$62,$06,$81,$80,$02,$86,$FB
	DC.B      $84,$62,$06,$84,$62,$06,$86,$00
	DC.B      $84,$62,$06,$84,$62,$06,$81,$86
	DC.B      $FE,$84,$62,$06,$84,$62,$06,$86
	DC.B      $00,$84,$62,$06,$84,$62,$06,$86
	DC.B      $FE,$84,$79,$06,$84,$79,$06,$86
	DC.B      $00,$84,$79,$06,$84,$79,$06,$86
	DC.B      $FE,$84,$79,$06,$84,$79,$06,$86
	DC.B      $00,$84,$62,$06,$86,$FE,$84,$62
	DC.B      $06,$80,$08,$86,$FC,$84,$62,$06
	DC.B      $84,$62,$06,$81,$86,$F8,$84,$62
	DC.B      $06,$84,$62,$06,$86,$F7,$84,$62
	DC.B      $06,$84,$62,$06,$86,$F8,$84,$62
	DC.B      $06,$84,$62,$06,$86,$FA,$84,$62
	DC.B      $06,$86,$F7,$84,$62,$06,$80,$04
	DC.B      $86,$FC,$84,$62,$06,$84,$62,$06
	DC.B      $81,$80,$02,$86,$FC,$84,$79,$06
	DC.B      $84,$79,$06,$86,$FA,$84,$79,$06
	DC.B      $84,$79,$06,$81,$80,$02,$86,$FC
	DC.B      $84,$62,$06,$84,$62,$06,$84,$62
	DC.B      $06,$84,$62,$06,$86,$F8,$84,$62
	DC.B      $06,$84,$62,$06,$86,$03,$84,$62
	DC.B      $06,$84,$62,$06,$81,$86,$FC,$80
	DC.B      $10,$12,$08,$12,$08,$84,$F3,$06
	DC.B      $10,$08,$81,$89,$F0,$0F,$01,$80
	DC.B      $04,$12,$80,$8A,$00,$81,$88,$07
	DC.B      $24,$83,$12,$08,$12,$08,$84,$F3
	DC.B      $06,$19,$04,$19,$04,$12,$08,$12
	DC.B      $08,$84,$F3,$06,$1E,$04,$19,$04
	DC.B      $85,$12,$08,$12,$08,$84,$F3,$06
	DC.B      $88,$07,$24,$12,$04,$19,$04,$12
	DC.B      $08,$12,$08,$84,$F3,$06,$88,$07
	DC.B      $24,$1E,$04,$19,$04,$88,$07,$20
	DC.B      $85,$3A,$8A,$00,$3B,$3F,$42,$3A
	DC.B      $3B,$3F,$42,$3A,$3B,$3F,$42,$8A
	DC.B      $01,$85,$3A,$8A,$00,$3B,$3F,$42
	DC.B      $3A,$3B,$3F,$42,$8A,$01,$85,$36
	DC.B      $8A,$00,$3B,$3F,$42,$36,$3B,$3F
	DC.B      $42,$36,$3B,$3F,$42,$8A,$01,$85
	DC.B      $36,$8A,$00,$3B,$3F,$42,$36,$3B
	DC.B      $3F,$42,$8A,$01,$85,$38,$8A,$00
	DC.B      $3A,$3D,$41,$38,$3A,$3D,$41,$38
	DC.B      $3A,$3D,$41,$8A,$01,$85,$38,$8A
	DC.B      $00,$3A,$3D,$41,$38,$3A,$3D,$41
	DC.B      $8A,$01,$85,$88,$07,$00,$8F,$00
	DC.B      $88,$06,$09,$89,$F0,$01,$01,$8E
	DC.B      $8D,$01,$14,$00,$01,$26,$08,$8D
	DCB.W     2,0
	DC.B      $88,$07,$20,$89,$F0,$02,$01,$88
	DC.B      $06,$0F,$8F,$01,$04,$01,$01,$85
	DC.B      $82,$04,$86,$09,$84,$2E,$07,$86
	DC.B      $07,$84,$2E,$07,$86,$05,$84,$2E
	DC.B      $07,$85,$44,$45,$44,$40,$3D,$3B
	DC.B      $39,$38,$34,$31,$2F,$2D,$2C,$28
	DC.B      $25,$23,$21,$23,$25,$28,$2C,$2D
	DC.B      $2F,$31,$34,$38,$39,$3B,$3D,$40
	DC.B      $44,$45,$85,$44,$8A,$00,$45,$44
	DC.B      $40,$3D,$3B,$39,$38,$34,$31,$2F
	DC.B      $2D,$2C,$28,$25,$23,$21,$23,$25
	DC.B      $28,$2C,$2D,$2F,$31,$34,$38,$39
	DC.B      $3B,$3D,$40,$44,$45,$85,$43,$45
	DC.B      $43,$40,$3C,$3B,$39,$37,$34,$30
	DC.B      $2F,$2D,$2B,$28,$24,$23,$21,$23
	DC.B      $24,$28,$2B,$2D,$2F,$30,$34,$37
	DC.B      $39,$3B,$3C,$40,$43,$45,$85,$25
	DC.B      $21,$23,$21,$25,$23,$28,$25,$2C
	DC.B      $28,$2D,$2C,$2F,$2D,$31,$2F,$34
	DC.B      $31,$38,$34,$39,$38,$3B,$39,$3D
	DC.B      $3B,$40,$3D,$44,$40,$45,$44,$85
	DC.B      $84,$99,$06,$84,$AA,$06,$84,$99
	DC.B      $06,$84,$AA,$06,$84,$99,$06,$84
	DC.B      $99,$06,$85,$84,$B7,$06,$84,$C8
	DC.B      $06,$84,$B7,$06,$84,$C8,$06,$84
	DC.B      $B7,$06,$84,$B7,$06,$85,$8A,$01
	DC.B      $91,$FF,$92,$01,$89,$EE,$00,$01
	DC.B      $88,$07,$08,$3A,$0C,$38,$06,$91
	DC.B      $06,$3A,$2A,$91,$FF,$89,$BB,$00
	DC.B      $01,$8D,$12,$02,$03,$00,$91,$06
	DC.B      $3A,$12,$3F,$12,$91,$FF,$3C,$3C
	DC.B      $89,$EE,$00,$01,$2E,$06,$33,$1E
	DC.B      $31,$0C,$30,$06,$91,$06,$2E,$0C
	DC.B      $91,$FF,$2C,$12,$91,$06,$2E,$0C
	DC.B      $91,$FF,$89,$BB,$00,$01,$91,$06
	DC.B      $3A,$0C,$3D,$06,$41,$0C,$91,$FF
	DC.B      $89,$EE,$00,$01,$3F,$42,$3F,$0C
	DC.B      $3D,$0C,$3F,$0C,$41,$C0,$41,$60
	DC.B      $8D,$00,$00,$00,$00,$8B,$01,$03
	DC.B      $03,$41,$60,$8B,$00,$00,$00,$84
	DC.B      $8E,$09,$8B,$18,$01,$0B,$84,$8E
	DC.B      $09,$8B,$00,$00,$00,$91,$FF,$82
	DC.B      $00,$41,$18,$83,$91,$FF,$92,$01
	DC.B      $8A,$01,$88,$07,$10,$89,$F0,$01
	DC.B      $01,$8F,$02,$02,$01,$01,$86,$F9
	DC.B      $84,$36,$09,$25,$06,$86,$FB,$84
	DC.B      $36,$09,$23,$06,$86,$FE,$84,$36
	DC.B      $09,$20,$06,$86,$FB,$16,$0C,$22
	DC.B      $0C,$84,$DD,$09,$24,$0C,$19,$0C
	DC.B      $25,$0C,$84,$DD,$09,$26,$0C,$80
	DC.B      $03,$86,$00,$84,$68,$09,$21,$06
	DC.B      $86,$FD,$84,$68,$09,$25,$06,$86
	DC.B      $F9,$84,$68,$09,$24,$06,$86,$FC
	DC.B      $84,$78,$09,$1D,$06,$86,$FB,$84
	DC.B      $78,$09,$24,$06,$81,$86,$00,$16
	DC.B      $30,$83,$91,$FF,$92,$01,$8A,$01
	DC.B      $89,$D0,$05,$01,$88,$07,$20,$86
	DC.B      $F9,$84,$3B,$0A,$84,$60,$0A,$86
	DC.B      $FB,$84,$3B,$0A,$84,$60,$0A,$86
	DC.B      $FC,$84,$16,$0A,$84,$60,$0A,$86
	DC.B      $FB,$84,$3B,$0A,$84,$3B,$0A,$80
	DC.B      $03,$86,$00,$84,$16,$0A,$84,$16
	DC.B      $0A,$86,$FD,$84,$3B,$0A,$84,$3B
	DC.B      $0A,$86,$F9,$84,$16,$0A,$84,$16
	DC.B      $0A,$86,$FC,$84,$16,$0A,$86,$FB
	DC.B      $84,$3B,$0A,$81,$86,$00,$82,$02
	DC.B      $92,$FF,$39,$8B,$0C,$01,$01,$8F
	DC.B      $00,$3A,$3C,$3E,$41,$39,$3A,$3C
	DC.B      $3E,$41,$39,$92,$01,$82,$00,$3A
	DC.B      $03,$83,$8F,$02,$02,$01,$01,$22
	DC.B      $0C,$16,$0C,$84,$DD,$09,$8F,$00
	DC.B      $88,$07,$12,$22,$0C,$88,$07,$10
	DC.B      $8F,$02,$02,$01,$01,$16,$0C,$22
	DC.B      $0C,$84,$DD,$09,$8F,$00,$88,$07
	DC.B      $12,$22,$06,$88,$07,$10,$8F,$02
	DC.B      $02,$01,$01,$85,$8F,$02,$02,$01
	DC.B      $01,$16,$0C,$22,$0C,$84,$DD,$09
	DC.B      $8F,$00,$22,$0C,$8F,$02,$02,$01
	DC.B      $01,$16,$0C,$22,$0C,$84,$DD,$09
	DC.B      $8F,$00,$22,$06,$8F,$02,$02,$01
	DC.B      $01,$85,$91,$06,$41,$0C,$3F,$06
	DC.B      $3E,$0C,$3C,$0C,$3A,$0C,$3C,$0C
	DC.B      $91,$1E,$35,$2A,$91,$06,$32,$06
	DC.B      $35,$0C,$37,$0C,$3A,$0C,$3C,$06
	DC.B      $3A,$0C,$91,$1E,$3E,$18,$91,$06
	DC.B      $3E,$06,$3F,$06,$3E,$06,$3A,$0C
	DC.B      $35,$0C,$37,$0C,$35,$06,$37,$0C
	DC.B      $35,$06,$33,$06,$32,$0C,$35,$0C
	DC.B      $36,$06,$35,$0C,$31,$0C,$33,$0C
	DC.B      $31,$0C,$30,$0C,$31,$06,$33,$0C
	DC.B      $85,$8E,$89,$EE,$0F,$01,$8D,$01
	DC.B      $13,$00,$01,$26,$0C,$8D,$00,$00
	DC.B      $00,$00,$89,$F0,$01,$01,$85,$82
	DC.B      $02,$8F,$02,$20,$AA,$AA,$3A,$8B
	DC.B      $0C,$01,$01,$8A,$00,$8F,$00,$3C
	DC.B      $3E,$41,$3A,$3C,$3E,$41,$3A,$3C
	DC.B      $3E,$41,$8A,$01,$82,$00,$84,$70
	DC.B      $0A,$85,$82,$02,$92,$FF,$8F,$02
	DC.B      $20,$AA,$AA,$39,$8B,$0C,$01,$01
	DC.B      $8A,$00,$8F,$00,$3A,$3C,$3E,$41
	DC.B      $39,$3A,$3C,$3E,$41,$39,$3A,$8A
	DC.B      $01,$82,$00,$84,$70,$0A,$85,$82
	DC.B      $02,$92,$FF,$8F,$02,$20,$AA,$AA
	DC.B      $38,$8B,$0C,$01,$01,$8A,$00,$8F
	DC.B      $00,$3C,$3D,$41,$38,$3C,$3D,$41
	DC.B      $38,$3C,$3D,$41,$8A,$01,$82,$00
	DC.B      $84,$70,$0A,$85,$8F,$02,$20,$AA
	DC.B      $AA,$88,$07,$24,$1E,$18,$8F,$00
	DC.B      $84,$70,$0A,$85,$8B,$00,$00,$00
	DC.B      $88,$07,$04,$89,$90,$01,$00,$8D
	DC.B      $01,$C8,$00,$FF,$88,$06,$08,$8E
	DC.B      $49,$18,$88,$06,$03,$88,$07,$20
	DC.B      $8D,$00,$00,$00,$00,$8C,$00,$89
	DC.B      $D0,$05,$01,$85,$8A,$01,$91,$02
	DC.B      $92,$FF,$89,$D0,$0A,$01,$88,$07
	DC.B      $08,$84,$8D,$0B,$84,$8D,$0B,$8B
	DC.B      $00,$00,$00,$89,$A9,$00,$01,$91
	DC.B      $FF,$82,$06,$80,$02,$88,$07,$08
	DC.B      $86,$00,$84,$9A,$0B,$86,$FE,$84
	DC.B      $B3,$0B,$86,$F9,$84,$9A,$0B,$86
	DC.B      $FC,$84,$9A,$0B,$81,$82,$00,$8C
	DC.B      $00,$86,$00,$89,$B0,$09,$01,$86
	DC.B      $00,$80,$02,$45,$0C,$40,$12,$3D
	DC.B      $72,$43,$0C,$40,$12,$3C,$72,$3E
	DC.B      $0C,$3B,$12,$36,$72,$41,$0C,$3E
	DC.B      $12,$39,$72,$81,$80,$04,$84,$5B
	DC.B      $0B,$81,$90,$98,$0A,$8A,$01,$91
	DC.B      $FF,$92,$FF,$88,$06,$02,$88,$07
	DC.B      $10,$8F,$02,$02,$01,$00,$89,$F0
	DC.B      $01,$01,$84,$27,$0C,$18,$0C,$17
	DC.B      $06,$86,$FB,$84,$27,$0C,$1D,$0C
	DC.B      $1A,$06,$86,$F9,$84,$27,$0C,$1C
	DC.B      $0C,$1D,$06,$86,$FE,$84,$27,$0C
	DC.B      $19,$0C,$17,$06,$86,$00,$90,$16
	DC.B      $0B,$8A,$01,$91,$FF,$92,$FF,$88
	DC.B      $07,$20,$89,$D0,$0A,$01,$82,$04
	DC.B      $84,$02,$0C,$84,$02,$0C,$84,$02
	DC.B      $0C,$84,$02,$0C,$90,$4C,$0B,$89
	DC.B      $DC,$00,$01,$84,$7A,$0B,$89,$BA
	DC.B      $00,$01,$84,$7A,$0B,$89,$98,$00
	DC.B      $01,$84,$7A,$0B,$89,$65,$00,$01
	DC.B      $84,$7A,$0B,$4A,$48,$85,$8D,$01
	DC.B      $01,$00,$00,$48,$0A,$8D,$00,$00
	DC.B      $00,$00,$89,$10,$00,$01,$4A,$08
	DC.B      $85,$84,$CC,$0B,$84,$CC,$0B,$84
	DC.B      $CC,$0B,$84,$CC,$0B,$85,$2D,$31
	DC.B      $34,$39,$3D,$40,$45,$40,$3D,$39
	DC.B      $34,$31,$2D,$31,$34,$39,$3D,$40
	DC.B      $45,$40,$3D,$39,$34,$31,$85,$2D
	DC.B      $32,$36,$39,$3E,$42,$45,$42,$3E
	DC.B      $39,$36,$32,$2D,$32,$36,$39,$3E
	DC.B      $42,$45,$42,$3E,$39,$36,$32,$85
	DC.B      $80,$08,$56,$02,$51,$10,$8A,$00
	DC.B      $81,$8A,$01,$85,$8A,$01,$80,$0B
	DC.B      $32,$8A,$00,$36,$39,$81,$32,$36
	DC.B      $39,$85,$8A,$01,$80,$0B,$32,$8A
	DC.B      $00,$35,$39,$81,$32,$35,$39,$85
	DC.B      $8A,$01,$80,$0B,$31,$8A,$00,$36
	DC.B      $39,$81,$31,$36,$39,$85,$86,$00
	DC.B      $8B,$0C,$02,$02,$84,$F4,$0B,$8B
	DC.B      $05,$02,$02,$86,$FE,$84,$D8,$0B
	DC.B      $8B,$0C,$02,$02,$86,$FD,$84,$E6
	DC.B      $0B,$8B,$07,$02,$02,$86,$FC,$84
	DC.B      $D8,$0B,$85,$1A,$0C,$8A,$00,$1A
	DC.B      $06,$8A,$01,$1A,$0C,$26,$06,$84
	DC.B      $4A,$0C,$1F,$0C,$21,$06,$1A,$0C
	DC.B      $8A,$00,$1A,$06,$8A,$01,$1A,$0C
	DC.B      $26,$06,$84,$4A,$0C,$85,$89,$F0
	DC.B      $01,$01,$88,$07,$02,$88,$06,$0A
	DC.B      $8E,$22,$12,$8B,$00,$00,$00,$88
	DC.B      $07,$10,$89,$F0,$01,$01,$88,$06
	DC.B      $02,$85,$91,$FF,$92,$FF,$88,$07
	DC.B      $10,$8A,$01,$89,$F0,$01,$01,$8F
	DC.B      $02,$02,$01,$01,$80,$06,$86,$FD
	DC.B      $84,$6D,$0D,$86,$FB,$84,$6D,$0D
	DC.B      $81,$80,$02,$86,$00,$84,$94,$0D
	DC.B      $86,$FE,$84,$94,$0D,$86,$FD,$84
	DC.B      $94,$0D,$86,$FB,$84,$94,$0D,$81
	DC.B      $80,$02,$86,$FC,$84,$6D,$0D,$84
	DC.B      $6D,$0D,$84,$6D,$0D,$86,$FA,$84
	DC.B      $BD,$0D,$86,$F7,$84,$BD,$0D,$81
	DC.B      $80,$03,$86,$FA,$84,$6D,$0D,$86
	DC.B      $FC,$84,$BD,$0D,$86,$FB,$84,$BD
	DC.B      $0D,$81,$80,$03,$86,$FA,$84,$6D
	DC.B      $0D,$81,$86,$FB,$84,$BD,$0D,$86
	DC.B      $FC,$84,$BD,$0D,$90,$78,$0C,$91
	DC.B      $FF,$92,$01,$88,$07,$20,$8A,$01
	DC.B      $80,$04,$84,$60,$0A,$81,$80,$02
	DC.B      $84,$24,$0E,$84,$44,$0E,$81,$80
	DC.B      $04,$86,$FD,$84,$D5,$0D,$86,$F9
	DC.B      $84,$16,$0A,$86,$FB,$84,$FF,$0D
	DC.B      $81,$80,$02,$86,$FD,$84,$3B,$0A
	DC.B      $84,$60,$0A,$86,$FB,$84,$3B,$0A
	DC.B      $84,$60,$0A,$86,$FD,$84,$CE,$0D
	DC.B      $86,$FE,$84,$D5,$0D,$81,$80,$02
	DC.B      $86,$F9,$84,$CE,$0D,$86,$FA,$84
	DC.B      $D5,$0D,$86,$FC,$84,$D5,$0D,$86
	DC.B      $F8,$84,$16,$0A,$86,$F9,$84,$DC
	DC.B      $0D,$81,$80,$03,$86,$FA,$84,$16
	DC.B      $0A,$86,$FE,$84,$DC,$0D,$86,$FC
	DC.B      $84,$F3,$09,$86,$F7,$84,$F3,$09
	DC.B      $81,$80,$03,$86,$FA,$84,$16,$0A
	DC.B      $84,$60,$0A,$81,$86,$F7,$84,$F3
	DC.B      $09,$86,$FC,$84,$F3,$09,$90,$E4
	DC.B      $0C,$16,$0C,$22,$0C,$84,$DD,$09
	DC.B      $8F,$00,$22,$06,$8F,$02,$02,$01
	DC.B      $01,$22,$06,$16,$06,$1D,$0C,$22
	DC.B      $06,$84,$DD,$09,$8F,$00,$22,$06
	DC.B      $8F,$02,$02,$01,$01,$1D,$06,$85
	DC.B      $16,$0C,$22,$0C,$84,$DD,$09,$88
	DC.B      $07,$12,$8F,$00,$16,$0C,$8F,$02
	DC.B      $02,$01,$01,$16,$0C,$88,$07,$10
	DC.B      $1D,$06,$16,$06,$84,$DD,$09,$8F
	DC.B      $00,$22,$0C,$8F,$02,$02,$01,$01
	DC.B      $85,$16,$0C,$22,$0C,$84,$DD,$09
	DC.B      $8F,$00,$22,$0C,$8F,$02,$02,$01
	DC.B      $01,$85,$84,$3B,$0A,$84,$3B,$0A
	DC.B      $85,$84,$16,$0A,$84,$16,$0A,$85
	DC.B      $82,$02,$8F,$02,$20,$AA,$AA,$8B
	DC.B      $0C,$01,$01,$3D,$8A,$00,$8F,$00
	DC.B      $3D,$41,$38,$3A,$3D,$41,$38,$3A
	DC.B      $3D,$41,$38,$82,$00,$8A,$01,$84
	DC.B      $70,$0A,$85,$82,$02,$92,$FF,$8F
	DC.B      $02,$20,$AA,$AA,$38,$8B,$0C,$01
	DC.B      $01,$8A,$00,$8F,$00,$3C,$3E,$41
	DC.B      $38,$3C,$3E,$41,$38,$3C,$3E,$41
	DC.B      $82,$00,$8A,$01,$84,$70,$0A,$85
	DC.B      $89,$F0,$00,$01,$88,$07,$04,$8F
	DC.B      $02,$20,$AA,$AA,$55,$0C,$88,$07
	DC.B      $00,$8F,$00,$5A,$06,$5A,$06,$82
	DC.B      $00,$88,$07,$04,$84,$70,$0A,$85
	DC.B      $89,$F0,$00,$01,$88,$07,$00,$8F
	DC.B      $02,$20,$AA,$AA,$5A,$06,$5A,$06
	DC.B      $88,$06,$0C,$89,$F0,$01,$01,$88
	DC.B      $07,$04,$8F,$00,$55,$0C,$82,$00
	DC.B      $84,$70,$0A,$85,$91,$05,$92,$FF
	DC.B      $88,$07,$10,$88,$06,$05,$89,$F0
	DC.B      $00,$01,$8A,$01,$82,$06,$8D,$01
	DC.B      $0A,$03,$00,$80,$08,$84,$C3,$0F
	DC.B      $81,$80,$02,$86,$03,$84,$C3,$0F
	DC.B      $86,$FE,$84,$C3,$0F,$86,$00,$84
	DC.B      $C3,$0F,$86,$00,$84,$C3,$0F,$86
	DC.B      $05,$84,$C3,$0F,$86,$03,$84,$C3
	DC.B      $0F,$86,$00,$84,$C3,$0F,$86,$00
	DC.B      $84,$C3,$0F,$81,$88,$07,$12,$82
	DC.B      $00,$88,$06,$1E,$5A,$0C,$88,$06
	DC.B      $1A,$5A,$0C,$88,$06,$16,$5A,$0C
	DC.B      $88,$06,$12,$5A,$0C,$88,$06,$0E
	DC.B      $5A,$0C,$88,$06,$0A,$5A,$0C,$88
	DC.B      $06,$08,$5A,$0C,$88,$06,$03,$5A
	DC.B      $0C,$80,$08,$86,$00,$84,$16,$10
	DC.B      $84,$16,$10,$86,$FC,$84,$16,$10
	DC.B      $86,$FB,$84,$16,$10,$81,$80,$06
	DC.B      $86,$00,$84,$1D,$10,$86,$FC,$84
	DC.B      $1D,$10,$86,$FE,$84,$1D,$10,$86
	DC.B      $FB,$84,$1D,$10,$81,$80,$07,$86
	DC.B      $00,$84,$1D,$10,$81,$86,$FB,$84
	DC.B      $1D,$10,$80,$07,$86,$F9,$84,$1D
	DC.B      $10,$81,$86,$FB,$84,$1D,$10,$86
	DC.B      $00,$90,$68,$0E,$91,$FF,$92,$FF
	DC.B      $8A,$01,$80,$0D,$84,$CC,$0F,$84
	DC.B      $CC,$0F,$84,$CC,$0F,$84,$F0,$0F
	DC.B      $81,$88,$07,$20,$89,$B0,$08,$01
	DC.B      $82,$02,$80,$02,$86,$00,$84,$7F
	DC.B      $10,$86,$FE,$84,$B4,$10,$86,$03
	DC.B      $84,$B4,$10,$86,$FE,$84,$B4,$10
	DC.B      $8B,$0C,$01,$01,$81,$80,$04,$86
	DC.B      $00,$84,$E9,$10,$86,$01,$84,$F0
	DC.B      $10,$86,$00,$84,$E9,$10,$86,$FE
	DC.B      $84,$F0,$10,$81,$80,$04,$86,$00
	DC.B      $84,$4F,$11,$86,$03,$84,$4F,$11
	DC.B      $86,$05,$84,$4F,$11,$86,$03,$84
	DC.B      $4F,$11,$81,$80,$04,$84,$71,$11
	DC.B      $84,$91,$11,$81,$80,$04,$86,$00
	DC.B      $84,$F7,$10,$86,$FC,$84,$23,$11
	DC.B      $86,$FE,$84,$23,$11,$86,$FB,$84
	DC.B      $F7,$10,$81,$80,$04,$86,$F9,$84
	DC.B      $F0,$10,$86,$F7,$84,$F0,$10,$81
	DC.B      $82,$00,$86,$00,$90,$28,$0F,$0C
	DC.B      $0C,$13,$18,$16,$16,$18,$1B,$85
	DC.B      $8F,$02,$04,$01,$01,$88,$07,$20
	DC.B      $89,$F0,$00,$01,$11,$01,$8F,$00
	DC.B      $8C,$04,$01,$05,$8C,$00,$88,$07
	DC.B      $04,$89,$C0,$00,$01,$5A,$06,$5A
	DC.B      $06,$5A,$06,$85,$8F,$02,$04,$01
	DC.B      $01,$88,$07,$20,$89,$F0,$00,$01
	DC.B      $11,$01,$8F,$00,$8C,$04,$01,$05
	DC.B      $8C,$00,$88,$07,$04,$89,$C0,$00
	DC.B      $01,$5A,$06,$89,$D0,$02,$01,$5A
	DC.B      $0C,$85,$84,$1D,$10,$84,$1D,$10
	DC.B      $85,$8F,$02,$02,$01,$01,$88,$07
	DC.B      $10,$8D,$00,$00,$00,$00,$8E,$89
	DC.B      $F0,$00,$01,$11,$01,$8F,$00,$8E
	DC.B      $8C,$04,$01,$05,$8C,$00,$88,$07
	DC.B      $10,$8D,$01,$07,$03,$00,$1F,$01
	DC.B      $0C,$05,$2B,$01,$18,$0B,$8F,$02
	DC.B      $02,$01,$01,$88,$07,$10,$8D,$00
	DC.B      $00,$00,$00,$8E,$89,$F0,$00,$01
	DC.B      $11,$01,$8F,$00,$8E,$8C,$04,$01
	DC.B      $05,$8C,$00,$88,$07,$10,$8D,$01
	DC.B      $07,$03,$00,$2B,$01,$18,$05,$88
	DC.B      $07,$02,$89,$C0,$00,$01,$5A,$06
	DC.B      $5A,$06,$85,$3C,$8A,$00,$3F,$43
	DC.B      $3C,$3F,$43,$3C,$3F,$43,$3C,$3F
	DC.B      $43,$3C,$3F,$43,$3C,$3F,$43,$3C
	DC.B      $3F,$43,$3C,$3F,$43,$3C,$3F,$43
	DC.B      $3C,$3F,$43,$3C,$3F,$43,$3C,$3F
	DC.B      $43,$3C,$3F,$43,$3C,$3F,$43,$3C
	DC.B      $3F,$43,$3C,$3F,$43,$8A,$01,$85
	DC.B      $3C,$8A,$00,$40,$43,$3C,$40,$43
	DC.B      $3C,$40,$43,$3C,$40,$43,$3C,$40
	DC.B      $43,$3C,$40,$43,$3C,$40,$43,$3C
	DC.B      $40,$43,$3C,$40,$43,$3C,$40,$43
	DC.B      $3C,$40,$43,$3C,$40,$43,$3C,$40
	DC.B      $43,$3C,$40,$43,$3C,$40,$43,$3C
	DC.B      $40,$43,$8A,$01,$85,$84,$F7,$10
	DC.B      $84,$F7,$10,$85,$84,$23,$11,$84
	DC.B      $23,$11,$85,$89,$B0,$04,$01,$88
	DC.B      $07,$20,$82,$02,$3C,$8A,$00,$3F
	DC.B      $43,$3C,$3F,$43,$3C,$3F,$43,$3C
	DC.B      $3F,$43,$8A,$01,$82,$18,$89,$C0
	DC.B      $01,$01,$88,$07,$04,$88,$06,$09
	DC.B      $5A,$82,$02,$88,$06,$03,$85,$89
	DC.B      $B0,$04,$01,$88,$07,$20,$82,$02
	DC.B      $3C,$8A,$00,$40,$43,$3C,$40,$43
	DC.B      $3C,$40,$43,$3C,$40,$43,$8A,$01
	DC.B      $82,$18,$89,$C0,$01,$01,$88,$07
	DC.B      $04,$88,$06,$09,$5A,$82,$02,$88
	DC.B      $06,$03,$85,$89,$C0,$00,$01,$88
	DC.B      $07,$20,$82,$06,$8B,$0C,$01,$FF
	DC.B      $30,$3C,$48,$3C,$82,$18,$89,$C0
	DC.B      $01,$01,$88,$07,$04,$88,$06,$09
	DC.B      $5A,$88,$06,$03,$85,$89,$C0,$00
	DC.B      $01,$88,$07,$00,$82,$00,$5A,$0C
	DC.B      $5A,$06,$5A,$06,$82,$18,$89,$C0
	DC.B      $01,$01,$88,$07,$04,$88,$06,$09
	DC.B      $5A,$88,$06,$03,$85,$89,$C0,$00
	DC.B      $01,$88,$07,$00,$82,$00,$5A,$06
	DC.B      $5A,$06,$89,$D0,$01,$01,$88,$07
	DC.B      $04,$88,$06,$06,$5A,$0C,$82,$18
	DC.B      $89,$C0,$01,$01,$88,$06,$09,$5A
	DC.B      $88,$06,$03,$85,$91,$FF,$92,$FF
	DC.B      $88,$07,$10,$8F,$02,$02,$01,$01
	DC.B      $88,$06,$05,$8D,$02,$03,$03,$00
	DC.B      $89,$E0,$01,$01,$80,$02,$86,$00
	DC.B      $84,$97,$14,$86,$FE,$84,$67,$14
	DC.B      $86,$FC,$84,$97,$14,$86,$FB,$84
	DC.B      $67,$14,$81,$80,$02,$86,$FC,$84
	DC.B      $97,$14,$86,$FB,$84,$97,$14,$86
	DC.B      $F9,$84,$97,$14,$86,$FB,$84,$97
	DC.B      $14,$81,$80,$02,$86,$00,$84,$97
	DC.B      $14,$86,$FD,$84,$67,$14,$86,$F4
	DC.B      $84,$97,$14,$86,$FC,$84,$B8,$14
	DC.B      $86,$FD,$84,$B8,$14,$86,$FE,$84
	DC.B      $B8,$14,$86,$FF,$84,$B8,$14,$81
	DC.B      $80,$03,$86,$00,$84,$01,$14,$86
	DC.B      $F9,$84,$B8,$14,$86,$FB,$84,$B8
	DC.B      $14,$81,$86,$00,$84,$01,$14,$86
	DC.B      $FE,$84,$01,$14,$86,$FC,$84,$01
	DC.B      $14,$80,$02,$86,$FB,$84,$01,$14
	DC.B      $81,$90,$B8,$11,$91,$FF,$92,$FF
	DC.B      $88,$07,$20,$82,$04,$8A,$01,$80
	DC.B      $02,$86,$00,$8B,$F4,$02,$02,$89
	DC.B      $C0,$0E,$01,$84,$0B,$15,$89,$60
	DC.B      $E0,$00,$84,$0B,$15,$8B,$FB,$02
	DC.B      $02,$89,$C0,$0E,$01,$84,$0B,$15
	DC.B      $89,$60,$E0,$00,$84,$0B,$15,$8B
	DC.B      $F4,$02,$02,$89,$C0,$0E,$01,$84
	DC.B      $0B,$15,$89,$60,$E0,$00,$84,$0B
	DC.B      $15,$8B,$FB,$02,$02,$89,$C0,$0E
	DC.B      $01,$86,$F9,$84,$2A,$15,$86,$FB
	DC.B      $84,$0B,$15,$81,$80,$02,$8B,$FB
	DC.B      $02,$02,$86,$FC,$84,$2A,$15,$8B
	DC.B      $F4,$02,$02,$86,$FE,$84,$38,$15
	DC.B      $86,$00,$84,$19,$15,$8B,$F4,$02
	DC.B      $02,$86,$FB,$84,$0B,$15,$8B,$FB
	DC.B      $02,$02,$84,$0B,$15,$86,$F9,$84
	DC.B      $0B,$15,$8B,$F4,$02,$02,$86,$F7
	DC.B      $84,$38,$15,$86,$FC,$84,$38,$15
	DC.B      $8B,$FB,$02,$02,$86,$F9,$84,$2A
	DC.B      $15,$86,$FB,$84,$2A,$15,$81,$80
	DC.B      $02,$86,$F4,$84,$40,$14,$33,$0C
	DC.B      $38,$18,$3A,$18,$3C,$18,$3D,$0C
	DC.B      $3C,$18,$3F,$30,$86,$F6,$84,$19
	DC.B      $14,$41,$0C,$3F,$0C,$3E,$0C,$3C
	DC.B      $18,$3A,$18,$3C,$18,$35,$3C,$86
	DC.B      $F2,$84,$40,$14,$36,$0C,$35,$0C
	DC.B      $36,$18,$38,$18,$3A,$0C,$3C,$18
	DC.B      $3A,$0C,$3D,$30,$86,$F0,$84,$19
	DC.B      $14,$86,$FC,$84,$19,$14,$86,$ED
	DC.B      $84,$40,$14,$86,$F9,$84,$40,$14
	DC.B      $86,$F2,$84,$19,$14,$86,$FE,$84
	DC.B      $19,$14,$86,$EF,$84,$40,$14,$86
	DC.B      $FB,$84,$40,$14,$81,$80,$03,$86
	DC.B      $F4,$84,$19,$14,$82,$01,$86,$00
	DC.B      $84,$1B,$14,$86,$EF,$84,$40,$14
	DC.B      $82,$01,$86,$FB,$84,$42,$14,$86
	DC.B      $F4,$84,$19,$14,$86,$ED,$84,$40
	DC.B      $14,$86,$ED,$84,$19,$14,$86,$F9
	DC.B      $84,$19,$14,$86,$EF,$84,$40,$14
	DC.B      $81,$86,$F4,$84,$19,$14,$82,$01
	DC.B      $86,$00,$84,$1B,$14,$86,$EF,$84
	DC.B      $40,$14,$82,$01,$86,$FB,$84,$42
	DC.B      $14,$86,$F4,$84,$19,$14,$86,$F2
	DC.B      $84,$19,$14,$82,$01,$86,$FE,$84
	DC.B      $1B,$14,$86,$ED,$84,$40,$14,$82
	DC.B      $01,$86,$F9,$84,$42,$14,$86,$F2
	DC.B      $84,$19,$14,$86,$F0,$84,$19,$14
	DC.B      $82,$01,$86,$FC,$84,$1B,$14,$86
	DC.B      $EB,$84,$40,$14,$82,$01,$86,$F7
	DC.B      $84,$42,$14,$86,$F0,$84,$19,$14
	DC.B      $80,$03,$86,$ED,$84,$19,$14,$81
	DC.B      $86,$EF,$84,$19,$14,$80,$03,$86
	DC.B      $ED,$84,$40,$14,$81,$86,$EF,$84
	DC.B      $40,$14,$90,$50,$12,$14,$06,$1B
	DC.B      $0C,$20,$06,$84,$C4,$14,$14,$0C
	DC.B      $1B,$06,$20,$06,$84,$C4,$14,$14
	DC.B      $0C,$84,$C4,$14,$85,$82,$02,$8B
	DC.B      $0C,$01,$01,$89,$D0,$03,$01,$38
	DC.B      $8A,$00,$3C,$3F,$38,$3C,$3F,$38
	DC.B      $3C,$3F,$38,$3C,$3F,$89,$CA,$0D
	DC.B      $01,$8B,$F4,$03,$03,$8A,$01,$82
	DC.B      $00,$86,$00,$85,$82,$02,$8B,$0C
	DC.B      $01,$01,$89,$D0,$03,$01,$3C,$8A
	DC.B      $00,$3F,$44,$3C,$3F,$44,$3C,$3F
	DC.B      $44,$3C,$3F,$44,$89,$CA,$0D,$01
	DC.B      $8B,$F4,$03,$03,$8A,$01,$82,$00
	DC.B      $86,$00,$85,$14,$06,$20,$0C,$1B
	DC.B      $06,$84,$C4,$14,$20,$0C,$1B,$06
	DC.B      $14,$0C,$20,$06,$84,$C4,$14,$20
	DC.B      $06,$1B,$06,$14,$06,$20,$0C,$14
	DC.B      $06,$84,$C4,$14,$20,$06,$14,$0C
	DC.B      $1B,$06,$14,$0C,$84,$C4,$14,$84
	DC.B      $E6,$14,$85,$14,$06,$20,$0C,$1B
	DC.B      $06,$84,$C4,$14,$20,$06,$14,$0C
	DC.B      $1B,$06,$14,$0C,$84,$C4,$14,$20
	DC.B      $0C,$14,$06,$20,$0C,$14,$06,$84
	DC.B      $C4,$14,$20,$0C,$1B,$06,$14,$0C
	DC.B      $20,$06,$84,$C4,$14,$14,$0C,$85
	DC.B      $88,$07,$00,$8E,$89,$F0,$01,$01
	DC.B      $88,$06,$0B,$8D,$01,$14,$00,$01
	DC.B      $26,$0C,$88,$06,$05,$8D,$02,$03
	DC.B      $03,$00,$88,$07,$10,$89,$E0,$01
	DC.B      $01,$85,$88,$07,$00,$8E,$89,$F0
	DC.B      $01,$01,$88,$06,$0B,$8D,$01,$14
	DC.B      $00,$01,$26,$06,$8E,$26,$06,$88
	DC.B      $06,$05,$8D,$02,$03,$03,$00,$88
	DC.B      $07,$10,$89,$E0,$01,$01,$85,$38
	DC.B      $8A,$00,$3B,$3F,$38,$3B,$3F,$38
	DC.B      $3B,$3F,$38,$3B,$3F,$38,$8A,$00
	DC.B      $3B,$3F,$38,$3B,$3F,$38,$3B,$3F
	DC.B      $38,$3B,$3F,$8A,$01,$85,$38,$8A
	DC.B      $00,$3C,$3F,$38,$3C,$3F,$38,$3C
	DC.B      $3F,$38,$3C,$3F,$38,$8A,$00,$3C
	DC.B      $3F,$38,$3C,$3F,$38,$3C,$3F,$38
	DC.B      $3C,$3F,$8A,$01,$85,$53,$52,$50
	DC.B      $4B,$47,$46,$44,$3F,$3B,$3A,$38
	DC.B      $33,$2F,$2E,$2C,$27,$2C,$2E,$2F
	DC.B      $33,$38,$3A,$3B,$3F,$44,$46,$47
	DC.B      $4B,$50,$52,$53,$50,$85,$54,$52
	DC.B      $50,$4B,$48,$46,$44,$3F,$3C,$3A
	DC.B      $38,$33,$30,$2E,$2C,$27,$2C,$2E
	DC.B      $30,$33,$38,$3A,$3C,$3F,$44,$46
	DC.B      $48,$4B,$50,$52,$54,$50,$85,$91
	DC.B      $FF,$92,$FF,$88,$07,$08,$89,$D0
	DC.B      $06,$01,$8A,$01,$8B,$0C,$01,$01
	DC.B      $82,$02,$86,$0C,$84,$2D,$16,$86
	DC.B      $0B,$84,$16,$16,$86,$0A,$84,$2D
	DC.B      $16,$88,$07,$09,$83,$91,$FF,$92
	DC.B      $FF,$88,$07,$10,$89,$D0,$0D,$01
	DC.B      $8A,$01,$12,$0C,$8C,$02,$19,$0C
	DC.B      $1E,$0C,$17,$0C,$1E,$0C,$23,$0C
	DC.B      $8C,$00,$10,$C4,$88,$07,$12,$83
	DC.B      $91,$FF,$92,$FF,$8A,$01,$80,$02
	DC.B      $88,$06,$05,$89,$D0,$00,$01,$88
	DC.B      $07,$00,$5A,$06,$5A,$06,$88,$07
	DC.B      $04,$5A,$0C,$88,$07,$00,$89,$F0
	DC.B      $01,$01,$88,$06,$0B,$8D,$01,$14
	DC.B      $00,$01,$26,$0C,$8D,$00,$00,$00
	DC.B      $00,$81,$88,$07,$04,$88,$06,$05
	DC.B      $89,$D0,$0C,$01,$5A,$C4,$88,$07
	DC.B      $24,$83,$28,$8A,$00,$2B,$2F,$32
	DC.B      $28,$2B,$2F,$32,$28,$2B,$2F,$32
	DC.B      $28,$2B,$2F,$32,$28,$2B,$8A,$01
	DC.B      $85,$28,$8A,$00,$2C,$2F,$33,$28
	DC.B      $2C,$2F,$33,$28,$2C,$2F,$33,$28
	DC.B      $2C,$2F,$33,$28,$2C,$8A,$01,$85
	DC.B      $52,$79,$E5,$00	