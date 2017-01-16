NewGame:
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
