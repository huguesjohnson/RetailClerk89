;-------------------------------------------------------------------------------
; font tiles
;-------------------------------------------------------------------------------

FontTilesStart:
	include 'tiles/font-tiles/dwf.X68'
	include 'tiles/font-tiles/dialog-frame.X68'
FontTilesEnd:

;-------------------------------------------------------------------------------
; title screen tiles
;-------------------------------------------------------------------------------
TileScreenTilesStart:
	include 'tiles/title-tiles/titleset_title_00-0F.X68'
	include 'tiles/title-tiles/titleset_title_10-1F.X68'
	include 'tiles/title-tiles/titleset_title_20-2F.X68'
TileScreenTilesEnd:

;-------------------------------------------------------------------------------
; video buffet scene tiles
;-------------------------------------------------------------------------------

StoreVBTilesStart:

TransparentTileStart:
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
TransparentTileEnd:

	include 'tiles/scene-tiles/tileset_Floor.X68'
	; swap for this tileset for the debug grid pattern	
	;include 'tiles/scene-tiles/tileset_FloorDebug.X68'

	include 'tiles/scene-tiles/tileset_Merchandise.X68'

	include 'tiles/scene-tiles/tileset_StoreFrame.X68'

	include 'tiles/scene-tiles/tileset_StoreFront.X68'

	include 'tiles/scene-tiles/tileset_CounterLow.X68'

	include 'tiles/scene-tiles/tileset_CounterHigh.X68'

	include 'tiles/scene-tiles/tileset_Register.X68'

	include 'tiles/scene-tiles/tileset_HWRack.X68'

	include 'tiles/scene-tiles/tileset_16BitRack.X68'

StoreVBTilesEnd:

;-------------------------------------------------------------------------------
; sprite tiles
;-------------------------------------------------------------------------------

SpriteTilesStart:

SpriteZeroTilesStart:
	include 'tiles/sprite-tiles/tileset_SpriteZero.X68'
SpriteZeroTilesEnd:

PlayerSpriteTilesStart:
	include 'tiles/sprite-tiles/tileset_PlayerSprite.X68'
	; swap for this tileset for the debug pattern
	;include 'tiles/sprite-tiles/tileset_SpriteDebug.X68'
PlayerSpriteTilesEnd:

NPCSpriteDaniTilesStart:
	include 'tiles/sprite-tiles/tileset_NPCSprite1.X68'
	; swap for this tileset for the debug pattern
	;include 'tiles/sprite-tiles/tileset_SpriteDebug.X68'
NPCSprite1TilesEnd:

NPCSpriteMaleShopper0Start:
	include 'tiles/sprite-tiles/tileset_NPCSprite2.X68'
NPCSpriteMaleShopper0End:

NPCSpriteGreenbergStart:
	include 'tiles/sprite-tiles/tileset_NPCSprite3.X68'
NPCSpriteGreenbergEnd:


SpriteTilesEnd:


