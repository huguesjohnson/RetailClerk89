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
	mulu.w	#$4,d6	; multiply by 4 to get offset
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d6,a6	; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite
	; move player to the correct position
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d6	; copy player direction to d6
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
	bsr.w	DefaultExitScene	; use default handler
	rts
ExitScene00Day00:
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_EXITS_BLOCKED,d7	; test flag blocking the exits
	beq.s	ExitScene00Day00CanExit	; branch if flag is set
	; display message
	lea	DialogTextCantLeaveStoreUnattended,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening
	rts
ExitScene00Day00CanExit:
	bsr.w	DefaultExitScene	; use default handler
	; re-set flag to block exits
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bset.l	#STATE_FLAG_EXITS_BLOCKED,d7	; test flag blocking the exits
	move.l	d7,(MEM_GAME_STATE)	; copy game state to d7
	rts
ExitScene00Day01:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test which PC this is
	beq.s	ExitScene00Day01CanExit	; ok to exit
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB02_STARTED,d7	; test if flag is set
	bne.s	ExitScene00Day01CanExit	; flag is set, OK to exit
	lea	DialogTextDay01Sub02VBExit,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; open the dialog
	rts	; exit
ExitScene00Day01CanExit:
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 01 (SCENE_ID_WWHALL)
;-------------------------------------------------------------------------------
ExitScene01:
	cmpi.w	#$0000,(MEM_DAY)
	beq.s	ExitScene01Day00	; branch to day 0 logic
	bra.s	ExitScene01Day00CanExit	; use default handler
ExitScene01Day00:
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene01Day00CanExit	; ok to exit
	; can't exit the scene - display message
	lea	DialogTextStoreClosing,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene01Day00CanExit: ; ok to exit scene
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 02 (SCENE_ID_WEHALL)
;-------------------------------------------------------------------------------
ExitScene02:
	cmpi.w	#$0000,(MEM_DAY)
	beq.s	ExitScene02Day00	; branch to day 0 logic
	bra.s	ExitScene02Day00CanExit	; use default handler
ExitScene02Day00:
	cmpi.w	#DIRECTION_LEFT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene02Day00CanExit	; ok to exit
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene02Day00CanExit	; ok to exit
	; can't exit the scene - display message
	lea	DialogTextStoreClosing,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene02Day00CanExit: ; ok to exit scene
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
ExitScene03:
	cmpi.w	#$0000,(MEM_DAY)
	beq.s	ExitScene03Day00	; branch to day 0 logic
	bra.s	ExitScene03Day00CanExit	; use default handler
ExitScene03Day00:
	cmpi.w	#DIRECTION_LEFT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene03Day00CanExit	; ok to exit
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene03Day00CanExit	; ok to exit
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene03Day00CanExit	; ok to exit
	; can't exit the scene - display message
	lea	DialogTextStoreClosing,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene03Day00CanExit: ; ok to exit scene
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 04 (SCENE_ID_SHALL)
;-------------------------------------------------------------------------------
ExitScene04:
	cmpi.w	#$0000,(MEM_DAY)
	beq.s	ExitScene04Day00	; branch to day 0 logic
	bra.s	ExitScene04Day00CanExit	; use default handler
ExitScene04Day00:
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene04Day00CanExit	; ok to exit
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene04Day00CanExit	; ok to exit
	; can't exit the scene - display message
	lea	DialogTextStoreClosing,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene04Day00CanExit: ; ok to exit scene
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
	cmpi.w	#$0000,(MEM_DAY)	; is it day 00?
	beq.s	ExitScene06Day00	; branch to day 00 logic
	cmpi.w	#$0001,(MEM_DAY)	; is it day 01?
	beq.s	ExitScene06Day01	; branch to day 01 logic
	bra.w	ExitScene06Default	; use default handler
ExitScene06Day00:
	cmpi.w	#DIRECTION_LEFT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene06Default	; ok to exit
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene06Default	; ok to exit
	; can't exit the scene - display message
	lea	DialogTextStoreClosing,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene06Day01:
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; test direction
	bne.s	ExitScene06Default	; ok to exit
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
ExitScene06Default: ; ok to exit scene
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit

;-------------------------------------------------------------------------------
; exit scene 07 (SCENE_ID_EEHALL)
;-------------------------------------------------------------------------------
ExitScene07:
	cmpi.w	#$0000,(MEM_DAY)
	beq.s	ExitScene07Day00	; branch to day 0 logic
	bra.s	ExitScene07Day00CanExit	; use default handler
ExitScene07Day00:
	cmpi.w	#DIRECTION_LEFT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene07Day00CanExit	; ok to exit
	; can't exit the scene - display message
	lea	DialogTextStoreClosing,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene07Day00CanExit: ; ok to exit scene
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
	btst.l	#EVENT_FLAG_DAY01_SUB00_COMPLETE,d7	; set flag 
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
; exit scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
ExitScene17:
	cmpi.w	#$0000,(MEM_DAY)	; is it day 00?
	beq.s	ExitScene17Day00	; branch to day 00 logic
	cmpi.w	#$0001,(MEM_DAY)	; is it day 01?
	beq.s	ExitScene17Day01	; branch to day 01 logic
	bra.w	ExitScene17Default	; use default handler
ExitScene17Day00:
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene17Default	; ok to exit
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene17Default	; ok to exit
	; can't exit the scene - display message
	lea	DialogTextStoreClosing,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
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
	lea MEM_NPC_LOCATIONS,a5	; point a5 to start of NPC location table
	move.l	#$03000000,(a5)	; update NPCs in scene 00
	; queue the scripted event
	lea ScriptedEventDay01ChangePC,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts
