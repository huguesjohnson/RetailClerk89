SceneNShack:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_NSHACK

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count - 1

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
	dc.l	AccentedCounterTilesStart	; start of counter tiles
	dc.l	AccentedCounterTilesEnd	; end of counter tiles

	; tileset 5
	dc.l	CounterShelvesAltTilesStart	; start of counter shelf tiles
	dc.l	CounterShelvesAltTilesEnd	; end of counter shelf tiles

	; tileset 6
	dc.l	NShackSceneryTilesStart	; start of scenery tiles
	dc.l	NShackSceneryTilesEnd	; end of scenery tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store0EPalettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0010	; scenery count - 1

	; floor
	dc.l	PatternTileFloorSimple
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left entrance - top
	dc.l	PatternSideEntranceLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; left entrance - bottom
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

	; right side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; top
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile80x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011011	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$001E0000+$04000000	; initial drawing location

	; counter
	dc.l	PatternCounterHigh80x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$02800000	; initial drawing location

	dc.l	PatternCounterLow80x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$03000000	; initial drawing location

	; display cases
	dc.l	PatternNShackDisplayCaseHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000011110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$02000000	; initial drawing location

	dc.l	PatternNShackDisplayCaseLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$02800000	; initial drawing location

	dc.l	PatternNShackDisplayCaseHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000011110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00320000+$02000000	; initial drawing location

	dc.l	PatternNShackDisplayCaseLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00320000+$02800000	; initial drawing location

	; barrels
	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00320000+$07800000	; initial drawing location

	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00400000+$07800000	; initial drawing location

	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00160000+$07800000	; initial drawing location

	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$07800000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_NUTCASE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110000010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100100010100100

	dc.w	OBJ_SCENE_NUTCASE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110000101001010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100100010100100

	dc.w	OBJ_SCENE_NUTBARREL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011111000

	dc.w	OBJ_SCENE_NUTBARREL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000011011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011111000

	dc.w	OBJ_SCENE_NUTBARREL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000101001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011111000

	dc.w	OBJ_SCENE_NUTBARREL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000110000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011111000

	dc.w	OBJ_SCENE_COUNTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1010000011111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100100010100100

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
	
	dc.l	MapStore0ECollision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	$FFFF	; north exit
	dc.w	SCENE_ID_SHALL	; west exit
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

