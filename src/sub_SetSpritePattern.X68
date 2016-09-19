;-------------------------------------------------------------------------------
; SetSpritePattern
; sets the pattern for a sprite based on its direction and frame
; a6 = address of sprite info start
; a6 is not modified in this subroutine
; a5 is modified instead of a6 to avoid issues in MoveSprite
; d5 is used to store the sprite id and compute the address table value
; d6 is used to compute the sprite pattern 
; d7 is used for various operations
;-------------------------------------------------------------------------------
SetSpritePattern:
	;---------------------------------------------------------------------------
	; a6 = SPRITE_ID
	; a6 + 2 = SPRITE_X
	; a6 + 4 = SPRITE_Y
	; a6 + 6 = SPRITE_PATTERN_INDEX
	; a6 + 8 = SPRITE_DIRECTION
	; a6 + A = SPRITE_FRAME
	; a6 + C = SPRITE_STEP_COUNTER
	;---------------------------------------------------------------------------
	; setup	
	movea.l	a6,a5	; store address in a5 because it is manipulated
	move.w	(a5),d5	; copy sprite id to d5
	; test if it's time to update the animation frame and if so update it
	adda.l	#$C,a5	; move up to a5+C -> SPRITE_STEP_COUNTER
	addq	#$1,(a5)	; increment counter
	cmpi.w	#SPRITE_ANIMATION_STEPS,(a5); is it time to update animation frame?
	ble.s	DrawSprite	; animation hasn't changed, draw the sprite 
IncrementSpriteFrame:
	move.w	#$0000,(a5)	; reset SPRITE_STEP_COUNTER
	suba.l	#$2,a5	; move back to a5+A -> SPRITE_FRAME
	addq	#$1,(a5)	; increment SPRITE_FRAME counter
	cmpi.w	#SPRITE_FRAME_COUNT,(a5) ; do we need to loop back to the start?
	bls.w	UpdateSpritePattern	; if not, go to animation
	; reset the frame
	move.w	#$0000,(a5) ; toggle between frames while sprite is moving
UpdateSpritePattern:
	movea.l	a6,a5	; store address in a5 because it is manipulated
	move.w	(a5),d5	; copy sprite id to d5
	mulu.w	#$08,d5	; multiply sprite ID by 8 to get sprite array offset
	; change the sprite pattern
	addq	#$4,d5	; palette and pattern is at index 4 in the sprite definition
	swap	d5		; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d5	; add to sprite table address
	; set the pattern, pattern=(base pattern number)+(direction*24)+(frame*8)
	adda.l  #$6,a5	; move to a6+6 -> SPRITE_PATTERN_INDEX
	move.w	(a5),d6	; start with base pattern in d6
	adda.l	#$2,a5	; move to a6+8 -> SPRITE_DIRECTION
	move.w	(a5),d7 ; copy direction to d7
	mulu.w	#$18,d7	; multiply direction * 24
	add.w	d7,d6 	; add result to d1
	adda.l	#$2,a5	; move to a6+A -> SPRITE_FRAME
	move.w	(a5),d7	; copy frame to d7
	;---------------------------------------------------------------------------
	; cycle between the frames	
	; frame 0 = animation 0
	; frame 1 = animation 1
	; frame 2 = animation 0
	; frame 3 = animation 2
	;---------------------------------------------------------------------------
	btst.l	#$0,d7	; test if the frame is even (0 or 2)
	bne.s	.1
	; 0 or 2 logic
	moveq	#$0,d7	; zero out if 2, unnecessary 50% of the time of course
	bra.s	.3	; move to add step
.1: ; 1 or 3 logic	
	btst.l	#$1,d7	; test if the frame is 1 or 3
	bne.s	.2	; frame number is 3 
	; 3 logic
	moveq	#$8,d7	; set animation frame to 1*8
	bra.s	.3	; move to add step
.2	; 3 logic
	move.w	#$0010,d7	; set animation frame to 2*8
.3: ; add (frame*8) to pattern
	add.w	d7,d6 	; add result to d6
	add.w	#$2000,d6	; TODO compute value using palette id
DrawSprite:
	move.l	d5,(VDP_CONTROL)	; set write location in VDP
	move.w	d6,(VDP_DATA)		; write the new pattern
ExitSetSpritePattern:
	rts

