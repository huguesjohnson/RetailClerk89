;-------------------------------------------------------------------------------
; d2 = ID to update 
; d3 = new value
;-------------------------------------------------------------------------------
UpdateSpriteSortTable:
	move.w	(MEM_ACTIVE_NPC_COUNT),d4	; NPC_COUNT is max size of loop
	lea	MEM_SPRITE_SORT_TABLE_ID0,a4	; point a4 to the start of sort table
UpdateSpriteSortTableLoop:
	cmp.w	(a4),d2	; compare ID to d2
	bne.s	UpdateSpriteSortTableLoopDbra	; not equal, loop
	move.w	d3,(2,a4)	; copy new Y-value over
	bra.s	UpdateSpriteSortTableExit	; exit
UpdateSpriteSortTableLoopDbra:
	adda.l	#$0004,a4	; move to next entry
	dbra	d4,UpdateSpriteSortTableLoop	; decrement d4 and loop
UpdateSpriteSortTableExit:
	rts


