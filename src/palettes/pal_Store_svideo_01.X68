	;---------------------------------------------------------------------------
	; entry 0 - transparency
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000000000000000
	;---------------------------------------------------------------------------
	; entries 1-2 = unused
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000000000000000
	dc.w	%0000000000000000
	;---------------------------------------------------------------------------
	; entries 3-6 = floor
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000100010001000
	dc.w	%0000001000100010
	dc.w	%0000110011001100
	dc.w	%0000011001100110
	;---------------------------------------------------------------------------
	; entries 7-8 = unused
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000000000000000
	dc.w	%0000000000000000
	;---------------------------------------------------------------------------
	; entries 9-A = frame
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000001000101110
	dc.w	%0000001000100010
	;---------------------------------------------------------------------------
	; entries B-F = merchandise
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000000000000000
	dc.w	%0000000001101000
	dc.w	%0000000011001100
	dc.w	%0000010001000110
	dc.w	%0000100010001000

