;-------------------------------------------------------------------------------
; This sub-routine is not entirely my original code and not under MIT License.
; This are based off various samples available online (see credits file).
; I made some modifications but probably not enough to qualify as original work.
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; DrawTileset
; draws a set of tiles 
; Parameters
; a1 = starting address of tileset
; d0 = base pattern (ID+palette+high/low) of first tile in the tileset
; d1 = number of rows in the tileset
; d2 = number of columns in the tileset 
; d3 = initial VRAM write address
; other registers used
; d6 = loop counter
; d7 = used to store the VDP pattern 
;-------------------------------------------------------------------------------
DrawTileset:
DrawCounterRowLoop:
	move.w	d2,d6	; reset d6 to store the number of columns to loop over
	move.l	d3,(VDP_CONTROL)	; set VDP address
DrawCounterColumnLoop:
	move.w	(a1)+,d7	; store the next tile index in d7
	add.w	d0,d7	; add base tile ID to tile index
	; draw the tile
	move.w  d7,(VDP_DATA)	; copy the pattern to VPD
	dbf	d6,DrawCounterColumnLoop	; decrement value of d6 (column) and loop 
	add.l	#ROW_HEIGHT,d3	; move to the next row
	dbf	d1,DrawCounterRowLoop	; decrement value of d1 (row) and loop until 0
	rts
