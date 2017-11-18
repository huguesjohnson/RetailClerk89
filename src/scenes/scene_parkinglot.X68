SceneParkingLot:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_PARKINGLOT

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	PavementTilesStart	; start of pavement tiles
	dc.l	PavementTilesEnd	; end of pavement tiles

	; tileset 2
	dc.l	MallExteriorTilesStart	; start of mall exterior tiles
	dc.l	MallExteriorTilesEnd	; end of mall exterior tiles

	; tileset 3
	dc.l	TileFloorTilesStart	; start of hallway tiles
	dc.l	TileFloorTilesEnd	; end of hallway tiles

	; tileset 4
	dc.l	ParkingStripeTilesStart	; start of parking stripe tiles
	dc.l	ParkingStripeTilesEnd	; end of parking stripe tiles
	
	; tileset 5
	dc.l	ParkingLotEdgeTilesStart	; start of edge tiles
	dc.l	ParkingLotEdgeTilesEnd	; end of edge tiles

	; tileset 6
	dc.l	MallSignTilesStart	; start of mall sign tiles
	dc.l	MallSignTilesEnd	; end of mall sign tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store05Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0012	; scenery count

	; north mall floor
	dc.l	PatternTileFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000010101	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; pavement
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000B	; repeat 12 times
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; mall exterior - sign
	dc.l	PatternMallExteriorSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000110100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00180000	; initial drawing location

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
	dc.w	%0010000000011100	; base pattern
	dc.w	$0002	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; right edge
	dc.l	PatternParkingLotEdgeRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011100	; base pattern
	dc.w	$0002	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B+$004C0000+$02000000	; initial drawing location

	; parking stripes
	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$02000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$04000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$06000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$08000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$0A000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$0C000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$02000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$04000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$06000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$08000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$0A000000	; initial drawing location

	dc.l	PatternParkingStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$0C000000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

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

