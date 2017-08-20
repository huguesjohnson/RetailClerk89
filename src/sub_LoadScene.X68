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
;---------------------------------------------------------------------------
; scene ID
;---------------------------------------------------------------------------
	move.w	(a6)+,(MEM_ACTIVE_SCENE_ID)	; scene ID

;-------------------------------------------------------------------------------
; load tiles and palettes then draw the scene
;-------------------------------------------------------------------------------
	bsr.w	DrawScene	; branch to subroutine to draw the scene

	move.w	#$2700,sr		; disable interrupts

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
	cmpi.w	#$0000,d7	; test if no collision data
	beq.s	LoadSceneLoadExits	; branch if no collision data
	movea.l	(a6)+,a0	; start address of collision data
	lea	MEM_COLLISION_DATA,a1	; store destination memory location
LoadSceneLoadMapCollisionLoop:
	move.l  (a0)+,(a1)+
	dbra    d7,LoadSceneLoadMapCollisionLoop

;-------------------------------------------------------------------------------
; load scene exits
;-------------------------------------------------------------------------------
LoadSceneLoadExits:
	move.w	(a6)+,(MEM_ACTIVE_SCENE_EXIT_S)	; north exit of active scene
	move.w	(a6)+,(MEM_ACTIVE_SCENE_EXIT_N)	; south exit of active scene
	move.w	(a6)+,(MEM_ACTIVE_SCENE_EXIT_W)	; east exit of active scene
	move.w	(a6)+,(MEM_ACTIVE_SCENE_EXIT_E)	; west exit of active scene

;-------------------------------------------------------------------------------
; load sprite zero and player sprite
;-------------------------------------------------------------------------------
LoadSpriteZeroTiles:
	bsr.w	WaitVBlank	; added to resolve issue running in Genecyst
	movea.l	#SpriteZeroTilesStart,a0	; set address of first tile to load
	move.w	#SPRITE_VDP,d1	; setup call to BuildVRAMWriteAddress
	bsr.w	BuildVRAMWriteAddress	; build the VRAM write address
	move.w	#$8,d0	; number of tiles in a sprite tileset
	bsr.w	LoadTiles	; branch to LoadTiles subroutine

LoadPlayerSpriteTiles:
	bsr.w	WaitVBlank	; added to resolve issue running in Genecyst
	movea.l	#PlayerSpriteTilesStart,a0	; set address of first tile to load
	move.w	#PLAYER_SPRITE_VDP,d1	; setup call to BuildVRAMWriteAddress
	bsr.w	BuildVRAMWriteAddress	; build the VRAM write address
	move.w	#SPRITE_TILESET_LWORDS,d0	; number of tiles in a sprite tileset
	bsr.w	LoadTiles	; branch to LoadTiles subroutine

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
	move.w	#(NPC_LIST_LENGTH/2)-1,d3	; use d3 for loop control
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
	bsr.w	SetDefaultSpriteOrder	; set the initial sprite order
	move.w	#$FFFF,(MEM_SPRITE_Y_ORDER_CHANGED)	; flag to sort sprite order

;-------------------------------------------------------------------------------
; load & start the background music
;-------------------------------------------------------------------------------
	movea.l	(a6)+,a0	; address of the BGM
	cmp.l	#$00000000,a0	; test if there is background music to play
	bne.s	LoadScenePlayBGM	; there is music to play
	bsr Echo_StopBGM	; otherwise stop the background music
	bra.s	ExitLoadScene	; move on
LoadScenePlayBGM:
	bsr Echo_PlayBGM	; start the background music

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
	subq	#$2,d5	; decrement to account for player sprite
	mulu.w	#NPC_RECORD_SIZE,d5	; multiply to get location
	adda.w	d5,a3	; increment a3 to the NPC memory location
	movea.l	(a2)+,a0	; set address of first tile to load
	; calculate VDP write address
	move.w	d2,d1	; copy sprite ID to d1
	subq.w	#$1,d1	; subtract 1 to account for zero indexing
	mulu.w	#(SPRITE_TILESET_LWORDS*LWORD_SIZE),d1	; multiply to get location
	add.w	#PLAYER_SPRITE_VDP,d1
	bsr.w	BuildVRAMWriteAddress	; build VRAM write address
	;swap	d1	; move to upper word
	;add.l	#PLAYER_SPRITE_VDP,d1 ; add base address
	; load the tiles
	move.w	#SPRITE_TILESET_LWORDS,d0	; number of tiles in a sprite tileset
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
   	addq	#STRUCT_SPRITEDEF_PATTERN,d6		; move to pattern
	swap	d6	; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	(STRUCT_SPRITE_BASE_PATTERN,a3),(VDP_DATA)	; copy the new pattern
	if	_SPRITE_COLLISION_
	; block the sprite's initial map positon
	move.l	a6,a4	; workaround caused by my lack of planning
	move.l	a3,a6	; setup call to FlipSpriteMapPosition
	; note - a3, d5, d6, and d7 are modified by this call
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	move.l	a4,a6	; workaround caused by my lack of planning
	endif
ExitLoadNPC:
	addq	#$1,d2	; increment sprite ID
	addq	#$1,(MEM_ACTIVE_NPC_COUNT)	; increment active scene NPC count
	rts
