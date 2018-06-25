;-------------------------------------------------------------------------------
; not to be confused with SetSpriteLink..
; this loops through the sprite sort table & calls SetSpriteLink for each entry
; it also addresses the case where the player is the only sprite
;-------------------------------------------------------------------------------
SetSpriteLinks:
	; clearing d2 & d3 prevents a bug that only occurred on the Firecore
	clr.l	d2
	clr.l	d3
	; sprite zero points to the first record in the table
	moveq	#$0000,d2
	move.w	(MEM_SPRITE_SORT_TABLE_ID0),d3
	bsr.w	SetSpriteLink
	; loop through the others
	move.w	(MEM_ACTIVE_NPC_COUNT),d4	; NPC_COUNT-1 is size of loop
	bne.s	.1	; exit if there aren't any NPCs
	; no NPC sprites - set last link and exit
	move.w	(MEM_SPRITE_SORT_TABLE_ID0),d2
	moveq	#$0000,d3
	bsr.w	SetSpriteLink
	bra.s	ExitSetSpriteLinks	; exit
.1
	subq	#$1,d4	; NPC_COUNT-1 is size of loop
	lea	MEM_SPRITE_SORT_TABLE_ID0,a4	; point a4 to the second of sort table
SetSpriteLinksLoop:
	move.w	(a4),d2	; copy sprite ID to d2
	move.w	(4,a4),d3	; copy next sprite ID to d3
	bsr.w	SetSpriteLink	; save the link
	adda.l	#$0004,a4	; move to next entry
	dbra	d4,SetSpriteLinksLoop	; decrement d4 and loop
	; save the link for the last sprite
	; this is done so any sprites past NPC_COUNT-1 don't accidentally display
	move.w	(a4),d2	; copy sprite ID to d2
	moveq	#$0000,d3	; points to sprite 0
	bsr.w	SetSpriteLink	; save the link
	move.w	#$0000,(MEM_SPRITE_Y_ORDER_CHANGED)	; clear Y order changed
ExitSetSpriteLinks:	
	rts
