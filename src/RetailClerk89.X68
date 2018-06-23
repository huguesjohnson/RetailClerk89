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
;	vasmm68k_mot -o RetailClerk89.bin -Fbin RetailClerk89.X68
;
; Visit http://HuguesJohnson.com/ for random articles about this project.
; 
; General program notes:
; 	-there are some constants defined that are not (yet) used
; 	-there are a lot of opportunities to optimize this code
;*******************************************************************************

;*******************************************************************************
; these are effectively conditional compilation directives
;*******************************************************************************
_DEBUG_=$1	; enable/disable debug mode
_EMULATOR_DIAGNOSTICS_=$0	; enable/disable emulator diagnostic mode
_SPRITE_COLLISION_=$0	; enable/disable collision between sprites

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
	include 'const_ActionIDs.X68'
	include 'const_Flags.X68'
	include 'const_ObjectIDs.X68'
	include	'const_RomMap.X68'
	include 'const_SceneIDs.X68'
	include	'const_StructFields.X68'
	include	'const_StoreKeys.X68'

; sprite settings
SPRITE_BASE_PATTERN=$6110	; base pattern of sprites
SPRITE_TILESET_SIZE=$60	; the size of the tileset used for sprites
SPRITE_TILESET_LWORDS=SPRITE_TILESET_SIZE*LWORDS_PER_TILE	; lwords in tileset
DEFAULT_SPRITE_HEIGHT=$0020	; how many pixels tall a sprite is by default
DEFAULT_SPRITE_WIDTH=$0010	; how many pixels wide a sprite is by default
SPRITE_FRAME_COUNT=$0003	; how many animation frames there are for sprites
SPRITE_ANIMATION_STEPS=$0008	; how many steps between animation frame changes
SPRITE_STEP_PIXELS=$0001	; how many pixels to move on each sprite step
SPRITE_PLAYER_PATTERN=SPRITE_BASE_PATTERN+$1	; base pattern for player sprite
SPRITE_PLAYER_HEIGHT=DEFAULT_SPRITE_HEIGHT	; player sprite height
SPRITE_PLAYER_WIDTH=DEFAULT_SPRITE_WIDTH	; player sprite 
SPRITE_PLAYER_INIT_X=$0100	; starting x location of player sprite
SPRITE_PLAYER_INIT_Y=$0100	; starting y location of player sprite
SPRITE_DEF_WORD2_BASE=$0700	; width=16,height=32 - low byte has link field
NPC_RECORD_SIZE=MEM_NPC1_SPRITE_ID-MEM_NPC0_SPRITE_ID
NPC_SPRITE_MOVE_STEPS=$0009; how many steps NPC sprites take when they move
PLAYER_BASE_TILE=%0110000100000001 ; pri=0,pal=2,vf=0,hf=0,pattern=101
NPC0_BASE_TILE=%0110000101110001 ;pri=0,pal=2,vf=0,hf=0,pattern=171
NPC_BASE_TILE_INC=$0060	; how many tiles to increment between NPCs
PLAYER_SPRITE_DB=$0000	; use tiles for DB as player sprite
PLAYER_SPRITE_DANI=$0001	; use tiles for Dani as player sprite
; directions
DIRECTION_DOWN=%0000	; 0
DIRECTION_UP=%0001		; 1
DIRECTION_LEFT=%0010	; 2
DIRECTION_RIGHT=%0011	; 3
DIRECTION_NULL=%1111	; used for movement patterns
; used for sprite collision tests
; top edge of bottom 1/2 of sprite
SPRITE_COLLISION_Y=(DEFAULT_SPRITE_HEIGHT-(DEFAULT_SPRITE_HEIGHT/2))
SPRITE_COLLISION_UP=SPRITE_STEP_PIXELS
SPRITE_COLLISION_DOWN=(DEFAULT_SPRITE_HEIGHT/2)+SPRITE_STEP_PIXELS
SPRITE_COLLISION_RIGHT=DEFAULT_SPRITE_WIDTH+SPRITE_STEP_PIXELS
SPRITE_COLLISION_LEFT=SPRITE_STEP_PIXELS
MAP_MID_X=$100
; scene exit points
SCENE_EXIT_TOP=$0000+SPRITE_PLANE_OFFSET_TOP
SCENE_EXIT_BOTTOM=$00D0+SPRITE_PLANE_OFFSET_TOP
SCENE_EXIT_LEFT=$0000+SPRITE_PLANE_OFFSET_LEFT
SCENE_EXIT_RIGHT=$013A+SPRITE_PLANE_OFFSET_LEFT
; these are based on registers 2,3,4,5,13 in data_VDPInit.X68
VDP_VRAM_WRITE_A=$40000003			; register 2
VDP_VRAM_WRITE_HSCROLL=$7C000002	; register 13
VDP_VRAM_WRITE_SPRITE=$78000002		; register 5
VDP_VRAM_WRITE_B=$60000003			; register 4
VDP_VRAM_WRITE_WINDOW=$60000002		; register 3
VDP_VRAM_WRITE_VSCROLL=$40000010	; vscroll write
; relative VPD memory locations
SCENE_VDP=$0000			; write location for scene tiles
FONT_VDP=$1200	; write location for font tiles
SPRITE_VDP=$2200	; write location for sprite tiles
PLAYER_SPRITE_VDP=SPRITE_VDP+$0020	; write location for player sprite tiles
PLAYER_SPRITE_VDP_X=$780E0002	; write location for player sprite x
PLAYER_SPRITE_VDP_Y=$78080002	; write location for player sprite x
NPC0_SPRITE_VDP_X=$78100002
NPC0_SPRITE_VDP_Y=$00160000
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
; initial map values
INIT_MAP_POSITION_X=$0000	; initial x-position
INIT_MAP_POSITION_Y=$0000	; initial y-position
DEFAULT_COLLISION_DATA_SIZE=$7F	; 128 longs of collision data by default 
; position where the player enters a scene
SCENE_ENTER_TOP=SPRITE_PLANE_OFFSET_TOP+$0008
SCENE_ENTER_BOTTOM=SPRITE_PLANE_OFFSET_TOP+DISPLAY_PIXELS_Y-$0010
SCENE_ENTER_LEFT=SPRITE_PLANE_OFFSET_LEFT+$0008
SCENE_ENTER_RIGHT=SPRITE_PLANE_OFFSET_LEFT+DISPLAY_PIXELS_X-$0008
; object list constants
OBJ_LIST_LENGTH=$000A	; max items in the object list
NPC_LIST_LENGTH=$0004	; max items in the NPC list
NPC_LIST_LOOP_CTRL=$0001	; (NPC_LIST_LENGTH/2)-1
OBJ_LIST_LOOP_CTRL=OBJ_LIST_LENGTH+NPC_LIST_LENGTH-1
OBJ_LIST_STRUCT_SIZE=$0006	; size of the data structure for object list entries
; dialog constants
DIALOG_PATTERN_SIZE=$00C4	; size of the dialog pattern
DIALOG_BASE_TILE=$8090	; base tile for dialogs
DIALOG_BASE_TILE_LOW=$0090	; base tile for dialogs (low)
DIALOG_ROWCOL=$09900000	; row 19 column 16=(128*19)+16=2448=990
DIALOG_FRAME_COUNT=$000B	; number of animation frames for dialogs
DIALOG_MENU_INIT_SELECTION_X=$C8	; x coordinate of initial menu selection
DIALOG_MENU_INIT_SELECTION_Y=$120	; y coordinate of initial menu selection
DIALOG_NO_RESPONSE=$FFFF	; no response or dialog cancelled 
LF=$0A	; '\n' - used to break text into multiple lines
FF=$0C	; form feed - used to break text into pages
ETX=$03	; end of text
OBJNAMEEND=$1E	; end of object name
NPCNAMEEND=$1F	; end of NPC name
ITEMNAMESTART=$1C	; indicator to draw the next item name
ITEMNAMEEND=$1D	; end of item name
; used for action table
DAY_COUNT=$01	; total number of days
SCENE_COUNT=$18	; total number of scenes
ACTION_COUNT=$04	; total number of actions
ACTION_COUNT_X4=(ACTION_COUNT*4)
SCENE_COUNT_X_ACTION_COUNT_X4=(SCENE_COUNT*ACTION_COUNT_X4)
; used for status screen
STATUS_SCREEN_MAP_ICON_BASE_PATTERN=%1110000000010001
STATUS_SCREEN_OBJECTIVE_VDP=VDP_VRAM_WRITE_B+$00020000+$08000000
STATUS_SCREEN_STOREKEYS_VDP=VDP_VRAM_WRITE_B+$01300000
STATUS_SCREEN_INVENTORY_VDP=VDP_VRAM_WRITE_B+$00040000+$0B000000
; other constants
CHAR_DQUOTE=$22	; ACSII code for double quote character
MAX_ITEMS=$04	; maximum number of items the player can carry
ROW_HEIGHT=$800000	; height of a tile row
PALETTE_SET_SIZE=$80	; size of 4 palettes
CHARACTER_DEFINITION_SIZE=CharacterDefinitionPlayerEnd-CharacterDefinitionPlayer
SCRIPTED_EVENT_END=$FFFF
SCRIPTED_EVENT_DIALOG=$EEEE
SCRIPTED_EVENT_CHANGE_SPRITE=$DDDD
TITLE_SCREEN_COUNTER_START=$2800	; how long to display title before reset
MAX_STORE_ID=$0017
;-------------------------------------------------------------------------------
; variables that effect the game speed that are changed often for debugging
;-------------------------------------------------------------------------------
	if	_DEBUG_
DIALOG_UPDATE_FREQUENCY=$0000	; how often to update dialog animation
SPRITE_MOVE_FREQUENCY=$0001 ; how many frames to wait between sprite moves
INTRO_SCREEN_COUNTER_START=$0001	; how long to display intro screens
FADE_FRAME_DELAY=$0001	; how many frames to wait between fade in/out
	else
DIALOG_UPDATE_FREQUENCY=$0002	; how often to update dialog animation
SPRITE_MOVE_FREQUENCY=$0001 ; how many frames to wait between sprite moves
INTRO_SCREEN_COUNTER_START=$00B4	; how long to display intro screens
FADE_FRAME_DELAY=$0003	; how many frames to wait between fade in/out
	endif

;*******************************************************************************
; vectors
;*******************************************************************************
	include 'init_Vectors.X68'

;*******************************************************************************
; ROM header
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

	; run the diagnostic loop 
	if	_EMULATOR_DIAGNOSTICS_
	include	'sub_DiagnosticLoop.X68'
	endif

	include	'init_NewGame.X68'

	include	'init_Debug.X68'

	include	'sub_MainGameLoop.X68'

;-------------------------------------------------------------------------------
; WaitVBlank
;-------------------------------------------------------------------------------
WaitVBlank:
	btst	#STATE_FLAG_VBLANK,(MEM_GAME_STATE)	; test vblank flag
	beq.s	WaitVBlank	; loop until flag changes
	bclr	#STATE_FLAG_VBLANK,(MEM_GAME_STATE)	; clear vblank flag
	rts	; exit
;WaitVBlankStart:
;	move.w	VDP_CONTROL,d0	; copy VDP status to d0
;   	andi.w	#VDP_STATUS_VBLANK,d0	; check if the vblank status flag is set
;	beq.s	WaitVBlankStart	; wait for vblank to start
;	rts	; exit
;WaitVBlankEnd:
;	move.w	VDP_CONTROL,d0	; copy VDP status to d0
;   	andi.w	#VDP_STATUS_VBLANK,d0	; check if the vblank status flag is set
;	bne.s	WaitVBlankEnd	; wait for vblank to complete
;	rts	; exit

;*******************************************************************************
; traps
;*******************************************************************************

ExtInt:
	rte

HBlank:
	rte

VBlank:
	bset	#STATE_FLAG_VBLANK,(MEM_GAME_STATE)	; set vblank flag
	addq	#$1,(MEM_VBLANK_COUNTER)	; increment debug counter 
	addq	#$1,(MEM_FRAME_COUNTER)		; increment frame counter

VBlankReadJoypads:
	bsr.w	ReadJoypads					; read controllers

VBlankOrderSprites:
	; test if sprites need to be re-ordered
	tst.w	(MEM_SPRITE_Y_ORDER_CHANGED)	; has the sprite Y order changed?
	beq.s	VBlankExit	; hasn't changed, no need to order sprites
	move.l	(MEM_GAME_STATE),d0	; copy current game state to d0
	btst.l	#STATE_FLAG_EXPLORING,d0	; test game state
	beq.s	VBlankExit	; not exploring, no need to order sprites
	; else order sprites and loop
	bsr.w	OrderSprites	; reorder the sprites

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
; code to handle player actions based on game state
;*******************************************************************************
	include	'actionscript/ActionScript.X68'

;*******************************************************************************
; echo sound driver (https://github.com/sikthehedgehog/Echo)
;*******************************************************************************
	include 'echo/echo_main.X68'

	include	'echo/echo_list.X68'

;*******************************************************************************
; initialization data
;*******************************************************************************
	include 'data_Z80Init.X68'

	include 'data_VDPInit.X68'

;*******************************************************************************
; palettes
;*******************************************************************************
	include 'inc_Palettes.X68'

;*******************************************************************************
; patterns
;*******************************************************************************
	include 'inc_Patterns.X68'

;*******************************************************************************
; scenes
;*******************************************************************************
	include 'inc_Scenes.X68'

;*******************************************************************************
; scene items
;*******************************************************************************
	include	'data_SceneItemLists.X68'

;*******************************************************************************
; collision maps
;*******************************************************************************
	include	'inc_CollisionMaps.X68'

;*******************************************************************************
; sprite table definitions
;*******************************************************************************
	include 'data_SpriteDefinitions.X68'

;*******************************************************************************
; character definitions
;*******************************************************************************
	include 'data_CharacterDefinitions.X68'

;*******************************************************************************
; sprite movement
;*******************************************************************************
	include	'data_SpriteMovementPatterns.X68'

;*******************************************************************************
; scripted events
;*******************************************************************************
	include	'data_ScriptedEvents.X68'

;*******************************************************************************
; scene definition table
;*******************************************************************************
	include	'table_SceneDefinitions.X68'

;*******************************************************************************
; default object text table
;*******************************************************************************
	include	'table_Text.X68'

;*******************************************************************************
; action table
;*******************************************************************************
	include	'table_Actions.X68'

;*******************************************************************************
; status map icon location
;*******************************************************************************
	include	'table_StatusMapIconLocation.X68'

	org	ROM_ADDR_RESOURCES

;*******************************************************************************
; text
;*******************************************************************************
	include 'strings_en-us.X68'

;*******************************************************************************
; background music
;*******************************************************************************
BGM_Title:
	incbin	'music/bgm_title.esf'

BGM_End:
	incbin	'music/bgm_end.esf'

BGM_Store0:
	incbin	'music/bgm_store00_four-track.esf'

BGM_Day00:
	incbin	'music/bgm_day00.esf'

	align 2

;*******************************************************************************
; tiles
;*******************************************************************************
	include 'inc_Tiles.X68'

;*******************************************************************************
; echo instruments
;*******************************************************************************
	org	ROM_ADDR_INSTRUMENTS

	include 'echo/echo_instruments.X68'

;*******************************************************************************
; end of rom
;*******************************************************************************

RomEnd:
	ORG ROM_ADDR_END
	dc.b	%11111111
    end 0
