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
; displays a message if the player can't hold more items
;-------------------------------------------------------------------------------
DefaultActionInventoryFull:
	lea	TakeMenuFull,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDefaultActionInventoryFull:
	rts

;-------------------------------------------------------------------------------
; adds an item from the take dialog to the player's inventory
;-------------------------------------------------------------------------------
DefaultTakeAddItem:
	move.w	(MEM_ACTIVE_ITEM),d7	; copy active item to d7
	bsr.w	HasItem	; check if the player already has the item
	cmpi.w	#$FFFF,d6	; d6 will have FFFF if the player has the item	
	bne.s	DefaultTakeAddItemHasItem	; branch if the player has the item
	bsr.w	AddItem	; add the item
	lea	TakeMenuItemTaken,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
DefaultTakeAddItemHasItem:
	lea	TakeMenuAlreadyCarrying,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; default take scripts for scenes
;-------------------------------------------------------------------------------
Scene00DefaultTake:
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_SCENE_VB_MAGS,d6	; is the magazine rack the target?
	bne.s	.1	; most to next test
	lea	TakeMenuMagazines,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVBMagazine,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.s	ExitScene00DefaultTake	; exit
.1	; test for OBJ_SCENE_VB_8BIT
	cmpi.w	#OBJ_SCENE_VB_8BIT,d6	; is the magazine rack the target?
	bne.s	.2	; most to next test
	lea	TakeMenuGames,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVB8Bit,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.s	ExitScene00DefaultTake	; exit
.2	; test for OBJ_SCENE_VB_HARDWARE
	cmpi.w	#OBJ_SCENE_VB_HARDWARE,d6	; is the magazine rack the target?
	bne.s	.3	; most to next test
	lea	TakeMenuDefault,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVBHW,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.s	ExitScene00DefaultTake	; exit
.3	; test for OBJ_SCENE_VB_16BIT
	cmpi.w	#OBJ_SCENE_VB_16BIT,d6	; is the magazine rack the target?
	bne.s	.4	; most to next test
	lea	TakeMenuGames,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVB16Bit,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.s	ExitScene00DefaultTake	; exit
.4	; default for anything else in the scene
	lea	DialogTextCantTake,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
ExitScene00DefaultTake:
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7	; set text choice flag
	bset.l	#DIALOG_FLAG_STYLE_ITEM_MENU,d7	; set item menu flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	rts

;*******************************************************************************
; scene exit actions
;*******************************************************************************

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
	bsr.w	SetSpriteLinks
ExitDefaultExit:
	rts

;-------------------------------------------------------------------------------
; exit scene 00
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
	; --------------------------------------------------------------------------
	; save this code for later - can be re-used for end of mall walker demo
	; --------------------------------------------------------------------------
	; set the end game flag
;	and.l	#$0000,d7	; clear all other flags
;	bset.l	#STATE_FLAG_END_SCREEN,d7 ; set end screen state flag	
;	move.l	d7,(MEM_GAME_STATE)	; save updated game state
;	; load end scene
;	lea	SceneEnd,a6	; address of the scene for the title screen
;	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	DefaultExitScene	; use default handler
	rts

;-------------------------------------------------------------------------------
; exit scene 04 - temp for empty mall demo
;-------------------------------------------------------------------------------
ExitScene04:
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d6	; copy player direction to d6
	cmpi.w	#DIRECTION_DOWN,d6
	beq.s	.1
	bsr.w	DefaultExitScene
	rts
.1
	; set the end game flag
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	and.l	#$0000,d7	; clear all other flags
	bset.l	#STATE_FLAG_END_SCREEN,d7 ; set end screen state flag	
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; load end scene
	lea	SceneEnd,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
;	bsr.w	DefaultExitScene	; use default handler
	rts

;*******************************************************************************
; process actions based on day and scene, this is effectively the game script
;*******************************************************************************
	include	'actionscript/ActionScriptDay00.X68'

