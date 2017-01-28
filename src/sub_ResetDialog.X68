; resets the dialog so new text can be drawn without closing & reopening
ResetDialog:
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),(MEM_DIALOG_VPD)	; base address
	add.l	#$00820000,(MEM_DIALOG_VPD)	; add 132 to move 1 row and column	
	; clear out the dialog
	movea.l	#PatternDialogFull,a0	; point a0 to start of dialog patterns
	move.w	#DIALOG_BASE_TILE,d0	; base pattern
	move.w	#$0000,d1	; repeat
	movea.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),a1	; initial drawing location
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	; reset flags to force text to start re-drawing
	bset.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; set text drawing flag
	bclr.l	#DIALOG_FLAG_TEXT_OPEN,d7	; clear open flag
	bclr.l	#DIALOG_FLAG_TEXT_NEW_PAGE,d7	; clear new page flag
	bclr.l	#DIALOG_FLAG_STYLE_TEXT_CHOICE,d7	; clear menu style choice flag
	bclr.l	#DIALOG_FLAG_STYLE_MENU,d7	; clear menu style flag
	bset.l	#DIALOG_FLAG_STYLE_SIMPLE_TEXT,d7	; set simple text style flag
	bclr.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; clear waiting for selection flag
	move.l	d7,(MEM_DIALOG_FLAGS) ; copy game state back to d7
	move.w	#$0000,(MEM_MENU_SELECTION)	; reset menu selection
	bsr.w	HideSelectorSprite	; hide the selection icon
	rts
