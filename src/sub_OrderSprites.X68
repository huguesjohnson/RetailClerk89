; this assumes NPC sprites are ordered from highest to lowest y value
; lower y value = higher draw order -> need to find 1st NPC with >Y than player
; TODO - do something more elegant like actually loop through all sprites
OrderSprites:
	move.w	#$2700,sr		; disable interrupts
	tst	(MEM_ACTIVE_NPC_COUNT)	; are there any NPC sprites?
	bne.w	OrderSpritesTestNPC2	; branch if there are NPCs to check
	; sprite zero link field
	move.w	#LINK_SPRITE0,d2	; sprite ID 0 is the sprite to modify
	move.w	(MEM_PLAYER_SPRITE_ID),d3	; link to player sprite
	bsr.w	SetSpriteLink	; set the link
	; player link field
	move.w	(MEM_PLAYER_SPRITE_ID),d2	; player sprite is the sprite to modify
	move.w	#LINK_SPRITE0,d3	; link to sprite 0
	bsr.w	SetSpriteLink	; set the link
	bra.w	ExitOrderSprites	; exit subroutine
;-------------------------------------------------------------------------------
; if the player sprite is below NPC2 then the link order is:
; SPRITE0 -> PLAYER -> NPC2 -> NPC1 -> NPC0 -> SPRITE0
;-------------------------------------------------------------------------------
OrderSpritesTestNPC2:	; test if player sprite is below NPC2
	move.w	(MEM_NPC2_SPRITE_Y),d6	; copy NPC Y to d6
	cmp.w	(MEM_PLAYER_SPRITE_Y),d6	; test which is higher
	bge.s	OrderSpritesTestNPC1
	; test if the player sprite links are already correct	
	cmpi.w	#LINK_NPC2,(MEM_PLAYER_SPRITE_LINK_TO)	; check "to" link
	bne.w	OrderSpritesSetLinksNPC2	; links need to be set
	cmpi.w	#LINK_SPRITE0,(MEM_PLAYER_SPRITE_LINK_FROM); check "from" link
	beq.w	ExitOrderSprites	; exit if the links are already OK
OrderSpritesSetLinksNPC2:
	move.w	#LINK_SPRITE0,d2
	move.w	#LINK_PLAYER,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_PLAYER,d2
	move.w	#LINK_NPC2,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC2,d2
	move.w	#LINK_NPC1,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC1,d2
	move.w	#LINK_NPC0,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC0,d2
	move.w	#LINK_SPRITE0,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC2,(MEM_PLAYER_SPRITE_LINK_TO)
	move.w	#LINK_SPRITE0,(MEM_PLAYER_SPRITE_LINK_FROM)
	bra.w	ExitOrderSprites	; exit subroutine
;-------------------------------------------------------------------------------
; if the player sprite is above NPC2 and below NPC1 then the link order is:
; SPRITE0 -> NPC2 -> PLAYER -> NPC1 -> NPC0 -> SPRITE0
;-------------------------------------------------------------------------------
OrderSpritesTestNPC1:	; test if player sprite is below NPC1
	move.w	(MEM_NPC1_SPRITE_Y),d6	; copy NPC Y to d6
	cmp.w	(MEM_PLAYER_SPRITE_Y),d6	; test which is higher
	bge.s	OrderSpritesTestNPC0
	; test if the player sprite links are already correct	
	cmpi.w	#LINK_NPC1,(MEM_PLAYER_SPRITE_LINK_TO)	; check "to" link
	bne.s	OrderSpritesSetLinksNPC1	; links need to be set
	cmpi.w	#LINK_NPC2,(MEM_PLAYER_SPRITE_LINK_FROM); check "from" link
	beq.w	ExitOrderSprites	; exit if the links are already OK
OrderSpritesSetLinksNPC1:
	move.w	#LINK_SPRITE0,d2
	move.w	#LINK_NPC2,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC2,d2
	move.w	#LINK_PLAYER,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_PLAYER,d2
	move.w	#LINK_NPC1,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC1,d2
	move.w	#LINK_NPC0,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC0,d2
	move.w	#LINK_SPRITE0,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC1,(MEM_PLAYER_SPRITE_LINK_TO)
	move.w	#LINK_NPC2,(MEM_PLAYER_SPRITE_LINK_FROM)
	bra.w	ExitOrderSprites	; exit subroutine
;-------------------------------------------------------------------------------
; if the player sprite is above NPC1 and below NPC0 then the link order is:
; SPRITE0 -> NPC2 -> NPC1 -> PLAYER -> NPC0 -> SPRITE0
;-------------------------------------------------------------------------------
OrderSpritesTestNPC0:	; test if player sprite below NPC0
	move.w	(MEM_NPC0_SPRITE_Y),d6	; copy NPC Y to d6
	cmp.w	(MEM_PLAYER_SPRITE_Y),d6	; test which is higher
	bge.s	OrderSpritesDefault
	; test if the player sprite links are already correct	
	cmpi.w	#LINK_NPC0,(MEM_PLAYER_SPRITE_LINK_TO)	; check "to" link
	bne.s	OrderSpritesSetLinksNPC0	; links need to be set
	cmpi.w	#LINK_NPC1,(MEM_PLAYER_SPRITE_LINK_FROM); check "from" link
	beq.w	ExitOrderSprites	; exit if the links are already OK
OrderSpritesSetLinksNPC0:
	move.w	#LINK_SPRITE0,d2
	move.w	#LINK_NPC2,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC2,d2
	move.w	#LINK_NPC1,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC1,d2
	move.w	#LINK_PLAYER,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_PLAYER,d2
	move.w	#LINK_NPC0,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC0,d2
	move.w	#LINK_SPRITE0,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC0,(MEM_PLAYER_SPRITE_LINK_TO)
	move.w	#LINK_NPC1,(MEM_PLAYER_SPRITE_LINK_FROM)
	bra.w	ExitOrderSprites	; exit subroutine
;-------------------------------------------------------------------------------
; if the player sprite is above NPC0 then the link order is:
; SPRITE0 -> NPC2 -> NPC1 -> NPC0 -> PLAYER -> SPRITE0
;-------------------------------------------------------------------------------
OrderSpritesDefault:
	; test if the player sprite links are already correct	
	cmp.w	#LINK_SPRITE0,(MEM_PLAYER_SPRITE_LINK_TO)	; check "to" link
	bne.s	OrderSpritesDefaultSetLinks	; links need to be set
	cmp.w	#LINK_NPC0,(MEM_PLAYER_SPRITE_LINK_FROM); check "from" link
	beq.w	ExitOrderSprites	; exit if the links are already OK
OrderSpritesDefaultSetLinks:
	move.w	#LINK_SPRITE0,d2
	move.w	#LINK_NPC2,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC2,d2
	move.w	#LINK_NPC1,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC1,d2
	move.w	#LINK_NPC0,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_NPC0,d2
	move.w	#LINK_PLAYER,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_PLAYER,d2
	move.w	#LINK_SPRITE0,d3
	bsr.w	SetSpriteLink
	move.w	#LINK_SPRITE0,(MEM_PLAYER_SPRITE_LINK_TO)
	move.w	#LINK_NPC0,(MEM_PLAYER_SPRITE_LINK_FROM)
ExitOrderSprites:
	move.w	#$0000,MEM_SPRITE_Y_ORDER_CHANGED	; clear Y order changed
	move.w	#$2000,sr		; re-enable interrupts
	rts
