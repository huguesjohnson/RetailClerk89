SetDialogOpening:
	; sets flags to display the dialog
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7	; change state to opening
	move.l	d7,(MEM_DIALOG_FLAGS)	; save changes made to the game state
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7
	rts

