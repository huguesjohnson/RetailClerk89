;-------------------------------------------------------------------------------
; day 02 - scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
Day02Scene00Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day02Scene00Action01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DB,d6	; test target
	beq.s	Day02Scene00Action01NPCDB	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene00Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB00_COMPLETE,d7	; test for event flag
	bne.s	Day02Scene00Action01NPCSub00Complete	; flag set, branch
	lea	DialogTextGreenbergDay02Sub00NotComplete,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene00Action01NPCSub00Complete:
	lea	DialogTextGreenbergDay02Sub00Complete,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene00Action01NPCDB:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB02_COMPLETE,d7	; test for event flag
	bne.s	Day02Scene00Action01NPCDBCompleted	; flag set, branch
	btst.l	#EVENT_FLAG_DAY02_SUB02_MID,d7	; test for event flag
	bne.s	Day02Scene00Action01NPCDBMid	; flag set, branch
	; default
	lea	DialogTextDBDay02Sub02StartedTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene00Action01NPCDBMid:
	lea	DialogTextDBDay02Sub02MidTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene00Action01NPCDBCompleted:
	; the mall is now closed
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
	move.l	d7,(MEM_GAME_STATE)	; save game state
	move.l	#$00000000,(MEM_NPC_LOCATION_VB)
	move.l	#$01000000,(MEM_NPC_LOCATION_PARKINGLOT)
	; clear all mission flags
	and.l #$00000000,(MEM_MISSION_EVENT_FLAGS)
	; queue the scripted event
	lea ScriptedEventDay02Night01,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	ScriptedEventDay02Sub02End00,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT	
	rts
Day02Scene00Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day02Scene00Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene00Action02NPC:
	cmpi.w	#OBJ_ITEM_QUARTERS,(MEM_ACTIVE_ITEM)	; test item
	bne.s	Day02Scene00Action02NPCDefault	; branch if not quarters
	; update NPCs
	move.l	#$161A1200,(MEM_NPC_LOCATION_VB)
	move.l	#$00050000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$04000000,(MEM_NPC_LOCATION_CENTER)
	; remove the item from the player's inventory
	move.w	#OBJ_ITEM_QUARTERS,d7	; copy object ID to d7
	bsr.w	RemoveItem	; remove the item
	; add the store key
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_VB,d7	; set key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save keys
	; clear all mission flags
	and.l #$00000000,(MEM_MISSION_EVENT_FLAGS)
	; update the objective text
	move.w	#OBJECTIVE_D2_O1,(MEM_OBJECTIVE)	; increment objective
	; queue the scripted event
	lea ScriptedEventDay02ChangePC,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextGreenbergDay02Transition,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT	
	rts
Day02Scene00Action02NPCDefault:
	lea	DialogTextGreenbergDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
Day02Scene03Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day02Scene03Action01NPC	; branch to display text
	cmpi.w	#OBJ_NPC_MALLMANAGER_NOW,d6	; test target
	bne.s	Day02Scene03Action01Default	; branch to default text
	lea	DialogTextMallManagerDay02,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene03Action01Default:
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene03Action01NPC:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	InfoDeskMenu,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene03Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day02Scene03Action02NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_MALLMANAGER_NOW,d6	; test target
	bne.s	Day02Scene03Action02Default	; default text
	lea	DialogTextNPCMallManagerDefaultGive,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene03Action02Default:
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene03Action02NPC:
	lea	DialogTextNPCCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene03Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day02Scene03Action03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day02Scene03Action03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day02Scene03Action03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextInfoDeskDay02R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene03Action03R0:
	lea	DialogTextInfoDeskDay02R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene03Action03R1:
	lea	DialogTextInfoDeskDay02R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene03Action03R2:
	lea	DialogTextInfoDeskDay02R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 04 (SCENE_ID_SHALL)
;-------------------------------------------------------------------------------
Day02Scene04Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day02Scene04Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene04Action01NPC:
	; update game state
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	bset.l	#EVENT_FLAG_DAY02_SUB02_COMPLETE,d7	; set sub 02 complete
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update NPCs in the south hall
	move.l	#$00000000,(MEM_NPC_LOCATION_SHALL)	; update NPCs
	; queue the scripted event
	lea ScriptedEventDay02Night00,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	ScriptedEventDay02Sub02Mid00,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT	
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 05 (SCENE_ID_PARKINGLOT)
;-------------------------------------------------------------------------------
Day02Scene05Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day02Scene05Action01NPCDani	; branch
	cmpi.w	#OBJ_SCENE_DANICAR,d6	; test target
	beq.s	Day02Scene05DaniCarLookUse	; same action for look and use
	; default action	
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay02Scene05Action01
Day02Scene05Action01NPCDani:
	lea	DialogTextDaniScene05Day02,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay02Scene05Action01:
	rts

Day02Scene05DaniCarLookUse:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDaniCarDayEnd,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day02Scene05Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day02Scene05Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.w	Day02End	; branch to day end
	; else exit
	lea	DialogTextDaniCarGameEndR0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 08 (SCENE_ID_DENIMCOUNTRY)
;-------------------------------------------------------------------------------
Day02Scene08Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day02Scene08Action01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day02Scene08Action01Dani	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene08Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene08Action01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene08Action01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextDenimCountryStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene08Action01NPCDefault:
	lea	DialogTextDenimCountryStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene08Action01Dani:
	lea	DialogTextDenimCountryDaniDay02Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene08Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day02Scene08Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene08Action02NPC:
	lea	DialogTextNPCDenimCountryStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 09 (SCENE_ID_CHECKERS)
;-------------------------------------------------------------------------------
Day02Scene09Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day02Scene09Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene09Action01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	bne.s	Day02Scene09Action01NPCDB ; branch	
Day02Scene09Action01NPCDani:
	move.w	(MEM_CUSTOMER_FEEDBACK_SCORE),d7	; copy feedback score to d7
	cmpi.w	#$0000,d7	; is the score zero
	beq.s	Day02Scene09Action01NPCDaniBad ; branch if 0
	cmpi.w	#$0004,d7	; is the score four 
	beq.s	Day02Scene09Action01NPCDaniGood ; branch if 4
	; else use default
Day02Scene09Action01NPCDaniMid:
	lea	DialogTextCheckersStaffDay02DaniTalkMid,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene09Action01NPCDaniBad:
	lea	DialogTextCheckersStaffDay02DaniTalkBad,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene09Action01NPCDaniGood:
	lea	DialogTextCheckersStaffDay02DaniTalkGood,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene09Action01NPCDB:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene09Action01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene09Action01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextCheckersStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene09Action01NPCDefault:
	lea	DialogTextCheckersStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene09Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day02Scene09Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene09Action02NPC:
	lea	DialogTextNPCCheckersStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 0A (SCENE_ID_TLODGE)
;-------------------------------------------------------------------------------
Day02Scene0AAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day02Scene0AAction01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_SCENE_RADIO,d6	; test target
	beq.s	Day02Scene0AAction01Radio	; branch to text for the radio
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0AAction01Radio:
	bsr.w	DefaultRadioUse
	rts
Day02Scene0AAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene0AAction01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene0AAction01NPCDefault	; sub 01 is complete, branch
	; update mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	bset.l	#MISSION_FLAG_DAY02_SUB01_D0,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	bsr.w	Day02TestSub01Mid	; check if mid flag should be set
	; use the sub 01 dialog
	lea	DialogTextTLodgeStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0AAction01NPCDefault:
	lea	DialogTextTLodgeStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0AAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day02Scene0AAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0AAction02NPC:
	lea	DialogTextNPCTLodgeStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0AAction03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day02Scene0AAction03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day02Scene0AAction03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day02Scene0AAction03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextRadioDay02R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0AAction03R0:
	lea	DialogTextRadioDay02R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0AAction03R1:
	lea	DialogTextRadioDay02R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0AAction03R2:
	lea	DialogTextRadioDay02R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 0B (SCENE_ID_CAVERN)
;-------------------------------------------------------------------------------
Day02Scene0BAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day02Scene0BAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0BAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene0BAction01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene0BAction01NPCDefault	; sub 01 is complete, branch
	btst.l	#EVENT_FLAG_DAY02_SUB00_COMPLETE,d7	; test if sub 00 is complete
	beq.s	Day02Scene0BAction01NPCDefault	; sub 00 is not complete, branch
	; use the sub 01 dialog
	lea	DialogTextCavernStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0BAction01NPCDefault:
	lea	DialogTextCavernStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0BAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day02Scene0BAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0BAction02NPC:
	cmpi.w	#OBJ_ITEM_TEN_DOLLAR,(MEM_ACTIVE_ITEM)	; test item
	bne.s	Day02Scene0BAction02NPCDefault	; branch if not $10 bill
	; update flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	bset.l	#EVENT_FLAG_DAY02_SUB00_COMPLETE,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; remove the item from the player's inventory
	move.w	#OBJ_ITEM_TEN_DOLLAR,d7	; copy object ID to d7
	bsr.w	RemoveItem	; remove the item
	; add new item to the player's inventory
	move.w	#OBJ_ITEM_QUARTERS,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; show the response message
	lea	DialogTextCavernStaffDay02Sub00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0BAction02NPCDefault:
	lea	DialogTextNPCCavernStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 0C (SCENE_ID_SVIDEO)
;-------------------------------------------------------------------------------
Day02Scene0CAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day02Scene0CAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0CAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene0CAction01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene0CAction01NPCDefault	; sub 01 is complete, branch
	; update mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	bset.l	#MISSION_FLAG_DAY02_SUB01_D1,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	bsr.w	Day02TestSub01Mid	; check if mid flag should be set
	; use the sub 01 dialog
	lea	DialogTextSVideoStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0CAction01NPCDefault:
	lea	DialogTextSVideoStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0CAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day02Scene0CAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0CAction02NPC:
	lea	DialogTextNPCSVideoStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 0D (SCENE_ID_WORKSHOP)
;-------------------------------------------------------------------------------
Day02Scene0DAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day02Scene0DAction01NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day02Scene0DAction01NPC1	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0DAction01NPC0:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene0DAction01NPC0Default	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene0DAction01NPC0Default	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextWorkshopStaff0Day02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0DAction01NPC0Default:
	lea	DialogTextWorkshopStaff0DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0DAction01NPC1:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene0DAction01NPC1Default	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene0DAction01NPC1Default	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextWorkshopStaff1Day02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0DAction01NPC1Default:
	lea	DialogTextWorkshopStaff1DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0DAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day02Scene0DAction02NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day02Scene0DAction02NPC1	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0DAction02NPC0:
	lea	DialogTextNPCWorkshopStaff0DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0DAction02NPC1:
	lea	DialogTextNPCWorkshopStaff1DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 0E (SCENE_ID_NSHACK)
;-------------------------------------------------------------------------------
Day02Scene0EAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day02Scene0EAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0EAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene0EAction01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene0EAction01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextNShackStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0EAction01NPCDefault:
	lea	DialogTextNShackStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0EAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day02Scene0EAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0EAction02NPC:
	lea	DialogTextNPCNShackStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 0F (SCENE_ID_POGODAWG)
;-------------------------------------------------------------------------------
Day02Scene0FAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day02Scene0FAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0FAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene0FAction01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene0FAction01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextPogoDawgStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0FAction01NPCDefault:
	lea	DialogTextPogoDawgStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0FAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day02Scene0FAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene0FAction02NPC:
	lea	DialogTextNPCPogoDawgStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 10 (SCENE_ID_CPLANET)
;-------------------------------------------------------------------------------
Day02Scene10Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day02Scene10Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene10Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene10Action01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene10Action01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextCPlanetStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene10Action01NPCDefault:
	lea	DialogTextCPlanetStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene10Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day02Scene10Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene10Action02NPC:
	lea	DialogTextNPCCPlanetStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 11 (SCENE_ID_CNOW)
;-------------------------------------------------------------------------------
Day02Scene11Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day02Scene11Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene11Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene11Action01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene11Action01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextCNowStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene11Action01NPCDefault:
	lea	DialogTextCNowStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene11Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day02Scene11Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene11Action02NPC:
	lea	DialogTextNPCCNowStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 12 (SCENE_ID_TBOOKS)
;-------------------------------------------------------------------------------
Day02Scene12Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day02Scene12Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene12Action01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	beq.s	Day02Scene12Action01NPCDefault	; branch to default text
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test flag
	bne.s	Day02Scene12Action01NPCSub01Complete	; branch if set
	btst.l	#EVENT_FLAG_DAY02_SUB01_MID,d7	; test flag
	bne.s	Day02Scene12Action01NPCSub01Mid	; branch if set
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test flag
	bne.s	Day02Scene12Action01NPCSub01Started	; branch if set
	; else set the flag to start sub 01
	bset.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	lea	DialogTextTBooksStaffDay02TalkSub01NotStarted,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene12Action01NPCSub01Complete:
	lea	DialogTextTBooksStaffDay02TalkSub01Complete,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene12Action01NPCSub01Mid:
	; set sub 01 as complete
	bset.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; add the store key
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_TBOOKS,d7	; set key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save keys
	; show the dialog
	lea	DialogTextTBooksStaffDay02TalkSub01Mid,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene12Action01NPCSub01Started:
	lea	DialogTextTBooksStaffDay02TalkSub01Started,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene12Action01NPCDefault:
	lea	DialogTextTBooksStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene12Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day02Scene12Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene12Action02NPC:
	lea	DialogTextNPCTBooksStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 13 (SCENE_ID_FCBCHECKOUT)
;-------------------------------------------------------------------------------
Day02Scene13Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day02Scene13Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene13Action01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	beq.s	Day02Scene13Action01NPCDani
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene13Action01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene13Action01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextFCBCheckoutStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene13Action01NPCDani:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB02_STARTED,d7	; test if sub 02 is started
	beq.s	Day02Scene13Action01NPCDefault	; sub 02 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB02_COMPLETE,d7	; test if sub 02 is complete
	bne.s	Day02Scene13Action01NPCDefault	; sub 02 is complete, branch
	; update mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	bset.l	#MISSION_FLAG_DAY02_SUB02_D0,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	bsr.w	Day02TestSub02Mid	; check if mid flag should be set
	; use the sub 02 dialog
	lea	DialogTextFCBCheckoutStaffDay02Sub02Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene13Action01NPCDefault:
	lea	DialogTextFCBCheckoutStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene13Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day02Scene13Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene13Action02NPC:
	lea	DialogTextNPCFCBCheckoutStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 14 (SCENE_ID_FCBFIREARMS)
;-------------------------------------------------------------------------------
Day02Scene14Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day02Scene14Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene14Action01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	beq.s	Day02Scene14Action01NPCDani
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene14Action01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene14Action01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextFCBFirearmsStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene14Action01NPCDani:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB02_STARTED,d7	; test if sub 02 is started
	beq.s	Day02Scene14Action01NPCDefault	; sub 02 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB02_COMPLETE,d7	; test if sub 02 is complete
	bne.s	Day02Scene14Action01NPCDefault	; sub 02 is complete, branch
	; update mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	bset.l	#MISSION_FLAG_DAY02_SUB02_D1,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	bsr.w	Day02TestSub02Mid	; check if mid flag should be set
	; use the sub 02 dialog
	lea	DialogTextFCBFirearmsStaffDay02Sub02Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene14Action01NPCDefault:
	lea	DialogTextFCBFirearmsStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene14Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day02Scene14Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene14Action02NPC:
	lea	DialogTextNPCFCBFirearmsStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 15 (SCENE_ID_FCBFISHING)
;-------------------------------------------------------------------------------
Day02Scene15Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day02Scene15Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene15Action01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	beq.s	Day02Scene15Action01NPCDani
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene15Action01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene15Action01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextFCBFishingStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene15Action01NPCDani:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB02_STARTED,d7	; test if sub 02 is started
	beq.s	Day02Scene15Action01NPCDefault	; sub 02 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB02_COMPLETE,d7	; test if sub 02 is complete
	bne.s	Day02Scene15Action01NPCDefault	; sub 02 is complete, branch
	; update mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	bset.l	#MISSION_FLAG_DAY02_SUB02_D2,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	bsr.w	Day02TestSub02Mid	; check if mid flag should be set
	; use the sub 02 dialog
	lea	DialogTextFCBFishingStaffDay02Sub02Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene15Action01NPCDefault:
	lea	DialogTextFCBFishingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene15Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day02Scene15Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene15Action02NPC:
	lea	DialogTextNPCFCBFishingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 16 (SCENE_ID_FCBCAMPING)
;-------------------------------------------------------------------------------
Day02Scene16Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day02Scene16Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene16Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene16Action01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene16Action01NPCDefault	; sub 01 is complete, branch
	; use the sub 01 dialog
	lea	DialogTextFCBCampingStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene16Action01NPCDefault:
	lea	DialogTextFCBCampingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene16Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day02Scene16Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene16Action02NPC:
	lea	DialogTextNPCFCBCampingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 02 - scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
Day02Scene17Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day02Scene17Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene17Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY02_SUB01_STARTED,d7	; test if sub 01 is started
	beq.s	Day02Scene17Action01NPCDefault	; sub 01 not started, branch
	btst.l	#EVENT_FLAG_DAY02_SUB01_COMPLETE,d7	; test if sub 01 is complete
	bne.s	Day02Scene17Action01NPCDefault	; sub 01 is complete, branch
	; update mission flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	bset.l	#MISSION_FLAG_DAY02_SUB01_D2,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	bsr.w	Day02TestSub01Mid	; check if mid flag should be set
	; use the sub 01 dialog
	lea	DialogTextSouthCenterStaffDay02Sub01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene17Action01NPCDefault:
	lea	DialogTextSouthCenterStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene17Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day02Scene17Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day02Scene17Action02NPC:
	lea	DialogTextNPCSouthCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; test if all the events of sub 01 are complete
;-------------------------------------------------------------------------------
Day02TestSub01Mid:
	; the 3 places this is called from all have MEM_MISSION_EVENT_FLAGS in d7
	btst.l	#MISSION_FLAG_DAY02_SUB01_D0,d7	; test if flag is set
	beq.s	ExitDay02TestSub01Complete	; not set, branch
	btst.l	#MISSION_FLAG_DAY02_SUB01_D1,d7	; test if flag is set
	beq.s	ExitDay02TestSub01Complete	; not set, branch
	btst.l	#MISSION_FLAG_DAY02_SUB01_D2,d7	; test if flag is set
	beq.s	ExitDay02TestSub01Complete	; not set, branch
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	bset.l	#EVENT_FLAG_DAY02_SUB01_MID,d7	; set event complete flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save day event flags
ExitDay02TestSub01Complete:
	rts

;-------------------------------------------------------------------------------
; test if all the events of sub 02 are complete
;-------------------------------------------------------------------------------
Day02TestSub02Mid:
	; the 3 places this is called from all have MEM_MISSION_EVENT_FLAGS in d7
	btst.l	#MISSION_FLAG_DAY02_SUB02_D0,d7	; test if flag is set
	beq.s	ExitDay02TestSub02Complete	; not set, branch
	btst.l	#MISSION_FLAG_DAY02_SUB02_D1,d7	; test if flag is set
	beq.s	ExitDay02TestSub02Complete	; not set, branch
	btst.l	#MISSION_FLAG_DAY02_SUB02_D2,d7	; test if flag is set
	beq.s	ExitDay02TestSub02Complete	; not set, branch
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	bset.l	#EVENT_FLAG_DAY02_SUB02_MID,d7	; set event complete flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save day event flags
	; move npc to south hall
	move.l	#$12000000,(MEM_NPC_LOCATION_SHALL)	; update NPCs
ExitDay02TestSub02Complete:
	rts

;-------------------------------------------------------------------------------
; end day 02
;-------------------------------------------------------------------------------
Day02End:
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	move.l	#$03000000,(MEM_NPC_LOCATION_VB)
	move.l	#$00000000,(MEM_NPC_LOCATION_PARKINGLOT)
	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL)
	move.l	#$05010000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$12000000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$12000000,(MEM_NPC_LOCATION_WWHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_EWHALL)
	move.l	#$04000000,(MEM_NPC_LOCATION_CENTER)
	;---------------------------------------------------------------------------	
	; update the game state
	;---------------------------------------------------------------------------	
	bsr.w	ClearPlayerInventory	; clear player inventory
	move.w	#PLAYER_SPRITE_DB,(MEM_PLAYER_SPRITE)	; update sprite
	move.w	#$0003,(MEM_DAY)	; move to day 03
	move.w	#OBJECTIVE_D3_O0,(MEM_OBJECTIVE)	; increment objective
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
	lea	SceneIntroDay03,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade-in
	;---------------------------------------------------------------------------	
	; queue the scripted event that starts day 3
	;---------------------------------------------------------------------------	
	lea ScriptedEventDay03Start,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts

