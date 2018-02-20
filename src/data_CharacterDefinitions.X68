CharacterDefinitionStart:

; 00 - player
CharacterDefinitionPlayer:
	dc.l	PlayerSpriteTilesStart
	dc.w 	PLAYER_BASE_TILE
CharacterDefinitionPlayerEnd:

; 01 - Dani
CharacterDefinitionDani:
	dc.l	NPCSpriteDaniTilesStart
	dc.w	NPC0_BASE_TILE

; 02 - generic male shopper
CharacterDefinitionMaleShopper0:
	dc.l	NPCSpriteMaleShopper0Start
	dc.w 	NPC1_BASE_TILE
	
; 03 - Greenberg (video buffet manager)
CharacterDefinitionGreenberg:
	dc.l	NPCSpriteGreenbergStart
	dc.w 	NPC2_BASE_TILE

; 04 - information desk person
CharacterScene03StaffNPC:
	dc.l	Scene03StaffNPCTilesStart
	dc.w	NPC0_BASE_TILE	

