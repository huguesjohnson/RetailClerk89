SceneEWHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_EWHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0008	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	StoreFrameTilesStart
	dc.l	StoreFrameTilesEnd

	; tileset 2
	dc.l	StoreFrontWindowTilesStart
	dc.l	StoreFrontWindowTilesEnd

	; tileset 3
	dc.l	TileFloorTilesStart
	dc.l	TileFloorTilesEnd

	; tileset 4
	dc.l	SimpleTileFloorTilesStart
	dc.l	SimpleTileFloorTilesEnd

	; tileset 5
	dc.l	WoodFloorHTilesStart
	dc.l	WoodFloorHTilesEnd

	; tileset 6
	dc.l	WoodFloorSlopedTilesStart
	dc.l	WoodFloorSlopedTilesEnd

	; tileset 7
	dc.l	WoodFloorVTilesStart
	dc.l	WoodFloorVTilesEnd

	; tileset 8
	dc.l	Plant32x64TilesStart	; start of plant tiles
	dc.l	Plant32x64TilesEnd	; end of plant tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store06Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000C	; scenery count - 1

	; north floor
	dc.l	PatternTileFloorSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100010	; base pattern
	dc.w	$0001	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; store front frame
	dc.l	PatternStoreFrontFrame	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000000000	
	dc.w	$8000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; store front
	dc.l	PatternStoreFront	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000000	
	dc.w	$0000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; main floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101100	; base pattern
	dc.w	$0004	; repeat 5 times
	dc.l	VDP_VRAM_WRITE_B+$03000000	; initial drawing location

	; top border
	dc.l	PatternWoodFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000	; initial drawing location

	; bottom border
	dc.l	PatternWoodFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0C800000	; initial drawing location

	; south floor
	dc.l	PatternWoodFloorV	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0100000000100100	
	dc.w	$403E	; base pattern
	dc.w	$0000	; no repeat 
	dc.l	VDP_VRAM_WRITE_B+$0D800000	; initial drawing location

	; south store frame - left side
	dc.l	PatternHallSouthFrame	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; south store frame - right side
	dc.l	PatternHallSouthFrame	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00360000	; initial drawing location

	; plants
	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001001100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00100000	; initial drawing location

	dc.l	Pattern32x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00100000	; initial drawing location

	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001001100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00380000	; initial drawing location

	dc.l	Pattern32x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00380000	; initial drawing location



	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_TREE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000011000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011110100

	dc.w	OBJ_SCENE_TREE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000101100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011110100

	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	DEFAULT_COLLISION_DATA_SIZE	; collision data size
	
	dc.l	MapStore06Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_DENIMCOUNTRY	; south exit
	dc.w	SCENE_ID_CHECKERS	; north exit
	dc.w	SCENE_ID_CENTER	; west exit
	dc.w	SCENE_ID_EEHALL	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc0
	dc.w	$0000	; starting y location of npc0
	dc.w	DIRECTION_LEFT	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NullMovementStart	; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

