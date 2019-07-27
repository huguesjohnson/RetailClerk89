PatternTableHigh72x8:
	dc.w	$0000	; 1 row
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$00,$01,$01,$01,$01,$01,$01,$01,$02

PatternTableLow72x40:
	dc.w	$0003	; 4 rows
	dc.w	$0008	; 9 columns
	; row 00
	dc.w	$03,$04,$04,$04,$04,$04,$04,$04,$05
	dc.w	$03,$04,$04,$04,$04,$04,$04,$04,$05
	dc.w	$06,$07,$07,$07,$07,$07,$07,$07,$08
	dc.w	$09,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0B
;	dc.w	$0C,$0D,$0D,$0D,$0D,$0D,$0D,$0D,$0E
