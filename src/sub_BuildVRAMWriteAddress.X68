;-------------------------------------------------------------------------------
; BuildVRAMWriteAddress
; builds the VRAM write address based on a relative address
; i.e. - passing $2200 should return $62000000
; d1 = relative VDP write address, final result is also stored in d1
; d0 is modified in this routine
;-------------------------------------------------------------------------------
BuildVRAMWriteAddress:
	; the two highest bits in d1 need to be the lowest bits in the final result
	move.w	d1,d0 ; start by copying d1 to d0	
	lsr.w	#$07,d0	; shift bits 7 to the right
	lsr.w	#$07,d0	; shift bits 7 more to the right
	and.l	#%00000000000000000000000000000011,d0	; clear all but lowest two
	; the two highest bits from d1 are now in d0
	swap	d1	; move the value in d1 to the high word
	and.l	#%00111111111111110000000000000000,d1	; clear all but the magic 14
	add.l	d0,d1	; add the value in d0
	add.l	#VDP_VRAM_WRITE,d1	; add the base VRAM write address
	rts
