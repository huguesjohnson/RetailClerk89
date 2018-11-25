PatternHandheldRackHigh:

	dc.w	$0004	; 5 rows

	dc.w	$0006	; 7 columns

	; row 00
	dc.w	$00,$01,$02,$01,$02,$01,$02

	; row 01
	dc.w	$03,$04,$05,$04,$05,$04,$05

	; row 02
	dc.w	$06,$07,$08,$09,$07,$08,$09

	; row 03
	dc.w	$06,$09,$0A,$0B,$09,$0A,$0B

	; row 04
	dc.w	$06,$09,$0A,$0B,$0C,$0D,$0E


PatternHandheldRackLow:

	dc.w	$0002	; 3 rows

	dc.w	$0006	; 7 columns


	; row 01
	dc.w	$06,$09,$0A,$0B,$09,$0A,$0B

	; row 02
	dc.w	$06,$0C,$0D,$0E,$09,$0A,$0B

	; row 03
	dc.w	$06,$09,$0A,$0B,$09,$0A,$0B



