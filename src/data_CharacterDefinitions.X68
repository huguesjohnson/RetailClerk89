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
	dc.w 	%0110000101110001 ;priority=0,palette=2,vflip=0,hflip=0,pattern=171

; 02
CharacterDefinitionMaleShopper0:
	dc.l	NPCSpriteMaleShopper0Start
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110000111010001 ;priority=0,palette=2,vflip=0,hflip=0,pattern=1D1
	
; 03
CharacterDefinitionGreenberg:
	dc.l	NPCSpriteGreenbergStart
	;---------------------------------------------------------------------------
	; priority, palette, flip, pattern
	;---------------------------------------------------------------------------
			;pccvhnnnnnnnnnnn
	dc.w 	%0110001000110001 ;priority=0,palette=2,vflip=0,hflip=0,pattern=231
	

