;-------------------------------------------------------------------------------
; process actions based on day and scene, this is effectively the game script
;-------------------------------------------------------------------------------
Day00Scene00Action00:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	.2	; branch to next NPC
	;---------------------------------------------------------------------------
	; handle dialog with NPC Dani		
	;---------------------------------------------------------------------------
	btst.l	#$1,d7	; test if flag 1 is set
	bne	.1	; branch if not
	bset.l	#$1,d7	; set flag 1
	lea	DialogTextDaniScene0Day0Flag0,a6	; load dialog text
	bra.s	.4	; branch to setup dialog display
.1
	lea	DialogTextDaniScene0Day0Flag1,a6	; load dialog text
	bra.s	.4	; branch to setup dialog display
.2
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.s	.3	; branch to display default text
	lea	DialogTextMaleShopper0,a6
	bra.s	.4	; branch to setup dialog display
.3
	; default
	bsr.w	ShowDefaultText
	bra.s	ExitDay00Scene00Action00
.4
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; set the dialog opening flags
ExitDay00Scene00Action00:
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated event flags for the day
	rts

