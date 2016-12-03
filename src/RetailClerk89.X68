;*******************************************************************************
; Main code file for RetailClerk89, a personal exercise to learn MD programming.
; This might even turn into a real game demo one day.
;
; This file contains all the work in-progress.
;
; Any code that's relatively stable has been split into a separate file.
;
; In other cases code was also split into a separate file to separate original
; work from online samples. Original work is under MIT license.
;
; Build this using: 
;	vasmm68k_mot -o RetailClerk89.bin -Fbin -no-opt -nosym RetailClerk89.X68
;	-no-opt is used because I haven't tested if optimizations break anything
;	-nosym is also used out of general ignorance about the side-effects
;
; Visit http://HuguesJohnson.com/ for random articles about this project.
; 
; General program notes:
; 	-there are some constants defined that are not (yet) used
; 	-there are a lot of opportunities to optimize this code
;*******************************************************************************

;*******************************************************************************
; constants
;*******************************************************************************

;-------------------------------------------------------------------------------
; common constants
;-------------------------------------------------------------------------------
	include 'const_MegaDrive.X68'

;-------------------------------------------------------------------------------
; memory map
;-------------------------------------------------------------------------------
	include 'const_MemoryMap.X68'

;-------------------------------------------------------------------------------
; program-specific constants
;-------------------------------------------------------------------------------
	include 'const_ObjectIDs.X68'

; data addresses
ROM_ADDR_INSTRUMENTS=$80000
; sprite settings
SPRITE_BASE_PATTERN=$6100	; base pattern of sprites
DEFAULT_SPRITE_HEIGHT=$0020	; how many pixels tall a sprite is by default
DEFAULT_SPRITE_WIDTH=$0010	; how many pixels wide a sprite is by default
SPRITE_FRAME_COUNT=$0003	; how many animation frames there are for sprites
SPRITE_MOVE_FREQUENCY=$0001 ; how many frames to wait between sprite moves
SPRITE_ANIMATION_STEPS=$000A	; how many steps between animation frame changes
SPRITE_STEP_PIXELS=$0001	; how many pixels to move on each sprite step
SPRITE_PLAYER_PATTERN=SPRITE_BASE_PATTERN	; base pattern for player sprite
SPRITE_PLAYER_HEIGHT=DEFAULT_SPRITE_HEIGHT	; player sprite height
SPRITE_PLAYER_WIDTH=DEFAULT_SPRITE_WIDTH	; player sprite 
SPRITE_PLAYER_INIT_X=$0100	; starting x location of player sprite
SPRITE_PLAYER_INIT_Y=$0100	; starting y location of player sprite
SPRITE_NPC1_PATTERN=SPRITE_BASE_PATTERN+$60	; base pattern for npc1 sprite
SPRITE_NPC1_HEIGHT=DEFAULT_SPRITE_HEIGHT	; npc1 sprite height
SPRITE_NPC1_WIDTH=DEFAULT_SPRITE_WIDTH	; npc1 sprite 
SPRITE_NPC1_INIT_X=$0180	; starting x location of npc1 sprite
SPRITE_NPC1_INIT_Y=$0120	; starting y location of npc1 sprite
SPRITE_NPC1_MOVE_TEST=$0FF0	; used to determine how often to move the NPC
SPRITE_NPC1_MOVE_STEPS=$0009; how many steps the NPC sprite takes when they move
; directions
DIRECTION_DOWN=%0000	; 0
DIRECTION_UP=%0001		; 1
DIRECTION_LEFT=%0010	; 2
DIRECTION_RIGHT=%0011	; 3
; used for sprite collision tests
; top edge of bottom 1/2 of sprite
SPRITE_COLLISION_Y=(DEFAULT_SPRITE_HEIGHT-(DEFAULT_SPRITE_HEIGHT/2))
SPRITE_COLLISION_UP=SPRITE_STEP_PIXELS
SPRITE_COLLISION_DOWN=(DEFAULT_SPRITE_HEIGHT/2)+SPRITE_STEP_PIXELS
SPRITE_COLLISION_RIGHT=DEFAULT_SPRITE_WIDTH+SPRITE_STEP_PIXELS
SPRITE_COLLISION_LEFT=SPRITE_STEP_PIXELS
MAP_MID_X=$100
; these are based on registers 2,3,4,5,13 in data_VDPInit.X68
VDP_VRAM_WRITE_A=$40000003			; register 2
VDP_VRAM_WRITE_HSCROLL=$7C000002	; register 13
VDP_VRAM_WRITE_SPRITE=$78000002		; register 5
VDP_VRAM_WRITE_B=$60000003			; register 4
VDP_VRAM_WRITE_WINDOW=$60000002		; register 3
VDP_VRAM_WRITE_VSCROLL=$40000010	; vscroll write
; VPD memory locations
SCENE_VDP=VDP_VRAM_WRITE			; write location for scene tiles
FONT_VDP=SCENE_VDP+$12000000		; write location for font tiles
SPRITE_VDP=SCENE_VDP+$20000000		; write location for sprite tiles
; screen & plane sizes
DISPLAY_PIXELS_X=$0140				; width of physical display
DISPLAY_PIXELS_Y=$00E0				; height of physical display
SPRITE_PLANE_PIXELS_X=$0200			; width of sprite virtual plane
SPRITE_PLANE_PIXELS_Y=$0200			; height of sprite virtual plane
SPRITE_PLANE_OFFSET_TOP=$0080		; sprite plane top to display top edge
SPRITE_PLANE_OFFSET_LEFT=$0080		; sprite plane left to display left edge
SPRITE_PLANE_OFFSET_BOTTOM=$00A0	; sprite plane bottom to display bottom edge
SPRITE_PLANE_OFFSET_RIGHT=$0040		; sprite plane right to display right edge
VDP_PLANE_PIXELS_X=$0200			; width of VDP plane
VDP_PLANE_PIXELS_Y=$0100			; height of VDP plane
; scrolling boundaries are the values used to determine when to scroll the map
; they are the number of pixels between the sprite and screen edge
; when the player is < XX_BOUNDARY pixels from the edge the map needs to scroll 
PLAYER_SCROLL_BOUNDARY=$0000		; setting to 0 disables scrolling 
;PLAYER_SCROLL_BOUNDARY=$0040		; base value when scrolling is enabled
PLAYER_SCROLL_BOUNDARY_TOP=PLAYER_SCROLL_BOUNDARY
PLAYER_SCROLL_BOUNDARY_BOTTOM=PLAYER_SCROLL_BOUNDARY+SPRITE_PLAYER_HEIGHT
PLAYER_SCROLL_BOUNDARY_LEFT=PLAYER_SCROLL_BOUNDARY
PLAYER_SCROLL_BOUNDARY_RIGHT=PLAYER_SCROLL_BOUNDARY+SPRITE_PLAYER_WIDTH
; which direction the map is scrolling (MEM_FLAG_MAP_POSITION_CHANGED)
MAP_CHANGED_H=$0001	; horizontal
MAP_CHANGED_V=$0002	; vertical
; initial map values
INIT_MAP_POSITION_X=$0000	; initial x-position
INIT_MAP_POSITION_Y=$0000	; initial y-position
DEFAULT_COLLISION_DATA_SIZE=$7F	; 128 longs of collision data by default 
; game states
STATE_FLAG_PAUSED=$00	; game is paused
STATE_FLAG_EXPLORING=$01	; player is controlling the sprite on the map
STATE_FLAG_DIALOG=$02	; player is interacting with a dialog
; high word of MEM_DIALOG_FLAGS is used to track the state
DIALOG_FLAG_TEXT_BUILT=$10	; set when text to display is built
DIALOG_FLAG_TEXT_OPENING=$11	; dialog is opening
DIALOG_FLAG_TEXT_DRAWING=$12	; dialog text is drawing
DIALOG_FLAG_TEXT_OPEN=$13	; dialog is open
DIALOG_FLAG_TEXT_CLOSING=$14	; dialog is closing
; object list constants
OBJ_LIST_LENGTH=$000A	; max of 10 items in the object list
NPC_LIST_LENGTH=$000A	; max of 10 items in the NPC list
OBJ_LIST_LOOP_CTRL=OBJ_LIST_LENGTH+NPC_LIST_LENGTH-1
OBJ_LIST_STRUCT_SIZE=$0006	; size of the data structure for object list entries
; dialog constants
DIALOG_PATTERN_SIZE=$00C4	; size of the dialog pattern
DIALOG_BASE_TILE=$8090	; base file for dialogs
DIALOG_ROWCOL=$09900000	; row 19 column 16=(128*19)+16=2448=990
DIALOG_FRAME_COUNT=$000B	; number of animation frames for dialogs
DIALOG_UPDATE_FREQUENCY=$0002	; how often to update dialog animation
LF=$0A	; '\n' - used to break text into multiple lines
FF=$0C	; form feed - used to break text into sections
ETX=$03	; end of text
; other constants
ROW_HEIGHT=$800000	; height of a tile row

;*******************************************************************************
; vectors
;*******************************************************************************
	include 'init_Vectors.X68'

;*******************************************************************************
; vectors
;*******************************************************************************
	include 'init_Header.X68'

;*******************************************************************************
; entry point & initialization
;*******************************************************************************
	include 'init_MDInit.X68'

;*******************************************************************************
; main game program
;*******************************************************************************

Main:

InitCounters:
	move.w	#$0000,(MEM_VBLANK_COUNTER)
	move.w	#$0000,(MEM_MAINLOOP_COUNTER)
	move.w	#$0000,(MEM_FRAME_COUNTER)

InitGameState:
	move.l	#$00000000,d0
	bset.l	#STATE_FLAG_EXPLORING,d0
	move.l	d0,(MEM_GAME_STATE)

;-------------------------------------------------------------------------------
; load the initial scene
;-------------------------------------------------------------------------------
	lea	SceneVB,a6	; address of the initial scene
	bsr.w	LoadScene	; branch to LoadScene subroutine

	move.w	#$2700,sr		; disable interrupts

;-------------------------------------------------------------------------------
; load the font
;-------------------------------------------------------------------------------
LoadFontTiles:
	move.l	#FontTilesStart,d1	; start address of tileset
	move.l	#FontTilesEnd,d0	; end address of tileset
	sub.l	d1,d0	; subtract the start address to get length
	divu.w	#$0004,d0	; divide by 4 to setup call to LoadTiles
	movea.l	d1,a0	; set address of first tile to load
	move.l	#FONT_VDP,d1	; set initial write location
	bsr.w	LoadTiles	; branch to LoadTiles subroutine

;-------------------------------------------------------------------------------
; load and setup the sprites
;-------------------------------------------------------------------------------

LoadSpriteTiles:
	move.l	#SpriteTilesStart,d1	; start address of tileset
	move.l	#SpriteTilesEnd,d0	; end address of tileset
	sub.l	d1,d0	; subtract the start address to get length
	divu.w	#$0004,d0	; divide by 4 to setup call to LoadTiles
	movea.l	d1,a0	; set address of first tile to load
	move.l	#SPRITE_VDP,d1	; set initial write location
	bsr.w	LoadTiles	; branch to LoadTiles subroutine

LoadSprites:
	lea     SpriteZeroDefinition,a0	; store address of sprite definition
	move.w  #$05,d0	; 1 sprite = 2 longs, 3 sprites = (6-1)
	move.l	#VDP_VRAM_WRITE_SPRITE,(VDP_CONTROL) ; set write location
LoadSpriteLoop:
	move.l  (a0)+,(VDP_DATA)
	dbra    d0,LoadSpriteLoop

InitSprites:
	; player	
	move.w	#$0001,(MEM_PLAYER_SPRITE_ID)	; player sprite is the 1st entry
	move.w	#SPRITE_PLAYER_INIT_X,(MEM_PLAYER_SPRITE_X)	; starting x location
	move.w	#SPRITE_PLAYER_INIT_Y,(MEM_PLAYER_SPRITE_Y)	; starting y location
	move.w	#SPRITE_PLAYER_PATTERN,(MEM_PLAYER_SPRITE_PATTERN_INDEX) ; pattern
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; direction
	move.w	#$0000,(MEM_PLAYER_SPRITE_FRAME)	; frame
	move.w	#$0000,(MEM_PLAYER_SPRITE_STEP_COUNTER)	; step counter
	lea	(MEM_PLAYER_SPRITE_ID),a6	; setup call to FlipSpriteMapPosition
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	; NPC1	
	move.w	#$0002,(MEM_NPC1_SPRITE_ID)	; NPC sprite is the 2nd entry
	move.w	#SPRITE_NPC1_INIT_X,(MEM_NPC1_SPRITE_X)	; starting x location
	move.w	#SPRITE_NPC1_INIT_Y,(MEM_NPC1_SPRITE_Y)	; starting y location
	move.w	#SPRITE_NPC1_PATTERN,(MEM_NPC1_SPRITE_PATTERN_INDEX) ; pattern
	move.w	#DIRECTION_LEFT,(MEM_NPC1_SPRITE_DIRECTION)	; direction
	move.w	#$0000,(MEM_NPC1_SPRITE_FRAME)		; frame
	move.w	#$0000,(MEM_NPC1_SPRITE_STEP_COUNTER)	; step counter
	move.w	#$0000,(MEM_NPC1_MOVEMENT_COUNTER)	; movement counter
	move.w	#$0000,(MEM_NPC1_MOVEMENT_INDEX)	; movement index
	lea	(MEM_NPC1_SPRITE_ID),a6	; setup call to FlipSpriteMapPosition
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position

LoadNPCData:
	bsr.w	BuildNPCObjectList

	move.w	#$2000,sr		; re-enable interrupts

MainGameLoop:
	bsr.w	WaitVBlank							; wait for vblank to complete
	addq	#$1,(MEM_MAINLOOP_COUNTER)			; increment counter
;-------------------------------------------------------------------------------
; pause/unpause
;-------------------------------------------------------------------------------
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.w	#BUTTON_START_PRESSED,d6	; test if the start button was pressed
	beq.s	TestPause	; start button is not pressed test if still paused
	move.w	#$2700,sr	; disable interrupts while changing the pause state
	; clear MEM_CONTROL_PRESSED to prevent pause state from flipping in loop
	move.w	#$0000,(MEM_CONTROL_PRESSED)
	btst.l	#STATE_FLAG_PAUSED,d7	; is the paused bit set?
	bne.s	Unpause	; if so branch to unpause 
Pause:
	bset.l	#STATE_FLAG_PAUSED,d7	; set the paused bit
	; flip to paused palette
	bsr	Echo_StopBGM	; pause the background music
	lea	PaletteStoreAPaused,a0	; address of the starting palette to a0
	move.w	#$0004,d0		; number of palettes to load
	move.l	#VDP_CRAM_WRITE,d1	; initial write address
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine
	bra.s	UpdatePause	; save the paused state
Unpause:
	bclr.l	#STATE_FLAG_PAUSED,d7	; clear the paused bit
	bsr	Echo_ResumeBGM	; unpause the background music
	; revert to normal palette
	lea	PaletteStoreA,a0	; address of the starting palette to a0
	move.w	#$0004,d0		; number of palettes to load
	move.l	#VDP_CRAM_WRITE,d1	; initial write address
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine
UpdatePause:
	move.l	d7,(MEM_GAME_STATE)	; save the new paused state
	move.w	#$2000,sr		; re-enable interrupts
TestPause:
	btst.l	#STATE_FLAG_PAUSED,d7	; test if paused
	beq.s	TestDialog	; not paused, branch to update sprites
	bra.w	MainGameLoop	; paused, return to start of game loop
;-------------------------------------------------------------------------------
; determine if the player is opening or interacting with a dialog
;-------------------------------------------------------------------------------
TestDialog:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_DIALOG,d7 ; test game state
	beq.w	TestExploring	; dialog not displaying, move to next test
TestDialogUpdateFrequency:
	cmpi.w	#DIALOG_UPDATE_FREQUENCY,(MEM_FRAME_COUNTER); is it time to update?
	blt.s	TestDialogOpen	; branch if it's not time to move
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset counter to 0	
	bsr.w	ProcessDialog	; dialog is set, jump to process dialog sub-routine
	bra.w	MainGameLoop	; return to start of game loop
TestDialogOpen:
	; if the dialog is open then update frequency is ignored
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current game state to d7
	btst.l	#DIALOG_FLAG_TEXT_OPEN,d7 ; test if the dialog is open
	beq.w	MainGameLoop	; dialog is not open, move to next test
	; else branch to process dialog
	bsr.w	ProcessDialog	; dialog is set, jump to process dialog sub-routine
	bra.w	MainGameLoop	; return to start of game loop
;-------------------------------------------------------------------------------
; determine if sprites need to be moved and move them
;-------------------------------------------------------------------------------
TestExploring:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_EXPLORING,d7	; test game state
	beq.w	MainGameLoopEnd	; not exploring, branch to next test
TestDialogOpened: ; test if the player is attempting to open a dialog
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.w	#BUTTON_A_PRESSED,d6	; test if the A button was pressed
	beq.s	MainGameLoopUpdateSprites	; A button is not pressed
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7
	; clear MEM_CONTROL_PRESSED to prevent dialog state from flipping in loop
	move.w	#$0000,(MEM_CONTROL_PRESSED)
	bra.w	MainGameLoop	; return to start of game loop
MainGameLoopUpdateSprites:
	; test if it's time to move sprites
	cmpi.w	#SPRITE_MOVE_FREQUENCY,(MEM_FRAME_COUNTER); is it time to move?
	blt.w	MainGameLoopEnd	; exit if it's not time to move
	; move the player sprite
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset counter to 0
	bsr.w	MovePlayer	; move the player sprite
	; move NPCs
	cmpi.w	#$0000,(MEM_NPC1_MOVEMENT_COUNTER)	; is the NPC moving?
	bne	.2	; if MEM_NPC1_MOVEMENT_COUNTER > 0 then the sprite is moving
	; test if it's time for them to move again
	bsr.w	PseudoRandomWord	; store a random number in d0
	and.w	#SPRITE_NPC1_MOVE_TEST,d0	; and d0 against SPRITE_NPC1_MOVE_TEST
	cmpi.w	#SPRITE_NPC1_MOVE_TEST,d0	; test if multiple 
	bne.s	MainGameLoopSetScroll ; not time to move, jump to next section
	move.w	#SPRITE_NPC1_MOVE_STEPS,(MEM_NPC1_MOVEMENT_COUNTER)	; reset counter
	; set the direction
	addq	#$2,MEM_NPC1_MOVEMENT_INDEX	; increment index of sprite movement
	cmpi.w	#$20,MEM_NPC1_MOVEMENT_INDEX	; are we at the end of the array?
	blt.s	.1	; not at the end of the array
	move.w	#$0000,MEM_NPC1_MOVEMENT_INDEX	; reset to zero
.1
	lea	RandomNPCMovementStart,a6
	adda	(MEM_NPC1_MOVEMENT_INDEX),a6
	move.w	(a6),(MEM_NPC1_SPRITE_DIRECTION)
.2	; decrement NPC movement counter and test if they should stop moving
	subq	#$0001,(MEM_NPC1_MOVEMENT_COUNTER)	; decrement counter
	bne	.3	; if MEM_NPC1_MOVEMENT_COUNTER=0 now then we need to stop the sprite
	lea (MEM_NPC1_SPRITE_ID),a6	; setup call to StopSprite
	bsr.w	StopSprite ; stop the sprite
	bra.s	MainGameLoopSetScroll ; done updating sprites
.3	; move the NPC sprite
	lea (MEM_NPC1_SPRITE_ID),a6	; setup call to MoveSprite
	bsr.w	MoveSprite	; branch to move MoveSprite
MainGameLoopSetScroll:
; no scrolling in this iteration of the demo
;	cmpi.w	#$0000,(MEM_FLAG_MAP_POSITION_CHANGED)	; test for scrolling
;	beq.w	MainGameLoopEnd							; not scrolling, exit
;	bsr.w	SetMapScroll							; else scroll the map

MainGameLoopEnd:
	; TODO - only call this when needed (exploring mode & sprites have moved)
	bsr.w	OrderSprites	; reorder the sprites
	bra.w	MainGameLoop	; return to start of game loop

;-------------------------------------------------------------------------------
; WaitVBlank
;-------------------------------------------------------------------------------
WaitVBlank:
	cmpi.w	#$FFFF,(MEM_VBLANKFLAG)	; check if the vblank flag is set
	beq.s	WaitVBlank				; wait for vblank to complete
	rts

;*******************************************************************************
; traps
;*******************************************************************************

ExtInt:
	rte

HBlank:
	rte

VBlank:
	move.w	#$FFFF,(MEM_VBLANKFLAG)		; flag that vblank is in-progress
	addq	#$1,(MEM_VBLANK_COUNTER)	; increment debug counter 
	addq	#$1,(MEM_FRAME_COUNTER)		; increment frame counter
VBlankReadJoypads:
	bsr.w	ReadJoypads					; read controllers
VBlankOrderSprites:
;	bsr.w	OrderSprites	; reorder the sprites
VBlankExit:
	move.w	#$0000,(MEM_VBLANKFLAG)		; flag that vblank is complete
	rte

TrapException:
	rte

;*******************************************************************************
; work in-progress subroutines
;*******************************************************************************

; TODO - this will need to loop through all sprites on screen
OrderSprites:
	move.l	#VDP_VRAM_WRITE_SPRITE,d5
	move.w	(MEM_NPC1_SPRITE_Y),d6	; copy NPC Y to d1
	cmp.w	(MEM_PLAYER_SPRITE_Y),d6	; test which is higher
	bge.s	.1	; branch if NPC Y > player Y
	; NPC Y < player Y -> sprite order is 0,1,2
	; sprite zero link field
	add.l	#$00020000,d5	; move to index 2
	move.w	#$0700,d6	; width=16,height=32 - TODO - derive or constant
	add.w	(MEM_PLAYER_SPRITE_ID),d6	; link to npc sprite id
	move.l	d5,(VDP_CONTROL)	; set write location in VDP (sprite[0] link)
	move.w	d6,(VDP_DATA)	; store new sprite link field
	; player link field
	add.l	#$00080000,d5	; move to index 2 of next sprite
	move.w	#$0700,d6	; width=16,height=32 - TODO - derive or constant
	add.w	(MEM_NPC1_SPRITE_ID),d6	; link to npc sprite id
	move.l	d5,(VDP_CONTROL)	; set write location in VDP (sprite[0] link)
	move.w	d6,(VDP_DATA)	; store new sprite link field
	; NPC1 link field
	add.l	#$00080000,d5	; move to index 2 of next sprite
	move.w	#$0700,d6	; width=16,height=32 - TODO - derive or constant
	move.l	d5,(VDP_CONTROL)	; set write location in VDP (sprite[0] link)
	move.w	d6,(VDP_DATA)	; store new sprite link field
	rts
.1	; NPC Y > player Y -> sprite order is 0,2,1
	; sprite zero link field
	add.l	#$00020000,d5	; move to index 2
	move.w	#$0700,d6	; width=16,height=32 - TODO - derive or constant
	add.w	(MEM_NPC1_SPRITE_ID),d6	; link to npc sprite id
	move.l	d5,(VDP_CONTROL)	; set write location in VDP (sprite[0] link)
	move.w	d6,(VDP_DATA)	; store new sprite link field
	; player link field
	add.l	#$00080000,d5	; move to index 2 of next sprite
	move.w	#$0700,d6	; width=16,height=32 - TODO - derive or constant
	add.w	(MEM_NPC1_SPRITE_ID),d6	; link to npc sprite id
	move.l	d5,(VDP_CONTROL)	; set write location in VDP (sprite[0] link)
	move.w	d6,(VDP_DATA)	; store new sprite link field
	; NPC1 link field
	add.l	#$00080000,d5	; move to index 2 of next sprite
	move.w	#$0700,d6	; width=16,height=32 - TODO - derive or constant
	add.w	(MEM_PLAYER_SPRITE_ID),d6	; link to npc sprite id
	move.l	d5,(VDP_CONTROL)	; set write location in VDP (sprite[0] link)
	move.w	d6,(VDP_DATA)	; store new sprite link field
	rts

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
	movea.l	#PatternDialogStart,a0	; point a0 to start of dialog patterns
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
	beq.s	ProcessDialogTestOpen	; text is not drawing, go to next test
	move.l	(MEM_DIALOG_TEXT),a0	; point a0 to the current character
	move.b	(a0),d6	; copy current character to d6
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.s	ProcessDialogTextEnd	; end of text
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
ProcessDialogTestOpen:
	btst.l	#DIALOG_FLAG_TEXT_OPEN,d7	; test if the dialog is open
	beq.s	ProcessDialogTestClosing	; dialog is not open, move to next test
	; wait until a button is pressed to clear the dialog
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	cmpi.w	#$0000,d6	; are any buttons pressed?
	beq.s	ExitProcessDialog ; no buttons are pressed, exit
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

FindActionTarget:	; note - d6 and d7 are used by caller
	; d4 - store map adjusted player sprite x
	move.w	(MEM_PLAYER_SPRITE_X),d4	; move base sprite x
	add.w	(MEM_MAP_POSITION_X),d4	; adjust for map position
	; d5 - store map adjusted player sprite y
	move.w	(MEM_PLAYER_SPRITE_Y),d5	; move base sprite y
	add.w	(MEM_MAP_POSITION_Y),d5	; adjust for map position
	add.w	#SPRITE_COLLISION_Y,d5	; adjust for collision Y
	; determine what the player is looking at
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d3	; copy direction
	cmpi.w	#DIRECTION_UP,d3	; test if sprite is facing up
	bne.s	.1 	; branch if not
	subq	#SPRITE_COLLISION_UP,d5	; adjust y
	bra.w	.4	; branch to object list search
.1	; down
	cmpi.w	#DIRECTION_DOWN,d3	; test if sprite is facing down
	bne.s	.2 	; branch if not
	add.w	#SPRITE_COLLISION_DOWN,d5	; adjust y
	bra.w	.4	; branch to object list search
.2	; left
	cmpi.w	#DIRECTION_LEFT,d3	; test if sprite is facing left
	bne.s	.3 	; branch if not
	subq	#SPRITE_COLLISION_LEFT,d4	; adjust x
	bra.w	.4	; branch to object list search
.3	; right
	cmpi.w	#DIRECTION_RIGHT,d3	; test if sprite is facing right
	bne.s	.4 	; not reachable unless there's a bug in MovePlayer
	add.w	#SPRITE_COLLISION_RIGHT,d4	; adjust x
.4
	; search object list	
	lea	MEM_OBJECT_LIST_OBJS,a0	; point a0 to the object list
	move.w	#OBJ_LIST_LOOP_CTRL,d3	; use d3 for loop control
	;---------------------------------------------------------------------------
	; hit test = ((htx>=x1)&&(htx<=x0))&&((hty>y0)&&(hty<y1))
	; where
	; htx = sprite x adjusted for map scroll
	; hty = sprite y adjusted for map scorll
	; x0 = right edge of object rect
	; x1 = left edge of object rect
	; y0 = bottom edge of object rect
	; y1 = top edge of object rect
	;---------------------------------------------------------------------------
FindActionTargetObjectLoop:
	;---------------------------------------------------------------------------
	; a0   = word0=Object ID (0-65535)
	; a0+2 = word1[0-8]=x0 (0-511) word1[9-15]=width (0-127)
	; a0+4 = word2[0-8]=y0 (0-512) word2[9-15]=height (0-127)
	;---------------------------------------------------------------------------
	move.w	(a0),(MEM_ACTION_TARGET_OBJID)	; copy the current object id
	cmpi.w	#OBJ_NOTHING,(MEM_ACTION_TARGET_OBJID)	; looking at nothing?
	beq.w	FindActionTargetObjectLoopDbra	; if so loop to next object
	; test if sprite x is between left and right edge
	move.w	(2,a0),d2	; copy word 1 (x and width)
	move.w	d2,d1	; use d1 for width
	and.w	#%0000000111111111,d2	; clear bits[9-15]
	cmp.w	d2,d4	; (htx>=x1)
	blt.w	FindActionTargetObjectLoopDbra ; loop if sprite x < object left
	; need to shift 9 bits right
	lsr.w	#$08,d1	; shift 8
	lsr.w	#$01,d1	; shift 1 more
	add.w	d1,d2	; add width to left edge to get right edge
	cmp.w	d2,d4	; (htx<=x0)
	bgt.w	FindActionTargetObjectLoopDbra ; loop if sprite x > object right
	; test if sprite y is between top and bottom edge
	move.w	(4,a0),d2	; copy word 2 (y and width)
	move.w	d2,d1	; use d1 for height
	and.w	#%0000000111111111,d2	; clear bits[9-15]
	cmp.w	d2,d5	; (hty>y0)
	blt.w	FindActionTargetObjectLoopDbra ; loop if sprite y < object top
	; need to shift 9 bits right
	lsr.w	#$08,d1	; shift 8
	lsr.w	#$01,d1	; shift 1 more
	add.w	d1,d2	; add height to top edge to get bottom edge
	cmp.w	d2,d5	; (hty<y1)
	blt.w	ExitFindActionTarget ; if last test passes then we have a hit
FindActionTargetObjectLoopDbra:
	adda.w	#OBJ_LIST_STRUCT_SIZE,a0	; move to next object list entry
	dbra    d3,FindActionTargetObjectLoop	; decrement and loop
ActionTargetNotFound:
	move.w	#OBJ_NOTHING,(MEM_ACTION_TARGET_OBJID)	; nothing by default
ExitFindActionTarget:
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
	lea	DialogTextNothing,a0
ExitBuildDialogText:
	move.l	a0,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

BuildNPCObjectList:	; note - d6 and d7 are used by caller
	lea	MEM_OBJECT_LIST_NPCS,a0	; store address of object data
	;---------------------------------------------------------------------------
	; word0=Object ID (0-65535)
	; word1[0-8]=x0 (0-511)
	; word1[9-15]=width (0-127)
	; word2[0-8]=y0 (0-512)
	; word2[9-15]=height (0-127)
	;---------------------------------------------------------------------------
	move.w	#OBJ_NPC_DANI,(a0)+
	move.w	(MEM_NPC1_SPRITE_X),d5	; store x position in d5
	subq	#$0008,d5	; buffer area around sprite
	add.w	(MEM_MAP_POSITION_X),d5	; adjust for map position
	or.w	#%0100000000000000,d5	; append sprite width+buffer to bits [9-15]
	move.w	d5,(a0)+	; store word 1
	move.w	(MEM_NPC1_SPRITE_Y),d5	; store y position in d5
	add.w	(MEM_MAP_POSITION_Y),d5	; adjust for map position
	subq	#$0008,d5	; buffer area around sprite
	or.w	#%0110000000000000,d5	; append sprite height+buffer to bits [9-15]
	move.w	d5,(a0)+	; store word 2
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
	rts

;*******************************************************************************
; mostly stable subroutines
;*******************************************************************************
	include	'sub_PseudoRandomWord.X68'

	include	'sub_LoadPalettes.X68'

	include	'sub_ReadJoypads.X68'

	include	'sub_LoadTiles.X68'

	include	'sub_DrawTileset.X68'

	include	'sub_SetSpritePattern.X68'

	include	'sub_TestSpriteCollision.X68'

	include	'sub_MoveSprite.X68'

	include	'sub_SetActiveSpriteMapRowCol.X68'

	include	'sub_FlipSpriteMapPosition.X68'

	include	'sub_StopSprite.X68'

	include	'sub_MovePlayer.X68'

	include	'sub_SetMapScroll.X68'

	include 'sub_LoadScene.X68'

;*******************************************************************************
; scenes
;*******************************************************************************
	include 'scenes/scene_vb.X68'

;*******************************************************************************
; palettes
;*******************************************************************************
PaletteStoreA:
	include 'palettes/pal_Store_A.X68'

PaletteStoreB:
	include 'palettes/pal_Store_B.X68'

PaletteStoreC:
	include 'palettes/pal_Store_C.X68'

PalettePeople:
	include 'palettes/pal_People.X68'

PaletteStoreAPaused:
	include 'palettes/pal_Store_A_Paused.X68'

PaletteStoreBPaused:
	include 'palettes/pal_Store_B_Paused.X68'

PaletteStoreCPaused:
	include 'palettes/pal_Store_C_Paused.X68'

PalettePeoplePaused:
	include 'palettes/pal_People_Paused.X68'

;*******************************************************************************
; tiles
;*******************************************************************************

FontTilesStart:
	include 'font-tiles/dwf.X68'
	include 'font-tiles/dialog-frame.X68'
FontTilesEnd:

StoreVBTilesStart:

TransparentTileStart:
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
TransparentTileEnd:

	include 'scene-tiles/tileset_Floor.X68'
	; swap for this tileset for the debug grid pattern	
	;include 'scene-tiles/tileset_FloorDebug.X68'

	include 'scene-tiles/tileset_Merchandise.X68'

	include 'scene-tiles/tileset_StoreFrame.X68'

	include 'scene-tiles/tileset_StoreFront.X68'

	include 'scene-tiles/tileset_CounterLow.X68'

	include 'scene-tiles/tileset_CounterHigh.X68'

	include 'scene-tiles/tileset_Register.X68'

	include 'scene-tiles/tileset_HWRack.X68'

	include 'scene-tiles/tileset_16BitRack.X68'

StoreVBTilesEnd:

SpriteTilesStart:

PlayerSpriteTilesStart:
	include 'sprite-tiles/tileset_PlayerSprite.X68'
	; swap for this tileset for the debug pattern
	;include 'sprite-tiles/tileset_SpriteDebug.X68'
PlayerSpriteTilesEnd:

NPCSprite1TilesStart:
	include 'sprite-tiles/tileset_NPCSprite1.X68'
	; swap for this tileset for the debug pattern
	;include 'sprite-tiles/tileset_SpriteDebug.X68'
NPCSprite1TilesEnd:

SpriteTilesEnd:


;*******************************************************************************
; patterns
;*******************************************************************************

PatternFloorStart:
	include 'patterns/pattern_Floor.X68'
PatternFloorEnd:

PatternShelvesHStart:
	include 'patterns/pattern_ShelvesH.X68'
PatternShelvesHEnd:

PatternShelvesMStart:
	include 'patterns/pattern_ShelvesM.X68'
PatternShelvesMEnd:

PatternShelvesLStart:
	include 'patterns/pattern_ShelvesL.X68'
PatternShelvesLEnd:

PatternFrameTopStart:
	include 'patterns/pattern_FrameTop.X68'
PatternFrameTopEnd:

PatternFrameSideStart:
	include 'patterns/pattern_FrameSide.X68'
PatternFrameSideEnd:

PatternStoreFrontStart:
	include 'patterns/pattern_StoreFront.X68'
PatternStoreFrontEnd:

PatternCounterLowStart:
	include 'patterns/pattern_CounterLow.X68'
PatternCounterLowEnd:

PatternCounterLowSideStart:
	include 'patterns/pattern_CounterLowSide.X68'
PatternCounterLowSideEnd:

PatternCounterHighStart:
	include 'patterns/pattern_CounterHigh.X68'
PatternCounterHighEnd:

PatternRegisterStart:
	include 'patterns/pattern_Register.X68'
PatternRegisterEnd:

PatternDialogStart:
	include 'patterns/pattern_Dialog.X68'
PatternDialogEnd:

	include patterns/pattern_HWRack.X68
	include patterns/pattern_16BitRack.X68

;*******************************************************************************
; maps
;*******************************************************************************

MapStoreCollision:
	include 'collision-maps/map_StoreCollision.X68'

;*******************************************************************************
; sprite table defintions
;*******************************************************************************

	include 'data_SpriteDefinitions.X68'

;*******************************************************************************
; initialization data
;*******************************************************************************

	include 'data_Z80Init.X68'

	include 'data_VDPInit.X68'

;*******************************************************************************
; sprite movement
;*******************************************************************************

RandomNPCMovementStart:
	dc.w	DIRECTION_LEFT,DIRECTION_DOWN,DIRECTION_RIGHT,DIRECTION_UP
    dc.w	DIRECTION_DOWN,DIRECTION_RIGHT,DIRECTION_UP,DIRECTION_LEFT
    dc.w	DIRECTION_UP,DIRECTION_RIGHT,DIRECTION_DOWN,DIRECTION_LEFT
    dc.w	DIRECTION_RIGHT,DIRECTION_DOWN,DIRECTION_LEFT,DIRECTION_UP
RandomNPCMovementEnd:

;*******************************************************************************
; diaglog text
;*******************************************************************************

DialogTextNothing:
	;		"1234567890123456789012
	dc.b	"There's nothing very"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"interesting here."
	dc.b	ETX
	align 2

DialogText8Bit:
	;		"1234567890123456789012
	dc.b	"The shelves are lined"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"with 8-bit games."
	dc.b	ETX
	align 2

DialogTextMags:
	;		"1234567890123456789012
	dc.b	"Below the counter are"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"gaming magazines."
	dc.b	ETX
	align 2

DialogTextCounter:
	;		"1234567890123456789012
	dc.b	"The counter is empty."
	dc.b	ETX
	align 2

DialogTextRegister:
	;		"1234567890123456789012
	dc.b	"The register stares"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"back at you blankly."
	dc.b	ETX
	align 2

DialogTextHardware:
	;		"1234567890123456789012
	dc.b	"This is a wire rack"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"of computer hardware."
	dc.b	ETX
	align 2

DialogText16Bit:
	;		"1234567890123456789012
	dc.b	"Here are the latest"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"16-bit games."
	dc.b	ETX
	align 2

DialogTextDani:
	;		"1234567890123456789012
	dc.b	"Dani: 'Isn't it time"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"to close already?'"
	dc.b	ETX
	align 2


;*******************************************************************************
; echo sound driver (https://github.com/sikthehedgehog/Echo)
;*******************************************************************************

	include 'echo/echo_main.X68'

	include	'echo/echo_list.X68'

;*******************************************************************************
; background music
;*******************************************************************************

BGM_Test:
	incbin	'music/bgm_store00.esf'

;*******************************************************************************
; end of rom
;*******************************************************************************

RomEnd:
    end 0
