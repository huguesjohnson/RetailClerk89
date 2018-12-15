SceneCheckers:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CHECKERS

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0009	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart	; transparent tile start
	dc.l	TransparentTileEnd	; transparent tile end

	; tileset 1
	dc.l	StoreFrameTilesStart	; start of frame tiles
	dc.l	StoreFrameTilesEnd	; end of frame tiles

	; tileset 2
	dc.l	StoreFrontWindowTilesStart	; start of window tiles
	dc.l	StoreFrontWindowTilesEnd	; end of window tiles

	; tileset 3
	dc.l	SimpleTileFloorTilesStart	; start of floor tiles
	dc.l	SimpleTileFloorTilesEnd	; end of floor tiles

	; tileset 4
	dc.l	MannequinStandTilesStart	; start of stand tiles
	dc.l	MannequinStandTilesEnd	; end of stand tiles

	; tileset 5
	dc.l	BorderedCounterTilesStart	; start of counter tiles
	dc.l	BorderedCounterTilesEnd	; end of counter tiles

	; tileset 6
	dc.l	CounterShelvesTilesStart	; start of counter shelf tiles
	dc.l	CounterShelvesTilesEnd	; end of counter shelf tiles

	; tileset 7
	dc.l	CheckersMerchandiseTilesStart	; start of merchandise tiles
	dc.l	CheckersMerchandiseTilesEnd	; end of merchandise tiles

	; tileset 8
	dc.l	MannequinMTilesStart	; start of mannequin tiles
	dc.l	MannequinMTilesEnd	; end of mannequin tiles

	; tileset 9
	dc.l	RegisterAltTilesStart ; start of register tiles
	dc.l	RegisterAltTilesEnd ; end of register tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store09Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$001B	; scenery count - 1

	; floor
	dc.l	PatternTileFloorSimple	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011110	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; shelves along back of store
	dc.l	PatternCheckersShelves	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00800000	; initial drawing location

	dc.l	PatternCheckersShelves	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00000000+$01000000	; initial drawing location

	dc.l	PatternCheckersShelves	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00000000+$01800000	; initial drawing location

	; frame top
	dc.l	PatternFrameTopA	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; left side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; right side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; store front frame
	dc.l	PatternStoreFrontFrame	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	; store front
	dc.l	PatternStoreFront	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$0C000000	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile112x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111001	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$001A0000+$04800000	; initial drawing location

	; counter
	dc.l	PatternCounterHigh112x8Closed	; location of pattern
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$03000000	; initial drawing location

	dc.l	PatternCounterLow112x24Closed	; location of pattern
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$03800000	; initial drawing location

	; mannequin stands
	dc.l	PatternMannequinStand	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00080000+$07800000	; initial drawing location

	dc.l	PatternMannequinStand	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00380000+$07800000	; initial drawing location

	;---------------------------------------------------------------------------
	; mannequins
	;---------------------------------------------------------------------------

	; left stand - left mannequin
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$06800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$07800000	; initial drawing location

	; left stand - center mannequin
	dc.l	Pattern16x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000E0000+$07000000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000E0000+$07800000	; initial drawing location

	; left stand - right mannequin
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001100110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00120000+$06800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00120000+$07800000	; initial drawing location

	; right stand - left mannequin
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001001110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003A0000+$06800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003A0000+$07800000	; initial drawing location

	; right stand - center mannequin
	dc.l	Pattern16x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001010110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003E0000+$07000000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003E0000+$07800000	; initial drawing location

	; right stand - right mannequin
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001011110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00420000+$06800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00420000+$07800000	; initial drawing location

	; register
	dc.l	Pattern16x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00300000+$03000000	; initial drawing location

	dc.l	Pattern16x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00300000+$03800000	; initial drawing location

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
	dc.w	%0010000010110000

	dc.w	OBJ_SCENE_CLOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_CLOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100011101100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_CLOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100110101001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000010100100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000010111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011110000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000011001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000111101101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	dc.w	OBJ_SCENE_TMANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010110101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011110000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000110001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	DEFAULT_COLLISION_DATA_SIZE	; collision data size
	
	dc.l	MapStore09Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_EWHALL	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npcs

	dc.w	$012A	; starting x location of npc0
	dc.w	$0098	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$0000	; movement frequency of npc0
	dc.l	NPCMovementDownStart	; location of movement pattern for npc0
	dc.w	(NPCMovementDownEnd-NPCMovementDownStart-1)	; pattern length

	; the three shopper NPCs all start off screen

	dc.w	$0100	; starting x location of npc1
	dc.w	$0180	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc1
	dc.w	$FFFF	; movement frequency of npc1
	dc.l	NullMovementStart	; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0100	; starting x location of npc1
	dc.w	$0180	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc2
	dc.w	$FFFF	; movement frequency of npc2
	dc.l	NPCMovementDownStart	; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0100	; starting x location of npc1
	dc.w	$0180	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc3
	dc.w	$FFFF	; movement frequency of npc3
	dc.l	NPCMovementDownStart	; location of movement pattern for npc3
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

