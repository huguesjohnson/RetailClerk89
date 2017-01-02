; this assumes NPC sprites are ordered from highest to lowest y value
; lower y value = higher draw order -> need to find 1st NPC with >Y than player
; TODO - do something more elegant like actually loop through all sprites
OrderSprites:
	move.w	#$2700,sr		; disable interrupts
	tst	(MEM_ACTIVE_NPC_COUNT)	; are there any NPC sprites?
	bne.w	OrderSpritesTestNPC1	; branch if there are NPCs to check
	; sprite zero link field
	move.w	#$0000,d2	; sprite ID 0 is the sprite to modify
	move.w	(MEM_PLAYER_SPRITE_ID),d3	; link to player sprite
	bsr.w	SetSpriteLink	; set the link
	; player link field
	move.w	(MEM_PLAYER_SPRITE_ID),d2	; player sprite is the sprite to modify
	move.w	#$0000,d3	; link to sprite 0
	bsr.w	SetSpriteLink	; set the link
	bra.w	ExitOrderSprites	; exit subroutine
OrderSpritesTestNPC1:	; test if player sprite is lowest priority
	move.w	(MEM_NPC1_SPRITE_Y),d6	; copy NPC Y to d6
	cmp.w	(MEM_PLAYER_SPRITE_Y),d6	; test which is higher
	ble.s	OrderSpritesTestNPC0
	; test if the player sprite links are already correct	
	cmp.w	#$0000,(MEM_PLAYER_SPRITE_LINK_TO)	; check "to" link
	bne.s	.1	; links need to be set
	cmp.w	#$0002,(MEM_PLAYER_SPRITE_LINK_FROM); check "from" link
	beq.w	ExitOrderSprites	; exit if the links are already OK
.1
	move.w	#$0000,d2	; sprite ID 0 is the sprite to modify
	move.w	#$0003,d3	; link to sprite 3 (NPC1)
	bsr.w	SetSpriteLink	; set the link
	move.w	#$0001,d2	; player sprite is the sprite to modify
	move.w	#$0000,d3	; link to sprite 0
	bsr.w	SetSpriteLink	; set the link
	move.w	#$0003,d2	; sprite 3 (NPC1) is the sprite to modify
	move.w	#$0002,d3	; link to sprite 2 (NPC0)
	bsr.w	SetSpriteLink	; set the link
	move.w	#$0002,d2	; sprite 2 (NPC0) is the sprite to modify
	move.w	#$0001,d3	; link to player sprite
	bsr.w	SetSpriteLink	; set the link
	move.w	#$0000,(MEM_PLAYER_SPRITE_LINK_TO)	; save player sprite links
	move.w	#$0002,(MEM_PLAYER_SPRITE_LINK_FROM)	; save player sprite links
	bra.w	ExitOrderSprites	; exit subroutine
OrderSpritesTestNPC0:	; test if player sprite below NPC0
	move.w	(MEM_NPC0_SPRITE_Y),d6	; copy NPC Y to d6
	cmp.w	(MEM_PLAYER_SPRITE_Y),d6	; test which is higher
	ble.s	OrderSpritesDefault
	; test if the player sprite links are already correct	
	cmp.w	#$0003,(MEM_PLAYER_SPRITE_LINK_TO)	; check "to" link
	bne.s	.2	; links need to be set
	cmp.w	#$0002,(MEM_PLAYER_SPRITE_LINK_FROM); check "from" link
	beq.w	ExitOrderSprites	; exit if the links are already OK
.2
	move.w	#$0000,d2	; sprite ID 0 is the sprite to modify
	move.w	#$0002,d3	; link to sprite 2 (NPC0)
	bsr.w	SetSpriteLink	; set the link
	move.w	#$0002,d2	; sprite 2 (NPC0) is the sprite to modify
	move.w	#$0001,d3	; link to player sprite
	bsr.w	SetSpriteLink	; set the link
	move.w	#$0001,d2	; player sprite is the sprite to modify
	move.w	#$0003,d3	; link to sprite 3 (NPC1)
	bsr.w	SetSpriteLink	; set the link
	move.w	#$0003,d2	; sprite 3 (NPC1) is the sprite to modify
	move.w	#$0000,d3	; link to sprite 0
	bsr.w	SetSpriteLink	; set the link
	move.w	#$0003,(MEM_PLAYER_SPRITE_LINK_TO)	; save player sprite links
	move.w	#$0002,(MEM_PLAYER_SPRITE_LINK_FROM)	; save player sprite links
	bra.w	ExitOrderSprites	; exit subroutine
OrderSpritesDefault:
	; test if the player sprite links are already correct	
	cmp.w	#$0003,(MEM_PLAYER_SPRITE_LINK_TO)	; check "to" link
	bne.s	.3	; links need to be set
	cmp.w	#$0000,(MEM_PLAYER_SPRITE_LINK_FROM); check "from" link
	beq.w	ExitOrderSprites	; exit if the links are already OK
.3
	move.w	#$0000,d2	; sprite ID 0 is the sprite to modify
	move.w	#$0001,d3	; link to player sprite
	bsr.w	SetSpriteLink	; set the link
	; player sprite link field
	move.w	#$0001,d2	; player sprite is the sprite to modify
	move.w	#$0003,d3	; link to sprite 3 (NPC1)
	bsr.w	SetSpriteLink	; set the link
	; NPC1 sprite link field
	move.w	#$0003,d2	; sprite 3 (NPC1) is the sprite to modify
	move.w	#$0002,d3	; link to sprite 2 (NPC0)
	bsr.w	SetSpriteLink	; set the link
	; NPC0 sprite link field
	move.w	#$0002,d2	; sprite 2 (NPC0) is the sprite to modify
	move.w	#$0000,d3	; link to sprite 0
	bsr.w	SetSpriteLink	; set the link
	move.w	#$0003,(MEM_PLAYER_SPRITE_LINK_TO)	; save player sprite links
	move.w	#$0000,(MEM_PLAYER_SPRITE_LINK_FROM)	; save player sprite links
ExitOrderSprites:
	move.w	#$0000,MEM_SPRITE_Y_ORDER_CHANGED	; clear Y order changed
	move.w	#$2000,sr		; re-enable interrupts
	rts
