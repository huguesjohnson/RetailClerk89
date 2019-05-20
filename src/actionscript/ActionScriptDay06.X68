;-------------------------------------------------------------------------------
; day 06 - scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 01 (SCENE_ID_WWHALL)
;-------------------------------------------------------------------------------
Day06Scene01Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day06Scene01Action03StartMission	; branch to day end
	; else show message
	lea	DialogTextDay06EnterVBLater,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene01Action03StartMission:
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog
	; update game state
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	bset.l	#EVENT_FLAG_DAY06_MISSION_STARTED,d7	; set mission started
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated event flags
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; add keys
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_WORKSHOP,d7	; add the key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save updated keys
	; update NPCs
	lea MEM_NPC_LOCATIONS,a0
	move.l	#$16120000,(a0)+	; location 00 (VB)
	move.l	#$00000000,(a0)+	; location 01 (WWHALL)
	move.l	#$00000000,(a0)+	; location 02 (WEHALL)
	move.l	#$2101081D,(a0)+	; location 03 (CENTER)
	move.l	#$00000000,(a0)+	; location 04 (SHALL)
	move.l	#$00000000,(a0)+	; location 05 (PARKINGLOT)
	move.l	#$00000000,(a0)+	; location 06 (EWHALL)
	move.l	#$00000000,(a0)+	; location 07 (EEHALL)
	move.l	#$00000000,(a0)+	; location 08 (DENIMCOUNTRY)
	move.l	#$00000000,(a0)+	; location 09 (CHECKERS)
	move.l	#$00000000,(a0)+	; location 0A (TLODGE)
	move.l	#$00000000,(a0)+	; location 0B (CAVERN)
	move.l	#$00000000,(a0)+	; location 0C (SVIDEO)
	move.l	#$00000000,(a0)+	; location 0D (WORKSHOP)
	move.l	#$0A000000,(a0)+	; location 0E (NSHACK)
	move.l	#$00000000,(a0)+	; location 0F (POGODAWG)
	move.l	#$00000000,(a0)+	; location 10 (CPLANET)
	move.l	#$00000000,(a0)+	; location 11 (CNOW)
	move.l	#$00000000,(a0)+	; location 12 (TBOOKS)
	move.l	#$00000000,(a0)+	; location 13 (FCBCHECKOUT)
	move.l	#$00000000,(a0)+	; location 14 (FCBFIREARMS)
	move.l	#$00000000,(a0)+	; location 15 (FCBFISHING)
	move.l	#$00000000,(a0)+	; location 16 (FCBCAMPING)
	move.l	#$00000000,(a0)+	; location 17 (SOUTH_CENTER)
	; clear mission flags
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)
	; update objective
	move.w	#OBJECTIVE_D6_O2,(MEM_OBJECTIVE)	; update objective
	; queue the scripted event
	lea ScriptedEventDay06StartMission,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
Day06Scene03Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day06Scene03Action01NPC	; branch to display text
	cmpi.w	#OBJ_NPC_SLEEPING_GUARD,d6	; test target
	beq.s	Day06Scene03Action01SleepingGuard	; branch to display text
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day06Scene03Action01Dani	; branch to display text
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action01SleepingGuard:
	lea	DialogTextDay06SleepingGuardTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action01Dani:
	lea	DialogTextDay06Scene03Dani,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test player sprite
	bne.s	Day06Scene03Action01NPCDefault	; branch if not Dani
	; test if gift received
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	; copy global event flags to d7
	btst.l	#GLOBAL_FLAG_DANI_GIFT,d7	; test if flag is set
	bne.s	Day06Scene03Action01NPCDefault	; branch if set
	; update game state
	bset.l	#GLOBAL_FLAG_DANI_GIFT,d7	; set flag
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)	; save updated flags
	; add item to inventory
	move.w	#OBJ_ITEM_STRANGE_GIFT,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; text
	lea	DialogTextInfoDeskStrangeGift,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action01NPCDefault:
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
	lea	DialogTextInfoDeskDay06R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action03R0:
	lea	DialogTextInfoDeskDay06R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action03R1:
	lea	DialogTextInfoDeskDay06R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene03Action03R2:
	lea	DialogTextInfoDeskDay06R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 08 (SCENE_ID_DENIMCOUNTRY)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 09 (SCENE_ID_CHECKERS)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 0A (SCENE_ID_TLODGE)
;-------------------------------------------------------------------------------
Day06Scene0AAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day06Scene0AAction01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_SCENE_RADIO,d6	; test target
	beq.s	Day06Scene0AAction01Radio	; branch to text for the radio
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0AAction01NPC:
	lea	DialogTextTLodgeStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0AAction01Radio:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	bclr.l	#DIALOG_FLAG_STYLE_TITLED,d6	; clear the titled flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	RadioMenu,a6	; load text
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
	bsr.w	ResetDialog	; reset the dialog
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_STARTED,d7	; test mission started
	bne.s	Day06Scene0AAction03Night	; mission started, branch
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0AAction03Night:
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	.1	; branch to next text
	bclr.l	#MISSION_FLAG_DAY06_RADIO,d7	; clear flag
	lea	DialogTextRadioDay06NightR0,a6	; response text
	bra.s	Day06Scene0AAction03Exit
.1
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	bne.s	.2	; branch to next text
	bclr.l	#MISSION_FLAG_DAY06_RADIO,d7	; clear flag
	lea	DialogTextRadioDay06NightR1,a6	; response text
	bra.s	Day06Scene0AAction03Exit
.2
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	bne.s	.3	; branch to next text
	bclr.l	#MISSION_FLAG_DAY06_RADIO,d7	; clear flag
	lea	DialogTextRadioDay06NightR2,a6	; response text
	bra.s	Day06Scene0AAction03Exit
.3
	; must be response 3 then
	bset.l	#MISSION_FLAG_DAY06_RADIO,d7	; set flag
	lea	DialogTextRadioDay06NightR3,a6	; response text
Day06Scene0AAction03Exit:
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	rts

;-------------------------------------------------------------------------------
; day 06 - scene 0B (SCENE_ID_CAVERN)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 0C (SCENE_ID_SVIDEO)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 0D (SCENE_ID_WORKSHOP)
;-------------------------------------------------------------------------------
Day06Scene0DAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day06Scene0DAction01NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day06Scene0DAction01NPC1	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day06Scene0DAction01NPCDani	; branch to text for the NPC
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
Day06Scene0DAction01NPCDani:
	lea	DialogTextDay06Scene0DNPCDani,a6	; load text
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

;-------------------------------------------------------------------------------
; day 06 - scene 0E (SCENE_ID_NSHACK)
;-------------------------------------------------------------------------------
Day06Scene0EAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day06Scene0EAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0EAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_MISSION_COMPLETE,d7	; test flag
	beq.s	.1	; not set, branch to next test
	lea	DialogTextDay06Scene0ENPCEnding,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.1
	btst.l	#EVENT_FLAG_DAY06_MISSION_STARTED,d7	; test flag
	beq.s	Day06Scene0EAction01NPCDefault	; not set, branch
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#MISSION_FLAG_DAY06_SCRIPTEDEVENT0,d7	; test flag
	bne.s	.2	; set, branch
	bset.l	#MISSION_FLAG_DAY06_SCRIPTEDEVENT0,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; setup scripted event
	lea ScriptedEventDay06NShackTalkNPC,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay06InMissionScriptedEvent0000,a6	; load initial text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.2
	lea	DialogTextDay06Scene0ENPCInMission,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene0EAction01NPCDefault:
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

;-------------------------------------------------------------------------------
; day 06 - scene 0F (SCENE_ID_POGODAWG)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 10 (SCENE_ID_CPLANET)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 11 (SCENE_ID_CNOW)
;-------------------------------------------------------------------------------
Day06Scene11Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day06Scene11Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene11Action01NPC:
	;---------------------------------------------------------------------------
	; Possible flows here..
	; 1) EVENT_FLAG_DAY06_SUB00_COMPLETE = 1 -> text about working
	; 2) EVENT_FLAG_DAY06_EVENT_PLAN = 0 -> Default NPC text
	; 3) EVENT_FLAG_DAY06_EVENT_PLAN = 1 and
	;    EVENT_FLAG_DAY06_SUB00_STARTED = 0 -> scripted event to start sub 
	; 4) EVENT_FLAG_DAY06_SUB00_STARTED = 1 and
	;    MISSION_FLAG_DAY06_SUB00_GETITEM = 0 -> message about needing item
	; 5) EVENT_FLAG_DAY06_SUB00_STARTED = 1 and
	;    MISSION_FLAG_DAY06_SUB00_GETITEM = 1 -> dialog and set complete flag
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_SUB00_COMPLETE,d7	; test if sub complete
	bne.s	Day06Scene11Action01NPCSubComplete	; flag is set, branch
	btst.l	#EVENT_FLAG_DAY06_EVENT_PLAN,d7	; test if planning scene has run
	beq.w	Day06Scene11Action01NPCDefault	; flag not set, branch
	; at this point EVENT_FLAG_DAY06_EVENT_PLAN must be set
	btst.l	#EVENT_FLAG_DAY06_SUB00_STARTED,d7	; test if sub started
	beq.s	Day06Scene11Action01NPCStartSub	; flag not set, branch
	; test mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d6	; copy mission flags to d6
	btst.l	#MISSION_FLAG_DAY06_SUB00_GETITEM,d6	; test if sub complete
	beq.s	Day06Scene11Action01NPCSubInprogress	; flag not set, branch
	; if we reach here then it's the end of the mission
	bset.l	#EVENT_FLAG_DAY06_SUB00_COMPLETE,d7	; set sub complete
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	andi.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission flags
	; add key
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_CNOW,d7	; add the key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save updated keys
	; queue scripted event
	lea ScriptedEventDay06StartSub00Complete,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay06Sub00Complete00,a6	; load initial text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene11Action01NPCSubComplete:
	lea	DialogTextDay06Scene11SubComplete,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene11Action01NPCStartSub:
	bset.l	#EVENT_FLAG_DAY06_SUB00_STARTED,d7	; set sub started flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	move.w	#OBJECTIVE_D6_O1,(MEM_OBJECTIVE)	; update objective
	; queue scripted event
	lea ScriptedEventDay06StartSub00,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay06Sub00Start00,a6	; load initial text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene11Action01NPCSubInprogress:
	lea	DialogTextDay06Scene11SubInprogress,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene11Action01NPCDefault:
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

;-------------------------------------------------------------------------------
; day 06 - scene 12 (SCENE_ID_TBOOKS)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 13 (SCENE_ID_FCBCHECKOUT)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 14 (SCENE_ID_FCBFIREARMS)
;-------------------------------------------------------------------------------
Day06Scene14Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day06Scene14Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene14Action01NPC:
	; test event flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY06_SUB00_STARTED,d7	; test if sub is started
	beq.s	Day06Scene14Action01NPCDefault	; not started, use default text
	btst.l	#EVENT_FLAG_DAY06_SUB00_COMPLETE,d7	; test if sub is complete
	bne.s	Day06Scene14Action01NPCDefault	; complete, use default text
	; test mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#MISSION_FLAG_DAY06_SUB00_GETITEM,d7	; test if event is complete
	bne.s	Day06Scene14Action01NPCDefault	; complete, use default text
	;---------------------------------------------------------------------------
	; get item event
	;---------------------------------------------------------------------------
	bset.l	#MISSION_FLAG_DAY06_SUB00_GETITEM,d7	; set event complete
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; add item
	move.w	#OBJ_ITEM_CAFFEINE_PILLS,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; queue scripted event
	lea ScriptedEventDay06StartSub00GetItem,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay06Sub00GetItem00,a6	; load initial text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day06Scene14Action01NPCDefault:
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

;-------------------------------------------------------------------------------
; day 06 - scene 15 (SCENE_ID_FCBFISHING)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 16 (SCENE_ID_FCBCAMPING)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; day 06 - scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
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

;-------------------------------------------------------------------------------
; end day 06
;-------------------------------------------------------------------------------
Day06End:
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocations	; put everything back to the initial state
	move.l	#$031B0200,(MEM_NPC_LOCATION_VB)	; update VB
	move.l	#$00000000,(MEM_NPC_LOCATION_EWHALL)	; clear hallway
	move.l	#$00000000,(MEM_NPC_LOCATION_CAVERN)	; clear cavern
	move.l	#$05010000,(MEM_NPC_LOCATION_DENIMCOUNTRY)	; update dcountry
	;---------------------------------------------------------------------------	
	; update the game state
	;---------------------------------------------------------------------------	
	bsr.w	ClearPlayerInventory	; clear player inventory
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	; copy global event flags to d7
	btst.l	#GLOBAL_FLAG_DANI_GIFT,d7	; test if flag is set
	beq.s	.1	; branch if not set
	; add item to inventory
	move.w	#OBJ_ITEM_STRANGE_GIFT,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
.1
	move.w	#PLAYER_SPRITE_DB,(MEM_PLAYER_SPRITE)	; update sprite
	move.w	#$0007,(MEM_DAY)	; move to day 07
	move.w	#OBJECTIVE_D7_O0,(MEM_OBJECTIVE)	; update objective
	move.l	(MEM_GAME_STATE),d7	; copy game state
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	bclr.l	#STATE_FLAG_EXPLORING,d7	; clear exploring flag
	bclr.l	#STATE_FLAG_MALL_CLOSED,d7	; clear mall closed flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS)	; clear day event flags
	; test if the multi-day pogo dawg quest is complete
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#GLOBAL_FLAG_PDAWG_CUSTOMER0,d7	; test customer0
	beq.s	.2	; if any customer is missing, branch
	btst.l	#GLOBAL_FLAG_PDAWG_CUSTOMER1,d7	; test customer1
	beq.s	.2	; if any customer is missing, branch
	btst.l	#GLOBAL_FLAG_PDAWG_CUSTOMER2,d7	; test customer2
	beq.s	.2	; if any customer is missing, branch
	btst.l	#GLOBAL_FLAG_PDAWG_CUSTOMER3,d7	; test customer3
	beq.s	.2	; if any customer is missing, branch
	; all customer flags set = store open
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	bset.l	#EVENT_FLAG_DAY07_POGODAWG_OPEN,d7	; set the flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
.2
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission event flags
	and.l	#$00000000,(MEM_SCENE_BGM)	; clear the background music reference
	;---------------------------------------------------------------------------	
	; set the intro screen counter
	;---------------------------------------------------------------------------	
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay07,a6	; address of the scene for the title screen
	jsr	LoadScene	; branch to LoadScene subroutine
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

