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
;-------------------------------------------------------------------------------
; fade out current palette
;-------------------------------------------------------------------------------
	bsr.w	FadeOut

;-------------------------------------------------------------------------------
; clear VDP
;-------------------------------------------------------------------------------
	bsr.w	WaitVBlank	; wait for vblank to end

	move.w	#$2700,sr		; disable interrupts

;	bsr.w	WaitVBlankEnd	; if currently in VBlank, wait
;	bsr.w	WaitVBlankStart	; wait to clear screen until VBlank starts
	bsr.w	ClearVRAM	; clear VRAM

;-------------------------------------------------------------------------------
; load tiles
;-------------------------------------------------------------------------------
	move.w	(a6)+,d7	; number of tilesets to load
	cmpi.w	#$FFFF,d7	; is there any tiles to load?
	beq.s	LoadFontTiles	; if no tiles then move to next section
	move.w	#SCENE_VDP,d1	; use d1 to track write location
	clr.l	d2	; use d2 to increment write location

LoadSceneLoadTilesLoop:
;	bsr.w	WaitVBlank	; wait for vblank to end
;	bsr.w	WaitVBlankEnd	; if currently in VBlank, wait
;	bsr.w	WaitVBlankStart	; wait to clear screen until VBlank starts
	bsr.w	BuildVRAMWriteAddress
	move.l	(a6)+,d3	; start address of tileset
	move.l	(a6)+,d0	; end address of tileset
	sub.l	d3,d0	; subtract the start address to get length
	add.l	d0,d2	; copy original value to increment write location later
	divu.w	#$0004,d0	; divide by 4 to setup call to LoadTiles
	movea.l	d3,a0	; set address of first tile to load
	bsr.w	LoadTiles	; branch to LoadTiles subroutine
	; increment write location for next tileset
	move.w	#SCENE_VDP,d1	; d1 was modified by BuildVRAMWriteAddress
	add.w	d2,d1	; add to d1 to increment write location
	dbra d7,LoadSceneLoadTilesLoop	; loop until all data is loaded

;-------------------------------------------------------------------------------
; load the font tiles
;-------------------------------------------------------------------------------
LoadFontTiles:
;	bsr.w	WaitVBlank	; wait for vblank to end
;	bsr.w	WaitVBlankEnd	; if currently in VBlank, wait
;	bsr.w	WaitVBlankStart	; wait to clear screen until VBlank starts
	move.w	#FONT_VDP,d1	; setup call to BuildVRAMWriteAddress
	bsr.w	BuildVRAMWriteAddress	; build the VRAM write address
	move.l	#FontTilesStart,d2	; start address of tileset
	move.l	#FontTilesEnd,d0	; end address of tileset
	sub.l	d2,d0	; subtract the start address to get length
	divu.w	#$0004,d0	; divide by 4 to setup call to LoadTiles
	movea.l	d2,a0	; set address of first tile to load
	bsr.w	LoadTiles	; branch to LoadTiles subroutine

;-------------------------------------------------------------------------------
; load palettes
;-------------------------------------------------------------------------------
	move.w	(a6)+,d0	; number of palettes to load
	movea.l	(a6)+,a0	; start address of palettes
	lea	MEM_SCENE_PALETTE,a1	; point a1 to scene palette address
	mulu.w	#$10,d0	; multiply number of palettes by 16
	subq.w	#$01,d0	; subtract 1 since the loop counts to 0
StorePalettesLoop:
	move.w	(a0)+,(a1)+	; write the palette data
	dbf	d0,StorePalettesLoop		; decrement value of d0 and loop if not 0

;-------------------------------------------------------------------------------
; draw the scenery
;-------------------------------------------------------------------------------
;	bsr.w	WaitVBlank	; wait for vblank to end
;	bsr.w	WaitVBlankEnd	; if currently in VBlank, wait
;	bsr.w	WaitVBlankStart	; wait to clear screen until VBlank starts
	move.w	(a6)+,d7	; number of scenery items to draw
	cmpi.w	#$FFFF,d7	; is there any sceney to draw?
	beq.s	LoadSceneDrawText	; if no scenery then move to next section
LoadSceneDrawSceneryLoop:
	movea.l	(a6)+,a0	; start address of pattern
	move.w	(a6)+,d0	; base pattern
	move.w	(a6)+,d1	; repeat
	movea.l	(a6)+,a1	; initial drawing location
	bsr.w	DrawTileset		; branch to DrawTileset subroutine
	dbra d7,LoadSceneDrawSceneryLoop	; loop until all data is loaded

;-------------------------------------------------------------------------------
; draw the text
;-------------------------------------------------------------------------------
LoadSceneDrawText:	
	move.w	(a6)+,d7	; number of scenery items to draw
	cmpi.w	#$FFFF,d7	; are there any items to draw?
	beq.s	ExitDrawScene	; if no items then move to next section
LoadSceneDrawTextLoop:
	movea.l	(a6)+,a0	; start address of text
	move.w	(a6)+,d0	; base pattern
	movea.l	(a6)+,a1	; initial drawing location
	; read & draw the string character by character until ETX is reached
LoadSceneDrawTextNextCharacter:
	clr	d6	; clear out d6
	move.b	(a0),d6	; copy current character to d6
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.s	LoadSceneDrawTextLoopEnd	; end of this string, move to next one
	sub.w	#$20,d6	; subtract 32 to get the character index
	; draw the character
	add.w	d0,d6	; add the base tile
	move.l	a1,(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VPD
	; increment for next character
	adda.l	#$00000001,a0	; move to next character in the string
	add.l	#$00020000,a1	; move to the next column
	bra.s	LoadSceneDrawTextNextCharacter	; repeat until ETX is reached
LoadSceneDrawTextLoopEnd:
	dbra d7,LoadSceneDrawTextLoop	; loop until all data is loaded

ExitDrawScene:
	move.w	#$2000,sr		; re-enable interrupts
	rts

