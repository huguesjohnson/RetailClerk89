;*******************************************************************************
; cartridge info header
; see-https://en.wikibooks.org/wiki/Genesis_Programming#ROM_header
;*******************************************************************************
	dc.b	'SEGA GENESIS    '	; console name
	dc.b	'(C)HUJO '			; copyright
 	dc.b	'2017.JAN'			; date
	dc.b	'Retail Clerk 89 - Development Build 20170129-00 ' ; cart name
	dc.b	'Retail Clerk 89 - Development Build 20170129-00 ' ; cart name (alt)
	dc.b	'GM 20170129-00'	; program type / serial number / version
	dc.w	$0000				; ROM checksum
	dc.b	'J               '	; I/O device support (unused)
	dc.l	$00000000			; address of ROM start
	dc.l	RomEnd				; address of ROM end
	dc.l	$FFFF0000,$FFFFFFFF	; RAM start/end
	dc.b	'            '		; backup RAM info
	dc.b	'            '		; modem info
	dc.b	'http://huguesjohnson.com/               ' ; comment
	dc.b	'JUE             '	; regions allowed
