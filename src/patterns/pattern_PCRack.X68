PatternPCRackHigh:

	dc.w	$0004	; 5 rows

	dc.w	$0006	; 7 columns

	; row 00
	dc.w	$01,$02,$03,$01,$02,$03,$00

	; row 01
	dc.w	$04,$05,$06,$04,$05,$06,$00

	; row 02
	dc.w	$07,$08,$09,$07,$08,$09,$00

	; row 03
	dc.w	$0A,$0B,$0C,$0A,$0B,$0C,$00

	; row 04
	dc.w	$0D,$0E,$0F,$0D,$0E,$0F,$00


PatternPCRackLow:

	dc.w	$0002	; 3 rows

	dc.w	$0006	; 7 columns


	; row 01
	dc.w	$10,$11,$12,$10,$11,$12,$00

	; row 02
	dc.w	$13,$14,$15,$13,$14,$15,$00

	; row 03
	dc.w	$16,$17,$18,$16,$17,$18,$00



