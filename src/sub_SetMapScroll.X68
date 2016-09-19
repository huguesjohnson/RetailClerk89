SetMapScroll:
	; set vertical scroll
	; -------------------------------------------------------------
	; when writing to VSRAM the upper word is the scroll B value 
	; and the lower word is the scroll A value
	; in this demo they are scrolling at the same time so the
	; MEM_MAP_POSITION_Y value needs to set for both words
	; -------------------------------------------------------------
	move.w	MEM_MAP_POSITION_Y,d0	; copy Y map position to d0 lower word
	swap	d0						; move Y map position to upper word
	move.w	MEM_MAP_POSITION_Y,d0	; copy Y map position to d0 lower word
	; the Y map position is now in both words of d0
	move.l	#VDP_VRAM_WRITE_VSCROLL,VDP_CONTROL	; setup write to vscroll
	move.l	d0,VDP_DATA				; copy y position to vscroll 
	; horizontal scrolling not yet implemented but would look like this
;	move.l	#VDP_VRAM_WRITE_HSCROLL,VDP_CONTROL	; write to hscroll
;	move.w	(MEM_MAP_POSITION_X),VDP_DATA		; set x position
	move.w	#$0000,(MEM_FLAG_MAP_POSITION_CHANGED)	; reset flag to false
EndSetMapScroll:
	rts

