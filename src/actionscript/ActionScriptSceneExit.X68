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
	bra.w	DefaultExitSceneUpdatePlayerSprite	; exit
DefaultExitSceneTestUp:
	cmpi.w	#DIRECTION_UP,d6	; test for up
	bne.s	DefaultExitSceneTestLeft	; direction is not up, test for left
	move.w	#SCENE_ENTER_BOTTOM,(MEM_PLAYER_SPRITE_Y)	; update y location
	bra.s	DefaultExitSceneUpdatePlayerSprite	; exit
DefaultExitSceneTestLeft:
	cmpi.w	#DIRECTION_LEFT,d6	; test for left
	bne.s	DefaultExitSceneTestRight	; direction is not left, test for right
	move.w	#SCENE_ENTER_RIGHT,(MEM_PLAYER_SPRITE_X)	; update x location
	bra.s	DefaultExitSceneUpdatePlayerSprite	; exit
DefaultExitSceneTestRight:
	cmpi.w	#DIRECTION_RIGHT,d6	; test for right
	bne.s	DefaultExitSceneUpdatePlayerSprite	; should be unreachable
	move.w	#SCENE_ENTER_LEFT,(MEM_PLAYER_SPRITE_X)	; update x location
DefaultExitSceneUpdatePlayerSprite:
	; setting SPRITE_STEP_COUNTER to SPRITE_ANIMATION_STEPS forces movement
	; animation to trigger the next time the sprite moves
	move.w	#SPRITE_ANIMATION_STEPS,(MEM_PLAYER_SPRITE_STEP_COUNTER)
	if	_SPRITE_COLLISION_
	lea	(MEM_PLAYER_SPRITE_ID),a6	; setup call to FlipSpriteMapPosition	
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	endif
	; update x & y values in the sprite table
	move.l	#VDP_VRAM_WRITE_SPRITE,d7	; copy VDP VRAM write address to d7
	add.l	#$00080000,d7	; add $00080000 to point to Y of 2nd sprite (player)
	move.l	d7,(VDP_CONTROL)	; set VDP write address
	move.w	(MEM_PLAYER_SPRITE_Y),(VDP_DATA)	; write new Y value
	move.l	#VDP_VRAM_WRITE_SPRITE,d7	; copy VDP VRAM write address to d7
	add.l	#$000E0000,d7	; add $00080000 to point to Y of 2nd sprite (player)
	move.l	d7,(VDP_CONTROL)	; set VDP write address
	move.w	(MEM_PLAYER_SPRITE_X),(VDP_DATA)	; write new X value
	; update sprite sort table	
	move.w	(MEM_PLAYER_SPRITE_ID),d2	; copy ID to d2
	move.w	(MEM_PLAYER_SPRITE_Y),d3	; copy new Y value to d3
	bsr.w	UpdateSpriteSortTable	; update the sprite table
	bsr.w	OrderSprites	; sort the sprite table
	; workaround to issue where links aren't set if the table is already sorted	
	move.w	#$2700,sr		; disable interrupts
	bsr.w	SetSpriteLinks
	move.w	#$2000,sr		; re-enable interrupts
ExitDefaultExit:
	bsr.w	FadeIn ; fade in now that everything is loaded
	rts

;-------------------------------------------------------------------------------
; exit scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
ExitScene00:
	cmpi.w	#$0000,(MEM_DAY)
	beq.s	ExitScene00Day00	; branch to day 0
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
	cmpi.w	#$0000,(MEM_DAY)
	beq.s	ExitScene06Day00	; branch to day 0 logic
	bra.s	ExitScene06Day00CanExit	; use default handler
ExitScene06Day00:
	cmpi.w	#DIRECTION_LEFT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene06Day00CanExit	; ok to exit
	cmpi.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene06Day00CanExit	; ok to exit
	; can't exit the scene - display message
	lea	DialogTextStoreClosing,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene06Day00CanExit: ; ok to exit scene
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
; exit scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
ExitScene17:
	cmpi.w	#$0000,(MEM_DAY)
	beq.s	ExitScene17Day00	; branch to day 0 logic
	bra.s	ExitScene17Day00CanExit	; use default handler
ExitScene17Day00:
	cmpi.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene17Day00CanExit	; ok to exit
	cmpi.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	beq.s	ExitScene17Day00CanExit	; ok to exit
	; can't exit the scene - display message
	lea	DialogTextStoreClosing,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; setup dialog open
	rts
ExitScene17Day00CanExit: ; ok to exit scene
	bsr.w	DefaultExitScene	; use default handler
	rts	; exit
