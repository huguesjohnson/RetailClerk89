;-------------------------------------------------------------------------------
; default object descriptions
;-------------------------------------------------------------------------------
DefaultObjectDescriptionTable:
	; nothing
	dc.l	DialogTextNothing
	; OBJ_SCENE_VB_8BIT
	dc.l	DialogText8Bit
	; OBJ_SCENE_VB_HARDWARE
	dc.l	DialogTextHardware
	; OBJ_SCENE_VB_16BIT
	dc.l	DialogText16Bit
	; OBJ_SCENE_VB_MAGS
	dc.l	DialogTextMags
	; OBJ_SCENE_VB_COUNTER
	dc.l	DialogTextCounter
	; OBJ_SCENE_VB_REGISTER
	dc.l	DialogTextRegister

;-------------------------------------------------------------------------------
; default npc descriptions
;-------------------------------------------------------------------------------
DefaultNPCDescriptionTable:
	; nothing
	dc.l	DialogTextNothing
	; OBJ_NPC_DANI
	dc.l	DialogTextDaniDefaultLook
	; OBJ_NPC_MALE_SHOPPER0
	dc.l	DialogTextMaleShopper00DefaultLook
	; OBJ_NPC_GREENBERG
	dc.l	DialogTextGreenbergDefaultLook

;-------------------------------------------------------------------------------
; object names
;-------------------------------------------------------------------------------
ObjectNameTable:
	dc.l	$00000000
	; OBJ_SCENE_VB_8BIT
	dc.l	ObjectName8Bit
	; OBJ_SCENE_VB_HARDWARE
	dc.l	ObjectNameComputerHardware
	; OBJ_SCENE_VB_16BIT
	dc.l	ObjectName16Bit
	; OBJ_SCENE_VB_MAGS
	dc.l	ObjectNameMagazines
	; OBJ_SCENE_VB_COUNTER
	dc.l	ObjectNameCounter
	; OBJ_SCENE_REGISTER
	dc.l	ObjectNameRegister
	; OBJ_SCENE_DC_JEANS
	dc.l	ObjectNameJeans
	; OBJ_SCENE_BENCH
	dc.l	ObjectNameBench
	; OBJ_SCENE_TRASHCAN
	dc.l	ObjectNameTrashCan
	; OBJ_SCENE_PLANT
	dc.l	ObjectNamePlant
	; OBJ_SCENE_INFODESK
	dc.l	ObjectNameInfoDesk
	; OBJ_SCENE_TREE
	dc.l	ObjectNameTree
	; OBJ_SCENE_KIOSK
	dc.l	ObjectNameKiosk
	; OBJ_SCENE_PHONE
	dc.l	ObjectNamePhone
	; OBJ_SCENE_DANICAR
	dc.l	ObjectNameDaniCar
	; OBJ_SCENE_MANNEQUIN
	dc.l	ObjectNameMannequin
	; OBJ_SCENE_CLOTHING
	dc.l	ObjectNameClothing
	; OBJ_SCENE_RADIO
	dc.l	ObjectNameRadio
	; OBJ_SCENE_CASSETTE_PLAYER
	dc.l	ObjectNameCassettePlayer
	; OBJ_SCENE_CELL_PHONE
	dc.l	ObjectNameCellPhone
	; OBJ_SCENE_RCCAR
	dc.l	ObjectNameRCCar
	; OBJ_SCENE_COMPUTER
	dc.l	ObjectNameComputer
	; OBJ_SCENE_OFFICEPHONE
	dc.l	ObjectNameOfficePhone
	; OBJ_SCENE_VIDEOWALL
	dc.l	ObjectNameVideoWall
	; OBJ_SCENE_VIDEORACK
	dc.l	ObjectNameVideoRack
	; OBJ_SCENE_NUTCASE
	dc.l	ObjectNameNutCase
	; OBJ_SCENE_NUTBARREL
	dc.l	ObjectNameNutBarrel
	; OBJ_SCENE_TABLE
	dc.l	ObjectNameSceneTable
	; OBJ_SCENE_TRASH
	dc.l	ObjectNameTrash
	; OBJ_SCENE_TAPES
	dc.l	ObjectNameTapes
	; OBJ_SCENE_CDS
	dc.l	ObjectNameCDs
	; OBJ_SCENE_BOOKS_FICTION
	dc.l	ObjectNameBooksFiction
	; OBJ_SCENE_BOOKS_ROMANCE
	dc.l	ObjectNameBooksRomance
	; OBJ_SCENE_BOOKS_HISTORY
	dc.l	ObjectNameBooksHistory
	; OBJ_SCENE_BOOKS_COOKING
	dc.l	ObjectNameBooksCooking
	; OBJ_SCENE_ARCADE0
	dc.l	ObjectNameArcade0
	; OBJ_SCENE_ARCADE1
	dc.l	ObjectNameArcade1
	; OBJ_SCENE_ARCADE2
	dc.l	ObjectNameArcade2
	; OBJ_SCENE_ARCADE3
	dc.l	ObjectNameArcade3
	; OBJ_SCENE_ARCADE4
	dc.l	ObjectNameArcade4
	; OBJ_SCENE_ARCADE5
	dc.l	ObjectNameArcade5
	; OBJ_SCENE_ARCADE6
	dc.l	ObjectNameArcade6
	; OBJ_SCENE_ARCADE7
	dc.l	ObjectNameArcade7
	; OBJ_SCENE_ARCADE8
	dc.l	ObjectNameArcade8

;-------------------------------------------------------------------------------
; npc names
;-------------------------------------------------------------------------------
NPCNameTable:
	dc.l	$00000000
	; OBJ_NPC_DANI
	dc.l	NPCNameDani
	; OBJ_NPC_MALE_SHOPPER0
	dc.l	NPCNameMapperShopper0
	; OBJ_NPC_GREENBERG
	dc.l	NPCNameGreenberg

;-------------------------------------------------------------------------------
; item names
;-------------------------------------------------------------------------------
ItemNameTable:
	; OBJ_ITEM_NOTHING
	dc.l	ItemNameNothing
	; OBJ_ITEM_MAG_GAMEPRO
	dc.l	ItemNameMagGamePro
	; OBJ_ITEM_MAG_EGM
	dc.l	ItemNameMagEGM
	; OBJ_ITEM_MAG_ANTIC
	dc.l	ItemNameMagAntic
	; OBJ_ITEM_MAG_ANALOG
	dc.l	ItemNameMagAnalog
	; OBJ_ITEM_8BIT_MEGAMAN2
	dc.l	ItemName8BitMegaMan2
	; OBJ_ITEM_8BIT_SHADOWGATE
	dc.l	ItemName8BitShadowgate
	; OBJ_ITEM_8BIT_BAYOUBILLY
	dc.l	ItemName8BitBayouBilly
	; OBJ_ITEM_8BIT_TMNT
	dc.l	ItemName8BitTMNT
	; OBJ_ITEM_16BIT_GOLDENAXE
	dc.l	ItemName16BitGoldenAxe
	; OBJ_ITEM_16BIT_LASTBATTLE
	dc.l	ItemName16BitLastBattle
	; OBJ_ITEM_16BIT_GALAGA90
	dc.l	ItemName16BitGalaga90
	; OBJ_ITEM_16BIT_VIGILANTE
	dc.l	ItemName16BitVigilante
	; OBJ_ITEM_HW_SBLASTER
	dc.l	ItemNameHWSBlaster
	; OBJ_ITEM_HW_PRODIGY
	dc.l	ItemNameHWProdigy
	; OBJ_ITEM_HW_35DISKS
	dc.l	ItemName35Disks
	; OBJ_ITEM_HW_PRNTRIBBON
	dc.l	ItemNameHWPrintRibbon

