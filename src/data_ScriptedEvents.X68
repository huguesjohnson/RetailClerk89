ScriptedEventDay00Right:
	dc.w	$0003	; NPC1 (Dani)
	; --------------------------------------------------------------------------
	; first dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene00Day00Event0D0
	; --------------------------------------------------------------------------
	; move right until sprite hits the 16-bit game rack
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0018
	; --------------------------------------------------------------------------
	; move up to the wall of 8-bit games
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0078
	; --------------------------------------------------------------------------
	; move down to be on same X-axis as the shopper (NPC2)
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$007D
	; --------------------------------------------------------------------------
	; move left to face the shopper (NPC2)
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	$00B0
	; --------------------------------------------------------------------------
	; switch to the shopper (NPC2)
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2
	; --------------------------------------------------------------------------
	; have them face right
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	; --------------------------------------------------------------------------
	; show the dialog between Dani and the shopper
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene00Day00Event0D1
	; --------------------------------------------------------------------------
	; move the shopper (NPC2) around Dani
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0018
	dc.w	DIRECTION_RIGHT
	dc.w	$0078
	; --------------------------------------------------------------------------
	; move the shopper (NPC2) up to the register
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0060
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay00Exit:
	dc.w	$0004	; NPC2
	dc.w	DIRECTION_DOWN	; move them offscreen
	dc.w	$0190
	dc.w	DIRECTION_LEFT	; move them into hidden space
	dc.w	$0048
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1
	dc.w	DIRECTION_RIGHT
	dc.w	$0060
	dc.w	DIRECTION_UP
	dc.w	$0020
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDaniScene00Day00Exit0
	dc.w	DIRECTION_DOWN	; start moving them offscren
	dc.w	$0010
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDaniScene00Day00Exit1
	dc.w	DIRECTION_DOWN	; continue moving them offscren
	dc.w	$0010
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDaniScene00Day00Exit2
	dc.w	DIRECTION_DOWN	; finish moving them offscren
	dc.w	$0080
	dc.w	DIRECTION_LEFT	; move them into hidden space
	dc.w	$0048
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_LEFT	; move them out of hidden space
	dc.w	$0040
	dc.w	DIRECTION_UP	; move them onto the screen
	dc.w	$0100
	dc.w	DIRECTION_DOWN	; move down 1 to show the front of the sprite
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextGreenbergScene00Day00Exit
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Start:
	; --------------------------------------------------------------------------
	; move player to be on same X-axis as the NPC0
	; --------------------------------------------------------------------------
	dc.w	$0001	; player (Dani)
	dc.w	DIRECTION_UP
	dc.w	$003E
	; --------------------------------------------------------------------------
	; have NPC0 walk toward the player
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_RIGHT
	dc.w	$0020
	; --------------------------------------------------------------------------
	; have have the player face NPC0
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player (Dani)
	dc.w	DIRECTION_LEFT
	dc.w	$0000
	; --------------------------------------------------------------------------
	; first dialog betweek NPC0 and player
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Intro00
	; --------------------------------------------------------------------------
	; more dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Intro01
	; --------------------------------------------------------------------------
	; player starts walking away
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0020
	; --------------------------------------------------------------------------
	; more dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Intro02
	; --------------------------------------------------------------------------
	; player faces NPC0 for the last dialog
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Intro03
	dc.w	SCRIPTED_EVENT_END


	if	_DEBUG_

TestScriptedEventSceneChange:
	dc.w	$0001	; player (Dani)
	dc.w	DIRECTION_UP
	dc.w	$003E
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DB
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_VB
	dc.w	DIRECTION_DOWN
	dc.w	$0020	
	dc.w	DIRECTION_UP
	dc.w	$0020	
	dc.w	SCRIPTED_EVENT_END

	endif

