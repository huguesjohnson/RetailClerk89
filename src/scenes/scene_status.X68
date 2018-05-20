;-------------------------------------------------------------------------------
; this is not a full scene definition
; it only contains the parts needed to draw the status screen
;-------------------------------------------------------------------------------
SceneStatus:

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0003	; four tilesets

	; tileset 0
	dc.l	TransparentTileStart	; start of tiles
	dc.l	TransparentTileEnd	; end of tiles

	; tileset 1
	dc.l	StatusScreenMapTilesStart	; start of map tiles
	dc.l	StatusScreenMapTilesEnd	; end of map tiles

	; tileset 2
	dc.l	StatusScreenMapIconTilesStart	; start of map icon tiles
	dc.l	StatusScreenMapIconTilesEnd	; end of map icon tiles

	; tileset 3
	dc.l	StatusScreenMallLogoTilesStart	; start of map tiles
	dc.l	StatusScreenMallLogoTilesEnd	; end of map tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	PaletteStatusScreen	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0004	; scenery count

	; items
	dc.l	PatternStatusItems	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000000	
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00020000	; initial drawing location

	; save
	dc.l	PatternStatusSave	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000000	
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$001E0000	; initial drawing location

	; map
	dc.l	PatternStatusMap	; location of pattern to load
	; 		 pccvhnnnnnnnnnnn
	dc.w	%0110000000000001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00020000	; initial drawing location

	; map icon
	dc.l	Pattern8x8	; location of pattern to load
	dc.w	STATUS_SCREEN_MAP_ICON_BASE_PATTERN	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$00020000+$07000000	; initial drawing location

	; mall logo
	dc.l	Pattern80x16	; location of pattern to load
	; 		 pccvhnnnnnnnnnnn
	dc.w	%0110000000010010	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00020000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0003	; text count

	; caption for items
	dc.l	StatusScreenInventory	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A800000+$00040000	; initial drawing location

	; caption for save
	dc.l	StatusScreenSave	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A800000+$00200000	; initial drawing location

	; caption for store keys
	dc.l	StatusScreenStoreKeys	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00300000	; initial drawing location

	; caption for map
	dc.l	StatusScreenYouAreHere	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$00040000+$07000000	; initial drawing location


