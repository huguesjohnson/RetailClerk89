;-------------------------------------------------------------------------------
; day 07 - scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
Day07Scene00Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day07Scene00Action01NPCGreenberg	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_BILLY,d6	; test target
	beq.s	Day07Scene00Action01NPCBilly	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	beq.s	Day07Scene00Action01NPCShopper	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene00Action01NPCShopper:
	lea	DialogTextScene00Day07NPC01,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene00Action01NPCBilly:
	lea	DialogTextScene00Day07NPC00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene00Action01NPCGreenberg:
	cmpi.w	#PLAYER_SPRITE_DB,(MEM_PLAYER_SPRITE)	; test player sprite
	beq.s	.1	; branch if DB
	; otherwise use default text
	lea	DialogTextGreenbergDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.1
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY07_LEAVE_VB,d7	; test if flag is set
	bne.s .2
	bset.l	#EVENT_FLAG_DAY07_LEAVE_VB,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	lea	DialogTextScene00Day07NPCGreenberg00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.2
	lea	DialogTextScene00Day07NPCGreenberg01,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene00Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day07Scene00Action02NPCGreenberg	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_BILLY,d6	; test target
	beq.s	Day07Scene00Action02NPCBilly	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	beq.s	Day07Scene00Action02NPCShopper	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene00Action02NPCGreenberg:
	lea	DialogTextGreenbergDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene00Action02NPCBilly:
	lea	DialogTextNPCBillyDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene00Action02NPCShopper:
	lea	DialogTextNPCGenericShopperDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
Day07Scene03Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_CENTER_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene03Action01NPC	; branch to display text
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene03Action01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test player sprite
	bne.s	Day07Scene03Action01NPCDefault	; branch if not Dani
	; test if gift received
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	; copy global event flags to d7
	btst.l	#GLOBAL_FLAG_DANI_GIFT,d7	; test if flag is set
	bne.s	Day07Scene03Action01NPCDefault	; branch if set
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
Day07Scene03Action01NPCDefault:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	InfoDeskMenu,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene03Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_CENTER_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene03Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene03Action02NPC:
	cmpi.w	#OBJ_ITEM_LUNCH_DELIVERY,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene03Action02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	; add key
	move.l	(MEM_PLAYER_STORE_KEYS),d7
	bset.l	#STORE_KEY_CAVERN,d7
	move.l	d7,(MEM_PLAYER_STORE_KEYS)
	; show response text
	lea	DialogTextDay07TQCenter,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene03Action02NPCDefault:
	lea	DialogTextNPCCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene03Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day07Scene03Action03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day07Scene03Action03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day07Scene03Action03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextInfoDeskDay07R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene03Action03R0:
	lea	DialogTextInfoDeskDay07R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene03Action03R1:
	lea	DialogTextInfoDeskDay07R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene03Action03R2:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY07_POGODAWG_OPEN,d7	; set the flag
	beq.s	Day07Scene03Action03R2Bad	; branch if not set
Day07Scene03Action03R2Good:
	lea	DialogTextInfoDeskDay07R2Good,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene03Action03R2Bad:
	lea	DialogTextInfoDeskDay07R2Bad,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 06 (SCENE_ID_EWHALL)
;-------------------------------------------------------------------------------
Day07Scene06Action03:	; ACTION_RESPOND
	tst.w	(MEM_MENU_RESPONSE)
	bne.s	Day07Scene06Action03Later
	; else transition
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog
	; queue the scripted event
	lea ScriptedEventDay07ChangePC,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts
Day07Scene06Action03Later:
	lea	DialogTextDay07EnterDCountryLater,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 08 (SCENE_ID_DENIMCOUNTRY)
;-------------------------------------------------------------------------------
Day07Scene08Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6 ; test target
	beq.s	Day07Scene08Action01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	bne.s	Day07Scene08Action01Default	; branch to default
	; update event flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	bset.l	#EVENT_FLAG_DAY07_EVENT0,d7 	; set event flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update NPCs
	move.l	#$0A010000,(MEM_NPC_LOCATION_NSHACK)
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	; queue scripted event
	lea ScriptedEventDay07Event0,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	; show initial text
	lea	DialogTextScene08Day07ScriptedEvent00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene08Action01Default:
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene08Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY07_EVENT0,d7 	; did this event run?
	beq.s	Day07Scene08Action01NPCDefault	; branch if not
	lea	DialogTextScene08Day07DenimCountryStaffTalkEvent0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene08Action01NPCDefault:
	lea	DialogTextScene08Day07DenimCountryStaffTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene08Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6; test target
	beq.s	Day07Scene08Action02NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DANI,d6; test target
	beq.s	Day07Scene08Action02Dani	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene08Action02NPC:
	lea	DialogTextNPCDenimCountryStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene08Action02Dani:
	lea	DialogTextDaniDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 09 (SCENE_ID_CHECKERS)
;-------------------------------------------------------------------------------
Day07Scene09Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene09Action01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene09Action01NPC:
	lea	DialogTextCheckersStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene09Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene09Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene09Action02NPC:
	cmpi.w	#OBJ_ITEM_WOOD_COMB,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene09Action02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_JACKET,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQCheckers,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene09Action02NPCDefault:
	lea	DialogTextNPCCheckersStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 0A (SCENE_ID_TLODGE)
;-------------------------------------------------------------------------------
Day07Scene0AAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF_ALT,d6	; test target
	beq.s	Day07Scene0AAction01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_SCENE_RADIO,d6	; test target
	beq.s	Day07Scene0AAction01Radio	; branch to text for the radio
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene0AAction01Radio:
	bsr.w	DefaultRadioUse
	rts
Day07Scene0AAction01NPC:
	lea	DialogTextTLodgeStaffDefaultTalkAlt,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0AAction02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_TLODGE_STAFF_ALT,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0AAction02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene0AAction02NPC:
	cmpi.w	#OBJ_ITEM_MOTIVATIONAL_BOOKS,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene0AAction02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_CALCULATOR,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQTLodge,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0AAction02NPCDefault:
	lea	DialogTextNPCTLodgeStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0AAction03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day07Scene0AAction03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day07Scene0AAction03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day07Scene0AAction03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextRadioDay07R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0AAction03R0:
	lea	DialogTextRadioDay07R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0AAction03R1:
	lea	DialogTextRadioDay07R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0AAction03R2:
	lea	DialogTextRadioDay07R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 0B (SCENE_ID_CAVERN)
;-------------------------------------------------------------------------------
Day07Scene0BAction01:	; ACTION_USE_TALK
	lea	DialogTextDay07CavernUse,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 0C (SCENE_ID_SVIDEO)
;-------------------------------------------------------------------------------
Day07Scene0CAction01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0CAction01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene0CAction01NPC:
	lea	DialogTextSVideoStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0CAction02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0CAction02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene0CAction02NPC:
	cmpi.w	#OBJ_ITEM_CALCULATOR,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene0CAction02NPCDefault	; branch if not calculator
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_BETA_TAPES,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQSVideo,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0CAction02NPCDefault:
	lea	DialogTextNPCSVideoStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 0D (SCENE_ID_WORKSHOP)
;-------------------------------------------------------------------------------
Day07Scene0DAction01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0DAction01NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0DAction01NPC1	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene0DAction01NPC0:
	lea	DialogTextWorkshopStaff0DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0DAction01NPC1:
	lea	DialogTextWorkshopStaff1DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0DAction02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0DAction02NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0DAction02NPC1	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene0DAction02NPC0:
	lea	DialogTextNPCWorkshopStaff0DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0DAction02NPC1:
	lea	DialogTextNPCWorkshopStaff1DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 0E (SCENE_ID_NSHACK)
;-------------------------------------------------------------------------------
Day07Scene0EAction01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0EAction01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DANI,(MEM_ACTION_TARGET_OBJID)	; test target
	bne.s	Day07Scene0EAction01NPC	; use default text
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY07_GOOD_ENDING,d7	; test if good ending available
	beq.s	.1	; not available, branch
	lea	DialogTextScene0EDay07BetterPlan,a6	; load text
	bra.s	.2
.1
	lea	DialogTextScene0EDay07MoreTime,a6	; load text
.2
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0EAction01Default:
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene0EAction01NPC:
	lea	DialogTextScene0EDay07NShackStaffTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0EAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day07Scene0EAction02NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day07Scene0EAction02Dani	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene0EAction02NPC:
	lea	DialogTextNPCNShackStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0EAction02Dani:
	lea	DialogTextDaniDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0EAction03:	; ACTION_RESPOND
	; clear 2 choice style
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bclr.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day07Scene0EAction03BadEnding	; branch to bad ending
	; response must be $0001 - test game state
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY07_GOOD_ENDING,d7	; test flag
	bne.s	Day07Scene0EAction03GoodEnding	; branch to good ending
	; else display message
	lea	DialogTextScene0EDay07Respond1MoreTime,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0EAction03BadEnding:
	; queue scripted event
	lea ScriptedEventBadEnding,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	; initial text
	lea	DialogTextScene0EDay07Respond0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0EAction03GoodEnding:
	; update NPCs
	move.l	#$160E0A04,(MEM_NPC_LOCATION_CAVERN)
	; queue scripted event	
	lea ScriptedEventGoodEnding,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	; initial text
	lea	DialogTextScene0EDay07RespondGood,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 0F (SCENE_ID_POGODAWG)
;-------------------------------------------------------------------------------
Day07Scene0FAction01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0FAction01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene0FAction01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test player sprite
	bne.s	Day07Scene0FAction01NPCDefault	; branch if not Dani
	; test if scripted event has already run
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY07_POGODAWG_KEY,d7	; test flag
	bne.s	Day07Scene0FAction01NPCDefault	; branch if set
	bset.l	#EVENT_FLAG_DAY07_POGODAWG_KEY,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; add key
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_POGODAWG,d7	; set key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save updated flags
	; queue scripted event
	lea ScriptedEventDay07ScriptedEventGetPDawgKey,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	; show initial text
	lea	DialogTextDay07Scene0FGetKey0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0FAction01NPCDefault:
	lea	DialogTextPogoDawgStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0FAction02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene0FAction02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene0FAction02NPC:
	cmpi.w	#OBJ_ITEM_RANCID_MEAT,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene0FAction02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_LUNCH_DELIVERY,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQPDawg,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene0FAction02NPCDefault:
	lea	DialogTextNPCPogoDawgStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 10 (SCENE_ID_CPLANET)
;-------------------------------------------------------------------------------
Day07Scene10Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene10Action01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene10Action01NPC:
	lea	DialogTextCPlanetStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene10Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene10Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene10Action02NPC:
	cmpi.w	#OBJ_ITEM_JACKET,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene10Action02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_NOSE_HOOPS,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQCPlanet,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene10Action02NPCDefault:
	lea	DialogTextNPCCPlanetStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 11 (SCENE_ID_CNOW)
;-------------------------------------------------------------------------------
Day07Scene11Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_CNOW_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene11Action01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene11Action01NPC:
	lea	DialogTextCNowStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene11Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_CNOW_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene11Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene11Action02NPC:
	cmpi.w	#OBJ_ITEM_DECOY_FISH,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene11Action02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_NEON_DRESS,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQCNow,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene11Action02NPCDefault:
	lea	DialogTextNPCCNowStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 12 (SCENE_ID_TBOOKS)
;-------------------------------------------------------------------------------
Day07Scene12Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene12Action01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene12Action01NPC:
	lea	DialogTextTBooksStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene12Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene12Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene12Action02NPC:
	cmpi.w	#OBJ_ITEM_LANDMINE,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene12Action02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_MOTIVATIONAL_BOOKS,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQTBooks,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene12Action02NPCDefault:
	lea	DialogTextNPCTBooksStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 13 (SCENE_ID_FCBCHECKOUT)
;-------------------------------------------------------------------------------
Day07Scene13Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day07Scene13Action01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene13Action01NPC:
	lea	DialogTextFCBCheckoutStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene13Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day07Scene13Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene13Action02NPC:
	lea	DialogTextNPCFCBCheckoutStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 14 (SCENE_ID_FCBFIREARMS)
;-------------------------------------------------------------------------------
Day07Scene14Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day07Scene14Action01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene14Action01NPC:
	lea	DialogTextFCBFirearmsStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene14Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day07Scene14Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene14Action02NPC:
	cmpi.w	#OBJ_ITEM_NEON_DRESS,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene14Action02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_LANDMINE,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQFCBFirearms,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene14Action02NPCDefault:
	lea	DialogTextNPCFCBFirearmsStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 15 (SCENE_ID_FCBFISHING)
;-------------------------------------------------------------------------------
Day07Scene15Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene15Action01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene15Action01NPC:
	lea	DialogTextFCBFishingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene15Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day07Scene15Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene15Action02NPC:
	cmpi.w	#OBJ_ITEM_NOSE_HOOPS,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene15Action02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_DECOY_FISH,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQFCBFishing,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene15Action02NPCDefault:
	lea	DialogTextNPCFCBFishingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 16 (SCENE_ID_FCBCAMPING)
;-------------------------------------------------------------------------------
Day07Scene16Action00:	; ACTION_LOOK
	cmpi.w	#PLAYER_SPRITE_DB,(MEM_PLAYER_SPRITE)	; test player sprite
	bne.s	Day07Scene16Action00Default	; not D.B., use default
	cmpi.w	#OBJ_SCENE_TENT,(MEM_ACTION_TARGET_OBJID)	; test target
	bne.s	Day07Scene16Action00Default	; branch if different object
	; test event flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY07_SEARCH_TENT,d7	; test flag
	bne.s	.1	; branch if set
	; update flags
	bset.l	#EVENT_FLAG_DAY07_SEARCH_TENT,d7	; test flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; add item
	move.w	#OBJ_ITEM_WOOD_COMB,d7
	bsr.w	AddItem
	; show text
	lea	DialogTextDay07TQTent0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.1
	lea	DialogTextDay07TQTent1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene16Action00Default:
	bsr.w ShowDefaultText	; use default text for objects in this scene
	rts

;-------------------------------------------------------------------------------
; day 07 - scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
Day07Scene17Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day07Scene17Action01NPC	; branch to text for the NPC
	; default text
	bsr.w	ActionScriptDefaultUse
	rts
Day07Scene17Action01NPC:
	lea	DialogTextSouthCenterStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene17Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day07Scene17Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day07Scene17Action02NPC:
	cmpi.w	#OBJ_ITEM_BETA_TAPES,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day07Scene17Action02NPCDefault	; branch if not camera 3
	; update inventory
	bsr.w	RemoveActiveItem	; remove the item
	move.w	#OBJ_ITEM_RANCID_MEAT,d7	; copy next item in sequence to d7
	bsr.w	AddItem	; add the item
	; show response text
	lea	DialogTextDay07TQSCenter,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene17Action02NPCDefault:
	lea	DialogTextNPCSouthCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day07Scene17Action03:	; ACTION_RESPOND
	tst.w	(MEM_MENU_RESPONSE)
	bne.s	Day07Scene17Action03Later
	; else transition
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog
	; queue the scripted event
	lea ScriptedEventDay07ChangePC,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts
Day07Scene17Action03Later:
	lea	DialogTextDay07EnterDCountryLater,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

