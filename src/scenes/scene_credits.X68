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
SceneCredits:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CREDITS

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; no tilesets

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	TextOnlyPalettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; no scenery

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$001B	; text count

	dc.l	CreditsScreen00Line00	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0110000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$00000000	; initial drawing location

	dc.l	CreditsScreen00Line01	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	dc.l	CreditsScreen00Line02	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$01000000	; initial drawing location

	dc.l	CreditsScreen00Line03	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$01800000	; initial drawing location

	dc.l	CreditsScreen00Line04	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$02000000	; initial drawing location

	dc.l	CreditsScreen00Line05	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$02800000	; initial drawing location

	dc.l	CreditsScreen00Line06	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$03000000	; initial drawing location

	dc.l	CreditsScreen00Line07	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0000000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$03800000	; initial drawing location

	dc.l	CreditsScreen00Line08	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$04000000	; initial drawing location

	dc.l	CreditsScreen00Line09	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$04800000	; initial drawing location

	dc.l	CreditsScreen00Line0A	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$05000000	; initial drawing location

	dc.l	CreditsScreen00Line0B	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$05800000	; initial drawing location

	dc.l	CreditsScreen00Line0C	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$06000000	; initial drawing location

	dc.l	CreditsScreen00Line0D	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$06800000	; initial drawing location

	dc.l	CreditsScreen00Line0E	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$07000000	; initial drawing location

	dc.l	CreditsScreen00Line0F	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$07800000	; initial drawing location

	dc.l	CreditsScreen00Line10	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000	; initial drawing location

	dc.l	CreditsScreen00Line11	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0000000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08800000	; initial drawing location

	dc.l	CreditsScreen00Line12	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	dc.l	CreditsScreen00Line13	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09800000	; initial drawing location

	dc.l	CreditsScreen00Line14	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A000000	; initial drawing location

	dc.l	CreditsScreen00Line15	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A800000	; initial drawing location

	dc.l	CreditsScreen00Line16	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B000000	; initial drawing location

	dc.l	CreditsScreen00Line17	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B800000	; initial drawing location

	dc.l	CreditsScreen00Line18	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	dc.l	CreditsScreen00Line19	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0C800000	; initial drawing location

	dc.l	CreditsScreen00Line1A	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0D000000	; initial drawing location

	dc.l	CreditsScreen00Line1B	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

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
	dc.w	SCENE_ID_END	; north exit
	dc.w	SCENE_ID_END	; south exit
	dc.w	SCENE_ID_END	; east exit
	dc.w	SCENE_ID_END	; west exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc
	dc.w	$0000	; starting y location of npc
	dc.w	DIRECTION_LEFT	; starting direction of npc
	dc.w	$FFFF	; movement frequency of npc
	dc.l	NullMovementStart	; location of movement pattern for npc
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_End	; location of background music

