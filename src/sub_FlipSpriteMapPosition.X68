;-------------------------------------------------------------------------------
; Flips the map data where a sprite is located from 0 to 1 or 1 to 0
; a6 = address of sprite info start
; a6 is not modified in this subroutine
; a3 is modified used to reference collision data
; d6 is modified to temporarily store sprite row & column
; d7 is modified to store & update map collision data
;-------------------------------------------------------------------------------
FlipSpriteMapPosition:
	bsr.w	SetActiveSpriteMapRowCol	; set the active map position
	;---------------------------------------------------------------------------
	; block the left side of the sprite
	;---------------------------------------------------------------------------
	move.w	(MEM_ACTIVE_SPRITE_LEFT_COLUMN),d6	; copy left column to d6
	lea		MEM_COLLISION_DATA,a3	; move start address of map data to a3
	adda.w	(MEM_ACTIVE_SPRITE_HIGH_LEFT),a3 ; move to row
	move.l	(a3),d7	; copy row data to memory
	bchg.l	d6,d7	; flip the map data from 0 to 1 or 1 to 0
	move.l	d7,(a3)	; save the map data back
	lea		MEM_COLLISION_DATA,a3	; move start address of map data to a3
	adda.w	(MEM_ACTIVE_SPRITE_LOW_LEFT),a3 ; move to row
	move.l	(a3),d7	; copy row data to memory
	bchg.l	d6,d7	; flip the map data from 0 to 1 or 1 to 0
	move.l	d7,(a3)	; save the map data back
	;---------------------------------------------------------------------------
	; block the right side of the sprite
	;---------------------------------------------------------------------------
	move.w	(MEM_ACTIVE_SPRITE_RIGHT_COLUMN),d6	; copy right column to d6
	lea		MEM_COLLISION_DATA,a3	; move start address of map data to a3
	adda.w	(MEM_ACTIVE_SPRITE_HIGH_RIGHT),a3 ; move to row
	move.l	(a3),d7	; copy row data to memory
	bchg.l	d6,d7	; flip the map data from 0 to 1 or 1 to 0
	move.l	d7,(a3)	; save the map data back
	lea		MEM_COLLISION_DATA,a3	; move start address of map data to a3
	adda.w	(MEM_ACTIVE_SPRITE_LOW_RIGHT),a3 ; move to row
	move.l	(a3),d7	; copy row data to memory
	bchg.l	d6,d7	; flip the map data from 0 to 1 or 1 to 0
	move.l	d7,(a3)	; save the map data back
	;---------------------------------------------------------------------------
	; if the sprite is occupying 3 columns (common) then block the middle
	;---------------------------------------------------------------------------
	move.w	(MEM_ACTIVE_SPRITE_LEFT_COLUMN),d7	; copy left column to d7
	move.w	(MEM_ACTIVE_SPRITE_RIGHT_COLUMN),d6	; copy right column to d6
	cmp.w	d7,d6	; test if the right column is greater than the left column
	bgt.s	.1	; if left is greater then the sprite is crossing the middle
	; if the right column = 1 here then the sprite is on different map halves
	cmpi.w	#$0001,d6	; test if right column is 1
	blt.s	.2	; if right column is 1 then continue otherwise branch
	;---------------------------------------------------------------------------
	; block middle column based on right columns
	;---------------------------------------------------------------------------
.1	; right and left side of sprite are on the same half of the map
	subq	#$0001,d6	; decrement right column
	cmp.w	d7,d6	; test if the right and left are touching
	beq.s	ExitFlipSpriteMapPosition ; if they are touching, exit
	; at this point d6 has the middle column
	lea		MEM_COLLISION_DATA,a3	; move start address of map data to a3
	adda.w	(MEM_ACTIVE_SPRITE_HIGH_RIGHT),a3 ; move to row
	move.l	(a3),d7	; copy row data to memory
	bchg.l	d6,d7	; flip the map data from 0 to 1 or 1 to 0
	move.l	d7,(a3)	; save the map data back
	lea		MEM_COLLISION_DATA,a3	; move start address of map data to a3
	adda.w	(MEM_ACTIVE_SPRITE_LOW_RIGHT),a3 ; move to row
	move.l	(a3),d7	; copy row data to memory
	bchg.l	d6,d7	; flip the map data from 0 to 1 or 1 to 0
	move.l	d7,(a3)	; save the map data back
	bra.s	ExitFlipSpriteMapPosition
	;---------------------------------------------------------------------------
	; block middle column based on left columns when right column is zero
	;---------------------------------------------------------------------------
.2	; right & left sides of the sprite are on different halves of the map
	cmpi.w	#$001F,d7	; if left column is 1F the sprite is occupying 2 columns
	beq.s	ExitFlipSpriteMapPosition	; exit if the sprite is only 2 columns
	; otherwise block column 1F in the left rows
	moveq	#$001F,d6	; copy left column to d6
	lea		MEM_COLLISION_DATA,a3	; move start address of map data to a3
	adda.w	(MEM_ACTIVE_SPRITE_HIGH_LEFT),a3 ; move to row
	move.l	(a3),d7	; copy row data to memory
	bchg.l	d6,d7	; flip the map data from 0 to 1 or 1 to 0
	move.l	d7,(a3)	; save the map data back
	lea		MEM_COLLISION_DATA,a3	; move start address of map data to a3
	adda.w	(MEM_ACTIVE_SPRITE_LOW_LEFT),a3 ; move to row
	move.l	(a3),d7	; copy row data to memory
	bchg.l	d6,d7	; flip the map data from 0 to 1 or 1 to 0
	move.l	d7,(a3)	; save the map data back
ExitFlipSpriteMapPosition:
	rts
