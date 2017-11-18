;-------------------------------------------------------------------------------
; This sub-routine was based off examples noted in the CREDITS file.
; The modifications include:
;	-Converting example code into a parameterized function
;	-Support for patterns and repeating patterns
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; DrawTileset
; draws a set of tiles 
; Parameters
; a0 = starting address of tileset
; a1 = initial VRAM write address
; d0 = base pattern (ID+palette+high/low) of first tile in the tileset
; d1 = number of times to repeat the pattern
; other registers used
; a2 = used to reference current VRAM write address
; d2 = number of rows in the tileset
; d3 = number of columns in the tileset 
; d4 = used to store the VDP pattern 
; d5 = loop counter
; d6 = loop counter
;-------------------------------------------------------------------------------
DrawTileset:
	move.w	(a0)+,d2	; store the number of rows
	move.w	(a0)+,d3	; store the number of columns
DrawTilesetOuterLoop:
	movea.l	a0,a2	; reset a2 to starting address
	move.w	d2,d5	; reset d5 to store the number of rows to loop over
DrawTilesetRowLoop:
	move.w	d3,d6	; reset d6 to store the number of columns to loop over
	move.l	a1,(VDP_CONTROL)	; set VDP address
DrawTilesetColumnLoop:
	move.w	(a2)+,d4	; store the next tile index in d4
	add.w	d0,d4	; add base tile ID to tile index
	; draw the tile
	move.w  d4,(VDP_DATA)	; copy the pattern to VPD
	dbf	d6,DrawTilesetColumnLoop	; decrement value of d6 (column) and loop 
	adda.l	#ROW_HEIGHT,a1	; move to the next row
	dbf	d5,DrawTilesetRowLoop	; decrement value of d5 (row) and loop
	dbf	d1,DrawTilesetOuterLoop	; decrement value of d1 (repeat) and loop
	rts
