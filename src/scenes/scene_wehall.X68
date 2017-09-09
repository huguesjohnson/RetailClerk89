SceneWEHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WEHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0005	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	HallWestTilesStart	; start of hallway tiles
	dc.l	HallWestTilesEnd	; end of hallway tiles

	; tileset 2
	dc.l	WindowAngledTilesStart	; start of north window tiles
	dc.l	WindowAngledTilesEnd	; end of north window tiles

	; tileset 3
	dc.l	TileFloorTilesStart	; start of north floor tiles
	dc.l	TileFloorTilesEnd	; end of north floor tiles

	; tileset 4
	dc.l	CarpetFloorTilesStart	; start of south floor tiles
	dc.l	CarpetFloorTilesEnd	; end of south floor tiles

	; tileset 5
	dc.l	StoreFrameTilesStart	; start of south frame tiles
	dc.l	StoreFrameTilesEnd	; end of south frame tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store02Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0009	; scenery count - 1

	; north store floor border
	dc.l	PatternTileFloor	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000011010	
	dc.w	$001A	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top border
	dc.l	PatternHallFloorBorder	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000000001	
	dc.w	$2001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000	; initial drawing location

	; store front - left
	dc.l	PatternWindowAngledLeft	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000110	
	dc.w	$0006	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; store front - center
	dc.l	PatternWindowAngledCenter	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000000110	
	dc.w	$8006	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000	; initial drawing location

	; store front - right
	dc.l	PatternWindowAngledRight	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000110	
	dc.w	$0006	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

	; floor
	dc.l	PatternHallFloor	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000000001	
	dc.w	$2001	; base pattern
	dc.w	$0001	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B+$03000000	; initial drawing location

	; bottom border
	dc.l	PatternHallFloorBorder	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000000001	
	dc.w	$2001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0C800000	; initial drawing location

	; south store floor
	dc.l	PatternTileFloor	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0100000000011110	
	dc.w	$401E	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0D800000	; initial drawing location

	; south store frame - left side
	dc.l	PatternHallSouthFrame	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1100000000100010	
	dc.w	$C022	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; south store frame - right side
	dc.l	PatternHallSouthFrame	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1100000000100010	
	dc.w	$C022	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00360000	; initial drawing location

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
	
	dc.l	MapStore02Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_JOCKITCH	; south exit
	dc.w	SCENE_ID_CPLANET	; north exit
	dc.w	SCENE_ID_WWHALL	; west exit
	dc.w	SCENE_ID_CENTER	; east exit

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

