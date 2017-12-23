;-------------------------------------------------------------------------------
; day 00 - scene 00
;-------------------------------------------------------------------------------
Day00Scene00Action00:	; ACTION_LOOK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	Day00Scene00Action00Default	; branch to default
	lea	DialogTextDaniScene0Day0Action0,a6	; load text for the day
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
	lea	DialogTextDaniScene0Day0Flag0,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCDaniFlag8:
	lea	DialogTextDaniScene0Day0Flag8,a6	; load dialog text
	bra.w	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCDaniFlag1:
	lea	DialogTextDaniScene0Day0Flag1,a6	; load dialog text
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
	lea	DialogTextMaleShopper0Scene0Day0Flag8,a6	; load dialog text
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
	lea	DialogTextMaleShopper0Scene0Day0Flag0,a6	; load dialog text
	bra.s	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCMaleShopperFlag4:	; flag is set
	lea	DialogTextMaleShopper0Scene0Day0Flag4,a6	; load dialog text
	bra.s	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Register:
	btst.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; test if 1st event ran
	beq.s	Day00Scene00Action01Default	; branch if not
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bclr.l	#STATE_FLAG_EXITS_BLOCKED,d7	; clear flag blocking the exits
	move.l	d7,(MEM_GAME_STATE)	; save updated flags
	; queue the scripted event
	lea ScriptedEventDay0Exit,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextRegisterDay0Use,a6	; load dialog text
	bra.s	Day00Scene00Action01CopyDialogText	; branch to setup dialog
Day00Scene00Action01NPCGreenberg:
	;---------------------------------------------------------------------------
	; handle dialog with Greenberg		
	;---------------------------------------------------------------------------
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	bne.w	Day00Scene00Action01Default	; branch to display default text
	lea	DialogTextGreenbergScene0Day0Talk,a6	; load dialog text
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
	bne.s	Day00Scene00Action02DefaultTake	; if not branch
Day00Scene00Action02LaunchScriptedEvent:
	; set flag to indicate the scripted event ran
	bset.l	#EVENT_FLAG_DAY00_EVENT00_COMPLETE,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated event flag
Day00Scene00Action02LaunchScriptedRight:
	lea	ScriptedEventDay0Right,a6	; point a6 to event to load
	bsr.w	QueueScriptedEvent	; queue the event
	bsr.w	Scene00DefaultTake	; use scene defaults
	rts	; exit
Day00Scene00Action02DefaultTake:
	bsr.w	Scene00DefaultTake	; use scene defaults
	bra.w	ExitDay00Scene00Action02	; exit
Day00Scene00Action02GiveNPC:
	move.w	(MEM_ACTIVE_ITEM),d7	; copy item being given to d7
	bsr.w	RemoveItem	; remove the item
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
	lea	DialogTextMaleShopper0Scene0Day0Flag4Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bset.l	#EVENT_FLAG_DAY00_NPC01_GIVE00,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	rts
Day00Scene00Action02GiveNPCFlag5:
	lea	DialogTextMaleShopper0Scene0Day0Flag5Give,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bset.l	#EVENT_FLAG_DAY00_NPC01_GIVE01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back
	rts
Day00Scene00Action02GiveNPCFlag6:
	lea	DialogTextMaleShopper0Scene0Day0Flag6Give,a6	; load dialog text
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
	lea	DialogTextGreenbergScene0Day0Give,a6	; load dialog text
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
	lea	DialogTextMaleShopper0Scene0Day0Flag0R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.w	ExitDay00Scene00Action03	; exit
Day00Scene00Action03NPCMaleShopperFlag0R1:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	bset.l	#EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE01,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save the updated flags
	lea	DialogTextMaleShopper0Scene0Day0Flag0R1,a6	; load response text
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
	lea	DialogTextMaleShopper0Scene0Day0Flag2R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
Day00Scene00Action03NPCMaleShopperFlag2R1:
	lea	DialogTextMaleShopper0Scene0Day0Flag2R1,a6	; load response text
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
	lea	DialogTextMaleShopper0Scene0Day0Flag3R0,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
Day00Scene00Action03NPCMaleShopperFlag3R1:
	lea	DialogTextMaleShopper0Scene0Day0Flag3R1,a6	; load response text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay00Scene00Action03	; exit
Day00Scene00Action03Default:
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	ResetDialog	; reset the dialog
ExitDay00Scene00Action03:
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 01
;-------------------------------------------------------------------------------
Day00Scene01Action00:	; ACTION_LOOK
Day00Scene01Action01:	; ACTION_USE_TALK
Day00Scene01Action02:	; ACTION_TAKE_GIVE
Day00Scene01Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 02
;-------------------------------------------------------------------------------
Day00Scene02Action00:	; ACTION_LOOK
Day00Scene02Action01:	; ACTION_USE_TALK
Day00Scene02Action02:	; ACTION_TAKE_GIVE
Day00Scene02Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 03
;-------------------------------------------------------------------------------
Day00Scene03Action00:	; ACTION_LOOK
Day00Scene03Action01:	; ACTION_USE_TALK
Day00Scene03Action02:	; ACTION_TAKE_GIVE
Day00Scene03Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 04
;-------------------------------------------------------------------------------
Day00Scene04Action00:	; ACTION_LOOK
Day00Scene04Action01:	; ACTION_USE_TALK
Day00Scene04Action02:	; ACTION_TAKE_GIVE
Day00Scene04Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 05
;-------------------------------------------------------------------------------
Day00Scene05Action00:	; ACTION_LOOK
Day00Scene05Action01:	; ACTION_USE_TALK
Day00Scene05Action02:	; ACTION_TAKE_GIVE
Day00Scene05Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 06
;-------------------------------------------------------------------------------
Day00Scene06Action00:	; ACTION_LOOK
Day00Scene06Action01:	; ACTION_USE_TALK
Day00Scene06Action02:	; ACTION_TAKE_GIVE
Day00Scene06Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 07
;-------------------------------------------------------------------------------
Day00Scene07Action00:	; ACTION_LOOK
Day00Scene07Action01:	; ACTION_USE_TALK
Day00Scene07Action02:	; ACTION_TAKE_GIVE
Day00Scene07Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 08
;-------------------------------------------------------------------------------
Day00Scene08Action00:	; ACTION_LOOK
Day00Scene08Action01:	; ACTION_USE_TALK
Day00Scene08Action02:	; ACTION_TAKE_GIVE
Day00Scene08Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 09
;-------------------------------------------------------------------------------
Day00Scene09Action00:	; ACTION_LOOK
Day00Scene09Action01:	; ACTION_USE_TALK
Day00Scene09Action02:	; ACTION_TAKE_GIVE
Day00Scene09Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 0A
;-------------------------------------------------------------------------------
Day00Scene0AAction00:	; ACTION_LOOK
Day00Scene0AAction01:	; ACTION_USE_TALK
Day00Scene0AAction02:	; ACTION_TAKE_GIVE
Day00Scene0AAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 0B
;-------------------------------------------------------------------------------
Day00Scene0BAction00:	; ACTION_LOOK
Day00Scene0BAction01:	; ACTION_USE_TALK
Day00Scene0BAction02:	; ACTION_TAKE_GIVE
Day00Scene0BAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 0C
;-------------------------------------------------------------------------------
Day00Scene0CAction00:	; ACTION_LOOK
Day00Scene0CAction01:	; ACTION_USE_TALK
Day00Scene0CAction02:	; ACTION_TAKE_GIVE
Day00Scene0CAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 0D
;-------------------------------------------------------------------------------
Day00Scene0DAction00:	; ACTION_LOOK
Day00Scene0DAction01:	; ACTION_USE_TALK
Day00Scene0DAction02:	; ACTION_TAKE_GIVE
Day00Scene0DAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 0E
;-------------------------------------------------------------------------------
Day00Scene0EAction00:	; ACTION_LOOK
Day00Scene0EAction01:	; ACTION_USE_TALK
Day00Scene0EAction02:	; ACTION_TAKE_GIVE
Day00Scene0EAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 0F
;-------------------------------------------------------------------------------
Day00Scene0FAction00:	; ACTION_LOOK
Day00Scene0FAction01:	; ACTION_USE_TALK
Day00Scene0FAction02:	; ACTION_TAKE_GIVE
Day00Scene0FAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 10
;-------------------------------------------------------------------------------
Day00Scene10Action00:	; ACTION_LOOK
Day00Scene10Action01:	; ACTION_USE_TALK
Day00Scene10Action02:	; ACTION_TAKE_GIVE
Day00Scene10Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 11
;-------------------------------------------------------------------------------
Day00Scene11Action00:	; ACTION_LOOK
Day00Scene11Action01:	; ACTION_USE_TALK
Day00Scene11Action02:	; ACTION_TAKE_GIVE
Day00Scene11Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 12
;-------------------------------------------------------------------------------
Day00Scene12Action00:	; ACTION_LOOK
Day00Scene12Action01:	; ACTION_USE_TALK
Day00Scene12Action02:	; ACTION_TAKE_GIVE
Day00Scene12Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 13
;-------------------------------------------------------------------------------
Day00Scene13Action00:	; ACTION_LOOK
Day00Scene13Action01:	; ACTION_USE_TALK
Day00Scene13Action02:	; ACTION_TAKE_GIVE
Day00Scene13Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 14
;-------------------------------------------------------------------------------
Day00Scene14Action00:	; ACTION_LOOK
Day00Scene14Action01:	; ACTION_USE_TALK
Day00Scene14Action02:	; ACTION_TAKE_GIVE
Day00Scene14Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 15
;-------------------------------------------------------------------------------
Day00Scene15Action00:	; ACTION_LOOK
Day00Scene15Action01:	; ACTION_USE_TALK
Day00Scene15Action02:	; ACTION_TAKE_GIVE
Day00Scene15Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 16
;-------------------------------------------------------------------------------
Day00Scene16Action00:	; ACTION_LOOK
Day00Scene16Action01:	; ACTION_USE_TALK
Day00Scene16Action02:	; ACTION_TAKE_GIVE
Day00Scene16Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 00 - scene 17
;-------------------------------------------------------------------------------
Day00Scene17Action00:	; ACTION_LOOK
Day00Scene17Action01:	; ACTION_USE_TALK
Day00Scene17Action02:	; ACTION_TAKE_GIVE
Day00Scene17Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

