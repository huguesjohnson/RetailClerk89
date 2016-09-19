;-------------------------------------------------------------------------------
; This sub-routine is not entirely my original code and not under MIT License.
; This are based off various samples available online (see credits file).
; I made some modifications but probably not enough to qualify as original work.
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; LoadPalettes
; loads 1-4 palettes into the VDP
; a0 = address of first palette to load
; d0 = number of palettes to load (1-4)
;-------------------------------------------------------------------------------
LoadPalettes:
	move.l	#VDP_CRAM_WRITE,(VDP_CONTROL) ; set up VDP write to CRAM
	mulu	#$10,d0	; multiply number of palettes by 16
	subq	#$01,d0	; subtract 1 since the loop counts to 0
LoadPalettesLoop:
	move.w	(a0)+,(VDP_DATA)	; write the palette data
	dbf	d0,LoadPalettesLoop		; decrement value of d0 and loop if not 0
	rts
