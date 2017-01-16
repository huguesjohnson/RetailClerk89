;-------------------------------------------------------------------------------
; object default text table
;-------------------------------------------------------------------------------
	org	ROM_ADDR_DEFAULT_TEXT_TABLE

DefaultTextTable:
	; nothing
	dc.l	DialogTextNothing
	; OBJ_SCENE_VB_8BIT
	dc.l	DialogText8Bit
	; OBJ_SCENE_VB_HARDWARE
	dc.l	DialogTextHardware
	; OBJ_SCENE_VB_16BIT
	dc.l	DialogText16Bit
	; OBJ_SCENE_VB_MAGS
	dc.l	DialogTextMags
	; OBJ_SCENE_VB_COUNTER
	dc.l	DialogTextCounter
	; OBJ_SCENE_VB_REGISTER
	dc.l	DialogTextRegister

