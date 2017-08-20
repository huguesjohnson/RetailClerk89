;*******************************************************************************
; general event processing routines
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
	move.l	#VDP_VRAM_WRITE_SPRITE,d7	; copy VDP VRAM write address to d7
	add.l	#$00080000,d7	; add $00080000 to point to Y of 2nd sprite (player)
	move.l	d7,(VDP_CONTROL)	; set VDP write address
	move.w	(MEM_PLAYER_SPRITE_Y),(VDP_DATA)	; write new Y value
	bra.w	DefaultExitSceneUpdatePlayerSprite	; exit
DefaultExitSceneTestUp:
	cmpi.w	#DIRECTION_UP,d6	; test for up
	bne.s	DefaultExitSceneTestLeft	; direction is not up, test for left
	move.w	#SCENE_ENTER_BOTTOM,(MEM_PLAYER_SPRITE_Y)	; update y location
	move.l	#VDP_VRAM_WRITE_SPRITE,d7	; copy VDP VRAM write address to d7
	add.l	#$00080000,d7	; add $00080000 to point to Y of 2nd sprite (player)
	move.l	d7,(VDP_CONTROL)	; set VDP write address
	move.w	(MEM_PLAYER_SPRITE_Y),(VDP_DATA)	; write new Y value
	bra.s	DefaultExitSceneUpdatePlayerSprite	; exit
DefaultExitSceneTestLeft:
	cmpi.w	#DIRECTION_LEFT,d6	; test for up
	bne.s	DefaultExitSceneTestRight	; direction is not left, test for right
	move.w	#SCENE_ENTER_LEFT,(MEM_PLAYER_SPRITE_X)	; update x location
	move.l	#VDP_VRAM_WRITE_SPRITE,d7	; copy VDP VRAM write address to d7
	add.l	#$000E0000,d7	; add $00080000 to point to Y of 2nd sprite (player)
	move.l	d7,(VDP_CONTROL)	; set VDP write address
	move.w	(MEM_PLAYER_SPRITE_X),(VDP_DATA)	; write new Y value
	bra.s	DefaultExitSceneUpdatePlayerSprite	; exit
DefaultExitSceneTestRight:
	cmpi.w	#DIRECTION_LEFT,d6	; test for right
	bne.s	DefaultExitSceneUpdatePlayerSprite	; should be unreachable
	move.w	#SCENE_ENTER_RIGHT,(MEM_PLAYER_SPRITE_X)	; update x location
	move.l	#VDP_VRAM_WRITE_SPRITE,d7	; copy VDP VRAM write address to d7
	add.l	#$000E0000,d7	; add $00080000 to point to Y of 2nd sprite (player)
	move.l	d7,(VDP_CONTROL)	; set VDP write address
	move.w	(MEM_PLAYER_SPRITE_X),(VDP_DATA)	; write new Y value
DefaultExitSceneUpdatePlayerSprite:
	move.w	#$0000,(MEM_PLAYER_SPRITE_FRAME)	; frame
	; setting SPRITE_STEP_COUNTER to SPRITE_ANIMATION_STEPS forces movement
	; animation to trigger the next time the sprite moves
	move.w	#SPRITE_ANIMATION_STEPS,(MEM_PLAYER_SPRITE_STEP_COUNTER)
	lea	(MEM_PLAYER_SPRITE_ID),a6	; setup call to FlipSpriteMapPosition
	if	_SPRITE_COLLISION_
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	endif

;	bsr.w	SetDefaultSpriteOrder	; reset sprite order table
	move.w	(MEM_PLAYER_SPRITE_ID),d2	; copy ID to d2
	move.w	(MEM_PLAYER_SPRITE_Y),d3	; copy new Y value to d3
	bsr.w	UpdateSpriteSortTable	; update the sprite table
	move.w	#$FFFF,(MEM_SPRITE_Y_ORDER_CHANGED)	; flag order has changed
;	bsr.w	OrderSprites	

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

;*******************************************************************************
; process actions based on day and scene, this is effectively the game script
;*******************************************************************************

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

;-------------------------------------------------------------------------------
; day 00 - scene 00
;-------------------------------------------------------------------------------
Day00Scene00Action00:	; ACTION_LOOK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	Day00Scene00Action00Default	; branch to default
	lea	DialogTextDaniScene0Day0Action0,a6	; load text for the day
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action00	; exit
Day00Scene00Action00Default:
	bsr.w	ShowDefaultText
ExitDay00Scene00Action00:
	rts

Day00Scene00Action01:	; ACTION_USE_TALK
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_SCENE_VB_REGISTER,d6	; test target
	beq.w	Day00Scene00Register	; branch if this is the register
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	Day00Scene00Action01NPCMaleShopper	; branch to next NPC
Day00Scene00Action01NPCDani:
	;---------------------------------------------------------------------------
	; handle dialog with NPC Dani		
	;---------------------------------------------------------------------------
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	bne	Day00Scene00Action01NPCDaniFlag8	; branch if it is
	btst.l	#EVENT_FLAG_DAY00_NPC00_DIALOG00,d7	; test if flag set
	bne	Day00Scene00Action01NPCDaniFlag1	; branch if it is
	bset.l	#EVENT_FLAG_DAY00_NPC00_DIALOG00,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated event flags for the day
	lea	DialogTextDaniScene0Day0Flag0,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCDaniFlag8:
	lea	DialogTextDaniScene0Day0Flag8,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCDaniFlag1:
	lea	DialogTextDaniScene0Day0Flag1,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCMaleShopper:
	;---------------------------------------------------------------------------
	; handle dialog with shopper		
	;---------------------------------------------------------------------------
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.w	Day00Scene00Action01NPCGreenberg	; test next NPC
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	bne	Day00Scene00Action01NPCMaleShopperTestFlag8	; branch if it is
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG01,d7	; test if flag set
	bne	Day00Scene00Action01NPCMaleShopperFlag4	; branch if it is set
	; if 4 is not set but 2 or 3 are then the player cancelled a dialog
	bra.s	Day00Scene00Action01NPCMaleShopperTestFlag3 ; no flags are set
Day00Scene00Action01NPCMaleShopperTestFlag8:
	lea	DialogTextMaleShopper0Scene0Day0Flag8,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCMaleShopperTestFlag3:
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE01,d7	; test if flag set
	beq.s	Day00Scene00Action01NPCMaleShopperTestFlag2	; flag is 0, next test
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; set text choice flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	bra.w	Day00Scene00Action03NPCMaleShopperFlag0R1	; show selection
Day00Scene00Action01NPCMaleShopperTestFlag2:
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE00,d7	; test if flag set
	beq.s	Day00Scene00Action01NPCMaleShopperNoFlags	; flag is 0
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; set text choice flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	bra.w	Day00Scene00Action03NPCMaleShopperFlag0R0	; show selection
Day00Scene00Action01NPCMaleShopperNoFlags:
	; no flags for this NPC are set - use initial dialog
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; set text choice flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	lea	DialogTextMaleShopper0Scene0Day0Flag0,a6	; load dialog text
	bra.s	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCMaleShopperFlag4:	; flag is set
	lea	DialogTextMaleShopper0Scene0Day0Flag4,a6	; load dialog text
	bra.s	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Register:
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	beq.s	Day00Scene00Action01Default	; branch if not
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bclr.l	#STATE_FLAG_EXITS_BLOCKED,d7	; clear flag blocking the exits
	move.l	d7,(MEM_GAME_STATE)	; save updated flags
	; queue the scripted event
	lea ScriptedEventDay0Exit,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextRegisterDay0Use,a6	; load dialog text
	bra.s	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCGreenberg:
	;---------------------------------------------------------------------------
	; handle dialog with Greenberg		
	;---------------------------------------------------------------------------
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	bne.w	Day00Scene00Action01Default	; branch to display default text
	lea	DialogTextGreenbergScene0Day0Talk,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01Default:
	; default
	lea	DialogTextNothingHappens,a6	; load default text
Day00Scene00Action01CopyDialogText:
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay00Scene00Action01:
	rts

Day00Scene00Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	andi.w	#OBJ_SCENE_BASE,d6	; and against base scene ID
	beq.w	Day00Scene00Action02GiveNPC	; not scenery
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	bne.s	Day00Scene00Action02DefaultTake	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_GIVE02,d7	; test if last give flag is set
	beq.s	Day00Scene00Action02DefaultTake	; flag is not set, branch
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6 (again)
	cmpi.w	#OBJ_SCENE_VB_8BIT,d6	; is the player looking at 8-bit games?
	beq.s	Day00Scene00Action02LaunchScriptedEvent	; if so, launch event
	cmpi.w	#OBJ_SCENE_VB_16BIT,d6	; is the player looking at 16-bit games?
	bne.s	Day00Scene00Action02DefaultTake	; if not branch
Day00Scene00Action02LaunchScriptedEvent:
	; set flag to indicate the scripted event ran
	bset.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated event flag
Day00Scene00Action02LaunchScriptedRight:
	lea	ScriptedEventDay0Right,a6	; point a6 to event to load
	bsr.w	QueueScriptedEvent	; queue the event
	bsr.w	Scene00DefaultTake	; use scene defaults
	rts	; exit
Day00Scene00Action02DefaultTake:
	bsr.w	Scene00DefaultTake	; use scene defaults
	bra.w	ExitDay00Scene00Action02	; exit
Day00Scene00Action02GiveNPC:
	move.w	(MEM_ACTIVE_ITEM),d7	; copy item being given to d7
	bsr.w	RemoveItem	; remove the item
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.s	Day00Scene00Action02GiveNPCTest2	; branch if not MALE_SHOPPER0
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	bne.s	Day00Scene00Action02GiveNPCDefault	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_GIVE01,d7	; test if flag is set
	bne.s	Day00Scene00Action02GiveNPCFlag6	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_GIVE00,d7	; test if flag is set
	bne.s	Day00Scene00Action02GiveNPCFlag5	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG01,d7	; test if flag is set
	bne.s	Day00Scene00Action02GiveNPCFlag4	; flag is set, branch
Day00Scene00Action02GiveNPCDefault:
	; flag is not set, use default text
	lea	DialogTextMaleShopperDefaultGive,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene00Action02GiveNPCFlag4:
	lea	DialogTextMaleShopper0Scene0Day0Flag4Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bset.l	#EVENT_FLAG_DAY00_NPC01_GIVE00,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	rts
Day00Scene00Action02GiveNPCFlag5:
	lea	DialogTextMaleShopper0Scene0Day0Flag5Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bset.l	#EVENT_FLAG_DAY00_NPC01_GIVE01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	rts
Day00Scene00Action02GiveNPCFlag6:
	lea	DialogTextMaleShopper0Scene0Day0Flag6Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bset.l	#EVENT_FLAG_DAY00_NPC01_GIVE02,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	rts
Day00Scene00Action02GiveNPCTest2:
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	Day00Scene00Action02GiveNPCTest3	; branch if not OBJ_NPC_DANI
	lea	DialogTextDaniDefaultGive,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene00Action02GiveNPCTest3:
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	bne.s	Day00Scene00Action02DefaultGive	; branch if not OBJ_NPC_DANI
	lea	DialogTextGreenbergScene0Day0Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene00Action02DefaultGive:
	lea	DialogTextNothingHappens,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay00Scene00Action02:
	rts

Day00Scene00Action03:	; ACTION_RESPOND
	;---------------------------------------------------------------------------
	; determine which NPC the player responded to
	;---------------------------------------------------------------------------
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.w	Day00Scene00Action03Default	; branch to display default text
Day00Scene00Action03NPCMaleShopper:
	;---------------------------------------------------------------------------
	; determine which conversation flow to take
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE01,d7	; test if flag set
	bne.w	Day00Scene00Action03NPCMaleShopperFlag3	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE00,d7	; test if flag set
	bne.s	Day00Scene00Action03NPCMaleShopperFlag2	; flag is set, branch
;---------------------------------------------------------------------------
; player is responding to the NPC for the first time
;---------------------------------------------------------------------------
Day00Scene00Action03NPCMaleShopperFlag0:
	; both possible responses use a 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day00Scene00Action03NPCMaleShopperFlag0R1	; branch if not zero
Day00Scene00Action03NPCMaleShopperFlag0R0:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	bset.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE00,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	lea	DialogTextMaleShopper0Scene0Day0Flag0R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitDay00Scene00Action03	; exit
Day00Scene00Action03NPCMaleShopperFlag0R1:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	bset.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	lea	DialogTextMaleShopper0Scene0Day0Flag0R1,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitDay00Scene00Action03	; exit
;---------------------------------------------------------------------------
; player selected option 0 in the first dialog
;---------------------------------------------------------------------------
Day00Scene00Action03NPCMaleShopperFlag2:
	bset.l	#EVENT_FLAG_DAY00_NPC01_DIALOG01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	; both possible responses use a regular dialog	
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day00Scene00Action03NPCMaleShopperFlag2R1	; branch if not zero
Day00Scene00Action03NPCMaleShopperFlag2R0:
	lea	DialogTextMaleShopper0Scene0Day0Flag2R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
Day00Scene00Action03NPCMaleShopperFlag2R1:
	lea	DialogTextMaleShopper0Scene0Day0Flag2R1,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
;---------------------------------------------------------------------------
; player selected option 1 in the first dialog
;---------------------------------------------------------------------------
Day00Scene00Action03NPCMaleShopperFlag3:
	bset.l	#EVENT_FLAG_DAY00_NPC01_DIALOG01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	; both possible responses use a regular dialog	
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day00Scene00Action03NPCMaleShopperFlag3R1	; branch if not zero
Day00Scene00Action03NPCMaleShopperFlag3R0:
	lea	DialogTextMaleShopper0Scene0Day0Flag3R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
Day00Scene00Action03NPCMaleShopperFlag3R1:
	lea	DialogTextMaleShopper0Scene0Day0Flag3R1,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
Day00Scene00Action03Default:
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	ResetDialog	; reset the dialog
ExitDay00Scene00Action03:
	rts

