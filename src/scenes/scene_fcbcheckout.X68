SceneFCBCheckout:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_FCBCHECKOUT

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0009	; tileset count - 1

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
	dc.l	FCBCenterRightTilesStart	; start of center tiles
	dc.l	FCBCenterRightTilesEnd	; end of center tiles

	; tileset 6
	dc.l	FCBCenterTilesStart	; start of center tiles
	dc.l	FCBCenterTilesEnd	; end of center tiles

	; tileset 7
	dc.l	BorderedCounterTilesStart	; start of counter top tiles
	dc.l	BorderedCounterTilesEnd	; end of counter top tiles

	; tileset 8
	dc.l	CounterShelvesAltTilesStart	; start of counter shelf tiles
	dc.l	CounterShelvesAltTilesEnd	; end of counter shelf tiles

	; tileset 9
	dc.l	RegisterAlt3TilesStart	; start of register tiles
	dc.l	RegisterAlt3TilesEnd	; end of register tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store13Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0011	; scenery count - 1

	; stone floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011010	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; south frame
	dc.l	PatternFCBFrameSouthEast	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; wood path - east-west
	dc.l	PatternFCBFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$09800000	; initial drawing location

	; wood path - north-south
	dc.l	PatternFCBFloorVSouth	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00380000	; initial drawing location

	; water
	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; center - right edge
	dc.l	Pattern8x64	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00180000	; initial drawing location

	dc.l	Pattern8x56	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00160000+$00800000	; initial drawing location

	dc.l	Pattern8x48	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00140000+$01000000	; initial drawing location

	dc.l	Pattern8x48	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00120000+$01000000	; initial drawing location

	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$01800000	; initial drawing location

	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$01800000	; initial drawing location

	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$01800000	; initial drawing location

	; shelves under counter
	dc.l	PatternBoothMerch112x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001110111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$001C0000+$08800000	; initial drawing location

	; counter
	dc.l	PatternCounterLow112x24Open
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$001C0000	; initial drawing location

	dc.l	PatternCounterHigh112x8Open
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001101000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$001C0000	; initial drawing location

	dc.l	PatternCounterSide32x64OpenLower
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00300000	; initial drawing location

	; registers
	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00300000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00300000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_REGISTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000101000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110100011000000

	dc.w	OBJ_SCENE_FOUNTAIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100111010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0111000010000000

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
	
	dc.l	MapStore13Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_FCBFIREARMS	; north exit
	dc.w	SCENE_ID_FCBFISHING	; west exit
	dc.w	SCENE_ID_WWHALL	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0001	; two npc slots

	dc.w	$0130	; starting x location of npc0
	dc.w	$00B4	; starting y location of npc0
	dc.w	DIRECTION_RIGHT	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NPCMovementRightStart	; location of movement pattern for npc0
	dc.w	(NPCMovementRightEnd-NPCMovementRightStart-1)	; pattern length

	dc.w	$01F0	; starting x location of npc1
	dc.w	$00E0	; starting y location of npc1
	dc.w	DIRECTION_LEFT	; starting direction of npc1
	dc.w	$FFFF	; movement frequency of npc1
	dc.l	NullMovementStart	; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length


	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

