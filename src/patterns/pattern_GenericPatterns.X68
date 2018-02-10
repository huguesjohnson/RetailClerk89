Pattern8x16:
	dc.w	$0001	; 2 rows
	dc.w	$0000	; 1 column
	; row 00
	dc.w	$00
	; row 01
	dc.w	$01

Pattern8x40:
	dc.w	$0004	; 5 rows
	dc.w	$0000	; 1 column
	dc.w	$00,$01,$02,$03,$04,$05

Pattern8x48:
	dc.w	$0005	; 6 rows
	dc.w	$0000	; 1 column
	dc.w	$00,$01,$02,$03,$04,$05

Pattern8x56:
	dc.w	$0006	; 7 rows
	dc.w	$0000	; 1 column
	dc.w	$00,$01,$02,$03,$04,$05,$06

Pattern8x64:
	dc.w	$0007	; 8 rows
	dc.w	$0000	; 1 column
	dc.w	$00,$01,$02,$03,$04,$05,$06,$07

Pattern16x8:
	dc.w	$0000	; 1 row
	dc.w	$0001	; 2 columns
	; row 00
	dc.w	$00,$01

Pattern16x16:
	dc.w	$0001	; 2 rows
	dc.w	$0001	; 2 columns
	; row 00
	dc.w	$00,$01
	; row 01
	dc.w	$02,$03

Pattern16x24:
	dc.w	$0002	; 3 rows
	dc.w	$0001	; 2 columns
	; row 00
	dc.w	$00,$01
	; row 01
	dc.w	$02,$03
	; row 02
	dc.w	$04,$05

Pattern16x32:
	dc.w	$0003	; 4 rows
	dc.w	$0001	; 2 columns
	; row 00
	dc.w	$00,$01
	; row 01
	dc.w	$02,$03
	; row 02
	dc.w	$04,$05
	; row 03
	dc.w	$06,$07

Pattern24x8:
	dc.w	$0000	; 2 rows
	dc.w	$0002	; 3 columns	
	; row 00
	dc.w	$00,$01,$02

Pattern24x16:
	dc.w	$0001	; 2 rows
	dc.w	$0002	; 3 columns	
	; row 00
	dc.w	$00,$01,$02
	; row 01
	dc.w	$03,$04,$05

Pattern24x24:
	dc.w	$0002	; 3 rows
	dc.w	$0002	; 3 columns	
	; row 00
	dc.w	$00,$01,$02
	; row 01
	dc.w	$03,$04,$05
	; row 02
	dc.w	$06,$07,$08

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

Pattern24x48:
	dc.w	$0005	; 6 rows
	dc.w	$0002	; 3 columns	
	; row 00
	dc.w	$00,$01,$02
	; row 01
	dc.w	$03,$04,$05
	; row 02
	dc.w	$06,$07,$08
	; row 03
	dc.w	$09,$0A,$0B
	; row 04
	dc.w	$0C,$0D,$0E
	; row 05
	dc.w	$0F,$10,$11

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

Pattern32x32:
	dc.w	$0003	; 4 rows
	dc.w	$0003	; 4 columns
	; row 00
	dc.w	$00,$01,$02,$03
	; row 01
	dc.w	$04,$05,$06,$07
	; row 02
	dc.w	$08,$09,$0A,$0B
	; row 03
	dc.w	$0C,$0D,$0E,$0F

Pattern32x32x3:
	dc.w	$0003	; 4 rows
	dc.w	$000B	; 12 columns
	; row 00
	dc.w	$00,$01,$02,$03,$00,$01,$02,$03,$00,$01,$02,$03
	; row 01
	dc.w	$04,$05,$06,$07,$04,$05,$06,$07,$04,$05,$06,$07
	; row 02
	dc.w	$08,$09,$0A,$0B,$08,$09,$0A,$0B,$08,$09,$0A,$0B
	; row 03
	dc.w	$0C,$0D,$0E,$0F,$0C,$0D,$0E,$0F,$0C,$0D,$0E,$0F

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

Pattern56x32:
	dc.w	$0003	; 4 rows
	dc.w	$0006	; 7 columns
	; row 00
	dc.w	$00,$01,$02,$03,$04,$05,$06
	; row 01
	dc.w	$07,$08,$09,$0A,$0B,$0C,$0D
	; row 02
	dc.w	$0E,$0F,$10,$11,$12,$13,$14
	; row 03
	dc.w	$15,$16,$17,$18,$19,$1A,$1B

Pattern56x48:
	dc.w	$0005	; 6 rows
	dc.w	$0006	; 7 columns
	; row 00
	dc.w	$00,$01,$02,$03,$04,$05,$06
	; row 01
	dc.w	$07,$08,$09,$0A,$0B,$0C,$0D
	; row 02
	dc.w	$0E,$0F,$10,$11,$12,$13,$14
	; row 03
	dc.w	$15,$16,$17,$18,$19,$1A,$1B
	; row 04
	dc.w	$1C,$1D,$1E,$1F,$20,$21,$22
	; row 05
	dc.w	$23,$24,$25,$26,$27,$28,$29

Pattern72x16:
	dc.w	$0001	; 2 rows
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$00,$01,$02,$03,$04,$05,$06,$07,$08
	; row 01
	dc.w	$09,$0A,$0B,$0C,$0D,$0E,$0F,$10,$11

Pattern96x16:
	dc.w	$0001	; 2 rows
	dc.w	$000B	; 12 columns
	; row 00
	dc.w	$00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B
	; row 01
	dc.w	$0C,$0D,$0E,$0F,$10,$11,$12,$13,$14,$15,$16,$17

Pattern96x24:
	dc.w	$0002	; 3 rows
	dc.w	$000B	; 12 columns
	; row 00
	dc.w	$00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B
	; row 01
	dc.w	$0C,$0D,$0E,$0F,$10,$11,$12,$13,$14,$15,$16,$17
	; row 02
	dc.w	$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,$20,$21,$22,$23

Pattern96x40:
	dc.w	$0004	; 5 rows
	dc.w	$000B	; 12 columns
	; row 00
	dc.w	$00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B
	; row 01
	dc.w	$0C,$0D,$0E,$0F,$10,$11,$12,$13,$14,$15,$16,$17
	; row 02
	dc.w	$18,$19,$1A,$1B,$1C,$1D,$1E,$1F,$20,$21,$22,$23
	; row 03
	dc.w	$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D,$2E,$2F
	; row 04
	dc.w	$30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$3A,$3B

Pattern3Tile72x8:
	dc.w	$0000	; 1 row
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$00,$01,$02,$01,$01,$02,$01,$01,$02

Pattern3Tile80x8:
	dc.w	$0000	; 1 row
	dc.w	$0009	; 10 columns
	; row 00
	dc.w	$00,$01,$01,$02,$01,$01,$02,$01,$01,$02

Pattern3Tile112x8:
	dc.w	$0000	; 1 row
	dc.w	$000D	; 14 columns
	; row 00
	dc.w	$00,$01,$02,$01,$01,$02,$01,$02,$01,$01,$02,$01,$01,$02

Pattern3Tile96x16:
	dc.w	$0001	; 2 rows
	dc.w	$000B	; 12 columns
	; row 00
	dc.w	$00,$01,$02,$01,$01,$02,$01,$01,$02,$01,$01,$02
	; row 01
	dc.w	$00,$01,$02,$01,$01,$02,$01,$01,$02,$01,$01,$02


