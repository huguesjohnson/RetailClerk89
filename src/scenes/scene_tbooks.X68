SceneTBooks:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TBOOKS

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	WoodFloorVTilesStart	; start of tiles for floor
	dc.l	WoodFloorVTilesEnd	; end of tiles for floor

	; tileset 2
	dc.l	NorthFrameRoundedTilesStart	; start of tiles for south frame
	dc.l	NorthFrameRoundedTilesEnd	; end of tiles for south frame

	; tileset 3
	dc.l	CounterShelvesAltTilesStart	; start of counter shelf tiles
	dc.l	CounterShelvesAltTilesEnd	; end of counter shelf tiles

	; tileset 4
	dc.l	BorderedCounterTilesStart	; start of counter tiles
	dc.l	BorderedCounterTilesEnd	; end of counter tiles

	; tileset 5
	dc.l	RegisterAlt3TilesStart	; start of register tiles
	dc.l	RegisterAlt3TilesEnd	; end of register tiles

	; tileset 6
	dc.l	TBooksSceneryTilesStart	; start of scenery tiles
	dc.l	TBooksSceneryTilesEnd	; end of scenery tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store12Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0018	; scenery count

	; floor
	dc.l	PatternWoodFloorV	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001
	dc.w	$0006	; repeat 7 times 
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; north frame - left side
	dc.l	PatternStoreFrameRoundedTopLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; north frame frame - right side
	dc.l	PatternStoreFrameRoundedTopRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

	; left side
	dc.l	PatternStoreFrameRoundedSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; right side
	dc.l	PatternStoreFrameRoundedSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; south side
	dc.l	PatternStoreFrameRoundedBottom	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile112x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011010	
	dc.w	$0001	; repeat one time
	dc.l	VDP_VRAM_WRITE_B+$08800000+$001A0000	; initial drawing location

	; counter sides
	dc.l	PatternCounterSide24x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011101	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$05000000+$001A0000	; initial drawing location

	dc.l	PatternCounterSide24x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011101	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$05000000+$00300000	; initial drawing location

	; counter top and bottom
	dc.l	PatternCounterLow112x24Closed	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011101	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$001A0000	; initial drawing location

	dc.l	PatternCounterHigh88x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000011101	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$001E0000	; initial drawing location

	dc.l	PatternCounterLow112x24ClosedTop	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011101	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$03800000+$001A0000	; initial drawing location

	; register
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000101100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00300000	; initial drawing location

	; bookshelves
	dc.l	PatternBookshelfSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00020000	; initial drawing location

	dc.l	PatternBookshelf72x48x10High	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$08800000+$00020000	; initial drawing location

	dc.l	PatternBookshelf72x48x10Low	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$09800000+$00020000	; initial drawing location

	dc.l	PatternBookshelfSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$003C0000	; initial drawing location

	dc.l	PatternBookshelf72x48x10High	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$03000000+$003C0000	; initial drawing location

	dc.l	PatternBookshelf72x48x10Low	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$04000000+$003C0000	; initial drawing location

	dc.l	PatternBookshelfSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00020000	; initial drawing location

	dc.l	PatternBookshelf72x48x10High	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$03000000+$00020000	; initial drawing location

	dc.l	PatternBookshelf72x48x10Low	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$04000000+$00020000	; initial drawing location

	dc.l	PatternBookshelfSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$003C0000	; initial drawing location

	dc.l	PatternBookshelf72x48x10High	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$08800000+$003C0000	; initial drawing location

	dc.l	PatternBookshelf72x48x10Low	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$09800000+$003C0000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0003	; text count

	dc.l	StoreSignFiction	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000+$00040000	; initial drawing location

	dc.l	StoreSignCooking	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000+$003E0000	; initial drawing location

	dc.l	StoreSignRomance	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$02800000+$00040000	; initial drawing location

	dc.l	StoreSignHistory	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$02800000+$003E0000	; initial drawing location

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_REGISTER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010011101000100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011010000

	dc.w	OBJ_SCENE_BOOKS_FICTION
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000100001000

	dc.w	OBJ_SCENE_BOOKS_ROMANCE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010110000

	dc.w	OBJ_SCENE_BOOKS_HISTORY
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010110000

	dc.w	OBJ_SCENE_BOOKS_COOKING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000100001000

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
	
	dc.l	MapStore12Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_WWHALL	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot

	dc.w	$00A2	; starting x location of npc0
	dc.w	$00DA	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$0095	; movement frequency of npc0
	dc.l	NPCMovementScene12Start	; location of movement pattern for npc0
	dc.w	(NPCMovementScene12End-NPCMovementScene12Start-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

