SceneLoad:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_DEBUGMENU

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
	dc.l	PaletteLoadScreen00	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0003	; scenery count

	; title
	dc.l	PatternTitleLogo	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0010000000000000	
	dc.w	$2000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00180000	; initial drawing location

	; title - 89
	dc.l	PatternTitleLogo89	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0110000000000000	
	dc.w	$6000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$02000000+$003E0000	; initial drawing location

	dc.l	PatternTitleBackground	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0100000000000000	
	dc.w	$4000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00380000	; initial drawing location

	; save
	dc.l	PatternStatusSave	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000000	
	dc.w	DIALOG_BASE_TILE_LOW+%1000000000000000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$06800000+$00100000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0006	; text count

	; caption for save
	dc.l	LoadScreenCaption	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%1000000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$07000000+$00120000	; initial drawing location

	; default save message
	dc.l	StatusScreenDefaultSave	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%1000000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$07800000+$00120000	; initial drawing location

	dc.l	StatusScreenDefaultSave	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%1000000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$08000000+$00120000	; initial drawing location

	dc.l	StatusScreenDefaultSave	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%1000000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$08800000+$00120000	; initial drawing location

	dc.l	StatusScreenDefaultSave	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%1000000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$09000000+$00120000	; initial drawing location

	; help text

	dc.l	LoadScreenHelp0	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%1110000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$0A000000+$00100000	; initial drawing location

	dc.l	LoadScreenHelp1	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%1110000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$0A800000+$00100000	; initial drawing location

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

	dc.w	$0000	; starting x location of npc
	dc.w	$0000	; starting y location of npc
	dc.w	DIRECTION_LEFT	; starting direction of npc
	dc.w	$FFFF	; movement frequency of npc
	dc.l	NullMovementStart	; location of movement pattern for npc
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Title	; location of background music

