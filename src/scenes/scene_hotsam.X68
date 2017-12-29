SceneHotSam:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_HOTSAM

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	SimpleTileFloorTilesStart	; start of left side floor tiles
	dc.l	SimpleTileFloorTilesEnd	; end of left side floor tiles

	; tileset 2
	dc.l	SideStoreEntranceSquareTilesStart	; start of side entrance tiles
	dc.l	SideStoreEntranceSquareTilesEnd	; end of side entrance tiles

	; tileset 3
	dc.l	StoreFrameTilesStart	; start of frame tiles
	dc.l	StoreFrameTilesEnd	; end of frame tiles

	; tileset 4
	dc.l	BorderedCounterTilesStart	; start of counter tiles
	dc.l	BorderedCounterTilesEnd	; end of counter tiles

	; tileset 5
	dc.l	HotSamSceneryTilesStart	; start of scenery tiles
	dc.l	HotSamSceneryTilesEnd	; end of scenery tiles

	; tileset 6
	dc.l	RegisterAlt3TilesStart	; start of register tiles
	dc.l	RegisterAlt3TilesEnd	; end of register tiles

	; tileset 7
	dc.l	TrashTilesStart	; start of trash tiles
	dc.l	TrashTilesEnd	; end of trash tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store0FPalettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$001A	; scenery count - 1

	; floor
	dc.l	PatternTileFloorSimple
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; right entrance - top
	dc.l	PatternSideEntranceRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$004E0000	; initial drawing location

	; right entrance - bottom
	dc.l	PatternSideEntranceRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000+$004E0000	; initial drawing location

	; left side - top
	dc.l	PatternSideEntranceLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; left side - bottom
	dc.l	PatternSideEntranceLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; south wall
	dc.l	PatternFrameSouthClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; top
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; main counter
	dc.l	PatternCounterLow24x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000010001	; base pattern
	dc.w	$0017	; repeat 24 times
	dc.l	VDP_VRAM_WRITE_B+$000A0000+$00800000	; initial drawing location

	; south counter
	dc.l	PatternCounterLow272x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$000A0000+$0C800000	; initial drawing location

	; counter seating
	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00180000+$0B800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00240000+$0B800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00300000+$0B800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$0B800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00480000+$0B800000	; initial drawing location

	; tables
	dc.l	PatternCounterLow24x40
	dc.w	%0010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$001C0000+$00800000	; initial drawing location

	dc.l	PatternBenchSeatLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$00800000	; initial drawing location

	dc.l	PatternBenchSeatRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00220000+$00800000	; initial drawing location

	dc.l	PatternCounterLow24x40
	dc.w	%0010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$002E0000+$00800000	; initial drawing location

	dc.l	PatternBenchSeatLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$002C0000+$00800000	; initial drawing location

	dc.l	PatternBenchSeatRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00340000+$00800000	; initial drawing location

	dc.l	PatternCounterLow24x40
	dc.w	%0010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00400000+$00800000	; initial drawing location

	dc.l	PatternBenchSeatLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003E0000+$00800000	; initial drawing location

	dc.l	PatternBenchSeatRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00460000+$00800000	; initial drawing location

	; registers
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$03000000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$08000000	; initial drawing location

	; trash on tables & counter
	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$0C800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00420000+$00800000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_TABLE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0101000011101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_TABLE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0101000100110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_TABLE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0101000101111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_TRASH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010011110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000101001000

	dc.w	OBJ_SCENE_REGISTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000010101010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010110000

	dc.w	OBJ_SCENE_REGISTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000010101010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000100000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	DEFAULT_COLLISION_DATA_SIZE	; collision data size
	
	dc.l	MapStore0FCollision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	SCENE_ID_SHALL	; east exit

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

