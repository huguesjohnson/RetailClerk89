;*******************************************************************************
; There's a 0.000001% chance this will ever be translated to another language.
; All the game text is in one file to make it easier if that somehow happens.
;
; The best way to go about it is:
;  1) Copy this file and rename it to 'string_[locale].X68'
;  2) Painfully change all the text
;  3) Not rename any of the labels
;  4) Change the include path in the main file
;  5) Update init_Header
;  6) Rebuild
;
; Things that will make translations difficult:
;  1) In the overhead view, the dialog displays a fixed 22 chars per row
;  2) Game font only includes ASCII, unused chars could be re-purposed though
;*******************************************************************************

;-------------------------------------------------------------------------------
; dialog text
;-------------------------------------------------------------------------------

DialogTextNothing:
	;		"1234567890123456789012
	dc.b	"There's nothing very"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"interesting here."
	dc.b	ETX
	align 2

DialogText8Bit:
	;		"1234567890123456789012
	dc.b	"The shelves are lined"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"with 8-bit games."
	dc.b	ETX
	align 2

DialogTextMags:
	;		"1234567890123456789012
	dc.b	"Below the counter are"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"gaming magazines."
	dc.b	ETX
	align 2

DialogTextCounter:
	;		"1234567890123456789012
	dc.b	"The counter is empty."
	dc.b	ETX
	align 2

DialogTextRegister:
	;		"1234567890123456789012
	dc.b	"The register stares"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"back at you blankly."
	dc.b	ETX
	align 2

DialogTextHardware:
	;		"1234567890123456789012
	dc.b	"This is a wire rack"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"of computer hardware."
	dc.b	ETX
	align 2

DialogText16Bit:
	;		"1234567890123456789012
	dc.b	"Here are the latest"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"16-bit games."
	dc.b	ETX
	align 2

DialogTextDani:
	;		"1234567890123456789012
	dc.b	"Dani: 'Isn't it time"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"to close already?'"
	dc.b	ETX
	align 2

DialogTextMaleShopper0:
	;		"1234567890123456789012
	dc.b	"He has been browsing"
	dc.b	LF
	;		"1234567890123456789012
	dc.b	"for over an hour now."
	dc.b	ETX
	align 2

