ProcessDialog:
	move.w	#$2700,sr	; disable interrupts while managing dialogs
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
ProcessDialogTestTextBuilt:
	btst.l	#DIALOG_FLAG_TEXT_BUILT,d7	; test game state
	bne.s	ProcessDialogTestOpening	; text is built, move to next test
	bsr.w	BuildNPCObjectList	; update the location of NPCs
	bsr.w	FindActionTarget	; find the target of the player's action
	bsr.w	BuildDialogText	; build text
	bset.l	#DIALOG_FLAG_TEXT_BUILT,d7	; flag that text is built
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7	; change state to opening
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
	btst.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; test if the dialog is opening
	beq.w	ProcessDialogTestOpen	; text is not drawing, go to next test
	move.l	(MEM_DIALOG_TEXT),a0	; point a0 to the current character
	move.b	(a0),d6	; copy current character to d6
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.s	ProcessDialogTextEnd	; end of text
	cmpi.b	#FF,d6	; is there another page of text?
	bne.s	.1	; not the new page character, continue to next test
	bset.l	#DIALOG_FLAG_TEXT_NEW_PAGE,d7	; flag there is another page
	bra.s	ProcessDialogTextEnd
.1
	cmpi.b	#LF,d6	; is this a new line character
	bne.s	.2	; not a new character
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_ROWCOL),(MEM_DIALOG_VPD)	; base address
	add.l	#$01020000,(MEM_DIALOG_VPD)	; add 258 to move 2 rows and column
	bra.s	.3	; go to increment text step
.2
	; update d6 to point to the tile ID
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#DIALOG_BASE_TILE,d6	; add the base tile
	move.l	(MEM_DIALOG_VPD),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VPD
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VPD)	; move to the next column
.3
	add.l	#$0001,(MEM_DIALOG_TEXT)	; move to the next character
	bra.w	ExitProcessDialog
ProcessDialogTextEnd:
	bclr.l	#DIALOG_FLAG_TEXT_DRAWING,d7	; done drawing, clear flag
	bset.l	#DIALOG_FLAG_TEXT_OPEN,d7	; change state to open when done
ProcessDialogTestOpen:
	btst.l	#DIALOG_FLAG_TEXT_OPEN,d7	; test if the dialog is open
	beq.s	ProcessDialogTestClosing	; dialog is not open, move to next test
	; wait until a button is pressed to clear the dialog
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	cmpi.w	#$0000,d6	; are any buttons pressed?
	beq.w	ExitProcessDialog ; no buttons are pressed, exit
	; start button shouldn't close the dialog
	andi.w	#BUTTON_START_PRESSED,d6	; test if the start button is held
	bne.w	ExitProcessDialog			; exit if start button is held
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
	bra.s	ExitProcessDialog			; exit
.4
	bset.l	#DIALOG_FLAG_TEXT_CLOSING,d7	; set closing flag
	bclr.l	#DIALOG_FLAG_TEXT_OPEN,d7	; closing, clear open flag
ProcessDialogTestClosing:
	btst.l	#DIALOG_FLAG_TEXT_CLOSING,d7	; test if the dialog is opening
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

; this demo iteration is just doing a brute force lookup by object id
; future versions of this demo should add rules based on the game state 
BuildDialogText: ; note - d7 is used by the caller
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NOTHING,d6
	bne.s	.1
	lea	DialogTextNothing,a0
	bra.s	ExitBuildDialogText
.1
	cmpi.w	#OBJ_SCENE_VB_8BIT,d6
	bne.s	.2
	lea	DialogText8Bit,a0
	bra.s	ExitBuildDialogText
.2
	cmpi.w	#OBJ_SCENE_VB_MAGS,d6
	bne.s	.3
	lea	DialogTextMags,a0
	bra.s	ExitBuildDialogText
.3
	cmpi.w	#OBJ_SCENE_VB_COUNTER,d6
	bne.s	.4
	lea	DialogTextCounter,a0
	bra.s	ExitBuildDialogText
.4
	cmpi.w	#OBJ_SCENE_VB_REGISTER,d6
	bne.s	.5
	lea	DialogTextRegister,a0
	bra.s	ExitBuildDialogText	
.5
	cmpi.w	#OBJ_NPC_DANI,d6
	bne.s	.6
	lea	DialogTextDani,a0
	bra.s	ExitBuildDialogText
.6
	cmpi.w	#OBJ_SCENE_VB_HARDWARE,d6
	bne.s	.7
	lea	DialogTextHardware,a0
	bra.s	ExitBuildDialogText	
.7
	cmpi.w	#OBJ_SCENE_VB_16BIT,d6
	bne.s	.8
	lea	DialogText16Bit,a0
	bra.s	ExitBuildDialogText
.8
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6
	bne.s	.9
	lea	DialogTextMaleShopper0,a0
	bra.s	ExitBuildDialogText	
.9
	lea	DialogTextNothing,a0
ExitBuildDialogText:
	move.l	a0,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

