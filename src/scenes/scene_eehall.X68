SceneEEHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_EEHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0009	; tileset count - 1

	; tileset 01
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	WoodFloorHTilesStart
	dc.l	WoodFloorHTilesEnd

	; tileset 2
	dc.l	WoodFloorSlopedTilesStart
	dc.l	WoodFloorSlopedTilesEnd

	; tileset 3
	dc.l	WindowAngledTilesStart	; start of north window tiles
	dc.l	WindowAngledTilesEnd	; end of north window tiles

	; tileset 4
	dc.l	StoreFrameTilesStart	; start of south frame tiles
	dc.l	StoreFrameTilesEnd	; end of south frame tiles

	; tileset 5
	dc.l	TileFloorTilesStart	; start of south floor tiles
	dc.l	TileFloorTilesEnd	; end of south floor tiles

	; tileset 6
	dc.l	BlackLightFloorTilesStart	; start of north floor tiles
	dc.l	BlackLightFloorTilesEnd	; end of north floor tiles

	; tileset 7
	dc.l	Plant32x32TilesStart	; start of plant tiles
	dc.l	Plant32x32TilesEnd	; end of plant tiles

	; tileset 8
	dc.l	BenchSimpleTilesStart	; start of bench tiles
	dc.l	BenchSimpleTilesEnd	; end of bench tiles

	; tileset 9
	dc.l	ArcadeLogoTilesStart ; start of arcade logo tiles
	dc.l	ArcadeLogoTilesEnd ; end of arcade logo tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store07Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000D	; scenery count - 1

	; north floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; main floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000001001	; base pattern
	dc.w	$0004	; repeat 5 times
	dc.l	VDP_VRAM_WRITE_B+$03000000	; initial drawing location

	; top border
	dc.l	PatternWoodFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000	; initial drawing location

	; bottom border
	dc.l	PatternWoodFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0C800000	; initial drawing location

	; store front - left
	dc.l	PatternWindowAngledLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; store front - center
	dc.l	PatternWindowAngledCenter	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000	; initial drawing location

	; store front - right
	dc.l	PatternWindowAngledRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

	; south store frame - left side
	dc.l	PatternHallSouthFrameLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101101		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; south store frame - right side
	dc.l	PatternHallSouthFrameRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101101		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00360000	; initial drawing location

	; south store floor
	dc.l	PatternTileFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110101		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0D800000	; initial drawing location

	; plant
	dc.l	PatternLongPlantLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001001		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$000C0000	; initial drawing location

	dc.l	PatternLongPlantHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001001001		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$000C0000	; initial drawing location

	; benches
	dc.l	PatternBenchSimpleLonger	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001011001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08000000+$000C0000	; initial drawing location

	; arcade logo
	dc.l	Pattern72x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001011101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00000000+$001E0000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110010010110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110010100100010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110010010110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011100000

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110010100100010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011100000

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
	
	dc.l	MapStore07Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TLODGE	; south exit
	dc.w	SCENE_ID_CAVERN	; north exit
	dc.w	SCENE_ID_EWHALL	; west exit
	dc.w	SCENE_ID_SVIDEO	; east exit

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

