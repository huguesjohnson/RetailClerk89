PatternMannequinStand:
	dc.w	$0003	; 4 rows
	dc.w	$0007	; 8 columns	
	; row 00
	dc.w	$00,$01,$01,$01,$01,$01,$01,$02
	; row 01
	dc.w	$03,$01,$01,$01,$01,$01,$01,$04
	; row 02
	dc.w	$05,$01,$01,$01,$01,$01,$01,$06
	; row 03
	dc.w	$07,$08,$08,$08,$08,$08,$08,$09

PatternMannequinStandNarrow:
	dc.w	$0003	; 4 rows
	dc.w	$0005	; 6 columns	
	; row 00
	dc.w	$00,$01,$01,$01,$01,$02
	; row 01
	dc.w	$03,$01,$01,$01,$01,$04
	; row 02
	dc.w	$05,$01,$01,$01,$01,$06
	; row 03
	dc.w	$07,$08,$08,$08,$08,$09
