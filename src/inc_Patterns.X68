;-------------------------------------------------------------------------------
; dialog
;-------------------------------------------------------------------------------
	include 'patterns/pattern_Dialog.X68'
	include 'patterns/pattern_DialogTitled.X68'

;-------------------------------------------------------------------------------
; status screen
;-------------------------------------------------------------------------------
	include 'patterns/pattern_StatusScreen.X68'

;-------------------------------------------------------------------------------
; video buffet scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_ShelvesH.X68'
	include 'patterns/pattern_ShelvesM.X68'
	include 'patterns/pattern_ShelvesL.X68'
	include 'patterns/pattern_FrameTop.X68'
	include 'patterns/pattern_FrameTopOpen.X68'
	include 'patterns/pattern_FrameSide.X68'
	include 'patterns/pattern_FrameSouthClosed.X68'
	include 'patterns/pattern_SideClosed.X68'
	include 'patterns/pattern_StoreFront.X68'
	include 'patterns/pattern_StoreFrontFrame.X68'
	include 'patterns/pattern_CounterLow.X68'
	include 'patterns/pattern_CounterLowSide.X68'
	include 'patterns/pattern_CounterHigh.X68'
	include 'patterns/pattern_Register.X68'
	include 'patterns/pattern_HWRack.X68'
	include 'patterns/pattern_16BitRack.X68'
	include 'patterns/pattern_HandheldRack.X68'
	include 'patterns/pattern_PCRack.X68'

;-------------------------------------------------------------------------------
; casette planet scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_Poster.X68'

;-------------------------------------------------------------------------------
; transistor lodge scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_TLodgeMerch.X68'

;-------------------------------------------------------------------------------
; sunset video scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_SVideoMerch.X68'

;-------------------------------------------------------------------------------
; nut shack scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_NShackDisplayCase.X68'

;-------------------------------------------------------------------------------
; hot sam scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_BenchSeats.X68'

;-------------------------------------------------------------------------------
; cassette planet scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_CPlanetCDs.X68'

;-------------------------------------------------------------------------------
; bookstore scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_tbooksScenery.X68'

;-------------------------------------------------------------------------------
; checkers scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_CheckersShelves.X68'
	include 'patterns/pattern_MannequinStand.X68'

;-------------------------------------------------------------------------------
; generic store scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_GenericPatterns.X68'
	include 'patterns/pattern_WindowAngledLeft.X68'
	include 'patterns/pattern_WindowAngledCenter.X68'
	include 'patterns/pattern_WindowAngledRight.X68'
	include 'patterns/pattern_Floor.X68'
	include 'patterns/pattern_WoodFloorH.X68'
	include 'patterns/pattern_WoodFloorV.X68'
	include 'patterns/pattern_TackyFloor.X68'
	include 'patterns/pattern_32x32Tile.X68'
	include 'patterns/pattern_TileFloor.X68'
	include 'patterns/pattern_TileFloorSimple.X68'
	include	'patterns/pattern_LargeStoreFront.X68'
	include	'patterns/pattern_StoreFrameRounded.X68'
	include	'patterns/pattern_CounterTops.X68'
	include	'patterns/pattern_Tables.X68'

;-------------------------------------------------------------------------------
; hallway scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_HallFloor.X68'
	include 'patterns/pattern_HallFloorBorder.X68'
	include	'patterns/pattern_HallSouthFrame.X68'
	include	'patterns/pattern_Banner.X68'
	include 'patterns/pattern_SideEntrance.X68'
	include 'patterns/pattern_SideEntranceFloor.X68'
	include 'patterns/pattern_BenchSimple.X68'
	include 'patterns/pattern_BenchSimpleLong.X68'
	include	'patterns/pattern_InfoDesk.X68'
	include	'patterns/pattern_LongPlant.X68'
	include	'patterns/pattern_BoothMerch.X68'
	include	'patterns/pattern_KioskShelves.X68'

;-------------------------------------------------------------------------------
; parking lot scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_ParkingLotEdge.X68'
	include 'patterns/pattern_ParkingStripe.X68'
	include 'patterns/pattern_MallExteriorSide.X68'
	include 'patterns/pattern_MallExteriorSign.X68'

;-------------------------------------------------------------------------------
; fish or cut bait scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_FCBFloor.X68'
	include 'patterns/pattern_FCBFrame.X68'
	include 'patterns/pattern_FCBFishing.X68'
	include 'patterns/pattern_FCBFirearms.X68'
	include 'patterns/pattern_FCBCamping.X68'

;-------------------------------------------------------------------------------
; workshop scenery
;-------------------------------------------------------------------------------
	include 'patterns/pattern_WorkshopFrame.X68'
	include 'patterns/pattern_Workshop.X68'

;-------------------------------------------------------------------------------
; flashback scenes
;-------------------------------------------------------------------------------
	include 'patterns/pattern_Flashback.X68'

;-------------------------------------------------------------------------------
; ending scenes
;-------------------------------------------------------------------------------
	include 'patterns/pattern_Ending.X68'

;-------------------------------------------------------------------------------
; title and intro screens
;-------------------------------------------------------------------------------
	include 'patterns/pattern_TitleLogo.X68'
	include 'patterns/pattern_TitleLogo89.X68'
	include 'patterns/pattern_TitleMenu.X68'
	include 'patterns/pattern_TitleBackground.X68'
	include 'patterns/pattern_TitleFooter.X68'
	include 'patterns/pattern_IntroHint.X68'

;-------------------------------------------------------------------------------
; used for development builds only
;-------------------------------------------------------------------------------
	if	_DEBUG_
	include	'patterns/pattern_debugwireframe.X68'
	endif

