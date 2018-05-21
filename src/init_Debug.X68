;-------------------------------------------------------------------------------
; loads debug data before MainGameLoop starts
; _DEBUG_ symbol controls whether this is compiled
;-------------------------------------------------------------------------------

	if	_DEBUG_

	;---------------------------------------------------------------------------
	; used to test starting at day 1
	;---------------------------------------------------------------------------
;	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; update sprite
;	move.w	#$0001,(MEM_DAY)	; move to day 01
;	move.l	(MEM_GAME_STATE),d7	; copy game state
;	bclr.l	#STATE_FLAG_EXPLORING,d7	; clear exploring flag
;	move.l	d7,(MEM_GAME_STATE)	; save updated game state
;	move.l	(MEM_PLAYER_STORE_KEYS),d7
;	bset.l	#$8,d7
;	move.l	d7,(MEM_PLAYER_STORE_KEYS)
;
;	; queue the scripted event
;	lea ScriptedEventDay01Start,a6	; point a6 to event to load
;	bsr.w QueueScriptedEvent	; queue the event

	;---------------------------------------------------------------------------
	; used to test closing animation on day 0 scene 0
	;---------------------------------------------------------------------------
;	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
;	bset.l	#$7,d7	; set flag 7
;	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back

	;---------------------------------------------------------------------------
	; used to test exit sequence on day 0 scene 0
	;---------------------------------------------------------------------------
;	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
;	bclr.l	#STATE_FLAG_EXITS_BLOCKED,d7	; clear flag blocking the exits
;	move.l	d7,(MEM_GAME_STATE)	; copy updated game state back

	endif
