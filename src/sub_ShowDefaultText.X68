ShowDefaultText:
	; TODO - determine if object or NPC, this only supports objects right now
	move.w	(MEM_ACTION_TARGET_OBJID),d7	; move target object ID to d7
	andi.w	#$0FFF,d7	; clear the base value
	mulu.w	#$4,d7	; multiply by 4 to get the offset
	lea	DefaultTextTable,a6	; point to default text table
	adda.l	d7,a6	; add offset
	move.l	(a6),(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	; set flags so the dialog displays next time through the main loop
	bsr.w	SetDialogOpening
	rts
