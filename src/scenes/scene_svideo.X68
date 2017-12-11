SceneSVideo:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SVIDEO

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count - 1

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

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store0CPalettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000F	; scenery count - 1

	; floor
	dc.l	PatternFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$001F	; repeat 32 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; south wall
	dc.l	PatternFrameSouthClosed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000001011	; base pattern
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
	dc.w	%1010000000000110	; base pattern
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
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; middle shelf
	dc.l	PatternShelvesM	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01000000	; initial drawing location

	; low shelf
	dc.l	PatternShelvesL	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01800000	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile168x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$08800000+$000C0000	; initial drawing location

	dc.l	Pattern3Tile168x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$05000000+$000C0000	; initial drawing location

	; counter
	dc.l	PatternCounterHigh112x8Top	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$03800000+$000C0000	; initial drawing location

	dc.l	PatternCounterLow112x24Top
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$000C0000	; initial drawing location

	dc.l	PatternCounterHigh112x8Bottom	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$000C0000	; initial drawing location

	dc.l	PatternCounterLow112x24Bottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$000C0000	; initial drawing location

	dc.l	PatternCounterSide32x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$000C0000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;--------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

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

