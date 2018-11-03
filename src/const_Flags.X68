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

;-------------------------------------------------------------------------------
; dialog state flags
;-------------------------------------------------------------------------------
; high word of MEM_DIALOG_FLAGS is used to track the state
DIALOG_FLAG_OPTION_PERSIST_SELECTOR=$14	; don't hide the selector after closing
DIALOG_FLAG_STYLE_ITEM_MENU=$15	; item menu dialog
DIALOG_FLAG_STYLE_MENU=$16	; overworld menu style dialog
DIALOG_FLAG_STYLE_TEXT_4CHOICE=$17	; dialog has text with selection at the end
DIALOG_FLAG_STYLE_TEXT_2CHOICE=$18	; dialog has text with selection at the end
DIALOG_FLAG_STYLE_SIMPLE_TEXT=$19	; dialog is a simple text dialog
DIALOG_FLAG_SELECTION_WAIT=$1A	; waiting for the player to make a selection 
DIALOG_FLAG_TEXT_OPENING=$1B	; dialog is opening
DIALOG_FLAG_TEXT_DRAWING=$1C	; dialog text is drawing
DIALOG_FLAG_TEXT_OPEN=$1D	; dialog is open
DIALOG_FLAG_TEXT_NEW_PAGE=$1E	; dialog text has another page
DIALOG_FLAG_TEXT_CLOSING=$1F	; dialog is closing

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
;EVENT_FLAG_DAY01_SUB02_COMPLETE=$2	; sub-quest 2 in day 1 complete

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


