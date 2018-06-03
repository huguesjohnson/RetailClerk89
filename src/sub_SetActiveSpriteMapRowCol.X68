;-------------------------------------------------------------------------------
; SetActiveSpriteMapRowCol
; sets values for:
;	MEM_ACTIVE_SPRITE_LEFT_COLUMN
;	MEM_ACTIVE_SPRITE_RIGHT_COLUMN
;	MEM_ACTIVE_SPRITE_HIGH_LEFT
;	MEM_ACTIVE_SPRITE_HIGH_RIGHT
;	MEM_ACTIVE_SPRITE_LOW_LEFT
;	MEM_ACTIVE_SPRITE_LOW_RIGHT
; a6 = address of sprite info start
; d6 is used to store x values
; d5 is used to store y values
; d7 is used for all other operations
;-------------------------------------------------------------------------------
SetActiveSpriteMapRowCol:
SetActiveSpriteLeftCol:
	; copy sprite x postion to d7
	clr.l	d7
	move.w	(STRUCT_SPRITE_X,a6),d7	; store sprite x in d7
	move.l	d7,d6	; copy to d6 for later use
	and.w	#$00FF,d7 ; remove all bits over 255
	divu.w	#$08,d7 ; divide by 8 to get index in map data
	; clear remainder from high word (easy68k.com/paulrsm/doc/trick68k.htm)
	swap d7		; swap upper and lower words
	clr.w d7	; clear the upper word
	swap d7		; swap back
	move.w	d7,(MEM_ACTIVE_SPRITE_LEFT_COLUMN)	; copy left column value
SetActiveSpriteLeftHighLow:
	; copy sprite y postion to d7
	move.w	(STRUCT_SPRITE_Y,a6),d7	; store sprite y in d7
	add.w	#$18,d7	; top edge of lower 1/4
	move.w	d7,d5	; copy the adjusted y value 
	addq	#$08,d5	; move d5 to bottom edge of lower 1/4
	; map the sprite y position to a column
	andi.b	#%11111000,d7	; clear bits 0-2 to round to nearest power of 8
	andi.b	#%11111000,d5	; clear bits 0-2 to round to nearest power of 8
	cmpi.w	#MAP_MID_X,d6	; is column on the left or right side of the screen?
	blt.s	.2	; branch if on left side
	addq	#$0004,d7	; on the right side, use 2nd lword for the column
	addq	#$0004,d5	; on the right side, use 2nd lword for the column
.2
	move.w	d7,(MEM_ACTIVE_SPRITE_HIGH_LEFT)	; copy high left value 
	move.w	d5,(MEM_ACTIVE_SPRITE_LOW_LEFT)	; copy low left value
SetActiveSpriteRightCol:	
	add.w	#$0F,d6	; move d6 to right side of sprite
	move.w	d6,d7	; store sprite x in d7
	and.w	#$00FF,d7 ; remove all bits over 255
	divu.w	#$08,d7 ; divide by 8 to get index in map data
	; clear remainder from high word (easy68k.com/paulrsm/doc/trick68k.htm)
	swap d7		; swap upper and lower words
	clr.w d7	; clear the upper word
	swap d7		; swap back
	move.w	d7,(MEM_ACTIVE_SPRITE_RIGHT_COLUMN)	; copy left column value
SetActiveSpriteRightHighLow:
	; copy sprite y postion to d7
	move.w	(STRUCT_SPRITE_Y,a6),d7	; store sprite y in d7
	add.w	#$18,d7	; top edge of lower 1/4
	move.w	d7,d5	; copy the adjusted y value 
	addq	#$08,d5	; move d5 to bottom edge of lower 1/4
	; map the sprite y position to a column
	andi.b	#%11111000,d7	; clear bits 0-2 to round to nearest power of 8
	andi.b	#%11111000,d5	; clear bits 0-2 to round to nearest power of 8
	cmpi.w	#MAP_MID_X,d6	; is column on the left or right side of the screen?
	blt.s	.4	; branch if on left side
	addq	#$0004,d7	; on the right side, use 2nd lword for the column
	addq	#$0004,d5	; on the right side, use 2nd lword for the column
.4
	move.w	d7,(MEM_ACTIVE_SPRITE_HIGH_RIGHT)	; copy high left value
	move.w	d5,(MEM_ACTIVE_SPRITE_LOW_RIGHT)	; copy low left value
	rts

