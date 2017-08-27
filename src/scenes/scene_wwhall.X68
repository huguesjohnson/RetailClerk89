SceneWWHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0004	; five tilesets

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	StoreVBFloorTilesStart	; start of floor tiles
	dc.l	StoreVBFloorTilesEnd	; end of floor tiles

	; tileset 2
	dc.l	StoreVBFrameTilesStart	; start of frame tiles
	dc.l	StoreVBFrameTilesEnd	; end of frame tiles

	; tileset 3
	dc.l	StoreVBStoreFrontTilesStart	; start of front tiles
	dc.l	StoreVBStoreFrontTilesEnd	; end of front tiles

	; tileset 4
	dc.l	HallWestTilesStart	; start of hallway tiles
	dc.l	HallWestTilesEnd	; end of hallway tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store01Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0006	; scenery count

	; floor
	dc.l	PatternFloor	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000001	
	dc.w	$0001	; base pattern
	dc.w	$0001	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; store front frame
	dc.l	PatternStoreFrontFrame	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000001100	
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

	; top border
	dc.l	PatternHallFloorBorder	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000011110	
	dc.w	$201E	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000	; initial drawing location

	; floor
	dc.l	PatternHallFloor	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000011110	
	dc.w	$201E	; base pattern
	dc.w	$0001	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B+$03000000	; initial drawing location

	; bottom border
	dc.l	PatternHallFloorBorder	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000011110	
	dc.w	$201E	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0C800000	; initial drawing location

	; south store frame
	dc.l	PatternHallSouthFrame	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000001100	
	dc.w	$8000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0D800000	; initial drawing location

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
	
	dc.l	MapStore01Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TBOOKS	; south exit
	dc.w	SCENE_ID_VB	; north exit
	dc.w	SCENE_ID_FCBCHECKOUT	; west exit
	dc.w	SCENE_ID_WEHALL	; east exit

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

