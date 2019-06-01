NewGame:

	move.w	#$2700,sr		; disable interrupts

;-------------------------------------------------------------------------------
; init SRAM
;-------------------------------------------------------------------------------
	bsr.w	InitSRAM

InitCounters:
	move.w	#$0000,(MEM_VBLANK_COUNTER)
	move.w	#$0000,(MEM_MAINLOOP_COUNTER)
	move.w	#$0000,(MEM_FRAME_COUNTER)

InitGameState:
	move.l	#$00000000,d0
	bset.l	#STATE_FLAG_TITLE_SCREEN,d0	; set title screen flag
	bset.l	#STATE_FLAG_EXITS_BLOCKED,d0	; set exits blocked flag
	bset.l	#STATE_FLAG_MALL_CLOSED,d0	; set mall closed flag
	move.l	d0,(MEM_GAME_STATE)	; save game state
	move.w	#$0000,(MEM_DAY)	; starting day is zero
	move.w	#OBJECTIVE_D0_O0,(MEM_OBJECTIVE)	; initial objective
	and.l	#$00000000,(MEM_GLOBAL_EVENT_FLAGS)	; clear event flags
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS)	; clear event flags
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission flags
	and.l	#$00000000,(MEM_SCENE_BGM)	; clear BGM
	move.w	#PLAYER_SPRITE_DB,(MEM_PLAYER_SPRITE)	; initial sprite
	bsr.w	ClearPlayerInventory	; clear player inventory
	and.l	#$00000000,(MEM_PLAYER_STORE_KEYS)	; clear store keys
	move.w	#$0000,(MEM_CUSTOMER_FEEDBACK_SCORE)	; clear customer feedback

;-------------------------------------------------------------------------------
; load the initial NPC locations
;-------------------------------------------------------------------------------
	bsr.w	InitNPCLocations

	move.w	#$2000,sr		; re-enable interrupts
;-------------------------------------------------------------------------------
; load the initial scene
;-------------------------------------------------------------------------------
DisplayLegalScene:
	lea	SceneLegal,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the intro scene
	move.w	#LEGAL_SCREEN_LOOP,d7	; use d7 for loop control
DisplayLegalSceneLoop:
	bsr.w	WaitVBlank	; wait for vblank
	dbf	d7,DisplayLegalSceneLoop	; loop

LoadTitleScene:
	lea	SceneTitle,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the intro scene
	move.w	#TITLE_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)

;-------------------------------------------------------------------------------
; load and setup the sprites
;-------------------------------------------------------------------------------
	move.w	#$2700,sr	; disable interrupts

; sprite zero is used on the menu screen
LoadSpriteZero:
	lea     SpriteZeroDefinition,a0	; store address of sprite definition
	moveq	#$01,d0	; 1 sprite = 2 longs
	move.l	#VDP_VRAM_WRITE_SPRITE,(VDP_CONTROL) ; set write location
LoadSpriteZeroLoop:
	move.l  (a0)+,(VDP_DATA)
	dbra    d0,LoadSpriteZeroLoop

; move sprite zero to the first menu item
	;---------------------------------------------------------------------------
	; update y
	;---------------------------------------------------------------------------
	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	#$0118,(VDP_DATA)	; copy the new y-coordinate
	;---------------------------------------------------------------------------
	; update x
	;---------------------------------------------------------------------------
	add.l	#$00060000,d6	; move to x-coordinate
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	#$0170,(VDP_DATA)	; copy the new x-coordinate

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
	if	_SPRITE_COLLISION_
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	endif

	move.w	#$2000,sr		; re-enable interrupts
