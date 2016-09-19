;-------------------------------------------------------------------------------
; PseudoRandomWord
; not random since on an emulator it would be easy to get predicable results
; on normal game play the results should look pretty random  
; d0 contains the result of the operation 
; d1 is used to compute the pseudo random number
;-------------------------------------------------------------------------------
PseudoRandomWord:
	move.w	MEM_VBLANK_COUNTER,d0	; copy vblank counter to d0
	move.w	MEM_MAINLOOP_COUNTER,d1	; copy main loop counter to d1
	eor.w	d1,d0					; eor them and store the result in d0
	rts								; return

