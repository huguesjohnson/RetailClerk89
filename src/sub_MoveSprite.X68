;-------------------------------------------------------------------------------
; MoveSprite
; move the sprite around based on the sprite direction and step counter
; a6 = address of sprite info start
; d7 is used for various operations
;
; this method was originally based on an example at:
; 	http://bigevilcorporation.co.uk/2012/04/24/
;	sega-megadrive-6-scary-monsters-and-nice-sprites/
;	after adding animation and edge detection this code is a bit different
;	but I still want to give credit to the site that helpful in getting started
;-------------------------------------------------------------------------------
MoveSprite:
	; collision detection
	if	_SPRITE_COLLISION_
	bsr.w	FlipSpriteMapPosition		; clear map data for current position
	endif
	bsr.w	TestSpriteCollision			; branch to test sprite collision
	tst.w	(MEM_COLLISION_RESULT)		; 0 = no collision
	beq.s	NoCollision					; no collision, continue moving
	bsr.w	StopSprite					; collision, stop moving
	bra.w	ExitMoveSprite				; collision, exit
NoCollision:
	move.w	(STRUCT_SPRITE_DIRECTION,a6),d7	; store direction in d7
TestUp:
	cmpi.w	#DIRECTION_UP,d7			; test for up
	bne.w	TestDown					; branch if not
	move.w	#$FFFF,(MEM_SPRITE_Y_ORDER_CHANGED)	; flag that Y order changed
	; update the sprite's Y position
	subq	#SPRITE_STEP_PIXELS,(STRUCT_SPRITE_Y,a6)	; decrement SPRITE_Y
	; update the sprite sort table
	move.w	(STRUCT_SPRITE_ID,a6),d2	; copy ID to d2
	move.w	(STRUCT_SPRITE_Y,a6),d3	; copy new Y value to d3
	bsr.w	UpdateSpriteSortTable	; update the sprite table
	; update the sprite in the sprite table
	move.w	(a6),d7						; copy sprite ID to d7
   	mulu.w	#$08,d7						; mult by 8 to get sprite array offset
	swap	d7                          ; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d7	; add to sprite table address
	move.l	d7,(VDP_CONTROL)			; set write location in VDP
	move.w	(STRUCT_SPRITE_Y,a6),(VDP_DATA)			; copy the new y-coordinate
	bra.w	MoveSpriteSetPattern		; update the sprite pattern	and exit
TestDown:
	cmpi.w	#DIRECTION_DOWN,d7			; test for down
	bne.w	TestRight					; branch if not
	move.w	#$FFFF,(MEM_SPRITE_Y_ORDER_CHANGED)	; flag that Y order changed
	; update the sprite's Y position
	addq	#SPRITE_STEP_PIXELS,(STRUCT_SPRITE_Y,a6)	; increment SPRITE_Y
	; update the sprite sort table
	move.w	(STRUCT_SPRITE_ID,a6),d2	; copy ID to d2
	move.w	(STRUCT_SPRITE_Y,a6),d3	; copy new Y value to d3
	bsr.w	UpdateSpriteSortTable	; update the sprite table
	move.w	(a6),d7						; copy sprite ID to d7
   	mulu.w	#$08,d7						; mult by 8 to get sprite array offset
	swap	d7                          ; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d7	; add to sprite table address
	move.l	d7,(VDP_CONTROL)			; set write location in VDP
	move.w	(STRUCT_SPRITE_Y,a6),(VDP_DATA)			; copy the new y-coordinate
	bra.w	MoveSpriteSetPattern		; update the sprite pattern	and exit
TestRight:
	cmpi.w	#DIRECTION_RIGHT,d7			; test for right
	bne.w	TestLeft					; branch if not
	; update the sprite's X position
	addq	#SPRITE_STEP_PIXELS,(STRUCT_SPRITE_X,a6)	; increment SPRITE_X
	; update the sprite in the sprite table
	move.w	(a6),d7						; copy sprite ID to d7
   	mulu.w	#$08,d7						; mult by 8 to get sprite array offset
   	addq	#STRUCT_SPRITEDEF_X,d7		; move to x-coordinate
   	swap	d7                          ; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d7	; add to sprite table address
	move.l	d7,(VDP_CONTROL)			; set write location in VDP
	move.w	(STRUCT_SPRITE_X,a6),(VDP_DATA)			; copy the new x-coordinate
	bra.w	MoveSpriteSetPattern		; update the sprite pattern	and exit
TestLeft:
	cmpi.w	#DIRECTION_LEFT,d7			; test for left
	bne.w	ExitMoveSprite				; branch if not
	; update the sprite's X position
	subq	#SPRITE_STEP_PIXELS,(STRUCT_SPRITE_X,a6)	; decrement SPRITE_X
	; update the sprite in the sprite table
	move.w	(a6),d7						; copy sprite ID to d7
   	mulu.w	#$08,d7						; mult by 8 to get sprite array offset
   	addq	#STRUCT_SPRITEDEF_X,d7		; move to x-coordinate
   	swap	d7                          ; move to upper word
	add.l	#VDP_VRAM_WRITE_SPRITE,d7	; add to sprite table address
	move.l	d7,(VDP_CONTROL)			; set write location in VDP
	move.w	(STRUCT_SPRITE_X,a6),(VDP_DATA)			; copy the new x-coordinate
MoveSpriteSetPattern:
	; update the sprite animation	
	bsr.w	SetSpritePattern		; set the new pattern for the sprite
ExitMoveSprite:
	if	_SPRITE_COLLISION_
	bsr.w	FlipSpriteMapPosition	; set map data for the sprites' new position
	endif	
	rts
