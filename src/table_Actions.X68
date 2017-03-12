;-------------------------------------------------------------------------------
; action table
;-------------------------------------------------------------------------------
	org	ROM_ADDR_ACTION_TABLE

ActionTable:
	dc.l	Day00Scene00Action00
	dc.l	Day00Scene00Action01
	dc.l	Day00Scene00Action02
	dc.l	Day00Scene00Action03

SceneExitTable:
	dc.l	ExitScene00
