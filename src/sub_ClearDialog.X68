;*******************************************************************************
; clears all text in the dialog and redraws the frame
; d0,d1,d7 are modified
; a0,a1 are modified 
; anything DrawTileset modifies is also modified
;*******************************************************************************
ClearDialog:
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	btst.l	#DIALOG_FLAG_STYLE_TITLED,d7	; is the titled flag set?
	beq.s	ClearDialogDefault	; not set, branch
ClearDialogTitled:
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TITLE_ROWCOL),(MEM_DIALOG_VDP)
	; clear out the dialog
	movea.l	#PatternDialogTitledFull,a0	; point a0 to start of dialog patterns
	bra.s	ClearDialogDrawTileset	; branch
ClearDialogDefault:
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL),(MEM_DIALOG_VDP)
	; clear out the dialog
	movea.l	#PatternDialogFull,a0	; point a0 to start of dialog patterns
ClearDialogDrawTileset:
	move.w	#DIALOG_BASE_TILE,d0	; base pattern
	moveq	#$0000,d1	; repeat
	movea.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),a1	; initial drawing location
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
ExitClearDialog:
	rts

;*******************************************************************************
; clears all text in the dialog but doesn't update the frame
; d0 is modified
; a0,a1 are modified 
; anything DrawTileset modifies is also modified
;*******************************************************************************
ClearDialogTextArea:
	; clear out the dialog text
	lea PatternDialogClearTextArea,a0	; point a0 to pattern for clear text
	move.w	#DIALOG_BASE_TILE,d0	; base pattern
	moveq	#$0000,d1	; repeat
	lea	VDP_VRAM_WRITE_A,a1	; initial drawing location
	adda.l	#DIALOG_TEXT_AREA_ROWCOL,a1	; move to row & column
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	rts
