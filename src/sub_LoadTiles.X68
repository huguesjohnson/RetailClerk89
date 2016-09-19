;-------------------------------------------------------------------------------
; This sub-routine is not entirely my original code and not under MIT License.
; This are based off various samples available online (see credits file).
; I made some modifications but probably not enough to qualify as original work.
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; LoadTiles
; loads tiles into the VDP
; a0 = address of first tile to load
; d0 = number of tiles to load
;-------------------------------------------------------------------------------
LoadTiles:
	; need to have the loop iterate over ((number of tiles to load) - 1)
	subq	#$01,d0
	move.l	#VDP_VRAM_WRITE,(VDP_CONTROL)	; set address for VDP write
LoadTilesLoop:
	move.l (a0)+,(VDP_DATA)				; move data to VDP & increment address
	dbra d0,LoadTilesLoop				; loop until all data is loaded
	rts
