SceneSouthCenter:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SOUTH_CENTER

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	TileFloorTilesStart	; start of hallway tiles
	dc.l	TileFloorTilesEnd	; end of hallway tiles

	; tileset 2
	dc.l	SideStoreEntranceSquareTilesStart	; start of side entrance tiles
	dc.l	SideStoreEntranceSquareTilesEnd	; end of side entrance tiles

	; tileset 3
	dc.l	CarpetFloorTilesStart	; start of left side floor tiles
	dc.l	CarpetFloorTilesEnd	; end of left side floor tiles

	; tileset 4
	dc.l	WoodFloorVTilesStart	; start of right side floor tiles
	dc.l	WoodFloorVTilesEnd	; end of right side floor tiles

	; tileset 5
	dc.l	BorderedCounterTilesStart	; start of counter top tiles
	dc.l	BorderedCounterTilesEnd	; end of counter top tiles

	; tileset 6
	dc.l	CounterShelvesAltTilesStart	; start of counter shelf tiles
	dc.l	CounterShelvesAltTilesEnd	; end of counter shelf tiles

	; tileset 7
	dc.l	KioskShelvesTilesStart	; start of kiosk shelf tiles
	dc.l	KioskShelvesTilesEnd	; end of kiosk shelf tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store17Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000A	; scenery count - 1

	; main floor
	dc.l	PatternTileFloor
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top left entrance
	dc.l	PatternSideEntranceLeftTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; bottom left entrance
	dc.l	PatternSideEntranceLeftBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; left side entrance floor
	dc.l	PatternSideEntranceFloorCarpet
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000001111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000	; initial drawing location

	; top right entrance
	dc.l	PatternSideEntranceRightTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$004E0000	; initial drawing location

	; bottom right entrance
	dc.l	PatternSideEntranceRightBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000+$004E0000	; initial drawing location

	; right side entrance floor
	dc.l	PatternSideEntranceFloorWood
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000010011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$004E0000	; initial drawing location

	; shelves under counter
	dc.l	PatternBoothMerch112x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$001A0000+$07800000	; initial drawing location

	; kiosk counter
	dc.l	PatternCounterLow112x80Closed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$03000000+$001A0000	; initial drawing location

	; kiosk shelves
	dc.l	PatternKioskShelves
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02800000+$001E0000	; initial drawing location

	; kiosk shelves
	dc.l	PatternKioskShelves
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02800000+$00280000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_KIOSK
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1101111011101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%1011000010110000

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
	
	dc.l	MapStore17Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SHALL	; south exit
	dc.w	SCENE_ID_CENTER	; north exit
	dc.w	SCENE_ID_CNOW	; west exit
	dc.w	SCENE_ID_DENIMCOUNTRY	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot

	dc.w	$015C	; starting x location of npc0
	dc.w	$00E6	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$00F0	; movement frequency of npc0
	dc.l	NPCMovementScene17Start	; location of movement pattern for npc0
	dc.w	(NPCMovementScene17End-NPCMovementScene17Start-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

