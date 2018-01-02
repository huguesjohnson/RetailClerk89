SceneCPlanet:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CPLANET

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0008	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	WindowAngledTilesStart	; start of window tiles
	dc.l	WindowAngledTilesEnd	; end of window tiles

	; tileset 2
	dc.l	TileFloorTilesStart	; start of floor tiles
	dc.l	TileFloorTilesEnd	; end of floor tiles

	; tileset 3
	dc.l	StoreFrameThreeColorTilesStart	; start of frame tiles
	dc.l	StoreFrameThreeColorTilesEnd	; end of frame tiles

	; tileset 4
	dc.l	PosterTilesStart	; start of poster tiles
	dc.l	PosterTilesEnd	; end of poster tiles

	; tileset 5
	dc.l	CPlanetLogoTilesStart	; start of logo tiles
	dc.l	CPlanetLogoTilesEnd	; end of logo tiles

	; tileset 6
	dc.l	BorderedCounterTilesStart	; start of counter tiles
	dc.l	BorderedCounterTilesEnd	; end of counter tiles

	; tileset 7
	dc.l	CPlanetSceneryTilesStart	; start of scenery tiles
	dc.l	CPlanetSceneryTilesEnd	; end of scenery tiles

	; tileset 8
	dc.l	RegisterAltFlippedTilesStart	; start of register tiles
	dc.l	RegisterAltFlippedTilesEnd	; end of register tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store10Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0015	; scenery count - 1

	; floor
	dc.l	PatternTileFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010101	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top shelf
	dc.l	PatternShelvesH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; middle shelf
	dc.l	PatternShelvesM	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01000000+$00020000	; initial drawing location

	; low shelf
	dc.l	PatternShelvesL	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01800000	; initial drawing location

	; counter
	dc.l	PatternCounterLow24x136	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00420000	; initial drawing location

	; left side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; right side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; frame top
	dc.l	PatternFrameTop	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; store front - left
	dc.l	PatternWindowAngledLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	; store front - center
	dc.l	PatternWindowAngledCenter	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$0C000000	; initial drawing location

	; store front - right
	dc.l	PatternWindowAngledRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$0C000000	; initial drawing location

	; posters
	dc.l	PatternPoster	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000011110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00040000+$0C800000	; initial drawing location

	dc.l	PatternPoster	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000100100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00120000+$0C800000	; initial drawing location

	dc.l	PatternPoster	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000101010	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$003a0000+$0C800000	; initial drawing location

	dc.l	PatternPoster	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000110000	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00460000+$0C800000	; initial drawing location

	; logo
	dc.l	Pattern32x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000110110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00240000+$0C000000	; initial drawing location

	; cd racks
	dc.l	PatternCDRackLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$08000000+$00080000	; initial drawing location

	dc.l	PatternCDRackHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00080000	; initial drawing location

	dc.l	PatternCDRackLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$04000000+$00080000	; initial drawing location

	dc.l	PatternCDRackHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001010100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$03800000+$00080000	; initial drawing location

	; registers
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001111000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00440000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001111000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09800000+$00440000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_TAPES
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_TAPES
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111100000111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_TAPES
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111110000110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_CDS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1101001010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010111000

	dc.w	OBJ_SCENE_CDS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1101001100001001
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010111000

	dc.w	OBJ_SCENE_CDS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1101001010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011111000

	dc.w	OBJ_SCENE_CDS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1101001100001001
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011111000

	dc.w	OBJ_SCENE_REGISTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0001111110010000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010100011010000

	dc.w	OBJ_SCENE_REGISTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0001111110010000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010100100011000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	DEFAULT_COLLISION_DATA_SIZE	; collision data size
	
	dc.l	MapStore10Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WEHALL	; south exit
	dc.w	$FFFF	; north exit
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

