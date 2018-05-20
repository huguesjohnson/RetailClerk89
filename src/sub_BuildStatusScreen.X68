BuildStatusScreen:
	;---------------------------------------------------------------------------
	; determine spot for "you are here" icon
	;---------------------------------------------------------------------------
	move.w	(MEM_ACTIVE_SCENE_ID),d6	; copy active scene ID to d6
	mulu.w	#$4,d6	; multiply by 4 to get offset
	lea	StatusMapIconLocationTable,a6	; point a6 to the scene definition table
	adda.l	d6,a6	; move to offset
	move.l	(a6),(VDP_CONTROL) ; set drawing location
	move.w  #STATUS_SCREEN_MAP_ICON_BASE_PATTERN,(VDP_DATA)	; copy pattern

	rts
