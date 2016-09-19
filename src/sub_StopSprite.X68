;-------------------------------------------------------------------------------
; StopSprite
; sets the pattern for a sprite based on its direction and frame
; a6 = address of sprite info start
; a6 is not modified in this subroutine
; a5 is modified instead of a6 to avoid issues in MoveSprite
; d5 is used to store the sprite id and compute the address table value
; d6 is used to compute the sprite pattern 
; d7 is used for math operations
;-------------------------------------------------------------------------------
StopSprite:
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
	adda.l  #$A,a5	; move to a5+A -> SPRITE_FRAME
	move.w	#$0000,(a5) ; move back to frame 0
	adda.l  #$2,a5	; move to a6 + C = SPRITE_STEP_COUNTER
	move.w	#SPRITE_ANIMATION_STEPS,(a5) ; reset
	bsr.w	UpdateSpritePattern ; branch to move SetSpritePattern
EndStopSprite:
	rts

