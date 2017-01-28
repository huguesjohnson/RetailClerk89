ShowDefaultText:
	move.w	(MEM_ACTION_TARGET_OBJID),d7	; move target object ID to d7
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; move target object ID to d6
	andi.w	#$0FFF,d7	; clear the base value
	mulu.w	#$4,d7	; multiply by 4 to get the offset
	; determine whether this is an object or NPC
	andi.w	#OBJ_SCENE_BASE,d6	; and d6 against base object value
	beq.s	.1	; branch if zero (not an object)
	; object
	lea	DefaultObjectDescriptionTable,a6	; point to default object text table
	bra.s	.2
.1	; npc
	lea	DefaultNPCDescriptionTable,a6	; point to default npc text table
.2
	adda.l	d7,a6	; add offset
	move.l	(a6),(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	rts
