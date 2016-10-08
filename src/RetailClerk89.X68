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
DEFAULT_SPRITE_HEIGHT=$0020	; how many pixels tall a sprite is by default
DEFAULT_SPRITE_WIDTH=$0010	; how many pixels wide a sprite is by default
SPRITE_FRAME_COUNT=$0003	; how many animation frames there are for sprites
SPRITE_MOVE_FREQUENCY=$0001 ; how many frames to wait between sprite moves
SPRITE_ANIMATION_STEPS=$000A	; how many steps between animation frame changes
SPRITE_STEP_PIXELS=$0001	; how many pixels to move on each sprite step
SPRITE_PLAYER_PATTERN=$4005	; VDP tile number for the player sprite pattern
SPRITE_PLAYER_HEIGHT=DEFAULT_SPRITE_HEIGHT	; player sprite height
SPRITE_PLAYER_WIDTH=DEFAULT_SPRITE_WIDTH	; player sprite 
SPRITE_PLAYER_INIT_X=$0100	; starting x location of player sprite
SPRITE_PLAYER_INIT_Y=$0100	; starting y location of player sprite
SPRITE_NPC1_PATTERN=$4065	; VDP tile number for the player sprite pattern
SPRITE_NPC1_HEIGHT=DEFAULT_SPRITE_HEIGHT	; player sprite height
SPRITE_NPC1_WIDTH=DEFAULT_SPRITE_WIDTH	; player sprite 
SPRITE_NPC1_INIT_X=$0180	; starting x location of player sprite
SPRITE_NPC1_INIT_Y=$00E0	; starting y location of player sprite
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
; game states
STATE_FLAG_PAUSED=$00	; game is paused
STATE_FLAG_EXPLORING=$01	; player is controlling the sprite on the map
STATE_FLAG_DIALOG=$02	; player is interacting with a dialog
STATE_FLAG_DIALOG_TEXT_BUILT=$03	; set when text to display is built
STATE_FLAG_DIALOG_TEXT_OPENING=$04	; dialog is opening
STATE_FLAG_DIALOG_TEXT_OPEN=$05	; dialog is open
STATE_FLAG_DIALOG_TEXT_CLOSING=$06	; dialog is closing
; object list constants
OBJ_LIST_LENGTH=$000A	; max of 10 items in the object list
NPC_LIST_LENGTH=$000A	; max of 10 items in the NPC list
OBJ_LIST_LOOP_CTRL=OBJ_LIST_LENGTH+NPC_LIST_LENGTH-1
OBJ_LIST_STRUCT_SIZE=$0006	; size of the data structure for object list entries
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
	move.w	#$2700,sr		; disable interrupts

InitCounters:
	move.w	#$0000,(MEM_VBLANK_COUNTER)
	move.w	#$0000,(MEM_MAINLOOP_COUNTER)
	move.w	#$0000,(MEM_FRAME_COUNTER)

InitGameState:
	move.l	#$00000000,d0
	bset.l	#STATE_FLAG_EXPLORING,d0
	move.l	d0,(MEM_GAME_STATE)

;-------------------------------------------------------------------------------
; load palettes
;-------------------------------------------------------------------------------
	; setup call to LoadPalettes
	lea	PaletteStoreA,a0	; address of the starting palette to a0
	move.w	#$0004,d0		; number of palettes to load
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine

;-------------------------------------------------------------------------------
; load tiles
;-------------------------------------------------------------------------------
	; a0 also needs to contain the starting address for the call to LoadTiles
	lea	TransparentTileStart,a0	; load address of first tileset to a0
	lea CounterTilesHighEnd,a1	; load address of last tileset to a1
	move.w 	a1,d0			; copy end address to d0
	sub.w	a0,d0			; subtract the start address to get length
	divu.w	#$0004,d0		; divide by 4 go setup call to LoadTiles
	bsr.w	LoadTiles		; branch to LoadTiles subroutine

;-------------------------------------------------------------------------------
; draw the background
;-------------------------------------------------------------------------------
FillBackground:
;-------------------------------------------------------------------------------
; Pattern notes
; bits 0-10 = pattern number 
; bit 11 = horizontal reverse bit (1=reverse)
; bit 12 = vertical reverse bit (1=reverse)
; bit 13 = palette low bit
; bit 14 = palette high bit
; bit 15 = priority (0=low, 1=high)
;-------------------------------------------------------------------------------
	move.w	#$0001,d0					; store tile pattern in d0
	move.b	#%0011,d3					; eor value used to toggle tiles
	move.l	#VDP_VRAM_WRITE_B,(VDP_CONTROL)	; initial drawing location
	move.w	#$001F,d1					; 32 rows
FillBackgroundRowLoop:
	move.w	#$003F,d2					; 64 columns per row
FillBackgroundColLoop:
	move.w  d0,(VDP_DATA)				; copy the pattern to VPD
	eor.b	d3,d0						; flip between patterns
	dbra    d2,FillBackgroundColLoop	; loop to next tile
	eor.b	#%0010,d0					; flip between tiles 1 and 3
	eor.b	#%0100,d3					; flip the flip pattern
	dbra    d1,FillBackgroundRowLoop	; loop to next tile

DrawLowPlaneScenery:
	; draw shelves with merchandise
	move.w	#$00C5,d0		; store base tile ID in d0 - TODO - constant value
	move.l	#VDP_VRAM_WRITE_B,d4	; initial address offset
	; start drawing the counter at row 1, column 0 = 128
	; 128 = 0080 = 0000 0000 1000 0000
	add.l	#$00800000,d4	; initial address offset - TODO - store with pattern
	move.l	d4,(VDP_CONTROL)	; initial drawing location
	move.w	#$0002,d1	; 3 rows
DrawLowPlaneSceneryRowLoop:
	move.w	#$0014,d2	; 64 columns per row / 3 tiles in pattern
DrawLowPlaneSceneryColLoop:
	move.w  d0,(VDP_DATA)	; copy the pattern to VPD
	addq	#$1,d0			; move to the 2nd tile in the pattern
	move.w  d0,(VDP_DATA)	; copy the pattern to VPD
	addq	#$1,d0			; move to the 3rd tile in the pattern
	move.w  d0,(VDP_DATA)	; copy the pattern to VPD
	subq	#$2,d0			; move back to the first tile in the pattern
	dbra    d2,DrawLowPlaneSceneryColLoop	; loop to next tile
	add.w	#$2000,d0		; increment the palette
	dbra    d1,DrawLowPlaneSceneryRowLoop	; loop to next tile

DrawFrame:
	move.w	#$80C8,d0	; store base tile ID in d0 - TODO - constant value
	move.l	#VDP_VRAM_WRITE_A,d4	; initial address offset
	move.l	d4,(VDP_CONTROL)		; initial drawing location
	move.w  d0,(VDP_DATA)			; copy the first tile to VPD
	; draw the top row
	move.w	#$80C9,d0	; store tile ID in d0 - TODO - constant value
	move.w	#$0025,d2	; 38 columns to draw
DrawFrameTopLoop:
	move.w  d0,(VDP_DATA) ; copy tile to VPD
	dbra    d2,DrawFrameTopLoop	; loop to next tile
	move.w	#$80CA,d0	; store tile ID in d0 - TODO - constant value
	move.w  d0,(VDP_DATA) ; copy last tile to VPD
	; setup for drawing the side	
	move.w	#$80CB,d0	; store tile ID of side in d0 - TODO - constant value
	move.w	#$0016,d2	; 23 rows to draw
	move.l	#VDP_VRAM_WRITE_A,d4	; initial address offset
	add.l	#$00800000,d4		; increment drawing location to move to next row
DrawFrameSideLoop:
	move.l	d4,(VDP_CONTROL)		; update drawing location
	move.w  d0,(VDP_DATA) 			; copy tile to VPD
	add.l	#$004E0000,d4			; column 78 (78x4=312px)
	move.l	d4,(VDP_CONTROL)		; update drawing location
	move.w  d0,(VDP_DATA) 			; copy tile to VPD
	add.l	#$00320000,d4			; increment drawing location
	dbra    d2,DrawFrameSideLoop	; loop to next tile
DrawStoreFront:
	; setup call to DrawTileset
	lea	PatternStoreFrontStart,a1	; store the high starting address in a2
	; tile 0 for the counter pattern should be at index 6Ch
	move.w	#$80CC,d0	; store base tile ID in d0 - TODO - constant value
	move.w	#$0003,d1	; 4 rows in the pattern - TODO - store with pattern
	move.w	#$0027,d2	; 40 columns in the pattern - TODO - store with pattern
	move.l	#VDP_VRAM_WRITE_A,d3	; initial address offset
	; draw the high plane at row 24 (24*128=3072), column 0 (0px) = 3072 = C00
	move.l	#VDP_VRAM_WRITE_A,d3	; initial address offset
	add.l	#$0C000000,d3	; initial address offset - TODO - store with pattern
	bsr.w	DrawTileset		; branch to DrawTileset subroutine

DrawCounter: 
	; setup call to DrawTileset for low tiles
	lea	PatternCounterLowStart,a1	; store the low starting address in a1
	; tile 0 for the counter pattern should be at index 81h, palette 01, low
	; 0010 0000 1000 0001 = 2081
	move.w	#$20E1,d0	; store base tile ID in d0 - TODO - constant value
	move.w	#$0003,d1	; 4 rows in the pattern - TODO - store with pattern
	move.w	#$000D,d2	; 15 columns in the pattern - TODO - store with pattern
	move.l	#VDP_VRAM_WRITE_A,d3	; initial address offset
	; start drawing at row 10, column 28 (112px) = 1280+28 = 51C
	add.l	#$051C0000,d3	; initial address offset - TODO - store with pattern
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	; setup call to DrawTileset for high tiles
	lea	PatternCounterHighStart,a1	; store the high starting address in a1
	; tile 0 for the counter pattern should be at index 91h, palette 01, high
	move.w	#$A0F1,d0	; store base tile ID in d0 - TODO - constant value
	move.w	#$0006,d1	; 7 rows in the pattern - TODO - store with pattern
	move.w	#$000D,d2	; 14 columns in the pattern - TODO - store with pattern
	move.l	#VDP_VRAM_WRITE_A,d3	; initial address offset
	; start drawing at row 3, column 28 (112px) = 394+28 = 19C
	add.l	#$019C0000,d3	; initial address offset - TODO - store with pattern
	bsr.w	DrawTileset		; branch to DrawTileset subroutine

;-------------------------------------------------------------------------------
; setup map and object data
;-------------------------------------------------------------------------------
InitMap:
	move.w	#INIT_MAP_POSITION_X,(MEM_MAP_POSITION_X)	; set map x-position
	move.w	#INIT_MAP_POSITION_Y,(MEM_MAP_POSITION_Y)	; set map y-position
	move.w	#$FFFF,(MEM_FLAG_MAP_POSITION_CHANGED)	; flag to reset the scroll
	bsr.w	SetMapScroll				; set the map position

LoadMapCollisionData:
	lea	MapStoreCollision,a0	; store address of collision data
	lea	MEM_COLLISION_DATA,a1	; store destination memory location
	move.w	#$7F,d0				; 128 longs of collision data
LoadMapCollisionLoop:
	move.l  (a0)+,(a1)+
	dbra    d0,LoadMapCollisionLoop

; TODO - create a data file for the objects or format for location data
; i.e. a file that stores the tile layout, collision data, and objects
LoadObjectData:
	lea	MEM_OBJECT_LIST_OBJS,a0	; store address of object data
	;---------------------------------------------------------------------------
	; word0=Object ID (0-65535)
	; word1[0-8]=x0 (0-511)
	; word1[9-15]=width (0-127)
	; word2[0-8]=y0 (0-512)
	; word2[9-15]=height (0-127)
	;---------------------------------------------------------------------------
	move.w	#OBJ_SCENE_VB_8BIT,(a0)+
	; x0=136 width=106 = 1101010 010001000 = D488
	move.w	#$D488,(a0)+
	; y0=136 height=26 = 0011010 010001000 = 3488
	move.w	#$3488,(a0)+

	move.w	#OBJ_SCENE_VB_HARDWARE,(a0)+
	; x0=242 width=79 = 1001111 011110010  = 9EF2
	move.w	#$9EF2,(a0)+
	; y0=136 height=26 = 0011010 010001000  = 3488
	move.w	#$3488,(a0)+

	move.w	#OBJ_SCENE_VB_16BIT,(a0)+
	; x0=351 width=90 = 1011010 101011111 = B55F
	move.w	#$B55F,(a0)+
	; y0=136 height=26 = 0011010 010001000 = 3488
	move.w	#$3488,(a0)+

	move.w	#OBJ_SCENE_VB_MAGS,(a0)+
	; x0=240 width=114 = 1110010 011110000 = E4F0
	move.w	#$E4F0,(a0)+
	; y0=224 height=32 = 0100000 011100000 = 40E0
	move.w	#$40E0,(a0)+

	move.w	#OBJ_SCENE_VB_COUNTER,(a0)+
	; x0=240 width=80 = 1010000 011110000 = A0F0
	move.w	#$A0F0,(a0)+
	; y0=200 height=16 = 0010000 011001000  = 20C8
	move.w	#$20C8,(a0)+

	move.w	#OBJ_SCENE_VB_REGISTER,(a0)+
	; x0=320 width=16 = 0010000 101000000 = 2140
	move.w	#$2140,(a0)+
	; y0=162 height=32 = 0100000 010100010 = 40A2
	move.w	#$40A2,(a0)+

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

LoadNPCData:
	bsr.w	BuildNPCObjectList

;-------------------------------------------------------------------------------
; load and setup the sprites
;-------------------------------------------------------------------------------
LoadSprite:
	lea     PlayerSpriteDefinition,a0	; store address of sprite definition
	move.w  #$03,d0						; 1 sprite = 2 longs
	move.l	#VDP_VRAM_WRITE_SPRITE,(VDP_CONTROL) ; set write location
LoadSpriteLoop:
	move.l  (a0)+,(VDP_DATA)
	dbra    d0,LoadSpriteLoop

InitSprites:
	; player	
	move.w	#$0000,(MEM_PLAYER_SPRITE_ID)	; player sprite is the 1st entry
	move.w	#SPRITE_PLAYER_INIT_X,(MEM_PLAYER_SPRITE_X)	; starting x location
	move.w	#SPRITE_PLAYER_INIT_Y,(MEM_PLAYER_SPRITE_Y)	; starting y location
	move.w	#SPRITE_PLAYER_PATTERN,(MEM_PLAYER_SPRITE_PATTERN_INDEX) ; pattern
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; direction
	move.w	#$0000,(MEM_PLAYER_SPRITE_FRAME)	; frame
	move.w	#$0000,(MEM_PLAYER_SPRITE_STEP_COUNTER)	; step counter
	lea	(MEM_PLAYER_SPRITE_ID),a6	; setup call to FlipSpriteMapPosition
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	; NPC1	
	move.w	#$0001,(MEM_NPC1_SPRITE_ID)	; NPC sprite is the 2nd entry
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

;-------------------------------------------------------------------------------
; start the background music
;-------------------------------------------------------------------------------
StartBGM:
	lea BGM_Test,a0
	bsr Echo_PlayBGM

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
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine
	bra.s	UpdatePause	; save the paused state
Unpause:
	bclr.l	#STATE_FLAG_PAUSED,d7	; clear the paused bit
	bsr	Echo_ResumeBGM	; unpause the background music
	; revert to normal palette
	lea	PaletteStoreA,a0	; address of the starting palette to a0
	move.w	#$0004,d0		; number of palettes to load
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
	beq.w	TestExploring	; dialog not set displaying
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

VBlankExit:
	move.w	#$0000,(MEM_VBLANKFLAG)		; flag that vblank is complete
	rte

TrapException:
	rte

;*******************************************************************************
; work in-progress subroutines
;*******************************************************************************

ProcessDialog:
	move.w	#$2700,sr	; disable interrupts while managing dialogs
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
ProcessDialogTestTextBuilt:
	btst.l	#STATE_FLAG_DIALOG_TEXT_BUILT,d7	; test game state
	bne.s	ProcessDialogTestOpening	; text is built, move to next test
	bsr.w	BuildNPCObjectList	; update the location of NPCs
	bsr.w	FindActionTarget	; find the target of the player's action
	; TODO - implement text building
	bset.l	#STATE_FLAG_DIALOG_TEXT_BUILT,d7	; flag that text is built
	bset.l	#STATE_FLAG_DIALOG_TEXT_OPENING,d7	; change state to opening
ProcessDialogTestOpening:
	btst.l	#STATE_FLAG_DIALOG_TEXT_OPENING,d7	; test if the dialog is opening
	bne.s	ProcessDialogTestOpen	; dialog is not opening, move to next test
	; TODO - implement dialog opening animation
	bset.l	#STATE_FLAG_DIALOG_TEXT_OPEN,d7	; change state to open when done
ProcessDialogTestOpen:
	btst.l	#STATE_FLAG_DIALOG_TEXT_OPEN,d7	; test if the dialog is opening
	bne.s	ProcessDialogTestClosing	; dialog is not open, move to next test
	; wait until a button is pressed to clear the dialog
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	cmpi.w	#$0000,d6	; are any buttons pressed?
	beq.s	ExitProcessDialog ; no buttons are pressed, exit
ProcessDialogTestClosing:
	btst.l	#STATE_FLAG_DIALOG_TEXT_CLOSING,d7	; test if the dialog is opening
	bne.s	ProcessDialogClearFlags	; dialog is not closing, exit
	; TODO - implement dialog closing animation
	nop
ProcessDialogClearFlags:	; clear flags when done
	bclr.l	#STATE_FLAG_DIALOG,d7
	bclr.l	#STATE_FLAG_DIALOG_TEXT_BUILT,d7
	bclr.l	#STATE_FLAG_DIALOG_TEXT_CLOSING,d7
ExitProcessDialog:
	move.l	d7,(MEM_GAME_STATE)	; save any changes made to the game state
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

FloorTilesStart:
	include 'scene-tiles/tileset_Floor.X68'
	; swap for this tileset for the debug grid pattern	
	;include 'scene-tiles/tileset_FloorDebug.X68'
FloorTilesEnd:

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

MerchandiseTilesStart:
	include 'scene-tiles/tileset_Merchandise.X68'
MerchandiseTilesEnd:

FrameTilesStart:
	include 'scene-tiles/tileset_StoreFrame.X68'
FrameTilesEnd:

StoreFrontTilesStart:
	include 'scene-tiles/tileset_StoreFront.X68'
StoreFrontTilesEnd:

CounterTilesLowStart:
	include 'scene-tiles/tileset_CounterLow.X68'
CounterTilesLowEnd:

CounterTilesHighStart:
	include 'scene-tiles/tileset_CounterHigh.X68'
CounterTilesHighEnd:

;*******************************************************************************
; patterns
;*******************************************************************************

PatternStoreFrontStart:
	include 'patterns/pattern_StoreFront.X68'
PatternStoreFrontEnd:

PatternCounterLowStart:
	include 'patterns/pattern_CounterLow.X68'
PatternCounterLowEnd:

PatternCounterHighStart:
	include 'patterns/pattern_CounterHigh.X68'
PatternCounterHighEnd:

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
