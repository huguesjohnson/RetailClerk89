;-------------------------------------------------------------------------------
; day 04 - scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
Day04Scene00Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene00Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day04Scene00Action01NPC	; branch to text for the NPC
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DB,d6	; test target
	beq.s	Day04Scene00Action01DB	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene00Action01DB:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene00Action01DBDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene00Action01DBDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextDBDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene00Action01DBDefault:
	lea	DialogTextDBDay04,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene00Action01NPC:
	lea	DialogTextGreenbergDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene00Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day04Scene00Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene00Action02NPC:
	lea	DialogTextGreenbergDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene00Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 01 (SCENE_ID_WWHALL)
;-------------------------------------------------------------------------------
Day04Scene01Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene01Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene01Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene01Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 02 (SCENE_ID_WEHALL)
;-------------------------------------------------------------------------------
Day04Scene02Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene02Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene02Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene02Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
Day04Scene03Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene03Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day04Scene03Action01NPC	; branch to display text
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day04Scene03Action01NPCFCBCamping	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action01NPCFCBCamping:
	lea	DialogTextDay04Scene03TalkNPC,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action01NPC:
	; test state of sub-quest for the day
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
	; is the sub-quest complete?
	btst.l	#EVENT_FLAG_DAY04_SUB_COMPLETE,d7	; test complete flag
	bne.s	Day04Scene03Action01NPCComplete	; branch if set
	; has an NPC joined the sub-quest?
	btst.l	#EVENT_FLAG_DAY04_SUB_NPCFOUND,d7	; test flag
	bne.s	Day04Scene03Action01ChooseEnvelope	; branch if set
	; is the find gift part started?
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test flag
	bne.s	Day04Scene03Action01NPCSubStartedNotCompleteNPC	; branch
	; not complete & no NPC - test if started
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test started flag
	bne.s	Day04Scene03Action01NPCSubStartedNotCompleteNoNPC	; branch        
	; none of the flags are set -> start the sub-quest
Day04Scene03Action01NPCSubNotStarted:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; set text choice flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDay04Scene03SubNotStarted,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action01NPCSubStartedNotCompleteNoNPC:
	lea	DialogTextDay04Scene03SubNotStartedR0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action01NPCSubStartedNotCompleteNPC:
	lea	DialogTextDay04Scene03SubStarted0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action01ChooseEnvelope:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7	; set text choice flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDay04Scene03SubChoose,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action01NPCComplete:
	lea	DialogTextDay04Scene03SubComplete,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day04Scene03Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action02NPC:
	lea	DialogTextNPCCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	;---------------------------------------------------------------------------
	; there are 3 possible times a response can be reached in day04
	; 1) Start of sub-quest (EVENT_FLAG_DAY04_SUB_STARTED = 0)
	; 2) Choose envelope (EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED = 0)
	; 3) Give item (EVENT_FLAG_DAY04_SUB_GIFT_GIVEN = 0)
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	; test started flag
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test started flag
	beq.s	Day04Scene03Action03ChooseStartSub	; branch if not set
	; test NPC added flag
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test started flag
	beq.s	Day04Scene03Action03ChooseEnvelope	; branch if not set
	; must be the 3rd option
Day04Scene03Action03GiveGift:
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day04Scene03Action03GiveGiftR1	; branch if 1
Day04Scene03Action03GiveGiftR0:
	; update flags
	bset.l	#EVENT_FLAG_DAY04_SUB_GIFT_GIVEN,d7	; set started flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	
	;---------------------------------------------------------------------------
	; TODO - "good gift" logic goes here
	;---------------------------------------------------------------------------

	; remove the item from the player's inventory	
	move.w	(MEM_ACTIVE_ITEM),d7	; copy object ID to d7
	bsr.w	RemoveItem	; remove the item
	; show the response text
	lea	DialogTextDay04Scene03SubStartedGiveR0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action03GiveGiftR1:
	; show the response text
	lea	DialogTextDay04Scene03SubStarted0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action03ChooseStartSub:
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day04Scene03Action03ChooseStartSubR1	; branch if 1
Day04Scene03Action03ChooseStartSubR0:
	; update flags
	bset.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; set started flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; show the response text
	lea	DialogTextDay04Scene03SubNotStartedR0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action03ChooseStartSubR1:
	lea	DialogTextDay04Scene03SubNotStartedR1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action03ChooseEnvelope:
	; update flags
	bset.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; set started flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day04Scene03Action03ChooseEnvelopeR1	; branch if 1
Day04Scene03Action03ChooseEnvelopeR0:
	; add item to the player's inventory
	move.w	#OBJ_ITEM_ENVELOPE1,d7
	bsr.w	AddItemOverwrite
	; show message
	lea	DialogTextDay04Scene03SubChoose0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene03Action03ChooseEnvelopeR1:
	; add item to the player's inventory
	move.w	#OBJ_ITEM_ENVELOPE2,d7
	bsr.w	AddItemOverwrite
	; show message
	lea	DialogTextDay04Scene03SubChoose1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 04 (SCENE_ID_SHALL)
;-------------------------------------------------------------------------------
Day04Scene04Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene04Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene04Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene04Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 05 (SCENE_ID_PARKINGLOT)
;-------------------------------------------------------------------------------
Day04Scene05Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts

Day04Scene05Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day04Scene05Action01NPCDani	; branch
	cmpi.w	#OBJ_SCENE_DANICAR,d6	; test target
	beq.s	Day04Scene05DaniCarLookUse	; same action for look and use
	; default action	
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay04Scene05Action01
Day04Scene05Action01NPCDani:
	lea	DialogTextDaniScene05Day04,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay04Scene05Action01:
	rts

Day04Scene05DaniCarLookUse:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDaniCarDayEnd,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day04Scene05Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day04Scene05Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.w	Day04End	; branch to day end
	; else exit
	lea	DialogTextDaniCarGameEndR0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 06 (SCENE_ID_EWHALL)
;-------------------------------------------------------------------------------
Day04Scene06Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene06Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene06Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene06Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 07 (SCENE_ID_EEHALL)
;-------------------------------------------------------------------------------
Day04Scene07Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene07Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene07Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene07Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 08 (SCENE_ID_DENIMCOUNTRY)
;-------------------------------------------------------------------------------
Day04Scene08Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene08Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day04Scene08Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene08Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene08Action01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene08Action01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextDenimCountryStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene08Action01NPCDefault:
	lea	DialogTextDenimCountryStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene08Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day04Scene08Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene08Action02NPC:
	lea	DialogTextNPCDenimCountryStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene08Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 09 (SCENE_ID_CHECKERS)
;-------------------------------------------------------------------------------
Day04Scene09Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene09Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day04Scene09Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene09Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene09Action01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene09Action01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextCheckersStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene09Action01NPCDefault:
	lea	DialogTextCheckersStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene09Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day04Scene09Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene09Action02NPC:
	lea	DialogTextNPCCheckersStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene09Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 0A (SCENE_ID_TLODGE)
;-------------------------------------------------------------------------------
Day04Scene0AAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene0AAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day04Scene0AAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0AAction01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene0AAction01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene0AAction01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextCheckersStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0AAction01NPCDefault:
	lea	DialogTextTLodgeStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0AAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day04Scene0AAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0AAction02NPC:
	lea	DialogTextNPCTLodgeStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0AAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 0B (SCENE_ID_CAVERN)
;-------------------------------------------------------------------------------
Day04Scene0BAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene0BAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day04Scene0BAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0BAction01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene0BAction01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene0BAction01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextTLodgeStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0BAction01NPCDefault:
	lea	DialogTextCavernStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0BAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day04Scene0BAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0BAction02NPC:
	lea	DialogTextNPCCavernStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0BAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 0C (SCENE_ID_SVIDEO)
;-------------------------------------------------------------------------------
Day04Scene0CAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene0CAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day04Scene0CAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0CAction01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene0CAction01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene0CAction01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextSVideoStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0CAction01NPCDefault:
	lea	DialogTextSVideoStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0CAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day04Scene0CAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0CAction02NPC:
	lea	DialogTextNPCSVideoStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0CAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 0D (SCENE_ID_WORKSHOP)
;-------------------------------------------------------------------------------
Day04Scene0DAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene0DAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day04Scene0DAction01NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day04Scene0DAction01NPC1	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0DAction01NPC0:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene0DAction01NPC0Default	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene0DAction01NPC0Default	; npc found, branch
	; use text for sub-quest
	lea	DialogTextWorkshopStaff0Day04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0DAction01NPC0Default:
	lea	DialogTextWorkshopStaff0DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0DAction01NPC1:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene0DAction01NPC1Default	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene0DAction01NPC1Default	; npc found, branch
	; use text for sub-quest
	lea	DialogTextWorkshopStaff1Day04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0DAction01NPC1Default:
	lea	DialogTextWorkshopStaff1DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0DAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day04Scene0DAction02NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day04Scene0DAction02NPC1	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0DAction02NPC0:
	lea	DialogTextNPCWorkshopStaff0DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0DAction02NPC1:
	lea	DialogTextNPCWorkshopStaff1DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0DAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 0E (SCENE_ID_NSHACK)
;-------------------------------------------------------------------------------
Day04Scene0EAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene0EAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day04Scene0EAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0EAction01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene0EAction01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene0EAction01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextNShackStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0EAction01NPCDefault:
	lea	DialogTextNShackStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0EAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day04Scene0EAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0EAction02NPC:
	lea	DialogTextNPCNShackStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0EAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 0F (SCENE_ID_POGODAWG)
;-------------------------------------------------------------------------------
Day04Scene0FAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene0FAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day04Scene0FAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0FAction01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene0FAction01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene0FAction01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextPogoDawgStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0FAction01NPCDefault:
	lea	DialogTextPogoDawgStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0FAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day04Scene0FAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0FAction02NPC:
	lea	DialogTextNPCPogoDawgStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene0FAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 10 (SCENE_ID_CPLANET)
;-------------------------------------------------------------------------------
Day04Scene10Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene10Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day04Scene10Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene10Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene10Action01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene10Action01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextCPlanetStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene10Action01NPCDefault:
	lea	DialogTextCPlanetStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene10Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day04Scene10Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene10Action02NPC:
	lea	DialogTextNPCCPlanetStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene10Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 11 (SCENE_ID_CNOW)
;-------------------------------------------------------------------------------
Day04Scene11Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene11Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day04Scene11Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene11Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	DialogTextCNowStaffDefaultTalk	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	DialogTextCNowStaffDefaultTalk	; npc found, branch
	; use text for sub-quest
	lea	DialogTextCPlanetStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene11Action01NPCDefault:
	lea	DialogTextCNowStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene11Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day04Scene11Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene11Action02NPC:
	lea	DialogTextNPCCNowStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene11Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 12 (SCENE_ID_TBOOKS)
;-------------------------------------------------------------------------------
Day04Scene12Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene12Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day04Scene12Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene12Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene12Action01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene12Action01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextTBooksStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene12Action01NPCDefault:
	lea	DialogTextTBooksStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene12Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day04Scene12Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene12Action02NPC:
	lea	DialogTextNPCTBooksStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene12Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 13 (SCENE_ID_FCBCHECKOUT)
;-------------------------------------------------------------------------------
Day04Scene13Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene13Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day04Scene13Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene13Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene13Action01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene13Action01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextFCBCheckoutStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene13Action01NPCDefault:
	lea	DialogTextFCBCheckoutStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene13Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day04Scene13Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene13Action02NPC:
	lea	DialogTextNPCFCBCheckoutStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene13Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 14 (SCENE_ID_FCBFIREARMS)
;-------------------------------------------------------------------------------
Day04Scene14Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene14Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day04Scene14Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene14Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene14Action01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene14Action01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextFCBFirearmsStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene14Action01NPCDefault:
	lea	DialogTextFCBFirearmsStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene14Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day04Scene14Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene14Action02NPC:
	lea	DialogTextNPCFCBFirearmsStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene14Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 15 (SCENE_ID_FCBFISHING)
;-------------------------------------------------------------------------------
Day04Scene15Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene15Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day04Scene15Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene15Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	DialogTextFCBFishingStaffDefaultTalk	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	DialogTextFCBFishingStaffDefaultTalk	; npc found, branch
	; use text for sub-quest
	lea	DialogTextFCBFishingStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene15Action01NPCDefault:
	lea	DialogTextFCBFishingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene15Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day04Scene15Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene15Action02NPC:
	lea	DialogTextNPCFCBFishingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene15Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 16 (SCENE_ID_FCBCAMPING)
;-------------------------------------------------------------------------------
Day04Scene16Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene16Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day04Scene16Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene16Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene16Action01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene16Action01NPCDefault	; npc found, branch
	; update game state
	bset.l	#EVENT_FLAG_DAY04_SUB_NPCFOUND,d7	; set npc found flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags
	; update NPC locations
	move.l	#$00000000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$04120000,(MEM_NPC_LOCATION_CENTER)
	; launch scripted event for sub-quest
	lea ScriptedEventDay04MoveNPC,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextFCBCampingStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene16Action01NPCDefault:
	lea	DialogTextFCBCampingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene16Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day04Scene16Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene16Action02NPC:
	lea	DialogTextNPCFCBCampingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene16Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 04 - scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
Day04Scene17Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day04Scene17Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day04Scene17Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene17Action01NPC:
	; check if in the sub-quest to find an NPC npc the secret santa exchange
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags to d7
	btst.l	#EVENT_FLAG_DAY04_SUB_STARTED,d7	; test if stated
	beq.s	Day04Scene17Action01NPCDefault	; not started, branch
	btst.l	#EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED,d7	; test if npc found
	bne.s	Day04Scene17Action01NPCDefault	; npc found, branch
	; use text for sub-quest
	lea	DialogTextSouthCenterStaffDay04SubFindNPC,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene17Action01NPCDefault:
	lea	DialogTextSouthCenterStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene17Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day04Scene17Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene17Action02NPC:
	lea	DialogTextNPCSouthCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day04Scene17Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; end day 04
;-------------------------------------------------------------------------------
Day04End:
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
	move.w	#$0005,(MEM_DAY)	; move to day 05
	move.w	#OBJECTIVE_D5_O0,(MEM_OBJECTIVE)	; update objective
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
	lea	SceneIntroDay05,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade-in
	;---------------------------------------------------------------------------	
	; set player sprite position
	;---------------------------------------------------------------------------	
	move.w	#SPRITE_PLAYER_INIT_X,(MEM_PLAYER_SPRITE_X)	; set player sprite x
	move.w	#SPRITE_PLAYER_INIT_Y,(MEM_PLAYER_SPRITE_Y)	; set player sprite y
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; set direction
	;---------------------------------------------------------------------------	
	; queue the scripted event that starts day 5
	;---------------------------------------------------------------------------	
;	lea ScriptedEventDay01Start,a6	; point a6 to event to load
;	bsr.w QueueScriptedEvent	; queue the event
	rts

