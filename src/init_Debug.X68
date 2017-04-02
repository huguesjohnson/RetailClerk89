;-------------------------------------------------------------------------------
; loads debug data before MainGameLoop starts
; this should be blank or commented-out in any real builds
;-------------------------------------------------------------------------------

	;---------------------------------------------------------------------------
	; used to test closing animation on day 0 scene 0
	;---------------------------------------------------------------------------
;	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy event flags for the day to d7
;	bset.l	#$7,d7	; set flag 7
;	move.l	d7,(MEM_DAY_EVENT_FLAGS)	; copy flags back


