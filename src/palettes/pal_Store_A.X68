	; 00) transparent 
	dc.w	$0000	; rgb(0,0,0) => 000000000000 => 0000

	; 01) border, pillar 1, dialog background
	dc.w	$0A86	; rgb(96,128,160) => 101010000110 => 0A86

	; 02) pillar 3, dialog border
	dc.w	$0A64	; rgb(64,96,160) => 101001100100 => 0A64

	; 03) carpet 1, font primary
	dc.w	$0EEE	; rgb(224,224,224) => 111011101110 => 0EEE

	; 04) carpet 2, font accent
	dc.w	$0AAA	; rgb(160,160,160) => 101010101010 => 0AAA

	; 05) carpet 3
	dc.w	$0A8A	; rgb(160,128,160) => 101010001010 => 0A8A

	; 06) carpet 4
	dc.w	$0CCC	; rgb(192,192,192) => 110011001100 => 0CCC

	; 07) window 1
	dc.w	$0ECC	; rgb(192,192,224) => 111011001100 => 0ECC

	; 08) window 2
	dc.w	$0888	; rgb(128,128,128) => 100010001000 => 0888

	; 09) window 3, pillar 3
	dc.w	$0C86	; rgb(96,128,192) => 110010000110 => 0C86

	; 0A) pillar 4, border, dialog background
	dc.w	$0222	; rgb(32,32,32) => 001000100010 => 0222

	; light scenery
	dc.w	$0A46	; rgb(96,64,160) => 101001000110 => 0A46
	dc.w	$0EA6	; rgb(96,160,224) => 111010100110 => 0EA6
	dc.w	$00CE	; rgb(224,192,0) => 000011001110 => 00CE
	dc.w	$026E	; rgb(224,96,32) => 001001101110 => 026E
	dc.w	$0888	; rgb(128,128,128) => 100010001000 => 0888

