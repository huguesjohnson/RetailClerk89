;-------------------------------------------------------------------------------
; MovePlayer
; moves the player sprite if a d-pad direction is being pressed
; calls MoveSprite to actually move the sprite
; d7 is used to test controller input and scrolling
; d6 is used to test for scrolling
; a6 is used to store the start address of the sprite info if there is movement
;-------------------------------------------------------------------------------
MovePlayer:
	move.b	(MEM_CONTROL_HELD),d7	; copy button held value to d7 for eor
	cmpi.w	#$0000,d7				; test if it is zero
	bne.w	SetPlayerDirection		; branch if a direction is being held
PlayerNotMoving:
	bra.w	StopPlayerSprite		; reset the sprite frame
SetPlayerDirection:
; map key press to direction
TestUpHeld:
	move.b	(MEM_CONTROL_HELD),d7	; copy button held value to d7 for andi
	andi.w	#BUTTON_UP_PRESSED,d7	; test if the up button is held
	beq.s	TestDownHeld			; branch if not
	move.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)	; set direction
	; test if map should scroll because the player is approaching the boundary
	; top boundary is [current map y-position]
	move.w	(MEM_MAP_POSITION_Y),d7	; move map y-position to d7
	cmpi.w	#$0000,d7				; are we already scrolled to the top?
	ble.w	MovePlayerSprite		; if so stop testing for scroll
	; at this point d7 contains the y value of the top boundary
	add.w	#SPRITE_PLANE_OFFSET_TOP,d7	; adjust for sprite plane offset
	sub.w	(MEM_PLAYER_SPRITE_Y),d7	; subtract sprite y
	cmpi.w	#PLAYER_SCROLL_BOUNDARY_TOP,d7 ; is sprite within scroll area?
	; bcc used here because previous subtraction can lead to negative number	
	bcc.w	MovePlayerSprite		; if not stop testing for scroll
	subq	#SPRITE_STEP_PIXELS,(MEM_MAP_POSITION_Y) ; decrement map y-position
	move.w	#MAP_CHANGED_V,(MEM_FLAG_MAP_POSITION_CHANGED)	; flag map changed
	bra.w	MovePlayerSprite		; move the player sprite
TestDownHeld:
	move.b	(MEM_CONTROL_HELD),d7	; copy button held value to d7 for andi
	andi.w	#BUTTON_DOWN_PRESSED,d7	; test if the down button is held
	beq.s	TestLeftHeld			; branch if not
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; set direction
	; test if map should scroll because the player is approaching the boundary
	; bottom boundary is [current map y-position]+[screen height]
	move.w	(MEM_MAP_POSITION_Y),d7	; move map y-position to d7
	add.w	#DISPLAY_PIXELS_Y,d7	; add the screen height
	cmpi.w	#VDP_PLANE_PIXELS_Y,d7	; are we already scrolled to the bottom?
	bge.w	MovePlayerSprite		; if so stop testing for scroll
	; at this point d7 contains the y value of the bottom boundary
	add.w	#SPRITE_PLANE_OFFSET_TOP,d7	; adjust for sprite plane offset
	sub.w	(MEM_PLAYER_SPRITE_Y),d7	; subtract sprite y
	cmpi.w	#PLAYER_SCROLL_BOUNDARY_BOTTOM,d7 ; is sprite within scroll area?
	bge.w	MovePlayerSprite		; if not stop testing for scroll
	addq	#SPRITE_STEP_PIXELS,(MEM_MAP_POSITION_Y) ; increment map y-position
	move.w	#MAP_CHANGED_V,(MEM_FLAG_MAP_POSITION_CHANGED)	; flag map changed
	bra.s	MovePlayerSprite		; move the player sprite
TestLeftHeld:
	move.b	(MEM_CONTROL_HELD),d7	; copy button held value to d7 for andi
	andi.w	#BUTTON_LEFT_PRESSED,d7	; test if the left button is held
	beq.s	TestRightHeld			; branch if not
	move.w	#DIRECTION_LEFT,(MEM_PLAYER_SPRITE_DIRECTION)	; set direction
	bra.s	MovePlayerSprite		; move the player sprite
TestRightHeld:
	move.b	(MEM_CONTROL_HELD),d7	; copy button held value to d7 for andi
	andi.w	#BUTTON_RIGHT_PRESSED,d7	; test if the right button is held
	beq.w	StopPlayerSprite			; non-directional button held
	move.w	#DIRECTION_RIGHT,(MEM_PLAYER_SPRITE_DIRECTION)	; set direction
MovePlayerSprite:
	lea (MEM_PLAYER_SPRITE_ID),a6	; setup call to MoveSprite
	bsr.w	MoveSprite				; branch to move MoveSprite
	bra.s	EndMovePlayer			; exit
StopPlayerSprite:
	lea (MEM_PLAYER_SPRITE_ID),a6	; setup call to StopSprite
	bsr.w	StopSprite				; reset the sprite frame
EndMovePlayer:
	rts

