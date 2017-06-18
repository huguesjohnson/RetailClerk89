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
SceneTitle:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TITLE

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0001	; two tilesets

	; tileset 0
	dc.l	TransparentTileStart	; start of scene tiles
	dc.l	TransparentTileEnd	; end of scene tiles

	; tileset 1
	dc.l	TileScreenTilesStart	; start of scene tiles
	dc.l	TileScreenTilesEnd	; end of scene tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; three palettes
	dc.l	PaletteTitleScreen00	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0004	; scenery count

	; title
	dc.l	PatternTitleLogo	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000000000	
	dc.w	$2000	; base pattern
	dc.w	$0000	; repeat 1 time
	; row 10 (128x10 = #500), column 4 (4x4 = #10) => #510
	dc.l	VDP_VRAM_WRITE_A+$05100000	; initial drawing location

	; title - 89
	dc.l	PatternTitleLogo89	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0110000000000000	
	dc.w	$6000	; base pattern
	dc.w	$0000	; repeat 1 time
	; row 10 (128x10 = #500), column 4 (4x4 = #10) => #510
	dc.l	VDP_VRAM_WRITE_A+$05360000	; initial drawing location

	; graphics behind title
	dc.l	PatternTitleBackground	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0100000000000000	
	dc.w	$4000	; base pattern
	dc.w	$0000	; repeat 1 time
	; row 7 (128x7 = #380), column 12 (12x4 = #30) => #3B0
	dc.l	VDP_VRAM_WRITE_B+$03B00000	; initial drawing location

	; menu
	dc.l	PatternTitleMenu	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0110000000000000	
	dc.w	$6000	; base pattern
	dc.w	$0000	; repeat 1 time
	; row 20  (128x20 = #A00), column 15 (15x4 = #3C) => A3C
	dc.l	VDP_VRAM_WRITE_A+$0A3C0000	; initial drawing location

	; footer
	dc.l	PatternTitleFooter	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000000	
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.w	$0000	; repeat 1 time
	; row 24  (128x24 = #C00), column 0 (0x4 = #0) => 0
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0001	; text count

	; new game text
	dc.l	TitleScreenTextNewGame	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0110000000000000	; base pattern
	; row 20  (128x20 = #A00), column 16 (16x4 = #3C) => A40
	dc.l	VDP_VRAM_WRITE_A+$0A400000	; initial drawing location

	; footer
	dc.l	TitleScreenTextFooter	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	; this will need to be shifted around a little while the build name changes 
	dc.l	VDP_VRAM_WRITE_A+$0C8E0000	; initial drawing location

	;---------------------------------------------------------------------------
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
	dc.w	$0000	; no collision data
	
	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_VB	; north exit
	dc.w	SCENE_ID_VB	; south exit
	dc.w	SCENE_ID_VB	; east exit
	dc.w	SCENE_ID_VB	; west exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	; npc2
	dc.w	$0000	; starting x location of npc2
	dc.w	$0000	; starting y location of npc2
	dc.w	DIRECTION_LEFT	; starting direction of npc2
	dc.w	$FFFF	; movement frequency of npc2
	dc.l	NullMovementStart	; location of movement pattern for npc2
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Title	; location of background music

