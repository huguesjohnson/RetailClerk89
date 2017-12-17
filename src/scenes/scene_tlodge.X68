SceneTLodge:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TLODGE

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0005	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	TileFloorTilesStart	; start of south floor tiles
	dc.l	TileFloorTilesEnd	; end of south floor tiles

	; tileset 2
	dc.l	StoreFrameTilesStart	; start of south frame tiles
	dc.l	StoreFrameTilesEnd	; end of south frame tiles

	; tileset 3
	dc.l	BorderedCounterTilesStart	; start of counter tiles
	dc.l	BorderedCounterTilesEnd	; end of counter tiles

	; tileset 4
	dc.l	RegisterAlt2TilesStart	; start of register tiles
	dc.l	RegisterAlt2TilesEnd	; end of register tiles

	; tileset 5
	dc.l	TLodgeMerchandiseTilesStart	; start of merchandise tiles
	dc.l	TLodgeMerchandiseTilesEnd	; end of merchandise tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store0APalettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000D	; scenery count

	; floor
	dc.l	PatternTileFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$001F	; repeat 32 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; right side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; top entrance - left side
	dc.l	PatternFrameTopOpenLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; top entrance - right side
	dc.l	PatternFrameTopOpenRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

	; left side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; south wall
	dc.l	PatternFrameSouthClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; counter
	dc.l	PatternCounter48x80
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000001101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$04800000	; initial drawing location

	; top left table
	dc.l	Pattern96x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$00800000	; initial drawing location

	; top right table
	dc.l	PatternTLodgeRightTable
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$00800000	; initial drawing location

	; rc track
	dc.l	PatternTLodgeRCTrack
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$04800000	; initial drawing location

	; car on track
	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00280000+$05800000	; initial drawing location

	; computer
	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001011100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00420000+$04800000	; initial drawing location

	dc.l	Pattern24x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00420000+$05800000	; initial drawing location

	; register
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$05800000	; initial drawing location

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
	dc.w	%0010010010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010100011011000

	dc.w	OBJ_SCENE_RADIO
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0111100010010000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0001000010010000

	dc.w	OBJ_SCENE_CASSETTE_PLAYER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010010011001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0001000010010000

	dc.w	OBJ_SCENE_CELL_PHONE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000000101100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0001000010010000

	dc.w	OBJ_SCENE_OFFICEPHONE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000110100011
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0001000010010000

	dc.w	OBJ_SCENE_RCCAR
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010100100011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010100011010010

	dc.w	OBJ_SCENE_COMPUTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010111110001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011010000

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
	
	dc.l	MapStore0ACollision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_EEHALL	; north exit
	dc.w	$FFFF	; west exit
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

