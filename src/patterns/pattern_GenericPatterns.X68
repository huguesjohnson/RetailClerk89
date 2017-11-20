Pattern8x16:
	dc.w	$0001	; 2 rows
	dc.w	$0000	; 1 column
	; row 00
	dc.w	$00
	; row 01
	dc.w	$01

Pattern16x24:
	dc.w	$0002	; 3 rows
	dc.w	$0001	; 2 columns
	; row 00
	dc.w	$00,$01
	; row 01
	dc.w	$02,$03
	; row 02
	dc.w	$04,$05

Pattern24x16:
	dc.w	$0001	; 2 rows
	dc.w	$0002	; 3 columns	
	; row 00
	dc.w	$00,$01,$02
	; row 01
	dc.w	$03,$04,$05

Pattern24x32:
	dc.w	$0003	; 4 rows
	dc.w	$0002	; 3 columns	
	; row 00
	dc.w	$00,$01,$02
	; row 01
	dc.w	$03,$04,$05
	; row 02
	dc.w	$06,$07,$08
	; row 03
	dc.w	$09,$0A,$0B

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
	; row 02
	dc.w	$08,$09,$0A,$0B

Pattern32x40:
	dc.w	$0004	; 5 rows
	dc.w	$0003	; 4 columns
	; row 00
	dc.w	$00,$01,$02,$03
	; row 01
	dc.w	$04,$05,$06,$07
	; row 02
	dc.w	$08,$09,$0A,$0B
	; row 03
	dc.w	$0C,$0D,$0E,$0F
	; row 04
	dc.w	$10,$11,$12,$13

Pattern56x16:
	dc.w	$0001	; 2 rows
	dc.w	$0006	; 7 columns
	; row 00
	dc.w	$00,$01,$02,$03,$04,$05,$06
	; row 01
	dc.w	$07,$08,$09,$0A,$0B,$0C,$0D

Pattern72x16:
	dc.w	$0001	; 2 rows
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$00,$01,$02,$03,$04,$05,$06,$07,$08
	; row 01
	dc.w	$09,$0A,$0B,$0C,$0D,$0E,$0F,$10,$11

Pattern3Tile72x8:
	dc.w	$0000	; 1 row
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$00,$01,$02,$01,$01,$02,$01,$01,$02

