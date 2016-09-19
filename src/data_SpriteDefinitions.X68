;-------------------------------------------------------------------------------
; sprite definition notes
; from: http://emu-docs.org/Genesis/Graphics/genvdp.txt
; -sprite attribute table is 640 bytes in size. 
; -each entry is 8-bytes in the following format:
;	index + 0  :   ------yy yyyyyyyy
;	index + 2  :   ----hhvv
;	index + 3  :   -lllllll
;	index + 4  :   pccvhnnn nnnnnnnn
;	index + 6  :   ------xx xxxxxxxx
; where 
;	y = vertical coordinate of sprite
;	h = horizontal size in cells (00b=1 cell, 11b=4 cells)
;	v = vertical size in cells (00b=1 cell, 11b=4 cells)
;	l = link field
;	p = priority
;	c = color palette
;	v = vertical flip
;	h = horizontal flip
;	n = sprite pattern start index
;	x = horizontal coordinate of sprite
;-------------------------------------------------------------------------------

PlayerSpriteDefinition:
	;---------------------------------------------------------------------------
	; index + 0 = vertical coordinate
	; ---- --yy yyyy yyyy
	;---------------------------------------------------------------------------
	dc.w 	SPRITE_PLAYER_INIT_Y
	;---------------------------------------------------------------------------
	; index + 2 = size (00=8px,01=16px,11=32px)
	;---------------------------------------------------------------------------
			;----hhvv
	dc.b	%00000111	; width=16,height=32
	;---------------------------------------------------------------------------
	; index + 3 = link field
	;---------------------------------------------------------------------------
			;-lllllll
	dc.b	%00000001	; 0
	;---------------------------------------------------------------------------
	; index + 4 = priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000000000101	; priority=0,palette=2,vflip=0,hflip=0,pattern=5
	;---------------------------------------------------------------------------
	; index + 6 = horizontal coordinate
	; ---- --yy yyyy yyyy
	;---------------------------------------------------------------------------
	dc.w 	SPRITE_PLAYER_INIT_X

NPCSprite1Definition:
	;---------------------------------------------------------------------------
	; index + 0 = vertical coordinate
	; ---- --yy yyyy yyyy
	;---------------------------------------------------------------------------
	dc.w 	SPRITE_NPC1_INIT_Y
	;---------------------------------------------------------------------------
	; index + 2 = size (00=8px,01=16px,11=32px)
	;---------------------------------------------------------------------------
			;----hhvv
	dc.b	%00000111	; width=16,height=32
	;---------------------------------------------------------------------------
	; index + 3 = link field
	;---------------------------------------------------------------------------
			;-lllllll
	dc.b	%00000000	; 0
	;---------------------------------------------------------------------------
	; index + 4 = priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000001100101	;priority=0,palette=2,vflip=0,hflip=0,pattern=65
	;---------------------------------------------------------------------------
	; index + 6 = horizontal coordinate
	; ---- --yy yyyy yyyy
	;---------------------------------------------------------------------------
	dc.w 	SPRITE_NPC1_INIT_X

