;-------------------------------------------------------------------------------
; day 05 - scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
Day05Scene00Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day05Scene00Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene00Action01NPC:
	; test event flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7	; test flag
	bne.s	Day05Scene00Action01NPCEventLeaving	; flag set, branch
	btst.l	#EVENT_FLAG_DAY05_EVENT_WEATHER,d7	; test flag
	bne.s	Day05Scene00Action01NPCEventWeather	; flag set, branch
Day05Scene00Action01NPCDefault:
	lea	DialogTextGreenbergDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene00Action01NPCEventLeaving:
	; response text
	lea	DialogTextGreenbergScene00Day05SnowedIn,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene00Action01NPCEventWeather:
	; update flags	
	bset.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update objective
	move.w	#OBJECTIVE_D5_O1,(MEM_OBJECTIVE)	; update objective
	; most NPCs have left the mall now
	move.l	#$00000000,(MEM_NPC_LOCATION_CENTER)
	move.l	#$11000000,(MEM_NPC_LOCATION_SHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_CHECKERS)
	move.l	#$00000000,(MEM_NPC_LOCATION_TLODGE)
	move.l	#$00000000,(MEM_NPC_LOCATION_SVIDEO)
	move.l	#$00000000,(MEM_NPC_LOCATION_WORKSHOP)
	move.l	#$00000000,(MEM_NPC_LOCATION_CPLANET)
	move.l	#$00000000,(MEM_NPC_LOCATION_CNOW)
	move.l	#$00000000,(MEM_NPC_LOCATION_TBOOKS)
	move.l	#$12000000,(MEM_NPC_LOCATION_FCBCHECKOUT)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBFISHING)
	move.l	#$00000000,(MEM_NPC_LOCATION_SOUTH_CENTER)
	; set mall closed flag	
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; response text
	lea	DialogTextGreenbergScene00Day05Storm,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene00Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day05Scene00Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene00Action02NPC:
	lea	DialogTextGreenbergDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
Day05Scene03Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day05Scene03Action01NPC	; branch to display text
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene03Action01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test player sprite
	bne.s	Day05Scene03Action01NPCDefault	; branch if not Dani
	; test if gift received
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	; copy global event flags to d7
	btst.l	#GLOBAL_FLAG_DANI_GIFT,d7	; test if flag is set
	bne.s	Day05Scene03Action01NPCDefault	; branch if set
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
Day05Scene03Action01NPCDefault:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	InfoDeskMenu,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene03Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day05Scene03Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene03Action02NPC:
	lea	DialogTextNPCCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene03Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day05Scene03Action03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day05Scene03Action03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day05Scene03Action03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextInfoDeskDay05R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene03Action03R0:
	lea	DialogTextInfoDeskDay05R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene03Action03R1:
	lea	DialogTextInfoDeskDay05R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene03Action03R2:
	lea	DialogTextInfoDeskDay05R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 04 (SCENE_ID_SHALL)
;-------------------------------------------------------------------------------
Day05Scene04Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day05Scene04Action01NPCFCBFishing	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day05Scene04Action01NPCDani	; branch to text for the NPC
Day05Scene04Action01Default:
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene04Action01NPCDani:
	lea	DialogTextScene04Day05NPC01SnowedIn,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene04Action01NPCFCBFishing:
	lea	DialogTextScene04Day05NPC11SnowedIn,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 05 (SCENE_ID_PARKINGLOT)
;-------------------------------------------------------------------------------
Day05Scene05Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_SCENE_DANICAR,d6	; test target
	beq.s	Day05Scene05DaniCarLookUse	; same action for look and use
	; default action	
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay05Scene05Action01:
	rts

Day05Scene05DaniCarLookUse:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDaniCarDayEnd,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day05Scene05Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day05Scene05Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.w	Day05End	; branch to day end
	; else exit
	lea	DialogTextDaniCarGameEndR0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 08 (SCENE_ID_DENIMCOUNTRY)
;-------------------------------------------------------------------------------
Day05Scene08Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day05Scene08Action01NPC	; branch to text for the NPC
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day05Scene08Action01NPCDani	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene08Action01NPC:
	lea	DialogTextDenimCountryStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene08Action01NPCDani:
	; test if during blizzard
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7	; test flag
	beq.s	Day05Scene08Action01NPCDaniDefault	; flag not set, branch
	; update event flags
	bset.l	#EVENT_FLAG_DAY05_EVENT_TALKDANI,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update NPCs
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$11010000,(MEM_NPC_LOCATION_SHALL)
	; queue scripted event
	lea ScriptedEventDay05GoodExcuseToLeave,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay05ScriptedEventGoodExcuse,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene08Action01NPCDaniDefault:
	; the day02 text works here too
	lea	DialogTextDenimCountryDaniDay02Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene08Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day05Scene08Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene08Action02NPC:
	lea	DialogTextNPCDenimCountryStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 09 (SCENE_ID_CHECKERS)
;-------------------------------------------------------------------------------
Day05Scene09Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day05Scene09Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene09Action01NPC:
	lea	DialogTextCheckersStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene09Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day05Scene09Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene09Action02NPC:
	lea	DialogTextNPCCheckersStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 0A (SCENE_ID_TLODGE)
;-------------------------------------------------------------------------------
Day05Scene0AAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day05Scene0AAction01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_SCENE_RADIO,d6	; test target
	beq.s	Day05Scene0AAction01Radio	; branch to text for the radio
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0AAction01NPC:
	lea	DialogTextTLodgeStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0AAction01Radio:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	bclr.l	#DIALOG_FLAG_STYLE_TITLED,d6	; clear the titled flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	RadioMenu,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0AAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day05Scene0AAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0AAction02NPC:
	lea	DialogTextNPCTLodgeStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0AAction03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day05Scene0AAction03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day05Scene0AAction03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day05Scene0AAction03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextRadioDay05R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0AAction03R0:
	; set event flag
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	bset.l	#EVENT_FLAG_DAY05_EVENT_WEATHER,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	lea	DialogTextRadioDay05R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0AAction03R1:
	lea	DialogTextRadioDay05R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0AAction03R2:
	lea	DialogTextRadioDay05R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 0B (SCENE_ID_CAVERN)
;-------------------------------------------------------------------------------
Day05Scene0BAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day05Scene0BAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0BAction01NPC:
	; test if during blizzard
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7	; test flag
	beq.s	Day05Scene0BAction01NPCDefault	; flag not set, branch
	; blizzard text	
	lea	DialogTextScene13Day05NPC08SnowedIn,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0BAction01NPCDefault:
	lea	DialogTextCavernStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0BAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day05Scene0BAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0BAction02NPC:
	lea	DialogTextNPCCavernStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 0C (SCENE_ID_SVIDEO)
;-------------------------------------------------------------------------------
Day05Scene0CAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day05Scene0CAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0CAction01NPC:
	lea	DialogTextSVideoStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0CAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day05Scene0CAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0CAction02NPC:
	lea	DialogTextNPCSVideoStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 0D (SCENE_ID_WORKSHOP)
;-------------------------------------------------------------------------------
Day05Scene0DAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day05Scene0DAction01NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day05Scene0DAction01NPC1	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0DAction01NPC0:
	lea	DialogTextWorkshopStaff0DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0DAction01NPC1:
	lea	DialogTextWorkshopStaff1DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0DAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day05Scene0DAction02NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day05Scene0DAction02NPC1	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0DAction02NPC0:
	lea	DialogTextNPCWorkshopStaff0DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0DAction02NPC1:
	lea	DialogTextNPCWorkshopStaff1DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 0E (SCENE_ID_NSHACK)
;-------------------------------------------------------------------------------
Day05Scene0EAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day05Scene0EAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0EAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	; test if during subquest
	btst.l	#EVENT_FLAG_DAY05_SUB_STARTED,d7	; test flag
	bne.s	Day05Scene0EAction01NPCSub	; flag set, branch
	; test if during blizzard
	btst.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7	; test flag
	beq.s	Day05Scene0EAction01NPCDefault	; flag not set, branch
Day05Scene0EAction01NPCBlizzard:
	; blizzard text	
	lea	DialogTextScene0EDay05NPC0ASnowedIn,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0EAction01NPCDefault:
	lea	DialogTextNShackStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0EAction01NPCSub:
	;---------------------------------------------------------------------------
	; three possible outcomes
	; MISSION_FLAG_DAY05_READBOOK = 0 -> DialogTextDay05SubDontKnow
	; MISSION_FLAG_DAY05_FOOD0GET = 0 -> 
	; DialogTextDay05ScriptedEventSub00D0+ScriptedEventDay05Sub00
	; MISSION_FLAG_DAY05_FOOD0GET = 1 -> DialogTextScene0EDay05NPCSub00
	;---------------------------------------------------------------------------
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#MISSION_FLAG_DAY05_READBOOK,d7	; test flag
	bne.s .1	; branch if set
	lea	DialogTextDay05SubDontKnow,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.1	; MISSION_FLAG_DAY05_READBOOK = 1
	btst.l	#MISSION_FLAG_DAY05_FOOD0GET,d7	; test flag
	bne.s .2	; branch if set
	; update flags
	bset.l	#MISSION_FLAG_DAY05_FOOD0GET,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; add item to inventory
	move.w	#OBJ_ITEM_MIXEDNUTS,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; queue scripted event
	lea ScriptedEventDay05Sub00,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay05ScriptedEventSub00D0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.2	; MISSION_FLAG_DAY05_FOOD0GET = 1
	lea	DialogTextScene0EDay05NPCSub00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0EAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day05Scene0EAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0EAction02NPC:
	lea	DialogTextNPCNShackStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 0F (SCENE_ID_POGODAWG)
;-------------------------------------------------------------------------------
Day05Scene0FAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day05Scene0FAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0FAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	; test if during subquest
	btst.l	#EVENT_FLAG_DAY05_SUB_STARTED,d7	; test flag
	bne.s	Day05Scene0FAction01NPCSub	; flag set, branch
	; test if during blizzard
	btst.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7	; test flag
	beq.s	Day05Scene0FAction01NPCDefault	; flag not set, branch
Day05Scene0FAction01NPCBlizzard:
	; blizzard text	
	lea	DialogTextScene0FDay05NPC0BSnowedIn,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0FAction01NPCDefault:
	lea	DialogTextPogoDawgStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0FAction01NPCSub:
	;---------------------------------------------------------------------------
	; three possible outcomes
	; MISSION_FLAG_DAY05_READBOOK = 0 -> DialogTextDay05SubDontKnow
	; MISSION_FLAG_DAY05_FOOD1GET = 0 -> 
	; DialogTextDay05ScriptedEventSub01D0+ScriptedEventDay05Sub01
	; MISSION_FLAG_DAY05_FOOD0GET = 1 -> DialogTextPogoDawgStaffDefaultTalk
	;---------------------------------------------------------------------------
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#MISSION_FLAG_DAY05_READBOOK,d7	; test flag
	bne.s .1	; branch if set
	lea	DialogTextDay05SubDontKnow,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.1	; MISSION_FLAG_DAY05_READBOOK = 1
	btst.l	#MISSION_FLAG_DAY05_FOOD1GET,d7	; test flag
	bne.s .2	; branch if set
	; update flags
	bset.l	#MISSION_FLAG_DAY05_FOOD1GET,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; add item to inventory
	move.w	#OBJ_ITEM_RELISH,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; queue scripted event
	lea ScriptedEventDay05Sub01,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay05ScriptedEventSub01D0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.2	; MISSION_FLAG_DAY05_FOOD1GET = 1
	lea	DialogTextPogoDawgStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0FAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day05Scene0FAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene0FAction02NPC:
	lea	DialogTextNPCPogoDawgStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 10 (SCENE_ID_CPLANET)
;-------------------------------------------------------------------------------
Day05Scene10Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day05Scene10Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene10Action01NPC:
	lea	DialogTextCPlanetStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene10Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day05Scene10Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene10Action02NPC:
	lea	DialogTextNPCCPlanetStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 11 (SCENE_ID_CNOW)
;-------------------------------------------------------------------------------
Day05Scene11Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day05Scene11Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene11Action01NPC:
	lea	DialogTextCNowStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene11Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day05Scene11Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene11Action02NPC:
	lea	DialogTextNPCCNowStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 12 (SCENE_ID_TBOOKS)
;-------------------------------------------------------------------------------
Day05Scene12Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day05Scene12Action01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_SCENE_BOOKS_COOKING,d6	; test target
	bne.s	Day05Scene12Action01Default	; branch to default text
	; looking at the cookbooks - test event flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_SUB_STARTED,d7	; test if subquest started
	beq.s	Day05Scene12Action01Default	; flag not set, branch to default
	; update flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy flags to d7
	bset.l	#MISSION_FLAG_DAY05_READBOOK,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; text
	lea	DialogTextDay05Scene12UseBookshelf,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene12Action01Default:
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene12Action01NPC:
	lea	DialogTextTBooksStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene12Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day05Scene12Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene12Action02NPC:
	lea	DialogTextNPCTBooksStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 13 (SCENE_ID_FCBCHECKOUT)
;-------------------------------------------------------------------------------
Day05Scene13Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day05Scene13Action01NPC	; branch to text for the NPC
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day05Scene13Action01NPCCamping	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene13Action01NPC:
	lea	DialogTextFCBCheckoutStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene13Action01NPCCamping:
	; test game state
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY05_CAMP_COMPLETE,d7	; test flag
	bne.s	Day05Scene13Action01NPCAfterCamp	; branch if set
	btst.l	#EVENT_FLAG_DAY05_SUB_STARTED,d7	; test flag
	beq.s	Day05Scene13Action01NPCSub	; branch if set
	; default text
	lea	DialogTextScene13Day05NPC12SnowedIn,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene13Action01NPCAfterCamp:
	lea	DialogTextDay05Scene13NPCAfterCamp,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene13Action01NPCSub:
	lea	DialogTextDay05ScriptedEventStartSub09,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene13Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day05Scene13Action02NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day05Scene13Action02NPCCamping	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene13Action02NPC:
	lea	DialogTextNPCFCBCheckoutStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene13Action02NPCCamping:
	; test game state
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_SUB_COMPLETE,d7	; test if sub complete
	bne.s	Day05Scene13Action02NPCCampingDefault	; flag set, branch
	cmpi.w	#OBJ_ITEM_RELISH,(MEM_ACTIVE_ITEM)	; test item
	beq.s	Day05Scene13Action02NPCCampingExpectedItem	; branch if item
	cmpi.w	#OBJ_ITEM_MIXEDNUTS,(MEM_ACTIVE_ITEM)	; test item
	beq.s	Day05Scene13Action02NPCCampingExpectedItem	; branch if item
	; neither expected item - use default text
Day05Scene13Action02NPCCampingDefault:
	lea	DialogTextNPCFCBCampingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene13Action02NPCCampingExpectedItem:
	bsr.w	RemoveActiveItem	; remove the active item
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#MISSION_FLAG_DAY05_FOOD0GIVE,d7	; test flag
	bne.s	Day05Scene13Action02NPCCampingGive1	; branch if set
Day05Scene13Action02NPCCampingGive0:
	; update game state - d7 should have MEM_MISSION_EVENT_FLAGS here
	bset.l	#MISSION_FLAG_DAY05_FOOD0GIVE,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; show text
	lea	DialogTextDay05Scene13Give0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene13Action02NPCCampingGive1:	; transition to camp scene
	; update game state - d7 should have MEM_MISSION_EVENT_FLAGS here
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags to d7
	bset.l	#MISSION_FLAG_DAY05_FOOD1GIVE,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	bset.l	#EVENT_FLAG_DAY05_SUB_COMPLETE,d7	; set flag
	bset.l	#EVENT_FLAG_DAY05_CAMP_STARTED,d7	; set flag
	;---------------------------------------------------------------------------	
	; setting both flags here because in the future 
	; there might be an interactive part of the camp scene 
	;---------------------------------------------------------------------------	
	bset.l	#EVENT_FLAG_DAY05_CAMP_COMPLETE,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	;---------------------------------------------------------------------------	
	; update NPCs - some are in multiple places to handle scene transitions
	;---------------------------------------------------------------------------	
	move.l	#$16120A1C,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$12160000,(MEM_NPC_LOCATION_FCBCHECKOUT)
	move.l	#$12180000,(MEM_NPC_LOCATION_WORKSHOP)
	; queue scripted event
	lea ScriptedEventDay05Camp,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	; show initial text
	lea	DialogTextDay05ScriptedEventCamp00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 14 (SCENE_ID_FCBFIREARMS)
;-------------------------------------------------------------------------------
Day05Scene14Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day05Scene14Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene14Action01NPC:
	; test if during blizzard
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_CAMP_COMPLETE,d7	; test flag
	bne.s	Day05Scene14Action01NPCAfterCamp	; flag set, branch
	btst.l	#EVENT_FLAG_DAY05_EVENT_LEAVING,d7	; test flag
	bne.s	Day05Scene14Action01NPCBlizzard	; flag set, branch
	bra.s	Day05Scene14Action01NPCDefault	; use default text
Day05Scene14Action01NPCAfterCamp:
	lea	DialogTextDay05Scene14NPCAfterCamp,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene14Action01NPCBlizzard:
	lea	DialogTextScene14Day05NPC10SnowedIn,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene14Action01NPCDefault:
	lea	DialogTextFCBFirearmsStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene14Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day05Scene14Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene14Action02NPC:
	lea	DialogTextNPCFCBFirearmsStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 15 (SCENE_ID_FCBFISHING)
;-------------------------------------------------------------------------------
Day05Scene15Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day05Scene15Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene15Action01NPC:
	lea	DialogTextFCBFishingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene15Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day05Scene15Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene15Action02NPC:
	lea	DialogTextNPCFCBFishingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 16 (SCENE_ID_FCBCAMPING)
;-------------------------------------------------------------------------------
Day05Scene16Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day05Scene16Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene16Action01NPC:
	lea	DialogTextFCBCampingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene16Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day05Scene16Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene16Action02NPC:
	lea	DialogTextNPCFCBCampingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 05 - scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
Day05Scene17Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day05Scene17Action01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_SCENE_KIOSK,d6	; test target
	bne.s	Day05Scene17Action01Default	; branch to default
	; test if in subquest
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY05_SUB_STARTED,d7	; test flag
	beq.s	Day05Scene17Action01Default	; flag not set, branch
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#MISSION_FLAG_DAY05_READBOOK,d7	; test flag
	beq.s	.1	; flag not set, branch
	; text
	lea	DialogTextDay05SubNoChance,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.1	; MISSION_FLAG_DAY05_READBOOK=0
	; text
	lea	DialogTextDay05SubDontKnow,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene17Action01Default:
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene17Action01NPC:
	lea	DialogTextSouthCenterStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene17Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day05Scene17Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day05Scene17Action02NPC:
	lea	DialogTextNPCSouthCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; end day 05
;-------------------------------------------------------------------------------
Day05End:
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocations ; most NPC locations were changed during this day
	move.l	#$03000000,(MEM_NPC_LOCATION_VB)
	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$0A121600,(MEM_NPC_LOCATION_NSHACK)
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
	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; update sprite
	move.w	#$0006,(MEM_DAY)	; move to day 06
	move.w	#OBJECTIVE_D6_O0,(MEM_OBJECTIVE)	; update objective
	move.l	(MEM_GAME_STATE),d7	; copy game state
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	bclr.l	#STATE_FLAG_EXPLORING,d7	; clear exploring flag
	bclr.l	#STATE_FLAG_MALL_CLOSED,d7	; clear mall closed flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS)	; clear day event flags
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission event flags
	and.l	#$00000000,(MEM_SCENE_BGM)	; clear the background music reference
	;---------------------------------------------------------------------------	
	; set the intro screen counter
	;---------------------------------------------------------------------------	
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay06,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade-in
	;---------------------------------------------------------------------------	
	; set player sprite position
	;---------------------------------------------------------------------------	
	move.w	#SPRITE_PLAYER_INIT_X,(MEM_PLAYER_SPRITE_X)	; set player sprite x
	move.w	#SPRITE_PLAYER_INIT_Y,(MEM_PLAYER_SPRITE_Y)	; set player sprite y
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; set direction
	;---------------------------------------------------------------------------	
	; queue the scripted event that starts day 6
	;---------------------------------------------------------------------------	
	lea ScriptedEventDay06Start,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts

