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

	include 'tiles/scene-tiles/tileset_HandheldRack.X68'

	include 'tiles/scene-tiles/tileset_PCRack.X68'

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
; checkers scene tiles
;-------------------------------------------------------------------------------
MannequinStandTilesStart:
	include 'tiles/scene-tiles/tileset_MannequinStand.X68'
MannequinStandTilesEnd:

MannequinStandNarrowTilesStart:
	include 'tiles/scene-tiles/tileset_MannequinStandNarrow.X68'
MannequinStandNarrowTilesEnd:

MannequinMTilesStart:
	include 'tiles/scene-tiles/tileset_MannequinMA.X68'
	include 'tiles/scene-tiles/tileset_MannequinMB.X68'
	include 'tiles/scene-tiles/tileset_MannequinMC.X68'
	include 'tiles/scene-tiles/tileset_MannequinMD.X68'
	include 'tiles/scene-tiles/tileset_MannequinME.X68'
	include 'tiles/scene-tiles/tileset_MannequinMF.X68'
MannequinMTilesEnd:

CheckersMerchandiseTilesStart:
	include 'tiles/scene-tiles/tileset_CheckersMerchandise.X68'
CheckersMerchandiseTilesEnd:

;-------------------------------------------------------------------------------
; clothesnow scene tiles
;-------------------------------------------------------------------------------
MannequinFTilesStart:
	include 'tiles/scene-tiles/tileset_MannequinFA.X68'
	include 'tiles/scene-tiles/tileset_MannequinFB.X68'
	include 'tiles/scene-tiles/tileset_MannequinFC.X68'
	include 'tiles/scene-tiles/tileset_MannequinFD.X68'
MannequinFTilesEnd:

;-------------------------------------------------------------------------------
; transistor lodge scene tiles
;-------------------------------------------------------------------------------
TLodgeMerchandiseTilesStart:
	include 'tiles/scene-tiles/tileset_tlodge_scenery1.X68'
	include 'tiles/scene-tiles/tileset_tlodge_scenery2.X68'
	include 'tiles/scene-tiles/tileset_rccar.X68'
TLodgeMerchandiseTilesEnd:

;-------------------------------------------------------------------------------
; sunset video scene tiles
;-------------------------------------------------------------------------------
SVideoMerchandiseTilesStart:
	include 'tiles/scene-tiles/tileset_SVideoMerchandise.X68'
SVideoMerchandiseTilesEnd:

;-------------------------------------------------------------------------------
; nut shack scene tiles
;-------------------------------------------------------------------------------
NShackSceneryTilesStart:
	include 'tiles/scene-tiles/tileset_nshack_case.X68'
	include 'tiles/scene-tiles/tileset_barrel.X68'
NShackSceneryTilesEnd:

;-------------------------------------------------------------------------------
; pogo dawg scene tiles
;-------------------------------------------------------------------------------
PogoDawgSceneryTilesStart:
	include 'tiles/scene-tiles/tileset_pogodawg_seating.X68'
PogoDawgSceneryTilesEnd:

;-------------------------------------------------------------------------------
; cassette planet scene tiles
;-------------------------------------------------------------------------------
CPlanetSceneryTilesStart:
	include 'tiles/scene-tiles/tileset_cplanetShelves.X68'
	include 'tiles/scene-tiles/tileset_cplanetCDs.X68'
CPlanetSceneryTilesEnd:

;-------------------------------------------------------------------------------
; bookstore scene tiles
;-------------------------------------------------------------------------------
TBooksSceneryTilesStart:
	include 'tiles/scene-tiles/tileset_tbooksBookshelves.X68'
TBooksSceneryTilesEnd:

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

KioskShelvesTilesStart:
	include 'tiles/scene-tiles/tileset_ShelvesKiosk.X68'
KioskShelvesTilesEnd:

PhoneTilesStart:
	include 'tiles/scene-tiles/tileset_phone.X68'
PhoneTilesEnd:

;-------------------------------------------------------------------------------
; fish or cut bait scene tiles
;-------------------------------------------------------------------------------
FCBFrameTilesStart:
	include 'tiles/scene-tiles/tileset_FCBFrame.X68'
FCBFrameTilesEnd:

WaterTilesStart:
	include 'tiles/scene-tiles/tileset_water.X68'
WaterTilesEnd:

FCBCenterTopTilesStart:
	include 'tiles/scene-tiles/tileset_fcbcentertop.X68'
FCBCenterTopTilesEnd:

FCBCenterTilesStart:
	include 'tiles/scene-tiles/tileset_fcbcenter.X68'
FCBCenterTilesEnd:

FCBCenterLeftTilesStart:
	include 'tiles/scene-tiles/tileset_fcbcenterleft00.X68'
	include 'tiles/scene-tiles/tileset_fcbcenterleft01.X68'
	include 'tiles/scene-tiles/tileset_fcbcenterleft02.X68'
	include 'tiles/scene-tiles/tileset_fcbcenterleft03.X68'
FCBCenterLeftTilesEnd:

FCBCenterRightTilesStart:
	include 'tiles/scene-tiles/tileset_fcbcenterright00.X68'
	include 'tiles/scene-tiles/tileset_fcbcenterright01.X68'
	include 'tiles/scene-tiles/tileset_fcbcenterright02.X68'
	include 'tiles/scene-tiles/tileset_fcbcenterright03.X68'
FCBCenterRightTilesEnd:

FCBFishingTilesStart:
	include 'tiles/scene-tiles/tileset_fishingpoles.X68'
FCBFishingTilesEnd:

FCBFirearmsTilesStart:
	include 'tiles/scene-tiles/tileset_firearms.X68'
FCBFirearmsTilesEnd:

FCBCampingTilesStart:
	include 'tiles/scene-tiles/tileset_firepit.X68'
	include 'tiles/scene-tiles/tileset_tent-mid.X68'
	include 'tiles/scene-tiles/tileset_tent-tall.X68'
FCBCampingTilesEnd:

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

JunkerCarTilesStart:
	include 'tiles/scene-tiles/tileset_junker.X68'
JunkerCarTilesEnd:

;-------------------------------------------------------------------------------
; cavern scene tiles
;-------------------------------------------------------------------------------
CavernSceneryTilesStart:

ArcadeLogoTilesStart:
	include 'tiles/scene-tiles/tileset_arcadelogo.X68'
ArcadeLogoTilesEnd:

	include	'tiles/scene-tiles/tileset_arcadecabinetbase00.X68'
	include	'tiles/scene-tiles/tileset_arcadecabinetbase01.X68'
	include	'tiles/scene-tiles/tileset_arcadecabinetbase02.X68'
	include	'tiles/scene-tiles/tileset_arcadecabinettop00.X68'
	include	'tiles/scene-tiles/tileset_arcadecabinettop01.X68'
	include	'tiles/scene-tiles/tileset_arcadecabinettop02.X68'

CavernSceneryTilesEnd:

;-------------------------------------------------------------------------------
; santa's workshop scene tiles
;-------------------------------------------------------------------------------
BannerTilesStart:
	include 'tiles/scene-tiles/tileset_banner.X68'
BannerTilesEnd:

WorkshopTilesStart:

WorkshopFrameTilesStart:
	include 'tiles/scene-tiles/tileset_workshopframe.X68'
WorkshopFrameTilesEnd:

SnowFloorTilesStart:
	include 'tiles/scene-tiles/tileset_snow.X68'
SnowFloorTilesEnd:

FenceTilesStart:
	include 'tiles/scene-tiles/tileset_fence.X68'
FenceTilesEnd:

	include 'tiles/scene-tiles/tileset_workshop.X68'

	include 'tiles/scene-tiles/tileset_workshoppole.X68'

	include 'tiles/scene-tiles/tileset_workshoptree.X68'

WorkshopTilesEnd:

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

RegisterAltTilesStart:
	include 'tiles/scene-tiles/tileset_register_alt.X68'
RegisterAltTilesEnd:

RegisterAlt2TilesStart:
	include 'tiles/scene-tiles/tileset_register_alt2.X68'
RegisterAlt2TilesEnd:

RegisterAlt3TilesStart:
	include 'tiles/scene-tiles/tileset_register_alt3.X68'
RegisterAlt3TilesEnd:

RegisterAltFlippedTilesStart:
	include 'tiles/scene-tiles/tileset_register_alt_flipped.X68'
RegisterAltFlippedTilesEnd:

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

CounterShelvesAltTilesStart:
	include 'tiles/scene-tiles/tileset_CounterShelvesAlt.X68'
CounterShelvesAltTilesEnd:

TrashTilesStart:
	include 'tiles/scene-tiles/tileset_trash.X68'
TrashTilesEnd:

;-------------------------------------------------------------------------------
; sprite tiles
;-------------------------------------------------------------------------------

SpriteZeroTilesStart:
	include 'tiles/sprite-tiles/tileset_SpriteZero.X68'
SpriteZeroTilesEnd:

PlayerSpriteTilesStart:
	if _SPRITE_TILE_DEBUG_
	include 'tiles/sprite-tiles/tileset_SpriteDebug.X68'
	else
	include 'tiles/sprite-tiles/tileset_PlayerDB.X68'
	endif
PlayerSpriteTilesEnd:

NPCSpriteDaniTilesStart:
	if _SPRITE_TILE_DEBUG_
	include 'tiles/sprite-tiles/tileset_SpriteDebug.X68'
	else
	include 'tiles/sprite-tiles/tileset_PlayerDani.X68'
	endif
NPCSprite1TilesEnd:

NPCSpriteMaleShopper0Start:
	include 'tiles/sprite-tiles/tileset_NPCSprite2.X68'
NPCSpriteMaleShopper0End:

NPCSpriteGreenbergStart:
	include 'tiles/sprite-tiles/tileset_NPCSprite3.X68'
NPCSpriteGreenbergEnd:

NPCSpriteFemaleShopper0Start:
	include 'tiles/sprite-tiles/tileset_NPCSprite4.X68'
NPCSpriteFemaleShopper0End:

NPCSpriteSecretShopperTilesStart:
	include 'tiles/sprite-tiles/tileset_NPCSpriteSecretShopper.X68'
NPCSpriteSecretShopperTilesEnd:

NPCSpriteGuard0TilesStart:
	include 'tiles/sprite-tiles/tileset_NPCSpriteGuard0.X68'
NPCSpriteGuard0TilesEnd

NPCSpriteTrendyGuyTilesStart:
	include 'tiles/sprite-tiles/tileset_NPCTrendyGuy.X68'
NPCSpriteTrendyGuyTilesEnd

Scene03StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene03StaffNPC.X68'
Scene03StaffNPCTilesEnd:

Scene08StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene08StaffNPC.X68'
Scene08StaffNPCTilesEnd:

Scene09StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene09StaffNPC.X68'
Scene09StaffNPCTilesEnd:

Scene0AStaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene0AStaffNPC.X68'
Scene0AStaffNPCTilesEnd:

Scene0BStaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene0BStaffNPC.X68'
Scene0BStaffNPCTilesEnd:

Scene0CStaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene0CStaffNPC.X68'
Scene0CStaffNPCTilesEnd:

Scene0DStaffNPC0TilesStart:
	include 'tiles/sprite-tiles/tileset_Scene0DStaffNPC0.X68'
Scene0DStaffNPC0TilesEnd:

Scene0DStaffNPC1TilesStart:
	include 'tiles/sprite-tiles/tileset_Scene0DStaffNPC1.X68'
Scene0DStaffNPC1TilesEnd:

Scene0EStaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene0EStaffNPC.X68'
Scene0EStaffNPCTilesEnd:

Scene0FStaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene0FStaffNPC.X68'
Scene0FStaffNPCTilesEnd:

Scene10StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene10StaffNPC.X68'
Scene10StaffNPCTilesEnd:

Scene11StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene11StaffNPC.X68'
Scene11StaffNPCTilesEnd:

Scene12StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene12StaffNPC.X68'
Scene12StaffNPCTilesEnd:

Scene13StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene13StaffNPC.X68'
Scene13StaffNPCTilesEnd:

Scene14StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene14StaffNPC.X68'
Scene14StaffNPCTilesEnd:

Scene15StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene15StaffNPC.X68'
Scene15StaffNPCTilesEnd:

Scene16StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene16StaffNPC.X68'
Scene16StaffNPCTilesEnd:

Scene17StaffNPCTilesStart:
	include 'tiles/sprite-tiles/tileset_Scene17StaffNPC.X68'
Scene17StaffNPCTilesEnd:

;-------------------------------------------------------------------------------
; status screen tiles
;-------------------------------------------------------------------------------
StatusScreenMapTilesStart:
	include 'tiles/scene-tiles/tileset_status-map.X68'
StatusScreenMapTilesEnd:

StatusScreenMallLogoTilesStart:
	include 'tiles/scene-tiles/tileset_status-mall-logo.X68'
StatusScreenMallLogoTilesEnd:

StatusScreenMapIconTilesStart:
	include 'tiles/scene-tiles/tileset_status-map-icon.X68'
StatusScreenMapIconTilesEnd:

;-------------------------------------------------------------------------------
; used for development builds only
;-------------------------------------------------------------------------------
	if	_DEBUG_
DebugWireframeTilesStart:
	include 'tiles/scene-tiles/tileset_debugwireframe.X68'
DebugWireframeTilesEnd:
	endif

