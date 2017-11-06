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
	include 'tiles/title-tiles/tileset_title_logo.X68'
	include 'tiles/title-tiles/tileset_title_bg.X68'
	include 'tiles/title-tiles/tileset_title_menu.X68'
TileScreenTilesEnd:

;-------------------------------------------------------------------------------
; video buffet scenery tiles
;-------------------------------------------------------------------------------

StoreVBTilesStart:

	include 'tiles/scene-tiles/tileset_Merchandise.X68'

	include 'tiles/scene-tiles/tileset_CounterLow.X68'

	include 'tiles/scene-tiles/tileset_CounterHigh.X68'

RegisterTilesStart:
	include 'tiles/scene-tiles/tileset_Register.X68'
RegisterTilesEnd:

	include 'tiles/scene-tiles/tileset_HWRack.X68'

	include 'tiles/scene-tiles/tileset_16BitRack.X68'

StoreVBTilesEnd:

;-------------------------------------------------------------------------------
; cassette planet scene tiles
;-------------------------------------------------------------------------------
PosterTilesStart:
	include 'tiles/scene-tiles/tileset_Poster00.X68'
	include 'tiles/scene-tiles/tileset_Poster01.X68'
	include 'tiles/scene-tiles/tileset_Poster02.X68'
	include 'tiles/scene-tiles/tileset_Poster03.X68'
PosterTilesEnd:

CPlanetLogoTilesStart:
	include 'tiles/scene-tiles/tileset_CPlanetLogo.X68'
CPlanetLogoTilesEnd:

;-------------------------------------------------------------------------------
; denim country scene tiles
;-------------------------------------------------------------------------------
DenimCountryMerchandiseTilesStart:
	include 'tiles/scene-tiles/tileset_DenimCountryMerchandise.X68'
DenimCountryMerchandiseTilesEnd:

;-------------------------------------------------------------------------------
; hallway scene tiles
;-------------------------------------------------------------------------------
HallWestTilesStart:
	include 'tiles/scene-tiles/tileset_WestHallFloor.X68'
HallWestTilesEnd:

BenchSimpleTilesStart:
	include 'tiles/scene-tiles/tileset_benchsimple.X68'
BenchSimpleTilesEnd:

TrashCanTilesStart:
	include 'tiles/scene-tiles/tileset_TrashCan.X68'
TrashCanTilesEnd:

Plant24x32TilesStart:
	include 'tiles/scene-tiles/tileset_plant-24x32.X68'
Plant24x32TilesEnd:

Plant32x32TilesStart:
	include 'tiles/scene-tiles/tileset_plant-32x32.X68'
Plant32x32TilesEnd:

Plant32x64TilesStart:
	include 'tiles/scene-tiles/tileset_plant-32x64.X68'
Plant32x64TilesEnd:

InfoDeskTilesStart:
	include 'tiles/scene-tiles/tileset_InfoDesk.X68'
InfoDeskTilesEnd:

;-------------------------------------------------------------------------------
; fish or cut bait scene tiles
;-------------------------------------------------------------------------------
FCBFrameTilesStart:
	include 'tiles/scene-tiles/tileset_FCBFrame.X68'
FCBFrameTilesEnd:

;-------------------------------------------------------------------------------
; parking lot scene tiles
;-------------------------------------------------------------------------------
PavementTilesStart:
	include 'tiles/scene-tiles/tileset_pavement.X68'
PavementTilesEnd:

MallExteriorTilesStart:
	include 'tiles/scene-tiles/tileset_mallexterior.X68'
MallExteriorTilesEnd:

MallSignTilesStart:
	include 'tiles/scene-tiles/tileset_mallsign.X68'
MallSignTilesEnd:

ParkingStripeTilesStart:
	include 'tiles/scene-tiles/tileset_parkingstripe.X68'
ParkingStripeTilesEnd:

ParkingLotEdgeTilesStart:
	include 'tiles/scene-tiles/tileset_parkinglotedge.X68'
ParkingLotEdgeTilesEnd:

;-------------------------------------------------------------------------------
; santa's workshop scene tiles
;-------------------------------------------------------------------------------
BannerTilesStart:
	include 'tiles/scene-tiles/tileset_banner.X68'
BannerTilesEnd:

WorkshopFrameTilesStart:
	include 'tiles/scene-tiles/tileset_workshopframe.X68'
WorkshopFrameTilesEnd:

SnowFloorTilesStart:
	include 'tiles/scene-tiles/tileset_snow.X68'
SnowFloorTilesEnd:

;-------------------------------------------------------------------------------
; general store frame tiles
;-------------------------------------------------------------------------------

CarpetFloorTilesStart:
	include 'tiles/scene-tiles/tileset_Floor.X68'
	; swap for this tileset for the debug grid pattern	
	;include 'tiles/scene-tiles/tileset_FloorDebug.X68'
CarpetFloorTilesEnd:

NorthFrameRoundedTilesStart:
	include 'tiles/scene-tiles/tileset_northframe_rounded.X68'
NorthFrameRoundedTilesEnd:

WoodFloorVTilesStart:
	include 'tiles/scene-tiles/tileset_woodfloorv.X68'
WoodFloorVTilesEnd:

WoodFloorHTilesStart:
	include 'tiles/scene-tiles/tileset_woodfloorh.X68'
WoodFloorHTilesEnd:

WoodFloorSlopedTilesStart:
	include 'tiles/scene-tiles/tileset_woodfloorsloped.X68'
WoodFloorSlopedTilesEnd:

WindowAngledTilesStart:
	include 'tiles/scene-tiles/tileset_windowangled.X68'
WindowAngledTilesEnd:

TileFloorTilesStart:
	include 'tiles/scene-tiles/tileset_tilefloor.X68'
TileFloorTilesEnd:

SimpleTileFloorTilesStart:
	include 'tiles/scene-tiles/tileset_tilefloorsimple.X68'
SimpleTileFloorTilesEnd:

StoneFloorTilesStart:
	include 'tiles/scene-tiles/tileset_stonefloor.X68'
StoneFloorTilesEnd:

TackyFloorTilesStart:
	include 'tiles/scene-tiles/tileset_tackyfloor.X68'
TackyFloorTilesEnd:

StoreFrameTilesStart:
	include 'tiles/scene-tiles/tileset_StoreFrame.X68'
StoreFrameTilesEnd:

StoreFrameThreeColorTilesStart:
	include 'tiles/scene-tiles/tileset_StoreFrameThreeColor.X68'
StoreFrameThreeColorTilesEnd:

StoreFrontWindowTilesStart:
	include 'tiles/scene-tiles/tileset_StoreFront.X68'
StoreFrontWindowTilesEnd:

BlackLightFloorTilesStart:
	include 'tiles/scene-tiles/tileset_blacklightfloortile.X68'
BlackLightFloorTilesEnd:

LargeStoreFrontTilesStart:
	include 'tiles/scene-tiles/tileset_largestorefront.X68'
LargeStoreFrontTilesEnd:

SideStoreEntranceTilesStart:
	include 'tiles/scene-tiles/tileset_StoreEntranceSide.X68'
SideStoreEntranceTilesEnd:

SideStoreEntranceSquareTilesStart:
	include 'tiles/scene-tiles/tileset_StoreEntranceSideSquare.X68'
SideStoreEntranceSquareTilesEnd:

;-------------------------------------------------------------------------------
; general scenery tiles
;-------------------------------------------------------------------------------
SimpleCounterTilesStart:
	include 'tiles/scene-tiles/tileset_countertop.X68'
SimpleCounterTilesEnd:

BorderedCounterTilesStart:
	include 'tiles/scene-tiles/tileset_countertopbordered.X68'
BorderedCounterTilesEnd:

AccentedCounterTilesStart:
	include 'tiles/scene-tiles/tileset_countertopaccented.X68'
AccentedCounterTilesEnd:

TableTilesStart:
	include 'tiles/scene-tiles/tileset_table.X68'
TableTilesEnd:

CounterShelvesTilesStart:
	include 'tiles/scene-tiles/tileset_CounterShelves.X68'
CounterShelvesTilesEnd:


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

;-------------------------------------------------------------------------------
; used for development builds only
;-------------------------------------------------------------------------------
	if	_DEBUG_
DebugWireframeTilesStart:
	include 'tiles/scene-tiles/tileset_debugwireframe.X68'
DebugWireframeTilesEnd:
	endif

