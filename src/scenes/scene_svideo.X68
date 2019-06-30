SceneSVideo:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SVIDEO

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	CarpetFloorTilesStart	; start of south floor tiles
	dc.l	CarpetFloorTilesEnd	; end of south floor tiles

	; tileset 2
	dc.l	SideStoreEntranceSquareTilesStart	; start of side entrance tiles
	dc.l	SideStoreEntranceSquareTilesEnd	; end of side entrance tiles

	; tileset 3
	dc.l	StoreFrameTilesStart	; start of frame tiles
	dc.l	StoreFrameTilesEnd	; end of frame tiles

	; tileset 4
	dc.l	BorderedCounterTilesStart	; start of counter top tiles
	dc.l	BorderedCounterTilesEnd	; end of counter top tiles

	; tileset 5
	dc.l	CounterShelvesTilesStart	; start of counter shelf tiles
	dc.l	CounterShelvesTilesEnd	; end of counter shelf tiles

	; tileset 6
	dc.l	SVideoMerchandiseTilesStart	; start of merchandise tiles
	dc.l	SVideoMerchandiseTilesEnd	; end of merchandise tiles

	; tileset 7
	dc.l	RegisterAltFlippedTilesStart	; start of register tiles
	dc.l	RegisterAltFlippedTilesEnd	; end of register tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store0CPalettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000E	; scenery count - 1

	; floor
	dc.l	PatternFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$001F	; repeat 32 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; south wall
	dc.l	PatternFrameSouthClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000001111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; right side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; top
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; left entrance - top
	dc.l	PatternSideEntranceLeftSingle
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; left entrance - bottom
	dc.l	PatternSideEntranceLeftSingle
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; top shelf
	dc.l	PatternShelvesH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; middle shelf
	dc.l	PatternShelvesM	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01000000	; initial drawing location

	; low shelf
	dc.l	PatternShelvesL	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01800000	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0B800000+$00400000	; initial drawing location

	; counter
	dc.l	PatternCounterLow24x136	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00400000	; initial drawing location

	; registers
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00420000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000+$00420000	; initial drawing location

	; rack
	dc.l	PatternSVideoRackHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000C0000+$04800000	; initial drawing location

	dc.l	PatternSVideoRackLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000C0000+$06000000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;--------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_VIDEOWALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_VIDEOWALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111011111111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_VIDEOWALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111101111110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_VIDEORACK
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000000010110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011001000

	dc.w	OBJ_SCENE_VIDEORACK
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0111111011110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011001000

	dc.w	OBJ_SCENE_REGISTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0001111110001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011010000

	dc.w	OBJ_SCENE_REGISTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0001111110001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100010000

	dc.w	OBJ_SCENE_COUNTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010111110000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%1111111010111000

	dc.w	OBJ_SCENE_COUNTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010111110000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0001110100110111

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	DEFAULT_COLLISION_DATA_SIZE	; collision data size
	
	dc.l	MapStore0CCollision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	$FFFF	; north exit
	dc.w	SCENE_ID_EEHALL	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0001	; two npc slots

	dc.w	$00E8	; starting x location of npc0
	dc.w	$00F0	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$007F	; movement frequency of npc0
	dc.l	NPCMovementScene0CStart	; location of movement pattern for npc0
	dc.w	(NPCMovementScene0CEnd-NPCMovementScene0CStart-1)	; pattern length

	dc.w	$00A0	; starting x location of npc1
	dc.w	$0090	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc1
	dc.w	$0097	; movement frequency of npc1
	dc.l	NPCMovementBrowsingStart	; location of movement pattern for npc1
	dc.w	(NPCMovementBrowsingEnd-NPCMovementBrowsingStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

