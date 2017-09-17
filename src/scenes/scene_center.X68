SceneCenter:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CENTER

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0004	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	LargeStoreFrontTilesStart	; start of north store tiles
	dc.l	LargeStoreFrontTilesEnd	; end of north store tiles

	; tileset 2
	dc.l	TileFloorTilesStart	; start of hallway tiles
	dc.l	TileFloorTilesEnd	; end of hallway tiles

	; tileset 3
	dc.l	CarpetFloorTilesStart	; start of north floor tiles
	dc.l	CarpetFloorTilesEnd	; end of north floor tiles

	; tileset 4
	dc.l	BannerTilesStart	; start of north banner tiles
	dc.l	BannerTilesEnd	; end of north banner tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store03Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0003	; scenery count - 1

	; north floor
	dc.l	PatternFloor
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000010110	; base pattern
	dc.w	$0001	; repeat once
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; main floor
	dc.l	PatternTileFloor
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000010010	; base pattern
	dc.w	$000B	; repeat 12 times
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; north store frame
	dc.l	PatternLargeStoreFront ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; north store banner
	dc.l	PatternBanner ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00200000	; initial drawing location

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
	
	dc.l	MapStore03Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SOUTH_CENTER	; south exit
	dc.w	SCENE_ID_WORKSHOP	; north exit
	dc.w	SCENE_ID_WEHALL	; west exit
	dc.w	SCENE_ID_EWHALL	; east exit

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

