;-------------------------------------------------------------------------------
; This sub-routine was based off examples noted in the CREDITS file.
; The main modification I made was making the VDP write address a parameter.
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; LoadTiles
; loads tiles into the VDP
; a0 = address of first tile to load
; d0 = number of tiles to load
; d1 = VDP write address
;-------------------------------------------------------------------------------
LoadTiles:
	subq	#$01,d0	; iterate over ((number of tiles to load) - 1)
	move.l	d1,(VDP_CONTROL)	; set address for VDP write
LoadTilesLoop:
	move.l (a0)+,(VDP_DATA)	; move data to VDP & increment address
	dbra d0,LoadTilesLoop	; loop until all data is loaded
	rts
