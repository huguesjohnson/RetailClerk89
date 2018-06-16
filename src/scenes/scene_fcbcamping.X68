SceneFCBCamping:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_FCBCAMPING

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0005	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FCBFrameTilesStart	; start of frame tiles
	dc.l	FCBFrameTilesEnd	; end of frame tiles

	; tileset 2
	dc.l	WoodFloorSlopedTilesStart	; start of wood floor tiles
	dc.l	WoodFloorSlopedTilesEnd	; end of wood floor tiles

	; tileset 3
	dc.l	StoneFloorTilesStart	; start of stone floor tiles
	dc.l	StoneFloorTilesEnd	; end of stone floor tiles

	; tileset 4
	dc.l	FCBCenterTopTilesStart	; start of center tiles
	dc.l	FCBCenterTopTilesEnd	; end of center tiles

	; tileset 5
	dc.l	FCBCampingTilesStart	; start of firepit tiles
	dc.l	FCBCampingTilesEnd	; end of firepit tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store16Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000F	; scenery count - 1

	; stone floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011010	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; north frame
	dc.l	PatternFCBFrameNorthWest	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; west frame
	dc.l	PatternFCBFrameSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; wood path - east-west
	dc.l	PatternFCBFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$09800000+$00100000	; initial drawing location

	; wood path - north-south
	dc.l	PatternFCBFloorVNorth	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0B800000+$00100000	; initial drawing location

	; center
	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D000000+$00360000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D000000+$003E0000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D000000+$00440000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D000000+$004C0000	; initial drawing location

	; benches
	dc.l	PatternFCBCampingBench ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$001A0000	; initial drawing location

	dc.l	PatternFCBCampingBench ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00320000	; initial drawing location

	; firepit
	dc.l	Pattern32x32 ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00240000	; initial drawing location

	; tents
	dc.l	Pattern56x48 ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00220000	; initial drawing location

	dc.l	Pattern56x48 ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001100010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00060000	; initial drawing location

	dc.l	Pattern56x32 ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$01800000+$003C0000	; initial drawing location

	dc.l	Pattern56x32 ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00060000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0001111011101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0111000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0001111101001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0111000011001000

	dc.w	OBJ_SCENE_FIREPIT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011111100010000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011011000

	dc.w	OBJ_SCENE_TENT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110111100001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_TENT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110111010011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_TENT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110111010011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011011000

	dc.w	OBJ_SCENE_TENT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110111101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010011000

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
	
	dc.l	MapStore16Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_FCBFISHING	; south exit
	dc.w	$FFFF; north exit
	dc.w	$FFFF	; west exit
	dc.w	SCENE_ID_FCBFIREARMS	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot

	dc.w	$00A0	; starting x location of npc0
	dc.w	$0100	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$0097	; movement frequency of npc0
	dc.l	NPCMovementScene16Start	; location of movement pattern for npc0
	dc.w	(NPCMovementScene16End-NPCMovementScene16Start-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

