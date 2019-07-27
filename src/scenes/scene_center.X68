SceneCenter:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CENTER

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count - 1

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

	; tileset 5
	dc.l	Plant24x32TilesStart ; start of plant tiles
	dc.l	Plant24x32TilesEnd	; end of plant tiles

	; tileset 6
	dc.l	InfoDeskTilesStart	; start of info desk tiles
	dc.l	InfoDeskTilesEnd	; start of info desk tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store03Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000A	; scenery count - 1

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
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; north floor
	dc.l	PatternFloor48x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000010110	; base pattern
	dc.w	$0001	; repeat once
	dc.l	VDP_VRAM_WRITE_B+$00220000	; initial drawing location

	; north store banner
	dc.l	PatternBanner ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00200000	; initial drawing location

	; plants
	dc.l	Pattern24x32 ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00020000	; initial drawing location

	dc.l	Pattern24x32 ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00120000	; initial drawing location

	dc.l	Pattern24x32 ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00380000	; initial drawing location

	dc.l	Pattern24x32 ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00480000	; initial drawing location

	; info desk low
	dc.l	PatternInfoDeskLow ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$08000000+$00140000	; initial drawing location

	; info desk high
	dc.l	PatternInfoDeskHigh ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000110110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00140000	; initial drawing location

	; info desk sign
	dc.l	PatternMallExteriorSign ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00180000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_PLANT_ALT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000011001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000101100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000110100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_INFODESK
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1010000011010000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011111000

	dc.w	OBJ_SCENE_INFODESK
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1010000100100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011111000

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
	dc.w	$0003	; four npc slots

	; npc0
	dc.w	$0118	; starting x location of npc0
	dc.w	$00E0	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$0000	; movement frequency of npc0
	dc.l	NPCMovementDownStart	; location of movement pattern for npc0
	dc.w	(NPCMovementDownEnd-NPCMovementDownStart-1)	; pattern length

	; npc1
	dc.w	$0118	; starting x location of npc1
	dc.w	$0100	; starting y location of npc1
	dc.w	DIRECTION_UP	; starting direction of npc1
	dc.w	$0000	; movement frequency of npc1
	dc.l	NPCMovementUpStart	; location of movement pattern for npc1
	dc.w	(NPCMovementUpEnd-NPCMovementUpStart-1)	; pattern length

	; npc2
	dc.w	$0118	; starting x location of npc2
	dc.w	$0056	; starting y location of npc2
	dc.w	DIRECTION_LEFT	; starting direction of npc2
	dc.w	$0000	; movement frequency of npc2
	dc.l	NullMovementStart	; location of movement pattern for npc2
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	; npc3
	dc.w	$0184	; starting x location of npc3
	dc.w	$0160	; starting y location of npc3
	dc.w	DIRECTION_LEFT	; starting direction of npc3
	dc.w	$0000	; movement frequency of npc3
	dc.l	NullMovementStart	; location of movement pattern for npc3
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

