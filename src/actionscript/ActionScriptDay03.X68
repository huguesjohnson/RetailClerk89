;-------------------------------------------------------------------------------
; day 03 - scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
Day03Scene00Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day03Scene00Action01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_BILLY,d6	; test target
	beq.s	Day03Scene00Action01NPCBilly	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene00Action01NPC:
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_MALL_CLOSED,d7	; if the mall closed?
	bne.s	Day03Scene00Action01NPCMallClosed	; branch to mall closed text
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene00Action01NPCSubComplete	; flag set, branch
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	bne.s	Day03Scene00Action01NPCSubInProgress	; flag set, branch
Day03Scene00Action01NPCStartSub:
	; set event flag
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy flags to d7
	bset.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; set mission started flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update objective
	move.w	#OBJECTIVE_D3_O2,(MEM_OBJECTIVE)
	; show text
	lea	DialogTextDay03GreenbergStartSub,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene00Action01NPCSubInProgress:
	lea	DialogTextDay03GreenbergSubInProgress,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene00Action01NPCSubComplete:
	lea	DialogTextDay03GreenbergSubComplete,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene00Action01NPCMallClosed:
	lea	DialogTextDay03GreenbergMallClosed,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene00Action01NPCBilly:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	bne.s	.1	; flag set, branch
	lea	DialogTextDay03BillyDefault,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
.1
	lea	DialogTextDay03BillySubStarted,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene00Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_GREENBERG,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene00Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene00Action02NPC:
	lea	DialogTextGreenbergDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 01 (SCENE_ID_WWHALL)
;-------------------------------------------------------------------------------
Day03Scene01Action00:	; ACTION_LOOK
	cmpi.w	#OBJ_SCENE_BENCH,(MEM_ACTION_TARGET_OBJID)	; is this the plant?
	bne.s	Day03Scene01Action00Default	; if not, branch to default
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_TLODGE_STARTED,d7	; mission started?
	beq.s	Day03Scene01Action00Default	; not started, use default text
	btst.l	#EVENT_FLAG_DAY03_SUB_TLODGE_COMPLETE,d7	; mission complete?
	bne.s	Day03Scene01Action00Default	; complete, use default text
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission event flags to d7
	btst.l	#MISSION_FLAG_DAY03_CAMERA1_GET,d7	; found this camera already?
	bne.s	Day03Scene01Action00Default	; found camera, use default text
	bset.l	#MISSION_FLAG_DAY03_CAMERA1_GET,d7	; set found flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	move.w	#OBJ_ITEM_CAMERA1,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; found item text
	lea	DialogTextDay03FindCamera1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene01Action00Default:
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 02 (SCENE_ID_WEHALL)
;-------------------------------------------------------------------------------
Day03Scene02Action00:	; ACTION_LOOK
	cmpi.w	#OBJ_NPC_DB,(MEM_ACTION_TARGET_OBJID)	; is this D.B.?
	beq.s	Day03Scene01Action00DB	; branch to text for D.B.
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day03Scene01Action00DB:
	lea	DialogTextDay03Scene02Action00NPCDB,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene02Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_DB,(MEM_ACTION_TARGET_OBJID)	; is this D.B.?
	beq.s	Day03Scene01Action01DB	; branch to text for D.B.
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene01Action01DB:
	; mall is now closed
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bset.l	#STATE_FLAG_MALL_CLOSED,d7	; set mall closed flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; update NPCs	
	move.l	#$18000000,(MEM_NPC_LOCATION_EEHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_WEHALL)
	move.l	#$01000000,(MEM_NPC_LOCATION_PARKINGLOT)
	move.l	#$00000000,(MEM_NPC_LOCATION_EWHALL)
	; queue the scripted event
	lea ScriptedEventDay03DayEnd,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay03End,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
Day03Scene03Action00:	; ACTION_LOOK
	cmp.w	#OBJ_SCENE_PLANT_ALT,(MEM_ACTION_TARGET_OBJID)	; is this the plant?
	bne.s	Day03Scene03Action00Default	; if not, branch to default
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_TLODGE_STARTED,d7	; mission started?
	beq.s	Day03Scene03Action00Default	; not started, use default text
	btst.l	#EVENT_FLAG_DAY03_SUB_TLODGE_COMPLETE,d7	; mission complete?
	bne.s	Day03Scene03Action00Default	; complete, use default text
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission event flags to d7
	btst.l	#MISSION_FLAG_DAY03_CAMERA3_GET,d7	; found this camera already?
	bne.s	Day03Scene03Action00Default	; found camera, use default text
	bset.l	#MISSION_FLAG_DAY03_CAMERA3_GET,d7	; set found flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	move.w	#OBJ_ITEM_CAMERA3,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; found item text
	lea	DialogTextDay03FindCamera3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene03Action00Default:
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day03Scene03Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_CENTER_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene03Action01NPC	; branch to display text
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene03Action01NPC:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	InfoDeskMenu,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene03Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_CENTER_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene03Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene03Action02NPC:
	lea	DialogTextNPCCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene03Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day03Scene03Action03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day03Scene03Action03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day03Scene03Action03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextInfoDeskDay03R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene03Action03R0:
	lea	DialogTextInfoDeskDay03R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene03Action03R1:
	lea	DialogTextInfoDeskDay03R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene03Action03R2:
	lea	DialogTextInfoDeskDay03R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 05 (SCENE_ID_PARKINGLOT)
;-------------------------------------------------------------------------------
Day03Scene05Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts

Day03Scene05Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day03Scene05Action01NPCDani	; branch
	cmpi.w	#OBJ_SCENE_DANICAR,d6	; test target
	beq.s	Day03Scene05DaniCarLookUse	; same action for look and use
	; default action	
	bsr.w ActionScriptDefaultUse
	bra.s	ExitDay03Scene05Action01
Day03Scene05Action01NPCDani:
	lea	DialogTextDaniScene05Day03,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay03Scene05Action01:
	rts

Day03Scene05DaniCarLookUse:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDaniCarDayEnd,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day03Scene05Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.w	Day03End	; branch to day end
	; else exit
	lea	DialogTextDaniCarGameEndR0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 06 (SCENE_ID_EWHALL)
;-------------------------------------------------------------------------------
Day03Scene06Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_MALLMANAGER_NOW,(MEM_ACTION_TARGET_OBJID)	; test target
	bne.s	Day03Scene06Action01Default	; branch to default text
	lea	DialogTextMallManagerDay03,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene06Action01Default:
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene06Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_MALLMANAGER_NOW,(MEM_ACTION_TARGET_OBJID)	; test target
	bne.s	Day03Scene06Action02Default	; default text
	lea	DialogTextNPCMallManagerDefaultGive,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene06Action02Default:
	; default action
	bsr.w	ActionScriptDefaultTake
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 07 (SCENE_ID_EEHALL)
;-------------------------------------------------------------------------------
Day03Scene07Action00:	; ACTION_LOOK
	cmpi.w	#OBJ_NPC_GUARD0,(MEM_ACTION_TARGET_OBJID)	; is this the guard?
	beq.s	Day03Scene07Action00NPCGuard	; branch to text for guard
	cmpi.w	#OBJ_SCENE_PLANT,(MEM_ACTION_TARGET_OBJID)	; is this the plant?
	bne.s	Day03Scene07Action00Default	; if not, branch to default
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_TLODGE_STARTED,d7	; mission started?
	beq.s	Day03Scene07Action00Default	; not started, use default text
	btst.l	#EVENT_FLAG_DAY03_SUB_TLODGE_COMPLETE,d7	; mission complete?
	bne.s	Day03Scene07Action00Default	; complete, use default text
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission event flags to d7
	btst.l	#MISSION_FLAG_DAY03_CAMERA2_GET,d7	; found this camera already?
	bne.s	Day03Scene07Action00Default	; found camera, use default text
	bset.l	#MISSION_FLAG_DAY03_CAMERA2_GET,d7	; set found flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	move.w	#OBJ_ITEM_CAMERA2,d7	; copy item id to d7
	bsr.w	AddItem	; add item to inventory
	; found item text
	lea	DialogTextDay03FindCamera2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene07Action00Default:
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day03Scene07Action00NPCGuard:
	lea	DialogTextDay03Scene07NPCGuard,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 08 (SCENE_ID_DENIMCOUNTRY)
;-------------------------------------------------------------------------------
Day03Scene08Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day03Scene08Action01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day03Scene08Action01NPCDani	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_FEMALE_SHOPPER0,d6	; test target
	beq.s	Day03Scene08Action01NPCShopper	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene08Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene08Action01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene08Action01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextDenimCountryStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene08Action01NPCDefault:
	lea	DialogTextDenimCountryStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene08Action01NPCDani:
	lea	DialogTextDaniScene08Day03,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene08Action01NPCShopper:
	lea	DialogTextDay03Scene08NPCShopper,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene08Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day03Scene08Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene08Action02NPC:
	lea	DialogTextNPCDenimCountryStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 09 (SCENE_ID_CHECKERS)
;-------------------------------------------------------------------------------
Day03Scene09Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene09Action01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene09Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene09Action01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene09Action01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextCheckersStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene09Action01NPCDefault:
	lea	DialogTextCheckersStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene09Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day03Scene09Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene09Action02NPC:
	lea	DialogTextNPCCheckersStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 0A (SCENE_ID_TLODGE)
;-------------------------------------------------------------------------------
Day03Scene0AAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day03Scene0AAction01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_SCENE_RADIO,d6	; test target
	beq.s	Day03Scene0AAction01Radio	; branch to text for the radio
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene0AAction01Radio:
	bsr.w	DefaultRadioUse
	rts
Day03Scene0AAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_TLODGE_STARTED,d7	; mission started?
	beq.s	Day03Scene0AAction01NPCStartMission	; flag not set, branch
	btst.l	#EVENT_FLAG_DAY03_SUB_TLODGE_COMPLETE,d7	; mission in-progress?
	beq.s	Day03Scene0AAction01NPCUpdateMission	; flag not set, branch
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene0AAction01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene0AAction01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextTLodgeStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction01NPCDefault:
	; mission is complete, use default text
	lea	DialogTextTLodgeStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction01NPCStartMission:
	; setup 2 choice dialog	to begin subquest
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextScene09Day03Intro,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction01NPCUpdateMission:
	; how many cameras have been found?	
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	and.w	#$0000,d6	; clear d6
	btst.l	#MISSION_FLAG_DAY03_CAMERA1_GIVE,d7
	beq.s	.1
	addq	#$1,d6
.1
	btst.l	#MISSION_FLAG_DAY03_CAMERA2_GIVE,d7
	beq.s	.2
	addq	#$1,d6
.2
	btst.l	#MISSION_FLAG_DAY03_CAMERA3_GIVE,d7
	beq.s	.3
	addq	#$1,d6
.3
	cmpi.w	#$0001,d6
	beq.s	Day03Scene0AAction01NPCUpdateMissionFound1
	cmpi.w	#$0002,d6
	beq.s	Day03Scene0AAction01NPCUpdateMissionFound2
Day03Scene0AAction01NPCUpdateMissionFound0:
	lea	DialogTextScene09Day03Found0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction01NPCUpdateMissionFound1:
	lea	DialogTextScene09Day03Found1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction01NPCUpdateMissionFound2:
	lea	DialogTextScene09Day03Found2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0AAction02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene0AAction02NPC:
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission event flags to d7
	cmpi.w	#OBJ_ITEM_CAMERA1,(MEM_ACTIVE_ITEM)	; test item
	bne.s	.1	; branch if not camera 1
	bset.l	#MISSION_FLAG_DAY03_CAMERA1_GIVE,d7	; set flag
	bra.s	Day03Scene0AAction02NPCGiveCamera	; branch
.1
	cmpi.w	#OBJ_ITEM_CAMERA2,(MEM_ACTIVE_ITEM)	; test item
	bne.s	.2	; branch if not camera 2
	bset.l	#MISSION_FLAG_DAY03_CAMERA2_GIVE,d7	; set flag
	bra.s	Day03Scene0AAction02NPCGiveCamera	; branch
.2
	cmpi.w	#OBJ_ITEM_CAMERA3,(MEM_ACTIVE_ITEM)	; test item
	bne.w	Day03Scene0AAction02NPCDefault	; branch if not camera 3
	bset.l	#MISSION_FLAG_DAY03_CAMERA3_GIVE,d7	; set flag
Day03Scene0AAction02NPCGiveCamera:	
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; remove the item from the player's inventory	
	bsr.w	RemoveActiveItem	; remove the item
	; how many cameras have been found?	
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	and.w	#$0000,d6	; clear d6
	btst.l	#MISSION_FLAG_DAY03_CAMERA1_GIVE,d7
	beq.s	.1
	addq	#$1,d6
.1
	btst.l	#MISSION_FLAG_DAY03_CAMERA2_GIVE,d7
	beq.s	.2
	addq	#$1,d6
.2
	btst.l	#MISSION_FLAG_DAY03_CAMERA3_GIVE,d7
	beq.s	.3
	addq	#$1,d6
.3
	cmpi.w	#$0001,d6
	beq.w	Day03Scene0AAction02NPCGiveCamera1
	cmpi.w	#$0002,d6
	beq.w	Day03Scene0AAction02NPCGiveCamera2
	;---------------------------------------------------------------------------
	; transition to second half of the day
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	bset.l	#EVENT_FLAG_DAY03_SUB_TLODGE_COMPLETE,d7	; set complete flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; player now has the tlogdge key
	move.l	(MEM_PLAYER_STORE_KEYS),d7	; copy store keys to d7
	bset.l	#STORE_KEY_TLODGE,d7	; set key
	move.l	d7,(MEM_PLAYER_STORE_KEYS)	; save keys
	and.l	#$00000000,(MEM_MISSION_EVENT_FLAGS)	; clear mission flags
	move.w	#OBJECTIVE_D3_O1,(MEM_OBJECTIVE)	; update the objective
	; update NPCs
	move.l	#$031B0000,(MEM_NPC_LOCATION_VB)
	move.l	#$1A050B00,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$00000000,(MEM_NPC_LOCATION_WWHALL)
	move.l	#$04000000,(MEM_NPC_LOCATION_CENTER)
	move.l	#$1D000000,(MEM_NPC_LOCATION_EWHALL)
	move.l	#$0E250000,(MEM_NPC_LOCATION_TBOOKS)
	; queue the scripted event
	lea ScriptedEventDay03ChangePC,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay03ScriptedEventMid00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction02NPCGiveCamera1:
	lea	DialogTextScene09Day03Give1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction02NPCGiveCamera2:
	lea	DialogTextScene09Day03Give2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction02NPCDefault:	
	lea	DialogTextNPCTLodgeStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction03:	; ACTION_RESPOND
	cmpi.w	#OBJ_SCENE_RADIO,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0AAction03Radio	; branch to text for the radio
	; otherwise should be the npc
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day03Scene0AAction03StartMission	; branch launch scripted event
	; else display declined dialog
	lea	DialogTextScene09Day03IntroR1,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction03StartMission:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day flags to d7
	bset.l	#EVENT_FLAG_DAY03_SUB_TLODGE_STARTED,d7	; set mission started flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	lea	DialogTextScene09Day03IntroR0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction03Radio:
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day03Scene0AAction03R0Radio	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day03Scene0AAction03R1Radio	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day03Scene0AAction03R2Radio	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextRadioDay03R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction03R0Radio:
	lea	DialogTextRadioDay03R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction03R1Radio:
	lea	DialogTextRadioDay03R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0AAction03R2Radio:
	lea	DialogTextRadioDay03R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 0B (SCENE_ID_CAVERN)
;-------------------------------------------------------------------------------
Day03Scene0BAction01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0BAction01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene0BAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene0BAction01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene0BAction01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextCavernStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0BAction01NPCDefault:
	lea	DialogTextCavernStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0BAction02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0BAction02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene0BAction02NPC:
	lea	DialogTextNPCCavernStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 0C (SCENE_ID_SVIDEO)
;-------------------------------------------------------------------------------
Day03Scene0CAction01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0CAction01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene0CAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene0CAction01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene0CAction01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextSVideoStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0CAction01NPCDefault:
	lea	DialogTextSVideoStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0CAction02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0CAction02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene0CAction02NPC:
	lea	DialogTextNPCSVideoStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 0D (SCENE_ID_WORKSHOP)
;-------------------------------------------------------------------------------
Day03Scene0DAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day03Scene0DAction01NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day03Scene0DAction01NPC1	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene0DAction01NPC0:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene0DAction01NPC0Default	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene0DAction01NPC0Default	; complete, default text
	; else text for subquest	
	lea	DialogTextWorkshopStaff0Day03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0DAction01NPC0Default:
	lea	DialogTextWorkshopStaff0DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0DAction01NPC1:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene0DAction01NPC1Default	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene0DAction01NPC1Default	; complete, default text
	; else text for subquest	
	lea	DialogTextWorkshopStaff1Day03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0DAction01NPC1Default:
	lea	DialogTextWorkshopStaff1DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0DAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day03Scene0DAction02NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day03Scene0DAction02NPC1	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene0DAction02NPC0:
	lea	DialogTextNPCWorkshopStaff0DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0DAction02NPC1:
	lea	DialogTextNPCWorkshopStaff1DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 0E (SCENE_ID_NSHACK)
;-------------------------------------------------------------------------------
Day03Scene0EAction01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0EAction01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene0EAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene0EAction01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene0EAction01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextNShackStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0EAction01NPCDefault:
	lea	DialogTextNShackStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0EAction02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0EAction02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene0EAction02NPC:
	lea	DialogTextNPCNShackStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 0F (SCENE_ID_POGODAWG)
;-------------------------------------------------------------------------------
Day03Scene0FAction01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0FAction01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene0FAction01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene0FAction01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene0FAction01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextPogoDawgStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0FAction01NPCDefault:
	lea	DialogTextPogoDawgStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene0FAction02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene0FAction02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene0FAction02NPC:
	lea	DialogTextNPCPogoDawgStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 10 (SCENE_ID_CPLANET)
;-------------------------------------------------------------------------------
Day03Scene10Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene10Action01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene10Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene10Action01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene10Action01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextCPlanetStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene10Action01NPCDefault:
	lea	DialogTextCPlanetStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene10Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene10Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene10Action02NPC:
	lea	DialogTextNPCCPlanetStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 11 (SCENE_ID_CNOW)
;-------------------------------------------------------------------------------
Day03Scene11Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_CNOW_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene11Action01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene11Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene11Action01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene11Action01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextCNowStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene11Action01NPCDefault:
	lea	DialogTextCNowStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene11Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_CNOW_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene11Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene11Action02NPC:
	lea	DialogTextNPCCNowStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 12 (SCENE_ID_TBOOKS)
;-------------------------------------------------------------------------------
Day03Scene12Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day03Scene12Action01NPC	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_FEMALE_SHOPPER1,d6	; test target
	bne.s	Day03Scene12Action01Default	; branch to default
	; update npcs
	move.l	#$0E000000,(MEM_NPC_LOCATION_TBOOKS)
	; update game state
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	; copy global flags to d7
	bset.l	#GLOBAL_FLAG_PDAWG_CUSTOMER0,d7	; set flag
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)	; save updated flags
	; setup scripted event and dialog	
	lea ScriptedEventDay03DawgCustomer,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay03PDawgCustomer00,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene12Action01Default:
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene12Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene12Action01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene12Action01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextTBooksStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene12Action01NPCDefault:
	lea	DialogTextTBooksStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene12Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene12Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene12Action02NPC:
	lea	DialogTextNPCTBooksStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 13 (SCENE_ID_FCBCHECKOUT)
;-------------------------------------------------------------------------------
Day03Scene13Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day03Scene13Action01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene13Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene13Action01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene13Action01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextFCBCheckoutStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene13Action01NPCDefault:
	lea	DialogTextFCBCheckoutStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene13Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day03Scene13Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene13Action02NPC:
	lea	DialogTextNPCFCBCheckoutStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 14 (SCENE_ID_FCBFIREARMS)
;-------------------------------------------------------------------------------
Day03Scene14Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day03Scene14Action01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene14Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene14Action01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene14Action01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextFCBFirearmsStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene14Action01NPCDefault:
	lea	DialogTextFCBFirearmsStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene14Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day03Scene14Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene14Action02NPC:
	lea	DialogTextNPCFCBFirearmsStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 15 (SCENE_ID_FCBFISHING)
;-------------------------------------------------------------------------------
Day03Scene15Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene15Action01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene15Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene15Action01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene15Action01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextFCBFishingStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene15Action01NPCDefault:
	lea	DialogTextFCBFishingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene15Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene15Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene15Action02NPC:
	lea	DialogTextNPCFCBFishingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 16 (SCENE_ID_FCBCAMPING)
;-------------------------------------------------------------------------------
Day03Scene16Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene16Action01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene16Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene16Action01NPCDefault	; not started, default text
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; sub complete?
	bne.s	Day03Scene16Action01NPCDefault	; complete, default text
	; else text for subquest	
	lea	DialogTextFCBCampingStaffDay03SubVBTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene16Action01NPCDefault:
	lea	DialogTextFCBCampingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene16Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,(MEM_ACTION_TARGET_OBJID)	; test target
	beq.s	Day03Scene16Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene16Action02NPC:
	lea	DialogTextNPCFCBCampingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 03 - scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
Day03Scene17Action01:	; ACTION_USE_TALK
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day03Scene17Action01NPC	; branch to text for the NPC
	; default text
	bsr.w ActionScriptDefaultUse
	rts
Day03Scene17Action01NPC:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#EVENT_FLAG_DAY03_SUB_VB_STARTED,d7	; sub started?
	beq.s	Day03Scene17Action01NPCDefault	; flag not set, branch
	; set complete flag
	bset.l	#EVENT_FLAG_DAY03_SUB_VB_COMPLETE,d7	; set flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update NPCs
	move.l	#$03000000,(MEM_NPC_LOCATION_VB)
	move.l	#$00000000,(MEM_NPC_LOCATION_SOUTH_CENTER)
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$16000000,(MEM_NPC_LOCATION_WEHALL)
	; setup scripted event and dialog	
	lea ScriptedEventDay03SubVBComplete,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextScene17Day03Event,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene17Action01NPCDefault:
	lea	DialogTextSouthCenterStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day03Scene17Action02:	; ACTION_TAKE_GIVE
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,(MEM_ACTION_TARGET_OBJID) ; test target
	beq.s	Day03Scene17Action02NPC	; branch to text for the NPC
	; default action
	bsr.w	ActionScriptDefaultTake
	rts
Day03Scene17Action02NPC:
	lea	DialogTextNPCSouthCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; end day 03
;-------------------------------------------------------------------------------
Day03End:
	move.l	#$00000000,(MEM_DIALOG_FLAGS)	; forcibly kill the dialog
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	move.l	#$16000000,(MEM_NPC_LOCATION_VB)
	move.l	#$13000000,(MEM_NPC_LOCATION_SOUTH_CENTER)
	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL)
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$00000000,(MEM_NPC_LOCATION_WEHALL)
	move.l	#$04000000,(MEM_NPC_LOCATION_CENTER)
	move.l	#$00000000,(MEM_NPC_LOCATION_PARKINGLOT)
	move.l	#$0E000000,(MEM_NPC_LOCATION_TBOOKS)
	move.l	#$10240000,(MEM_NPC_LOCATION_FCBFIREARMS)
	;---------------------------------------------------------------------------	
	; update the game state
	;---------------------------------------------------------------------------	
	bsr.w	ClearPlayerInventory	; clear player inventory
	move.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; update sprite
	move.w	#$0004,(MEM_DAY)	; move to day 04
	move.w	#OBJECTIVE_D4_O0,(MEM_OBJECTIVE)	; update objective
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
	lea	SceneIntroDay04,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade-in
	;---------------------------------------------------------------------------	
	; set player sprite position
	;---------------------------------------------------------------------------	
	move.w	#SPRITE_PLAYER_INIT_X,(MEM_PLAYER_SPRITE_X)	; set player sprite x
	move.w	#SPRITE_PLAYER_INIT_Y,(MEM_PLAYER_SPRITE_Y)	; set player sprite y
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; set direction
	;---------------------------------------------------------------------------	
	; queue the scripted event that starts day 4
	;---------------------------------------------------------------------------	
	lea ScriptedEventDay04Start,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	rts

