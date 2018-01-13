PatternBookshelf72x48x10High:
	dc.w	$0001	; 2 rows
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$01,$07,$0A,$0D,$10,$0A,$07,$0D,$04
	; row 01
	dc.w	$02,$08,$0B,$0E,$11,$0B,$08,$0E,$05

PatternBookshelf72x48x10Low:
	dc.w	$0003	; 4 rows
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$03,$09,$0C,$0F,$12,$0C,$09,$0F,$06
	; row 01
	dc.w	$13,$16,$19,$1F,$22,$25,$28,$19,$1C
	; row 02
	dc.w	$14,$17,$1A,$20,$23,$26,$29,$1A,$1D
	; row 03
	dc.w	$15,$18,$1B,$21,$24,$27,$2A,$1B,$1E

PatternBookshelfSign:
	dc.w	$0001	; 2 rows
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$57,$57,$57,$57,$57,$57,$57,$57,$57
	; row 01
	dc.w	$55,$00,$00,$00,$00,$00,$00,$00,$56

