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
STATE_FLAG_PAUSED=$F	; game is paused
STATE_FLAG_EXPLORING=$0	; player is controlling the sprite on the map
STATE_FLAG_DIALOG=$1	; player is interacting with a dialog
; other constants
ROW_HEIGHT=$800000			; height of a tile row

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

LoadSprite:
	lea     PlayerSpriteDefinition,a0	; store address of sprite definition
	move.w  #$03,d0						; 1 sprite = 2 longs
	move.l	#VDP_VRAM_WRITE_SPRITE,(VDP_CONTROL) ; set write location
LoadSpriteLoop:
	move.l  (a0)+,(VDP_DATA)
	dbra    d0,LoadSpriteLoop

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
	beq.s	TestExploring	; not paused, branch to update sprites
	bra.w	MainGameLoop	; paused, return to start of game loop
;-------------------------------------------------------------------------------
; determine if sprites need to be moved and move them
;-------------------------------------------------------------------------------
TestExploring:
	btst.l	#STATE_FLAG_EXPLORING,d7	; test game state
	beq.w	MainGameLoopEnd	; not exploring, branch to next test
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
