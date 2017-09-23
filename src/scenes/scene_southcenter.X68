SceneSouthCenter:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SOUTH_CENTER

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0004	; tileset count - 1

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

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store17Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0006	; scenery count - 1

	; main floor
	dc.l	PatternTileFloor
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top left entrance
	dc.l	PatternSideEntranceLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; bottom left entrance
	dc.l	PatternSideEntranceLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; left side entrance floor
	dc.l	PatternSideEntranceFloorCarpet
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000001011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000	; initial drawing location

	; top right entrance
	dc.l	PatternSideEntranceRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$004E0000	; initial drawing location

	; bottom right entrance
	dc.l	PatternSideEntranceRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000+$004E0000	; initial drawing location

	; right side entrance floor
	dc.l	PatternSideEntranceFloorWood
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000001111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$004E0000	; initial drawing location

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
	
	dc.l	MapStore17Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SHALL	; south exit
	dc.w	SCENE_ID_CENTER	; north exit
	dc.w	SCENE_ID_JOCKITCH	; west exit
	dc.w	SCENE_ID_DENIMCOUNTRY	; east exit

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

