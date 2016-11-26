;-------------------------------------------------------------------------------
; scene data structure
;	-tiles
;		-tileset count
;		-references to locations of tilesets to load
;	-palettes
;		-palette count
;		-references to locations of palettes to load
;	-scenery
;		-scenery count
;		-scenery definitions
;			-Pattern
;			-Rows -> Word
;			-Columns -> Word
;			-Repeat -> Word number of times to repeat the pattern
;			-Base tile ID -> Word (Base tile ID + Palette + Priority)
;			-Initial address offset -> Long (either A or B)
;			-Start Row (or Y) -> Word
;			-Start Column (or X) -> Word
;	-objects[]
;		-object count
;		-list of objects
;	-collision data
;		-size of collision data
;		-reference to location of collision data
;	-BGM
;		-reference to location of background music
;-------------------------------------------------------------------------------
SceneVB:

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0000	; one tileset
	; tileset 0
	dc.l	StoreTilesStart	; start of scene tiles
	dc.l	StoreTilesEnd	; end of scene tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	PaletteStoreA	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000A	; scenery count

	; floor
	dc.l	PatternFloorStart	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000001	
	dc.w	$0001	; base pattern
	dc.w	$001F	; repeat 32 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top shelf
	dc.l	PatternShelvesHStart	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000101	
	dc.w	$0005	; base pattern
	dc.w	$0000	; no repeat
	; row 1, column 0 = 128 = 0080
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; middle shelf
	dc.l	PatternShelvesMStart	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000000101	
	dc.w	$2005	; base pattern
	dc.w	$0000	; no repeat
	; row 2, column 0 = 256 = 0100
	dc.l	VDP_VRAM_WRITE_B+$01000000	; initial drawing location

	; low shelf
	dc.l	PatternShelvesLStart	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0100000000000101	
	dc.w	$4005	; base pattern
	dc.w	$0000	; no repeat
	; row 3, column 0 = 256 = 0180
	dc.l	VDP_VRAM_WRITE_B+$01800000	; initial drawing location

	; frame top
	dc.l	PatternFrameTopStart	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000000000	
	dc.w	$8000	; base pattern
	dc.w	$0000	; no repeat
	; row 3, column 0 = 256 = 0180
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; frame side
	dc.l	PatternFrameSideStart	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000000000	
	dc.w	$8000	; base pattern
	dc.w	$0016	; repeat 23 times
	; row 1, column 0 = 128 = 0080
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; store front
	dc.l	PatternStoreFrontStart	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000001100	
	dc.w	$800C	; base pattern
	dc.w	$0000	; no repeat
	; row 24, column 0 = 3072 = C00
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	; counter - low front
	dc.l	PatternCounterLowStart	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000100001	
	dc.w	$2021	; base pattern
	dc.w	$0000	; no repeat
	; row 10, column 7 = 51C
	dc.l	VDP_VRAM_WRITE_A+$051C0000	; initial drawing location

	; counter - low side
	dc.l	PatternCounterLowSideStart	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000110001	
	dc.w	$2031	; base pattern
	dc.w	$0000	; no repeat
	; row 3, column 12 = 432 = 1B0
	dc.l	VDP_VRAM_WRITE_B+$01B00000	; initial drawing location

	; counter - top
	dc.l	PatternCounterHighStart	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1010000000110001	
	dc.w	$A031	; base pattern
	dc.w	$0000	; no repeat
	; row 7, column 28 = 39C
	dc.l	VDP_VRAM_WRITE_A+$039C0000	; initial drawing location

	; register
	dc.l	PatternRegisterStart	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1110000000111011	
	dc.w	$E03B	; base pattern
	dc.w	$0000	; no repeat
	; row 6, column 44 = 330
	dc.l	VDP_VRAM_WRITE_A+$03300000	; initial drawing location

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	;---------------------------------------------------------------------------
	; word0=Object ID (0-65535)
	; word1[0-8]=x0 (0-511)
	; word1[9-15]=width (0-127)
	; word2[0-8]=y0 (0-512)
	; word2[9-15]=height (0-127)
	;---------------------------------------------------------------------------
	dc.w	OBJ_SCENE_VB_8BIT
	; x0=136 width=106 = 1101010 010001000 = D488
	dc.w	$D488
	; y0=136 height=26 = 0011010 010001000 = 3488
	dc.w	$3488

	dc.w	OBJ_SCENE_VB_8BIT
	; x0=242 width=79 = 1001111 011110010  = 9EF2
	dc.w	$9EF2
	; y0=136 height=26 = 0011010 010001000  = 3488
	dc.w	$3488

	dc.w	OBJ_SCENE_VB_8BIT
	; x0=351 width=90 = 1011010 101011111 = B55F
	dc.w	$B55F
	; y0=136 height=26 = 0011010 010001000 = 3488
	dc.w	$3488

	dc.w	OBJ_SCENE_VB_MAGS
	; x0=240 width=114 = 1110010 011110000 = E4F0
	dc.w	$E4F0
	; y0=224 height=32 = 0100000 011100000 = 40E0
	dc.w	$40E0

	dc.w	OBJ_SCENE_VB_COUNTER
	; x0=240 width=80 = 1010000 011110000 = A0F0
	dc.w	$A0F0
	; y0=200 height=16 = 0010000 011001000  = 20C8
	dc.w	$20C8

	dc.w	OBJ_SCENE_VB_REGISTER
	; x0=320 width=16 = 0010000 101000000 = 2140
	dc.w	$2140
	; y0=162 height=32 = 0100000 010100010 = 40A2
	dc.w	$40A2

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
	
	dc.l	MapStoreCollision	; location of collision data

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Test	; location of background music

