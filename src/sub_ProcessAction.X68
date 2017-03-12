ProcessAction:
	; --------------------------------------------------------------------------
	; test if the action is the player exiting the scene, if so process it
	; --------------------------------------------------------------------------
	cmpi.w	#ACTION_EXIT_SCENE,(MEM_ACTION_ID)	; test if this is an exit action
	bne.s	ProcessActionTestDefaultActions	; not an exit action, branch
	bsr.w	BuildActionTableOffset	; build action table offset
	lea	SceneExitTable,a5	; point to scene exit table
	move.w	(MEM_ACTIVE_SCENE_ID),d7	; copy scene ID to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by lword size to get offset
	adda.w	d7,a5	; move to offset location
	move.l	(a5),a6	; a5 has the address of the subroutine to jump to
	jsr	(a6)	; jump to location of code to process this event
	bra.s	ExitProcessAction	; exit
ProcessActionTestDefaultActions:
	; --------------------------------------------------------------------------
	; action is something other than exiting the current scene
	; --------------------------------------------------------------------------
	bsr.w	ResetDialog	; reset the dialog
	; --------------------------------------------------------------------------
	; test if a default handler should be used
	; --------------------------------------------------------------------------
	cmpi.w	#ACTION_TAKE_GIVE,(MEM_ACTION_ID)	; test if this is a give action
	bne.s	ProcessActionBuildActionTableOffset	; not give action, branch
	move.w	(MEM_ACTION_TARGET_OBJID),d7	; copy action target to d7
	andi.w	#OBJ_NPC_BASE,d7	; and against base npc ID
	beq.s	ProcessActionTestScenery	; target is not an NPC
	; --------------------------------------------------------------------------
	; default handler for giving an item to an NPC
	; --------------------------------------------------------------------------
	cmpi.w	#$0000,(MEM_ACTIVE_ITEM)	; test if there is an active item
	bne.s	ProcessActionBuildActionTableOffset	; responding to a give menu
	bsr.w	DefaultActionGive	; otherwise launch default action
	bra.s	ExitProcessAction	; exit
ProcessActionTestScenery:	; test if target is scenery
	move.w	(MEM_ACTION_TARGET_OBJID),d7	; copy action target to d7
	andi.w	#OBJ_SCENE_BASE,d7	; and against base npc ID
	beq.s	ProcessActionBuildActionTableOffset	; target is not scenery
	; --------------------------------------------------------------------------
	; trying to take an item from a scene, test if inventory is full
	; --------------------------------------------------------------------------
	cmpi.w	#$0000,(MEM_ACTIVE_ITEM)	; test if there is an active item
	beq.s	ProcessActionDefaultTakeMenu	; 0 = opening a take menu
	bsr.w	DefaultTakeAddItem	; add the item to the player's inventory
	bra.s	ExitProcessAction	; exit
ProcessActionDefaultTakeMenu:	; default take menu
	; --------------------------------------------------------------------------
	; trying to take an item from a scene, test if inventory is full
	; --------------------------------------------------------------------------
	cmpi.w	#MAX_ITEMS,(MEM_PLAYER_ITEM_COUNT)	; carrying max items?
	bne.s	ProcessActionBuildActionTableOffset	; branch if < max
	bsr.w	DefaultActionInventoryFull	; launch default action
	bra.s	ExitProcessAction	; exit
ProcessActionBuildActionTableOffset:
	bsr.w	BuildActionTableOffset	; build action table offset
	lea	ActionTable,a5	; point to action table
	adda.w	(MEM_ACTION_TABLE_OFFSET),a5	; move to offset location
	move.l	(a5),a6	; a5 has the address of the subroutine to jump to
	jsr	(a6)	; jump to location of code to process this event
ExitProcessAction:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_ACTION,d7 ; clear action flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	rts
