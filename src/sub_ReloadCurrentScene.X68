;*******************************************************************************
; Reloads the current scene while preserving sprite x,y
; This is needed in two cases:
; 1) Loading a save game where the sprites are not in default x,y
; 2) Returning from status screen when sprites have left the scene
;    (addressing a bug that happens during some scripted event transition)
;*******************************************************************************
ReloadCurrentScene:
	move.w	#$2700,sr		; disable interrupts
	;---------------------------------------------------------------------------
	; reloading the scene sets all the sprite positions back to default
	;---------------------------------------------------------------------------
	lea	MEM_TEMP_SPACE,a6	; point a6 to a temporary space
	move.w	(MEM_NPC0_SPRITE_X),(a6)+
	move.w	(MEM_NPC0_SPRITE_Y),(a6)+
	move.w	(MEM_NPC0_SPRITE_DIRECTION),(a6)+
	move.w	(MEM_NPC0_MOVE_INDEX),(a6)+
	move.w	(MEM_NPC0_SPRITE_FRAME),(a6)+
	move.w	(MEM_NPC0_SPRITE_STEP_COUNTER),(a6)+
	move.w	(MEM_NPC0_MOVEMENT_COUNTER),(a6)+
	move.w	(MEM_NPC0_MOVE_INDEX),(a6)+
	move.w	(MEM_NPC1_SPRITE_X),(a6)+
	move.w	(MEM_NPC1_SPRITE_Y),(a6)+
	move.w	(MEM_NPC1_SPRITE_DIRECTION),(a6)+
	move.w	(MEM_NPC1_MOVE_INDEX),(a6)+
	move.w	(MEM_NPC1_SPRITE_FRAME),(a6)+
	move.w	(MEM_NPC1_SPRITE_STEP_COUNTER),(a6)+
	move.w	(MEM_NPC1_MOVEMENT_COUNTER),(a6)+
	move.w	(MEM_NPC1_MOVE_INDEX),(a6)+
	move.w	(MEM_NPC2_SPRITE_X),(a6)+
	move.w	(MEM_NPC2_SPRITE_Y),(a6)+
	move.w	(MEM_NPC2_SPRITE_DIRECTION),(a6)+
	move.w	(MEM_NPC2_MOVE_INDEX),(a6)+
	move.w	(MEM_NPC2_SPRITE_FRAME),(a6)+
	move.w	(MEM_NPC2_SPRITE_STEP_COUNTER),(a6)+
	move.w	(MEM_NPC2_MOVEMENT_COUNTER),(a6)+
	move.w	(MEM_NPC2_MOVE_INDEX),(a6)+
	move.w	(MEM_NPC3_SPRITE_X),(a6)+
	move.w	(MEM_NPC3_SPRITE_Y),(a6)+
	move.w	(MEM_NPC3_SPRITE_DIRECTION),(a6)+
	move.w	(MEM_NPC3_MOVE_INDEX),(a6)+
	move.w	(MEM_NPC3_SPRITE_FRAME),(a6)+
	move.w	(MEM_NPC3_SPRITE_STEP_COUNTER),(a6)+
	move.w	(MEM_NPC3_MOVEMENT_COUNTER),(a6)+
	move.w	(MEM_NPC3_MOVE_INDEX),(a6)+
	;---------------------------------------------------------------------------
	; reload scene
	;---------------------------------------------------------------------------
	clr.l	d7	; just being paranoid
	move.w	(MEM_ACTIVE_SCENE_ID),d7	; copy scene ID to load to d7
	mulu.w	#$4,d7	; multiply by 4 to get offset in scene definition table
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d7,a6	; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	move.w	#$2000,sr		; re-enable interrupts
	bsr.w	LoadScene	; branch to LoadScene subroutine
	move.w	#$2700,sr		; disable interrupts
	;---------------------------------------------------------------------------
	; restore sprite positions
	;---------------------------------------------------------------------------
	lea	MEM_TEMP_SPACE,a6	; point a6 to a temporary space
	move.w	(a6)+,(MEM_NPC0_SPRITE_X)
	move.w	(a6)+,(MEM_NPC0_SPRITE_Y)
	move.w	(a6)+,(MEM_NPC0_SPRITE_DIRECTION)
	move.w	(a6)+,(MEM_NPC0_MOVE_INDEX)
	move.w	(a6)+,(MEM_NPC0_SPRITE_FRAME)
	move.w	(a6)+,(MEM_NPC0_SPRITE_STEP_COUNTER)
	move.w	(a6)+,(MEM_NPC0_MOVEMENT_COUNTER)
	move.w	(a6)+,(MEM_NPC0_MOVE_INDEX)
	move.w	(a6)+,(MEM_NPC1_SPRITE_X)
	move.w	(a6)+,(MEM_NPC1_SPRITE_Y)
	move.w	(a6)+,(MEM_NPC1_SPRITE_DIRECTION)
	move.w	(a6)+,(MEM_NPC1_MOVE_INDEX)
	move.w	(a6)+,(MEM_NPC1_SPRITE_FRAME)
	move.w	(a6)+,(MEM_NPC1_SPRITE_STEP_COUNTER)
	move.w	(a6)+,(MEM_NPC1_MOVEMENT_COUNTER)
	move.w	(a6)+,(MEM_NPC1_MOVE_INDEX)
	move.w	(a6)+,(MEM_NPC2_SPRITE_X)
	move.w	(a6)+,(MEM_NPC2_SPRITE_Y)
	move.w	(a6)+,(MEM_NPC2_SPRITE_DIRECTION)
	move.w	(a6)+,(MEM_NPC2_MOVE_INDEX)
	move.w	(a6)+,(MEM_NPC2_SPRITE_FRAME)
	move.w	(a6)+,(MEM_NPC2_SPRITE_STEP_COUNTER)
	move.w	(a6)+,(MEM_NPC2_MOVEMENT_COUNTER)
	move.w	(a6)+,(MEM_NPC2_MOVE_INDEX)
	move.w	(a6)+,(MEM_NPC3_SPRITE_X)
	move.w	(a6)+,(MEM_NPC3_SPRITE_Y)
	move.w	(a6)+,(MEM_NPC3_SPRITE_DIRECTION)
	move.w	(a6)+,(MEM_NPC3_MOVE_INDEX)
	move.w	(a6)+,(MEM_NPC3_SPRITE_FRAME)
	move.w	(a6)+,(MEM_NPC3_SPRITE_STEP_COUNTER)
	move.w	(a6)+,(MEM_NPC3_MOVEMENT_COUNTER)
	move.w	(a6)+,(MEM_NPC3_MOVE_INDEX)
	move.l	#NPC0_SPRITE_VDP_Y,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_NPC0_SPRITE_Y),(VDP_DATA)	; copy the new y-coordinate
	move.l	#NPC0_SPRITE_VDP_X,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_NPC0_SPRITE_X),(VDP_DATA)	; copy the new x-coordinate
	move.l	#NPC1_SPRITE_VDP_Y,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_NPC1_SPRITE_Y),(VDP_DATA)	; copy the new y-coordinate
	move.l	#NPC1_SPRITE_VDP_X,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_NPC1_SPRITE_X),(VDP_DATA)	; copy the new x-coordinate
	move.l	#NPC2_SPRITE_VDP_Y,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_NPC2_SPRITE_Y),(VDP_DATA)	; copy the new y-coordinate
	move.l	#NPC2_SPRITE_VDP_X,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_NPC2_SPRITE_X),(VDP_DATA)	; copy the new x-coordinate
	move.l	#NPC3_SPRITE_VDP_Y,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_NPC3_SPRITE_Y),(VDP_DATA)	; copy the new y-coordinate
	move.l	#NPC3_SPRITE_VDP_X,(VDP_CONTROL)	; set write location in VDP
	move.w	(MEM_NPC3_SPRITE_X),(VDP_DATA)	; copy the new x-coordinate
	; restore animation patterns
	lea	MEM_PLAYER_SPRITE_ID,a6
	bsr.w	UpdateSpritePattern
	lea	MEM_NPC0_SPRITE_ID,a6
	bsr.w	UpdateSpritePattern
	lea	MEM_NPC1_SPRITE_ID,a6
	bsr.w	UpdateSpritePattern
	lea	MEM_NPC2_SPRITE_ID,a6
	bsr.w	UpdateSpritePattern
	lea	MEM_NPC3_SPRITE_ID,a6
	bsr.w	UpdateSpritePattern
	move.w	#$2000,sr		; re-enable interrupts
	;---------------------------------------------------------------------------
	; fix sprites and fade in
	;---------------------------------------------------------------------------
	bsr.w	LoadPlayerSprite	; load the player sprite
	bsr.w	FixSprites	; move player sprite and reset sprite links
	bsr.w	FadeIn	; fade in to the new scene
ExitReloadCurrentScene:
	rts

