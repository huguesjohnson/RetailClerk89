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
; conditional compilation directives
;*******************************************************************************
_DEBUG_=$1	; enable/disable debug mode
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
NPC1_BASE_TILE=%0110000111010001 ;pri=0,pal=2,vf=0,hf=0,pattern=1D1
NPC2_BASE_TILE=%0110001000110001 ;pri=0,pal=2,vf=0,hf=0,pattern=231
NPC3_BASE_TILE=%0110001010010001 ;pri=0,pal=2,vf=0,hf=0,pattern=291
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
OBJ_LIST_LOOP_CTRL=OBJ_LIST_LENGTH+NPC_LIST_LENGTH-1
OBJ_LIST_STRUCT_SIZE=$0006	; size of the data structure for object list entries
; dialog constants
DIALOG_PATTERN_SIZE=$00C4	; size of the dialog pattern
DIALOG_BASE_TILE=$8090	; base tile for dialogs
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
SCENE_COUNT=$01	; total number of scenes
ACTION_COUNT=$04	; total number of actions
ACTION_COUNT_X4=(ACTION_COUNT*4)
SCENE_COUNT_X_ACTION_COUNT_X4=(SCENE_COUNT*ACTION_COUNT_X4)
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
;-------------------------------------------------------------------------------
; variables that effect the game speed that are changed often for debugging
;-------------------------------------------------------------------------------
	if	_DEBUG_
DIALOG_UPDATE_FREQUENCY=$0000	; how often to update dialog animation
SPRITE_MOVE_FREQUENCY=$0000 ; how many frames to wait between sprite moves
INTRO_SCREEN_COUNTER_START=$0001	; how long to display intro screens
	else
DIALOG_UPDATE_FREQUENCY=$0002	; how often to update dialog animation
SPRITE_MOVE_FREQUENCY=$0001 ; how many frames to wait between sprite moves
INTRO_SCREEN_COUNTER_START=$0168	; how long to display intro screens
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

	include	'init_NewGame.X68'

	include	'init_Debug.X68'

MainGameLoop:
	bsr.w	WaitVBlank							; wait for vblank to complete
	addq	#$1,(MEM_MAINLOOP_COUNTER)			; increment counter
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_EXPLORING,d7	; test game state
	beq.w	TestTitleScreen	; not exploring, branch
;-------------------------------------------------------------------------------
; pause/unpause
;-------------------------------------------------------------------------------
TestPauseToggle:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.w	#BUTTON_START_PRESSED,d6	; test if the start button was pressed
	beq.s	TestPause	; start button is not pressed test if still paused
	; clear MEM_CONTROL_PRESSED to prevent pause state from flipping in loop
	move.w	#$0000,(MEM_CONTROL_PRESSED)
	btst.l	#STATE_FLAG_PAUSED,d7	; is the paused bit set?
	bne.s	Unpause	; if so branch to unpause 
Pause:
	bset.l	#STATE_FLAG_PAUSED,d7	; set the paused bit
	; flip to paused palette
	bsr	Echo_StopBGM	; pause the background music
	lea	StorePalettesPaused,a0	; point to start of palettes
	move.w	(MEM_ACTIVE_SCENE_ID),d0	; copy active scene ID to d0
	mulu.w	#PALETTE_SET_SIZE,d0	; multiply scene ID by size of palette set
	adda.w	d0,a0	; increment a0 to point to scene palette
	move.w	#$0004,d0		; number of palettes to load
	move.l	#VDP_CRAM_WRITE,d1	; initial write address
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine
	bra.s	UpdatePause	; save the paused state
Unpause:
	bclr.l	#STATE_FLAG_PAUSED,d7	; clear the paused bit
	bsr	Echo_ResumeBGM	; unpause the background music
	lea	StorePalettes,a0	; point to start of palettes
	move.w	(MEM_ACTIVE_SCENE_ID),d0	; copy active scene ID to d0
	mulu.w	#PALETTE_SET_SIZE,d0	; multiply scene ID by size of palette set
	adda.w	d0,a0	; increment a0 to point to scene palette
	move.w	#$0004,d0		; number of palettes to load
	move.l	#VDP_CRAM_WRITE,d1	; initial write address
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine
UpdatePause:
	move.l	d7,(MEM_GAME_STATE)	; save the new paused state
TestPause:
	btst.l	#STATE_FLAG_PAUSED,d7	; test if paused
	beq.s	TestAction	; not paused, move to next test
	bra.w	MainGameLoop	; paused, return to start of game loop
;-------------------------------------------------------------------------------
; determine if there is an action queued
;-------------------------------------------------------------------------------
TestAction:
	btst.l	#STATE_FLAG_ACTION,d7 ; test game state
	beq.w	TestScriptedEvent	; no action queued, move to next test
	bsr.w	ProcessAction	; process the pending action
	bra.w	MainGameLoop	; paused, return to start of game loop
;-------------------------------------------------------------------------------
; determine if there is a scripted event to process
;-------------------------------------------------------------------------------
TestScriptedEvent:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_SCRIPTED_EVENT,d7 ; test game state
	beq.w	TestDialog	; not in a scripted event, move to next test
	btst.l	#STATE_FLAG_DIALOG,d7 ; test if we need to wait for a dialog
	bne.w	TestDialogUpdateFrequency	; wait for dialog interaction to finish
	;---------------------------------------------------------------------------
	; dialog is not displaying, test if it is time to start a new action
	;---------------------------------------------------------------------------
	cmpi.w	#$0000,(MEM_SCRIPTED_EVENT_STEPS)	; test if 0
	beq.s	NextScriptedEventAction	; if 0 then start next action
	;---------------------------------------------------------------------------
	; continue moving the sprite
	;---------------------------------------------------------------------------
	cmpi.w	#SPRITE_MOVE_FREQUENCY,(MEM_FRAME_COUNTER); is it time to move?
	blt.w	MainGameLoopEnd	; exit if it's not time to move
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset counter to 0
ScriptedEventMoveSprite:
	subq	#$1,(MEM_SCRIPTED_EVENT_STEPS)	; decrement step counter
	move.l	(MEM_SCRIPTED_SPRITE_ADDR),a6	; point a6 to sprite to move
	bsr.w	MoveSprite	; branch to MoveSprite
	bra.w	MainGameLoop	; return to start of game loop
NextScriptedEventAction:
	move.l	(MEM_SCRIPTED_SPRITE_ADDR),a6	; point a6 to sprite
	bsr.w	StopSprite	; stop moving the sprite
	move.l	(MEM_SCRIPTED_EVENT_ADDR),a6	; point a6 to next step
	move.w	(MEM_SCRIPTED_EVENT_ACTION),d7	; copy action to d7
	cmpi.w	#SCRIPTED_EVENT_END,d7	; are we at the end?
	beq.s	ScriptedEventEnd	; if so branch
	cmpi.w	#SCRIPTED_EVENT_DIALOG,d7	; display a dialog?
	beq.s	ScriptedEventDialog	; if so branch
	cmpi.w	#SCRIPTED_EVENT_CHANGE_SPRITE,d7	; changing the sprite?
	beq.s	ScriptedEventChangeSprite	; if so branch
	;---------------------------------------------------------------------------
	; start moving the sprite
	;---------------------------------------------------------------------------
	move.l	(MEM_SCRIPTED_SPRITE_ADDR),a5	; point a5 to sprite to update
	; copy direction to sprite direction 
	adda.w	#STRUCT_SPRITE_DIRECTION,a5	; move to direction
	move.w	(MEM_SCRIPTED_EVENT_ACTION),(a5)	; copy action to direction
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_STEPS)	; copy steps in action
	; save state of scripted event and loop back to main
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	bra.w	MainGameLoop	; return to start of game loop
ScriptedEventEnd:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; clear the scripted event flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	bra.w	MainGameLoop	; return to start of game loop
ScriptedEventDialog:
	move.l	(a6)+,(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	move.w	#$0000,(MEM_SCRIPTED_EVENT_STEPS)	; reset step counter
	; set dialog flags to display the dialog
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7	; change state to opening
	bset.l	#DIALOG_FLAG_STYLE_SIMPLE_TEXT,d7	; set style to overworld menu
	move.l	d7,(MEM_DIALOG_FLAGS)	; save changes made to the game state
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7
	bra.w	MainGameLoop	; return to start of game loop
ScriptedEventChangeSprite:
	move.l	(MEM_SCRIPTED_EVENT_ADDR),a6	; point a6 to next step
	bsr.w	QueueScriptedEvent	; this will reset all variables
	bra.w	MainGameLoop	; return to start of game loop
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
	blt.w	MainGameLoop	; branch i6f it's not time to move
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
; determine if the player is in free exploration mode
;-------------------------------------------------------------------------------
TestExploring:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_EXPLORING,d7	; test game state
	beq.w	TestTitleScreen	; not exploring, branch to next test
TestAButtonPressed: ; test if the player pressed the A button
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.w	#BUTTON_A_PRESSED,d6	; test if the A button was pressed
	beq.w	MainGameLoopUpdateSprites	; A button is not pressed
	;---------------------------------------------------------------------------
	; build event table address and branch to code
	;---------------------------------------------------------------------------
	; clear MEM_CONTROL_PRESSED to prevent state from flipping in loop
	move.w	#$0000,(MEM_CONTROL_PRESSED)
	lea	MEM_PLAYER_SPRITE_ID,a6	; point a6 to player sprite
	bsr.w	StopSprite ; stop the player sprite
	bsr.w	BuildNPCObjectList	; update the location of NPCs
	bsr.w	FindActionTarget	; find the target of the player's action
	cmpi.w	#OBJ_NOTHING,(MEM_ACTION_TARGET_OBJID)	; is the target nothing?
	beq.s	NoActionTarget	; branch if no target
	bsr.w	ShowSelectionDialog	; otherwise show a selection dialog
	bra.w	MainGameLoop	; return to start of game loop
NoActionTarget: 	; if target is 0 then display the default message
	bsr.w	ShowDefaultText	; show the default text
	bsr.w	SetDialogOpening	; set dialog state to opening
	bra.w	MainGameLoop	; return to start of game loop
;-------------------------------------------------------------------------------
; determine if sprites need to be moved and move them
;-------------------------------------------------------------------------------
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
	; if STRUCT_SPRITE_MOVE_FREQUENCY = $FFFF then don't move the sprite
	cmpi.w	#$FFFF,(STRUCT_SPRITE_MOVE_FREQUENCY,a5)	; test
	beq.s	MainGameLoopUpdateNPCSpritesLoopEnd	; branch if equal
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
	move.l a5,a6	; setup call to MoveSprite
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
;-------------------------------------------------------------------------------
; title screen
;-------------------------------------------------------------------------------
TestTitleScreen:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_TITLE_SCREEN,d7 ; test game state
	beq.w	TestEndScreen	; not on the title screen, move to next test
TestTitleScreenTestStartPressed:
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.w	#BUTTON_START_PRESSED,d6	; test if the start button was pressed
	bne.s	TestTitleLoadIntroScreen	; start button pressed, load intro
	subq	#$1,(MEM_INTRO_SCENE_COUNTER)	; decrement counter
	bne.w	MainGameLoop	; loop until the counter is zero
	bra.w	NewGame	; counter is zero, restart
TestTitleLoadIntroScreen:
	; clear MEM_CONTROL_PRESSED to prevent entering pause state immediately
	move.w	#$0000,(MEM_CONTROL_PRESSED)
	; --------------------------------------------------------------------------
	; start button was pressed on the title screen
	; in this iteration there is only one menu option
	; future versions will need to determine which action was selected
	; --------------------------------------------------------------------------
	bclr.l	#STATE_FLAG_TITLE_SCREEN,d7 ; clear game state flag
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	ifeq	_DEBUG_
	bset.l	#STATE_FLAG_EXITS_BLOCKED,d7	; set flag blocking the exits
	endif
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; set the intro screen counter
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay00,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bra.w	MainGameLoop	;	return to start of game loop
;-------------------------------------------------------------------------------
; end screen
;-------------------------------------------------------------------------------
TestEndScreen:
	btst.l	#STATE_FLAG_END_SCREEN,d7 ; test game state
	beq.w	TestIntroScreen	; not on the end screen, move to next test
TestEndScreenTestStartPressed:
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.w	#BUTTON_START_PRESSED,d6	; test if the start button was pressed
	beq.w	MainGameLoop	; start button not pressed, loop
	; --------------------------------------------------------------------------
	; start button was pressed on the end screen - loop back to the beginning
	; --------------------------------------------------------------------------
	; clear MEM_CONTROL_PRESSED to prevent entering pause state immediately
	move.w	#$0000,(MEM_CONTROL_PRESSED)
EndScreenRestart:
	bra.w	NewGame	; restart
;-------------------------------------------------------------------------------
; day intro screen
;-------------------------------------------------------------------------------
TestIntroScreen:
	btst.l	#STATE_FLAG_INTRO_SCREEN,d7 ; test game state
	beq.w	MainGameLoopEnd	; not on the intro screen, move to next test
	subq	#$1,(MEM_INTRO_SCENE_COUNTER)	; decrement counter
	bne.w	MainGameLoop	; loop until the counter is zero
	; counter is zero, load the next scene
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear game state flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; initial mode is exploring
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; determine which scene to load
	move.w	(MEM_ACTIVE_SCENE_EXIT_N),d6	; copy any exit to d6
	mulu.w	#LWORD_SIZE,d6	; SceneDefinitionTable entries are long values
	lea	SceneDefinitionTable,a5	; point to action table
	adda.w	d6,a5	; move to offset location
	move.l	(a5),a6	; a5 has the address of the scene to load
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite
	bsr.w	HideSelectorSprite	; hide the menu selector sprite
	; workaround to issue where links aren't set if the table is already sorted	
	bsr.w	SetSpriteLinks
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset frame counter
	bra.w	MainGameLoop	;	return to start of game loop
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
	bsr.w	WaitVBlankStart	; wait for vblank to start
	bsr.w	WaitVBlankEnd	; wait for vblank to end
	rts	; exit
WaitVBlankStart:
	move.w	VDP_CONTROL,d0	; copy VDP status to d0
   	andi.w	#VDP_STATUS_VBLANK,d0	; check if the vblank status flag is set
	beq.s	WaitVBlankStart	; wait for vblank to complete
	rts	; exit
WaitVBlankEnd:
	move.w	VDP_CONTROL,d0	; copy VDP status to d0
   	andi.w	#VDP_STATUS_VBLANK,d0	; check if the vblank status flag is set
	bne.s	WaitVBlankEnd	; wait for vblank to complete
	rts	; exit

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
; sprite table defintions
;*******************************************************************************
	include 'data_SpriteDefinitions.X68'

;*******************************************************************************
; character defintions
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
	incbin	'music/bgm_store00.esf'

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
