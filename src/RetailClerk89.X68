;*******************************************************************************
; Main code file for RetailClerk89, a personal exercise to learn MD programming.
; This might even turn into a real game demo one day.
;
; Build this using: 
;	vasmm68k_mot -o RetailClerk89.bin -Fbin RetailClerk89.X68
;
; Visit http://HuguesJohnson.com/ for random articles about this project.
; 
; General program notes:
; 	-there are some constants defined that are not used
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
	include 'const_ActionIDs.X68'
	include 'const_Flags.X68'
	include 'const_GameSettings.X68'
	include 'const_ObjectIDs.X68'
	include	'const_RomMap.X68'
	include 'const_SceneIDs.X68'
	include	'const_ScriptedEventCommands.X68'
	include	'const_StructFields.X68'
	include	'const_StoreKeys.X68'

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
; unused - seems buggy on clone hardware, included just for reference
;WaitVBlankStart:
;	move.w	VDP_CONTROL,d0	; copy VDP status to d0
;   andi.w	#VDP_STATUS_VBLANK,d0	; check if the vblank status flag is set
;	beq.s	WaitVBlankStart	; wait for vblank to start
;	rts	; exit
;WaitVBlankEnd:
;	move.w	VDP_CONTROL,d0	; copy VDP status to d0
;   andi.w	#VDP_STATUS_VBLANK,d0	; check if the vblank status flag is set
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
