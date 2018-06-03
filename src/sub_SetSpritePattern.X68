;-------------------------------------------------------------------------------
; SetSpritePattern
; sets the pattern for a sprite based on its direction and frame
; a6 = address of sprite info start
; d5 is used to store the sprite id and compute the address table value
; d6 is used to compute the sprite pattern 
; d7 is used for various operations
;-------------------------------------------------------------------------------
SetSpritePattern:
	; test if it's time to update the animation frame and if so update it
	addq	#$1,(STRUCT_SPRITE_STEP_COUNTER,a6)	; increment counter
	cmpi.w	#SPRITE_ANIMATION_STEPS,(STRUCT_SPRITE_STEP_COUNTER,a6) ; test
	ble.s	ExitSetSpritePattern	; animation hasn't changed, draw the sprite 
IncrementSpriteFrame:
	move.w	#$0000,(STRUCT_SPRITE_STEP_COUNTER,a6)	; reset SPRITE_STEP_COUNTER
	addq	#$1,(STRUCT_SPRITE_FRAME,a6)	; increment SPRITE_FRAME counter
UpdateSpritePattern:
	move.w	(a6),d5	; copy sprite id to d5
	mulu.w	#$08,d5	; multiply sprite ID by 8 to get sprite array offset
	; change the sprite pattern
	addq	#STRUCT_SPRITEDEF_PATTERN,d5	; move to palette and pattern
	swap	d5		; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d5	; add to sprite table address
	; set the pattern, pattern=(base pattern number)+(direction*24)+(frame*8)
	move.w	(STRUCT_SPRITE_BASE_PATTERN,a6),d6	; start with base pattern in d6
	move.w	(STRUCT_SPRITE_DIRECTION,a6),d7 ; copy direction to d7
	mulu.w	#$18,d7	; multiply direction * 24
	add.w	d7,d6 	; add result to d1
	move.w	(STRUCT_SPRITE_FRAME,a6),d7	; copy frame to d7
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
	moveq	#$0010,d7	; set animation frame to 2*8
.3: ; add (frame*8) to pattern
	add.w	d7,d6 	; add result to d6
DrawSprite:
	move.l	d5,(VDP_CONTROL)	; set write location in VDP
	move.w	d6,(VDP_DATA)		; write the new pattern
ExitSetSpritePattern:
	rts

