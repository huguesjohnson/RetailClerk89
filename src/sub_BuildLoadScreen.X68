;-------------------------------------------------------------------------------
; yes, I realize there is a lot of duplicate code between this and
; sub_BuildStatusScreen - maybe I'll clean that up one day
;-------------------------------------------------------------------------------
BuildLoadScreen:
	move.w	#$2700,sr		; disable interrupts
	move.w	#$0003,d5	; three save slots
BuildLoadScreenLoop:
	move.w	d5,d7	; d7 gets modified by SaveGameLookup
	bsr.w	SaveGameLookup	; get save title into d6
	cmpi.w	#MAX_OBJECTIVE,d6	; is this > MAX_OBJECTIVE?
	bgt	.empty
	; lookup text
	mulu.w	#LWORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	SaveGameTitles,a5	; point a5 to the lookup table
	adda.l	d6,a5	; move to offset
	move.l	(a5),a0	; point a0 to the first character
	bra.s	.buildtext
.empty
	lea	StatusScreenEmptySave,a0	; use text for empty save slot
.buildtext
	move.l	#LOAD_SCREEN_SAVE0_VDP,d7	; point d7 to first line
	clr	d6	; lazy way to prevent various bugs
	move.w	#$0080,d6	; using d6 to compute row
	mulu.w	d5,d6	; multiply by current save slot
	swap	d6	; move to high word
	add.l	d6,d7	; add offset to d7
	move.l	d7,(MEM_DIALOG_VDP)
DrawSaveTitleLoop:
	clr	d6	; lazy way to prevent various bugs
	move.b	(a0)+,d6	; copy current character to d6
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.s	DrawSaveTitleLoopExit	; end of text, move on
	; update d6 to point to the tile ID
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#DIALOG_BASE_TILE_LOW+%1000000000000000,d6	; add the base tile
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VDP
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	bra.w	DrawSaveTitleLoop ; loop until ETX
DrawSaveTitleLoopExit:
	dbf	d5,BuildLoadScreenLoop ; loop
ExitBuildLoadScreen:
	move.w	#$2000,sr	; re-enable interrupts
	rts

