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
	dc.l	DialogTextDaniScene0Day0Action0
	; OBJ_NPC_MALE_SHOPPER0
	dc.l	DialogTextMaleShopper0
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
	; OBJ_SCENE_VB_REGISTER
	dc.l	ObjectNameRegister

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

