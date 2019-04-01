SceneWWHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWHALL

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
	dc.l	CarpetFloorTilesStart
	dc.l	CarpetFloorTilesEnd

	; tileset 4
	dc.l	HallWestTilesStart	; start of hallway tiles
	dc.l	HallWestTilesEnd	; end of hallway tiles

	; tileset 5
	dc.l	NorthFrameRoundedTilesStart	; start of tiles for south frame
	dc.l	NorthFrameRoundedTilesEnd	; end of tiles for south frame

	; tileset 6
	dc.l	WoodFloorVTilesStart	; start of tiles for south floor
	dc.l	WoodFloorVTilesEnd	; end of tiles for south floor

	; tileset 7
	dc.l	BenchSimpleTilesStart	; start of bench tiles
	dc.l	BenchSimpleTilesEnd	; end of bench tiles

	; tileset 8
	dc.l	TrashCanTilesStart	; start of trash can tiles
	dc.l	TrashCanTilesEnd	; end of trash can tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store01Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000B	; scenery count - 1

	; floor
	dc.l	PatternFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011110	; base pattern
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

	; top border
	dc.l	PatternHallFloorBorder	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; floor
	dc.l	PatternHallFloor	; location of first pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100010	; base pattern
	dc.w	$0001	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B+$03000000	; initial drawing location

	; bottom border
	dc.l	PatternHallFloorBorder	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0C800000	; initial drawing location

	; south floor
	dc.l	PatternWoodFloorV	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111011
	dc.w	$0000	; no repeat 
	dc.l	VDP_VRAM_WRITE_B+$0D800000	; initial drawing location

	; south store frame - left side
	dc.l	PatternHallSouthFrameRoundedLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000100111	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; south store frame - right side
	dc.l	PatternHallSouthFrameRoundedRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000100111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00360000	; initial drawing location

	; bench
	dc.l	PatternBenchSimpleLong	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000000
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00140000	; initial drawing location

	; trash cans
	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00100000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$003C0000	; initial drawing location

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

	dc.w	OBJ_SCENE_TRASHCAN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000010111110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011011000

	dc.w	OBJ_SCENE_TRASHCAN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000101110010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011011000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1010000011010000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011100000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1010000100100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011100000

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
	dc.w	$0000	; one npc slot

	dc.w	$01F0	; starting x location of npc0
	dc.w	$00B4	; starting y location of npc0
	dc.w	DIRECTION_RIGHT	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NullMovementStart	; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

