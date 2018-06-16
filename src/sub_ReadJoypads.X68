;-------------------------------------------------------------------------------
; These sub-routines are not entirely my original code.
; This are based off various samples available online (see credits file).
; I made some modifications but probably not enough to qualify as original work.
;-------------------------------------------------------------------------------
ReadJoypads:
	move.w	#$2700,sr		; disable interrupts
	lea	CTRL_1_DATA,a0		; load address to read controller 1 data
	bsr.s	ReadJoypad		; read first joypad
	; code to read second joypad, not used for this demo
	; addq.w	#2,a0		; switch to second joypad data
	; bsr.s	ReadJoypad		; read second joypad
	move.w	#$2000,sr		; re-enable interrupts
	rts
	
ReadJoypad:
	move.b	#0,(a0)		; read joypad data port
	nop					; bus synchronization
	nop					; bus synchronization
	move.b	(a0),d1		; get joypad data - Start/A
	lsl.w	#2,d1		; shift them so they are at the 2 highest bits
	move.b	#$40,(a0)	; read joypad data port again
	nop					; bus synchronization
	nop					; bus synchronization
	move.b	(a0),d0		; get joypad data - C/B/Dpad
	andi.b	#$3F,d0		; C/B/Dpad in low 6 bits
	andi.b	#$C0,d1		; Start/A in high 2 bits
	or.b	d1,d0		; merge values from both registers
	not.b	d0			; flip bits so 0 means not pressed, and 1 means pressed
	move.b	d0,d1		; copy current buttons to d1
	move.b	(MEM_CONTROL_HELD),d2		; copy the last previously read buttons
	eor.b	d2,d0		; flip buttons being pressed now
	move.b	d1,(MEM_CONTROL_HELD)	; store held buttons
	and.b	d1,d0		; AND with current buttons
	move.b	d0,(MEM_CONTROL_PRESSED)	; store pressed buttons
	rts
