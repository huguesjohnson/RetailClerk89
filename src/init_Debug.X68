;-------------------------------------------------------------------------------
; loads debug data before MainGameLoop starts
; _DEBUG_ symbol controls whether this is compiled
;-------------------------------------------------------------------------------

	if	_DEBUG_
	
	;---------------------------------------------------------------------------
	; used to test starting at day 02
	;---------------------------------------------------------------------------
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	move.l	#$00000000,(MEM_NPC_LOCATION_PARKINGLOT)	; update NPCs
	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL)	; update NPCs
	move.l	#$06000000,(MEM_NPC_LOCATION_CHECKERS)	; update NPCs
	move.l	#$05010000,(MEM_NPC_LOCATION_DENIMCOUNTRY)	; update NPCs
	move.w	#$0002,(MEM_DAY)	; move to day 02
	move.l	(MEM_GAME_STATE),d7	; copy game state
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	bclr.l	#STATE_FLAG_EXPLORING,d7	; clear exploring flag
	bclr.l	#STATE_FLAG_MALL_CLOSED,d7	; clear mall closed flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS)	; clear day event flags
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission event flags
	and.l	#$00000000,(MEM_SCENE_BGM)	; clear the background music reference
	move.w	#OBJ_ITEM_TEN_DOLLAR,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
;	lea ScriptedEventDay02Start,a6	; point a6 to event to load
;	bsr.w QueueScriptedEvent	; queue the event

	;---------------------------------------------------------------------------
	; used to test starting at the second half of day 2
	;---------------------------------------------------------------------------
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	move.w	#OBJ_ITEM_TEN_DOLLAR,d7	; copy item id to d7
	bsr.w	RemoveItem	; remove item from inventory
	move.w	#OBJ_ITEM_QUARTERS,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#EVENT_FLAG_DAY02_SUB00_COMPLETE,d7	
	bset.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	
	move.l	d7,(MEM_DAY_EVENT_FLAGS)

	;---------------------------------------------------------------------------
	; used to test end of day 02
	;---------------------------------------------------------------------------
	; update NPCs in SCENE_VB
	move.l	#$16000000,(MEM_NPC_LOCATION_VB)	; update NPCs
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#EVENT_FLAG_DAY02_SUB02_COMPLETE,d7	
	bset.l	#EVENT_FLAG_DAY02_MID_EVENT,d7
	bset.l	#EVENT_FLAG_DAY02_SUB02_STARTED,d7
	bset.l	#EVENT_FLAG_DAY02_SUB02_MID,d7	
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; update sprite
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_VB,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	move.w	#OBJECTIVE_D2_O2,(MEM_OBJECTIVE)

	;---------------------------------------------------------------------------
	; used to test starting at day 1
	;---------------------------------------------------------------------------
;	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; update sprite
;	move.w	#$0001,(MEM_DAY)	; move to day 01
;	move.l	(MEM_GAME_STATE),d7	; copy game state
;	bclr.l	#STATE_FLAG_EXPLORING,d7	; clear exploring flag
;	move.l	d7,(MEM_GAME_STATE)	; save updated game state
;	move.l	(MEM_PLAYER_STORE_KEYS),d7
;	bset.l	#STORE_KEY_DCOUNTRY,d7
;	move.l	d7,(MEM_PLAYER_STORE_KEYS)
;	; update NPCs
;	move.l	#$03160000,(MEM_NPC_LOCATION_VB)	; update NPCs in scene 00
;	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL)	; update NPCs in east-east
;	move.l	#$06021719,(MEM_NPC_LOCATION_CHECKERS)	; update NPCs in checkers

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

	; test 2nd half of day 01
;	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
;	bset.l	#EVENT_FLAG_DAY01_SUB00_COMPLETE,d7	; set flag 
;	bset.l	#EVENT_FLAG_DAY01_SUB01_COMPLETE,d7	; set flag 
;	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back

	; test end of day 01
;	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
;	bset.l	#MISSION_FLAG_DAY01_SUB02_D1,d7	; set flag
;	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
;	move.w	#PLAYER_SPRITE_DB,(MEM_PLAYER_SPRITE)	; update sprite
;	move.l	#$05010000,(MEM_NPC_LOCATION_DENIMCOUNTRY)	; update NPCs

	; test store key handling
;	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
;	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
;	move.l	d7,(MEM_GAME_STATE)	; save game state

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
