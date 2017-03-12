;-------------------------------------------------------------------------------
; compute offset for action table lookups 
;-------------------------------------------------------------------------------
BuildActionTableOffset:
	move.w	MEM_DAY,d7
	mulu.w	#SCENE_COUNT_X_ACTION_COUNT_X4,d7
	move.w	d7,(MEM_ACTION_TABLE_OFFSET)
	move.w	MEM_ACTIVE_SCENE_ID,d7
	mulu.w	#ACTION_COUNT_X4,d7
	add.w	d7,(MEM_ACTION_TABLE_OFFSET)
	move.w	MEM_ACTION_ID,d7
	mulu.w	#LWORD_SIZE,d7
	add.w	d7,(MEM_ACTION_TABLE_OFFSET)
	rts
