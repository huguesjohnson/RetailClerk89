;-------------------------------------------------------------------------------
; Sets up a scripted event to run on the next main loop pass
; a6 = address of event to queue
; a5 and d7 are modified
;-------------------------------------------------------------------------------
QueueScriptedEvent:
	;---------------------------------------------------------------------------
	; set state flag
	;---------------------------------------------------------------------------
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; set the scripted event flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	;---------------------------------------------------------------------------
	; determine which sprite this applies to
	;---------------------------------------------------------------------------
	move.w	(a6)+,d7	; copy to d7 for next operations
	cmpi.w	#$0000,d7	; is this the player sprite?
	bne.s	.1	; branch if not player
	lea	MEM_PLAYER_SPRITE_ID,a5	; point a5 to player 
	bra.s	.2	; branch
.1
	subq	#$0002,d7	; decrement to account for 0 indexing & sprite zero
	lea	MEM_NPC0_SPRITE_ID,a5	; point a5 to first NPC 
	mulu.w	#NPC_RECORD_SIZE,d7	; multiply to get offset
	adda.w	d7,a5	; move to NPC being modified
.2
	move.l	a5,(MEM_SCRIPTED_SPRITE_ADDR)	; save address
	;---------------------------------------------------------------------------
	; setup scripted event
	;---------------------------------------------------------------------------
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save first action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of first step
	; set steps to 0 to trigger next action start in main loop
	move.w	#$0000,(MEM_SCRIPTED_EVENT_STEPS)
ExitQueueScriptedEvent:
	rts

