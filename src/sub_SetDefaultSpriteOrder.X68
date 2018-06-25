;-------------------------------------------------------------------------------
; loads sprites in reverse order because scene definitions typically
; have NPCs pre-sorted by Y value in ascending order
;-------------------------------------------------------------------------------
SetDefaultSpriteOrder:
	; clear the sprite order table - paranoid step really
	move.l	#$00000000,(MEM_SPRITE_SORT_TABLE_ID0)
	move.l	#$00000000,(MEM_SPRITE_SORT_TABLE_ID1)
	move.l	#$00000000,(MEM_SPRITE_SORT_TABLE_ID2)
	move.l	#$00000000,(MEM_SPRITE_SORT_TABLE_ID3)
	move.w	(MEM_ACTIVE_NPC_COUNT),d4	; NPC_COUNT is max size of loop
	clr	d3	; use d3 to store offset
	move.w	d4,d3	; use d3 to store offset
	mulu.w	#NPC_RECORD_SIZE,d3	; multiply by NPC record size to get offset
	lea	MEM_PLAYER_SPRITE_ID,a5	; point to first sprite
	adda.l	d3,a5	; move to last NPC
	lea	MEM_SPRITE_SORT_TABLE_ID0,a4	; point a4 to the start of sort table
SetDefaultSpriteOrderLoop:
	move.w	(STRUCT_SPRITE_ID,a5),(a4)	; copy sprite ID
	move.w	(STRUCT_SPRITE_Y,a5),(2,a4)	; copy Y-value
	suba.l	#NPC_RECORD_SIZE,a5	; move to previous sprite
	adda.l	#LWORD_SIZE,a4	; move to next sort table entry
	dbra	d4,SetDefaultSpriteOrderLoop	; decrement d4 and loop
	rts
