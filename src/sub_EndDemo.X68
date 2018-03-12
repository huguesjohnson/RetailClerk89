;-------------------------------------------------------------------------------
; setup end screen
;-------------------------------------------------------------------------------
EndDemo:
	; set the end game flag
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	and.l	#$0000,d7	; clear all other flags
	bset.l	#STATE_FLAG_END_SCREEN,d7 ; set end screen state flag	
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; load end scene
	lea	SceneEnd,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	rts
