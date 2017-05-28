;-------------------------------------------------------------------------------
; DrawScene
; loads tiles and palettes then draws the scene 
; Parameters
; a6 = starting address of scene to load
; other registers used
; a0 & a1 are used to call other subroutines
; assume that d0-d7 are used either by this subroutine or others it calls
;-------------------------------------------------------------------------------
DrawScene:
	move.w	#$2700,sr		; disable interrupts

;-------------------------------------------------------------------------------
; load tiles
;-------------------------------------------------------------------------------
	move.w	(a6)+,d7	; number of tilesets to load
	move.w	#SCENE_VDP,d1	; use d1 to track write location

LoadSceneLoadTilesLoop:
	bsr.w	WaitVBlank	; added to resolve issue running in Genecyst
	bsr.w	BuildVRAMWriteAddress
	move.l	(a6)+,d3	; start address of tileset
	move.l	(a6)+,d0	; end address of tileset
	sub.l	d3,d0	; subtract the start address to get length
	move.l	d0,d2	; copy original value to increment write location later
	divu.w	#$0004,d0	; divide by 4 to setup call to LoadTiles
	movea.l	d3,a0	; set address of first tile to load
	bsr.w	LoadTiles	; branch to LoadTiles subroutine
	; increment write location for next tileset
	add.w	d2,d1	; add to d6 to increment write location
	dbra d7,LoadSceneLoadTilesLoop	; loop until all data is loaded

;-------------------------------------------------------------------------------
; load palettes
;-------------------------------------------------------------------------------

	bsr.w	WaitVBlank	; added to resolve issue running in Genecyst
	; setup call to LoadPalettes
	move.w	(a6)+,d0	; number of palettes to load
	movea.l	(a6)+,a0	; start address of palettes
	move.l	#VDP_CRAM_WRITE,d1	; initial write address
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine

;-------------------------------------------------------------------------------
; draw the scenery
;-------------------------------------------------------------------------------
	move.w	(a6)+,d7	; number of tilesets to load
LoadSceneDrawSceneryLoop:
	movea.l	(a6)+,a0	; start address of pattern
	move.w	(a6)+,d0	; base pattern
	move.w	(a6)+,d1	; repeat
	movea.l	(a6)+,a1	; initial drawing location
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	dbra d7,LoadSceneDrawSceneryLoop	; loop until all data is loaded

ExitDrawScene:
	move.w	#$2000,sr		; re-enable interrupts
	rts

