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
	include 'const_SceneIDs.X68'
	include	'const_StructFields.X68'

; data addresses
ROM_ADDR_INSTRUMENTS=$80000
; sprite settings
SPRITE_BASE_PATTERN=$6100	; base pattern of sprites
SPRITE_TILESET_SIZE=$60	; the size of the tileset used for sprites
SPRITE_TILESET_LWORDS=SPRITE_TILESET_SIZE*LWORDS_PER_TILE	; lwords in tileset
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
SPRITE_DEF_WORD2_BASE=$0700	; width=16,height=32 - low byte has link field
NPC_RECORD_SIZE=MEM_NPC1_SPRITE_ID-MEM_NPC0_SPRITE_ID
NPC_SPRITE_MOVE_STEPS=$0009; how many steps NPC sprites take when they move
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
OBJ_LIST_LENGTH=$000A	; max items in the object list
NPC_LIST_LENGTH=$0004	; max items in the NPC list
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
CHARACTER_DEFINITION_SIZE=CharacterDefinitionPlayerEnd-CharacterDefinitionPlayer

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
; load the initial NPC locations
;-------------------------------------------------------------------------------
InitNPCLocations:
	lea MEM_NPC_LOCATIONS,a0
	move.w	#$0102,(a0)+	; location 00 - NPCs 0,1
	move.w	#$0000,(a0)+	; location 00 - NPCs 2,3


LoadPlayerSpriteTiles:
	move.w	#SPRITE_TILESET_LWORDS,d0	; number of tiles in a sprite tileset
	movea.l	#PlayerSpriteTilesStart,a0	; set address of first tile to load
	move.l	#SPRITE_VDP,d1	; set initial write location
	bsr.w	LoadTiles	; branch to LoadTiles subroutine

LoadSprites:
	lea     SpriteZeroDefinition,a0	; store address of sprite definition
	move.w  #$03,d0	; 1 sprite = 2 longs, 2 sprites = (4-1)
	move.l	#VDP_VRAM_WRITE_SPRITE,(VDP_CONTROL) ; set write location
LoadSpriteLoop:
	move.l  (a0)+,(VDP_DATA)
	dbra    d0,LoadSpriteLoop

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
; load the initial scene
;-------------------------------------------------------------------------------
	lea	SceneVB,a6	; address of the initial scene
	bsr.w	LoadScene	; branch to LoadScene subroutine

;-------------------------------------------------------------------------------
; load and setup the sprites
;-------------------------------------------------------------------------------
	move.w	#$2700,sr	; disable interrupts


InitPlayerSprite:
	; player	
	move.w	#$0001,(MEM_PLAYER_SPRITE_ID)	; player sprite is the 2nd entry
	move.w	#SPRITE_PLAYER_INIT_X,(MEM_PLAYER_SPRITE_X)	; starting x location
	move.w	#SPRITE_PLAYER_INIT_Y,(MEM_PLAYER_SPRITE_Y)	; starting y location
	move.w	#SPRITE_PLAYER_PATTERN,(MEM_PLAYER_SPRITE_PATTERN_INDEX) ; pattern
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; direction
	move.w	#$0000,(MEM_PLAYER_SPRITE_FRAME)	; frame
	; setting SPRITE_STEP_COUNTER to SPRITE_ANIMATION_STEPS forces movement
	; animation to trigger the next time the sprite moves
	move.w	#SPRITE_ANIMATION_STEPS,(MEM_PLAYER_SPRITE_STEP_COUNTER)
	lea	(MEM_PLAYER_SPRITE_ID),a6	; setup call to FlipSpriteMapPosition
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position

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
	move.w	(MEM_ACTIVE_NPC_COUNT),(MEM_NPC_LOOP_COUNTER)	; setup loop control
	lea	MEM_NPC0_SPRITE_ID,a5	; point to first NPC
MainGameLoopUpdateNPCSpritesLoop:
	cmpi.w	#$0000,(STRUCT_SPRITE_MOVEMENT_COUNTER,a5)	; is the NPC moving?
	bne	.2	; if MOVEMENT_COUNTER > 0 then the sprite is moving
	; test if it's time for them to move again
	bsr.w	PseudoRandomWord	; store a random number in d0
	and.w	(STRUCT_SPRITE_MOVE_FREQUENCY,a5),d0	; and against it
	cmp.w	(STRUCT_SPRITE_MOVE_FREQUENCY,a5),d0	; test 
	bne.s	MainGameLoopUpdateNPCSpritesLoopEnd ; not time to move
	move.w	#NPC_SPRITE_MOVE_STEPS,(STRUCT_SPRITE_MOVEMENT_COUNTER,a5)	; reset
	; set the direction
	addq	#$2,(STRUCT_SPRITE_MOVE_INDEX,a5)	; increment index of movement
	move.w	(STRUCT_SPRITE_MOVE_PATTERN_LENGTH,a5),d6
	cmp.w	(STRUCT_SPRITE_MOVE_INDEX,a5),d6	; end of the array?
	bge.s	.1	; not at the end of the array
	move.w	#$0000,(STRUCT_SPRITE_MOVE_INDEX,a5)	; reset to zero
.1
	move.l	(STRUCT_SPRITE_MOVE_PATTERN,a5),a6
	adda	(STRUCT_SPRITE_MOVE_INDEX,a5),a6
	move.w	(a6),(STRUCT_SPRITE_DIRECTION,a5)
.2	; decrement NPC movement counter and test if they should stop moving
	subq	#$0001,(STRUCT_SPRITE_MOVEMENT_COUNTER,a5)	; decrement counter
	bne	.3	; if MOVEMENT_COUNTER=0 now then we need to stop the sprite
	move.l a5,a6	; setup call to StopSprite
	bsr.w	StopSprite ; stop the sprite
	bra.s	MainGameLoopUpdateNPCSpritesLoopEnd ; done updating this sprite
.3	; move the NPC sprite
	move.l a5,a6	; setup call to StopSprite
	bsr.w	MoveSprite	; branch to move MoveSprite
	; did the sprite move successfully?
	tst.w	(MEM_COLLISION_RESULT)	; test result of last collision
	beq.s	MainGameLoopUpdateNPCSpritesLoopEnd ; done updating this sprite	
	addq	#$0001,(STRUCT_SPRITE_MOVEMENT_COUNTER,a5)	; rollback counter
MainGameLoopUpdateNPCSpritesLoopEnd:
	; move to next NPC sprite
	adda.l	#NPC_RECORD_SIZE,a5	; increment a5	
	; apparently dbra doesn't work against a memory address
	subq	#$1,(MEM_NPC_LOOP_COUNTER)	; decrement loop counter
	bgt.w	MainGameLoopUpdateNPCSpritesLoop	; branch

MainGameLoopSetScroll:
; no scrolling in this iteration of the demo
;	cmpi.w	#$0000,(MEM_FLAG_MAP_POSITION_CHANGED)	; test for scrolling
;	beq.w	MainGameLoopEnd							; not scrolling, exit
;	bsr.w	SetMapScroll							; else scroll the map

MainGameLoopEnd:
	; test if sprites need to be reordered
	tst.w	(MEM_SPRITE_Y_ORDER_CHANGED)	; has the sprite Y order changed?
	beq.w	MainGameLoop	; hasn't changed, no need to order sprites
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_EXPLORING,d7	; test game state
	beq.w	MainGameLoop	; not exploring, no need to order sprites
	; else order sprites and loop
	bsr.w	OrderSprites	; reorder the sprites
	bra.w	MainGameLoop	; return to start of game loop

;-------------------------------------------------------------------------------
; WaitVBlank
;-------------------------------------------------------------------------------
WaitVBlank:
	move.w	VDP_CONTROL,d0	; copy VDP status to d0
   	andi.w	#VDP_STATUS_VBLANK,d0	; check if the vblank status flag is set
	bne.s	WaitVBlank				; wait for vblank to complete
	rts

;*******************************************************************************
; traps
;*******************************************************************************

ExtInt:
	rte

HBlank:
	rte

VBlank:
	addq	#$1,(MEM_VBLANK_COUNTER)	; increment debug counter 
	addq	#$1,(MEM_FRAME_COUNTER)		; increment frame counter
VBlankReadJoypads:
	bsr.w	ReadJoypads					; read controllers

VBlankExit:
	rte

TrapException:
	rte

;*******************************************************************************
; work in-progress subroutines
;*******************************************************************************


;*******************************************************************************
; mostly stable subroutines
;*******************************************************************************
	include 'inc_Subroutines.X68'

;*******************************************************************************
; scenes
;*******************************************************************************
	include 'scenes/scene_vb.X68'

;*******************************************************************************
; palettes
;*******************************************************************************
	include 'inc_Palettes.X68'

;*******************************************************************************
; tiles
;*******************************************************************************

	include 'inc_Tiles.X68'

;*******************************************************************************
; patterns
;*******************************************************************************

	include 'inc_Patterns.X68'

;*******************************************************************************
; maps
;*******************************************************************************

MapStoreCollision:
	include 'collision-maps/map_StoreVBCollision.X68'

;*******************************************************************************
; sprite table defintions
;*******************************************************************************

	include 'data_SpriteDefinitions.X68'

;*******************************************************************************
; character defintions
;*******************************************************************************

CharacterDefinitionStart:

; 00
CharacterDefinitionPlayer:
	dc.l	PlayerSpriteTilesStart
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000100000000	; priority=0,palette=2,vflip=0,hflip=0,pattern=5
CharacterDefinitionPlayerEnd:

; 01
CharacterDefinitionDani:
	dc.l	NPCSpriteDaniTilesStart
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000101100000 ;priority=0,palette=2,vflip=0,hflip=0,pattern=160

; 02
CharacterDefinitionMaleShopper0:
	dc.l	NPCSpriteMaleShopper0Start
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000111000000 ;priority=0,palette=2,vflip=0,hflip=0,pattern=1C0
	
;*******************************************************************************
; initialization data
;*******************************************************************************

	include 'data_Z80Init.X68'

	include 'data_VDPInit.X68'

;*******************************************************************************
; sprite movement
;*******************************************************************************

RandomNPCMovement0Start:
	dc.w	DIRECTION_LEFT,DIRECTION_DOWN,DIRECTION_RIGHT,DIRECTION_UP
    dc.w	DIRECTION_DOWN,DIRECTION_RIGHT,DIRECTION_UP,DIRECTION_LEFT
    dc.w	DIRECTION_UP,DIRECTION_RIGHT,DIRECTION_DOWN,DIRECTION_LEFT
    dc.w	DIRECTION_RIGHT,DIRECTION_DOWN,DIRECTION_LEFT,DIRECTION_UP
RandomNPCMovement0End:

RandomNPCMovement1Start:
	dc.w	DIRECTION_LEFT,DIRECTION_LEFT
    dc.w	DIRECTION_RIGHT,DIRECTION_RIGHT
    dc.w	DIRECTION_RIGHT,DIRECTION_RIGHT
	dc.w	DIRECTION_LEFT,DIRECTION_LEFT
RandomNPCMovement1End:

;*******************************************************************************
; text
;*******************************************************************************

	include 'strings_en-us.X68'

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
