ClearVRAM:
	move.l	#VDP_VRAM_WRITE,(VDP_CONTROL) 
	move.w	#$7FFF,d1
ClearVRAMLoop:
	move.w	#$0000,(VDP_DATA)
	dbra	d1,ClearVRAMLoop
	rts
