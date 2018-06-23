;*******************************************************************************
; This exists to test subroutines on various emulators.
; This was originally created to test the AtGames Firecore.
; Through this demo I've learned to hate the AtGames Firecore.
; At least though if I can make it run on that, other clones should work too.
;*******************************************************************************

	move.w	#$2700,sr		; disable interrupts

	bsr.w	ClearVRAM	; clear VRAM

	move.w	#$2000,sr		; re-enable interrupts

DiagnosticLoop:
	bsr.w	WaitVBlank

	;---------------------------------------------------------------------------
	; test that palettes works
	;---------------------------------------------------------------------------

	move.l	#VDP_CRAM_WRITE,(VDP_CONTROL) ; set up VDP write to CRAM
	move.w	#$0E0E,(VDP_DATA)	; write the palette data
	move.w	#$0060,d3
Diag1:			
	bsr.w	WaitVBlank
	dbf.w	d3,Diag1
	move.l	#VDP_CRAM_WRITE,(VDP_CONTROL) ; set up VDP write to CRAM
	move.w	#$0ACE,(VDP_DATA)	; write the palette data
	move.w	#$0060,d3
Diag2:
	bsr.w	WaitVBlank
	dbf.w	d3,Diag2

	;---------------------------------------------------------------------------
	; test that scene loading works
	;---------------------------------------------------------------------------
	lea	SceneTitle,a6	; address of the scene to load
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the scene

	move.w	#$0060,d3
Diag3:
	bsr.w	WaitVBlank
	dbf.w	d3,Diag3

	bsr.w	FadeOut
	bsr.w	FadeIn
	bsr.w	FadeOut
	bsr.w	FadeIn
	bsr.w	FadeOut
	bsr.w	FadeIn

	lea MEM_NPC_LOCATIONS,a6
	move.l	#$03010200,(a6)+	; location 00 (VB) - NPCs 03,01,02

	lea	SceneVB,a6	; address of the scene to load
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite
	; update sprite sort table	
	move.w	(MEM_PLAYER_SPRITE_ID),d2	; copy ID to d2
	move.w	(MEM_PLAYER_SPRITE_Y),d3	; copy new Y value to d3
	bsr.w	UpdateSpriteSortTable	; update the sprite table
	bsr.w	OrderSprites	; sort the sprite table
	; workaround to issue where links aren't set if the table is already sorted	
	bsr.w	SetSpriteLinks
	bsr.w	FadeIn	; fade in to the scene
	move.w	#$0060,d3
Diag4:
	bsr.w	WaitVBlank
	dbf.w	d3,Diag4

DiagnosticLoopEnd:
	bra.w	DiagnosticLoop	; return to start of loop
