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
SceneWWHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0000	; one tileset
	; tileset 0
	dc.l	StoreVBTilesStart	; start of scene tiles
	dc.l	StoreVBTilesEnd	; end of scene tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store01Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0001	; scenery count

	; floor
	dc.l	PatternFloor	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000001	
	dc.w	$0001	; base pattern
	dc.w	$0001	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; store front
	dc.l	PatternStoreFront	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000001100	
	dc.w	$800C	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A;+$0C000000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

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
	; height=16 [0010000] y0=136 [010001000] 
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_VB_8BIT
	; x0=242 width=79 = 1001111 011110010  = 9EF2
	dc.w	$9EF2
	; height=16 [0010000] y0=136 [010001000] 
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_VB_8BIT
	; x0=351 width=90 = 1011010 101011111 = B55F
	dc.w	$B55F
	; height=16 [0010000] y0=136 [010001000] 
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_VB_MAGS
	; x0=240 width=114 = 1110010 011110000 = E4F0
	dc.w	$E4F0
	; height=8 [0001000] y0=224 [011100000]  = 0001100 011100000 = 18E0
	dc.w	%0001000011100000

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

	dc.w	OBJ_SCENE_VB_HARDWARE
	; x0=164 width=38 = 0100110 010100100 = 4CA4
	dc.w	$4CA4
	; y0=238 height=26= 0011010 011101110 = 34EE
	dc.w	$34EE

	dc.w	OBJ_SCENE_VB_16BIT
	; width=30 [0011110] x0=372 [101110100]
	dc.w	%0011110101110100
	; height=24 [0011000] y0=248 [011111000]
	dc.w	%0011000011111000

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
	
	dc.l	MapStore01Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TBOOKS	; south exit
	dc.w	SCENE_ID_VB	; north exit
	dc.w	SCENE_ID_FCBCHECKOUT	; west exit
	dc.w	SCENE_ID_WEHALL	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0002	; three npc slots

	; npc0
	dc.w	$0150	; starting x location of npc0
	dc.w	$00F0	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$00F0	; movement frequency of npc0
	dc.l	RandomNPCMovement0Start	; location of movement pattern for npc0
	dc.w	(RandomNPCMovement0End-RandomNPCMovement0Start-1)	; pattern length

	; npc1
	dc.w	$00B0	; starting x location of npc1
	dc.w	$0104	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc1
	dc.w	$00D1	; movement frequency of npc1
	dc.l	RandomNPCMovement1Start	; location of movement pattern for npc1
	dc.w	(RandomNPCMovement1End-RandomNPCMovement1Start-1)	; pattern length

	; npc2
	dc.w	$017F	; starting x location of npc2
	dc.w	$01AF	; starting y location of npc2
	dc.w	DIRECTION_LEFT	; starting direction of npc2
	dc.w	$FFFF	; movement frequency of npc2
	dc.l	NullMovementStart	; location of movement pattern for npc2
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

