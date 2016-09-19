;-------------------------------------------------------------------------------
; MoveSprite
; move the sprite around based on the sprite direction and step counter
; a6 = address of sprite info start
; a6 is not modified in this subroutine
; a5 is modified instead of a6 to avoid issues when calling SetSpritePattern
; d7 is used for various operations
;
; this method was originally based on an example at:
; 	http://bigevilcorporation.co.uk/2012/04/24/
;	sega-megadrive-6-scary-monsters-and-nice-sprites/
;	after adding animation and edge detection this code is a bit different
;-------------------------------------------------------------------------------
MoveSprite:
	;---------------------------------------------------------------------------
	; a6 = SPRITE_ID
	; a6 + 2 = SPRITE_X
	; a6 + 4 = SPRITE_Y
	; a6 + 6 = SPRITE_PATTERN_INDEX
	; a6 + 8 = SPRITE_DIRECTION
	; a6 + A = SPRITE_FRAME
	; a6 + C = SPRITE_STEP_COUNTER
	;---------------------------------------------------------------------------
	movea.l	a6,a5	; store address in a5 because it is manipulated
	; collision detection
	bsr.w	FlipSpriteMapPosition		; clear map data for current position
	bsr.w	TestSpriteCollision			; branch to test sprite collision
	tst.w	(MEM_COLLISION_RESULT)		; 0 = no collision
	beq.s	NoCollision					; no collision, continue moving
	bsr.w	StopSprite					; collision, stop moving
	bra.w	ExitMoveSprite				; collision, exit
NoCollision:
	adda.l  #$8,a5	; move to a5+8 -> SPRITE_DIRECTION
	move.w	(a5),d7	; store direction in a7
TestUp:
	cmpi.w	#DIRECTION_UP,d7			; test for up
	bne.w	TestDown					; branch if not
	cmpi.w	#MAP_CHANGED_V,(MEM_FLAG_MAP_POSITION_CHANGED)	; test for scrolling
	beq.w	MoveSpriteSetPattern	; map is scrolling, don't move the sprite
	; update the sprite's Y position
	suba.l	#$4,a5						; move back to a5+4 -> SPRITE_Y
	subq	#SPRITE_STEP_PIXELS,(a5)	; decrement SPRITE_Y
	; update the sprite in the sprite table
	move.w	(a6),d7						; copy sprite ID to d7
   	mulu.w	#$08,d7						; mult by 8 to get sprite array offset
	swap	d7                          ; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d7	; add to sprite table address
	move.l	d7,(VDP_CONTROL)			; set write location in VDP
	move.w	(a5),(VDP_DATA)				; copy the new y-coordinate
	bra.w	MoveSpriteSetPattern		; update the sprite pattern	and exit
TestDown:
	cmpi.w	#DIRECTION_DOWN,d7			; test for down
	bne.w	TestRight					; branch if not
	cmpi.w	#MAP_CHANGED_V,(MEM_FLAG_MAP_POSITION_CHANGED)	; test for scrolling
	beq.w	MoveSpriteSetPattern	; map is scrolling, don't move the sprite
	; update the sprite's Y position
	suba.l	#$4,a5						; move back to a5+4 -> SPRITE_Y
	addq	#SPRITE_STEP_PIXELS,(a5)	; increment SPRITE_Y
	move.w	(a6),d7						; copy sprite ID to d7
   	mulu.w	#$08,d7						; mult by 8 to get sprite array offset
	swap	d7                          ; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d7	; add to sprite table address
	move.l	d7,(VDP_CONTROL)			; set write location in VDP
	move.w	(a5),(VDP_DATA)				; copy the new y-coordinate
	bra.w	MoveSpriteSetPattern		; update the sprite pattern	and exit
TestRight:
	cmpi.w	#DIRECTION_RIGHT,d7			; test for right
	bne.w	TestLeft					; branch if not
	cmpi.w	#MAP_CHANGED_H,(MEM_FLAG_MAP_POSITION_CHANGED)	; test for scrolling
	beq.w	MoveSpriteSetPattern	; map is scrolling, don't move the sprite
	; update the sprite's X position
	suba.l	#$6,a5						; move back to a5+2 -> SPRITE_X
	addq	#SPRITE_STEP_PIXELS,(a5)	; increment SPRITE_Y
	; update the sprite in the sprite table
	move.w	(a6),d7						; copy sprite ID to d7
   	mulu.w	#$08,d7						; mult by 8 to get sprite array offset
   	addq	#$6,d7                    	; x-coordinate is at index 6
   	swap	d7                          ; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d7	; add to sprite table address
	move.l	d7,(VDP_CONTROL)			; set write location in VDP
	move.w	(a5),(VDP_DATA)				; copy the new x-coordinate
	bra.w	MoveSpriteSetPattern		; update the sprite pattern	and exit
TestLeft:
	cmpi.w	#DIRECTION_LEFT,d7			; test for left
	bne.w	ExitMoveSprite				; branch if not
	cmpi.w	#MAP_CHANGED_H,(MEM_FLAG_MAP_POSITION_CHANGED)	; test for scrolling
	beq.w	MoveSpriteSetPattern	; map is scrolling, don't move the sprite
	; update the sprite's X position
	suba.l	#$6,a5						; move back to a5+2 -> SPRITE_X
	subq	#SPRITE_STEP_PIXELS,(a5)	; decrement SPRITE_Y
	; update the sprite in the sprite table
	move.w	(a6),d7						; copy sprite ID to d7
   	mulu.w	#$08,d7						; mult by 8 to get sprite array offset
   	addq	#$6,d7                    	; x-coordinate is at index 6
   	swap	d7                          ; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d7	; add to sprite table address
	move.l	d7,(VDP_CONTROL)			; set write location in VDP
	move.w	(a5),(VDP_DATA)				; copy the new x-coordinate
MoveSpriteSetPattern:
	; update the sprite animation	
	bsr.w	SetSpritePattern		; set the new pattern for the sprite
ExitMoveSprite:
	bsr.w	FlipSpriteMapPosition	; set map data for the sprites' new position
	rts


