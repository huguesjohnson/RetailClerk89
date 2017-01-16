;-------------------------------------------------------------------------------
; process actions based on day and scene, this is effectively the game script
;-------------------------------------------------------------------------------
Day00Scene00Action00:
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	.1	; branch to next NPC
	lea	DialogTextDani,a6	; load dialog text
	bra.s	.3	; branch to setup dialog display
.1
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.s	.2	; branch to display default text
	lea	DialogTextMaleShopper0,a6
	bra.s	.3	; branch to setup dialog display
.2
	; default
	bsr.w	ShowDefaultText
	bra.s	ExitDay00Scene00Action00
.3
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; set the dialog opening flags
ExitDay00Scene00Action00:
	rts

