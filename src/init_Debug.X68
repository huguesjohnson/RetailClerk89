;-------------------------------------------------------------------------------
; loads debug data before MainGameLoop starts
; _DEBUG_ symbol controls whether this is compiled
;-------------------------------------------------------------------------------

	if	_DEBUG_

DebugTable:
	dc.l	DebugStartDay0Title	
	dc.l	DebugStartDay0Mid	
	dc.l	DebugStartDay1Title	
	dc.l	DebugStartDay1Mid	
	dc.l	DebugStartDay1End	
	dc.l	DebugStartDay2Title	
	dc.l	DebugStartDay2Mid	
	dc.l	DebugStartDay2End	
	dc.l	DebugStartDay3Title	
	dc.l	DebugStartDay3Mid	
	dc.l	DebugStartDay4Title	
	dc.l	DebugStartDay4Mid	
	dc.l	DebugStartDay4End	
	dc.l	DebugStartDay5Title	
	dc.l	DebugStartDay5Blizzard	
	dc.l	DebugStartDay5Camp	
	dc.l	DebugStartDay5End	
	dc.l	DebugStartDay6Title	
	dc.l	DebugStartDay0Title	
	dc.l	DebugStartDay0Title	
	dc.l	DebugStartDay0Title	
	dc.l	DebugStartDay0Title	
	dc.l	DebugStartDay0Title	
	dc.l	DebugStartDay0Title	
	dc.l	DebugStartDay0Title	
	dc.l	DebugStartDay0Title	
	dc.l	DebugStartEnd

ProcessDebugScreen:
	; process start press
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_START_PRESSED,d6	; test if the start button was pressed
	beq.s	ProcessDebugScreenTestDpad	; start not pressed, branch
	lea	DebugTable,a5	; point to the table
	move.w	(MEM_MENU_SELECTION),d7	; copy scene ID to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by lword size to get offset
	adda.w	d7,a5	; move to offset location
	move.w	#$0000,(MEM_MENU_SELECTION)	; clear menu selection
	; clear debug flag	
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bclr.l	#STATE_FLAG_DEBUG_MENU,d7 ; set debug menu flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	move.l	(a5),a6	; a5 has the address of the subroutine to jump to
	jsr	(a6)	; jump to location of code to process this event
	bra.w	ExitProcessDebugScreen	; exit
ProcessDebugScreenTestDpad:
	; process dpad press
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_UP_PRESSED,d6	; test if the up button was pressed
	bne.s	ProcessDebugScreenDecrementSelector	; up pressed, branch
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_DOWN_PRESSED,d6	; test if the down button was pressed
	bne.s	ProcessDebugScreenIncrementSelector	; down pressed, branch
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_LEFT_PRESSED,d6	; test if the left button was pressed
	bne.s	ProcessDebugScreenDecrementSelector	; left pressed, branch
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_RIGHT_PRESSED,d6	; test if the right button was pressed
	bne.s	ProcessDebugScreenIncrementSelector	; right pressed, branch
	bra.w	ProcessDebugScreenMoveSelector
ProcessDebugScreenIncrementSelector:
	cmpi.w	#$001A,(MEM_MENU_SELECTION)
	bne.s	.1
	move.w	#$0000,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
.1
	add.w	#$0001,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
ProcessDebugScreenDecrementSelector:
	cmpi.w	#$0000,(MEM_MENU_SELECTION)
	bne.s	.1
	move.w	#$001A,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
.1
	sub.w	#$0001,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
ProcessDebugScreenMoveSelector:
	; move selector sprite based on menu selection
	move.w	(MEM_MENU_SELECTION),d7	; copy current value to d7
	mulu.w	#$0008,d7	; rows are 8 apart
	add.w	#$0088,d7	; first row is 128
	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	d7,(VDP_DATA)	; copy the new y-coordinate
	add.l	#$00060000,d6	; move to x-coordinate
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	#$0080,(VDP_DATA)	; copy the new x-coordinate
ExitProcessDebugScreen:
	bra.w	MainGameLoop

DebugStartDay0Title:
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; set the intro screen counter
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay00,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the new scene
	rts

DebugStartDay0Mid:
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bset.l	#STATE_FLAG_EXPLORING,d7 ; set exploring flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	lea	SceneWWHall,a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite
	move.l	#$01000000,(MEM_NPC_LOCATION_PARKINGLOT)
	bsr.w	FadeIn	; fade in to the new scene
	rts

DebugStartDay1Title:
	bsr.w	Day00End
	rts

DebugStartDay1Mid:
	bsr.w	Day00End
	bsr.w	FadeOut
	; update the objective
	move.w	#OBJECTIVE_D1_O1,(MEM_OBJECTIVE)
	; clear the scripted event and intro screen
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; set the scripted event flag
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear intro screen flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; set exploring flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	move.w	#$0000,(MEM_INTRO_SCENE_COUNTER)
	; run the mid event
	bsr.w	ExitSceneDay01SwitchPC
	rts

DebugStartDay1End:
	bsr.w	DebugStartDay1Mid
	bsr.w	FadeOut
	; clear the scripted event and intro screen
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; set the scripted event flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	; set flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	bset.l	#MISSION_FLAG_DAY01_SUB02_STARTED,d7	; set flag
	bset.l	#MISSION_FLAG_DAY01_SUB02_D0,d7	; set flag
	bset.l	#MISSION_FLAG_DAY01_SUB02_D1,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; update the objective
	move.w	#OBJECTIVE_D1_O1,(MEM_OBJECTIVE)
	; load the scene
	move.w	#PLAYER_SPRITE_DB,(MEM_PLAYER_SPRITE)
	lea	SceneDeminCountry,a6
	bsr.w	LoadScene
	bsr.w	LoadPlayerSprite
	bsr.w	OrderSprites
	bsr.w	FadeIn
	rts

DebugStartDay2Title:
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_CHECKERS,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	bsr.w	Day01End
	rts

DebugStartDay2Mid:
	bsr.w	DebugStartDay2Title
	bsr.w	FadeOut
	; clear the scripted event and intro screen
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; set the scripted event flag
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear screen flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; set exploring flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	move.w	#$0000,(MEM_INTRO_SCENE_COUNTER)
	; setup game state
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	move.w	#OBJ_ITEM_TEN_DOLLAR,d7	; copy item id to d7
	bsr.w	RemoveItem	; remove item from inventory
	move.w	#OBJ_ITEM_QUARTERS,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#EVENT_FLAG_DAY02_SUB00_COMPLETE,d7	
	bset.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	; load the starting scene
	lea	SceneVB,a6
	bsr.w	LoadScene
	bsr.w	LoadPlayerSprite
	bsr.w	OrderSprites
	bsr.w	FadeIn
	rts

DebugStartDay2End:
	bsr.w	DebugStartDay2Mid
	bsr.w	FadeOut
	; clear the scripted event and intro screen
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; set the scripted event flag
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear screen flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; set exploring flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	move.w	#$0000,(MEM_INTRO_SCENE_COUNTER)
	rts

DebugStartDay3Title:
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_VB,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	bsr.w	Day02End
	rts

DebugStartDay3Mid:
	bsr.w	DebugStartDay3Title
	bsr.w	FadeOut
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_EXPLORING,d7	; set exploring flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	bset.l	#EVENT_FLAG_DAY03_SUB_TLODGE_STARTED,d7	; set started flag
	bset.l	#EVENT_FLAG_DAY03_SUB_TLODGE_COMPLETE,d7	; set complete flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update keys
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_TLODGE,d7	; set key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save keys
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission flags
	move.w	#OBJECTIVE_D3_O1,(MEM_OBJECTIVE)	; update the objective
	; update NPCs
	move.l	#$031B0000,(MEM_NPC_LOCATION_VB)
	move.l	#$1A050B00,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$00000000,(MEM_NPC_LOCATION_WWHALL)
	; queue the scripted event
	lea ScriptedEventDay03ChangePC,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay03ScriptedEventMid00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

DebugStartDay4Title:
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_VB,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	bset.l	#STORE_KEY_TLODGE,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	bsr.w	Day03End
	rts

DebugStartDay4Mid:
	move.w	#$0004,(MEM_DAY)	; move to day 04
	move.w	#OBJECTIVE_D4_O0,(MEM_OBJECTIVE)	; update objective
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_VB,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	bset.l	#STORE_KEY_TLODGE,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	move.l	(MEM_GAME_STATE),d7
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear screen flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; set exploring flag
	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
	move.l	d7,(MEM_GAME_STATE)
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7
	bset.l	#EVENT_FLAG_DAY04_SUB_NPCFOUND,d7
	bset.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7
	bset.l	#EVENT_FLAG_DAY04_SUB_TBOOKS_DIALOG,d7
	; toggle these to test different transitions	
	;bset.l	#EVENT_FLAG_DAY04_SUB_CHOICE0,d7
	bset.l	#EVENT_FLAG_DAY04_SUB_CHOICE1,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	; add some good and bad items to the inventory
	move.w	#OBJ_ITEM_RBOOK4,d7
	bsr.w	AddItem
	move.w	#OBJ_ITEM_CAMERA1,d7
	bsr.w	AddItem
	move.w	#OBJ_ITEM_HBOOK3,d7
	bsr.w	AddItem
	move.w	#OBJ_ITEM_MYSTERY_PACKAGE,d7
	bsr.w	AddItem
	; load scene
	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)
	lea	SceneCenter,a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite
	move.l	#$01000000,(MEM_NPC_LOCATION_PARKINGLOT)
	bsr.w	FadeIn	; fade in to the new scene
	rts

DebugStartDay4End:
	move.w	#$0004,(MEM_DAY)	; move to day 04
	move.w	#OBJECTIVE_D4_O0,(MEM_OBJECTIVE)	; update objective
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_VB,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	bset.l	#STORE_KEY_TLODGE,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	move.l	(MEM_GAME_STATE),d7
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear screen flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; set exploring flag
	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
	move.l	d7,(MEM_GAME_STATE)
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7
	bset.l	#EVENT_FLAG_DAY04_SUB_NPCFOUND,d7
	bset.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7
	bset.l	#EVENT_FLAG_DAY04_SUB_TBOOKS_DIALOG,d7
	bset.l	#EVENT_FLAG_DAY04_SUB_GIFT_GIVEN,d7
	bset.l	#EVENT_FLAG_DAY04_SUB_COMPLETE,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	; update NPCs
	move.l	#$03000000,(MEM_NPC_LOCATION_VB)
	move.l	#$01000000,(MEM_NPC_LOCATION_PARKINGLOT)
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	; load scene	
	lea	SceneParkingLot,a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite
	move.l	#$01000000,(MEM_NPC_LOCATION_PARKINGLOT)
	bsr.w	FadeIn	; fade in to the new scene
	rts

DebugStartDay5Title:
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_VB,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	bset.l	#STORE_KEY_TLODGE,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	bsr.w	Day04End
	rts

DebugStartDay5Blizzard:
	move.w	#$0005,(MEM_DAY)	; move to day 05
	move.w	#OBJECTIVE_D5_O1,(MEM_OBJECTIVE)	; update objective
	; update store keys	
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_VB,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	bset.l	#STORE_KEY_TLODGE,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	; update game state
	move.l	(MEM_GAME_STATE),d7
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear screen flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; set exploring flag
	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
	move.l	d7,(MEM_GAME_STATE)
	; update event flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_WEATHER,d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_TALKDANI,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	; update NPCs
	move.l	#$03000000,(MEM_NPC_LOCATION_VB)
	move.l	#$00000000,(MEM_NPC_LOCATION_CENTER)
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$11010000,(MEM_NPC_LOCATION_SHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_CHECKERS)
	move.l	#$00000000,(MEM_NPC_LOCATION_TLODGE)
	move.l	#$00000000,(MEM_NPC_LOCATION_SVIDEO)
	move.l	#$00000000,(MEM_NPC_LOCATION_WORKSHOP)
	move.l	#$00000000,(MEM_NPC_LOCATION_CPLANET)
	move.l	#$00000000,(MEM_NPC_LOCATION_CNOW)
	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_TBOOKS)
	move.l	#$12000000,(MEM_NPC_LOCATION_FCBCHECKOUT)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBFISHING)
	move.l	#$00000000,(MEM_NPC_LOCATION_SOUTH_CENTER)
	; load scene
	lea	SceneSouthHall,a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite
	bsr.w	FixSprites
	bsr.w	FadeIn	; fade in to the new scene
	rts

DebugStartDay5Camp:
	move.w	#$0005,(MEM_DAY)	; move to day 05
	move.w	#OBJECTIVE_D5_O1,(MEM_OBJECTIVE)	; update objective
	; update store keys	
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_VB,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	bset.l	#STORE_KEY_TLODGE,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	; update game state
	move.l	(MEM_GAME_STATE),d7
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear screen flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; set exploring flag
	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
	move.l	d7,(MEM_GAME_STATE)
	; update event flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_WEATHER,d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_TALKDANI,d7
	bset.l	#EVENT_FLAG_DAY05_SUB_STARTED,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	; update mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7
	bset.l	#MISSION_FLAG_DAY05_READBOOK,d7
	bset.l	#MISSION_FLAG_DAY05_FOOD0GET,d7
	bset.l	#MISSION_FLAG_DAY05_FOOD1GET,d7
	bset.l	#MISSION_FLAG_DAY05_FOOD0GIVE,d7
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)
	; update NPCs
	move.l	#$03000000,(MEM_NPC_LOCATION_VB)
	move.l	#$00000000,(MEM_NPC_LOCATION_CENTER)
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$00000000,(MEM_NPC_LOCATION_SHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_CHECKERS)
	move.l	#$00000000,(MEM_NPC_LOCATION_TLODGE)
	move.l	#$00000000,(MEM_NPC_LOCATION_SVIDEO)
	move.l	#$00000000,(MEM_NPC_LOCATION_WORKSHOP)
	move.l	#$00000000,(MEM_NPC_LOCATION_CPLANET)
	move.l	#$00000000,(MEM_NPC_LOCATION_CNOW)
	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_TBOOKS)
	move.l	#$12160000,(MEM_NPC_LOCATION_FCBCHECKOUT)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBFISHING)
	move.l	#$00000000,(MEM_NPC_LOCATION_SOUTH_CENTER)
	; update player sprite
	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)
	; add item to trigger transition and one for testing
	move.w	#OBJ_ITEM_RELISH,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	move.w	#OBJ_ITEM_QUARTERS,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; load scene
	lea	SceneFCBCheckout,a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite
	bsr.w	FixSprites
	bsr.w	FadeIn	; fade in to the new scene
	rts

DebugStartDay5End:
	move.w	#$0005,(MEM_DAY)	; move to day 05
	move.w	#OBJECTIVE_D5_O1,(MEM_OBJECTIVE)	; update objective
	; update store keys	
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_VB,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	bset.l	#STORE_KEY_TLODGE,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	; update game state
	move.l	(MEM_GAME_STATE),d7
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear screen flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; set exploring flag
	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
	move.l	d7,(MEM_GAME_STATE)
	; update event flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_WEATHER,d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_TALKDANI,d7
	bset.l	#EVENT_FLAG_DAY05_SUB_STARTED,d7
	bset.l	#EVENT_FLAG_DAY05_SUB_COMPLETE,d7
	bset.l	#EVENT_FLAG_DAY05_CAMP_STARTED,d7
	bset.l	#EVENT_FLAG_DAY05_CAMP_COMPLETE,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	; update mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7
	bset.l	#MISSION_FLAG_DAY05_READBOOK,d7
	bset.l	#MISSION_FLAG_DAY05_FOOD0GET,d7
	bset.l	#MISSION_FLAG_DAY05_FOOD1GET,d7
	bset.l	#MISSION_FLAG_DAY05_FOOD0GIVE,d7
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)
	; update NPCs
	move.l	#$03000000,(MEM_NPC_LOCATION_VB)
	move.l	#$00000000,(MEM_NPC_LOCATION_CENTER)
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$00000000,(MEM_NPC_LOCATION_SHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_CHECKERS)
	move.l	#$00000000,(MEM_NPC_LOCATION_TLODGE)
	move.l	#$00000000,(MEM_NPC_LOCATION_SVIDEO)
	move.l	#$00000000,(MEM_NPC_LOCATION_WORKSHOP)
	move.l	#$00000000,(MEM_NPC_LOCATION_CPLANET)
	move.l	#$00000000,(MEM_NPC_LOCATION_CNOW)
	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_TBOOKS)
	move.l	#$12160000,(MEM_NPC_LOCATION_FCBCHECKOUT)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBFISHING)
	move.l	#$00000000,(MEM_NPC_LOCATION_SOUTH_CENTER)
	; update player sprite
	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)
	; add item to trigger transition and one for testing
	move.w	#OBJ_ITEM_RELISH,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	move.w	#OBJ_ITEM_QUARTERS,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; load scene
	lea	SceneFCBCheckout,a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite
	bsr.w	FixSprites
	bsr.w	FadeIn	; fade in to the new scene
	rts

DebugStartDay6Title:
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_TBOOKS,d7
	bset.l	#STORE_KEY_DCOUNTRY,d7
	bset.l	#STORE_KEY_VB,d7
	bset.l	#STORE_KEY_CHECKERS,d7
	bset.l	#STORE_KEY_TLODGE,d7
	bset.l	#STORE_KEY_FCB,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7
	bset.l	#GLOBAL_FLAG_JKEY_CPLANET,d7
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)
	bsr.w	Day05End
	rts

DebugStartEnd:
	bsr.w	EndGame
	rts

	endif
