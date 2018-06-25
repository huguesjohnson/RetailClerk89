;-------------------------------------------------------------------------------
; SetSpriteLink
; sets the sprite link field for a sprite 
; Parameters
; d2 = ID of sprite to change
; d3 = ID of sprite to link to
; d5 is modified in this routine
;-------------------------------------------------------------------------------
SetSpriteLink:
	move.l	#VDP_VRAM_WRITE_SPRITE,d5	; start at base sprite vram address
	cmpi.w	#$0000,d2	; is this sprite zero?
	bne.s	.1	; branch if not sprite zero
	; sprite 0 is 8x8 so leave d3 as #$0000 - we can also skip the mulu step
	add.l	#$00020000,d5	; move to index 2
	bra.s	.2	; branch to end of routine
.1
	; workaround for lack of mulu.l on 68000
	mulu.w	#$0008,d2	; move to address of sprite to modify	
	swap	d2	; move result to high word
	and.l	#$FFFF0000,d2	; clear low word
	add.l	d2,d5	; add address of sprite to modify
	add.l	#$00020000,d5	; move to index 2
	add.w	#SPRITE_DEF_WORD2_BASE,d3	; add base value to link field in d3
.2
	move.l	d5,(VDP_CONTROL)	; set write location in VDP
	move.w	d3,(VDP_DATA)	; store new sprite link field
	rts
