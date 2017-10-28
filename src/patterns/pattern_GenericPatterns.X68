Pattern3Tile72x8:
	dc.w	$0000	; 1 row
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$00,$01,$02,$01,$01,$02,$01,$01,$02

Pattern56x16:
	dc.w	$0001	; 2 rows
	dc.w	$0006	; 7 columns
	; row 00
	dc.w	$00,$01,$02,$03,$04,$05,$06
	; row 00
	dc.w	$07,$08,$09,$0A,$0B,$0C,$0D

Pattern32x16:
	dc.w	$0001	; 2 rows
	dc.w	$0003	; 4 columns
	; row 00
	dc.w	$00,$01,$02,$03
	; row 01
	dc.w	$04,$05,$06,$07

Pattern32x24:
	dc.w	$0002	; 3 rows
	dc.w	$0003	; 4 columns
	; row 00
	dc.w	$00,$01,$02,$03
	; row 01
	dc.w	$04,$05,$06,$07
	; row 01
	dc.w	$08,$09,$0A,$0B

