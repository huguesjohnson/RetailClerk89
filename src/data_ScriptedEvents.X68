ScriptedEventDay00Right:
	dc.w	$0003	; NPC1 (Dani)
	; --------------------------------------------------------------------------
	; first dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene00Day00Event0D0

	; --------------------------------------------------------------------------
	; move to the wall of 8-bit games
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0010
	dc.w	DIRECTION_UP
	dc.w	$0078
	; --------------------------------------------------------------------------
	; move down to be on same X-axis as the shopper (NPC2)
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0098
	; --------------------------------------------------------------------------
	; move left to face the shopper (NPC2)
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	$00A8
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
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene00Day00Event0D2
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene00Day00Event0D3
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene00Day00Event0D4
	; --------------------------------------------------------------------------
	; move the shopper (NPC2) up to the register
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0078
	dc.w	DIRECTION_UP
	dc.w	$0060
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay00Exit:
	dc.w	$0004	; NPC2
	dc.w	DIRECTION_DOWN	; move them offscreen
	dc.w	$0190
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1
	dc.w	DIRECTION_RIGHT
	dc.w	$0060
	dc.w	DIRECTION_UP
	dc.w	$0030
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
	dc.w	$0060
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_UP	; move them onto the screen
	dc.w	$0086
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
	; first dialog between NPC0 and player
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

ScriptedEventDay01Sub00Start:
	; --------------------------------------------------------------------------
	; NPC 0 needs to move from $012A,$0098 to $0100,$0180
	; --------------------------------------------------------------------------
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_UP
	dc.w	$0004
	dc.w	DIRECTION_RIGHT
	dc.w	$0030
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	dc.w	DIRECTION_LEFT
	dc.w	$0040
	dc.w	DIRECTION_DOWN
	dc.w	$0020
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00Start01
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00Start02
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	; --------------------------------------------------------------------------
	; NPC 1 needs to move from $0100,$0180 to $0180,$011C
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1
	dc.w	DIRECTION_UP
	dc.w	($0180-$011C)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_RIGHT
	dc.w	($0180-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Sub00NPC1Exit0:
	dc.w	$0003	; NPC1
	; --------------------------------------------------------------------------
	; NPC 1 needs to move from $0180,$011C to $0100,$0180 
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($0180-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	($0180-$011C)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; NPC 2 needs to move from $0100,$0180 to $0102,$00C8
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2
	dc.w	DIRECTION_UP
	dc.w	($0180-$00C8)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_RIGHT
	dc.w	($0102-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Sub00NPC1Exit1:
	dc.w	$0003	; NPC1
	; --------------------------------------------------------------------------
	; dialog 
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00NPC1D1R1Dani
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00NPC1D1R1NPC
	; --------------------------------------------------------------------------
	; NPC 1 needs to move from $0180,$011C to $0100,$0180 
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($0180-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	($0180-$011C)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; NPC 2 needs to move from $0100,$0180 to $0102,$00C8
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2
	dc.w	DIRECTION_UP
	dc.w	($0180-$00C8)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_RIGHT
	dc.w	($0102-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Sub00NPC1Exit2:
	dc.w	$0003	; NPC1
	; --------------------------------------------------------------------------
	; dialog 
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00NPC1D2R0Dani
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00NPC1D2R0NPC
	; --------------------------------------------------------------------------
	; NPC 1 needs to move from $0180,$011C to $0100,$0180 
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($0180-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	($0180-$011C)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; NPC 2 needs to move from $0100,$0180 to $0102,$00C8
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2
	dc.w	DIRECTION_UP
	dc.w	($0180-$00C8)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_RIGHT
	dc.w	($0102-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Sub00NPC1Exit3:
	dc.w	$0003	; NPC1
	; --------------------------------------------------------------------------
	; dialog 
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00NPC1D2R1Dani
	; --------------------------------------------------------------------------
	; NPC 1 needs to move from $0180,$011C to $0100,$0180 
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($0180-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	($0180-$011C)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; NPC 2 needs to move from $0100,$0180 to $0102,$00C8
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2
	dc.w	DIRECTION_UP
	dc.w	($0180-$00C8)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_RIGHT
	dc.w	($0102-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Sub00NPC2Exit:
	dc.w	$0004	; NPC2
	; --------------------------------------------------------------------------
	; dialog 
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00NPC3D3NPC
	; --------------------------------------------------------------------------
	; NPC 2 needs to move from $0102,$00C8 to $0100,$0180
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($0102-$0100)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	($0180-$00C8)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; NPC 3 needs to move from $0100,$0180 to $00B8,$010C
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0005	; NPC3
	dc.w	DIRECTION_UP
	dc.w	($0180-$010C)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_LEFT
	dc.w	($0100-$00B8)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Sub00NPC3MoveRight:
	dc.w	$0005	; NPC3
	; --------------------------------------------------------------------------
	; NPC 3 needs to move from $00B8,$010C to $0180,$010C
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	($0180-$00B8)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_UP
	dc.w	SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Sub00NPC3MoveCounter:
	dc.w	$0005	; NPC3
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00NPC2D2NPC
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00NPC2D2Dani
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00NPC2D2NPC2
	; --------------------------------------------------------------------------
	; NPC 3 needs to move from $0180,$010C to $0130,$00CC
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($0180-$0130)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_UP
	dc.w	($010C-$00CC)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Sub00NPC3Exit:
	dc.w	$0005	; NPC3
	; --------------------------------------------------------------------------
	; NPC 3 needs to move from $0130,$00CC to $0130,$0180
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	($0180-$00CC)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; NPC 0 needs to move from $0100,$0180 to $012A,$0098
	; NPC will be lower than $0180 though due to their movement pattern
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_UP
	dc.w	$0100
	dc.w	DIRECTION_RIGHT
	dc.w	$0040
	dc.w	DIRECTION_UP
	dc.w	$0040
	dc.w	DIRECTION_LEFT
	dc.w	$0030
	dc.w	DIRECTION_DOWN
	dc.w	$0004
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Sub00End:
	dc.w	$0001	; player (Dani)
	; --------------------------------------------------------------------------
	; first dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00End00
	; --------------------------------------------------------------------------
	; player moves up
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0040
	; --------------------------------------------------------------------------
	; NPC moves closer to player
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_UP
	dc.w	$0004
	dc.w	DIRECTION_RIGHT
	dc.w	$0030
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	dc.w	DIRECTION_LEFT
	dc.w	$0040
	dc.w	DIRECTION_DOWN
	dc.w	$0020
	; --------------------------------------------------------------------------
	; second dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00End01
	; --------------------------------------------------------------------------
	; player starts to walk away
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player (Dani)
	dc.w	DIRECTION_DOWN
	dc.w	$0010
	; --------------------------------------------------------------------------
	; third dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00End02
	; --------------------------------------------------------------------------
	; player continues walking away
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0010
	; --------------------------------------------------------------------------
	; fourth dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00End03
	dc.w	DIRECTION_DOWN
	dc.w	$0010
	; --------------------------------------------------------------------------
	; player walks off screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0020
	; --------------------------------------------------------------------------
	; fifth dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay01Sub00End04
	; --------------------------------------------------------------------------
	; change scene and end
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$008A
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_DOWN
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_EWHALL
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01ChangePC:
	; --------------------------------------------------------------------------
	; change scene and player sprite
	; --------------------------------------------------------------------------
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	SPRITE_PLAYER_INIT_X
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	SPRITE_PLAYER_INIT_Y
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_DOWN
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DB
	; --------------------------------------------------------------------------
	; switch scenes
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_VB
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01End:
	dc.w	$0003	; npc2 (Dani)
	; move sprite away from register	
	dc.w	DIRECTION_LEFT
	dc.w	($0038)/SPRITE_STEP_PIXELS
	; move sprite toward door	
	dc.w	DIRECTION_DOWN
	dc.w	($005C)/SPRITE_STEP_PIXELS
	; move sprite out of scene
	dc.w	DIRECTION_LEFT
	dc.w	($0028)/SPRITE_STEP_PIXELS
	; move into hidden space to block movement pattern
	dc.w	DIRECTION_DOWN
	dc.w	($0010)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay01Scene12Action01:
	dc.w	$0001	; player (Dani)
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextTBooksStaffDay01Talk1
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextTBooksStaffDay01Talk2
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextTBooksStaffDay01Talk3
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay02Start:
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_UP	; move them onto the screen
	dc.w	$0060
	dc.w	DIRECTION_LEFT	; move left to talk to player
	dc.w	$0030
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_RIGHT	; have the player face the npc
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScriptedEventDay02Start
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_DOWN	; have the NPC face down
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay02ChangePC:
	; --------------------------------------------------------------------------
	; change scene and player sprite
	; --------------------------------------------------------------------------
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	SPRITE_PLAYER_INIT_X
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	SPRITE_PLAYER_INIT_Y
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_DOWN
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DANI
	; --------------------------------------------------------------------------
	; switch scenes
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_DENIMCOUNTRY
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_RIGHT	; have the NPC face right
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay02Transition00
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay02Transition01
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay02Mid:
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move Dani offscreen while screen is blank - change Y only
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0160
	; --------------------------------------------------------------------------
	; switch scenes
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_VB
	; --------------------------------------------------------------------------
	; move Dani onscreen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0040
	; --------------------------------------------------------------------------
	; move shopper to counter
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc1
	dc.w	DIRECTION_LEFT
	dc.w	$0028
	dc.w	DIRECTION_UP
	dc.w	$0020
	; --------------------------------------------------------------------------
	; dialog between shopper and D.B.
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid00
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid02
	; --------------------------------------------------------------------------
	; move Jordan to counter
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; npc2
	dc.w	DIRECTION_RIGHT
	dc.w	$0060
	dc.w	DIRECTION_UP
	dc.w	$0060
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog between Jordan and shopper
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid03
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc1
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid04
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid05
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid06
	; --------------------------------------------------------------------------
	; move shopper offscreen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc1
	dc.w	DIRECTION_DOWN
	dc.w	$0090
	; --------------------------------------------------------------------------
	; move Dani up to counter
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_UP
	dc.w	$0040
	; --------------------------------------------------------------------------
	; dialog between Dani and Jordan
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid07
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; npc2
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid08
	; --------------------------------------------------------------------------
	; move Jordan offscreen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; npc2
	dc.w	DIRECTION_DOWN
	dc.w	$0090
	; --------------------------------------------------------------------------
	; dialog from Dani
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Mid09
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay02Night00:
	dc.w	$0002	; npc0
	; --------------------------------------------------------------------------
	; dialog between Dani and Jordan
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Sub02Mid01
	; --------------------------------------------------------------------------
	; move Jordan offscreen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	$0020
	dc.w	DIRECTION_UP
	dc.w	$008A
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay02Night01:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; move Dani offscreen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	$0060
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	dc.w	DIRECTION_RIGHT
	dc.w	$0030
	dc.w	DIRECTION_DOWN
	dc.w	$0080
	; --------------------------------------------------------------------------
	; dialog from D.B.
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; npc1
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	ScriptedEventDay02Sub02End01
	; --------------------------------------------------------------------------
	; move D.B. offscreen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	$0060
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	dc.w	DIRECTION_RIGHT
	dc.w	$0030
	dc.w	DIRECTION_DOWN
	dc.w	$0080
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change & move player sprite
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DB
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0080
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_WWHALL
	; --------------------------------------------------------------------------
	; move player sprite down a few steps
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_DOWN
	dc.w	$0008
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay03Start:
	; --------------------------------------------------------------------------
	; move Jordan onto the screen
	; --------------------------------------------------------------------------
	dc.w	$0002	; npc0
	dc.w	DIRECTION_LEFT
	dc.w	($01F0-$0108)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; move D.B. onto the screen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_DOWN
	dc.w	($00A5-$0064)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; have the sprites face each other
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; npc0
	dc.w	DIRECTION_UP
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScriptedEventDay03Start
	; --------------------------------------------------------------------------
	; move Jordan off the screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($0180-$0070)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay03ChangePC:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$00BA
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0100
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_UP
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DANI
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_DENIMCOUNTRY
	; --------------------------------------------------------------------------
	; move npc on to the screen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; npc3
	dc.w	DIRECTION_RIGHT
	dc.w	($009E-$0060)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	($0100-$00D8)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_RIGHT
	dc.w	($001E)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog between Dani and npc
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay03ScriptedEventMid01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay03ScriptedEventMid02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay03ScriptedEventMid03
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay03ScriptedEventMid04
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay03ScriptedEventMid05
	; --------------------------------------------------------------------------
	; move npc off the screen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; npc3
	dc.w	DIRECTION_LEFT
	dc.w	($001E)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_UP
	dc.w	($0100-$00D8)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_LEFT
	dc.w	($009E-$0070)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay03SubVBComplete:
	dc.w	$0002	; npc0
	dc.w	DIRECTION_UP
	dc.w	$00A0
	dc.w	DIRECTION_RIGHT
	dc.w	$0060
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay03DayEnd:
	; --------------------------------------------------------------------------
	; move Dani off the screen
	; --------------------------------------------------------------------------
	dc.w	$0001	; player
	dc.w	DIRECTION_RIGHT
	dc.w	($00B4/SPRITE_STEP_PIXELS)
	; --------------------------------------------------------------------------
	; move D.B. off the screen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; npc0
	dc.w	DIRECTION_RIGHT
	dc.w	($00B4/SPRITE_STEP_PIXELS)
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0080
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$00D8
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_RIGHT
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DB
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_CENTER
	; --------------------------------------------------------------------------
	; move player a couple steps and end
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_RIGHT
	dc.w	$0004
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay04Start:
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
	; dialog between NPC0 and player
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScriptedEventDay04Start00
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScriptedEventDay04Start01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScriptedEventDay04Start02
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay04MoveNPC:
	dc.w	$0002	; npc0
	dc.w	DIRECTION_DOWN
	dc.w	$0070
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay04StartSub:
	dc.w	$0003	; npc1
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04Scene03SubStartGift0
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04Scene03SubStartGift1
	; --------------------------------------------------------------------------
	; move npc1 off the screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	($0118-$0070)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay04TBooks:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; change scene & player Y
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_TBOOKS
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0080
	; --------------------------------------------------------------------------
	; move player into the store
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	($0030)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; move npc toward the player
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; npc0
	dc.w	DIRECTION_RIGHT
	dc.w	($00E2-$00A2)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_UP
	dc.w	($0020)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04Scene03SubTBooks0
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04Scene03SubTBooks1
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04Scene03SubTBooks2
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04Scene03SubTBooks3
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04Scene03SubTBooks4
	; --------------------------------------------------------------------------
	; move npc back
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	($0020)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_LEFT
	dc.w	($00D8-$00A2)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; done
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay04FindGiftSVideo:
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextSVideoStaffDay04SubFindGift1
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextSVideoStaffDay04SubFindGift2
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextSVideoStaffDay04SubFindGift3
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextSVideoStaffDay04SubFindGift4
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay04FindGiftCPlanet:
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextCPlanetStaffDay04SubFindGift1
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextCPlanetStaffDay04SubFindGift2
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextCPlanetStaffDay04SubFindGift3
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextCPlanetStaffDay04SubFindGift4
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay04Transition:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0190
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$012A
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_UP
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DB
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_VB
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04ScriptedEventTransition
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay04GoodGift0:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change player X/Y while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0108
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0064
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_WWHALL
	; --------------------------------------------------------------------------
	; move player onto the screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	($00A5-$0064)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; move npc onto the screen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; npc0
	dc.w	DIRECTION_LEFT
	dc.w	($01F0-$0108)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; have the sprites face each other
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04SVideoGoodGift
	; --------------------------------------------------------------------------
	; move npc off the screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	($01F0-$0108)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04SDBGoodGift
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay04GoodGift1:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change player X/Y while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0108
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0064
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_WWHALL
	; --------------------------------------------------------------------------
	; move player onto the screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	($00A5-$0064)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; move npc onto the screen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; npc0
	dc.w	DIRECTION_LEFT
	dc.w	($01F0-$0108)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; have the sprites face each other
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04CPlanetGoodGift
	; --------------------------------------------------------------------------
	; move npc off the screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	($01F0-$0108)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay04SDBGoodGift
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay05Intro:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; move the player sprite toward the counter
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0020
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventIntro00
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay05GoodExcuseToLeave:
	dc.w	$0003	; npc2 (Dani)
	; --------------------------------------------------------------------------
	; move sprite out of the store
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($0038)/SPRITE_STEP_PIXELS
	; move sprite toward door	
	dc.w	DIRECTION_DOWN
	dc.w	($005C)/SPRITE_STEP_PIXELS
	; move sprite out of scene
	dc.w	DIRECTION_LEFT
	dc.w	($0028)/SPRITE_STEP_PIXELS
	; move into hidden space to block movement pattern
	dc.w	DIRECTION_DOWN
	dc.w	($0010)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay05SnowedIn:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move player offscreen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0180
	; --------------------------------------------------------------------------
	; show the blizzard scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_PARKINGLOT_BLIZZARD
	; --------------------------------------------------------------------------
	; used for delay - sprite should be in completely blocked space
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	($0080)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; return to the south hallway
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_SHALL
	; --------------------------------------------------------------------------
	; have the player walk back onto the screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	($0046)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventSnowedIn
	; --------------------------------------------------------------------------
	; move npc off screen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc2
	dc.w	DIRECTION_RIGHT
	dc.w	($0020)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_UP
	dc.w	($00D0)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay05StartSub:
	dc.w	$0003	; npc2 (D.B.)
	; --------------------------------------------------------------------------
	; change scene and player sprite
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0164
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$00B4
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_LEFT
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DANI
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_FCBCHECKOUT
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene13Day05NPC12SnowedIn
	; --------------------------------------------------------------------------
	; move npc (D.B.) into scene
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($01F0-$015E)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub00
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub03
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub04
	; --------------------------------------------------------------------------
	; have player face down for next dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub05
	; --------------------------------------------------------------------------
	; move npc (D.B.) out of scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc2 (D.B.)
	dc.w	DIRECTION_RIGHT
	dc.w	($01F0-$015E)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; have player face left for the rest of the dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub06
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub07
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub08
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventStartSub09
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay05Sub00:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventSub00D1
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventSub00D2
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay05Sub01:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventSub01D1
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventSub01D2
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventSub01D3
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay05Camp:
	dc.w	$0003	; npc2 (D.B.)
	; --------------------------------------------------------------------------
	; move npc (D.B.) into scene
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	($01F0-$015E)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp01
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move player sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$011A
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$00B0
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_DOWN
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_FCBCAMPING
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp03
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp04
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp05
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp06
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp07
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp08
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp09
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp0A
	; --------------------------------------------------------------------------
	; have Jordan face down
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc2 (Jordan)
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp0B
	; --------------------------------------------------------------------------
	; have Jordan face right
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp0C
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp0D
	; --------------------------------------------------------------------------
	; have Jordan pace down and right
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0002
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp0E
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp0F
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp10
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp11
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp12

	; --------------------------------------------------------------------------
	; have Jordan face down
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp13
	; --------------------------------------------------------------------------
	; have Jordan face right
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp14
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp15
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp16
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp17
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp18
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp19A
	; --------------------------------------------------------------------------
	; scene transition would go here
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp19B
	; --------------------------------------------------------------------------
	; scene transition would go here
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp1A
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp1B
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp1C

	; --------------------------------------------------------------------------
	; this would be a good place for another flashback scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp1D


	; --------------------------------------------------------------------------
	; transition to Santa's Workshop scene
	; --------------------------------------------------------------------------
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move player sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_DOWN
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_WORKSHOP
	; --------------------------------------------------------------------------
	; move npc sprite
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc2 (guard)
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp1E
	; --------------------------------------------------------------------------
	; move npc sprite
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; npc1 (Jordan)
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp1F
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp22
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp23
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp24
	; --------------------------------------------------------------------------
	; transition back to camp scene
	; --------------------------------------------------------------------------
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move player sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$011A
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$00B0
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_DOWN
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_FCBCAMPING
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp25
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp26
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp27
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp28
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp29
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp2A
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp2A1
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp2B
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp2C
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp2D
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp2E
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp2F
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp30
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp31
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp32
	; --------------------------------------------------------------------------
	; Dani walks up a few steps
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player (Dani)
	dc.w	DIRECTION_UP
	dc.w	$0005
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move sprite while the screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0164
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$00B4
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
	dc.w	DIRECTION_LEFT
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_FCBCHECKOUT
	; --------------------------------------------------------------------------
	; have D.B. walk in
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc2 (D.B.)
	dc.w	DIRECTION_LEFT
	dc.w	($01F0-$015E)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay05ScriptedEventCamp33
	; --------------------------------------------------------------------------
	; have D.B. walk out
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	($01F0-$015E)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06Start:
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
	; dialog between NPC0 and player
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventIntro00
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventIntro01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventIntro02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventIntro03
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06Plan:
	dc.w	$0001	; player (Dani)
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0080
	; --------------------------------------------------------------------------
	; load scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_NSHACK
	; --------------------------------------------------------------------------
	; move player into the store
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0010
	dc.w	DIRECTION_UP
	dc.w	$0020
	dc.w	DIRECTION_RIGHT
	dc.w	$0030
	; --------------------------------------------------------------------------
	; first dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan00
	; --------------------------------------------------------------------------
	; have NPCs face left
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1 (Jordan)
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2 (D.B.)
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	; --------------------------------------------------------------------------
	; more dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan03
	; --------------------------------------------------------------------------
	; have NPC face up
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0001
	; --------------------------------------------------------------------------
	; more dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan04
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan05
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan06
	; --------------------------------------------------------------------------
	; have NPC face down
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	; --------------------------------------------------------------------------
	; more dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan07
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan08
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan09
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan0A
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan0B
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventPlan0C
	; --------------------------------------------------------------------------
	; walk Dani out of the store
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player (Dani)
	dc.w	DIRECTION_LEFT
	dc.w	$0030
	dc.w	DIRECTION_DOWN
	dc.w	$0020
	dc.w	DIRECTION_LEFT
	dc.w	$0020
	; --------------------------------------------------------------------------
	; walk Jordan out of the store
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1 (Jordan)
	dc.w	DIRECTION_DOWN
	dc.w	$0002
	dc.w	DIRECTION_LEFT
	dc.w	($0100-$0082)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	$0008
	dc.w	DIRECTION_LEFT
	dc.w	$0020
	; --------------------------------------------------------------------------
	; walk DB out of the store
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2 (D.B.)
	dc.w	DIRECTION_DOWN
	dc.w	$0008
	dc.w	DIRECTION_LEFT
	dc.w	($0136-$0082)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	$0008
	dc.w	DIRECTION_LEFT
	dc.w	$0010
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$01C0
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DB
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_SHALL
	; --------------------------------------------------------------------------
	; walk D.B. into the scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player (D.B.)
	dc.w	DIRECTION_LEFT
	dc.w	$0020
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06StartSub00:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Start01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Start02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Start03
	; --------------------------------------------------------------------------
	; have NPC face down
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	; --------------------------------------------------------------------------
	; more dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Start04
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Start05
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Start06
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Start07
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Scene11SubInprogress
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06StartSub00GetItem:
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00GetItem01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00GetItem02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00GetItem03
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00GetItem04
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06StartSub00Complete:
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Complete01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Complete02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Complete03
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Complete04
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06Sub00Complete05
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06StartMission:
	dc.w	$0003	; NPC1 (Jordan)
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0182
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DANI
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_VB
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	$0001	
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub00
	; --------------------------------------------------------------------------
	; walk player into the scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_UP
	dc.w	$0098
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub02
	; --------------------------------------------------------------------------
	; face up
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub03
	; --------------------------------------------------------------------------
	; face down
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub04
	; --------------------------------------------------------------------------
	; pacing
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0006
	dc.w	DIRECTION_UP
	dc.w	$0006
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub05
	; --------------------------------------------------------------------------
	; move npc left and up
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1 (Jordan)
	dc.w	DIRECTION_LEFT
	dc.w	$0018
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub06
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub07
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub08
	; --------------------------------------------------------------------------
	; move player up
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_UP
	dc.w	$0001
	; --------------------------------------------------------------------------
	; last dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventDayStartSub09
	; --------------------------------------------------------------------------
	; move D.B. offscreen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0 (D.B.)
	dc.w	DIRECTION_LEFT
	dc.w	$0060
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	dc.w	DIRECTION_RIGHT
	dc.w	$0030
	dc.w	DIRECTION_DOWN
	dc.w	$0080
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change & move player sprite
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DB
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0080
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_WWHALL
	; --------------------------------------------------------------------------
	; move player sprite down a few steps
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_DOWN
	dc.w	$0008
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06WEHallToCNow:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	($0080-$0020)
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_CNOW
	; --------------------------------------------------------------------------
	; walk player into the scene
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0028
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06FootstepsNorth
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06GuardSomeoneHere
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06NShackTalkNPC:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06InMissionScriptedEvent0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06GuardSomeoneHere
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06InMissionScriptedEvent0002
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06InMissionScriptedEvent0003
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06ExitTLodge:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0180
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_EEHALL
	; --------------------------------------------------------------------------
	; walk player into screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$0060
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventExitTLodge00
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06ExitEEHallGood:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0070
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_SVIDEO
	; --------------------------------------------------------------------------
	; walk player into screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0020
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEndMissionGood00
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEndMissionGood01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEndMissionGood02
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_FCBCAMPING
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_VB
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEndMissionGood03
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEndMissionGood04
	; --------------------------------------------------------------------------
	; walk Dani off screen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1 (Dani)
	dc.w	DIRECTION_LEFT
	dc.w	$0010
	dc.w	DIRECTION_DOWN
	dc.w	$0080
	; --------------------------------------------------------------------------
	; move Jordan offscreen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0 (Jordan)
	dc.w	DIRECTION_LEFT
	dc.w	$0060
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	dc.w	DIRECTION_RIGHT
	dc.w	$0030
	dc.w	DIRECTION_DOWN
	dc.w	$0080
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move player sprite
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0080
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0100
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_WWHALL
	; --------------------------------------------------------------------------
	; move player sprite down a few steps
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_DOWN
	dc.w	$0008
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06ExitEEHallBad:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0180
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_EWHALL
	; --------------------------------------------------------------------------
	; walk player into screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	$0010
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEndMissionBad00
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEndMissionBad01
	; --------------------------------------------------------------------------
	; D.B. runs off the screen
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	dc.w	DIRECTION_LEFT
	dc.w	$0040
	dc.w	DIRECTION_DOWN
	dc.w	$00B0
	; --------------------------------------------------------------------------
	; guard chases after
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0 (guard)
	dc.w	DIRECTION_DOWN
	dc.w	$0080
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_FCBCAMPING
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_VB
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEndMissionBad02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEndMissionBad03
	; --------------------------------------------------------------------------
	; walk Dani off screen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1 (Dani)
	dc.w	DIRECTION_LEFT
	dc.w	$0010
	dc.w	DIRECTION_DOWN
	dc.w	$0080
	; --------------------------------------------------------------------------
	; move Jordan offscreen
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0 (Jordan)
	dc.w	DIRECTION_LEFT
	dc.w	$0060
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	dc.w	DIRECTION_RIGHT
	dc.w	$0030
	dc.w	DIRECTION_DOWN
	dc.w	$0080
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move player sprite
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0080
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0100
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_WWHALL
	; --------------------------------------------------------------------------
	; move player sprite down a few steps
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_DOWN
	dc.w	$0008
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay06Ending0:
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding000
	; --------------------------------------------------------------------------
	; step back
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0038
	dc.w	DIRECTION_UP
	dc.w	$0001
	; --------------------------------------------------------------------------
	; move npc2 into scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2
	dc.w	DIRECTION_DOWN
	dc.w	$0040
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding002
	; --------------------------------------------------------------------------
	; flashback to 1975
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	dc.w	SCRIPTED_EVENT_DRAW_SCENE
	dc.w	SCENE_ID_FLASHBACK_1975
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding003
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding004
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding005
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding006
	; --------------------------------------------------------------------------
	; flashback to 1992
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	dc.w	SCRIPTED_EVENT_DRAW_SCENE
	dc.w	SCENE_ID_FLASHBACK_1992
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding007
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding008
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding009
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding00A
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding00B
	; --------------------------------------------------------------------------
	; flashback to 2000
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	dc.w	SCRIPTED_EVENT_DRAW_SCENE
	dc.w	SCENE_ID_FLASHBACK_2000
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding00C
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding00D
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding00E
	; --------------------------------------------------------------------------
	; flashback to 2014
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	dc.w	SCRIPTED_EVENT_DRAW_SCENE
	dc.w	SCENE_ID_FLASHBACK_2014
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding00F
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding010
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding011
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding012
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding013
	; --------------------------------------------------------------------------
	; return to the hallway
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	dc.w	SCRIPTED_EVENT_DRAW_SCENE
	dc.w	SCENE_ID_CENTER
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding014
	; --------------------------------------------------------------------------
	; walk Dani up to the NPCs
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1
	dc.w	DIRECTION_LEFT
	dc.w	$0060
	dc.w	DIRECTION_UP
	dc.w	$0040
	dc.w	DIRECTION_RIGHT
	dc.w	$0040
	dc.w	DIRECTION_UP
	dc.w	$0008
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding015
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding016
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding017
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding018
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding019
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding01A
	; --------------------------------------------------------------------------
	; move npcs into scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2
	dc.w	DIRECTION_DOWN
	dc.w	$0004
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0005	; NPC3
	dc.w	DIRECTION_UP
	dc.w	($0151-$009C)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; NPC2
	dc.w	DIRECTION_RIGHT
	dc.w	$0040
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding01B
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding01C
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding01D
	; --------------------------------------------------------------------------
	; dialog between main characters
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding01E
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding01F
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding020
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_UP
	dc.w	$0010
	dc.w	DIRECTION_DOWN
	dc.w	$0010
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding021
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding022
	;---------------------------------------------------------------------------
	; walk toward the entrance
	;---------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0001
	dc.w	DIRECTION_UP
	dc.w	$0028
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0118
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0160
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_WORKSHOP
	;---------------------------------------------------------------------------
	; start walking into scene
	;---------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	($0160-$00FA)/SPRITE_STEP_PIXELS
	;---------------------------------------------------------------------------
	; dialog
	;---------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding100
	;---------------------------------------------------------------------------
	; walk up to workshow
	;---------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	$000C/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0080
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$00E4
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DB
	; --------------------------------------------------------------------------
	; load scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_NSHACK
	; --------------------------------------------------------------------------
	; move player into the store
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0010
	dc.w	DIRECTION_UP
	dc.w	$0020
	dc.w	DIRECTION_RIGHT
	dc.w	$0030
	; --------------------------------------------------------------------------
	; have NPC face left
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1 (Dani)
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding101
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding102
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding103
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding104
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding105
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding106
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay06ScriptedEventEnding107
	; --------------------------------------------------------------------------
	; walk Dani out of the store
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_DOWN
	dc.w	$0002
	dc.w	DIRECTION_LEFT
	dc.w	($0100-$0082)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_DOWN
	dc.w	$0020
	dc.w	DIRECTION_LEFT
	dc.w	$0020
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay07ScriptedEventGetPDawgKey:
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextDay07Scene0FGetKey1
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay07ChangePC:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; change the player sprite
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DB
	; --------------------------------------------------------------------------
	; move sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	SPRITE_PLAYER_INIT_X
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	SPRITE_PLAYER_INIT_Y
	; --------------------------------------------------------------------------
	; change scene
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_VB
	dc.w	SCRIPTED_EVENT_END

ScriptedEventDay07Event0:
	dc.w	$0003	; npc 2
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene08Day07ScriptedEvent01
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene08Day07ScriptedEvent02
	; --------------------------------------------------------------------------
	; walk Dani out of the store
	; --------------------------------------------------------------------------
	; move sprite away from register	
	dc.w	DIRECTION_LEFT
	dc.w	($0038)/SPRITE_STEP_PIXELS
	; move sprite toward door	
	dc.w	DIRECTION_DOWN
	dc.w	($005C)/SPRITE_STEP_PIXELS
	; move sprite out of scene
	dc.w	DIRECTION_LEFT
	dc.w	($0028)/SPRITE_STEP_PIXELS
	; move into hidden space to block movement pattern
	dc.w	DIRECTION_DOWN
	dc.w	($0010)/SPRITE_STEP_PIXELS
	dc.w	SCRIPTED_EVENT_END


ScriptedEventDay07Event1:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move player while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$006E
	; --------------------------------------------------------------------------
	; change scene to nshack
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_NSHACK
	; --------------------------------------------------------------------------
	; walk player into scene
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_RIGHT
	dc.w	$0020
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent00
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent01
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move player while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0000
	; -------------------------------------------------------------------------
	; change scene to dcountry
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_DENIMCOUNTRY
	; --------------------------------------------------------------------------
	; move npc toward counter
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; NPC0
	dc.w	DIRECTION_LEFT
	dc.w	$0010
	dc.w	DIRECTION_UP
	dc.w	$0002
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; NPC1
	dc.w	DIRECTION_DOWN
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent02
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent03
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent04
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent05
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK	; fade out
	; --------------------------------------------------------------------------
	; move player while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	($006E+$0020)
	; --------------------------------------------------------------------------
	; change scene to nshack
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_NSHACK
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent06
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent07
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent08
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent09
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent0A
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent0B
	; --------------------------------------------------------------------------
	; move D.B. toward counter and have Dani face him
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_UP
	dc.w	$0020
	dc.w	DIRECTION_RIGHT
	dc.w	$0060
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc2
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent0C
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextScene0EDay07ScriptedEvent0D
	dc.w	SCRIPTED_EVENT_END

ScriptedEventBadEnding:
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_FADE_BLACK
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_ENDING_BAD0
	dc.w	SCRIPTED_EVENT_TIMER
	dc.w	CREDITS_SCREEN_LOOP
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_ENDING_BAD1
	dc.w	SCRIPTED_EVENT_TIMER
	dc.w	CREDITS_SCREEN_LOOP
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_ENDING_BAD2
	dc.w	SCRIPTED_EVENT_TIMER
	dc.w	CREDITS_SCREEN_LOOP
	dc.w	SCRIPTED_EVENT_ENDGAME

ScriptedEventGoodEnding:
	dc.w	$0001	; player
	; --------------------------------------------------------------------------
	; walk the player out of the store
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_LEFT
	dc.w	$0080
	dc.w	DIRECTION_DOWN
	dc.w	$0020
	dc.w	DIRECTION_LEFT
	dc.w	$0030
	; --------------------------------------------------------------------------
	; fade out
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK
	; --------------------------------------------------------------------------
	; switch and move player sprite while screen is blank
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
	dc.w	PLAYER_SPRITE_DANI
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0110
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0180
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_CAVERN
	; --------------------------------------------------------------------------
	; walk player into scene
	; --------------------------------------------------------------------------
	dc.w	DIRECTION_UP
	dc.w	($0180-$00F0)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	; --------------------------------------------------------------------------
	; move npc0 (now D.B.) closer to player
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0002	; npc0
	dc.w	DIRECTION_RIGHT
	dc.w	$0020
	; --------------------------------------------------------------------------
	; dialog
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextGoodEnding00
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextGoodEnding01
	; --------------------------------------------------------------------------
	; move player up to an arcade machine
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0001	; player
	dc.w	DIRECTION_RIGHT
	dc.w	($0176-$0110)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_UP
	dc.w	($00F0-$00E0)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; npc1
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0003	; npc1
	dc.w	DIRECTION_UP
	dc.w	($0188-$00F0)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextGoodEnding02
	dc.w	DIRECTION_RIGHT
	dc.w	($13F-$0114)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_UP
	dc.w	($00F0-$00A0)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; npc2
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0004	; npc2
	dc.w	DIRECTION_UP
	dc.w	($0188-$00F0)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextGoodEnding03
	dc.w	DIRECTION_LEFT
	dc.w	($0106-$0080)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_UP
	dc.w	($00F0-$00A0)/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; npc3
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
	dc.w	$0005	; npc3
	dc.w	DIRECTION_UP
	dc.w	($0188-$00F0)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_LEFT
	dc.w	$0001
	dc.w	SCRIPTED_EVENT_DIALOG
	dc.l	DialogTextGoodEnding04
	dc.w	DIRECTION_DOWN
	dc.w	($130-$00F0)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_RIGHT
	dc.w	($018E-$0114)/SPRITE_STEP_PIXELS
	dc.w	DIRECTION_UP
	dc.w	$0010/SPRITE_STEP_PIXELS
	; --------------------------------------------------------------------------
	; end credits
	; --------------------------------------------------------------------------
	dc.w	SCRIPTED_EVENT_FADE_BLACK
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_ENDING_GOOD0
	dc.w	SCRIPTED_EVENT_TIMER
	dc.w	CREDITS_SCREEN_LOOP
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_ENDING_GOOD1
	dc.w	SCRIPTED_EVENT_TIMER
	dc.w	CREDITS_SCREEN_LOOP
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_ENDING_GOOD2
	dc.w	SCRIPTED_EVENT_TIMER
	dc.w	CREDITS_SCREEN_LOOP
	dc.w	SCRIPTED_EVENT_ENDGAME

	if	_DEBUG_
; ------------------------------------------------------------------------------
; used to test ending
; ------------------------------------------------------------------------------
TestScriptedEventEnding:
	dc.w	$0001	; player
	dc.w	SCRIPTED_EVENT_FADE_BLACK
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
	dc.w	$0000
	dc.w	SCRIPTED_EVENT_CHANGE_SCENE
	dc.w	SCENE_ID_CREDITS
	dc.w	SCRIPTED_EVENT_TIMER
	dc.w	CREDITS_SCREEN_LOOP
	dc.w	SCRIPTED_EVENT_ENDGAME

; ------------------------------------------------------------------------------
; used to test scene and player sprite changes in scripted events
; ------------------------------------------------------------------------------
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

