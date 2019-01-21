SceneWEHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WEHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0009	; tileset count - 1

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

	; tileset 6
	dc.l	TackyFloorTilesStart	; start of center floor tiles
	dc.l	TackyFloorTilesEnd	; end of center floor tiles

	; tileset 7
	dc.l	BenchSimpleTilesStart	; start of bench tiles
	dc.l	BenchSimpleTilesEnd	; end of bench tiles

	; tileset 8
	dc.l	PosterTilesStart	; start of poster tiles
	dc.l	PosterTilesEnd	; end of poster tiles

	; tileset 9
	dc.l	CPlanetLogoTilesStart	; start of logo tiles
	dc.l	CPlanetLogoTilesEnd	; end of logo tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store02Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0017	; scenery count - 1

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
	dc.l	PatternHallSouthFrameLeft	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1100000000100010	
	dc.w	$C022	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; south store frame - right side
	dc.l	PatternHallSouthFrameRight	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1100000000100010	
	dc.w	$C022	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00360000	; initial drawing location

	; center floor
	dc.l	PatternTackyFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$05000000+$000C0000	; initial drawing location

	; benches
	dc.l	PatternBenchSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00100000	; initial drawing location

	dc.l	PatternBenchSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$04800000+$01E0000	; initial drawing location

	dc.l	PatternBenchSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$04800000+$002C0000	; initial drawing location

	dc.l	PatternBenchSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$04800000+$003A0000	; initial drawing location

	dc.l	PatternBenchSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$08000000+$00100000	; initial drawing location

	dc.l	PatternBenchSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$08000000+$01E0000	; initial drawing location

	dc.l	PatternBenchSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$08000000+$002C0000	; initial drawing location

	dc.l	PatternBenchSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$08000000+$003A0000	; initial drawing location

	; posters
	dc.l	PatternPoster	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110011	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00040000+$00800000	; initial drawing location

	dc.l	PatternPoster	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00120000+$00800000	; initial drawing location

	dc.l	PatternPoster	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$003a0000+$00800000	; initial drawing location

	dc.l	PatternPoster	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001000101	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00460000+$00800000	; initial drawing location

	; north logo
	dc.l	Pattern32x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001001011	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00240000+$00000000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	;---------------------------------------------------------------------------
	; word0=Object ID (0-65535)
	; word1[0-8]=x0 (0-511)
	; word1[9-15]=width (0-127)
	; word2[0-8]=y0 (0-512)
	; word2[9-15]=height (0-127)
	;---------------------------------------------------------------------------

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000011000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000011111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000100110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000101101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000011000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000011111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000100110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000101101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

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
	dc.w	SCENE_ID_CNOW	; south exit
	dc.w	SCENE_ID_CPLANET	; north exit
	dc.w	SCENE_ID_WWHALL	; west exit
	dc.w	SCENE_ID_CENTER	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot

	dc.w	$010E	; starting x location of npc0
	dc.w	$00D8	; starting y location of npc0
	dc.w	DIRECTION_RIGHT	; starting direction of npc0
	dc.w	$0060	; movement frequency of npc0
	dc.l	NPCMovementScene02Start	; location of movement pattern for npc0
	dc.w	(NPCMovementScene02End-NPCMovementScene02Start-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

