;*******************************************************************************
; default event processing routines
;*******************************************************************************

;-------------------------------------------------------------------------------
; builds the give menu or displays message if the player has no items
;-------------------------------------------------------------------------------
DefaultActionGive:
	cmpi.w	#$0000,(MEM_PLAYER_ITEM_COUNT)	; is item count 0?
	beq.s	DefaultActionGiveNoItems	; branch if 0
	lea	ItemMenu,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	MEM_PLAYER_ITEMS,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7	; set text choice flag
	bset.l	#DIALOG_FLAG_STYLE_ITEM_MENU,d7	; set item menu flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	bra.s	ExitDefaultActionGive	; exit
DefaultActionGiveNoItems:
	lea	DialogTextNoItems,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDefaultActionGive:
	rts

;*******************************************************************************
; default take actions
;*******************************************************************************
	include	'actionscript/ActionScriptDefaultTake.X68'

;*******************************************************************************
; scene exit actions
;*******************************************************************************
	include	'actionscript/ActionScriptSceneExit.X68'

;*******************************************************************************
; process actions based on day and scene, this is effectively the game script
;*******************************************************************************
	include	'actionscript/ActionScriptDay00.X68'
	include	'actionscript/ActionScriptDay01.X68'
	include	'actionscript/ActionScriptDay02.X68'
	include	'actionscript/ActionScriptDay03.X68'
	include	'actionscript/ActionScriptDay04.X68'
	include	'actionscript/ActionScriptDay05.X68'
	include	'actionscript/ActionScriptDay06.X68'
	include	'actionscript/ActionScriptDay07.X68'

;*******************************************************************************
; end the game
;*******************************************************************************
EndGame:
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog

DisplayCreditsScene:
	lea	SceneCredits,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the intro scene
	move.w	#CREDITS_SCREEN_LOOP,d7	; use d7 for loop control
DisplayCreditsSceneLoop:
	jsr	WaitVBlank	; wait for vblank
	dbf	d7,DisplayCreditsSceneLoop	; loop
	; set the end game flag
	move.l	(MEM_GAME_STATE),d7	; copy game state
	and.l	#$0000,d7	; clear all other flags
	bset.l	#STATE_FLAG_END_SCREEN,d7 ; set end screen state flag	
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; load end scene
	lea	SceneEnd,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in
	rts

