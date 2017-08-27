SceneVB:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_VB

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
	dc.l	Store00Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000F	; scenery count

	; floor
	dc.l	PatternFloor	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000001	
	dc.w	$0001	; base pattern
	dc.w	$001F	; repeat 32 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top shelf
	dc.l	PatternShelvesH	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000101	
	dc.w	$001E	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; middle shelf
	dc.l	PatternShelvesM	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000000101	
	dc.w	$201E	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01000000	; initial drawing location

	; low shelf
	dc.l	PatternShelvesL	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0100000000000101	
	dc.w	$401E	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01800000	; initial drawing location

	; frame top
	dc.l	PatternFrameTop	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000000000	
	dc.w	$8000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; frame side
	dc.l	PatternFrameSide	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000000000	
	dc.w	$8000	; base pattern
	dc.w	$0016	; repeat 23 times
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; store front frame
	dc.l	PatternStoreFrontFrame	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000001100	
	dc.w	$8000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	; store front
	dc.l	PatternStoreFront	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000001100	
	dc.w	$8000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C800000	; initial drawing location

	; counter - low front
	dc.l	PatternCounterLow	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000100001	
	dc.w	$2021	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$001C0000	; initial drawing location

	; counter - low side
	dc.l	PatternCounterLowSide	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000110001	
	dc.w	$2031	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01800000+$00300000	; initial drawing location

	; counter - top
	dc.l	PatternCounterHigh	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1010000000110001	
	dc.w	$A031	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$03800000+$001C0000	; initial drawing location

	; register
	dc.l	PatternRegister	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1110000000111011	
	dc.w	$E03B	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$03000000+$00300000	; initial drawing location

	; hardware rack - low
	dc.l	PatternHWRackLow	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000001000001	
	dc.w	$0041	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00080000	; initial drawing location

	; hardware rack - high
	dc.l	PatternHWRackHigh	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000001000001	
	dc.w	$8041	; base pattern
	dc.w	$0000	; no repeat
	; row 10, column 4 = 508
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00080000	; initial drawing location

	; 16-bit rack - low
	dc.l	Pattern16BitRackLow	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 0100000001010000	
	dc.w	$4050	; base pattern
	dc.w	$0000	; no repeat
	; row 15, column 50 = 788
	dc.l	VDP_VRAM_WRITE_A+$08000000+$003E0000	; initial drawing location

	; 16-bit rack - high
	dc.l	Pattern16BitRackHigh	; location of first pattern to load
	; pccvhnnnnnnnnnnn
	; 1100000001010000	
	dc.w	$C050	; base pattern
	dc.w	$0000	; no repeat
	; row 10, column 4 = 508
	dc.l	VDP_VRAM_WRITE_A+$05800000+$003E0000	; initial drawing location

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
	
	dc.l	MapStore00Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWHALL	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

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

