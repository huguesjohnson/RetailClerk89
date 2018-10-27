;-------------------------------------------------------------------------------
; day 01 - scene 00 (SCENE_ID_VB)
;-------------------------------------------------------------------------------
Day01Scene00Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene00Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day01Scene00Action01NPCGreenberg	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DB,d6	; test target
	beq.s	Day01Scene00Action01NPCDB	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene00Action01NPCGreenberg:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	beq.s	Day01Scene00Action01NPCGreenbergDani	; branch to text for Dani
	; otherwise playing as D.B.
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB02_STARTED,d7	; test if flag is set
	bne.w	Day01Scene00Action01NPCGreenbergDefault	; flag is set, branch
	;---------------------------------------------------------------------------
	; start the last mission of day 01
	;---------------------------------------------------------------------------
	bset.l	#MISSION_FLAG_DAY01_SUB02_STARTED,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save mission flags
	; prevent bug if player fills inventory before talking to Greenberg	
	move.w	(MEM_PLAYER_ITEM_COUNT),d6	; copy current item count to d6
	cmpi.w	#MAX_ITEMS,d6	; check if inventory is full
	blt.s	.1	; branch if there is an open inventory slot
	; overwrite first item in inventory
	lea MEM_PLAYER_ITEMS,a6	; point to start of item list
	move.w	#OBJ_ITEM_MYSTERY_PACKAGE,(a6)	; overwrite the first item
	bra.s	Day01Scene00Action01NPCGreenbergSub02Start
.1
	move.w	#OBJ_ITEM_MYSTERY_PACKAGE,d7	; add package to inventory
	bsr.w	AddItem	; add item to inventory
Day01Scene00Action01NPCGreenbergSub02Start:
	lea	DialogTextDay01Sub02Start,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene00Action01NPCGreenbergDefault:
	lea	DialogTextDay01Sub02TalkGreenberg,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene00Action01NPCGreenbergDani:
	lea	DialogTextGreenbergDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene00Action01NPCDB:
	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
	btst.l	#EVENT_FLAG_DAY01_SUB00_COMPLETE,d7	; test flag 
	bne.s	Day01Scene00Action01NPCDBSub00Complete	; flag is set, branch
	bset.l	#EVENT_FLAG_DAY01_SUB00_COMPLETE,d7	; set flag 
	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; save updated flags	
	lea	DialogTextDay01VBDBDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts	; exit
Day01Scene00Action01NPCDBSub00Complete:
	lea	DialogTextDay01VBDBTalk01,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene00Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GREENBERG,d6	; test target
	beq.s	Day01Scene00Action02NPCGreenberg	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_DB,d6	; test target
	beq.s	Day01Scene00Action02NPCDB	; branch to text for the NPC
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	beq.s	Day01Scene00Action02Dani	; use default text for DB
	bsr.w	Scene00DefaultTake	; use scene defaults
	rts	; exit
Day01Scene00Action02Dani:
	; Dani can't take anything from this scene on day 01
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts	; exit
Day01Scene00Action02NPCGreenberg:
	lea	DialogTextGreenbergDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene00Action02NPCDB:
	lea	DialogTextDBDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene00Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 01 (SCENE_ID_WWHALL)
;-------------------------------------------------------------------------------
Day01Scene01Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene01Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene01Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene01Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 02 (SCENE_ID_WEHALL)
;-------------------------------------------------------------------------------
Day01Scene02Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene02Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene02Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene02Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 03 (SCENE_ID_CENTER)
;-------------------------------------------------------------------------------
Day01Scene03Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene03Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day01Scene03Action01NPC	; branch to display text
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene03Action01NPC:
	; setup 4 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	InfoDeskMenu,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene03Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CENTER_STAFF,d6	; test target
	beq.s	Day01Scene03Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene03Action02NPC:
	lea	DialogTextNPCCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene03Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day01Scene03Action03R0	; branch to text for response 0
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day01Scene03Action03R1	; branch to text for response 1
	cmpi.w	#$0002,(MEM_MENU_RESPONSE)	; is the menu selection 2?
	beq.s	Day01Scene03Action03R2	; branch to text for response 2
	; must be response 3 then
	lea	DialogTextInfoDeskDay01R3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene03Action03R0:
	lea	DialogTextInfoDeskDay01R0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene03Action03R1:
	lea	DialogTextInfoDeskDay01R1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene03Action03R2:
	lea	DialogTextInfoDeskDay01R2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 04 (SCENE_ID_SHALL)
;-------------------------------------------------------------------------------
Day01Scene04Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene04Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene04Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene04Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 05 (SCENE_ID_PARKINGLOT)
;-------------------------------------------------------------------------------
Day01Scene05Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts

Day01Scene05Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DANI,d6	; test target
	beq.s	Day01Scene05Action01NPCDani	; branch
	cmpi.w	#OBJ_SCENE_DANICAR,d6	; test target
	beq.s	Day01Scene05DaniCarLookUse	; same action for look and use
	; default action	
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bra.s	ExitDay01Scene05Action01
Day01Scene05Action01NPCDani:
	lea	DialogTextDay01ParkingLot,a6	; load dialog text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
ExitDay01Scene05Action01:
	rts

Day01Scene05DaniCarLookUse:
	; setup 2 choice dialog	
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDaniCarGameEnd,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene05Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene05Action03:	; ACTION_RESPOND
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.w	EndGame	; branch to game end
	; else exit
	lea	DialogTextDaniCarGameEndR0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 06 (SCENE_ID_EWHALL)
;-------------------------------------------------------------------------------
Day01Scene06Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene06Action01:	; ACTION_USE_TALK
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene06Action02:	; ACTION_TAKE_GIVE
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene06Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 07 (SCENE_ID_EEHALL)
;-------------------------------------------------------------------------------
Day01Scene07Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene07Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GUARD0,d6	; test target
	beq.s	Day01Scene07Action01NPC	; branch to display text
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene07Action01NPC:
	lea	DialogTextSecurityGuardDay01,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene07Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_GUARD0,d6	; test target
	beq.s	Day01Scene07Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene07Action02NPC:
	;---------------------------------------------------------------------------
	; test if the item is the mystery package
	;---------------------------------------------------------------------------
	cmpi.w	#OBJ_ITEM_MYSTERY_PACKAGE,(MEM_ACTIVE_ITEM)	; test item
	bne.s	Day01Scene07Action02NPCDefault	; branch if not mystery package
	; update flags
	bset.l	#MISSION_FLAG_DAY01_SUB02_D1,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; remove the item from the player's inventory	
	move.w	#OBJ_ITEM_MYSTERY_PACKAGE,d7	; copy object ID to d7
	bsr.w	RemoveItem	; remove the item
	; show the response message
	lea	DialogTextDay01Sub02D1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene07Action02NPCDefault:
	lea	DialogTextSecurityGuardDay01,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene07Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 08 (SCENE_ID_DENIMCOUNTRY)
;-------------------------------------------------------------------------------
Day01Scene08Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene08Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day01Scene08Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene08Action01NPC:
	cmpi.w	#OBJ_NPC_DB,d6	; test target
	bne.s	Day01Scene08Action01NPCDefault	; branch if not DB
	lea	DialogTextDay01Sub02TalkNPCDCountry,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene08Action01NPCDefault:
	lea	DialogTextDenimCountryStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene08Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_DENIMCOUNTRY_STAFF,d6	; test target
	beq.s	Day01Scene08Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene08Action02NPC:
	lea	DialogTextNPCDenimCountryStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene08Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 09 (SCENE_ID_CHECKERS)
;-------------------------------------------------------------------------------
Day01Scene09Action00:	; ACTION_LOOK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test if this is the shopper
	bne.s	Day01Scene09Action00TestMannequin	; branch if not
	lea	DialogTextMaleShopper00LookDay01,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action00TestMannequin:
	cmpi.w	#OBJ_SCENE_MANNEQUIN,d6	; test target
	bne.s	Day01Scene09Action00TestTMannequin	; not OBJ_SCENE_MANNEQUIN, branch
	bsr.w	Day01Scene09ShowMannequin	; branch to show mannequin routine
	rts	; exit
Day01Scene09Action00TestTMannequin:
	cmpi.w	#OBJ_SCENE_TMANNEQUIN,d6	; test target
	bne.s	Day01Scene09Action00Default	; not OBJ_SCENE_MANNEQUIN, branch
	bsr.w	Day01Scene09ShowMannequin	; branch to show mannequin routine
	rts	; exit
Day01Scene09Action00Default:
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts

Day01Scene09Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_SCENE_REGISTER,d6	; test target
	beq.w	Day01Scene09Action01Register	; branch if register
	cmpi.w	#OBJ_SCENE_MANNEQUIN,d6	; test target
	bne.s	Day01Scene09Action01TestTMannequin	; not OBJ_SCENE_MANNEQUIN, branch
	bsr.w	Day01Scene09ShowMannequin	; branch to show mannequin routine
	rts	; exit
Day01Scene09Action01TestTMannequin:
	cmpi.w	#OBJ_SCENE_TMANNEQUIN,d6	; test target
	bne.s	Day01Scene09Action01TestNPCs	; not OBJ_SCENE_MANNEQUIN, branch
	bsr.w	Day01Scene09ShowMannequin	; branch to show mannequin routine
	rts	; exit
Day01Scene09Action01TestNPCs:
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day01Scene09Action01NPCStaff	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_SECRET_SHOPPER,d6	; test target
	beq.s	Day01Scene09Action01NPCSecretShopperTalk	; branch to NPC
	cmpi.w	#OBJ_NPC_TRENDYGUY,d6	; test target
	beq.w	Day01Scene09Action01NPCTrendyGuyTalk	; branch to NPC
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	beq.w	Day01Scene09Action01NPCMaleShopperTalk	; branch to NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCStaff:
	;---------------------------------------------------------------------------
	; Three scenarios for talking to OBJ_NPC_CHECKERS_STAFF on day 01
	; 1) Playing as Dani - subquest not started
	; 2) Playing as Dani - subquest complete
	; 3) Playing as D.B. - default text
	;---------------------------------------------------------------------------
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	bne.s	Day01Scene09Action01NPCStaffDefaultTalk	; use default text for DB
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy day event flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_DONE,d7	; test if subquest complete
	beq.s	Day01Scene09Action01NPCStaffStartSub00	; flag not set, branch
	lea	DialogTextDay01Sub00NPC0Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts 
Day01Scene09Action01NPCStaffStartSub00:
	; setup 2 choice dialog	to begin subquest
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	DialogTextDay01Sub00Intro,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts	
Day01Scene09Action01NPCStaffDefaultTalk:
	lea	DialogTextCheckersStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene09Action01NPCSecretShopperTalk:
	; setup 2 choice dialog
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	; test flags to determine which text to use
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D2,d7	; test flag
	bne.s	Day01Scene09Action01NPCSecretShopperTalkD2	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D1,d7	; test flag
	bne.s	Day01Scene09Action01NPCSecretShopperTalkD1	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D0,d7	; test flag
	bne.s	Day01Scene09Action01NPCSecretShopperTalkD0	; branch if flag set
	; first dialog
	lea	DialogTextDay01Sub00NPC3D0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCSecretShopperTalkD0:
	lea	DialogTextDay01Sub00NPC3D1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCSecretShopperTalkD1:
	lea	DialogTextDay01Sub00NPC3D2,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCSecretShopperTalkD2:
	lea	DialogTextDay01Sub00NPC3D3,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01Register:
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_DONE,d7	; test flag
	bne.s	Day01Scene09Action01RegisterDefault	; flag is set, branch
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D2,d7	; test flag
	beq.s	Day01Scene09Action01RegisterDefault	; flag is not set, branch
	; update the game state
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC3_DONE,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save flags
	; launch the scripted event
	lea ScriptedEventDay01Sub00NPC3Exit,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextRegisterDay0Use,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT	
	rts
Day01Scene09Action01RegisterDefault:
	bsr.w	ShowDefaultText	; use default text for objects in this scene	
	rts

Day01Scene09Action01NPCTrendyGuyTalk:
	; test flags to determine which text to use
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D2,d7	; test flag
	bne.s	Day01Scene09Action01NPCTrendyGuyTalkD3	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D1,d7	; test flag
	bne.s	Day01Scene09Action01NPCTrendyGuyTalkDefault	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D0,d7	; test flag
	bne.s	Day01Scene09Action01NPCTrendyGuyTalkDefault	; branch if flag set
	; else this is the first dialog with the NPC
	lea	DialogTextDay01Sub00NPC2D0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D0,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	rts
Day01Scene09Action01NPCTrendyGuyTalkDefault:
	lea	DialogTextDay01Sub00NPC2DefaultTalk,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCTrendyGuyTalkD3:
	lea	DialogTextDay01Sub00NPC2D3,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCMaleShopperTalk:
	; setup 2 choice dialog
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d6
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	; test flags to determine which text to use
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC1_D0R1,d7	; test flag
	bne.s	Day01Scene09Action01NPCMaleShopperTalkD2	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC1_D0R0,d7	; test flag
	bne.s	Day01Scene09Action01NPCMaleShopperTalkD1	; branch if flag set
Day01Scene09Action01NPCMaleShopperTalkD0:
	lea	DialogTextDay01Sub00NPC1D0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCMaleShopperTalkD1:
	lea	DialogTextDay01Sub00NPCD1,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCMaleShopperTalkD2:
	lea	DialogTextDay01Sub00NPCD2,a6	; load initial text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene09Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day01Scene09Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action02NPC:
	lea	DialogTextNPCCheckersStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03:	; ACTION_RESPOND
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CHECKERS_STAFF,d6	; test target
	beq.s	Day01Scene09Action03NPCStaff	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_SECRET_SHOPPER,d6	; test target
	beq.s	Day01Scene09Action03NPCSecretShopperRespond	; branch to NPC
	cmpi.w	#OBJ_NPC_TRENDYGUY,d6	; test target
	beq.w	Day01Scene09Action03NPCTrendyGuyRespond	; branch to NPC
	cmpi.w	#OBJ_NPC_MALE_SHOPPER0,d6	; test target
	beq.w	Day01Scene09Action03NPCMaleShopperRespond	; branch to NPC
	cmpi.w	#OBJ_SCENE_MANNEQUIN,d6	; test target
	beq.w	Day01Scene09Action03MannequinRespond	; branch
	cmpi.w	#OBJ_SCENE_TMANNEQUIN,d6	; test target
	beq.w	Day01Scene09Action03TMannequinRespond	; branch
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03NPCStaff:
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	beq.s	Day01Scene09Action03NPCStartEvent	; branch launch scripted event
	; else display declined dialog
	lea	DialogTextDay01Sub00IntroDecline,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03NPCStartEvent:
	; flag that the mission has started
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags to d7
	bset.l	#MISSION_FLAG_DAY01_SUB00_STARTED,d7	;set flag to start mission
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save event flags
	; launch the scripted event
	lea ScriptedEventDay01Sub00Start,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay01Sub00Start00,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene09Action03NPCSecretShopperRespond:
	bsr.w	ResetDialog	; reset the dialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day01Scene09Action03NPCSecretShopperRespond1	; branch if not 0
	; else increment customer feedback score
	addq.w	#$0001,(MEM_CUSTOMER_FEEDBACK_SCORE)
Day01Scene09Action03NPCSecretShopperRespond1:
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	; test flags to determine which text to use
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D2,d7	; test flag
	bne.w	Day01Scene09Action03NPCSecretShopperRespondD3	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D1,d7	; test flag
	bne.s	Day01Scene09Action03NPCSecretShopperRespondD2	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D0,d7	; test flag
	bne.s	Day01Scene09Action03NPCSecretShopperRespondD1	; branch if flag set
	; default
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D0,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save flags
	; initial interaction
Day01Scene09Action03NPCSecretShopperRespondD0:
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D0,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day01Scene09Action03NPCSecretShopperRespondD0R1	; branch if not 0
	lea	DialogTextDay01Sub00NPC3D0R0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03NPCSecretShopperRespondD0R1:
	lea	DialogTextDay01Sub00NPC3D0R1,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03NPCSecretShopperRespondD1:
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D1,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day01Scene09Action03NPCSecretShopperRespondD1R1	; branch if not 0
	lea	DialogTextDay01Sub00NPC3D1R0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03NPCSecretShopperRespondD1R1:
	lea	DialogTextDay01Sub00NPC3D1R1,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03NPCSecretShopperRespondD2:
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC2_D2,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day01Scene09Action03NPCSecretShopperRespondD2R1	; branch if not 0
	lea	DialogTextDay01Sub00NPC3D2R0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03NPCSecretShopperRespondD2R1:
	lea	DialogTextDay01Sub00NPC3D2R1,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03NPCSecretShopperRespondD3:
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC2_DONE,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; queue the scripted event
	lea ScriptedEventDay01Sub00NPC2Exit,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day01Scene09Action03NPCSecretShopperRespondD3R1	; branch if not 0
	lea	DialogTextDay01Sub00NPC3D3R0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03NPCSecretShopperRespondD3R1:
	lea	DialogTextDay01Sub00NPC3D3R1,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts


Day01Scene09Action03NPCTrendyGuyRespond:
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene09Action03NPCMaleShopperRespond:
	bsr.w	ResetDialog	; reset the dialog
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	; test flags to determine which text to use
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC1_D0R1,d7	; test flag
	bne.w	Day01Scene09Action01NPCMaleShopperRespondD2	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC1_D0R0,d7	; test flag
	bne.s	Day01Scene09Action01NPCMaleShopperRespondD1	; branch if flag set
	;---------------------------------------------------------------------------
	; first dialog (D0)
	;---------------------------------------------------------------------------
Day01Scene09Action01NPCMaleShopperRespondD0:
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day01Scene09Action01NPCMaleShopperRespondD0R1	; branch if set
Day01Scene09Action01NPCMaleShopperRespondD0R0:
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC1_D0R1,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save flags
	lea	DialogTextDay01Sub00NPC1D0R0,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCMaleShopperRespondD0R1:
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC1_D0R0,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save flags
	lea	DialogTextDay01Sub00NPC1D0R1,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
	;---------------------------------------------------------------------------
	; dialog branch D1
	;---------------------------------------------------------------------------
Day01Scene09Action01NPCMaleShopperRespondD1:
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC1_DONE,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save flags
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day01Scene09Action01NPCMaleShopperRespondD1R1	; branch if set
Day01Scene09Action01NPCMaleShopperRespondD1R0:
	; queue the scripted event
	lea ScriptedEventDay01Sub00NPC1Exit,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay01Sub00NPC1D1R0,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCMaleShopperRespondD1R1:
	; queue the scripted event
	lea ScriptedEventDay01Sub00NPC1Exit,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay01Sub00NPC1D1R1,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
	;---------------------------------------------------------------------------
	; dialog branch D2
	;---------------------------------------------------------------------------
Day01Scene09Action01NPCMaleShopperRespondD2:
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC1_DONE,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save flags
	cmpi.w	#$0000,(MEM_MENU_RESPONSE)	; is the menu selection 0?
	bne.s	Day01Scene09Action01NPCMaleShopperRespondD2R1	; branch if set
Day01Scene09Action01NPCMaleShopperRespondD2R0:
	; queue the scripted event
	lea ScriptedEventDay01Sub00NPC1Exit,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay01Sub00NPC1D2R0,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action01NPCMaleShopperRespondD2R1:
	; queue the scripted event
	lea ScriptedEventDay01Sub00NPC1Exit,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	lea	DialogTextDay01Sub00NPC1D2R1,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene09Action03MannequinRespond:
	bsr.w	ResetDialog	; reset dialog
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day01Scene09Action03MannequinRespondCancel	; branch if 1
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D1,d7	; test if flag is set
	bne.s	Day01Scene09Action03MannequinRespondSetText	; flag is set, branch
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D1,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save flags
	; queue the scripted event
	lea ScriptedEventDay01Sub00NPC3MoveRight,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
Day01Scene09Action03MannequinRespondSetText:
	lea	DialogTextDay01Sub00NPC2D1,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03MannequinRespondCancel:
	; default text
	lea	MenuMannequinSub00NPC2ShowCancel,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene09Action03TMannequinRespond:
	bsr.w	ResetDialog	; reset dialog
	cmpi.w	#$0001,(MEM_MENU_RESPONSE)	; is the menu selection 1?
	beq.s	Day01Scene09Action03TMannequinRespondCancel	; branch if 1
	; queue the scripted event
	lea ScriptedEventDay01Sub00NPC3MoveCounter,a6	; point a6 to event to load
	bsr.w QueueScriptedEvent	; queue the event
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy event flags
	bset.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D2,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save flags
Day01Scene09Action03TMannequinRespondSetText:
	lea	DialogTextDay01Sub00NPC2D2,a6	; load first text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09Action03TMannequinRespondCancel:
	; default text
	lea	MenuMannequinSub00NPC2ShowCancel,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

Day01Scene09ShowMannequin:
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	; test flags to determine which text to use
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D2,d7	; test flag
	bne.s	Day01Scene09ShowMannequinDefault	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D1,d7	; test flag
	bne.s	Day01Scene09ShowMannequinD1	; branch if flag set
	btst.l	#MISSION_FLAG_DAY01_SUB00_NPC3_D0,d7	; test flag
	bne.s	Day01Scene09ShowMannequinD0	; branch if flag set
	bra.s	Day01Scene09ShowMannequinDefault ; use default handler
Day01Scene09ShowMannequinD1:
	cmpi.w	#$0100,(MEM_PLAYER_SPRITE_X)	; test which side of screen
	ble.s	Day01Scene09ShowMannequinDefault	;	on the right side
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	MenuMannequinSub00NPC2Show,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09ShowMannequinD0:
	cmpi.w	#$0100,(MEM_PLAYER_SPRITE_X)	; test which side of screen
	bge.s	Day01Scene09ShowMannequinDefault	;	on the right side
	move.l	(MEM_DIALOG_FLAGS),d6	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d6	; set text choice flag
	move.l	d6,(MEM_DIALOG_FLAGS)	; save it back
	lea	MenuMannequinSub00NPC2Show,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene09ShowMannequinDefault:
	bsr.w	ShowDefaultText	; use default text
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 0A (SCENE_ID_TLODGE)
;-------------------------------------------------------------------------------
Day01Scene0AAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene0AAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day01Scene0AAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0AAction01NPC:
	lea	DialogTextTLodgeStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0AAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TLODGE_STAFF,d6	; test target
	beq.s	Day01Scene0AAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0AAction02NPC:
	lea	DialogTextNPCTLodgeStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0AAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 0B (SCENE_ID_CAVERN)
;-------------------------------------------------------------------------------
Day01Scene0BAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene0BAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day01Scene0BAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0BAction01NPC:
	lea	DialogTextCavernStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0BAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CAVERN_STAFF,d6	; test target
	beq.s	Day01Scene0BAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0BAction02NPC:
	lea	DialogTextNPCCavernStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0BAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 0C (SCENE_ID_SVIDEO)
;-------------------------------------------------------------------------------
Day01Scene0CAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene0CAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day01Scene0CAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0CAction01NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	beq.s	Day01Scene0CAction01NPCDefault	; branch to default text
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB02_D0,d7	; test if flag is set
	beq.s	Day01Scene0CAction01NPCDefault	; flag is not set, branch
	; otherwise use text after MISSION_FLAG_DAY01_SUB02_D0
	lea	DialogTextDay01Sub02TalkNPCStaffSVideo,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0CAction01NPCDefault:
	lea	DialogTextSVideoStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0CAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SVIDEO_STAFF,d6	; test target
	beq.s	Day01Scene0CAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0CAction02NPC:
	cmpi.w	#PLAYER_SPRITE_DANI,(MEM_PLAYER_SPRITE)	; test main character
	beq.s	Day01Scene0CAction02NPCDefault	; branch to default text
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy mission flags to d7
	btst.l	#MISSION_FLAG_DAY01_SUB02_D0,d7	; test if flag is set
	bne.s	Day01Scene0CAction02NPCDefault	; flag is set, branch
	;---------------------------------------------------------------------------
	; test if the item is the mystery package
	;---------------------------------------------------------------------------
	cmpi.w	#OBJ_ITEM_MYSTERY_PACKAGE,(MEM_ACTIVE_ITEM)	; test item
	bne.s	Day01Scene0CAction02NPCDefault	; branch if not mystery package
	; update flags
	move.l	(MEM_MISSION_EVENT_FLAGS),d7	; copy flags to d7
	bset.l	#MISSION_FLAG_DAY01_SUB02_D0,d7	; set flag
	move.l	d7,(MEM_MISSION_EVENT_FLAGS)	; save updated flags
	; move the night guard back into the map	
	lea MEM_NPC_LOCATIONS,a5	; point a5 to start of NPC location table
	move.w	#SCENE_ID_EEHALL,d7	; copy east-east hall scene ID to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by word size
	adda.l	d7,a5	; move a5 to the address for east-east hall NPCs
	move.l	#$18000000,(a5)	; update NPCs in east-east hall
	; show the response message
	lea	DialogTextDay01Sub02D0,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0CAction02NPCDefault:
	lea	DialogTextNPCSVideoStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0CAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 0D (SCENE_ID_WORKSHOP)
;-------------------------------------------------------------------------------
Day01Scene0DAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene0DAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day01Scene0DAction01NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day01Scene0DAction01NPC1	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0DAction01NPC0:
	lea	DialogTextWorkshopStaff0DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0DAction01NPC1:
	lea	DialogTextWorkshopStaff1DefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0DAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF0,d6	; test target
	beq.s	Day01Scene0DAction02NPC0	; branch to text for the NPC
	cmpi.w	#OBJ_NPC_WORKSHOP_STAFF1,d6	; test target
	beq.s	Day01Scene0DAction02NPC1	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0DAction02NPC0:
	lea	DialogTextNPCWorkshopStaff0DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0DAction02NPC1:
	lea	DialogTextNPCWorkshopStaff1DefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0DAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 0E (SCENE_ID_NSHACK)
;-------------------------------------------------------------------------------
Day01Scene0EAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene0EAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day01Scene0EAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0EAction01NPC:
	lea	DialogTextNShackStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0EAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_NSHACK_STAFF,d6	; test target
	beq.s	Day01Scene0EAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0EAction02NPC:
	lea	DialogTextNPCNShackStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0EAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 0F (SCENE_ID_POGODAWG)
;-------------------------------------------------------------------------------
Day01Scene0FAction00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene0FAction01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day01Scene0FAction01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0FAction01NPC:
	lea	DialogTextPogoDawgStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0FAction02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_POGODAWG_STAFF,d6	; test target
	beq.s	Day01Scene0FAction02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0FAction02NPC:
	lea	DialogTextNPCPogoDawgStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene0FAction03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 10 (SCENE_ID_CPLANET)
;-------------------------------------------------------------------------------
Day01Scene10Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene10Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day01Scene10Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene10Action01NPC:
	lea	DialogTextCPlanetStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene10Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CPLANET_STAFF,d6	; test target
	beq.s	Day01Scene10Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene10Action02NPC:
	lea	DialogTextNPCCPlanetStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene10Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 11 (SCENE_ID_CNOW)
;-------------------------------------------------------------------------------
Day01Scene11Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene11Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day01Scene11Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene11Action01NPC:
	lea	DialogTextCNowStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene11Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_CNOW_STAFF,d6	; test target
	beq.s	Day01Scene11Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene11Action02NPC:
	lea	DialogTextNPCCNowStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene11Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 12 (SCENE_ID_TBOOKS)
;-------------------------------------------------------------------------------
Day01Scene12Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene12Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day01Scene12Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene12Action01NPC:
	lea	DialogTextTBooksStaffDay01Talk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene12Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_TBOOKS_STAFF,d6	; test target
	beq.s	Day01Scene12Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene12Action02NPC:
	lea	DialogTextNPCTBooksStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene12Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 13 (SCENE_ID_FCBCHECKOUT)
;-------------------------------------------------------------------------------
Day01Scene13Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene13Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day01Scene13Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene13Action01NPC:
	lea	DialogTextFCBCheckoutStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene13Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCHECKOUT_STAFF,d6	; test target
	beq.s	Day01Scene13Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene13Action02NPC:
	lea	DialogTextNPCFCBCheckoutStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene13Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 14 (SCENE_ID_FCBFIREARMS)
;-------------------------------------------------------------------------------
Day01Scene14Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene14Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day01Scene14Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene14Action01NPC:
	lea	DialogTextFCBFirearmsStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene14Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFIREARMS_STAFF,d6	; test target
	beq.s	Day01Scene14Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene14Action02NPC:
	lea	DialogTextNPCFCBFirearmsStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene14Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 15 (SCENE_ID_FCBFISHING)
;-------------------------------------------------------------------------------
Day01Scene15Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene15Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day01Scene15Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene15Action01NPC:
	lea	DialogTextFCBFishingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene15Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBFISHING_STAFF,d6	; test target
	beq.s	Day01Scene15Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene15Action02NPC:
	lea	DialogTextNPCFCBFishingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene15Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 16 (SCENE_ID_FCBCAMPING)
;-------------------------------------------------------------------------------
Day01Scene16Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene16Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day01Scene16Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene16Action01NPC:
	lea	DialogTextFCBCampingStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene16Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_FCBCAMPING_STAFF,d6	; test target
	beq.s	Day01Scene16Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene16Action02NPC:
	lea	DialogTextNPCFCBCampingStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene16Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; day 01 - scene 17 (SCENE_ID_SOUTH_CENTER)
;-------------------------------------------------------------------------------
Day01Scene17Action00:	; ACTION_LOOK
	bsr.w	ShowDefaultText	; use default text for objects in this scene
	rts
Day01Scene17Action01:	; ACTION_USE_TALK
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day01Scene17Action01NPC	; branch to text for the NPC
	; default text
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene17Action01NPC:
	lea	DialogTextSouthCenterStaffDefaultTalk,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene17Action02:	; ACTION_TAKE_GIVE
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; copy action target to d6
	cmpi.w	#OBJ_NPC_SOUTH_CENTER_STAFF,d6	; test target
	beq.s	Day01Scene17Action02NPC	; branch to text for the NPC
	; default action
	lea	DialogTextCantTake,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene17Action02NPC:
	lea	DialogTextNPCSouthCenterStaffDefaultGive,a6	; load text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts
Day01Scene17Action03:	; ACTION_RESPOND
	lea	DialogTextNothingHappens,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	rts

;-------------------------------------------------------------------------------
; end day 01
;-------------------------------------------------------------------------------
Day01End:
	bsr.w	EndGame	; end the game
	rts

