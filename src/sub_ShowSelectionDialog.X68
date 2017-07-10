ShowSelectionDialog:
	move.w	(MEM_ACTION_TARGET_OBJID),d7	; move target object ID to d7
	andi.w	#$0FFF,d7	; clear the base value
	mulu.w	#$4,d7	; multiply by 4 to get the offset
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	andi.w	#OBJ_SCENE_BASE,d6	; and against OBJ_SCENE_BASE
	beq.s	ShowSelectionDialogNPC	; if result is zero then this is not scenery
	lea	ObjectNameTable,a6	; point to default object text table
	bra.s	ShowSelectionDialogScenery	; branch to next step
ShowSelectionDialogNPC:	; target object is an NPC
	lea	NPCNameTable,a6	; point to default npc text table
ShowSelectionDialogScenery:
	adda.l	d7,a6	; add offset
	move.l	(a6),(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	; set dialog flags to display the dialog
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7	; change state to opening
	bset.l	#DIALOG_FLAG_STYLE_MENU,d7	; set style to overworld menu
	bset.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; set flag to wait for selection
	move.l	d7,(MEM_DIALOG_FLAGS)	; save changes made to the game state
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7
	move.w	#$0000,(MEM_MENU_SELECTION)	; default to first menu selection
	;---------------------------------------------------------------------------
	; have the NPC face the player
	;---------------------------------------------------------------------------
	move.w (MEM_ACTION_TARGET_NPCID),d7	; copy NPC target ID to d7
	cmpi.w	#$FFFF,d7	; test if it is -1
	beq.s	ExitShowSelectionDialog	; exit if -1
	lea	MEM_NPC0_SPRITE_ID,a6	; point a6 to the first NPC sprite
	move.w	(MEM_ACTION_TARGET_NPCID),d6	; copy target NPC id to d6
	mulu.w	#NPC_RECORD_SIZE,d6	; multiply by NPC_RECORD_SIZE to get offset
	adda.l	d6,a6	; move to target NPC sprite
	; save current NPC direction
	move.w	(STRUCT_SPRITE_DIRECTION,a6),(MEM_ACTION_TARGET_NPC_DIRECTION)
	; copy player direction to NPC direction
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),(STRUCT_SPRITE_DIRECTION,a6)
	; flip the last bit to reverse direction
	eor.w	#$0001,(STRUCT_SPRITE_DIRECTION,a6)
	bsr.w	StopSprite	; stop moving the sprite
ExitShowSelectionDialog:
	rts

