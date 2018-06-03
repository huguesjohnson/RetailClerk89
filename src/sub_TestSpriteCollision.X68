;-------------------------------------------------------------------------------
; TestSpriteCollision
; tests sprite collision based on its direction
; there is room to optimize and shorten this method a bit
; a6 = address of sprite info start
; a6 is not modified in this subroutine
; a4 is modified instead of a6 to avoid issues in MoveSprite
; a3 is used to load map data
; d3 is used for multiple operations
; d5 is used to store sprite y collision coordinate
; d6 is used to store sprite x collision coordinate
; d7 is used to test sprite direction and position against the map
;-------------------------------------------------------------------------------
TestSpriteCollision:
	;---------------------------------------------------------------------------
	; a6 = SPRITE_ID
	; a6 + 2 = SPRITE_X
	; a6 + 4 = SPRITE_Y
	; a6 + 6 = SPRITE_PATTERN_INDEX
	; a6 + 8 = SPRITE_DIRECTION
	; a6 + A = SPRITE_FRAME
	; a6 + C = SPRITE_STEP_COUNTER
	;---------------------------------------------------------------------------
TestSpriteCollisionSetup:
	;---------------------------------------------------------------------------
	; the setup section performs the following:
	; -clears the result from the previous subroutine call
	; -copies the sprite x position to d6, adjusts for scroll
	; -copies the sprite y position to d5, adjusts for scroll & collision point 
	; -copies the sprite direction to d7
	;---------------------------------------------------------------------------
	move.w	#$0000,(MEM_COLLISION_RESULT)	; clear result
	; copy sprite x postion to d6, and adjust for scroll
	movea.l	a6,a4			; store address in a4 because it is manipulated
	adda.l	#$2,a4			; move to a4+2 -> SPRITE_X
	move.w	(a4),d6			; store sprite x in d6
	; copy sprite y postion to d5, and adjust for scroll & collision point
	adda.l	#$2,a4			; move to a4+4 -> SPRITE_Y
	move.w	(a4),d5			; copy the sprite's y-position to d5
	add.w	#SPRITE_COLLISION_Y,d5	; test against collision box
	; copy sprite direction to d7
	adda.l	#$4,a4			; move to a4+8 -> SPRITE_DIRECTION
	move.w	(a4),d7			; store direction in d7
TestSpriteVCollision:
TestUpCollision:
	cmpi.w	#DIRECTION_UP,d7	; test if sprite is moving up
	bne.w	TestDownCollision 	; branch if not
TestUpCollisionLeftEdgeSetup:
	move.w	d5,d3	; copy y position to d3 because it is manipulated
	sub.w	#SPRITE_COLLISION_UP,d3	; test up from sprite
	andi.b	#%11111000,d3	; clear bits 0-2 to round to nearest power of 8
	cmpi.w	#MAP_MID_X,d6	; is sprite on the left or right side of the screen?
	blt.s	TestUpCollisionLeftEdge	; check if crossing the boundary
	addq	#$0004,d3		; on the right side, use 2nd lword for the column
TestUpCollisionLeftEdge:
	lea		MEM_COLLISION_DATA,a3	; move address of map data to a3
	adda.w	d3,a3					; move to row
	move.l	(a3),MEM_COLLISION_MAP_ROW	; copy row data to memory
	move.w	d6,d3	; copy the sprite's x-position to d3 
	and.w	#$00FF,d3 ; remove all bits over 255
	divu.w	#$08,d3 ; divide by 8 to get index in map data
	; clear remainder from high word (easy68k.com/paulrsm/doc/trick68k.htm)
	swap d3		; swap upper and lower words
	clr.w d3	; clear the upper word
	swap d3		; swap back
	move.l	MEM_COLLISION_MAP_ROW,d7		; move map data to d7
	btst.l	d3,d7							; test for collision
	beq.w	TestUpCollisionRightEdgeSetup	; no collision, test other side
	move.w	#$FFFF,(MEM_COLLISION_RESULT)	; collision is true, set result
	bra.w	ExitTestSpriteCollision			; exit
TestUpCollisionRightEdgeSetup:
	move.w	d5,d3	; copy y position to d3 because it is manipulated
	sub.w	#SPRITE_COLLISION_UP,d3	; test up from sprite
	andi.b	#%11111000,d3	; clear bits 0-2 to round to nearest power of 8
	add.w	#DEFAULT_SPRITE_WIDTH,d6	; move to right edge of sprite
	cmpi.w	#MAP_MID_X,d6	; is right half on right side of the screen?
	blt.s	TestUpCollisionRightEdge	; check if crossing the boundary
	addq	#$0004,d3		; on the right side, use 2nd lword for the column
TestUpCollisionRightEdge:
	lea		MEM_COLLISION_DATA,a3	; move address of map data to a3
	adda.w	d3,a3					; move to row
	move.l	(a3),MEM_COLLISION_MAP_ROW	; copy row data to memory
	move.w	d6,d3	; copy the sprite's x-position to d3
	and.w	#$00FF,d3 ; remove all bits over 255
	divu.w	#$08,d3 ; divide by 8 to get index in map data
	; clear remainder from high word (easy68k.com/paulrsm/doc/trick68k.htm)
	swap d3		; swap upper and lower words
	clr.w d3   	; clear the upper word
	swap d3		; swap back
	move.w	#$0000,(MEM_COLLISION_RESULT)	; clear result
	move.l	MEM_COLLISION_MAP_ROW,d7		; move map data to d7
	btst.l	d3,d7							; test for collision
	beq.w	ExitTestSpriteCollision			; no collision, exit
	move.w	#$FFFF,(MEM_COLLISION_RESULT)	; collision is true, set result
	bra.w	ExitTestSpriteCollision			; exit
TestDownCollision:
	cmpi.w	#DIRECTION_DOWN,d7 		; test if sprite is moving down
	bne.w	TestSpriteHCollision	; branch if not
TestDownCollisionLeftEdgeSetup:
	move.w	d5,d3	; copy y position to d3 because it is manipulated
	add.w	#SPRITE_COLLISION_DOWN,d3	; test down from sprite
	andi.b	#%11111000,d3	; clear bits 0-2 to round to nearest power of 8
	cmpi.w	#MAP_MID_X,d6	; is sprite on the left or right side of the screen?
	blt.s	TestDownCollisionLeftEdge	; check if crossing the boundary
	add.w	#$0004,d3		; on the right side, use 2nd lword for the column
TestDownCollisionLeftEdge:
	lea		MEM_COLLISION_DATA,a3	; move address of map data to a3
	adda.w	d3,a3					; move to row
	move.l	(a3),MEM_COLLISION_MAP_ROW	; copy row data to memory
	move.w	d6,d3	; copy the sprite's x-position to d3 
	and.w	#$00FF,d3 ; remove all bits over 255
	divu.w	#$08,d3 ; divide by 8 to get index in map data
	; clear remainder from high word (easy68k.com/paulrsm/doc/trick68k.htm)
	swap d3		; swap upper and lower words
	clr.w d3   	; clear the upper word
	swap d3		; swap back
	move.l	MEM_COLLISION_MAP_ROW,d7		; move map data to d7
	btst.l	d3,d7							; test for collision
	beq.w	TestDownCollisionRightEdgeSetup	; no collision, test other side
	move.w	#$FFFF,(MEM_COLLISION_RESULT)	; collision is true, set result
	bra.w	ExitTestSpriteCollision			; exit
TestDownCollisionRightEdgeSetup:
	move.w	d5,d3	; copy y position to d3 because it is manipulated
	add.w	#SPRITE_COLLISION_DOWN,d3	; test down from sprite
	andi.b	#%11111000,d3	; clear bits 0-2 to round to nearest power of 8
	add.w	#DEFAULT_SPRITE_WIDTH,d6	; move to right edge of sprite
	cmpi.w	#MAP_MID_X,d6	; is sprite on the left or right side of the screen?
	blt.s	TestDownCollisionRightEdge	; check if crossing the boundary
	addq	#$0004,d3		; on the right side, use 2nd lword for the column
TestDownCollisionRightEdge:
	lea		MEM_COLLISION_DATA,a3	; move address of map data to a3
	adda.w	d3,a3					; move to row
	move.l	(a3),MEM_COLLISION_MAP_ROW	; copy row data to memory
	move.w	d6,d3	; copy the sprite's x-position to d3
	and.w	#$00FF,d3 ; remove all bits over 255
	divu.w	#$08,d3 ; divide by 8 to get index in map data
	; clear remainder from high word (easy68k.com/paulrsm/doc/trick68k.htm)
	swap d3		; swap upper and lower words
	clr.w d3   	; clear the upper word
	swap d3		; swap back
	move.w	#$0000,(MEM_COLLISION_RESULT)	; clear result
	move.l	MEM_COLLISION_MAP_ROW,d7		; move map data to d7
	btst.l	d3,d7							; test for collision
	beq.w	ExitTestSpriteCollision			; no collision, exit
	move.w	#$FFFF,(MEM_COLLISION_RESULT)	; collision is true, set result
	bra.w	ExitTestSpriteCollision			; exit
TestSpriteHCollision:
TestRightCollision:
	cmpi.w	#DIRECTION_RIGHT,d7	; test if sprite is moving right
	bne.w	TestLeftCollision ; branch if not
TestRightSetup:
	; d5 will have bottom edge, d3 will have bottom edge
	move.w	d5,d3	; copy y position to d3 to store bottom edge
	add.w	#(DEFAULT_SPRITE_HEIGHT/2),d3	; move d3 to the bottom edge
	andi.b	#%11111000,d5	; clear bits 0-2 to round to nearest power of 8
	andi.b	#%11111000,d3	; clear bits 0-2 to round to nearest power of 8
	add.w	#SPRITE_COLLISION_RIGHT,d6	; test right from sprite
	cmpi.w	#MAP_MID_X,d6	; is collision on left or right side of the screen?
	blt.s	TestRightCollisionTopEdge ; left side, go directly to collision test
	addq	#$0004,d3		; on the right side, use 2nd lword for the column
	addq	#$0004,d5		; on the right side, use 2nd lword for the column
TestRightCollisionTopEdge:
	lea		MEM_COLLISION_DATA,a3	; move address of map data to a3
	adda.w	d5,a3	; move to row & col of top edge
	move.l	(a3),MEM_COLLISION_MAP_ROW	; copy row data to memory
	;move.w	d7,d3	; copy the sprite's x-position to d3
	and.w	#$00FF,d6 ; remove all bits over 255
	divu.w	#$08,d6 ; divide by 8 to get index in map data
	; clear remainder from high word
	; credit to http://www.easy68k.com/paulrsm/doc/trick68k.htm for this trick
	swap d6		; swap upper and lower words
	clr.w d6   	; clear the upper word
	swap d6		; swap back
	move.w	#$0000,(MEM_COLLISION_RESULT)	; clear result
	move.l	MEM_COLLISION_MAP_ROW,d7		; move map data to d7
	btst.l	d6,d7							; test for collision
	beq.w	TestRightCollisionBottomEdge	; no collision, check lower half
	move.w	#$FFFF,(MEM_COLLISION_RESULT)	; collision is true, set result
	bra.w	ExitTestSpriteCollision			; exit
TestRightCollisionBottomEdge:
	lea		MEM_COLLISION_DATA,a3	; move address of map data to a3
	adda.w	d3,a3	; move to row & col of bottom edge
	move.l	(a3),MEM_COLLISION_MAP_ROW	; copy row data to memory
	move.l	MEM_COLLISION_MAP_ROW,d7		; move map data to d7
	btst.l	d6,d7							; test for collision
	beq.w	ExitTestSpriteCollision 		; no collision, exit
	move.w	#$FFFF,(MEM_COLLISION_RESULT)	; collision is true, set result
	bra.w	ExitTestSpriteCollision			; exit
TestLeftCollision:
	cmpi.w	#DIRECTION_LEFT,d7	; test if sprite is moving Left
	bne.w	ExitTestSpriteCollision ; branch if not
TestLeftCollisionSetup:
	; d5 will have top edge, d3 will have bottom edge
	move.w	d5,d3	; copy y position to d3 to store bottom edge
	add.w	#(DEFAULT_SPRITE_HEIGHT/2),d3	; move d3 to the bottom edge
	andi.b	#%11111000,d5	; clear bits 0-2 to round to nearest power of 8
	andi.b	#%11111000,d3	; clear bits 0-2 to round to nearest power of 8
	sub.w	#SPRITE_COLLISION_LEFT,d6	; test left from sprite
	cmpi.w	#MAP_MID_X,d6	; is collision on left or right side of the screen?
	blt.s	TestLeftCollisionTopEdge ; left side, go directly to collision test
	addq	#$0004,d3		; on the right side, use 2nd lword for the column
	addq	#$0004,d5		; on the right side, use 2nd lword for the column
TestLeftCollisionTopEdge:
	lea		MEM_COLLISION_DATA,a3	; move address of map data to a3
	adda.w	d5,a3	; move to row & col of top edge
	move.l	(a3),MEM_COLLISION_MAP_ROW	; copy row data to memory
	;move.w	d7,d3	; copy the sprite's x-position to d3
	and.w	#$00FF,d6 ; remove all bits over 255
	divu.w	#$08,d6 ; divide by 8 to get index in map data
	; clear remainder from high word
	; credit to http://www.easy68k.com/paulrsm/doc/trick68k.htm for this trick
	swap d6		; swap upper and lower words
	clr.w d6   	; clear the upper word
	swap d6		; swap back
	move.w	#$0000,(MEM_COLLISION_RESULT)	; clear result
	move.l	MEM_COLLISION_MAP_ROW,d7		; move map data to d7
	btst.l	d6,d7							; test for collision
	beq.w	TestLeftCollisionBottomEdge	; no collision, check lower half
	move.w	#$FFFF,(MEM_COLLISION_RESULT)	; collision is true, set result
	bra.w	ExitTestSpriteCollision			; exit
TestLeftCollisionBottomEdge:
	lea		MEM_COLLISION_DATA,a3	; move address of map data to a3
	adda.w	d3,a3	; move to row & col of bottom edge
	move.l	(a3),MEM_COLLISION_MAP_ROW	; copy row data to memory
	move.l	MEM_COLLISION_MAP_ROW,d7		; move map data to d7
	btst.l	d6,d7							; test for collision
	beq.w	ExitTestSpriteCollision 		; no collision, exit
	move.w	#$FFFF,(MEM_COLLISION_RESULT)	; collision is true, set result
ExitTestSpriteCollision:
	rts


