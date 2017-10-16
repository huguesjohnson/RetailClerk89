PatternCounterSide24x64OpenLowerLeft:
	dc.w	$0007	; 8 rows
	dc.w	$0002	; 3 columns
	; row 00
	dc.w	$01,$02,$03
	; row 01
	dc.w	$04,$05,$06
	; row 02
	dc.w	$04,$05,$06
	; row 03
	dc.w	$04,$05,$06
	; row 04
	dc.w	$05,$05,$06
	; row 05
	dc.w	$05,$05,$06
	; row 05
	dc.w	$05,$05,$06
	; row 07
	dc.w	$08,$08,$09

PatternCounterHigh48x8OpenLowerRight:
	dc.w	$0000	; 1 row
	dc.w	$0005	; 6 columns
	; row 00
	dc.w	$01,$02,$02,$02,$02,$02

PatternCounterLow48x24OpenTopRight:
	dc.w	$0002	; 3 rows
	dc.w	$0005	; 6 columns
	; row 00
	dc.w	$04,$05,$05,$05,$05,$05
	; row 01
	dc.w	$04,$05,$05,$05,$05,$05
	; row 02
	dc.w	$07,$08,$08,$08,$08,$08


