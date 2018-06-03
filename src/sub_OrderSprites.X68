;-------------------------------------------------------------------------------
; this is all working as expected, which is a huge improvement over
; previous attempts to implement this
;
; it's still very hard-coded and inefficient - the next iteration might
; make these two problems better, or possibly worse
;-------------------------------------------------------------------------------
OrderSprites:
	move.w	#$2700,sr		; disable interrupts
	; clear MEM_SPRITE_Y_ORDER_CHANGED to reuse it in this routine
	move.w	#$0000,(MEM_SPRITE_Y_ORDER_CHANGED)	; clear Y order changed
;-------------------------------------------------------------------------------
; yes, this is a bubble sort, no it's not an awesome algorithm 
; for a small number of entries it's OK
;-------------------------------------------------------------------------------
	tst.w	(MEM_ACTIVE_NPC_COUNT)	; test if there are 0 NPCs
	bne.s	SpriteYSortLoopOuter	; there are not 0 NPCs, branch
	;---------------------------------------------------------------------------
	; handle case where there are 0 NPCs
	;---------------------------------------------------------------------------
	; have sprite zero point to the player sprite
	moveq	#$0000,d2	; sprite zero is the sprite to edit
	moveq	#$0001,d3	; player sprite is the sprite to link to
	bsr.w	SetSpriteLink	; set the sprite link
	; have player sprite point to sprite zero
	moveq	#$0001,d2	; player sprite is the sprite to edit
	moveq	#$0000,d3	; sprite zero is the sprite to link to
	bsr.w	SetSpriteLink	; set the sprite link
	bra.w	ExitOrderSprites	; exit
SpriteYSortLoopOuter:
	move.w	#$0000,(MEM_SPRITE_SORT_TABLE_SORTED)	; start with table sorted
	lea	MEM_SPRITE_SORT_TABLE_ID0,a4	; point a4 to the start of sort table
	move.w	(MEM_ACTIVE_NPC_COUNT),d4	; NPC_COUNT-1 is number of times to loop
	subq	#$1,d4
SpriteYSortLoopInner:
	move.w	(2,a4),d2	; copy first Y-value to d2
	cmp.w	(6,a4),d2	; compare it to the next Y-value
	bge.s	SpriteYSortLoopInnerDbra	; loop if they are in the right order
	move.w	#$FFFF,(MEM_SPRITE_SORT_TABLE_SORTED)	; update to sort again
	move.w	#$FFFF,(MEM_SPRITE_Y_ORDER_CHANGED)	; flag Y order changed
	; swap IDs, using d3 as the swap variable	
	move.w	(a4),d3
	move.w	(4,a4),(a4)
	move.w	d3,(4,a4)
	; swap Y-values, using d3 as the swap variable	
	move.w	(2,a4),d3
	move.w	(6,a4),(2,a4)
	move.w	d3,(6,a4)
SpriteYSortLoopInnerDbra:
	adda.l	#$0004,a4	; move to next entry
	dbra	d4,SpriteYSortLoopInner	; decrement d4 and loop
	tst.w	(MEM_SPRITE_SORT_TABLE_SORTED)	; test if the table changed
	bne.s	SpriteYSortLoopOuter	; if so then run another pass through
;-------------------------------------------------------------------------------
; write the new sprite links to the sprite table 
;-------------------------------------------------------------------------------
	; don't update VPD is the order hasn't changed
	tst.w	(MEM_SPRITE_Y_ORDER_CHANGED)	; test MEM_SPRITE_Y_ORDER_CHANGED
	beq.w	ExitOrderSprites	; MEM_SPRITE_Y_ORDER_CHANGED = 0, exit
	bsr.w	SetSpriteLinks	; loops through the table and sets links

ExitOrderSprites:
	move.w	#$2000,sr		; re-enable interrupts
	rts

