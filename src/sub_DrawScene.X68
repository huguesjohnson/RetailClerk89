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
	move.l	#SCENE_VDP,d6	; use d6 to track write location
LoadSceneLoadTilesLoop:
	move.l	(a6)+,d1	; start address of tileset
	move.l	(a6)+,d0	; end address of tileset
	sub.l	d1,d0	; subtract the start address to get length
	move.l	d0,d2	; copy original value to increment write location later
	divu.w	#$0004,d0	; divide by 4 to setup call to LoadTiles
	movea.l	d1,a0	; set address of first tile to load
	move.l	d6,d1	; set initial write location
	bsr.w	LoadTiles	; branch to LoadTiles subroutine
	; increment write location for next tileset
	swap	d2	; d2 has the size of the last tileset, swap it to upper word
	add.l	d2,d6	; add to d6 to increment write location
	dbra d7,LoadSceneLoadTilesLoop	; loop until all data is loaded

;-------------------------------------------------------------------------------
; load palettes
;-------------------------------------------------------------------------------
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

