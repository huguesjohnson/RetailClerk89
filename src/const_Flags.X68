;-------------------------------------------------------------------------------
; game state flags
;-------------------------------------------------------------------------------
STATE_FLAG_VBLANK=$00	; vblank flag
STATE_FLAG_PAUSED=$01	; game is paused
STATE_FLAG_EXPLORING=$02	; player is controlling the sprite on the map
STATE_FLAG_DIALOG=$03	; player is interacting with a dialog
STATE_FLAG_ACTION=$04	; there is an action queued
STATE_FLAG_SCRIPTED_EVENT=$05	; a scripted event is running
STATE_FLAG_TITLE_SCREEN=$06	; title screen is displaying
STATE_FLAG_EXITS_BLOCKED=$07	; blocks sprite from leaving scene
STATE_FLAG_END_SCREEN=$08	; end screen is displaying
STATE_FLAG_INTRO_SCREEN=$09	; day intro screen is displaying
STATE_FLAG_STATUS_SCREEN=$0A	; status screen is displaying
STATE_FLAG_MALL_CLOSED=$0B	; mall is closed for the night
	if	_DEBUG_
STATE_FLAG_DEBUG_MENU=$0F	; debug menu is displaying
	endif

;-------------------------------------------------------------------------------
; dialog state flags
;-------------------------------------------------------------------------------
; high word of MEM_DIALOG_FLAGS is used to track the state
DIALOG_FLAG_OPTION_PERSIST_SELECTOR=$12	; don't hide the selector after closing
DIALOG_FLAG_STYLE_TITLED=$13	; show dialog with title
DIALOG_FLAG_STYLE_ITEM_MENU=$14	; item menu dialog
DIALOG_FLAG_STYLE_MENU=$15	; overworld menu style dialog
DIALOG_FLAG_STYLE_TEXT_4CHOICE=$16	; dialog has text with selection at the end
DIALOG_FLAG_STYLE_TEXT_2CHOICE=$17	; dialog has text with selection at the end
DIALOG_FLAG_STYLE_SIMPLE_TEXT=$18	; dialog is a simple text dialog
DIALOG_FLAG_SELECTION_WAIT=$19	; waiting for the player to make a selection 
DIALOG_FLAG_TEXT_OPENING=$1A	; dialog is opening
DIALOG_FLAG_TEXT_TITLE_DRAWING=$1B	; dialog title text is drawing
DIALOG_FLAG_TEXT_DRAWING=$1C	; dialog text is drawing
DIALOG_FLAG_TEXT_OPEN=$1D	; dialog is open
DIALOG_FLAG_TEXT_NEW_PAGE=$1E	; dialog text has another page
DIALOG_FLAG_TEXT_CLOSING=$1F	; dialog is closing

;-------------------------------------------------------------------------------
; global event flags - used to track events across days 
;-------------------------------------------------------------------------------
GLOBAL_FLAG_PDAWG_CUSTOMER0=$0	; customer 1 of 4 referred
GLOBAL_FLAG_PDAWG_CUSTOMER1=$1	; customer 2 of 4 referred
GLOBAL_FLAG_PDAWG_CUSTOMER2=$2	; customer 3 of 4 referred
GLOBAL_FLAG_PDAWG_CUSTOMER3=$3	; customer 4 of 4 referred
GLOBAL_FLAG_JKEY_CPLANET=$4	; npc jordan has the cplanet key
GLOBAL_FLAG_JKEY_SVIDEO=$5	; npc jordan has the svideo key
GLOBAL_FLAG_DANI_GIFT=$6	; Dani has received the secret shopper gift

;-------------------------------------------------------------------------------
; day event flags - used to track events in the current day 
;-------------------------------------------------------------------------------
EVENT_FLAG_DAY00_NPC00_DIALOG00=$1	; 1st dialog with NPC0
; in the 1st dialog with NPC1 the player selection affects the 2nd dialog
EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE00=$2	; selected option 0
EVENT_FLAG_DAY00_NPC01_DIALOG00_RESPONSE01=$3	; selected option 1
EVENT_FLAG_DAY00_NPC01_DIALOG01=$4	; 2nd dialog with NPC1
EVENT_FLAG_DAY00_NPC01_GIVE00=$5	; 1st time player gives an item to NPC1
EVENT_FLAG_DAY00_NPC01_GIVE01=$6	; 2nd time player gives an item to NPC1
EVENT_FLAG_DAY00_NPC01_GIVE02=$7		; 3rd time player gives an item to NPC1
EVENT_FLAG_DAY00_EVENT00_COMPLETE=$8	; 1st scripted event complete
EVENT_FLAG_DAY00_EVENT01_COMPLETE=$9	; 2nd scripted event complete
EVENT_FLAG_DAY01_SUB00_COMPLETE=$0	; sub-quest 0 in day 1 complete
EVENT_FLAG_DAY01_SUB01_COMPLETE=$1	; sub-quest 1 in day 1 complete
EVENT_FLAG_DAY02_SUB00_COMPLETE=$0	; sub-quest 0 in day 2 complete
EVENT_FLAG_DAY02_SUB01_STARTED=$1	; sub-quest 1 in day 2 complete
EVENT_FLAG_DAY02_SUB01_MID=$2	; sub-quest 1 in day 2 midpoint
EVENT_FLAG_DAY02_SUB01_COMPLETE=$3	; subquests complete
EVENT_FLAG_DAY02_MID_EVENT=$4	; midpoint event complete
EVENT_FLAG_DAY02_SUB02_STARTED=$5	; sub-quest 2 in day 2 started
EVENT_FLAG_DAY02_SUB02_MID=$6	; sub-quest 2 in day 2 midpoint
EVENT_FLAG_DAY02_SUB02_COMPLETE=$7	; sub-quest 2 in day 2 complete
EVENT_FLAG_DAY03_SUB_TLODGE_STARTED=$0	; tlodge sub-quest day 3 started
EVENT_FLAG_DAY03_SUB_TLODGE_COMPLETE=$1	; tlodge sub-quest day 3 complete
EVENT_FLAG_DAY03_SUB_VB_STARTED=$2	; vb sub-quest day 3 started
EVENT_FLAG_DAY03_SUB_VB_COMPLETE=$3	; vb sub-quest day 3 complete
EVENT_FLAG_DAY04_SUB_STARTED=$0	; secret santa sub-quest started
EVENT_FLAG_DAY04_SUB_NPCFOUND=$1	; found npc to join sub-quest
EVENT_FLAG_DAY04_SUB_FINDGIFTSTARTED=$2	; looking for a gift
EVENT_FLAG_DAY04_SUB_TBOOKS_DIALOG=$3	; dialog at tbooks complete
EVENT_FLAG_DAY04_SUB_CHOICE0=$4	; envelope choice 0 was selected
EVENT_FLAG_DAY04_SUB_CHOICE1=$5	; envelope choice 1 was selected
EVENT_FLAG_DAY04_SUB_GIFT_GIVEN=$6	; gift given
EVENT_FLAG_DAY04_SUB_GOOD_GIFT=$7	; whether a good gift was given
EVENT_FLAG_DAY04_SUB_COMPLETE=$8	; secret santa sub-quest complete
EVENT_FLAG_DAY05_EVENT_WEATHER=$0	; heard blizzard forecast
EVENT_FLAG_DAY05_EVENT_LEAVING=$1	; trying to leave the mall
EVENT_FLAG_DAY05_EVENT_TALKDANI=$2	; after dialog with Dani
EVENT_FLAG_DAY05_EVENT_SNOWEDIN=$3	; snowed-in to the mall
EVENT_FLAG_DAY05_SUB_STARTED=$4	; subquest to find items started
EVENT_FLAG_DAY05_SUB_COMPLETE=$5	; subquest to find items complete
EVENT_FLAG_DAY05_CAMP_STARTED=$6	; camping scene started
EVENT_FLAG_DAY05_CAMP_COMPLETE=$7	; camping scene complete

;-------------------------------------------------------------------------------
; mission event flags - used to track progress within sub-quests 
;-------------------------------------------------------------------------------
MISSION_FLAG_DAY01_SUB00_STARTED=$0	; sub-quest started
MISSION_FLAG_DAY01_SUB00_NPC1_D0R0=$1	; player gave response 0 to dialog 0
MISSION_FLAG_DAY01_SUB00_NPC1_D0R1=$2	; player gave response 1 to dialog 0
MISSION_FLAG_DAY01_SUB00_NPC1_DONE=$3	; done interacting with NPC1
MISSION_FLAG_DAY01_SUB00_NPC2_D0=$4	; first dialog with the NPC
MISSION_FLAG_DAY01_SUB00_NPC2_D1=$5	; second dialog with the NPC
MISSION_FLAG_DAY01_SUB00_NPC2_D2=$6	; third dialog with the NPC
MISSION_FLAG_DAY01_SUB00_NPC2_DONE=$7	; done interacting with NPC2
MISSION_FLAG_DAY01_SUB00_NPC3_D0=$8	; first dialog with the NPC3
MISSION_FLAG_DAY01_SUB00_NPC3_D1=$9	; second dialog with the NPC3
MISSION_FLAG_DAY01_SUB00_NPC3_D2=$A	; third dialog with the NPC3
MISSION_FLAG_DAY01_SUB00_NPC3_DONE=$B	; done interacting with NPC3
MISSION_FLAG_DAY01_SUB02_STARTED=$0	; sub-quest started
MISSION_FLAG_DAY01_SUB02_D0=$1	; first dialog complete
MISSION_FLAG_DAY01_SUB02_D1=$2	; second dialog complete
MISSION_FLAG_DAY02_SUB01_D0=$0	; first event dialog complete
MISSION_FLAG_DAY02_SUB01_D1=$1	; second event dialog complete
MISSION_FLAG_DAY02_SUB01_D2=$2	; third event dialog complete
MISSION_FLAG_DAY02_SUB02_D0=$3	; first event dialog complete
MISSION_FLAG_DAY02_SUB02_D1=$4	; second event dialog complete
MISSION_FLAG_DAY02_SUB02_D2=$5	; third event dialog complete
MISSION_FLAG_DAY03_CAMERA1_GET=$0	; found the first camera
MISSION_FLAG_DAY03_CAMERA1_GIVE=$1	; gave the first camera
MISSION_FLAG_DAY03_CAMERA2_GET=$2	; found the second camera
MISSION_FLAG_DAY03_CAMERA2_GIVE=$3	; gave the second camera
MISSION_FLAG_DAY03_CAMERA3_GET=$4	; found the third camera
MISSION_FLAG_DAY03_CAMERA3_GIVE=$5	; gave the third camera
MISSION_FLAG_DAY05_READBOOK=$0	; read the cookbook
MISSION_FLAG_DAY05_FOOD0GET=$1	; found food item 0
MISSION_FLAG_DAY05_FOOD1GET=$2	; found food item 1
MISSION_FLAG_DAY05_FOOD0GIVE=$3	; gave food item 0
MISSION_FLAG_DAY05_FOOD1GIVE=$4	; gave food item 1


