;*******************************************************************************
; process actions based on day and scene, this is effectively the game script
;*******************************************************************************

;-------------------------------------------------------------------------------
; day 00 - scene 00
;-------------------------------------------------------------------------------
Day00Scene00Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText
ExitDay00Scene00Action00:
	rts

Day00Scene00Action01:	; ACTION_USE_TALK
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	.2	; branch to next NPC
	;---------------------------------------------------------------------------
	; handle dialog with NPC Dani		
	;---------------------------------------------------------------------------
	btst.l	#$1,d7	; test if flag 1 is set
	bne	.1	; branch if it is
	bset.l	#$1,d7	; set flag 1
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated event flags for the day
	lea	DialogTextDaniScene0Day0Flag0,a6	; load dialog text
	bra.s	.5	; branch to setup dialog display
.1
	lea	DialogTextDaniScene0Day0Flag1,a6	; load dialog text
	bra.s	.5	; branch to setup dialog display
.2
	;---------------------------------------------------------------------------
	; handle dialog with shopper		
	;---------------------------------------------------------------------------
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.s	.4	; branch to display default text
	btst.l	#$2,d7	; test if flag 2 is set
	bne	.3	; branch if it is set
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_CHOICE,d7	; set text choice flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	lea	DialogTextMaleShopper0Scene0Day0Flag0,a6	; load dialog text
	bra.s	.5	; branch to setup dialog display

.3	; flag 2 is set
	lea	DialogTextMaleShopper0Scene0Day0Flag2,a6	; load dialog text
	bra.s	.5	; branch to setup dialog display
.4
	; default
	lea	DialogTextNothingHappens,a6	; load default text
.5
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay00Scene00Action01:
	rts

Day00Scene00Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	andi.w	#OBJ_SCENE_BASE,d6	; and against base scene ID
	beq.s	.1	; not scenery
	lea	DialogTextCantTake,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action02
.1
	lea	DialogTextNoItems,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay00Scene00Action02:
	rts

Day00Scene00Action03:	; ACTION_RESPOND
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.s	.2	; branch to display default text
	bset.l	#$2,d7	; set flag 2
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	.1	; branch if not equal to zero (there are only two options)
	lea	DialogTextMaleShopper0Scene0Day0Flag0R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
.1
	lea	DialogTextMaleShopper0Scene0Day0Flag0R1,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
.2
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay00Scene00Action03:
	bsr.w	ResetDialog	; reset the dialog
	rts


