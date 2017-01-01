;-------------------------------------------------------------------------------
; StopSprite
; sets the pattern for a sprite based on its direction and frame
; a6 = address of sprite info start
;-------------------------------------------------------------------------------
StopSprite:
	move.w	#$0000,(STRUCT_SPRITE_FRAME,a6) ; move back to frame 0
	bsr.w	UpdateSpritePattern ; branch to move SetSpritePattern
EndStopSprite:
	rts

