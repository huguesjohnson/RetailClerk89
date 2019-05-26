;-------------------------------------------------------------------------------
; default exit scene handler
;-------------------------------------------------------------------------------
DefaultExitScene:
	; determine which exit is being used based on sprite direction
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d6	; copy player direction to d6
	mulu.w	#$2,d6	; multiply by 2 to get offset
	lea	MEM_ACTIVE_SCENE_EXIT_S,a6	; point a6 to the first exit
	adda.l	d6,a6	; add offset
	move.w	(a6),d6	; copy location to d6
	cmpi.w	#$FFFF,d6	; is this a valid exit?
	beq.w	ExitDefaultExit	; if not a valid exit then exit subroutine
	;---------------------------------------------------------------------------
	; test if a key is needed to enter the new scene
	;---------------------------------------------------------------------------
	; only test for keys if the mall is closed	
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_MALL_CLOSED,d7	; test mall closed flag
	beq.s	DefaultExitSceneLoadNewScene	; branch if not set
	; don't test for keys when entering/exiting any scene that's not a store	
	cmpi.w	#$00FF,d6	; <$0100 means this this is a store
	bgt.s	DefaultExitSceneLoadNewScene
	cmpi.w	#$00FF,(MEM_ACTIVE_SCENE_ID)	; <$0100 means this this is a store
	bgt.s	DefaultExitSceneLoadNewScene
	; lookup if destination store needs a key
	move.w	d6,d7	; copy destination store to d7 because d6 is used later
	mulu.w	#$2,d7	; multiply by 2 to get offset
	lea	SceneKeyLookupTable,a6	; point a6 to scene key lookup table
	adda.l	d7,a6	; add offset
	move.w	(a6),d7	; copy value of lookup table to d7
	cmpi.w	#$FFFF,d7	; test if the scene has a key
	beq.s	DefaultExitSceneLoadNewScene	; if lookup value is #FFFF branch	
	; now test if the player has the key for this store
	move.l	(MEM_PLAYER_STORE_KEYS),d5	; copy keys to d5
	btst.l	d7,d5	; test if player has the key
	bne.s	DefaultExitSceneLoadNewScene	; player has the key, branch
	;--------------------------------------------------------------------------- 
	; at this point the played needs a key for the store
	; if the day is 05 and EVENT_FLAG_DAY05_EVENT_LEAVING is set
	; then there are different rules
	;--------------------------------------------------------------------------- 
	cmpi.w	#$0005,(MEM_DAY)
	bne.s	DefaultExitSceneNoKey	; branch to default
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7	; test flag
	bne.w	ExitSceneDay05Blizzard	; flag set, branch
DefaultExitSceneNoKey:
	; display message
	lea	DialogTextStoreClosed,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening
	rts
	;---------------------------------------------------------------------------
	; load the new scene
	;---------------------------------------------------------------------------
DefaultExitSceneLoadNewScene:
	mulu.w	#$4,d6	; multiply by 4 to get offset
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d6,a6	; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite
	; move player to the correct position
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d6	; copy player direction to d6
	;---------------------------------------------------------------------------
	; adjust player sprite x/y
	;---------------------------------------------------------------------------
DefaultExitSceneTestDown:
	cmpi.w	#DIRECTION_DOWN,d6	; test for down
	bne.s	DefaultExitSceneTestUp	; direction is not down, test for up
	move.w	#SCENE_ENTER_TOP,(MEM_PLAYER_SPRITE_Y)	; update y location
	bra.w	DefaultExitSceneFixSprites	; exit
DefaultExitSceneTestUp:
	cmpi.w	#DIRECTION_UP,d6	; test for up
	bne.s	DefaultExitSceneTestLeft	; direction is not up, test for left
	move.w	#SCENE_ENTER_BOTTOM,(MEM_PLAYER_SPRITE_Y)	; update y location
	bra.s	DefaultExitSceneFixSprites	; exit
DefaultExitSceneTestLeft:
	cmpi.w	#DIRECTION_LEFT,d6	; test for left
	bne.s	DefaultExitSceneTestRight	; direction is not left, test for right
	move.w	#SCENE_ENTER_RIGHT,(MEM_PLAYER_SPRITE_X)	; update x location
	bra.s	DefaultExitSceneFixSprites	; exit
DefaultExitSceneTestRight:
	cmpi.w	#DIRECTION_RIGHT,d6	; test for right
	bne.s	DefaultExitSceneFixSprites	; should be unreachable
	move.w	#SCENE_ENTER_LEFT,(MEM_PLAYER_SPRITE_X)	; update x location
DefaultExitSceneFixSprites:
	bsr.w	FixSprites ; fix all the sprites
ExitDefaultExit:
	bsr.w	FadeIn ; fade in now that everything is loaded
	rts

;-------------------------------------------------------------------------------
; exit scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
ExitScene00:
	cmpi.w	#$0000,(MEM_DAY)
	beq.s	ExitScene00Day00	; branch to day 0
	cmpi.w	#$0001,(MEM_DAY)
	beq.s	ExitScene00Day01	; branch to day 1
	cmpi.w	#$0002,(MEM_DAY)
	beq.s	ExitScene00Day02	; branch to day 2
	cmpi.w	#$0004,(MEM_DAY)
	beq.w	ExitScene00Day04	; branch to day 4
	bsr.w	DefaultExitScene	; use default handler
	rts
ExitScene00Day00:
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_EXITS_BLOCKED,d7	; test flag blocking the exits
	beq.w	DefaultExitScene	; branch if flag is not set
	; display message
	lea	DialogTextCantLeaveStoreUnattended,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening
	rts
ExitScene00Day01:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test which PC this is
	beq.s	ExitScene00Day01CanExit	; ok to exit
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB02_STARTED,d7	; test if flag is set
	bne.s	ExitScene00Day01CanExit	; flag is set, OK to exit
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TITLED,d7	; set titled flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated flags
	lea	DialogTextDay01Sub02VBExit,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; open the dialog
	rts	; exit
ExitScene00Day01CanExit:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit
ExitScene00Day02:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_MID_EVENT,d7	; test if flag is set
	beq.s	ExitScene00Day02Default	; flag not set, branch
	; update NPCs in SCENE_VB
	move.l	#$16000000,(MEM_NPC_LOCATION_VB)	; update NPCs
ExitScene00Day02Default:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit
ExitScene00Day04:
	; test if a good gift scripted event needs to run
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_GOOD_GIFT,d7	; test flag
	beq.s	ExitScene00Day04Default	; not set, branch to default exit
	bclr.l	#EVENT_FLAG_DAY04_SUB_GOOD_GIFT,d7	; clear flag to prevent replay
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	btst.l	#EVENT_FLAG_DAY04_SUB_CHOICE1,d7	; test which branch to follow
	bne.s	ExitScene00Day04Gift1
ExitScene00Day04Gift0:
	move.l	#$09000000,(MEM_NPC_LOCATION_WWHALL)	; move npc to hallway
	; add store key
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_SVIDEO,d7	; set key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save keys
	; queue the scripted event
	lea ScriptedEventDay04GoodGift0,a6	; point a6 to event to load
	bsr.w	QueueScriptedEvent	; queue the event
	rts
ExitScene00Day04Gift1:
	move.l	#$0C000000,(MEM_NPC_LOCATION_WWHALL)	; move npc to hallway
	; add store key
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_CPLANET,d7	; set key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save keys
	; queue the scripted event
	lea ScriptedEventDay04GoodGift1,a6	; point a6 to event to load
	bsr.w	QueueScriptedEvent	; queue the event
	rts
ExitScene00Day04Default:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 01 (SCENE_ID_WWHALL)
;-------------------------------------------------------------------------------
ExitScene01:
	cmpi.w	#$0006,(MEM_DAY)	; is this day 06?
	beq.w	ExitScene01Day06	; branch to day 06
	cmpi.w	#$0005,(MEM_DAY)	; is this day 05?
	beq.w	ExitScene01Day05	; branch to day 05
	cmpi.w	#$0004,(MEM_DAY)	; is this day 04?
	beq.w	ExitScene01Day04	; branch to day 04
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.s	ExitScene01Default	; not exiting north
	cmpi.w	#$0002,(MEM_DAY)	; is this day 02?
	beq.s	ExitScene01Day02	; branch to day 02
	cmpi.w	#$0003,(MEM_DAY)	; is this day 03?
	beq.s	ExitScene01Day03	; branch to day 03
ExitScene01Default:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit
ExitScene01Day02:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB00_COMPLETE,d7	; test if flag is set
	beq.s	ExitScene01Day02CantExit	; flag not set, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if flag is set
	beq.s	ExitScene01Day02CantExit	; flag not set, branch
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test which PC this is
	bne.s	ExitScene01Day02Default	; branch to default handler
	; test if the midpoint scripted event needs to run	
	btst.l	#EVENT_FLAG_DAY02_MID_EVENT,d7	; test if flag is set
	beq.s	ExitScene01Day02ScriptedEvent	; flag not set, branch
ExitScene01Day02Default:
	bra.w	DefaultExitScene	; use default handler
	rts	
ExitScene01Day02CantExit:
	; display message
	lea	DialogTextDay02SubsNotComplete,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening
	rts
ExitScene01Day02ScriptedEvent:
	bset.l	#EVENT_FLAG_DAY02_MID_EVENT,d7	; set flag
	bset.l	#EVENT_FLAG_DAY02_SUB02_STARTED,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save event flags
	; increment the objective text
	move.w	#OBJECTIVE_D2_O2,(MEM_OBJECTIVE)
	; queue the scripted event
	lea ScriptedEventDay02Mid,a6	; point a6 to event to load
	bsr.w	QueueScriptedEvent	; queue the event
	rts
ExitScene01Day03:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_TLODGE_COMPLETE,d7	; test if flag is set
	beq.s	ExitScene01Day03CantExit	; flag not set, branch
	bra.w	DefaultExitScene	; use default handler
	rts
ExitScene01Day03CantExit:
	; display message
	lea	DialogTextDay03CantEnterVB,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening
	rts
ExitScene01Day04:
	; test if player is trying to enter tbooks
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.s	ExitScene01Day04Default	; not exiting north
	;---------------------------------------------------------------------------
	; if EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED is set
	; and
	; EVENT_FLAG_DAY04_SUB_TBOOKS_DIALOG is not set
	; then launch scripted event and set EVENT_FLAG_DAY04_SUB_TBOOKS_DIALOG
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if flag is set
	beq.s	ExitScene01Day04Default	; not set, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_TBOOKS_DIALOG,d7	; test if flag is set
	bne.s	ExitScene01Day04Default	; flag set, branch
	; launch the scripted event
	bset.l	#EVENT_FLAG_DAY04_SUB_TBOOKS_DIALOG,d7	; set flag 
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	; queue the scripted event
	lea ScriptedEventDay04TBooks,a6	; point a6 to event to load
	bsr.w	QueueScriptedEvent	; queue the event
	rts
ExitScene01Day04Default:
	bra.w	DefaultExitScene	; use default handler
	rts
ExitScene01Day05:
	; test if player is trying to enter fcbcheckout
	cmpi.w	#DIRECTION_LEFT,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.s	ExitScene01Day05Default	; not exiting west
	;---------------------------------------------------------------------------	
	; scripted event should launch if
	; EVENT_FLAG_DAY05_EVENT_SNOWEDIN = 1
	; EVENT_FLAG_DAY05_SUB_STARTED = 0
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY05_EVENT_SNOWEDIN,d7	; test if flag is set
	beq.s	ExitScene01Day05Default	; flag not set, branch
	btst.l	#EVENT_FLAG_DAY05_SUB_STARTED,d7	; test if flag is set
	bne.s	ExitScene01Day05Default	; flag set, branch
	bset.l	#EVENT_FLAG_DAY05_SUB_STARTED,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; launch the scripted event
	lea ScriptedEventDay05StartSub,a6	; point a6 to event to load
	bsr.w	QueueScriptedEvent	; queue the event
	rts
ExitScene01Day05Default:
	bra.w	DefaultExitScene	; use default handler
	rts
ExitScene01Day06:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_COMPLETE,d7	; test if mission complete
	bne.w	ExitScene01Day06MissionComplete	; branch if mission complete
	btst.l	#EVENT_FLAG_DAY06_MISSION_STARTED,d7	; test if mission started
	bne.w	ExitScene01Day06MissionInProgress	; branch if mission in-progress
	; test if player is trying to enter vb
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.s	ExitScene01Day06Default	; not exiting north
	;---------------------------------------------------------------------------
	; if EVENT_FLAG_DAY06_SUB00_COMPLETE=1
	; and 
	; EVENT_FLAG_DAY06_MISSION_STARTED=0
	; then prompt to start the night mission
	;---------------------------------------------------------------------------
	btst.l	#EVENT_FLAG_DAY06_SUB00_COMPLETE,d7	; test if subquest complete
	beq.s	ExitScene01Day06Default	; branch if not complete
	; else setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDay06EnterVB,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts
ExitScene01Day06MissionInProgress:
	; test if player is trying to enter vb
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.s	ExitScene01Day06Default	; not going up, branch 
	; display message
	lea	DialogTextDay06CantGoBack,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene01Day06MissionComplete:
	; test if player is trying to go east
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene01Day06Default	; going east branch 
	; display message
	lea	DialogTextDay06Hurry,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene01Day06Default:
	bra.w	DefaultExitScene	; use default handler
	rts

;-------------------------------------------------------------------------------
; exit scene 02 (SCENE_ID_WEHALL)
;-------------------------------------------------------------------------------
ExitScene02:
	cmpi.w	#$0006,(MEM_DAY)	; is this day 06?
	beq.w	ExitScene02Day06	; branch to day 06
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit
ExitScene02Day06:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_COMPLETE,d7	; test if mission complete
	bne.s	ExitScene02Day06MissionComplete	; branch if mission complete
	btst.l	#EVENT_FLAG_DAY06_MISSION_STARTED,d7	; test if mission started
	beq.s	ExitScene02Day06Default	; branch if mission not in-progress
ExitScene02Day06MissionInProgress:
	; test if player is trying to go south
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene02Day06MissionInProgressWEHallToCNow	; branch
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.s	ExitScene02Day06Default	; not going right, branch
 	; display message
	lea	DialogTextDay06CantGetCaught,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene02Day06MissionInProgressWEHallToCNow:
	; good enough place to update npcs in VB since it has to be done eventually
	move.l	#$12010000,(MEM_NPC_LOCATION_VB)	; Jordan and Dani
	; queue the scripted event
	lea ScriptedEventDay06WEHallToCNow,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts	; exit
ExitScene02Day06MissionComplete:
	; test if player is trying to go east
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene02Day06Default	; going east branch 
	; display message
	lea	DialogTextDay06Hurry,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene02Day06Default:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
ExitScene03:
	; different rules for day06 at the ending
	cmpi.w	#$0006,(MEM_DAY)	; test day
	bne.s	ExitScene03Default	; branch if not day06
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_COMPLETE,d7	; test if mission complete
	beq.s	ExitScene03Default	; branch if mission not complete
	; test if player is trying to go north
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene03Day06Event	; going north, branch 
	; can't exit other directions - display message
	lea	DialogTextDay06Hurry,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene03Default:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit
ExitScene03Day06Event:
	; set EVENT_FLAG_DAY06_ENDING_OPEN
	bset.l	#EVENT_FLAG_DAY06_ENDING_OPEN,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update NPCs in nshack
	move.l	#$0A010000,(MEM_NPC_LOCATION_NSHACK)
	lea ScriptedEventDay06Ending0,a6
	bsr.w QueueScriptedEvent	; queue the event
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 04 (SCENE_ID_SHALL)
;-------------------------------------------------------------------------------
ExitScene04:
	; different rules for day05
	cmpi.w	#$0005,(MEM_DAY)	; test day
	beq.w	ExitScene04Day05	; branch if day05
	; different rules for day06
	cmpi.w	#$0006,(MEM_DAY)	; test day
	bne.w	ExitScene04Default	; branch if not
	; has the scripted event already run?
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_EVENT_PLAN,d7	; test event flag
	bne.s	ExitScene04Day06ResetNPCs	; branch if the event has already run
	; is the player entering nshack?
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.w	ExitScene04Default	; not exiting east
	;---------------------------------------------------------------------------
	; run the scripted event for day06 and update flags (not in that order)
	;---------------------------------------------------------------------------
	bset.l	#EVENT_FLAG_DAY06_EVENT_PLAN,d7	; test event flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save event flags
	; update keys
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_NSHACK,d7	; add the nshack key
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d6	; copy global flags to d6
	btst.l	#GLOBAL_FLAG_JKEY_CPLANET,d6	; does Jordan have cplanet key?
	beq.s	.1	; branch if not
	bset.l	#STORE_KEY_CPLANET,d7	; add the cplanet key
.1
	btst.l	#GLOBAL_FLAG_JKEY_SVIDEO,d6	; does Jordan have svideo key?
	beq.s	.2	; branch if not
	bset.l	#STORE_KEY_SVIDEO,d7	; add the svideo key
.2
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save updated keys
	; queue the scripted event
	lea ScriptedEventDay06Plan,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts	; exit
ExitScene04Day06ResetNPCs:	; reset npcs on day06
	move.l	#$0A000000,(MEM_NPC_LOCATION_NSHACK)
ExitScene04Default:
	; all other days
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_MALL_CLOSED,d7	; test mall closed flag
	bne.w	ExitScene04DefaultExit	; mall is closed, branch
	; mall is still open so the player can't exit south
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.w	ExitScene04DefaultExit	; not exiting south
	; display message
	lea	DialogTextNotTimeToLeave,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene04Day05:
	; test if not going to the parking lot
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene04Day05ParkingLot	; exiting south
	; test if NPCs need to be cleared from the scene
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_EVENT_SNOWEDIN,d7	; test flag
	beq.w	ExitScene04DefaultExit	; branch if not set
	move.l	#$00000000,(MEM_NPC_LOCATION_SHALL)	; clear NPCs	
	bra.w	ExitScene04DefaultExit	; exit
ExitScene04Day05ParkingLot:
	; test if the player is snowed-in for the night
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_EVENT_SNOWEDIN,d7	; test flag
	bne.s	ExitScene04Day05SnowedIn	; branch if set
	; test if the scripted event should run
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_EVENT_TALKDANI,d7	; test flag
	bne.s	ExitScene04Day05ScriptedEvent	; branch if set
	; test if the player is trying to leave early
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7	; test flag
	bne.s	ExitScene04Day05Leaving	; branch if set
	; default
	lea	DialogTextNotTimeToLeave,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene04Day05SnowedIn:
	lea	DialogTextDay05ExitParkingLot1,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene04Day05ScriptedEvent:
	; update game state
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_SNOWEDIN,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update NPCs
	move.l	#$12160000,(MEM_NPC_LOCATION_FCBCHECKOUT)
	move.l	#$00000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	; update objective
	move.w	#OBJECTIVE_D5_O2,(MEM_OBJECTIVE)
	; queue the scripted event
	lea ScriptedEventDay05SnowedIn,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts	; exit
ExitScene04Day05Leaving:
	lea	DialogTextDay05ExitParkingLot0,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene04DefaultExit:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 05 (parking lot)
;-------------------------------------------------------------------------------
ExitScene05:
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene05Down	; player moving down, show dialog
	bsr.w	DefaultExitScene	; use default handler
	rts
ExitScene05Down:
	; display message
	lea	DialogTextLongWalk,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 06 (SCENE_ID_EWHALL)
;-------------------------------------------------------------------------------
ExitScene06:
	cmpi.w	#$0001,(MEM_DAY)	; is it day 01?
	beq.s	ExitScene06Day01	; branch to day 01 logic
	cmpi.w	#$0006,(MEM_DAY)	; is it day 06?
	beq.s	ExitScene06Day06	; branch to day 06 logic
	bra.w	ExitScene06Default	; use default handler
ExitScene06Day01:
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; test direction
	bne.w	ExitScene06Default	; ok to exit
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test which PC this is
	bne.s	ExitScene06Day01Sub02	; must be in sub02
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy game state to d7
	btst.l	#EVENT_FLAG_DAY01_SUB00_COMPLETE,d7	; test flag blocking the exits
	beq.s	ExitScene06Day01CantExit	; flag not set = can't exit
	btst.l	#EVENT_FLAG_DAY01_SUB01_COMPLETE,d7	; test flag blocking the exits
	beq.s	ExitScene06Day01CantExit	; flag not set = can't exit
	bsr.w	ExitSceneDay01SwitchPC	; switch to DB for the 2nd half of the day
	rts
ExitScene06Day01CantExit:
	; can't exit the scene - display message
	lea	DialogTextDay01CantReturnYet,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene06Day01Sub02:
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy game state to d7
	btst.l	#MISSION_FLAG_DAY01_SUB02_D1,d7	; test if mission is complete
	beq.s	ExitScene06Day01Sub02CantExit	; flag not set = can't exit
	bra.s	ExitScene06Default	; ok to exit
	rts
ExitScene06Day01Sub02CantExit:
	; can't exit the scene - display message
	lea	DialogTextDay01Sub02CantEnter,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene06Day06:
	; test event flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_SUB00_STARTED,d7	; test flag
	beq.s	ExitScene06Default	; not set, branch
	; test if trying to go west	
	cmpi.w	#DIRECTION_LEFT,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.w	ExitScene06Default	; not exiting west
 	; display message
	lea	DialogTextDay06CantGetCaught,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene06Default: ; ok to exit scene
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 07 (SCENE_ID_EEHALL)
;-------------------------------------------------------------------------------
ExitScene07:
	cmpi.w	#$0006,(MEM_DAY)	; is it day 06?
	bne.w	ExitScene07Default	; not day 06, default exit
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_STARTED,d7	; test event flag
	beq.s	ExitScene07Default	; not set, branch
	move.l	(MEM_MISSION_EVENT_FLAGS),d6	; copy mission flags to d6
	btst.l	#MISSION_FLAG_DAY06_RADIO,d6	; test event flag
	beq.s	ExitScene07Default	; not set, branch
	; check direction
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; test direction
	beq.s	ExitScene07Day06South	; exiting south, branch
	; check direction
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)	; test direction
	beq.s	ExitScene07Default	; exiting north, branch
	;---------------------------------------------------------------------------
	; if exiting west or east then:
	; -set EVENT_FLAG_DAY06_MISSION_COMPLETE
	; -launch the appropriate scripted event 
	;---------------------------------------------------------------------------
	bset.l	#EVENT_FLAG_DAY06_MISSION_COMPLETE,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; check direction
	cmpi.w	#DIRECTION_LEFT,(MEM_PLAYER_SPRITE_DIRECTION)	; test direction
	beq.s	ExitScene07Day06West	; exiting west, branch
	; east is the only other option
ExitScene07Day06East:
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	btst.l	#STORE_KEY_SVIDEO,d7	; can the player enter this store?
	beq.s	ExitScene07Default	; no key, default logic
	; set global event flag
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	; copy global event flags to d7
	bset.l	#GLOBAL_FLAG_DB_SAFE,d7	; set flag
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)	; save updated flags
	; else queue the scripted event
	lea ScriptedEventDay06ExitEEHallGood,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts
ExitScene07Day06South:
	; display message
	lea	DialogTextDay06ExitEEHallSouth,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening
	rts
ExitScene07Day06West:
	; queue the scripted event
	lea ScriptedEventDay06ExitEEHallBad,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts
ExitScene07Default:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 09 (SCENE_ID_CHECKERS)
;-------------------------------------------------------------------------------
ExitScene09:
	cmpi.w	#$0001,(MEM_DAY)
	beq.s	ExitScene09Day01	; branch to day 1 logic
	bra.s	ExitScene09CanExit	; use default handler
ExitScene09Day01:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	btst.l	#EVENT_FLAG_DAY01_SUB00_COMPLETE,d7	; test flag 
	bne.s	ExitScene09CanExit	; flag is set, player can exit
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy game state to d7
	btst.l	#MISSION_FLAG_DAY01_SUB00_STARTED,d7	; test if mission is ongoing
	beq.s	ExitScene09CanExit	; flag not set = can exit
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC1_DONE,d7	; test if NPC event is done
	beq.s	ExitScene09CantExit	; flag not set = can't exit
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC2_DONE,d7	; test if NPC event is done
	beq.s	ExitScene09CantExit	; flag not set = can't exit
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_DONE,d7	; test if NPC event is done
	beq.s	ExitScene09CantExit	; flag not set = can't exit
ExitScene09Sub00Ending: ; run the scripted event
	; set that the mission is complete
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	bset.l	#EVENT_FLAG_DAY01_SUB00_COMPLETE,d7	; set flag 
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	; add the store key
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_CHECKERS,d7	; set checkers key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save keys
	; queue the scripted event
	lea ScriptedEventDay01Sub00End,a6	; point a6 to event to load
	bsr.w	QueueScriptedEvent	; queue the event
	rts
ExitScene09CantExit: ; can't exit scene yet
	; display message
	lea	DialogTextCantLeaveStoreUnattended,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening
	rts
ExitScene09CanExit: ; ok to exit scene
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 09 (SCENE_ID_TLODGE)
;-------------------------------------------------------------------------------
ExitScene0A:
	cmpi.w	#$0006,(MEM_DAY)	; is it day 06?
	bne.s	ExitScene0ADefault	; not day 06, default exit
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_STARTED,d7	; test event flag
	beq.s	ExitScene0ADefault	; not set, branch
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY06_RADIO,d7	; test event flag
	beq.s	ExitScene0ADefault	; not set, branch
	; move the night guard back into map	
	move.l	#$18000000,(MEM_NPC_LOCATION_EWHALL)
	; queue the scripted event
	lea ScriptedEventDay06ExitTLodge,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts
ExitScene0ADefault:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 0E (SCENE_ID_NSHACK)
;-------------------------------------------------------------------------------
ExitScene0E:
	cmpi.w	#$0006,(MEM_DAY)	; is it day 06?
	bne.s	ExitScene0EDefault	; not day 06, default exit
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_COMPLETE,d7	; test event flag
	beq.s	ExitScene0EDefault	; not set, branch
	bra.w	Day06End	; end of the day
	rts
ExitScene0EDefault:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 11 (SCENE_ID_CNOW)
;-------------------------------------------------------------------------------
ExitScene11:
	cmpi.w	#$0006,(MEM_DAY)	; is it day 06?
	bne.s	ExitScene11Default	; not day 06, default exit
	; test game state
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_STARTED,d7	; in the mission?
	beq.s	ExitScene11Default	; not in the mission, branch to default
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)	; test direction
	bne.w	ExitScene11Default	; not exiting north, branch to default
	; display message
	lea	DialogTextDay06GuardSomeoneHere,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	; set dialog titled style	
	move.l	(MEM_DIALOG_FLAGS),d7
	bset.l	#DIALOG_FLAG_STYLE_TITLED,d7
	move.l	d7,(MEM_DIALOG_FLAGS)
	bsr.w	SetDialogOpening
	rts
ExitScene11Default:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 13 (SCENE_ID_FCBCHECKOUT)
;-------------------------------------------------------------------------------
ExitScene13:
	cmpi.w	#$0005,(MEM_DAY)	; is it day 05?
	bne.s	ExitScene13Default	; not day 05, default exit
	; test game state
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_CAMP_COMPLETE,d7	; is the camping event complete?
	beq.s	ExitScene13Default	; not after camping scene, branch
	;---------------------------------------------------------------------------	
	; test direction
	; -exiting east ends the day
	; -other directions need to reset NPCs
	;---------------------------------------------------------------------------	
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)	; test direction
	beq.w	Day05End
	move.l	#$12000000,(MEM_NPC_LOCATION_FCBCHECKOUT)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBCAMPING)	
ExitScene13Default:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
ExitScene17:
	cmpi.w	#$0001,(MEM_DAY)	; is it day 01?
	beq.s	ExitScene17Day01	; branch to day 01 logic
	cmpi.w	#$0006,(MEM_DAY)	; is it day 06?
	bne.w	ExitScene17Default	; not day 06, use default handler
ExitScene17Day06:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_STARTED,d7	; mission in-progress?
	beq.s	ExitScene17Default	; not started, branch
	; test if trying to go north	
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	bne.w	ExitScene17Default	; not exiting north
 	; display message
	lea	DialogTextDay06CantGetCaught,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; flag to open dialog
	rts	; exit
ExitScene17Day01:
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)	; test direction
	bne.s	ExitScene17Default	; ok to exit
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test which PC this is
	bne.s	ExitScene17Day01Sub02	; must be in sub02
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy game state to d7
	btst.l	#EVENT_FLAG_DAY01_SUB00_COMPLETE,d7	; test flag blocking the exits
	beq.s	ExitScene17Day01CantExit	; flag not set = can't exit
	btst.l	#EVENT_FLAG_DAY01_SUB01_COMPLETE,d7	; test flag blocking the exits
	beq.s	ExitScene17Day01CantExit	; flag not set = can't exit
	bsr.w	ExitSceneDay01SwitchPC	; switch to DB for the 2nd half of the day
	rts
ExitScene17Day01CantExit:
	; can't exit the scene - display message
	lea	DialogTextDay01CantReturnYet,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene17Day01Sub02:
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy game state to d7
	btst.l	#MISSION_FLAG_DAY01_SUB02_D1,d7	; test if mission is complete
	beq.s	ExitScene17Day01Sub02CantExit	; flag not set = can't exit
	bra.s	ExitScene17Default	; ok to exit
	rts
ExitScene17Day01Sub02CantExit:
	; can't exit the scene - display message
	lea	DialogTextDay01Sub02CantEnter,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene17Default: ; ok to exit scene
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; change the player sprite on day 1
;-------------------------------------------------------------------------------
ExitSceneDay01SwitchPC:
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission flags
	; scene changes after this event, need to remove DB as an NPC in scene 00
	move.l	#$03000000,(MEM_NPC_LOCATION_VB)
	; Dani is now an NPC again
	move.l	#$05010000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	; queue the scripted event
	lea ScriptedEventDay01ChangePC,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts

;-------------------------------------------------------------------------------
; exit scene day 05 during blizzard
;-------------------------------------------------------------------------------
ExitSceneDay05Blizzard:
	;---------------------------------------------------------------------------
	; d6 should still have the destination scene id
	; test for stores that are still open during the blizzard
	;---------------------------------------------------------------------------
	cmpi.w	#SCENE_ID_FCBCHECKOUT,d6
	beq.w	DefaultExitSceneLoadNewScene
	cmpi.w	#SCENE_ID_NSHACK,d6
	beq.w	DefaultExitSceneLoadNewScene
	cmpi.w	#SCENE_ID_POGODAWG,d6
	beq.w	DefaultExitSceneLoadNewScene
	cmpi.w	#SCENE_ID_CAVERN,d6
	beq.w	DefaultExitSceneLoadNewScene
	; else show store closed early text
	lea	DialogTextStoreClosedDay05Storm,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening
	rts

