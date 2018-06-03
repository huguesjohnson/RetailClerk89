; resets the dialog so new text can be drawn without closing & reopening
ResetDialog:
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),(MEM_DIALOG_VDP)	; base address
	add.l	#$00820000,(MEM_DIALOG_VDP)	; add 132 to move 1 row and column	
	; clear out the dialog
	movea.l	#PatternDialogFull,a0	; point a0 to start of dialog patterns
	move.w	#DIALOG_BASE_TILE,d0	; base pattern
	moveq	#$0000,d1	; repeat
	movea.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),a1	; initial drawing location
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	; reset flags to force text to start re-drawing
	bset.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; set text drawing flag
	bclr.l	#DIALOG_FLAG_TEXT_OPEN,d7	; clear open flag
	bclr.l	#DIALOG_FLAG_TEXT_NEW_PAGE,d7	; clear new page flag
	bclr.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; clear menu style choice flags
	bclr.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7	; clear menu style choice flag
	bclr.l	#DIALOG_FLAG_STYLE_MENU,d7	; clear menu style flag
	bclr.l	#DIALOG_FLAG_STYLE_ITEM_MENU,d7	; clear menu style flag
	bset.l	#DIALOG_FLAG_STYLE_SIMPLE_TEXT,d7	; set simple text style flag
	bclr.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; clear waiting for selection flag
	move.l	d7,(MEM_DIALOG_FLAGS) ; copy game state back to d7
	; test for option to persist the selector
	btst.l	#DIALOG_FLAG_OPTION_PERSIST_SELECTOR,d7	; test option
	bne.s	ExitResetDialog	; exit if flag is set
	move.w	#DIALOG_NO_RESPONSE,(MEM_MENU_SELECTION)	; reset menu selection
	bsr.w	HideSelectorSprite	; hide the selection icon
ExitResetDialog:
	rts
