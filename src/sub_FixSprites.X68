;-------------------------------------------------------------------------------
; Used to fix sprites when the scene is changed
; 1) Moves the player sprite into the right place
; 2) Resets sprite links since everything breaks them
;-------------------------------------------------------------------------------
FixSprites:
	; setting SPRITE_STEP_COUNTER to SPRITE_ANIMATION_STEPS forces movement
	; animation to trigger the next time the sprite moves
	move.w	#SPRITE_ANIMATION_STEPS,(MEM_PLAYER_SPRITE_STEP_COUNTER)
	if	_SPRITE_COLLISION_
	lea	(MEM_PLAYER_SPRITE_ID),a6	; setup call to FlipSpriteMapPosition	
	bsr.w	FlipSpriteMapPosition	; block the sprite's initial position
	endif
	; update x & y values in the sprite table
	move.l	#VDP_VRAM_WRITE_SPRITE,d7	; copy VDP VRAM write address to d7
	add.l	#$00080000,d7	; add $00080000 to point to Y of 2nd sprite (player)
	move.l	d7,(VDP_CONTROL)	; set VDP write address
	move.w	(MEM_PLAYER_SPRITE_Y),(VDP_DATA)	; write new Y value
	move.l	#VDP_VRAM_WRITE_SPRITE,d7	; copy VDP VRAM write address to d7
	add.l	#$000E0000,d7	; add $00080000 to point to Y of 2nd sprite (player)
	move.l	d7,(VDP_CONTROL)	; set VDP write address
	move.w	(MEM_PLAYER_SPRITE_X),(VDP_DATA)	; write new X value
	; update sprite sort table	
	move.w	(MEM_PLAYER_SPRITE_ID),d2	; copy ID to d2
	move.w	(MEM_PLAYER_SPRITE_Y),d3	; copy new Y value to d3
	bsr.w	UpdateSpriteSortTable	; update the sprite table
	bsr.w	OrderSprites	; sort the sprite table
	; workaround to issue where links aren't set if the table is already sorted	
	move.w	#$2700,sr		; disable interrupts
	bsr.w	SetSpriteLinks
	move.w	#$2000,sr		; re-enable interrupts
ExitFixSprites:
	rts
