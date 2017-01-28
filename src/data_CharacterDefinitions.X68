CharacterDefinitionStart:

; 00
CharacterDefinitionPlayer:
	dc.l	PlayerSpriteTilesStart
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000100000001 ; priority=0,palette=2,vflip=0,hflip=0,pattern=257
CharacterDefinitionPlayerEnd:

; 01
CharacterDefinitionDani:
	dc.l	NPCSpriteDaniTilesStart
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000101100001 ;priority=0,palette=2,vflip=0,hflip=0,pattern=161

; 02
CharacterDefinitionMaleShopper0:
	dc.l	NPCSpriteMaleShopper0Start
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000111000001 ;priority=0,palette=2,vflip=0,hflip=0,pattern=1C1
	
