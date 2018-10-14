;-------------------------------------------------------------------------------
; loads debug data before MainGameLoop starts
; _DEBUG_ symbol controls whether this is compiled
;-------------------------------------------------------------------------------

	if	_DEBUG_

	;---------------------------------------------------------------------------
	; used to test starting at day 1
	;---------------------------------------------------------------------------
	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; update sprite
	move.w	#$0001,(MEM_DAY)	; move to day 01
	move.l	(MEM_GAME_STATE),d7	; copy game state
	bclr.l	#STATE_FLAG_EXPLORING,d7	; clear exploring flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	; update NPCs
	lea MEM_NPC_LOCATIONS,a5	; point a5 to start of NPC location table
	move.l	#$03160000,(a5)	; update NPCs in scene 00
	lea MEM_NPC_LOCATIONS,a5	; point a5 to start of NPC location table
	move.w	#SCENE_ID_EEHALL,d7	; copy east-east hall scene ID to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by word size
	adda.l	d7,a5	; move a5 to the address for east-east hall NPCs
	and.l	#$00000000,(a5)	; update NPCs in east-east hall
	lea MEM_NPC_LOCATIONS,a5	; point a5 to start of NPC location table
	move.w	#SCENE_ID_CHECKERS,d7	; copy east-east hall scene ID to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by word size
	adda.l	d7,a5	; move a5 to the address for east-east hall NPCs
	move.l	#$06021719,(a5)	; update NPCs in checkers

;	; queue the scripted event
;	lea ScriptedEventDay01Start,a6	; point a6 to event to load
;	bsr.w QueueScriptedEvent	; queue the event

;	; test scene change scripted event
;	lea TestScriptedEventSceneChange,a6	; point a6 to event to load
;	bsr.w QueueScriptedEvent	; queue the event

	;---------------------------------------------------------------------------
	; used to test checkers subquest in day 1
	;---------------------------------------------------------------------------
;	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags to d7
;	bset.l	#MISSION_FLAG_DAY01_SUB00_STARTED,d7	;set flag to start mission
;;	; setting these three tests the exit scene
;	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC1_DONE,d7
;	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC2_DONE,d7
;	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC3_DONE,d7
;	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save event flags

;	; test 2nd half of day 01
;	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
;	bset.l	#EVENT_FLAG_DAY01_SUB00_COMPLETE,d7	; set flag 
;	bset.l	#EVENT_FLAG_DAY01_SUB01_COMPLETE,d7	; set flag 
;	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back

;	;---------------------------------------------------------------------------
;	; used to test closing animation on day 0 scene 0
;	;---------------------------------------------------------------------------
;	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
;	bset.l	#$7,d7	; set flag 7
;	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back

	;---------------------------------------------------------------------------
	; used to test exit sequence on day 0 scene 0
	;---------------------------------------------------------------------------
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bclr.l	#STATE_FLAG_EXITS_BLOCKED,d7	; clear flag blocking the exits
	move.l	d7,(MEM_GAME_STATE)	; copy updated game state back

	endif
