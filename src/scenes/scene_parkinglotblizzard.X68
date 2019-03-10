SceneParkingLotBlizzard:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_PARKINGLOT_BLIZZARD

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	SnowTilesStart	; start of snow tiles
	dc.l	SnowTilesEnd	; end of snow tiles

	; tileset 2
	dc.l	MallExteriorTilesStart	; start of mall exterior tiles
	dc.l	MallExteriorTilesEnd	; end of mall exterior tiles

	; tileset 3
	dc.l	TileFloorTilesStart	; start of hallway tiles
	dc.l	TileFloorTilesEnd	; end of hallway tiles
	
	; tileset 4
	dc.l	ParkingLotEdgeBlizzardTilesStart	; start of edge tiles
	dc.l	ParkingLotEdgeBlizzardTilesEnd	; end of edge tiles

	; tileset 5
	dc.l	MallSignTilesStart	; start of mall sign tiles
	dc.l	MallSignTilesEnd	; end of mall sign tiles

	; tileset 6
	dc.l	SnowFallingTilesStart	; start of snow falling tiles
	dc.l	SnowFallingTilesEnd	; end of snow falling tiles

	; tileset 7
	dc.l	JunkerCarSnowTilesStart	; start of junker car tiles
	dc.l	JunkerCarSnowTilesEnd	; end of junker car tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	CutSceneParkingLotBlizzardPalettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0009	; scenery count - 1

	; north mall floor
	dc.l	PatternTileFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000010101	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; snow
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$000B	; repeat 12 times
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; mall exterior - sign
	dc.l	PatternMallExteriorSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000110001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00180000	; initial drawing location

	; mall exterior - left side
	dc.l	PatternMallExteriorSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; mall exterior - right side
	dc.l	PatternMallExteriorSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000	; initial drawing location

	; left edge
	dc.l	PatternParkingLotEdgeLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011001	; base pattern
	dc.w	$0002	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; right edge
	dc.l	PatternParkingLotEdgeRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011001	; base pattern
	dc.w	$0002	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B+$004C0000+$02000000	; initial drawing location

	; car
	dc.l	Pattern88x48	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000101	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00360000+$06000000	; initial drawing location

	; falling snow
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000110101	; base pattern
	dc.w	$000B	; repeat 12 times
	dc.l	VDP_VRAM_WRITE_A+$02000000	; initial drawing location

	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000110101	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_DANICAR
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011000101011001
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101010011100010

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
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	DEFAULT_COLLISION_DATA_SIZE	; collision data size
	
	dc.l	MapStore05Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_SHALL	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0185	; starting x location of npc0
	dc.w	$00CF	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NullMovementStart	; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

