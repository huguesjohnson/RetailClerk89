SceneFCBFishing:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_FCBFISHING

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count - 1

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
	dc.l	WaterTilesStart	; start of water tiles
	dc.l	WaterTilesEnd	; end of water tiles

	; tileset 5
	dc.l	FCBCenterLeftTilesStart	; start of center tiles
	dc.l	FCBCenterLeftTilesEnd	; end of center tiles

	; tileset 6
	dc.l	FCBCenterTilesStart	; start of center tiles
	dc.l	FCBCenterTilesEnd	; end of center tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store15Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000C	; scenery count - 1

	; stone floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011010	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; south frame
	dc.l	PatternFCBFrameSouthWest	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; west frame
	dc.l	PatternFCBFrameSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; wood path - east-west
	dc.l	PatternFCBFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$09800000+$00100000	; initial drawing location

	; wood path - north-south
	dc.l	PatternFCBFloorVSouth	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00100000	; initial drawing location

	; water
	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00380000	; initial drawing location

	; center - left edge
	dc.l	Pattern8x64	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

	dc.l	Pattern8x56	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00380000+$00800000	; initial drawing location

	dc.l	Pattern8x48	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003A0000+$01000000	; initial drawing location

	dc.l	Pattern8x48	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$01000000	; initial drawing location

	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003E0000+$01800000	; initial drawing location

	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00460000+$01800000	; initial drawing location

	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$004E0000+$01800000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

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
	
	dc.l	MapStore15Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_FCBCAMPING	; north exit
	dc.w	$FFFF	; west exit
	dc.w	SCENE_ID_FCBCHECKOUT	; east exit

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

