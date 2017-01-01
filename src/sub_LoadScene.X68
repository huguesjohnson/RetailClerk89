;-------------------------------------------------------------------------------
; LoadScene
; clears the current scene and loads a new one 
; Parameters
; a6 = starting address of scene to load
; other registers used
; a0 & a1 are used to call other subroutines
; assume that d0-d7 are used either by this subroutine or others it calls
;-------------------------------------------------------------------------------
LoadScene:
	move.w	#$2700,sr		; disable interrupts

;---------------------------------------------------------------------------
; scene ID
;---------------------------------------------------------------------------
	move.w	(a6)+,(MEM_ACTIVE_SCENE_ID)	; scene ID

;-------------------------------------------------------------------------------
; load tiles
;-------------------------------------------------------------------------------
	move.w	(a6)+,d7	; number of tilesets to load
	move.l	#SCENE_VDP,d6	; use d6 to track write location
LoadSceneLoadTilesLoop:
	move.l	(a6)+,d1	; start address of tileset
	move.l	(a6)+,d0	; end address of tileset
	sub.l	d1,d0	; subtract the start address to get length
	move.l	d0,d2	; copy original value to increment write location later
	divu.w	#$0004,d0	; divide by 4 to setup call to LoadTiles
	movea.l	d1,a0	; set address of first tile to load
	move.l	d6,d1	; set initial write location
	bsr.w	LoadTiles	; branch to LoadTiles subroutine
	; increment write location for next tileset
	swap	d2	; d2 has the size of the last tileset, swap it to upper word
	add.l	d2,d6	; add to d6 to increment write location
	dbra d7,LoadSceneLoadTilesLoop	; loop until all data is loaded

;-------------------------------------------------------------------------------
; load palettes
;-------------------------------------------------------------------------------
	; setup call to LoadPalettes
	move.w	(a6)+,d0	; number of palettes to load
	movea.l	(a6)+,a0	; start address of palettes
	move.l	#VDP_CRAM_WRITE,d1	; initial write address
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine

;-------------------------------------------------------------------------------
; draw the scenery
;-------------------------------------------------------------------------------
	move.w	(a6)+,d7	; number of tilesets to load
LoadSceneDrawSceneryLoop:
	movea.l	(a6)+,a0	; start address of pattern
	move.w	(a6)+,d0	; base pattern
	move.w	(a6)+,d1	; repeat
	movea.l	(a6)+,a1	; initial drawing location
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	dbra d7,LoadSceneDrawSceneryLoop	; loop until all data is loaded

;-------------------------------------------------------------------------------
; load objects
;-------------------------------------------------------------------------------
	move.w	(a6)+,d7	; number of objects to load
	lea	MEM_OBJECT_LIST_OBJS,a0	; address of object data
LoadSceneLoadObjectsLoop:
	move.w	(a6)+,(a0)+	; word0 (object ID)
	move.w	(a6)+,(a0)+	; word1 (x+width)
	move.w	(a6)+,(a0)+	; word2 (y+height)
	dbra d7,LoadSceneLoadObjectsLoop	; loop until all data is loaded

;-------------------------------------------------------------------------------
; load collision data
;-------------------------------------------------------------------------------
	move.w	(a6)+,d7	; size of collision data
	movea.l	(a6)+,a0	; start address of collision data
	lea	MEM_COLLISION_DATA,a1	; store destination memory location
LoadSceneLoadMapCollisionLoop:
	move.l  (a0)+,(a1)+
	dbra    d7,LoadSceneLoadMapCollisionLoop

;-------------------------------------------------------------------------------
; setup map 
;-------------------------------------------------------------------------------
	move.w	#INIT_MAP_POSITION_X,(MEM_MAP_POSITION_X)	; set map x-position
	move.w	#INIT_MAP_POSITION_Y,(MEM_MAP_POSITION_Y)	; set map y-position
	move.w	#$FFFF,(MEM_FLAG_MAP_POSITION_CHANGED)	; flag to reset the scroll
	bsr.w	SetMapScroll	; set the map position

;-------------------------------------------------------------------------------
; load & start the background music
;-------------------------------------------------------------------------------
	movea.l	(a6)+,a0	; address of the BGM
	bsr Echo_PlayBGM

;-------------------------------------------------------------------------------
; load NPCs
;-------------------------------------------------------------------------------
LoadSceneLoadNPCData:
	move.w	(a6)+,d7	; number of NPC slots in the scene
	move.w	#$0002,d6	; use d6 to track sprite ID
	lea	MEM_NPC0_SPRITE_ID,a0	; point a0 to the first NPC sprite
	cmpi.w	#(NPC_LIST_LENGTH-1),d7	; test to defend against my own stupidity
	bls.s	LoadSceneLoadNPCDataLoop	; did I add more NPCs than supported?
	move.w	#(NPC_LIST_LENGTH-1),d7	; set d7 to the max possible NPCs
LoadSceneLoadNPCDataLoop:
	move.w	d6,(a0)+	; ID
	move.w	(a6)+,(a0)+	; x
	move.w	(a6)+,(a0)+	; y
	move.w	#$0000,(a0)+ ; pattern
	move.w	(a6)+,(a0)+	; direction
	move.w	#$0000,(a0)+	; frame
	move.w	#$0000,(a0)+	; step counter
	move.w	#$0000,(a0)+	; move counter
	move.w	(a6)+,(a0)+	; movement frequency
	move.l	(a6)+,(a0)+	; movement pattern
	move.w	(a6)+,(a0)+	; movement pattern length
	move.w	#$0000,(a0)+	; movement index
	addq	#$1,d6	; increment sprite ID
	dbra    d7,LoadSceneLoadNPCDataLoop
LoadSceneLoadNPCSprites:
	; lookup which NPCs sprites are in this scene and add them
	move.w	#$0000,(MEM_ACTIVE_NPC_COUNT)	; reset active scene NPC count 
	lea	MEM_NPC_LOCATIONS,a1	; point a1 to the start of the list
	move.w	(MEM_ACTIVE_SCENE_ID),d5	; copy active scene ID to d5
	mulu.w	#NPC_LIST_LENGTH,d5	; multiply by list length
	adda.w	d5,a1	; add result to a1 to move to npc list for active scene
	;---------------------------------------------------------------------------
	; setup loop control - 2 NPCs per word in MEM_NPC_LOCATIONS
	;---------------------------------------------------------------------------
	move.w	#(NPC_LIST_LENGTH-1)/2,d3	; use d3 for loop control
	;---------------------------------------------------------------------------
	; loop through all NPCs in the scene and add their sprites
	;---------------------------------------------------------------------------
	move.w	#$0002,d2	; use d2 to track sprite ID
LoadSceneLoadNPCSpritesLoop:
	move.w	(a1)+,d4	; copy next NPC pair to d4
	move.w	d4,d5	; use d5 for first byte
	and.w	#$FF00,d5	; clear low byte	
	beq.s	.1	; branch if the result of the and is zero
	lsr.w	#$8,d5	; shift upper word to lower
	jsr	LoadNPC	; load this NPC sprite
.1	; second NPC in the pair
	move.w	d4,d5	; copy NPC pair to d5 again
	and.w	#$00FF,d5	; clear high byte
	beq.s	.2	; branch if the result of the and is zero
	jsr	LoadNPC	; load this NPC sprite
.2
	dbra d3,LoadSceneLoadNPCSpritesLoop	; loop
	; once all NPCs have been added, rebuild the object list
	bsr.w	BuildNPCObjectList


;-------------------------------------------------------------------------------
; setup to rebuild sprite order after loading new NPCs
;-------------------------------------------------------------------------------
	move.w	#$FFFF,(MEM_SPRITE_Y_ORDER_CHANGED)	; set to redraw sprite order
	move.w	#$FFFF,(MEM_PLAYER_SPRITE_LINK_TO)	; player is linking to nothing
	move.w	#$FFFF,(MEM_PLAYER_SPRITE_LINK_FROM)	; nothing links to player

ExitLoadScene:
	move.w	#$2000,sr		; re-enable interrupts
	rts

LoadNPC:
	lea	CharacterDefinitionStart,a2	; point a2 to the character definition
	; d5 contains NPC ID
	mulu.w	#CHARACTER_DEFINITION_SIZE,d5	; multiply to get NPC def location
	adda.w	d5,a2	; increment a2 to the NPC definition
	lea	MEM_NPC0_SPRITE_ID,a3	; point a3 to the first NPC memory location
	move.w	d2,d5	; d2 has sprite ID, copy it to d5
	subq	#$2,d5	; decrement to account for player sprite & sprite 0
	mulu.w	#NPC_RECORD_SIZE,d5	; multiply to get location
	adda.w	d5,a3	; increment a3 to the NPC memory location
	; load the tiles
	move.w	#SPRITE_TILESET_LWORDS,d0	; number of tiles in a sprite tileset
	movea.l	(a2)+,a0	; set address of first tile to load
	; calculate VDP write address
	move.l	d2,d1	; copy sprite ID to d1
	subq	#$1,d1	; subtract 1 to account for sprite 0 having no tiles
	mulu	#(SPRITE_TILESET_LWORDS*LWORD_SIZE),d1	; multiply to get location
	swap	d1	; move to upper word
	add.l	#SPRITE_VDP,d1 ; add base address
	; note - a0, d0, and d1 are modified by this call
	bsr.w	LoadTiles	; branch to LoadTiles subroutine
	; update base pattern
	move.w	(a2)+,(STRUCT_SPRITE_BASE_PATTERN,a3)
	; --------------------------------------------------------------------------
	; update x, y, and pattern in the sprite table
	; this could be optimized a bit to use fewer calculation
	; --------------------------------------------------------------------------
	; y
	move.l	d2,d6	; copy sprite ID to d1
	mulu.w	#$08,d6	; multiply sprite ID by 8 to get sprite array offset
	swap	d6	; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	(STRUCT_SPRITE_Y,a3),(VDP_DATA)			; copy the new y-coordinate
	; x
	move.w	d2,d6	; store sprite ID in d6
	mulu.w	#$08,d6	; multiply sprite ID by 8 to get sprite array offset
   	addq	#STRUCT_SPRITEDEF_X,d6		; move to x-coordinate
	swap	d6	; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	(STRUCT_SPRITE_X,a3),(VDP_DATA)			; copy the new y-coordinate
	; pattern
	move.w	d2,d6	; store sprite ID in d6
	mulu.w	#$08,d6	; multiply sprite ID by 8 to get sprite array offset
   	addq	#STRUCT_SPRITEDEF_PATTERN,d6		; move to x-coordinate
	swap	d6	; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	(STRUCT_SPRITE_BASE_PATTERN,a3),(VDP_DATA)	; copy the new pattern
	; block the sprite's initial map positon
	move.l	a6,a4	; workaround caused by my lack of planning
	move.l	a3,a6	; setup call to FlipSpriteMapPosition
	; note - a3, d5, d6, and d7 are modified by this call
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	move.l	a4,a6	; workaround caused by my lack of planning
ExitLoadNPC:
	addq	#$1,d2	; increment sprite ID
	addq	#$1,(MEM_ACTIVE_NPC_COUNT)	; increment active scene NPC count
	rts
