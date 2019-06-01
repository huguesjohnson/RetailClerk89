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
	bsr.w	SaveGame	; save game
	; update the text
	move.w	(MEM_OBJECTIVE),d6	; objective is used for title lookup
	mulu.w	#LWORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	SaveGameTitles,a5	; point a5 to the lookup table
	adda.l	d6,a5	; move to offset
	move.l	(a5),a0	; point a0 to the first character
	move.l	#STATUS_SCREEN_SAVE0_VDP,d7	; point d7 to first line
	clr	d6	; lazy way to prevent various bugs
	move.w	#$0080,d6	; using d6 to compute row
	mulu.w	(MEM_MENU_SELECTION),d6	; multiply by current save slot
	swap	d6	; move to high word
	add.l	d6,d7	; add offset to d7
	move.l	d7,(MEM_DIALOG_VDP)
UpdateSaveTitleLoop:
	clr	d6	; lazy way to prevent various bugs
	move.b	(a0)+,d6	; copy current character to d6
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.s	ExitSaveTitleLoopExit	; end of text, move on
	; update d6 to point to the tile ID
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#DIALOG_BASE_TILE_LOW,d6	; add the base tile
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VDP
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	bra.w	UpdateSaveTitleLoop ; loop until ETX
ExitSaveTitleLoopExit:
	; show a saved message
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
	bsr.w	ReloadSpriteTiles	; reload sprite tiles
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

