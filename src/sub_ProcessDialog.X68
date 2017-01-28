ProcessDialog:
	move.w	#$2700,sr	; disable interrupts while managing dialogs
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
ProcessDialogTestOpening:
	btst.l	#DIALOG_FLAG_TEXT_OPENING,d7	; test if the dialog is opening
	beq.s	ProcessDialogTextDrawing	; dialog is not opening, go to next test
	; dialog opening animation
	move.w	d7,d6	; copy low word with frame number
	mulu.w	#DIALOG_PATTERN_SIZE,d6	; multiply by size of dialog patterns
	movea.l	#PatternDialogClear,a0	; point a0 to start of dialog patterns
	adda.l	d6,a0	; increment to current frame
	move.w	#DIALOG_BASE_TILE,d0	; base pattern
	move.w	#$0000,d1	; repeat
	movea.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),a1	; initial drawing location
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	addq	#$1,d7	; increment frame number
	cmpi.w	#DIALOG_FRAME_COUNT,d7	; are we at the last frame?
	ble.w	ExitProcessDialog ; not at the last frame, exit
	bclr.l	#DIALOG_FLAG_TEXT_OPENING,d7	; done opening, clear flag
	bset.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; change state to text drawing
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),(MEM_DIALOG_VPD)	; base address
	add.l	#$00820000,(MEM_DIALOG_VPD)	; add 132 to move 1 row and column
	bra.w	ExitProcessDialog	; exit
ProcessDialogTextDrawing:
	btst.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; test if text is drawing
	beq.w	ProcessDialogTestOpen	; text is not drawing, go to next test
	move.l	(MEM_DIALOG_TEXT),a0	; point a0 to the current character
	move.b	(a0),d6	; copy current character to d6
TestETX:
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.w	ProcessDialogTextEnd	; end of text
TestFF:
	cmpi.b	#FF,d6	; is there another page of text?
	bne.s	TestObjMenu	; not the new page character, continue to next test
	bset.l	#DIALOG_FLAG_TEXT_NEW_PAGE,d7	; flag there is another page
	bclr.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; done drawing, clear flag
	bset.l	#DIALOG_FLAG_TEXT_OPEN,d7	; change state to open when done
	bra.w	ExitProcessDialog	; exit routine
TestObjMenu:
	cmpi.b	#OBJMENU,d6	; draw the object menu?
	bne.s	TestNPCMenu	; not the OBJMENU character, continue to next test
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),(MEM_DIALOG_VPD)	; base address
	add.l	#$01020000,(MEM_DIALOG_VPD)	; add 258 to move 2 rows and column
	lea	ObjectMenu,a6	; load object menu text
	move.l	a6,(MEM_DIALOG_TEXT)	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitProcessDialog
TestNPCMenu:
	cmpi.b	#NPCMENU,d6	; draw the npc menu?
	bne.s	TestLF	; not the NPCMENU character, continue to next test
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),(MEM_DIALOG_VPD)	; base address
	add.l	#$01020000,(MEM_DIALOG_VPD)	; add 258 to move 2 rows and column
	lea	NPCMenu,a6	; load npc menu text
	move.l	a6,(MEM_DIALOG_TEXT)	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitProcessDialog
TestLF:
	cmpi.b	#LF,d6	; is this a new line character
	bne.s	.1	; not a new character
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),(MEM_DIALOG_VPD)	; base address
	add.l	#$01020000,(MEM_DIALOG_VPD)	; add 258 to move 2 rows and column
	bra.s	.2	; go to increment text step
.1
	; update d6 to point to the tile ID
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#DIALOG_BASE_TILE,d6	; add the base tile
	move.l	(MEM_DIALOG_VPD),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VPD
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VPD)	; move to the next column
.2
	add.l	#$0001,(MEM_DIALOG_TEXT)	; move to the next character
	bra.w	ExitProcessDialog
ProcessDialogTextEnd:
	bclr.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; done drawing, clear flag
	bset.l	#DIALOG_FLAG_TEXT_OPEN,d7	; change state to open when done
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
	beq.s	.4	; branch if new text page is not set
	;---------------------------------------------------------------------------
	; moving to a new page of text
	;---------------------------------------------------------------------------
	add.l	#$0001,(MEM_DIALOG_TEXT)	; move to the next character
	; reset the drawing location for the dialog text
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),(MEM_DIALOG_VPD)	; base address
	add.l	#$00820000,(MEM_DIALOG_VPD)	; add 132 to move 1 row and column	
	; clear out the dialog
	movea.l	#PatternDialogFull,a0	; point a0 to start of dialog patterns
	move.w	#DIALOG_BASE_TILE,d0	; base pattern
	move.w	#$0000,d1	; repeat
	movea.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),a1	; initial drawing location
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	; reset flags to force text to start re-drawing
	bset.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; set drawing flag
	bclr.l	#DIALOG_FLAG_TEXT_OPEN,d7	; clear open flag
	bclr.l	#DIALOG_FLAG_TEXT_NEW_PAGE,d7	; clear new page flag
	bra.w	ExitProcessDialog	; exit
.4
	btst.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; test if waiting for selection 
	beq.w	ProcessDialogSetClosing ; branch if waiting selection flag not set
	cmpi.w	#BUTTON_B_PRESSED,d6	; is the b button pressed?
	beq.w	ProcessDialogSetClosing	; close if b button is pressed
	cmpi.w	#BUTTON_RIGHT_PRESSED,d6	; is the right button pressed?
	bne.s	.5	; right is not pressed, move to next test
	bsr.w	IncrementMenuSelection	; increment the menu selection
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bsr.w	MoveSelectorSprite	; move the selector sprite
	bra.w	ExitProcessDialog	; exit
.5 ; down
	cmpi.w	#BUTTON_DOWN_PRESSED,d6	; is the down button pressed?
	bne.s	.6	; down is not pressed, move to next test
	bsr.w	IncrementMenuSelection	; increment the menu selection
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bsr.w	MoveSelectorSprite	; move the selector sprite
	bra.w	ExitProcessDialog	; exit
.6	; left
	cmpi.w	#BUTTON_LEFT_PRESSED,d6	; is the left button pressed?
	bne.s	.7	; left is not pressed, move to next test
	bsr.w	DecrementMenuSelection	; increment the menu selection
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bsr.w	MoveSelectorSprite	; move the selector sprite
	bra.w	ExitProcessDialog	; exit
.7	; up
	cmpi.w	#BUTTON_UP_PRESSED,d6	; is the up button pressed?
	bne.s	.8	; up is not pressed, move to next test
	bsr.w	DecrementMenuSelection	; increment the menu selection
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bsr.w	MoveSelectorSprite	; move the selector sprite
	bra.s	ExitProcessDialog	; exit
.8	; a
	cmpi.w	#BUTTON_A_PRESSED,d6	; is the a button pressed?
	bne.s	.9	; a is not pressed, move to next test
	bsr.w	ConfirmMenuSelection	; confirm the menu selection
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bra.s	ExitProcessDialog	; exit
.9	; c
	cmpi.w	#BUTTON_C_PRESSED,d6	; is the c button pressed?
	bne.s	ExitProcessDialog	; c is not pressed, exit
	bsr.w	ConfirmMenuSelection	; confirm the menu selection
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	bra.s	ExitProcessDialog	; exit
ProcessDialogSetClosing:
	bset.l	#DIALOG_FLAG_TEXT_CLOSING,d7	; set closing flag
	bclr.l	#DIALOG_FLAG_TEXT_OPEN,d7	; closing, clear open flag
	bsr.w	HideSelectorSprite	; hide selector sprite
	bra.s	ExitProcessDialog	; exit
ProcessDialogTestClosing:
	btst.l	#DIALOG_FLAG_TEXT_CLOSING,d7	; test if the dialog is closing
	beq.s	ProcessDialogClearFlags	; dialog is not closing, exit
	; dialog closing animation
	move.w	d7,d6	; copy low word with frame number
	subq	#$1,d6	; decrement frame number
	mulu.w	#DIALOG_PATTERN_SIZE,d6	; multiply by size of dialog patterns
	movea.l	#PatternDialogClear,a0	; point a0 to start of dialog patterns
	adda.l	d6,a0	; decrement to current frame
	move.w	#DIALOG_BASE_TILE,d0	; base pattern
	move.w	#$0000,d1	; repeat
	movea.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),a1	; initial drawing location
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	subq	#$1,d7	; decrement frame number
	cmpi.w	#$0000,d7	; are we at the last frame?
	bgt.s	ExitProcessDialog ; not at the last frame, exit
ProcessDialogClearFlags:	; clear flags when done
	andi.l	#$00000000,d7	; clear all dialog flags 
	; clear dialog bit on game state
	move.l	(MEM_GAME_STATE),d6	; copy current game state to d6
	bclr.l	#STATE_FLAG_DIALOG,d6	; clear the dialog bit
	move.l	d6,(MEM_GAME_STATE)	; copy it back
ExitProcessDialog:
	move.l	d7,(MEM_DIALOG_FLAGS)	; save any changes made to the game state
	move.w	#$2000,sr		; re-enable interrupts
	rts

ConfirmMenuSelection:
	btst.l	#DIALOG_FLAG_STYLE_MENU,d7	; test if this is a menu
	beq.s	.1	; flag is not set
	move.w	(MEM_MENU_SELECTION),(MEM_ACTION_ID)	; selection->action
	bra.s	ExitConfirmMenuSelection	; exit
.1	; not DIALOG_FLAG_STYLE_MENU - must be DIALOG_FLAG_STYLE_TEXT_CHOICE
	move.w	#ACTION_RESPOND,(MEM_ACTION_ID)	; action is respond
	move.w	(MEM_MENU_SELECTION),(MEM_MENU_RESPONSE)	; selection->response
ExitConfirmMenuSelection:
	move.l	(MEM_GAME_STATE),d6	; copy current game state to d6
	bset.l	#STATE_FLAG_ACTION,d6	; clear the dialog bit
	move.l	d6,(MEM_GAME_STATE)	; copy it back
	rts

IncrementMenuSelection:
	btst.l	#DIALOG_FLAG_STYLE_MENU,d7	; test if this is a menu
	beq.s	.2	; flag is not set
	addq	#$1,(MEM_MENU_SELECTION) ; increment menu selection
	cmpi.w	#$0003,(MEM_MENU_SELECTION)	; at the last menu item?
	bge.s	.1	; at the last menu item, branch
	rts
.1
	move.w	#$0000,(MEM_MENU_SELECTION)	; rollover to first menu item
	rts
.2	; not DIALOG_FLAG_STYLE_MENU - must be DIALOG_FLAG_STYLE_TEXT_CHOICE
	addq	#$1,(MEM_MENU_SELECTION) ; increment menu selection
	cmpi.w	#$0002,(MEM_MENU_SELECTION)	; at the last menu item?
	bge.s	.3	; at the last menu item, branch
	rts
.3
	move.w	#$0000,(MEM_MENU_SELECTION)	; rollover to first menu item
	rts

DecrementMenuSelection:
	btst.l	#DIALOG_FLAG_STYLE_MENU,d7	; test if this is a menu
	beq.s	.2	; flag is not set
	cmpi.w	#$0000,(MEM_MENU_SELECTION)	; at the first menu item?
	ble.s	.1	; at the first menu item, branch
	subq	#$1,(MEM_MENU_SELECTION) ; decrement menu selection
	rts
.1
	move.w	#$0002,(MEM_MENU_SELECTION)	; rollover to first menu item
	rts
.2	; not DIALOG_FLAG_STYLE_MENU - must be DIALOG_FLAG_STYLE_TEXT_CHOICE
	cmpi.w	#$0000,(MEM_MENU_SELECTION)	; at the first menu item?
	ble.s	.3	; at the first menu item, branch
	subq	#$1,(MEM_MENU_SELECTION) ; decrement menu selection
	rts
.3
	move.w	#$0001,(MEM_MENU_SELECTION)	; rollover to first menu item
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
	move.w	#$0000,d4	; set to 0 by default
	move.w	#$0000,d5	; set to 0 by default
	btst.l	#DIALOG_FLAG_TEXT_CLOSING,d7	; test if the dialog is closing
	bne.s	.2	; flag is set, move to update VDP section
	btst.l	#DIALOG_FLAG_STYLE_MENU,d7	; test if this is a menu
	beq.s	.1	; flag is not set, try next test
	bset.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; set waiting for selection flag 
	move.w	#DIALOG_MENU_INIT_SELECTION_X,d4	; x value
	; move x value based on which item is selected
	move.w	#$0038,d6	; the selections are 38 apart
	mulu.w	(MEM_MENU_SELECTION),d6	; multiply by selection number
	add.w	d6,d4	; add result to x
	move.w	#DIALOG_MENU_INIT_SELECTION_Y,d5	; y value
	addq	#$8,d5	; adjust for options being on 2nd row of dialog
	bra.s	.2	; move to update VDP section
.1
	btst.l	#DIALOG_FLAG_STYLE_TEXT_CHOICE,d7	; test if this is a menu
	beq.s	.2	; flag is not set, use default values
	bset.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; set waiting for selection flag 
	move.w	#DIALOG_MENU_INIT_SELECTION_X,d4	; x value
	move.w	#DIALOG_MENU_INIT_SELECTION_Y,d5	; y value
	; move y value based on which item is selected
	move.w	#$0008,d6	; the selections are 8 apart
	mulu.w	(MEM_MENU_SELECTION),d6	; multiply by selection number
	add.w	d6,d5	; add result to y
.2
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

