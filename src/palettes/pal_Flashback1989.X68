	;---------------------------------------------------------------------------
	; entry 0 - transparency
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000000000000000
	;---------------------------------------------------------------------------
	; entries 1-3 = dialog and font
	;---------------------------------------------------------------------------
	dc.w	$0A86	; rgb(96,128,160) => 101010000110 => 0A86
	dc.w	$0A64	; rgb(64,96,160) => 101001100100 => 0A64
	dc.w	$0EEE	; rgb(224,224,224) => 111011101110 => 0EEE
	;---------------------------------------------------------------------------
	; entry 4-A = store front, fence
	;---------------------------------------------------------------------------
 	;		 0000BBBSGGGSRRRS
	dc.w	%0000110011001100	; 04
	dc.w	%0000101010101010	; 05
	dc.w	%0000100010001000	; 06
	dc.w	%0000111011101110	; 07
	dc.w	%0000010001000100	; 08
	dc.w	%0000000000000000	; 09
	dc.w	%0000011001100110	; 0A
	;---------------------------------------------------------------------------
	; fake snow, fence
	;---------------------------------------------------------------------------
	dc.w	%0000110011101110	; 0B
	dc.w	%0000101011001100	; 0C
	dc.w	%0000100011101110	; 0D
	;---------------------------------------------------------------------------
	; decorations
	;---------------------------------------------------------------------------
	dc.w	%0000000000100010
	dc.w	%0000001001000100

	;---------------------------------------------------------------------------
	; entry 0 - transparency
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000000000000000
	;---------------------------------------------------------------------------
	; entries 1-2 = banner background
	;---------------------------------------------------------------------------
 	;		 0000BBBSGGGSRRRS
	dc.w	%0000110011001100	; 01
	dc.w	%0000101010101010	; 02
	;---------------------------------------------------------------------------
	; entry 3-6 = floor
	;---------------------------------------------------------------------------
 	;		 0000BBBSGGGSRRRS
	dc.w	%0000000000000000	; 03
	dc.w	%0000000000000000	; 04
	dc.w	%0000000000000000	; 05
	dc.w	%0000000000000000	; 06
	;---------------------------------------------------------------------------
	; banner
	;---------------------------------------------------------------------------
 	;		 0000BBBSGGGSRRRS
	dc.w	%0000010010001000	; 07
	dc.w	%0000011011101110	; 08
	dc.w	%0000110011001100	; 09
	dc.w	%0000110011101100	; 0A
	dc.w	%0000000011100000	; 0B
	;---------------------------------------------------------------------------
	; unused
	;---------------------------------------------------------------------------
	dc.w	%0000000000000000
	dc.w	%0000000000000000
	dc.w	%0000000000000000
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; entry 0 - transparency
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000111000001110
	;---------------------------------------------------------------------------
	; entries 1-A - workshop
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000001001000100	; roof - dark
	dc.w	%0000010001100110	; roof - light
	dc.w	%0000001010001000	; roof - accent
	dc.w	%0000000000100010	; shadow
	dc.w	%0000110011101110	; wall
	dc.w	%0000011010101010	; wood beam - accent
	dc.w	%0000010010001000	; wood beam - primary
	dc.w	%0000001001100110	; window & door frame
	dc.w	%0000001001000100	; door inside
	dc.w	%0000001001000100	; window inside
	;---------------------------------------------------------------------------
	; entries B-F - pole
	;---------------------------------------------------------------------------
	;		 0000BBBSGGGSRRRS
	dc.w	%0000000000100010	; pole main color
	dc.w	%0000011010101010	; orb - main
	dc.w	%0000000000100010	; outline
	dc.w	%0000001011101110	; stripes
	dc.w	%0000100010101010	; orb - outline

