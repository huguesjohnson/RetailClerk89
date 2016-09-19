;*******************************************************************************
; vectors
; see-http://www.hacking-cult.org/?r/18/21
; see also-"68000 Family Assembly Language" 1994 by Alan Clements page 451
;*******************************************************************************
	dc.l	$FFFFFE00		; Stack pointer
	dc.l	Start			; Code start
	dc.l	TrapException	; Bus error
	dc.l	TrapException	; Address error
	dc.l	TrapException	; Illegal instruction
	dc.l	TrapException	; Divistion by zero
	dc.l	TrapException	; CHK exception
	dc.l	TrapException	; TRAPV exception
	dc.l	TrapException	; Privilege violation
	dc.l	TrapException	; TRACE exeption
	dc.l	TrapException	; Line 1010 emulator
	dc.l	TrapException	; Line 1111 emulator
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Spurious exception
	dc.l	TrapException	; Interrupt request level 1 (lowest priority)
	dc.l	ExtInt			; Interrupt request level 2 (external interrupt)
	dc.l	TrapException	; Interrupt request level 3
	dc.l	HBlank			; Interrupt request level 4 (VDP interrupt/HBlank)
	dc.l	TrapException	; Interrupt request level 5
	dc.l	VBlank			; Interrupt request level 6 (VDP interrupt/VBlank)
	dc.l	TrapException	; Interrupt request level 7 (highest priority)
	dc.l	TrapException	; TRAP #00 exception
	dc.l	TrapException	; TRAP #01 exception
	dc.l	TrapException	; TRAP #02 exception
	dc.l	TrapException	; TRAP #03 exception
	dc.l	TrapException	; TRAP #04 exception
	dc.l	TrapException	; TRAP #05 exception
	dc.l	TrapException	; TRAP #06 exception
	dc.l	TrapException	; TRAP #07 exception
	dc.l	TrapException	; TRAP #08 exception
	dc.l	TrapException	; TRAP #09 exception
	dc.l	TrapException	; TRAP #10 exception
	dc.l	TrapException	; TRAP #11 exception
	dc.l	TrapException	; TRAP #12 exception
	dc.l	TrapException	; TRAP #13 exception
	dc.l	TrapException	; TRAP #14 exception
	dc.l	TrapException	; TRAP #15 exception
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
	dc.l	TrapException	; Reserved
