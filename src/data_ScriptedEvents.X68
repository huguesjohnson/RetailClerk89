ScriptedEventDay0Right:
	dc.w	$0002	; NPC0
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0Day0Event0D0
	dc.w	DIRECTION_RIGHT
	dc.w	$0018
	dc.w	DIRECTION_UP
	dc.w	$0078
	dc.w	DIRECTION_DOWN
	dc.w	$007D
	dc.w	DIRECTION_LEFT
	dc.w	$00F0
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0Day0Event0D1
	dc.w	DIRECTION_LEFT
	dc.w	$0008
	dc.w	DIRECTION_DOWN
	dc.w	$0018
	dc.w	DIRECTION_RIGHT
	dc.w	$0078
	dc.w	DIRECTION_UP
	dc.w	$0060
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay0Left:
	dc.w	$0002	; NPC0
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0Day0Event0D0
	dc.w	DIRECTION_LEFT
	dc.w	$0018
	dc.w	DIRECTION_UP
	dc.w	$0020
	dc.w	DIRECTION_LEFT
	dc.w	$0070
	dc.w	DIRECTION_UP
	dc.w	$0040
	dc.w	DIRECTION_LEFT
	dc.w	$0050
	dc.w	DIRECTION_UP
	dc.w	$0030
	dc.w	DIRECTION_RIGHT
	dc.w	$0052
	dc.w	DIRECTION_DOWN
	dc.w	$007D
	dc.w	DIRECTION_LEFT
	dc.w	$00A0
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0Day0Event0D1
	dc.w	DIRECTION_LEFT
	dc.w	$0008
	dc.w	DIRECTION_DOWN
	dc.w	$0018
	dc.w	DIRECTION_RIGHT
	dc.w	$0078
	dc.w	DIRECTION_UP
	dc.w	$0060
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay0Exit:
	dc.w	$0003	; NPC1
	dc.w	DIRECTION_DOWN	; move them offscreen
	dc.w	$0190
	dc.w	DIRECTION_LEFT	; move them into hidden space
	dc.w	$0048
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_RIGHT
	dc.w	$0060
	dc.w	DIRECTION_UP
	dc.w	$0020
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDaniScene0Day0Exit0
	dc.w	DIRECTION_DOWN	; start moving them offscren
	dc.w	$0010
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDaniScene0Day0Exit1
	dc.w	DIRECTION_DOWN	; continue moving them offscren
	dc.w	$0010
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDaniScene0Day0Exit2
	dc.w	DIRECTION_DOWN	; finish moving them offscren
	dc.w	$0080
	dc.w	DIRECTION_LEFT	; move them into hidden space
	dc.w	$0048
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC3
	dc.w	DIRECTION_LEFT	; move them out of hidden space
	dc.w	$0040
	dc.w	DIRECTION_UP	; move them onto the screen
	dc.w	$0100
	dc.w	DIRECTION_DOWN	; move down 1 to show the front of the sprite
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextGreenbergScene0Day0Exit
	dc.w	SCRIPTED_EVENT_END

