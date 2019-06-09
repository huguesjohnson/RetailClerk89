;-------------------------------------------------------------------------------
; process scripted events from the main loop
;-------------------------------------------------------------------------------
ProcessScriptedEvent:
	;---------------------------------------------------------------------------
	; dialog is not displaying, test if it is time to start a new action
	;---------------------------------------------------------------------------
	cmpi.w	#$0000,(MEM_SCRIPTED_EVENT_STEPS)	; test if 0
	beq.w	NextScriptedEventAction	; if 0 then start next action
	;---------------------------------------------------------------------------
	; continue moving the sprite
	;---------------------------------------------------------------------------
	cmpi.w	#SPRITE_MOVE_FREQUENCY,(MEM_FRAME_COUNTER); is it time to move?
	blt.w	ExitProcessScriptedEvent	; exit if it's not time to move
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset counter to 0
ScriptedEventMoveSprite:
	subq	#$1,(MEM_SCRIPTED_EVENT_STEPS)	; decrement step counter
	move.l	(MEM_SCRIPTED_SPRITE_ADDR),a6	; point a6 to sprite to move
	bsr.w	MoveSprite	; branch to MoveSprite
	bra.w	ExitProcessScriptedEvent	; exit
NextScriptedEventAction:
	move.l	(MEM_SCRIPTED_SPRITE_ADDR),a6	; point a6 to sprite
	bsr.w	StopSprite	; stop moving the sprite
	move.l	(MEM_SCRIPTED_EVENT_ADDR),a6	; point a6 to next step
	move.w	(MEM_SCRIPTED_EVENT_ACTION),d7	; copy action to d7
	cmpi.w	#SCRIPTED_EVENT_END,d7	; are we at the end?
	beq.s	ScriptedEventEnd	; if so branch
	cmpi.w	#SCRIPTED_EVENT_DIALOG,d7	; display a dialog?
	beq.w	ScriptedEventDialog	; if so branch
	cmpi.w	#SCRIPTED_EVENT_CHANGE_SPRITE,d7	; changing the sprite?
	beq.w	ScriptedEventChangeSprite	; if so branch
	cmpi.w	#SCRIPTED_EVENT_CHANGE_SCENE,d7	; change scene?
	beq.w	ScriptedEventChangeScene	; if so branch
	cmpi.w	#SCRIPTED_EVENT_DRAW_SCENE,d7	; draw scene?
	beq.w	ScriptedEventDrawScene	; if so branch
	cmpi.w	#SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE,d7	; change player sprite?
	beq.w	ScriptedEventChangePlayerSprite	; if so branch
	cmpi.w	#SCRIPTED_EVENT_SET_PLAYER_SPRITE_X,d7	; change player X?
	beq.w	ScriptedEventSetPlayerSpriteX	; if so branch
	cmpi.w	#SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y,d7	; change player Y?
	beq.w	ScriptedEventSetPlayerSpriteY	; if so branch
	cmpi.w	#SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION,d7	; change direction?
	beq.w	ScriptedEventSetPlayerSpriteDirection	; if so branch
	cmpi.w	#SCRIPTED_EVENT_FADE_BLACK,d7	; fade out?
	beq.w	ScriptedEventFadeBlack	; if so branch
	cmpi.w	#SCRIPTED_EVENT_TIMER,d7	; timer?
	beq.w	ScriptedEventTimer	; if so branch
	cmpi.w	#SCRIPTED_EVENT_ENDGAME,d7	; end game?
	beq.w	ScriptedEventEndGame	; if so branch
	;---------------------------------------------------------------------------
	; start moving the sprite
	;---------------------------------------------------------------------------
	move.l	(MEM_SCRIPTED_SPRITE_ADDR),a5	; point a5 to sprite to update
	; copy direction to sprite direction 
	adda.w	#STRUCT_SPRITE_DIRECTION,a5	; move to direction
	move.w	(MEM_SCRIPTED_EVENT_ACTION),(a5)	; copy action to direction
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_STEPS)	; copy steps in action
	; save state of scripted event and loop back to main
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventEnd:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; clear the scripted event flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventDialog:
	move.l	(a6)+,(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	move.w	#$0000,(MEM_SCRIPTED_EVENT_STEPS)	; reset step counter
	; set dialog flags to display the dialog
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7	; change state to opening
	bset.l	#DIALOG_FLAG_STYLE_SIMPLE_TEXT,d7	; set style to overworld menu
	bset.l	#DIALOG_FLAG_STYLE_TITLED,d7	; set style to titled
	move.l	d7,(MEM_DIALOG_FLAGS)	; save changes made to the game state
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventChangeSprite:
	move.l	(MEM_SCRIPTED_EVENT_ADDR),a6	; point a6 to next step
	bsr.w	QueueScriptedEvent	; this will reset all variables
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventChangeScene:
	move.w	(a6)+,d7	; copy scene ID to load to d7
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	mulu.w	#$4,d7	; multiply by 4 to get offset in scene definition table
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d7,a6	; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite
	bsr.w	FixSprites	; move player sprite and reset sprite links
	move.w	#EVENT_FRAME_DELAY,d7	; copy delay to d7
	bra.s	ScriptedEventFadeInDelayLoop
ScriptedEventDrawScene:
	move.w	(a6)+,d7	; copy scene ID to load to d7
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	mulu.w	#$4,d7	; multiply by 4 to get offset in scene definition table
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d7,a6	; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	move.w	(a6)+,d6	; discard first word
	bsr.w	DrawScene	; branch to LoadScene subroutine
	bsr.w	ReloadSpriteTiles	; reload sprite tiles
	move.w	#EVENT_FRAME_DELAY,d7	; copy delay to d7
ScriptedEventFadeInDelayLoop:
	bsr.w	WaitVBlank
	dbf	d7,ScriptedEventFadeInDelayLoop	; loop until counter is zero
	bsr.w	FadeIn	; fade in to the new scene
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventChangePlayerSprite:
	move.w	(a6)+,(MEM_PLAYER_SPRITE)	; update sprite
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventSetPlayerSpriteX:
	move.w	(a6)+,(MEM_PLAYER_SPRITE_X)	; update sprite
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventSetPlayerSpriteY:
	move.w	(a6)+,(MEM_PLAYER_SPRITE_Y)	; update sprite
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventSetPlayerSpriteDirection:
	move.w	(a6)+,(MEM_PLAYER_SPRITE_DIRECTION)	; update sprite
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventFadeBlack:
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	bsr.w	FadeOut	; fade out
	; blackout the palette
	lea	MEM_SCENE_PALETTE,a1	; point a1 to scene palette address
	move.w	#$003F,d7	; 64-1 palette entries
ScriptedEventFadeBlackLoop:
	move.w	#$0000,(a1)+	; write the palette data
	dbf	d7,ScriptedEventFadeBlackLoop	; decrement d7 and loop if not 0
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventTimer:
	move.w	(a6)+,d7	; copy timer to d7
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
ScriptedEventTimerLoop:
	jsr	WaitVBlank	; wait for vblank
	dbf	d7,ScriptedEventTimerLoop	; loop
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventEndGame:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; clear the scripted event flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	bra.w	EndGame
ExitProcessScriptedEvent:
	rts
