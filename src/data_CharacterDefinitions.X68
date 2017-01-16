CharacterDefinitionStart:

; 00
CharacterDefinitionPlayer:
	dc.l	PlayerSpriteTilesStart
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000100000000	; priority=0,palette=2,vflip=0,hflip=0,pattern=5
CharacterDefinitionPlayerEnd:

; 01
CharacterDefinitionDani:
	dc.l	NPCSpriteDaniTilesStart
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000101100000 ;priority=0,palette=2,vflip=0,hflip=0,pattern=160

; 02
CharacterDefinitionMaleShopper0:
	dc.l	NPCSpriteMaleShopper0Start
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000111000000 ;priority=0,palette=2,vflip=0,hflip=0,pattern=1C0
	
