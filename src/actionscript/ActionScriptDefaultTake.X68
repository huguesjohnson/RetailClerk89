;*******************************************************************************
; general routines to take items & add items to the player's inventory
;*******************************************************************************
;-------------------------------------------------------------------------------
; displays a message if the player can't hold more items
;-------------------------------------------------------------------------------
DefaultActionInventoryFull:
	lea	TakeMenuFull,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDefaultActionInventoryFull:
	rts

;-------------------------------------------------------------------------------
; adds an item from the take dialog to the player's inventory
;-------------------------------------------------------------------------------
DefaultTakeAddItem:
	move.w	(MEM_ACTIVE_ITEM),d7	; copy active item to d7
	bsr.w	HasItem	; check if the player already has the item
	cmpi.w	#$FFFF,d6	; d6 will have FFFF if the player has the item	
	bne.s	DefaultTakeAddItemHasItem	; branch if the player has the item
	bsr.w	AddItem	; add the item
	lea	TakeMenuItemTaken,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
DefaultTakeAddItemHasItem:
	lea	TakeMenuAlreadyCarrying,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;*******************************************************************************
; default take scripts for scenes
;*******************************************************************************

;-------------------------------------------------------------------------------
; scene00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
Scene00DefaultTake:
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_SCENE_VB_MAGS,d6	; is the magazine rack the target?
	bne.s	.1	; most to next test
	lea	TakeMenuMagazines,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVBMagazine,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.w	ExitScene00DefaultTake	; exit
.1	; test for OBJ_SCENE_VB_8BIT
	cmpi.w	#OBJ_SCENE_VB_8BIT,d6	; is the magazine rack the target?
	bne.s	.2	; most to next test
	lea	TakeMenuGames,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVB8Bit,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.w	ExitScene00DefaultTake	; exit
.2	; test for OBJ_SCENE_VB_HARDWARE
	cmpi.w	#OBJ_SCENE_VB_HARDWARE,d6	; is the hardware rack the target?
	bne.s	.3	; most to next test
	lea	TakeMenuDefault,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVBHW,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.s	ExitScene00DefaultTake	; exit
.3	; test for OBJ_SCENE_VB_16BIT
	cmpi.w	#OBJ_SCENE_VB_16BIT,d6	; is the 16-bit rack the target?
	bne.s	.4	; most to next test
	lea	TakeMenuGames,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVB16Bit,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.s	ExitScene00DefaultTake	; exit
.4	; test for OBJ_SCENE_VB_HANDHELD
	cmpi.w	#OBJ_SCENE_VB_HANDHELD,d6	; is the handheld rack the target?
	bne.s	.5	; most to next test
	lea	TakeMenuGames,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVBHandheld,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.s	ExitScene00DefaultTake	; exit
.5	; test for OBJ_SCENE_VB_PC
	cmpi.w	#OBJ_SCENE_VB_PC,d6	; is the PC rack the target?
	bne.s	.6	; most to next test
	lea	TakeMenuDefault,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	lea	ItemListVBPC,a6	; load item list
	move.l	a6,MEM_DIALOG_ITEM_LIST	; copy address to MEM_DIALOG_ITEM_LIST
	bra.s	ExitScene00DefaultTake	; exit
.6	; default for anything else in the scene
	lea	DialogTextCantTake,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
ExitScene00DefaultTake:
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7	; set text choice flag
	bset.l	#DIALOG_FLAG_STYLE_ITEM_MENU,d7	; set item menu flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	rts

