ProcessDialog:
	move.w	#$2700,sr	; disable interrupts while managing dialogs
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
ProcessDialogTestOpening:
	btst.l	#DIALOG_FLAG_TEXT_OPENING,d7	; test if the dialog is opening
	beq.w	ProcessDialogTestTextTitleDrawing	; dialog not opening, next test
	; setup dialog opening animation
	btst.l	#DIALOG_FLAG_STYLE_TITLED,d7	; test if the dialog is titled
	beq.s	.1	; flag is not set
	lea	PatternDialogTitledClear,a0	; point a0 to start of dialog patterns
	bra.s	.2
.1
	lea	PatternDialogClear,a0	; point a0 to start of dialog patterns
.2
	clr	d6	; lazy workaround to various bugs	
	move.w	d7,d6	; copy low word with frame number
	mulu.w	#DIALOG_PATTERN_SIZE,d6	; multiply by size of dialog patterns
	adda.l	d6,a0	; increment to current frame
	move.w	#DIALOG_BASE_TILE,d0	; base pattern
	moveq	#$0000,d1	; repeat
	lea	VDP_VRAM_WRITE_A,a1	; initial drawing location
	adda.l	#DIALOG_ROWCOL,a1	; move to row & column
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	addq	#$1,d7	; increment frame number
	cmpi.w	#DIALOG_FRAME_COUNT,d7	; are we at the last frame?
	ble.w	ExitProcessDialog ; not at the last frame, exit
	bclr.l	#DIALOG_FLAG_TEXT_OPENING,d7	; done opening, clear flag
	btst.l	#DIALOG_FLAG_STYLE_TITLED,d7	; is this a titled dialog?
	beq.s	ProcessDialogSetTextDrawing	; not titled, branch
ProcessDialogSetTextTitleDrawing:
	bset.l	#DIALOG_FLAG_TEXT_TITLE_DRAWING,d7	; change state to title drawing
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TITLE_ROWCOL),(MEM_DIALOG_VDP)
	bsr.w	ProcessDialogLookupNPCName	; lookup the NPC name
	bra.w	ExitProcessDialog	; exit
ProcessDialogSetTextDrawing:
	bset.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; change state to text drawing
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL),(MEM_DIALOG_VDP)
	bra.w	ExitProcessDialog	; exit
ProcessDialogTestTextTitleDrawing:
	btst.l	#DIALOG_FLAG_TEXT_TITLE_DRAWING,d7	; test if title is drawing
	beq.s	ProcessDialogTestTextDrawing	; title is not drawing, next test
	clr.w	d6	; prevent some issues
	move.l	(MEM_DIALOG_TITLE),a0	; point a0 to the current character
	move.b	(a0),d6	; copy current character to d6
TestNPCNameEnd:
	cmpi.b	#NPCNAMEEND,d6	; is this the end of the name?
	beq.s	TitleEnd	; end of name, branch to setup text
	; update d6 to point to the tile ID
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#DIALOG_BASE_TILE,d6	; add the base tile
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VPD
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	add.l	#$0001,(MEM_DIALOG_TITLE)	; move to the next character
	bra.w	ExitProcessDialog
TitleEnd:
	bclr.l	#DIALOG_FLAG_TEXT_TITLE_DRAWING,d7	; clear title drawing flag
	bset.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; change state to text drawing
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL),(MEM_DIALOG_VDP)
	; increment MEM_DIALOG_TEXT by 2 to account for NPC ID being first
	add.l	#$0002,(MEM_DIALOG_TEXT)
	bra.w	ExitProcessDialog	; exit
ProcessDialogTestTextDrawing:
	btst.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; test if text is drawing
	beq.w	ProcessDialogTestOpen	; text is not drawing, go to next test
	clr.w	d6	; prevent some issues
	move.l	(MEM_DIALOG_TEXT),a0	; point a0 to the current character
	move.b	(a0),d6	; copy current character to d6
TestETX:
	cmpi.b	#ETX,d6	; is this the end of the text?
	bne.s	TestFF	; not end of text character, go to next test
	bra.w	ProcessDialogTextEnd	; flag not set so this is the end of text
TestFF:
	cmpi.b	#FF,d6	; is there another page of text?
	bne.s	TestFFR	; not the new page character, continue to next test
	bra.s	ProcessDialogFF	; skip TestFFR
TestFFR:
	cmpi.b	#FFR,d6	; is there another page of text?
	bne.s	TestObjMenu	; not the new page character, continue to next test
ProcessDialogFF:
	bset.l	#DIALOG_FLAG_TEXT_NEW_PAGE,d7	; flag there is another page
	bclr.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; done drawing, clear flag
	bset.l	#DIALOG_FLAG_TEXT_OPEN,d7	; change state to open when done
	bra.w	ExitProcessDialog	; exit routine
TestObjMenu:
	cmpi.b	#OBJNAMEEND,d6	; draw the object menu?
	bne.s	TestNPCMenu	; not the OBJMENU character, continue to next test
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL+$00800000),(MEM_DIALOG_VDP)
	lea	ObjectMenu,a6	; load object menu text
	move.l	a6,(MEM_DIALOG_TEXT)	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitProcessDialog	; exit
TestNPCMenu:
	cmpi.b	#NPCNAMEEND,d6	; draw the npc menu?
	bne.s	TestItemNameStart	; not the NPCMENU character, next test
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL+$00800000),(MEM_DIALOG_VDP)
	lea	NPCMenu,a6	; load npc menu text
	move.l	a6,(MEM_DIALOG_TEXT)	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitProcessDialog	; exit
TestItemNameStart:
	cmpi.b	#ITEMNAMESTART,d6	; start of an item name?
	bne.s	TestItemNameEnd	; not the ITEMNAMESTART character, next test
	;---------------------------------------------------------------------------
	; build text for next item name in the list
	;---------------------------------------------------------------------------
	; lookup the object ID for the next item	
	move.l	(MEM_DIALOG_ITEM_LIST),a6	; copy address of item list to a6
	move.w	(MEM_DIALOG_ITEM_INDEX),d6	; copy current item index to d6
	mulu.w	#WORD_SIZE,d6	; multiply by WORD_SIZE to get the offset
	adda.l	d6,a6	; add offset
	move.w	(a6),d6	; copy item ID to d6
	andi.w	#$0FFF,d6	; clear the base value
	; object ID is in d6 now, find the address for the text
	mulu.w	#LWORD_SIZE,d6	; multiply by LWORD_SIZE to get the offset
	lea	ItemNameTable,a6	; point a6 to item name table
	adda.l	d6,a6	; add offset
	move.l	(a6),(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	bra.w	ExitProcessDialog	; exit
TestItemNameEnd:
	cmpi.b	#ITEMNAMEEND,d6	; end of an item name?
	bne.s	TestLF	; not the ITEMNAMEEND character, next test
	;---------------------------------------------------------------------------
	; determine if there are more items to display
	;---------------------------------------------------------------------------
	addq	#$1,(MEM_DIALOG_ITEM_INDEX) ; increment item name
	cmpi.w	#MAX_ITEMS,(MEM_DIALOG_ITEM_INDEX)	; at max items?
	bge.s	ProcessDialogTextEnd	; branch if at max items
	; test if the next item is OBJ_ITEM_NOTHING
	move.l	(MEM_DIALOG_ITEM_LIST),a6	; copy address of item list to a6
	move.w	(MEM_DIALOG_ITEM_INDEX),d6	; copy current item index to d6
	mulu.w	#WORD_SIZE,d6	; multiply by WORD_SIZE to get the offset
	adda.l	d6,a6	; add offset
	cmpi.w	#OBJ_ITEM_NOTHING,(a6)	; test if value at a6 = OBJ_ITEM_NOTHING
	beq.s	ProcessDialogTextEnd	; branch if next item is OBJ_ITEM_NOTHING
	cmpi.w	#$0000,(a6)	; test if value at a6 = 0000
	beq.s	ProcessDialogTextEnd	; branch if next item is OBJ_ITEM_NOTHING
	;---------------------------------------------------------------------------
	; setup to draw the next item
	;---------------------------------------------------------------------------
	lea	ItemMenu,a6	; point a6 to the item menu text
	move.l	a6,(MEM_DIALOG_TEXT)	; copy a6 to MEM_DIALOG_TEXT
	bsr.w	SetItemMenuDrawLocation	; set the draw location of the next item
	bra.w	ExitProcessDialog
TestLF:
	cmpi.b	#LF,d6	; is this a new line character
	bne.s	.1	; not a line feed character
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL+$00800000),(MEM_DIALOG_VDP)
	bra.s	.2	; go to increment text step
.1
	; update d6 to point to the tile ID
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#DIALOG_BASE_TILE,d6	; add the base tile
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VPD
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
.2
	add.l	#$0001,(MEM_DIALOG_TEXT)	; move to the next character
	bra.w	ExitProcessDialog
ProcessDialogTextEnd:
	bclr.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; done drawing, clear flag
	bset.l	#DIALOG_FLAG_TEXT_OPEN,d7	; change state to open when done
	btst.l	#DIALOG_FLAG_OPTION_PERSIST_SELECTOR,d7	; test option
	bne.s	.3	; skip next step if persist selector option is set
	move.w	#$0000,(MEM_MENU_SELECTION)	; select first item
.3
	move.w	#DIALOG_NO_RESPONSE,(MEM_MENU_RESPONSE)	; clear response
	move.w	#$0000,(MEM_ACTIVE_ITEM)	; clear active item
	bsr.w	MoveSelectorSprite	; move selector sprite if needed
	bra.w	ExitProcessDialog	; exit routine
ProcessDialogTestOpen:
	btst.l	#DIALOG_FLAG_TEXT_OPEN,d7	; test if the dialog is open
	beq.w	ProcessDialogTestClosing	; dialog is not open, move to next test
ProcessDialogTestButtonPress:
	; wait until a button is pressed to clear the dialog
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	cmpi.w	#$0000,d6	; are any buttons pressed?
	beq.w	ExitProcessDialog ; no buttons are pressed, exit
	; start button shouldn't close the dialog
	cmpi.w	#BUTTON_START_PRESSED,d6	; test if the start button is held
	beq.w	ExitProcessDialog			; exit if start button is held
	btst.l	#DIALOG_FLAG_TEXT_NEW_PAGE,d7	; test if there is another page	
	beq.s	ProcessDialogTestSelectionWait	; branch if new text page is not set
	;---------------------------------------------------------------------------
	; moving to a new page of text
	;---------------------------------------------------------------------------
ProcessDialogNewPage:
	; clear the text area	
	bsr.w	ClearDialogTextArea
	move.l	(MEM_DIALOG_TEXT),a0	; point a0 to the current character
	move.b	(a0),d6	; copy current character to d6
	cmpi.b	#FFR,d6	; is the current character a form feed + reset?
	bne.s	ProcessDialogNewPageResetText	; not a reset, branch
	bsr.w	ClearDialogDefault	; clear the dialog to default style	
ProcessDialogNewPageResetText:
	add.l	#$0001,(MEM_DIALOG_TEXT)	; move to the next character
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL),(MEM_DIALOG_VDP)
	; reset flags to force text to start re-drawing
ProcessDialogNewPageResetFlags:
	bset.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; set drawing flag
	bclr.l	#DIALOG_FLAG_TEXT_OPEN,d7	; clear open flag
	bclr.l	#DIALOG_FLAG_TEXT_NEW_PAGE,d7	; clear new page flag
	bra.w	ExitProcessDialog	; exit
ProcessDialogTestSelectionWait:
	btst.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; test if waiting for selection 
	beq.w	ProcessDialogSetClosing ; branch if waiting selection flag not set
ProcessDialogTestButtonPressB: ; b
	cmpi.w	#BUTTON_B_PRESSED,d6	; is the b button pressed?
	bne.s	ProcessDialogTestButtonPressRight	; b not pressed, next test
	move.w	#DIALOG_NO_RESPONSE,(MEM_MENU_SELECTION)	; reset menu selection
	move.w	#DIALOG_NO_RESPONSE,(MEM_MENU_RESPONSE)	; reset menu response
	bra.w	ProcessDialogSetClosing	; close the dialog
ProcessDialogTestButtonPressRight: ; right
	cmpi.w	#BUTTON_RIGHT_PRESSED,d6	; is the right button pressed?
	bne.s	ProcessDialogTestButtonPressDown	; right not pressed, next test
	btst.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7	; test if this is a 4 choice
	beq.s	.3	; flag is not set
	bsr.w	FourChoiceLeftRight	; move menu selection right
	bra.s	.4	; move to next step
.3
	bsr.w	IncrementMenuSelection	; increment the menu selection
.4
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bsr.w	MoveSelectorSprite	; move the selector sprite
	bra.w	ExitProcessDialog	; exit
ProcessDialogTestButtonPressDown: ; down
	cmpi.w	#BUTTON_DOWN_PRESSED,d6	; is the down button pressed?
	bne.s	ProcessDialogTestButtonPressLeft	; down not pressed, next test
	btst.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7	; test if this is a 4 choice
	beq.s	.5	; flag is not set
	bsr.w	FourChoiceUpDown	; inc/dec works the same
	bra.s	.6	; move to next step
.5	
	bsr.w	IncrementMenuSelection	; increment the menu selection
.6
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bsr.w	MoveSelectorSprite	; move the selector sprite
	bra.w	ExitProcessDialog	; exit
ProcessDialogTestButtonPressLeft:	; left
	cmpi.w	#BUTTON_LEFT_PRESSED,d6	; is the left button pressed?
	bne.s	ProcessDialogTestButtonPressUp	; left not pressed move, next test
	btst.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7	; test if this is a 4 choice
	beq.s	.7	; flag is not set
	bsr.w	FourChoiceLeftRight	; move menu selection left
	bra.s	.8	; move to next step
.7
	bsr.w	DecrementMenuSelection	; increment the menu selection
.8
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bsr.w	MoveSelectorSprite	; move the selector sprite
	bra.w	ExitProcessDialog	; exit
ProcessDialogTestButtonPressUp:	; up
	cmpi.w	#BUTTON_UP_PRESSED,d6	; is the up button pressed?
	bne.s	ProcessDialogTestButtonPressA	; up not pressed move, next test
	btst.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7	; test if this is a 4 choice
	beq.s	.9	; flag is not set
	bsr.w	FourChoiceUpDown	; inc/dec works the same
	bra.s	.A	; move to next step
.9	
	bsr.w	DecrementMenuSelection	; decrement the menu selection
.A
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bsr.w	MoveSelectorSprite	; move the selector sprite
	bra.w	ExitProcessDialog	; exit
ProcessDialogTestButtonPressA:	; a
	cmpi.w	#BUTTON_A_PRESSED,d6	; is the a button pressed?
	bne.s	ProcessDialogTestButtonPressC	; a not pressed move, next test
	bsr.w	ConfirmMenuSelection	; confirm the menu selection
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bra.w	ExitProcessDialog	; exit
ProcessDialogTestButtonPressC:	; c
	cmpi.w	#BUTTON_C_PRESSED,d6	; is the c button pressed?
	bne.w	ExitProcessDialog	; c is not pressed, exit
	bsr.w	ConfirmMenuSelection	; confirm the menu selection
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bra.w	ExitProcessDialog	; exit
ProcessDialogSetClosing:
	bset.l	#DIALOG_FLAG_TEXT_CLOSING,d7	; set closing flag
	bclr.l	#DIALOG_FLAG_TEXT_OPEN,d7	; closing, clear open flag
	btst.l	#DIALOG_FLAG_OPTION_PERSIST_SELECTOR,d7	; hide the selector?
	bne.w	ExitProcessDialog	; don't hide if flag is set
	bsr.w	HideSelectorSprite	; hide selector sprite if flag not set
	bra.w	ExitProcessDialog	; exit
ProcessDialogTestClosing:
	btst.l	#DIALOG_FLAG_TEXT_CLOSING,d7	; test if the dialog is closing
	beq.s	ProcessDialogClearFlags	; dialog is not closing, exit
	; dialog closing animation
	move.w	d7,d6	; copy low word with frame number
	subq	#$1,d6	; decrement frame number
	mulu.w	#DIALOG_PATTERN_SIZE,d6	; multiply by size of dialog patterns
	btst.l	#DIALOG_FLAG_STYLE_TITLED,d7	; test if the dialog is titled
	beq.s	.1	; flag is not set
	lea	PatternDialogTitledClear,a0	; point a0 to start of dialog patterns
	bra.s	.2
.1
	lea	PatternDialogClear,a0	; point a0 to start of dialog patterns
.2
	adda.l	d6,a0	; decrement to current frame
	move.w	#DIALOG_BASE_TILE,d0	; base pattern
	moveq	#$0000,d1	; repeat
	lea	VDP_VRAM_WRITE_A,a1	; initial drawing location
	adda.l	#DIALOG_ROWCOL,a1	; move to row & column
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	subq	#$1,d7	; decrement frame number
	cmpi.w	#$0000,d7	; are we at the last frame?
	bgt.s	ExitProcessDialog ; not at the last frame, exit
	; if the target of the dialog was an NPC, restore their previous direction
	move.w (MEM_ACTION_TARGET_NPCID),d7	; copy NPC target ID to d7
	cmpi.w	#$FFFF,d7	; test if it is -1
	beq.s	ProcessDialogClearFlags	; exit if -1
	lea	MEM_NPC0_SPRITE_ID,a6	; point a6 to the first NPC sprite
	move.w	(MEM_ACTION_TARGET_NPCID),d1	; copy target NPC id to d1
	mulu.w	#NPC_RECORD_SIZE,d1	; multiply by NPC_RECORD_SIZE to get offset
	adda.l	d1,a6	; move to target NPC sprite
	; restore NPC direction if not in a scripted event
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; test the scripted event flag
	bne.s	ProcessDialogClearFlags	; skip step to restore NPC direction
	move.w	(MEM_ACTION_TARGET_NPC_DIRECTION),(STRUCT_SPRITE_DIRECTION,a6)
ProcessDialogClearFlags:	; clear flags when done
	andi.l	#$00000000,d7	; clear all dialog flags 
	; clear dialog bit on game state
	move.l	(MEM_GAME_STATE),d6	; copy current game state to d6
	bclr.l	#STATE_FLAG_DIALOG,d6	; clear the dialog bit
	move.l	d6,(MEM_GAME_STATE)	; copy it back
	move.w	#$0000,(MEM_DIALOG_ITEM_INDEX)	; reset item index
ExitProcessDialog:
	move.l	d7,(MEM_DIALOG_FLAGS)	; save any changes made to the game state
	move.w	#$2000,sr		; re-enable interrupts
	rts

ConfirmMenuSelection:
	btst.l	#DIALOG_FLAG_STYLE_MENU,d7	; test if this is a menu
	beq.s	ConfirmMenuSelection2Choice	; flag is not set
	move.w	(MEM_MENU_SELECTION),(MEM_ACTION_ID)	; selection->action
	bra.s	ExitConfirmMenuSelection	; exit
ConfirmMenuSelection2Choice:
	btst.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; test if this is a menu
	beq.s	ConfirmMenuSelection4Choice	; flag is not set
	move.w	#ACTION_RESPOND,(MEM_ACTION_ID)	; action is respond
	move.w	(MEM_MENU_SELECTION),(MEM_MENU_RESPONSE)	; selection->response
	bra.s	ExitConfirmMenuSelection	; exit
ConfirmMenuSelection4Choice:
	move.w	(MEM_MENU_SELECTION),(MEM_MENU_RESPONSE)	; selection->response
	btst.l	#DIALOG_FLAG_STYLE_ITEM_MENU,d7	; test if this is an item menu
	bne.s	ConfirmMenuSelection4ChoiceItemMenu	; this is an item menu, branch
	move.w	#ACTION_RESPOND,(MEM_ACTION_ID)	; action is respond
	move.w	(MEM_MENU_SELECTION),(MEM_MENU_RESPONSE)	; selection->response
	bra.s	ExitConfirmMenuSelection	; exit
ConfirmMenuSelection4ChoiceItemMenu:
	; store selected item in MEM_ACTIVE_ITEM	
	move.l	(MEM_DIALOG_ITEM_LIST),a6	; copy address of item list to a6
	move.w	(MEM_MENU_SELECTION),d6	; copy current item index to d6
	mulu.w	#WORD_SIZE,d6	; multiply by WORD_SIZE to get the offset
	adda.l	d6,a6	; add offset
	move.w	(a6),(MEM_ACTIVE_ITEM)	; copy item ID to d6
ExitConfirmMenuSelection:
	move.l	(MEM_GAME_STATE),d6	; copy current game state to d6
	bset.l	#STATE_FLAG_ACTION,d6	; clear the dialog bit
	move.l	d6,(MEM_GAME_STATE)	; copy it back
	rts

IncrementMenuSelection:
	btst.l	#DIALOG_FLAG_STYLE_MENU,d7	; test if this is a menu
	beq.s	IncrementMenuSelection2Choice	; flag is not set
	addq	#$1,(MEM_MENU_SELECTION) ; increment menu selection
	cmpi.w	#$0003,(MEM_MENU_SELECTION)	; at the last menu item?
	bge.s	IncrementMenuSelectionMenuRollover	; at the last item, branch
	rts
IncrementMenuSelectionMenuRollover:
	move.w	#$0000,(MEM_MENU_SELECTION)	; rollover to first menu item
	rts
IncrementMenuSelection2Choice:
	addq	#$1,(MEM_MENU_SELECTION) ; increment menu selection
	cmpi.w	#$0002,(MEM_MENU_SELECTION)	; at the last menu item?
	bge.s	IncrementMenuSelection2ChoiceRollover	; at the last item, branch
	rts
IncrementMenuSelection2ChoiceRollover:
	move.w	#$0000,(MEM_MENU_SELECTION)	; rollover to first menu item
	rts

DecrementMenuSelection:
	btst.l	#DIALOG_FLAG_STYLE_MENU,d7	; test if this is a menu
	beq.s	DecrementMenuSelection2Choice	; flag is not set
	cmpi.w	#$0000,(MEM_MENU_SELECTION)	; at the first menu item?
	ble.s	DecrementMenuSelectionMenuRollover	; at the first item, branch
	subq	#$1,(MEM_MENU_SELECTION) ; decrement menu selection
	rts
DecrementMenuSelectionMenuRollover:
	move.w	#$0002,(MEM_MENU_SELECTION)	; rollover to last menu item
	rts
DecrementMenuSelection2Choice:
	cmpi.w	#$0000,(MEM_MENU_SELECTION)	; at the first menu item?
	ble.s	DecrementMenuSelection2ChoiceRollover	; at the first item, branch
	subq	#$1,(MEM_MENU_SELECTION) ; decrement menu selection
	rts
DecrementMenuSelection2ChoiceRollover:
	move.w	#$0001,(MEM_MENU_SELECTION)	; rollover to last menu item
	rts

FourChoiceLeftRight:
	btst.l	#DIALOG_FLAG_STYLE_ITEM_MENU,d7	; test if this is an item menu
	beq.s	.1	; not an item menu, branch
	; MEM_DIALOG_ITEM_INDEX has the total number of items in dialog + 1
	cmpi.w	#$0002,(MEM_DIALOG_ITEM_INDEX)	; are there 2 or fewer items?
	ble.s	ExitFourChoiceLeftRight	; exit if 2 or fewer
	; there are 3 or 4 items, 4 items is fine
	cmpi.w	#$0004,(MEM_DIALOG_ITEM_INDEX)	; are there 4 items?
	bge.s	.1	; if so continue
	; three items is the only possibility now
	cmpi.w	#$0001,(MEM_MENU_SELECTION)	; is the 2nd item selected?
	beq.s	ExitFourChoiceLeftRight	; if so exit
.1
	cmpi.w	#$0002,(MEM_MENU_SELECTION)	; test if <2
	blt.s	.2	; MEM_MENU_SELECTION is > 2
	subq	#$0002,(MEM_MENU_SELECTION)	; subtract 2 to rollover
	bra.s	ExitFourChoiceLeftRight	; exit
.2
	addq	#$0002,(MEM_MENU_SELECTION)	; add 2 to move right
ExitFourChoiceLeftRight:
	rts

FourChoiceUpDown:
	btst.l	#DIALOG_FLAG_STYLE_ITEM_MENU,d7	; test if this is an item menu
	beq.s	.1	; not an item menu, branch
	; MEM_DIALOG_ITEM_INDEX has the total number of items in dialog + 1
	cmpi.w	#$0001,(MEM_DIALOG_ITEM_INDEX)	; is there only 1 item?
	beq.s	ExitFourChoiceFourChoiceUpDown	; exit if only 1 item
	; there are 3 or 4 items, 4 items is fine
	cmpi.w	#$0004,(MEM_DIALOG_ITEM_INDEX)	; are there 4 items?
	bge.s	.1	; if so continue
	; three items is the only possibility now
	cmpi.w	#$0002,(MEM_MENU_SELECTION)	; is the 3rd item selected?
	beq.s	ExitFourChoiceFourChoiceUpDown	; if so exit
.1
	cmpi.w	#$0000,(MEM_MENU_SELECTION)	; test if 0
	beq.s	FourChoiceUpDownAdd	; MEM_MENU_SELECTION is 0
	cmpi.w	#$0002,(MEM_MENU_SELECTION)	; test if 2
	beq.s	FourChoiceUpDownAdd	; MEM_MENU_SELECTION is 2
	subq	#$0001,(MEM_MENU_SELECTION)	; subtract 1 to rollover
	bra.s	ExitFourChoiceFourChoiceUpDown	; exit
FourChoiceUpDownAdd:
	addq	#$0001,(MEM_MENU_SELECTION)	; add 2 to move down
ExitFourChoiceFourChoiceUpDown:
	rts

HideSelectorSprite:
	;---------------------------------------------------------------------------
	; update y
	;---------------------------------------------------------------------------
	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	#$0000,(VDP_DATA)	; copy the new y-coordinate
	;---------------------------------------------------------------------------
	; update x
	;---------------------------------------------------------------------------
	add.l	#$00060000,d6	; move to x-coordinate
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	#$0000,(VDP_DATA)	; copy the new x-coordinate
ExitHideSelectorSprite:
	rts

MoveSelectorSprite:	; this also sets DIALOG_FLAG_SELECTION_WAIT if appropriate
	; store sprite x in d4, sprite y in d5
	moveq	#$0000,d4	; set to 0 by default
	moveq	#$0000,d5	; set to 0 by default
	; test for option to persist the selector
	btst.l	#DIALOG_FLAG_OPTION_PERSIST_SELECTOR,d7	; test flag
	bne.w	ExitMoveSelectorSprite	; exit if flag is set
	btst.l	#DIALOG_FLAG_TEXT_CLOSING,d7	; test if the dialog is closing
	bne.s	MoveSelectorSpriteUpdateXY	; flag is set move to update VDP section
	btst.l	#DIALOG_FLAG_STYLE_MENU,d7	; test if this is a menu
	beq.s	MoveSelectorSprite2Choice	; flag is not set, try next test
MoveSelectorSprite3Choice:
	bset.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; set waiting for selection flag 
	move.w	#DIALOG_MENU_INIT_SELECTION_X,d4	; x value
	; move x value based on which item is selected
	moveq	#$0038,d6	; the selections are 38 apart
	mulu.w	(MEM_MENU_SELECTION),d6	; multiply by selection number
	add.w	d6,d4	; add result to x
	move.w	#DIALOG_MENU_INIT_SELECTION_Y,d5	; y value
	addq	#$8,d5	; adjust for options being on 2nd row of dialog
	bra.s	MoveSelectorSpriteUpdateXY	; move to update VDP section
MoveSelectorSprite2Choice:
	btst.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; test if this is 2 choice menu
	beq.s	MoveSelectorSprite4Choice	; flag is not set, try next test
	bset.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; set waiting for selection flag 
	move.w	#DIALOG_MENU_INIT_SELECTION_X,d4	; x value
	move.w	#DIALOG_MENU_INIT_SELECTION_Y,d5	; y value
	; move y value based on which item is selected
	moveq	#$0008,d6	; the selections are 8 apart
	mulu.w	(MEM_MENU_SELECTION),d6	; multiply by selection number
	add.w	d6,d5	; add result to y
MoveSelectorSprite4Choice:
	btst.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7	; test if this is 4 choice menu
	beq.s	MoveSelectorSpriteUpdateXY	; flag is not set, use default values
	bset.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; set waiting for selection flag 
	move.w	#DIALOG_MENU_INIT_SELECTION_X,d4	; x value
	move.w	#DIALOG_MENU_INIT_SELECTION_Y,d5	; y value
	move.w	(MEM_MENU_SELECTION),d6	; copy menu selection to d6
	; if selection is 1 or 3 then move y value
	btst.l	#$0,d6	; test if the first bit is set
	beq.s	MoveSelectorSprite4ChoiceX	; branch if not
	addq	#$0008,d5	; increment y value to move down
MoveSelectorSprite4ChoiceX:	; if selection is 2 or 3 then move x value
	btst.l	#$1,d6	; test if the second bit is set
	beq.s	MoveSelectorSpriteUpdateXY	; branch if not
	add.w	#$0058,d4	; increment x value to move right
MoveSelectorSpriteUpdateXY:
	;---------------------------------------------------------------------------
	; update y
	;---------------------------------------------------------------------------
	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	d5,(VDP_DATA)	; copy the new y-coordinate
	;---------------------------------------------------------------------------
	; update x
	;---------------------------------------------------------------------------
	add.l	#$00060000,d6	; move to x-coordinate
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	d4,(VDP_DATA)	; copy the new x-coordinate
ExitMoveSelectorSprite:
	rts

SetItemMenuDrawLocation:
	move.w	(MEM_DIALOG_ITEM_INDEX),d6	; copy index of current item to d6
	;test for 0001
	cmpi.w	#$0001,d6	; is it one?
	bne.s	.1	; branch if not
	; move down 2 rows
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL+$00800000),(MEM_DIALOG_VDP)
	bra.s	ExitSetItemMenuDrawLocation	; exit
.1	; test for 0002
	cmpi.w	#$0002,d6	; is it two?
	bne.s	.2	; branch if not
	; move down 1 row
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL+$00160000),(MEM_DIALOG_VDP)
	bra.s	ExitSetItemMenuDrawLocation	; exit
.2	; test for 0003
	cmpi.w	#$0003,d6	; is it three?
	bne.s	ExitSetItemMenuDrawLocation	; exit if not
	; move down 1 row and column
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TEXT_ROWCOL+$00960000),(MEM_DIALOG_VDP)
ExitSetItemMenuDrawLocation:
	rts

ProcessDialogLookupNPCName:
	; lookup the NPC name
	clr	d6	; lazy workaround to various bugs
	move.l	(MEM_DIALOG_TEXT),a0	; point a0 to the NPC ID
	move.w	(a0),d6	; copy NPC ID to d6
	andi.w	#$0FFF,d6	; clear the base value
	mulu.w	#$4,d6	; multiply by 4 to get the offset
	lea	NPCNameTable,a0	; point to npc name table
	; prevent issues if an NPC name is missing
	cmpi.w	#NPC_NAME_TABLE_SIZE,d6	; check if d6 is past end of table
	bgt.s	.1	; branch if so
	adda.l	d6,a0	; add offset
.1
	move.l	(a0),(MEM_DIALOG_TITLE)	; copy value at a0 to MEM_DIALOG_TEXT
	rts

