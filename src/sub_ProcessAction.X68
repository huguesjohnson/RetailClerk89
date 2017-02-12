ProcessAction:
	bsr.w	ResetDialog	; reset the dialog
	; --------------------------------------------------------------------------
	; test if a default handler should be used
	; --------------------------------------------------------------------------
	cmpi.w	#ACTION_TAKE_GIVE,(MEM_ACTION_ID)	; test if this is a give action
	bne.s	ProcessActionBuildActionTableOffset	; not give action, branch
	move.w	(MEM_ACTION_TARGET_OBJID),d7	; copy action target to d7
	andi.w	#OBJ_NPC_BASE,d7	; and against base npc ID
	beq.s	.1	; target is not an NPC
	; --------------------------------------------------------------------------
	; default handler for giving an item to an NPC
	; --------------------------------------------------------------------------
	cmpi.w	#$0000,(MEM_ACTIVE_ITEM)	; test if there is an active item
	bne.s	ProcessActionBuildActionTableOffset	; responding to a give menu
	bsr.w	DefaultActionGive	; otherwise launch default action
	bra.s	ExitProcessAction	; exit
.1	; test if target is scenery
	move.w	(MEM_ACTION_TARGET_OBJID),d7	; copy action target to d7
	andi.w	#OBJ_SCENE_BASE,d7	; and against base npc ID
	beq.s	ProcessActionBuildActionTableOffset	; target is not scenery
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
