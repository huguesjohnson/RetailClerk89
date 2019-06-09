SceneCavern:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CAVERN

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0004	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	WindowAngledTilesStart	; start of window tiles
	dc.l	WindowAngledTilesEnd	; end of window tiles

	; tileset 2
	dc.l	BlackLightFloorTilesStart	; start of floor tiles
	dc.l	BlackLightFloorTilesEnd	; end of floor tiles

	; tileset 3
	dc.l	StoreFrameThreeColorTilesStart	; start of frame tiles
	dc.l	StoreFrameThreeColorTilesEnd	; end of frame tiles

	; tileset 4
	dc.l	CavernSceneryTilesStart ; start of logo & scenery tiles
	dc.l	CavernSceneryTilesEnd ; end of logo & scenery tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store0BPalettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$003D	; scenery count - 1

	; floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010101	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; right side
	dc.l	PatternSideClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000100110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; frame top
	dc.l	PatternFrameTop	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000100000	; base pattern
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

	; arcade logo
	dc.l	Pattern72x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000101010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000+$001E0000	; initial drawing location

	; arcade cabinets

	; 24x24 bases

	; pattern 0 - palette 0

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00020000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00080000	; initial drawing location

	; pattern 2 - palette 2

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001001110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00420000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001001110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00480000	; initial drawing location

	; pattern 1 - palette 2

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$000E0000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00140000	; initial drawing location

	; pattern 2 - palette 1

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00220000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00280000	; initial drawing location

	; pattern 1 - palette 0

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001000101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00360000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001000101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$003C0000	; initial drawing location

	; pattern 1 - palette 1

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00020000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00080000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$000E0000	; initial drawing location

	; pattern 0 - palette 2

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00160000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$001C0000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00220000	; initial drawing location

	; pattern 2 - palette 0

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00280000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$002E0000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00340000	; initial drawing location

	; pattern 0 - palette 1

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$003C0000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00420000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00480000	; initial drawing location

	; arcade cabinets

	; pattern 0 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001010111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08800000+$00020000	; initial drawing location

	; pattern 0 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001011101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09800000+$00020000	; initial drawing location

	; pattern 0 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001010111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08800000+$00080000	; initial drawing location

	; pattern 0 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001011101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09800000+$00080000	; initial drawing location

	; pattern 0 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$003C0000	; initial drawing location

	; pattern 0 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00420000	; initial drawing location

	; pattern 0 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00480000	; initial drawing location

	; pattern 0 - palette 2 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00160000	; initial drawing location

	; pattern 0 - palette 2 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$001C0000	; initial drawing location

	; pattern 0 - palette 2 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00220000	; initial drawing location

	; pattern 1 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001100000
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00360000	; initial drawing location

	; pattern 1 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001100110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00360000	; initial drawing location

	; pattern 1 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001100000
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$003C0000	; initial drawing location

	; pattern 1 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001100110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$003C0000	; initial drawing location

	; pattern 1 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100000
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00020000	; initial drawing location

	; pattern 1 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100000
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00080000	; initial drawing location

	; pattern 1 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100000
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$000E0000	; initial drawing location

	; pattern 1 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001100000
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$000E0000	; initial drawing location

	; pattern 1 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$000E0000	; initial drawing location

	; pattern 1 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001100000
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00140000	; initial drawing location

	; pattern 1 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00140000	; initial drawing location

	; pattern 2 - palette 0 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001101001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00280000	; initial drawing location

	; pattern 2 - palette 0 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001101001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$002E0000	; initial drawing location

	; pattern 2 - palette 0 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001101001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00340000	; initial drawing location

	; pattern 2 - palette 1 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001101001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00220000	; initial drawing location

	; pattern 2 - palette 1 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00220000	; initial drawing location

	; pattern 2 - palette 1 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001101001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00280000	; initial drawing location

	; pattern 2 - palette 1 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00280000	; initial drawing location

	; pattern 2 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001101001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08800000+$00420000	; initial drawing location

	; pattern 2 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09800000+$00420000	; initial drawing location

	; pattern 2 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001101001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08800000+$00480000	; initial drawing location

	; pattern 2 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09800000+$00480000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_ARCADE0
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000010000111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000100001000

	dc.w	OBJ_SCENE_ARCADE1
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000110001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000100001000

	dc.w	OBJ_SCENE_ARCADE2
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000010110111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011001000

	dc.w	OBJ_SCENE_ARCADE3
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000100000111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011001000

	dc.w	OBJ_SCENE_ARCADE4
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000101010111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011001000

	dc.w	OBJ_SCENE_ARCADE5
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1001000010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_ARCADE6
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1001000011011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_ARCADE7
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1001000100100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_ARCADE8
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1001000101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	DEFAULT_COLLISION_DATA_SIZE	; collision data size
	
	dc.l	MapStore0BCollision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_EEHALL	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$00CC	; starting x location of npc0
	dc.w	$00F0	; starting y location of npc0
	dc.w	DIRECTION_LEFT	; starting direction of npc0
	dc.w	$006D	; movement frequency of npc0
	dc.l	NPCMovementScene0BStart	; location of movement pattern for npc0
	dc.w	(NPCMovementScene0BEnd-NPCMovementScene0BStart-1)	; pattern length

	dc.w	$0114	; starting x location of npc1
	dc.w	$0188	; starting y location of npc1
	dc.w	DIRECTION_UP	; starting direction of npc1
	dc.w	$FFFF	; movement frequency of npc1
	dc.l	NullMovementStart	; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0114	; starting x location of npc2
	dc.w	$0188	; starting y location of npc2
	dc.w	DIRECTION_UP	; starting direction of npc2
	dc.w	$FFFF	; movement frequency of npc2
	dc.l	NullMovementStart	; location of movement pattern for npc2
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0114	; starting x location of npc3
	dc.w	$0188	; starting y location of npc3
	dc.w	DIRECTION_UP	; starting direction of npc3
	dc.w	$FFFF	; movement frequency of npc3
	dc.l	NullMovementStart	; location of movement pattern for npc3
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

