;-------------------------------------------------------------------------------
; day 00 - scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
Day00Scene00Action00:	; ACTION_LOOK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	Day00Scene00Action00Default	; branch to default
	lea	DialogTextDaniScene00Day00Action0,a6	; load text for the day
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitDay00Scene00Action00	; exit
Day00Scene00Action00Default:
	bsr.w	ShowDefaultText
ExitDay00Scene00Action00:
	rts

Day00Scene00Action01:	; ACTION_USE_TALK
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_SCENE_REGISTER,d6	; test target
	beq.w	Day00Scene00Register	; branch if this is the register
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	Day00Scene00Action01NPCMaleShopper	; branch to next NPC
Day00Scene00Action01NPCDani:
	;---------------------------------------------------------------------------
	; handle dialog with NPC Dani		
	;---------------------------------------------------------------------------
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	bne	Day00Scene00Action01NPCDaniFlag8	; branch if it is
	btst.l	#EVENT_FLAG_DAY00_NPC00_DIALOG00,d7	; test if flag set
	bne	Day00Scene00Action01NPCDaniFlag1	; branch if it is
	bset.l	#EVENT_FLAG_DAY00_NPC00_DIALOG00,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated event flags for the day
	lea	DialogTextDaniScene00Day00Flag0,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCDaniFlag8:
	lea	DialogTextDaniScene00Day00Flag8,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCDaniFlag1:
	lea	DialogTextDaniScene00Day00Flag1,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCMaleShopper:
	;---------------------------------------------------------------------------
	; handle dialog with shopper		
	;---------------------------------------------------------------------------
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.w	Day00Scene00Action01NPCGreenberg	; test next NPC
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	bne	Day00Scene00Action01NPCMaleShopperTestFlag8	; branch if it is
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG01,d7	; test if flag set
	bne	Day00Scene00Action01NPCMaleShopperFlag4	; branch if it is set
	; if 4 is not set but 2 or 3 are then the player cancelled a dialog
	bra.s	Day00Scene00Action01NPCMaleShopperTestFlag3 ; no flags are set
Day00Scene00Action01NPCMaleShopperTestFlag8:
	lea	DialogTextMaleShopper0Scene00Day00Flag8,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCMaleShopperTestFlag3:
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE01,d7	; test if flag set
	beq.s	Day00Scene00Action01NPCMaleShopperTestFlag2	; flag is 0, next test
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; set text choice flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	bra.w	Day00Scene00Action03NPCMaleShopperFlag0R1	; show selection
Day00Scene00Action01NPCMaleShopperTestFlag2:
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE00,d7	; test if flag set
	beq.s	Day00Scene00Action01NPCMaleShopperNoFlags	; flag is 0
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; set text choice flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	bra.w	Day00Scene00Action03NPCMaleShopperFlag0R0	; show selection
Day00Scene00Action01NPCMaleShopperNoFlags:
	; no flags for this NPC are set - use initial dialog
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; set text choice flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated dialog flags
	lea	DialogTextMaleShopper0Scene00Day00Flag0,a6	; load dialog text
	bra.s	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCMaleShopperFlag4:	; flag is set
	lea	DialogTextMaleShopper0Scene00Day00Flag4,a6	; load dialog text
	bra.s	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Register:
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	beq.s	Day00Scene00Action01Default	; branch if not
	btst.l	#EVENT_FLAG_DAY00_EVENT01_COMPLETE,d7	; test if 2nd event ran
	bne.s	Day00Scene00Action01Default	; branch if it did
	bset.l	#EVENT_FLAG_DAY00_EVENT01_COMPLETE,d7	; set that 2nd event now ran
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated day event flags
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bclr.l	#STATE_FLAG_EXITS_BLOCKED,d7	; clear flag blocking the exits
	move.l	d7,(MEM_GAME_STATE)	; save updated flags
	; queue the scripted event
	lea ScriptedEventDay00Exit,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	; update NPC locations
	move.l	#$01000000,(MEM_NPC_LOCATION_PARKINGLOT)
	lea	DialogTextRegisterDay0Use,a6	; load dialog text
	bra.s	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCGreenberg:
	;---------------------------------------------------------------------------
	; handle dialog with Greenberg		
	;---------------------------------------------------------------------------
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	bne.w	Day00Scene00Action01Default	; branch to display default text
	lea	DialogTextGreenbergScene00Day00Talk,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01Default:
	; default
	lea	DialogTextNothingHappens,a6	; load default text
Day00Scene00Action01CopyDialogText:
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay00Scene00Action01:
	rts

Day00Scene00Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	andi.w	#OBJ_SCENE_BASE,d6	; and against base scene ID
	beq.w	Day00Scene00Action02GiveNPC	; not scenery
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	bne.s	Day00Scene00Action02DefaultTake	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_GIVE02,d7	; test if last give flag is set
	beq.s	Day00Scene00Action02DefaultTake	; flag is not set, branch
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6 (again)
	cmpi.w	#OBJ_SCENE_VB_8BIT,d6	; is the player looking at 8-bit games?
	beq.s	Day00Scene00Action02LaunchScriptedEvent	; if so, launch event
	cmpi.w	#OBJ_SCENE_VB_16BIT,d6	; is the player looking at 16-bit games?
	beq.s	Day00Scene00Action02LaunchScriptedEvent	; if so, launch event
	cmpi.w	#OBJ_SCENE_VB_HANDHELD,d6	; is player looking at handheld games?
	bne.s	Day00Scene00Action02DefaultTake	; if not branch
Day00Scene00Action02LaunchScriptedEvent:
	; set flag to indicate the scripted event ran
	bset.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated event flag
Day00Scene00Action02LaunchScriptedRight:
	lea	ScriptedEventDay00Right,a6	; point a6 to event to load
	bsr.w	QueueScriptedEvent	; queue the event
	bsr.w	Scene00DefaultTake	; use scene defaults
	rts	; exit
Day00Scene00Action02DefaultTake:
	bsr.w	Scene00DefaultTake	; use scene defaults
	bra.w	ExitDay00Scene00Action02	; exit
Day00Scene00Action02GiveNPC:
	bsr.w	RemoveActiveItem	; remove the item
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.s	Day00Scene00Action02GiveNPCTest2	; branch if not MALE_SHOPPER0
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	bne.s	Day00Scene00Action02GiveNPCDefault	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_GIVE01,d7	; test if flag is set
	bne.s	Day00Scene00Action02GiveNPCFlag6	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_GIVE00,d7	; test if flag is set
	bne.s	Day00Scene00Action02GiveNPCFlag5	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG01,d7	; test if flag is set
	bne.s	Day00Scene00Action02GiveNPCFlag4	; flag is set, branch
Day00Scene00Action02GiveNPCDefault:
	; flag is not set, use default text
	lea	DialogTextMaleShopperDefaultGive,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene00Action02GiveNPCFlag4:
	lea	DialogTextMaleShopper0Scene00Day00Flag4Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bset.l	#EVENT_FLAG_DAY00_NPC01_GIVE00,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	rts
Day00Scene00Action02GiveNPCFlag5:
	lea	DialogTextMaleShopper0Scene00Day00Flag5Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bset.l	#EVENT_FLAG_DAY00_NPC01_GIVE01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	rts
Day00Scene00Action02GiveNPCFlag6:
	lea	DialogTextMaleShopper0Scene00Day00Flag6Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bset.l	#EVENT_FLAG_DAY00_NPC01_GIVE02,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	rts
Day00Scene00Action02GiveNPCTest2:
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	Day00Scene00Action02GiveNPCTest3	; branch if not OBJ_NPC_DANI
	lea	DialogTextDaniDefaultGive,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene00Action02GiveNPCTest3:
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	bne.s	Day00Scene00Action02DefaultGive	; branch if not OBJ_NPC_DANI
	lea	DialogTextGreenbergScene00Day00Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene00Action02DefaultGive:
	lea	DialogTextNothingHappens,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay00Scene00Action02:
	rts

Day00Scene00Action03:	; ACTION_RESPOND
	;---------------------------------------------------------------------------
	; determine which NPC the player responded to
	;---------------------------------------------------------------------------
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	bne.w	Day00Scene00Action03Default	; branch to display default text
Day00Scene00Action03NPCMaleShopper:
	;---------------------------------------------------------------------------
	; determine which conversation flow to take
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE01,d7	; test if flag set
	bne.w	Day00Scene00Action03NPCMaleShopperFlag3	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE00,d7	; test if flag set
	bne.s	Day00Scene00Action03NPCMaleShopperFlag2	; flag is set, branch
;---------------------------------------------------------------------------
; player is responding to the NPC for the first time
;---------------------------------------------------------------------------
Day00Scene00Action03NPCMaleShopperFlag0:
	; both possible responses use a 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day00Scene00Action03NPCMaleShopperFlag0R1	; branch if not zero
Day00Scene00Action03NPCMaleShopperFlag0R0:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	bset.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE00,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	lea	DialogTextMaleShopper0Scene00Day00Flag0R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitDay00Scene00Action03	; exit
Day00Scene00Action03NPCMaleShopperFlag0R1:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	bset.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	lea	DialogTextMaleShopper0Scene00Day00Flag0R1,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitDay00Scene00Action03	; exit
;---------------------------------------------------------------------------
; player selected option 0 in the first dialog
;---------------------------------------------------------------------------
Day00Scene00Action03NPCMaleShopperFlag2:
	bset.l	#EVENT_FLAG_DAY00_NPC01_DIALOG01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	; both possible responses use a regular dialog	
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day00Scene00Action03NPCMaleShopperFlag2R1	; branch if not zero
Day00Scene00Action03NPCMaleShopperFlag2R0:
	lea	DialogTextMaleShopper0Scene00Day00Flag2R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
Day00Scene00Action03NPCMaleShopperFlag2R1:
	lea	DialogTextMaleShopper0Scene00Day00Flag2R1,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
;---------------------------------------------------------------------------
; player selected option 1 in the first dialog
;---------------------------------------------------------------------------
Day00Scene00Action03NPCMaleShopperFlag3:
	bset.l	#EVENT_FLAG_DAY00_NPC01_DIALOG01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	; both possible responses use a regular dialog	
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day00Scene00Action03NPCMaleShopperFlag3R1	; branch if not zero
Day00Scene00Action03NPCMaleShopperFlag3R0:
	lea	DialogTextMaleShopper0Scene00Day00Flag3R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
Day00Scene00Action03NPCMaleShopperFlag3R1:
	lea	DialogTextMaleShopper0Scene00Day00Flag3R1,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
Day00Scene00Action03Default:
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	ResetDialog	; reset the dialog
ExitDay00Scene00Action03:
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 01 (SCENE_ID_WWHALL)
;-------------------------------------------------------------------------------
Day00Scene01Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day00Scene01Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene01Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 02 (SCENE_ID_WEHALL)
;-------------------------------------------------------------------------------
Day00Scene02Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day00Scene02Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene02Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
Day00Scene03Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day00Scene03Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day00Scene03Action01NPC	; branch to display text
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene03Action01NPC:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	InfoDeskMenu,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene03Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day00Scene03Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene03Action02NPC:
	lea	DialogTextNPCCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene03Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day00Scene03Action03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day00Scene03Action03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day00Scene03Action03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextInfoDeskDay00R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene03Action03R0:
	lea	DialogTextInfoDeskDay00R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene03Action03R1:
	lea	DialogTextInfoDeskDay00R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene03Action03R2:
	lea	DialogTextInfoDeskDay00R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 04 (SCENE_ID_SHALL)
;-------------------------------------------------------------------------------
Day00Scene04Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day00Scene04Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene04Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 05 (SCENE_ID_PARKINGLOT)
;-------------------------------------------------------------------------------
Day00Scene05Action00:	; ACTION_LOOK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day00Scene05Action01NPCDani	; use the same action as talk
	cmpi.w	#OBJ_SCENE_DANICAR,d6	; test target
	beq.s	Day00Scene05DaniCarLookUse	; same action for look and use	
	; default action	
	lea	DialogTextNothing,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day00Scene05Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day00Scene05Action01NPCDani	; branch
	cmpi.w	#OBJ_SCENE_DANICAR,d6	; test target
	beq.s	Day00Scene05DaniCarLookUse	; same action for look and use	
	; default action	
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene05Action01NPCDani:
	lea	DialogTextDaniScene05Day00,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay00Scene05Action01:
	rts

Day00Scene05DaniCarLookUse:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDaniCarDayEnd,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day00Scene05Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day00Scene05Action02NPCDani	; branch
	cmpi.w	#OBJ_SCENE_DANICAR,d6	; test target
	beq.s	Day00Scene05Action02DaniCar	; branch	
	; default action	
	lea	DialogTextNothing,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene05Action02NPCDani:
	lea	DialogTextDaniDefaultGive,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene05Action02DaniCar:
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day00Scene05Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.w	Day00End	; branch to day end
	; else display message
	lea	DialogTextDaniWalkingHome,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 06 (SCENE_ID_EWHALL)
;-------------------------------------------------------------------------------
Day00Scene06Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day00Scene06Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene06Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 07 (SCENE_ID_EEHALL)
;-------------------------------------------------------------------------------
Day00Scene07Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day00Scene07Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GUARD0,d6	; test target
	beq.s	Day00Scene07Action01NPC	; branch to display text
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene07Action01NPC:
	lea	DialogTextSecurityGuardDay00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene07Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GUARD0,d6	; test target
	beq.s	Day00Scene07Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene07Action02NPC:
	lea	DialogTextSecurityGuardDay00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
Day00Scene17Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day00Scene17Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day00Scene17Action01NPC	; branch to display text
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene17Action01NPC:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextNPCSouthCenterStaffDay00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene17Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day00Scene17Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene17Action02NPC:
	lea	DialogTextNPCSouthCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene17Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day00Scene17Action03R0	; branch to text for response 0
	; response 1 must have been chosen 
	lea	DialogTextNPCSouthCenterStaffDay00R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day00Scene17Action03R0:
	lea	DialogTextNPCSouthCenterStaffDay00R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; end day 00
;-------------------------------------------------------------------------------
Day00End:
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	move.l	#$03160000,(MEM_NPC_LOCATION_VB)
	move.l	#$00000000,(MEM_NPC_LOCATION_PARKINGLOT)
	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL)
	move.l	#$06021719,(MEM_NPC_LOCATION_CHECKERS)
	;---------------------------------------------------------------------------	
	; update the game state
	;---------------------------------------------------------------------------	
	bsr.w	ClearPlayerInventory	; clear player inventory
	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; update sprite
	move.w	#$0001,(MEM_DAY)	; move to day 01
	move.w	#OBJECTIVE_D1_O0,(MEM_OBJECTIVE)	; increment objective
	move.l	(MEM_GAME_STATE),d7	; copy game state
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	bclr.l	#STATE_FLAG_EXPLORING,d7	; clear exploring flag
	bclr.l	#STATE_FLAG_MALL_CLOSED,d7	; clear mall closed flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS)	; clear day event flags
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission event flags
	and.l	#$00000000,(MEM_SCENE_BGM)	; clear the background music reference
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_DCOUNTRY,d7	; set the key that the player starts with
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; copy back
	;---------------------------------------------------------------------------	
	; set the intro screen counter
	;---------------------------------------------------------------------------	
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay01,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade-in
	;---------------------------------------------------------------------------	
	; queue the scripted event that starts day 1
	;---------------------------------------------------------------------------	
	lea ScriptedEventDay01Start,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts

