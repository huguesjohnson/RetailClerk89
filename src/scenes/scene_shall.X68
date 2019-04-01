SceneSouthHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0005	; tileset count - 1

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
	dc.l	SimpleTileFloorTilesStart	; start of left side floor tiles
	dc.l	SimpleTileFloorTilesEnd	; end of left side floor tiles

	; tileset 4
	dc.l	PhoneTilesStart	; start of phone tiles
	dc.l	PhoneTilesEnd	; end of phone tiles

	; tileset 5
	dc.l	Plant32x32TilesStart	; start of plant tiles
	dc.l	Plant32x32TilesEnd	; end of plant tiles


	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store04Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000E	; scenery count - 1

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
	dc.l	PatternSideEntranceFloorCarpet
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000001111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$004E0000	; initial drawing location

	; phone high
	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00200000	; initial drawing location

	; phone low
	dc.l	Pattern24x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00200000	; initial drawing location

	; phone high
	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$002A0000	; initial drawing location

	; phone low
	dc.l	Pattern24x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$002A0000	; initial drawing location

	; plant - left side
	dc.l	PatternLongPlant88High	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000100011		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C800000+$00020000	; initial drawing location

	dc.l	PatternLongPlant88Low	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000100011		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00020000	; initial drawing location

	; plant - right side
	dc.l	PatternLongPlant88High	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000100011		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C800000+$00380000	; initial drawing location

	dc.l	PatternLongPlant88Low	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000100011		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00380000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_PHONE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000100000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110000011000000

	dc.w	OBJ_SCENE_PHONE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000100101010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110000011000000

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011000010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000101001010

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011000101100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000101001010

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
	
	dc.l	MapStore04Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_PARKINGLOT	; south exit
	dc.w	SCENE_ID_SOUTH_CENTER	; north exit
	dc.w	SCENE_ID_POGODAWG	; west exit
	dc.w	SCENE_ID_NSHACK	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0001	; two npc slots
	
	; by the phone booth
	dc.w	$0104	; starting x location of npc0
	dc.w	$00E0	; starting y location of npc0
	dc.w	DIRECTION_UP	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NullMovementStart	; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	; by the exit
	dc.w	$0128	; starting x location of npc1
	dc.w	$0128	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc1
	dc.w	$FFFF	; movement frequency of npc1
	dc.l	NullMovementStart	; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length


	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

