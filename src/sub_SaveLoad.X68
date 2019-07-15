;*******************************************************************************
; Basic code to write to SRAM from: https://plutiedev.com/saving-sram
;*******************************************************************************

;-------------------------------------------------------------------------------
; Saves the current game state
; -location is based on MEM_MENU_SELECTION
; -in the save screen the index for save is 0-3
; -save everything from MEM_GAME_STATE to MEM_ACTIVE_SCENE_ID
; -~8kb is the current size limit for save games in this demo
; a4, a5, d7 are all modified by this routine
;-------------------------------------------------------------------------------
SaveGame:
	; compute which save slot to use
	clr.l	d7	; just being paranoid
	move.w	(MEM_MENU_SELECTION),d7	; copy menu selection to d7
	mulu.w	#SAVE_SIZE,d7	; copy by save size
	lea	(SRAM_START),a5	; point a5 to the start of SRAM
	adda.w	d7,a5	; move to offset location
	move.b	#1,(SRAM_LOCK)	; unlock SRAM
	lea	(SAVE_GAME_START),a4	; point to start of game state
	move.w	#SAVE_DATA_LENGTH,d7	; size of data to read
SaveLoop:
	move.b	(a4),(a5)	; write byte to SRAM
	addq.l  #1,a4	; advance read byte
	addq.l  #2,a5	; advance write byte
	dbf	d7,SaveLoop	; loop
SaveLoopEnd:
	move.b	#0,(SRAM_LOCK)	; lock SRAM
	rts

;-------------------------------------------------------------------------------
; Loads a saved game
; -location is based on MEM_MENU_SELECTION
; -in the load screen the index for save is 0-3
; a4, a5, d7 are all modified by this routine
;-------------------------------------------------------------------------------
LoadGame:
	; compute which save slot to use
	clr.l	d7	; just being paranoid
	move.w	(MEM_MENU_SELECTION),d7	; copy menu selection to d7
	mulu.w	#SAVE_SIZE,d7	; copy by save size
	lea	(SRAM_START),a5	; point a5 to the start of SRAM
	adda.w	d7,a5	; move to offset location
	move.b	#1,(SRAM_LOCK)	; unlock SRAM
	lea	(SAVE_GAME_START),a4	; point to start of game state
	move.w	#SAVE_DATA_LENGTH,d7	; size of data to read
LoadLoop:
	move.b	(a5),(a4)	; read byte from SRAM
	addq.l  #1,a4	; advance write byte
	addq.l  #2,a5	; advance read byte
	dbf	d7,LoadLoop	; loop
LoadLoopEnd:
	move.b	#0,(SRAM_LOCK)	; lock SRAM
	; the game is saved from the status screen, need to clear that
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_STATUS_SCREEN,d7	; update game state
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	rts

;-------------------------------------------------------------------------------
; checks if SRAM has been initialized, initializes it if not
; a5, d6, d7 are all modified by this routine
;-------------------------------------------------------------------------------
InitSRAM:
	move.w	#$2700,sr		; disable interrupts
	move.b	#1,(SRAM_LOCK)	; unlock SRAM
    lea	(MEM_TEMP_SPACE),a4	; point a4 to temp space
	clr	d6	; just being paranoid
	move.w	#$0004,d6	; 4 save slots, init check is after the last
	mulu.w	#SAVE_SIZE,d6	; copy by save size
	lea	(SRAM_START),a5	; point a5 to the start of SRAM
	adda.l	d6,a5	; move to offset location
    move.b	(a5),(a4)	; write byte to temp space
    addq.l	#1,a4	; advance write byte
    addq.l	#2,a5	; advance read byte
    move.b	(a5),(a4)	; write next byte to temp space
	move.l	(MEM_TEMP_SPACE),d7	; copy temp value to d7
	swap	d7	; swap d7
	cmpi.w	#$8989,d7	; test if it matches the expected init value
	beq.s	ExitInitSRAM	; branch if it does
	; write init data
	lea	(SRAM_START),a5	; point a5 to the start of SRAM
	adda.l	d6,a5	; move to offset location
	move.b	#$89,(a5)	; first half of word
	addq.l  #2,a5	; advance write byte
	move.b	#$89,(a5)	; second half of word
	; initialize the four save slots
	move.w	#$0003,d7	; four save slots to loop through
	clr.l	d6	; just being paranoid again
InitSRAMLoop:
	move.w	d7,d6	; copy d7 to d6
	mulu.w	#SAVE_SIZE,d6	; copy by save size
	lea	(SRAM_START),a5	; point a5 to the start of SRAM
	adda.l	d6,a5	; move to offset location
	move.b	#$7F,(a5)	; first half of word
	addq.l  #2,a5	; advance write byte
	move.b	#$FF,(a5)	; second half of word
	dbf	d7,InitSRAMLoop	; loop
ExitInitSRAM:
	move.b	#0,(SRAM_LOCK)	; lock SRAM
	move.w	#$2000,sr		; re-enable interrupts
	rts

;-------------------------------------------------------------------------------
; returns the first word in a save slot
; d7 = save slot index
; d6 will return the value of the first word at the specified save slto
; a5 is modified by this subroutine
;-------------------------------------------------------------------------------
SaveGameLookup:
	move.w	#$2700,sr	; disable interrupts
    move.b  #1,(SRAM_LOCK)	; unlock SRAM
	lea	(MEM_TEMP_SPACE),a4	; point a4 to temp space
	mulu.w	#SAVE_SIZE,d7	; d7 should have the save slot number
    lea	(SRAM_START),a5	; point a5 to start of SRAM
	adda.l	d7,a5	; move to offset location
    move.b	(a5),(a4)	; write byte to temp space
    addq.l	#1,a4	; advance write byte
    addq.l	#2,a5	; advance read byte
    move.b	(a5),(a4)	; write next byte to temp space
    move.b  #0,(SRAM_LOCK)   ; lock SRAM
	move.l	(MEM_TEMP_SPACE),d6	; copy temp value to d6
	swap	d6	; swap to low word
	move.w	#$2000,sr		; re-enable interrupts
	rts

