ProcessStatusScreen:
	clr.w	d6	; lazy workaround to prevent some bugs
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	beq.w	ExitProcessStatusScreen	; exit
ProcessStatusScreenTestACButtonPressed:	; test if the player pressed A
	cmpi.w	#BUTTON_A_PRESSED,d6	; test if the A button was pressed
	beq.s	ProcessStatusScreenACButtonPressed	; A button is pressed
	cmpi.w	#BUTTON_C_PRESSED,d6	; test if the C button was pressed
	bne.w	ProcessStatusScreenTestBButtonPressed	; C button is not pressed
ProcessStatusScreenACButtonPressed:
	; setup dialog
	bsr.w	SetDialogOpening	; setup dialog
	; set flag to not hide the selector after closing
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	bset.l	#DIALOG_FLAG_OPTION_PERSIST_SELECTOR,d7	; set option
	move.l	d7,(MEM_DIALOG_FLAGS)	; save changes made to the dialog options
	move.w	(MEM_MENU_SELECTION),d6	; copy menu selection to d6
	; test if the selector is on the save or item menu
	cmpi.w	#$0004,d6	; 0-3 are save, 4-7 are items
	blt.s	ProcessStatusScreenACButtonPressedSave	; branch to save logic
ProcessStatusScreenACButtonPressedItem:
	; lookup description of selected item
	subq.w	#$0004,d6	; subtract 4 to get item slot
	mulu.w	#WORD_SIZE,d6	; items are 1 word
	lea	MEM_PLAYER_ITEMS,a6	; point a6 to player items
	adda.l	d6,a6	; move to offset
	move.w	(a6),d6	; copy item number to d6
	and.w	#$0FFF,d6	; clear out item mask
	mulu.w	#LWORD_SIZE,d6	; addresses are 1 lword
	lea	ItemDescriptionTable,a6	; point a6 to the lookup table
	adda.l	d6,a6	; move to offset
	move.l	(a6),(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	bra.w	ExitProcessStatusScreen	; exit
ProcessStatusScreenACButtonPressedSave:
	lea	StatusScreenSaveDialog,a6	; point a6 to the dialog text
	move.l	a6,(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	bra.w	ExitProcessStatusScreen	; exit
ProcessStatusScreenTestBButtonPressed:	; test if the player pressed B
	cmpi.w	#BUTTON_B_PRESSED,d6	; test if the B button was pressed
	bne.w	ProcessStatusScreenTestDPad	; B button is not pressed
CancelStatusScreen:
	move.w	(MEM_ACTIVE_SCENE_ID),d6	; copy active scene ID to d6
	mulu.w	#$4,d6	; multiply by 4 to get offset
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d6,a6	; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	move.w	(a6)+,d6	; discard first word
	bsr.w	DrawScene	; branch to DrawScene subroutine
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_STATUS_SCREEN,d7	; update game state
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
ReloadSprites:
	; reload sprite tiles
	bsr.w	LoadSpriteZeroTiles
	bsr.w	LoadPlayerSpriteTiles
	; this gets the player tiles back but sprite is in wrong positions
	bsr.w	LoadPlayerSprite
	; player will be back at default location
	if	_SPRITE_COLLISION_
	lea	(MEM_PLAYER_SPRITE_ID),a6	; setup call to FlipSpriteMapPosition
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	endif
	move.l	#PLAYER_SPRITE_VDP_Y,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_PLAYER_SPRITE_Y),(VDP_DATA)	; copy the new y-coordinate
	move.l	#PLAYER_SPRITE_VDP_X,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_PLAYER_SPRITE_X),(VDP_DATA)	; copy the new y-coordinate
	if	_SPRITE_COLLISION_
	lea	(MEM_PLAYER_SPRITE_ID),a6	; setup call to FlipSpriteMapPosition
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	endif
	; this seems to get all the NPC sprites right
	move.w	#$2700,sr		; disable interrupts
	bsr.w	LoadSceneLoadNPCSprites
	; needed to get all sprites displaying
	bsr.w	SetSpriteLinks
	move.w	#$2000,sr		; re-enable interrupts
	bsr.w	FadeIn	; fade in
	bra.w	ExitProcessStatusScreen	; exit
ProcessStatusScreenTestDPad:
	cmpi.w	#$0000,(MEM_PLAYER_ITEM_COUNT)	; is item count 0?
	ble.w	ProcessStatusScreenTestButtonPressUp	; branch if no items 
ProcessStatusScreenTestButtonPressLR:	; L/R toggles between menus
	cmpi.w	#BUTTON_LEFT_PRESSED,d6	; is the left button pressed?
	beq.s	ProcessStatusScreenTestButtonPressLRTestMenu	; left pressed
	cmpi.w	#BUTTON_RIGHT_PRESSED,d6	; is the right button pressed?
	bne.s	ProcessStatusScreenTestButtonPressUp	; right not pressed
ProcessStatusScreenTestButtonPressLRTestMenu:
	; test if on the item menu or inventory menu
	cmpi.w	#$0004,(MEM_MENU_SELECTION)	; test whether in item or save column
	blt.s	ProcessStatusScreenTestButtonPressLRSaveMenu
	; on the item menu
	subq	#$0004,(MEM_MENU_SELECTION)	; subtract 4 to move to save menu
	bra.w	ProcessStatusScreenUpdateSelector
ProcessStatusScreenTestButtonPressLRSaveMenu:
	move.w	(MEM_PLAYER_ITEM_COUNT),d6	; copy item count to d6
	cmp.w	(MEM_MENU_SELECTION),d6	; compare item count to menu selection
	bgt.s	.1
	move.w	#$0004,(MEM_MENU_SELECTION)
	bra.s	.2
.1
	addq	#$0004,(MEM_MENU_SELECTION)
.2
	bra.s	ProcessStatusScreenUpdateSelector
ProcessStatusScreenTestButtonPressUp:	; up
	;---------------------------------------------------------------------------
	; to do - once save is implemented update this 
	; -left/right should move between inventory & save
	; -track which column the selector is in
	;---------------------------------------------------------------------------
	; test if the up button is pressed
	cmpi.w	#BUTTON_UP_PRESSED,d6	; is the up button pressed?
	bne.s	ProcessStatusScreenTestButtonPressDown	; up not pressed
	; decrement MEM_MENU_SELECTION
	cmpi.w	#$0000,(MEM_MENU_SELECTION)	; is the menu selection 0?
	beq.s	ProcessStatusScreenTestButtonPressUpZero	; branch if zero
	cmpi.w	#$0004,(MEM_MENU_SELECTION)	; is the menu selection 4?
	beq.s	ProcessStatusScreenTestButtonPressUpFour	; branch if >=four
	; otherwise, decrement
	subq.w	#$0001,(MEM_MENU_SELECTION)	; decrement
	bra.s	ProcessStatusScreenUpdateSelector
ProcessStatusScreenTestButtonPressUpZero:
	move.w	#$0003,(MEM_MENU_SELECTION)	; wrap around to end of the list
	bra.s	ProcessStatusScreenUpdateSelector
ProcessStatusScreenTestButtonPressUpFour:
	move.w	(MEM_PLAYER_ITEM_COUNT),d6	; copy item count to d6
	addq	#$0003,d6	; add 3 to get higest menu item that should appear
	move.w	d6,(MEM_MENU_SELECTION)	; wrap around to end of the list
	bra.s	ProcessStatusScreenUpdateSelector
ProcessStatusScreenTestButtonPressDown:
	cmpi.w	#BUTTON_DOWN_PRESSED,d6	; is the down button pressed?
	bne.s	ExitProcessStatusScreen	; down not pressed
	; increment MEM_MENU_SELECTION
	cmpi.w	#$0003,(MEM_MENU_SELECTION)	; is the menu selection 3?
	beq.s	ProcessStatusScreenTestButtonPressDownThree	; branch if 3
	; determine if the last item is selected
	move.w	(MEM_PLAYER_ITEM_COUNT),d6	; copy item count to d6
	addq	#$0003,d6	; add 3 to get higest menu item that should appear
	cmp.w	(MEM_MENU_SELECTION),d6	; is the last item selected?
	beq.s	ProcessStatusScreenTestButtonPressDownLastItem	; branch if last
	addq.w	#$0001,(MEM_MENU_SELECTION)	; increment
	bra.s	ProcessStatusScreenUpdateSelector
ProcessStatusScreenTestButtonPressDownThree:
	move.w	#$0000,(MEM_MENU_SELECTION)	; wrap around to end of the list
	bra.s	ProcessStatusScreenUpdateSelector
ProcessStatusScreenTestButtonPressDownLastItem:
	move.w	#$0004,(MEM_MENU_SELECTION)	; wrap around to end of the list
ProcessStatusScreenUpdateSelector:
	bsr.w	ProcessStatusScreenUpdateSelectorXY	; update selector position
ExitProcessStatusScreen:
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	rts

ProcessStatusScreenUpdateSelectorXY:
	move.w	(MEM_MENU_SELECTION),d4	; copy menu selection to d4
	cmpi.w	#$0004,d4	; test whether in item or save column
	blt.s	.1	; <4 means save column
	subq.w	#$0004,d4	; subtract 4 from d6
	move.w	#$0090,d5	; set x position
	bra.s	.2	; move to set y position and update VDP
.1
	move.w	#$0100,d5	; set x position
.2
	mulu.w	#$0008,d4	; multiply by 16 to get y index
	add.w	#$0130,d4	; add offset of first item
	;---------------------------------------------------------------------------
	; update y
	;---------------------------------------------------------------------------
	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	d4,(VDP_DATA)	; copy the new y-coordinate
	;---------------------------------------------------------------------------
	; update x
	;---------------------------------------------------------------------------
	add.l	#$00060000,d6	; move to x-coordinate
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	d5,(VDP_DATA)	; copy the new x-coordinate
ExitProcessStatusScreenUpdateSelectorXY:
	rts

