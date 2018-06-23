LoadSpriteZeroTiles:
	bsr.w	WaitVBlank	; added to resolve issue running in Genecyst
	move.w	#$2700,sr		; disable interrupts
	movea.l	#SpriteZeroTilesStart,a0	; set address of first tile to load
	move.w	#SPRITE_VDP,d1	; setup call to BuildVRAMWriteAddress
	bsr.w	BuildVRAMWriteAddress	; build the VRAM write address
	moveq	#$8,d0	; number of tiles in a sprite tileset
	bsr.w	LoadTiles	; branch to LoadTiles subroutine
	move.w	#$2000,sr		; re-enable interrupts
	rts

LoadPlayerSpriteTiles:
	bsr.w	WaitVBlank	; added to resolve issue running in Genecyst
	move.w	#$2700,sr		; disable interrupts
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; which sprite tiles to use?
	beq.s	.1	; branch to use tiles for Dani
	movea.l	#PlayerSpriteTilesStart,a0	; set address of first tile to load
	bra.s	.2	; branch to write tiles to VPD
.1	; using the Dani tiles for the player sprite
	movea.l	#NPCSpriteDaniTilesStart,a0	; set address of first tile to load
.2	; write tiles to VDP
	move.w	#PLAYER_SPRITE_VDP,d1	; setup call to BuildVRAMWriteAddress
	bsr.w	BuildVRAMWriteAddress	; build the VRAM write address
	move.w	#SPRITE_TILESET_LWORDS,d0	; number of tiles in a sprite tileset
	bsr.w	LoadTiles	; branch to LoadTiles subroutine
	move.w	#$2000,sr		; re-enable interrupts
	rts
