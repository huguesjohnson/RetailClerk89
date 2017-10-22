SceneDeminCountry:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_DENIMCOUNTRY

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0008	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	WoodFloorVTilesStart	; start of right side floor tiles
	dc.l	WoodFloorVTilesEnd	; end of right side floor tiles

	; tileset 2
	dc.l	SideStoreEntranceSquareTilesStart	; start of side entrance tiles
	dc.l	SideStoreEntranceSquareTilesEnd	; end of side entrance tiles

	; tileset 3
	dc.l	StoreFrameTilesStart	; start of frame tiles
	dc.l	StoreFrameTilesEnd	; end of frame tiles

	; tileset 4
	dc.l	AccentedCounterTilesStart	; start of counter top tiles
	dc.l	AccentedCounterTilesEnd	; end of counter top tiles

	; tileset 5
	dc.l	TableTilesStart	; start of table tiles
	dc.l	TableTilesEnd	; end of table tiles

	; tileset 6
	dc.l	RegisterTilesStart	; start of register tiles
	dc.l	RegisterTilesEnd	; end of register tiles

	; tileset 7
	dc.l	CounterShelvesTilesStart	; start of counter shelf tiles
	dc.l	CounterShelvesTilesEnd	; end of counter shelf tiles

	; tileset 8
	dc.l	DenimCountryMerchandiseTilesStart	; start of merchandise tiles
	dc.l	DenimCountryMerchandiseTilesEnd	; end of merchandise tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store08Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0015	; scenery count - 1

	; main floor
	dc.l	PatternWoodFloorV
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left entrance - top
	dc.l	PatternSideEntranceLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; left entrance - bottom
	dc.l	PatternSideEntranceLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; top entrance - left side
	dc.l	PatternFrameTopOpenLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; top entrance - right side
	dc.l	PatternFrameTopOpenRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

	; right side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; south wall
	dc.l	PatternFrameSouthClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile72x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00080000+$04000000	; initial drawing location

	dc.l	Pattern3Tile72x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00080000+$04800000	; initial drawing location

	; counter side
	dc.l	PatternCounterSide24x64OpenLowerLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00140000+$00800000	; initial drawing location

	; counter high
	dc.l	PatternCounterHigh48x8OpenLowerRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000011111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$02800000	; initial drawing location

	; counter low
	dc.l	PatternCounterLow48x24OpenTopRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$03000000	; initial drawing location

	; register
	dc.l	PatternRegister	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1110000000111000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00140000+$01800000	; initial drawing location

	; tables
	dc.l	PatternTableHigh72x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$02800000	; initial drawing location

	dc.l	PatternTableLow72x40
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$03000000	; initial drawing location

	dc.l	PatternTableHigh72x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$06800000	; initial drawing location

	dc.l	PatternTableLow72x40
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$07000000	; initial drawing location

	dc.l	PatternTableHigh72x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$06800000	; initial drawing location

	dc.l	PatternTableLow72x40
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$07000000	; initial drawing location

	; stuff on tables
	dc.l	Pattern56x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$07000000	; initial drawing location

	dc.l	Pattern56x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00380000+$03000000	; initial drawing location

	dc.l	Pattern56x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00380000+$07000000	; initial drawing location

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
	dc.w	OBJ_SCENE_REGISTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000011010000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010011010

	dc.w	OBJ_SCENE_DC_JEANS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	dc.w	OBJ_SCENE_DC_JEANS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111101011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010101000

	dc.w	OBJ_SCENE_DC_JEANS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111101011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

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
	
	dc.l	MapStore08Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_EWHALL	; north exit
	dc.w	SCENE_ID_SOUTH_CENTER	; west exit
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

