;*******************************************************************************
; used for lookup table conditions that are unreachable
;*******************************************************************************
ActionScriptNullEvent:
	rts

;*******************************************************************************
; used for lookup table conditions that only ever show default look text
;*******************************************************************************
ActionScriptDefaultLook:
	bsr.w	ShowDefaultText
	rts

;*******************************************************************************
; used for lookup table conditions that show default use text (no npcs)
;*******************************************************************************
ActionScriptDefaultUse:
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;*******************************************************************************
; used for lookup table conditions that show default take text (no npcs)
;*******************************************************************************
ActionScriptDefaultTake:
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;*******************************************************************************
; end the game
;*******************************************************************************
EndGame:
	; set the end game flag
	move.l	(MEM_GAME_STATE),d7	; copy game state
	and.l	#$0000,d7	; clear all other flags
	bset.l	#STATE_FLAG_END_SCREEN,d7 ; set end screen state flag	
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	;---------------------------------------------------------------------------
	; determine which ending to load
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY07_PERFECT_ENDING,d7	; perfect ending achieved?
	beq.s	.1	; perfect ending not achieved
	lea	SceneEndingPerfect0,a6	; last screen of perfect ending
	bra.s	EndGameLoadScene	; load the scene
.1
	btst.l	#EVENT_FLAG_DAY07_GOOD_ENDING,d7	; good ending achieved?
	beq.s	EndGameBadEnding	; good ending not achieved
	lea	SceneEndingGood3,a6	; last screen of good ending
	bra.s	EndGameLoadScene	; load the scene
EndGameBadEnding:
	lea	SceneEndingBad3,a6	; last screen of bad ending
EndGameLoadScene:
	jsr	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in
	rts

;*******************************************************************************
; default text for look events
;*******************************************************************************
	include	'sub_ShowDefaultText.X68'

;*******************************************************************************
; scene exit actions - a lot of the game flow is in here, probably too much
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

;-------------------------------------------------------------------------------
; player uses a radio
;-------------------------------------------------------------------------------
DefaultRadioUse:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	bclr.l	#DIALOG_FLAG_STYLE_TITLED,d6	; clear the titled flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	RadioMenu,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;*******************************************************************************
; default take actions
;*******************************************************************************
	include	'actionscript/ActionScriptDefaultTake.X68'


