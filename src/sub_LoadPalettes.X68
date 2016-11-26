;-------------------------------------------------------------------------------
; This sub-routine was based off examples noted in the CREDITS file.
; The modifications I made were:
; 	(1) Support for loading 1-4 palettes at a time
;	(2) Making the write address a parameter
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; LoadPalettes
; loads 1-4 palettes into the VDP
; a0 = address of first palette to load
; d0 = number of palettes to load (1-4)
; d1 = VDP write address
;-------------------------------------------------------------------------------
LoadPalettes:
	move.l	d1,(VDP_CONTROL) ; set up VDP write to CRAM
	mulu	#$10,d0	; multiply number of palettes by 16
	subq	#$01,d0	; subtract 1 since the loop counts to 0
LoadPalettesLoop:
	move.w	(a0)+,(VDP_DATA)	; write the palette data
	dbf	d0,LoadPalettesLoop		; decrement value of d0 and loop if not 0
	rts
