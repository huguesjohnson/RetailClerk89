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
SceneEnd:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_END

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0001	; two tilesets

	; tileset 0
	dc.l	TransparentTileStart	; start of scene tiles
	dc.l	TransparentTileEnd	; end of scene tiles

	; tileset 1
	dc.l	TitleScreenTilesStart	; start of scene tiles
	dc.l	TitleScreenTilesEnd	; end of scene tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	PaletteEndScreen00	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0002	; scenery count

	; title
	dc.l	PatternTitleLogo	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000000000	
	dc.w	$2000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$01800000+$00100000	; initial drawing location

	; title - 89
	dc.l	PatternTitleLogo89	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0110000000000000	
	dc.w	$6000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$01800000+$00360000	; initial drawing location

	; graphics behind title
	dc.l	PatternTitleBackground	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0100000000000000	
	dc.w	$4000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00300000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0008	; text count

	dc.l	LegalScreenLine00	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$05800000	; initial drawing location

	dc.l	LegalScreenLine01	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$06800000	; initial drawing location

	dc.l	CreditsScreen00Line1B	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$07800000	; initial drawing location

	dc.l	EndScreenTextLine1	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08800000	; initial drawing location

	dc.l	EndScreenTextLine2	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09800000	; initial drawing location

	dc.l	EndScreenTextLine3	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A000000	; initial drawing location

	dc.l	EndScreenTextLine4	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B000000	; initial drawing location

	dc.l	EndScreenTextLine5	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B800000	; initial drawing location

	dc.l	EndScreenTextLine6	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0C800000	; initial drawing location

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
	dc.w	SCENE_ID_TITLE	; north exit
	dc.w	SCENE_ID_TITLE	; south exit
	dc.w	SCENE_ID_TITLE	; east exit
	dc.w	SCENE_ID_TITLE	; west exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc2
	dc.w	$0000	; starting y location of npc2
	dc.w	DIRECTION_LEFT	; starting direction of npc2
	dc.w	$FFFF	; movement frequency of npc2
	dc.l	NullMovementStart	; location of movement pattern for npc2
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_End	; location of background music

