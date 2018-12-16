;-------------------------------------------------------------------------------
; day 06 - scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
Day06Scene00Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene00Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day06Scene00Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene00Action01NPC:
	lea	DialogTextGreenbergDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene00Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day06Scene00Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene00Action02NPC:
	lea	DialogTextGreenbergDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene00Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 01 (SCENE_ID_WWHALL)
;-------------------------------------------------------------------------------
Day06Scene01Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene01Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene01Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene01Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 02 (SCENE_ID_WEHALL)
;-------------------------------------------------------------------------------
Day06Scene02Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene02Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene02Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene02Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
Day06Scene03Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene03Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day06Scene03Action01NPC	; branch to display text
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action01NPC:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	InfoDeskMenu,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day06Scene03Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action02NPC:
	lea	DialogTextNPCCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day06Scene03Action03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day06Scene03Action03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day06Scene03Action03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextInfoDeskDay00R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action03R0:
	lea	DialogTextInfoDeskDay00R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action03R1:
	lea	DialogTextInfoDeskDay00R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action03R2:
	lea	DialogTextInfoDeskDay00R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 04 (SCENE_ID_SHALL)
;-------------------------------------------------------------------------------
Day06Scene04Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene04Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene04Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene04Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 05 (SCENE_ID_PARKINGLOT)
;-------------------------------------------------------------------------------
Day06Scene05Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts

Day06Scene05Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day06Scene05Action01NPCDani	; branch
	cmpi.w	#OBJ_SCENE_DANICAR,d6	; test target
	beq.s	Day06Scene05DaniCarLookUse	; same action for look and use
	; default action	
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay06Scene05Action01
Day06Scene05Action01NPCDani:
	lea	DialogTextDaniScene05Day06,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay06Scene05Action01:
	rts

Day06Scene05DaniCarLookUse:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDaniCarDayEnd,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day06Scene05Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day06Scene05Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.w	Day06End	; branch to day end
	; else exit
	lea	DialogTextDaniCarGameEndR0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 06 (SCENE_ID_EWHALL)
;-------------------------------------------------------------------------------
Day06Scene06Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene06Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene06Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene06Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 07 (SCENE_ID_EEHALL)
;-------------------------------------------------------------------------------
Day06Scene07Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene07Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene07Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene07Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 08 (SCENE_ID_DENIMCOUNTRY)
;-------------------------------------------------------------------------------
Day06Scene08Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene08Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day06Scene08Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene08Action01NPC:
	lea	DialogTextDenimCountryStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene08Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day06Scene08Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene08Action02NPC:
	lea	DialogTextNPCDenimCountryStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene08Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 09 (SCENE_ID_CHECKERS)
;-------------------------------------------------------------------------------
Day06Scene09Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene09Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day06Scene09Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene09Action01NPC:
	lea	DialogTextCheckersStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene09Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day06Scene09Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene09Action02NPC:
	lea	DialogTextNPCCheckersStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene09Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 0A (SCENE_ID_TLODGE)
;-------------------------------------------------------------------------------
Day06Scene0AAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene0AAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day06Scene0AAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0AAction01NPC:
	lea	DialogTextTLodgeStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0AAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day06Scene0AAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0AAction02NPC:
	lea	DialogTextNPCTLodgeStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0AAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 0B (SCENE_ID_CAVERN)
;-------------------------------------------------------------------------------
Day06Scene0BAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene0BAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day06Scene0BAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0BAction01NPC:
	lea	DialogTextCavernStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0BAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day06Scene0BAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0BAction02NPC:
	lea	DialogTextNPCCavernStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0BAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 0C (SCENE_ID_SVIDEO)
;-------------------------------------------------------------------------------
Day06Scene0CAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene0CAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day06Scene0CAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0CAction01NPC:
	lea	DialogTextSVideoStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0CAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day06Scene0CAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0CAction02NPC:
	lea	DialogTextNPCSVideoStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0CAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 0D (SCENE_ID_WORKSHOP)
;-------------------------------------------------------------------------------
Day06Scene0DAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene0DAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day06Scene0DAction01NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day06Scene0DAction01NPC1	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0DAction01NPC0:
	lea	DialogTextWorkshopStaff0DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0DAction01NPC1:
	lea	DialogTextWorkshopStaff1DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0DAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day06Scene0DAction02NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day06Scene0DAction02NPC1	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0DAction02NPC0:
	lea	DialogTextNPCWorkshopStaff0DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0DAction02NPC1:
	lea	DialogTextNPCWorkshopStaff1DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0DAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 0E (SCENE_ID_NSHACK)
;-------------------------------------------------------------------------------
Day06Scene0EAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene0EAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day06Scene0EAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0EAction01NPC:
	lea	DialogTextNShackStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0EAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day06Scene0EAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0EAction02NPC:
	lea	DialogTextNPCNShackStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0EAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 0F (SCENE_ID_POGODAWG)
;-------------------------------------------------------------------------------
Day06Scene0FAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene0FAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day06Scene0FAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0FAction01NPC:
	lea	DialogTextPogoDawgStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0FAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day06Scene0FAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0FAction02NPC:
	lea	DialogTextNPCPogoDawgStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0FAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 10 (SCENE_ID_CPLANET)
;-------------------------------------------------------------------------------
Day06Scene10Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene10Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day06Scene10Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene10Action01NPC:
	lea	DialogTextCPlanetStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene10Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day06Scene10Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene10Action02NPC:
	lea	DialogTextNPCCPlanetStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene10Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 11 (SCENE_ID_CNOW)
;-------------------------------------------------------------------------------
Day06Scene11Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene11Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day06Scene11Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene11Action01NPC:
	lea	DialogTextCNowStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene11Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day06Scene11Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene11Action02NPC:
	lea	DialogTextNPCCNowStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene11Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 12 (SCENE_ID_TBOOKS)
;-------------------------------------------------------------------------------
Day06Scene12Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene12Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day06Scene12Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene12Action01NPC:
	lea	DialogTextTBooksStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene12Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day06Scene12Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene12Action02NPC:
	lea	DialogTextNPCTBooksStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene12Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 13 (SCENE_ID_FCBCHECKOUT)
;-------------------------------------------------------------------------------
Day06Scene13Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene13Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day06Scene13Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene13Action01NPC:
	lea	DialogTextFCBCheckoutStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene13Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day06Scene13Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene13Action02NPC:
	lea	DialogTextNPCFCBCheckoutStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene13Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 14 (SCENE_ID_FCBFIREARMS)
;-------------------------------------------------------------------------------
Day06Scene14Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene14Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day06Scene14Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene14Action01NPC:
	lea	DialogTextFCBFirearmsStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene14Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day06Scene14Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene14Action02NPC:
	lea	DialogTextNPCFCBFirearmsStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene14Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 15 (SCENE_ID_FCBFISHING)
;-------------------------------------------------------------------------------
Day06Scene15Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene15Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day06Scene15Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene15Action01NPC:
	lea	DialogTextFCBFishingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene15Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day06Scene15Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene15Action02NPC:
	lea	DialogTextNPCFCBFishingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene15Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 16 (SCENE_ID_FCBCAMPING)
;-------------------------------------------------------------------------------
Day06Scene16Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene16Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day06Scene16Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene16Action01NPC:
	lea	DialogTextFCBCampingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene16Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day06Scene16Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene16Action02NPC:
	lea	DialogTextNPCFCBCampingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene16Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
Day06Scene17Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day06Scene17Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day06Scene17Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene17Action01NPC:
	lea	DialogTextSouthCenterStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene17Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day06Scene17Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene17Action02NPC:
	lea	DialogTextNPCSouthCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene17Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; end day 06
;-------------------------------------------------------------------------------
Day06End:
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	lea MEM_NPC_LOCATIONS,a5	; point a5 to start of NPC location table
	move.l	#$03000000,(a5)	; update NPCs in scene 00
	move.w	#SCENE_ID_PARKINGLOT,d7	; copy parking lot scene ID to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by word size
	adda.l	d7,a5	; move a5 to the address for parking lot NPCs
	and.l	#$00000000,(a5)	; update NPCs in parking lot
	lea MEM_NPC_LOCATIONS,a5	; point a5 to start of NPC location table
	move.w	#SCENE_ID_EEHALL,d7	; copy east-east hall scene ID to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by word size
	adda.l	d7,a5	; move a5 to the address for east-east hall NPCs
	and.l	#$00000000,(a5)	; update NPCs in east-east hall
	lea MEM_NPC_LOCATIONS,a5	; point a5 to start of NPC location table
	move.w	#SCENE_ID_DENIMCOUNTRY,d7	; copy scene ID to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by word size
	adda.l	d7,a5	; move a5 to the address 
	move.l	#$05010000,(a5)	; update NPCs
	;---------------------------------------------------------------------------	
	; update the game state
	;---------------------------------------------------------------------------	
	bsr.w	ClearPlayerInventory	; clear player inventory
	move.w	#PLAYER_SPRITE_DB,(MEM_PLAYER_SPRITE)	; update sprite
	move.w	#$0007,(MEM_DAY)	; move to day 07
	move.l	(MEM_GAME_STATE),d7	; copy game state
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	bclr.l	#STATE_FLAG_EXPLORING,d7	; clear exploring flag
;	bclr.l	#STATE_FLAG_MALL_CLOSED,d7	; clear mall closed flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS)	; clear day event flags
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission event flags
	and.l	#$00000000,(MEM_SCENE_BGM)	; clear the background music reference
	;---------------------------------------------------------------------------	
	; set the intro screen counter
	;---------------------------------------------------------------------------	
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay07,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade-in
	;---------------------------------------------------------------------------	
	; set player sprite position
	;---------------------------------------------------------------------------	
	move.w	#SPRITE_PLAYER_INIT_X,(MEM_PLAYER_SPRITE_X)	; set player sprite x
	move.w	#SPRITE_PLAYER_INIT_Y,(MEM_PLAYER_SPRITE_Y)	; set player sprite y
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; set direction
	;---------------------------------------------------------------------------	
	; queue the scripted event that starts day 7
	;---------------------------------------------------------------------------	
;	lea ScriptedEventDay01Start,a6	; point a6 to event to load
;	bsr.w QueueScriptedEvent	; queue the event
	rts

