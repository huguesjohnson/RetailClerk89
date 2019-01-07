;*******************************************************************************
; constants that effect how the looks and behaves
;*******************************************************************************

;-------------------------------------------------------------------------------
; these are effectively conditional compilation directives
;-------------------------------------------------------------------------------
_DEBUG_=$0	; enable/disable debug mode
_EMULATOR_DIAGNOSTICS_=$0	; enable/disable emulator diagnostic mode
_SPRITE_TILE_DEBUG_=$0	; enable/disable debug sprite tiles
_SPRITE_COLLISION_=$0	; enable/disable collision between sprites
_ATGAMES_HACKS=$1	; enable/disable hacks for AtGames devices

;-------------------------------------------------------------------------------
; settings that effect the game speed that are changed often for debugging
;-------------------------------------------------------------------------------
	if	_DEBUG_
DIALOG_UPDATE_FREQUENCY=$0000	; how often to update dialog animation
SPRITE_MOVE_FREQUENCY=$0001 ; how many frames to wait between sprite moves
INTRO_SCREEN_COUNTER_START=$0001	; how long to display intro screens
FADE_FRAME_DELAY=$0001	; how many frames to wait between fade in/out
EVENT_FRAME_DELAY=$0008	; delay used for scripted event scene changes
LEGAL_SCREEN_LOOP=$0001	; how long to display the legal screen
CREDITS_SCREEN_LOOP=$0168	; how long to display the credits screen
	else
DIALOG_UPDATE_FREQUENCY=$0002	; how often to update dialog animation
SPRITE_MOVE_FREQUENCY=$0001 ; how many frames to wait between sprite moves
INTRO_SCREEN_COUNTER_START=$001E	; how long to display intro screens
FADE_FRAME_DELAY=$0003	; how many frames to wait between fade in/out
EVENT_FRAME_DELAY=$0009	; delay used for scripted event scene changes
LEGAL_SCREEN_LOOP=$0100	; how long to display the legal screen
CREDITS_SCREEN_LOOP=$0258	; how long to display the credits screen
	endif

;-------------------------------------------------------------------------------
; VDP/VRAM addresses
;-------------------------------------------------------------------------------
; these are based on registers 2,3,4,5,13 in data_VDPInit.X68
VDP_VRAM_WRITE_A=$40000003	; register 2
VDP_VRAM_WRITE_HSCROLL=$7C000002	; register 13
VDP_VRAM_WRITE_SPRITE=$78000002	; register 5
VDP_VRAM_WRITE_B=$60000003	; register 4
VDP_VRAM_WRITE_WINDOW=$60000002	; register 3
VDP_VRAM_WRITE_VSCROLL=$40000010	; vscroll write
; relative VPD memory locations
SCENE_VDP=$0000	; write location for scene tiles
FONT_VDP=$1200	; write location for font tiles
SPRITE_VDP=$2200	; write location for sprite tiles
PLAYER_SPRITE_VDP=SPRITE_VDP+$0020	; write location for player sprite tiles
PLAYER_SPRITE_VDP_X=$780E0002	; write location for player sprite x
PLAYER_SPRITE_VDP_Y=$78080002	; write location for player sprite x
NPC0_SPRITE_VDP_X=$78160002	; write location for npc0 sprite x
NPC0_SPRITE_VDP_Y=$78100002	; write location for npc0 sprite y

;-------------------------------------------------------------------------------
; directions
;-------------------------------------------------------------------------------
DIRECTION_DOWN=%0000	; 0
DIRECTION_UP=%0001		; 1
DIRECTION_LEFT=%0010	; 2
DIRECTION_RIGHT=%0011	; 3
DIRECTION_NULL=%1111	; used for movement patterns

;-------------------------------------------------------------------------------
; sprite settings
;-------------------------------------------------------------------------------
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
; used for sprite collision tests - top edge of bottom 1/2 of sprite
SPRITE_COLLISION_Y=(DEFAULT_SPRITE_HEIGHT-(DEFAULT_SPRITE_HEIGHT/2))
SPRITE_COLLISION_UP=SPRITE_STEP_PIXELS
SPRITE_COLLISION_DOWN=(DEFAULT_SPRITE_HEIGHT/2)+SPRITE_STEP_PIXELS
SPRITE_COLLISION_RIGHT=DEFAULT_SPRITE_WIDTH+SPRITE_STEP_PIXELS
SPRITE_COLLISION_LEFT=SPRITE_STEP_PIXELS
; screen & plane sizes
SPRITE_PLANE_PIXELS_X=$0200	; width of sprite virtual plane
SPRITE_PLANE_PIXELS_Y=$0200	; height of sprite virtual plane
SPRITE_PLANE_OFFSET_TOP=$0080	; sprite plane top to display top edge
SPRITE_PLANE_OFFSET_LEFT=$0080	; sprite plane left to display left edge
SPRITE_PLANE_OFFSET_BOTTOM=$00A0	; sprite plane bottom to display bottom edge
SPRITE_PLANE_OFFSET_RIGHT=$0040	; sprite plane right to display right edge
; other sprite/NPC settings
NPC_RECORD_SIZE=MEM_NPC1_SPRITE_ID-MEM_NPC0_SPRITE_ID
NPC_SPRITE_MOVE_STEPS=$0009; how many steps NPC sprites take when they move
PLAYER_BASE_TILE=%0110000100000001 ; pri=0,pal=2,vf=0,hf=0,pattern=101
NPC0_BASE_TILE=%0110000101110001 ;pri=0,pal=2,vf=0,hf=0,pattern=171
NPC_BASE_TILE_INC=$0060	; how many tiles to increment between NPCs
CHARACTER_DEFINITION_SIZE=CharacterDefinitionPlayerEnd-CharacterDefinitionPlayer

;-------------------------------------------------------------------------------
; dialog settings
;-------------------------------------------------------------------------------
DIALOG_PATTERN_SIZE=$0124	; size of dialog pattern (#tiles*2+4 for loop ctrl)
DIALOG_BASE_TILE=$8090	; base tile for dialogs
DIALOG_BASE_TILE_LOW=$0090	; base tile for dialogs (low)
DIALOG_ROWCOL=$09100000	; row 18 column 16=(128*18)+16=2320=910
DIALOG_TEXT_AREA_ROWCOL=$0A900000	; DIALOG_ROWCOL + 3 rows
DIALOG_TEXT_ROWCOL=$0A920000	; DIALOG_ROWCOL + 3 rows + 1 column
DIALOG_TITLE_ROWCOL=$09940000	; DIALOG_ROWCOL + 1 row + 2 columns
DIALOG_FRAME_COUNT=$000B	; number of animation frames for dialogs
DIALOG_MENU_INIT_SELECTION_X=$C8	; x coordinate of initial menu selection
DIALOG_MENU_INIT_SELECTION_Y=$128	; y coordinate of initial menu selection
DIALOG_NO_RESPONSE=$FFFF	; no response or dialog cancelled 

;-------------------------------------------------------------------------------
; map settings
;-------------------------------------------------------------------------------
MAP_MID_X=$100	; mid-point of map - used for collision detection
; scene exit points
SCENE_EXIT_TOP=$0000+SPRITE_PLANE_OFFSET_TOP
SCENE_EXIT_BOTTOM=$00D0+SPRITE_PLANE_OFFSET_TOP
SCENE_EXIT_LEFT=$0000+SPRITE_PLANE_OFFSET_LEFT
SCENE_EXIT_RIGHT=$013A+SPRITE_PLANE_OFFSET_LEFT
; position where the player enters a scene
SCENE_ENTER_TOP=SPRITE_PLANE_OFFSET_TOP+$0008
SCENE_ENTER_BOTTOM=SPRITE_PLANE_OFFSET_TOP+DISPLAY_PIXELS_Y-$0010
SCENE_ENTER_LEFT=SPRITE_PLANE_OFFSET_LEFT+$0008
SCENE_ENTER_RIGHT=SPRITE_PLANE_OFFSET_LEFT+DISPLAY_PIXELS_X-$0008
DEFAULT_COLLISION_DATA_SIZE=$7F	; 128 longs of collision data by default 

;-------------------------------------------------------------------------------
; object/NPC list settings
;-------------------------------------------------------------------------------
OBJ_LIST_LENGTH=$000A	; max items in the object list
NPC_LIST_LENGTH=$0004	; max items in the NPC list
NPC_LIST_LOOP_CTRL=$0001	; (NPC_LIST_LENGTH/2)-1
OBJ_LIST_LOOP_CTRL=OBJ_LIST_LENGTH+NPC_LIST_LENGTH-1
OBJ_LIST_STRUCT_SIZE=$0006	; size of the data structure for object list entries

;-------------------------------------------------------------------------------
; status screen settings
;-------------------------------------------------------------------------------
STATUS_SCREEN_MAP_ICON_BASE_PATTERN=%1110000000010001
STATUS_SCREEN_OBJECTIVE_VDP=VDP_VRAM_WRITE_B+$00020000+$08000000
STATUS_SCREEN_STOREKEYS_VDP=VDP_VRAM_WRITE_B+$01300000
STATUS_SCREEN_INVENTORY_VDP=VDP_VRAM_WRITE_B+$00040000+$0B000000

;-------------------------------------------------------------------------------
; display settings
;-------------------------------------------------------------------------------
ROW_HEIGHT=$800000	; height of a tile row
PALETTE_SET_SIZE=$80	; size of 4 palettes
PLAYER_SPRITE_DB=$0000	; use tiles for DB as player sprite
PLAYER_SPRITE_DANI=$0001	; use tiles for Dani as player sprite

;-------------------------------------------------------------------------------
; action table settings
;-------------------------------------------------------------------------------
DAY_COUNT=$01	; total number of days
SCENE_COUNT=$18	; total number of scenes
ACTION_COUNT=$04	; total number of actions
ACTION_COUNT_X4=(ACTION_COUNT*4)
SCENE_COUNT_X_ACTION_COUNT_X4=(SCENE_COUNT*ACTION_COUNT_X4)

;-------------------------------------------------------------------------------
; everything else
;-------------------------------------------------------------------------------
MAX_ITEMS=$04	; maximum number of items the player can carry
MAX_STORE_ID=$0017	; maximum number of stores
TITLE_SCREEN_COUNTER_START=$2800	; how long to display title before reset
NPC_NAME_TABLE_SIZE=NPCNameTableEnd-NPCNameTable
