PatternDebugWireFrameFloor:
	dc.w	$0000	; 1 rows

	dc.w	$0027	; 40 columns

	; row 0	
	dc.w	$01,$01,$01,$01,$01,$01,$01,$01
	dc.w	$01,$01,$01,$01,$01,$01,$01,$01
	dc.w	$01,$01,$01,$01,$01,$01,$01,$01
	dc.w	$01,$01,$01,$01,$01,$01,$01,$01
	dc.w	$01,$01,$01,$01,$01,$01,$01,$01

PatternDebugWireFrameSouthFrameOpen:
	dc.w	$0000	; 1 rows

	dc.w	$0027	; 40 columns

	; row 0	
	dc.w	$02,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$04,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$02,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$04

PatternDebugWireFrameSouthFrameClosed:
	dc.w	$0000	; 1 rows

	dc.w	$0027	; 40 columns

	; row 0	
	dc.w	$06,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$07

PatternDebugWireFrameSides:
	dc.w	$0000	; 1 row

	dc.w	$0027	; 40 columns

	; row 00
	dc.w	$05,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$05

PatternDebugWireFrameLeftSide:
	dc.w	$0000	; 1 row

	dc.w	$0027	; 40 columns

	; row 00
	dc.w	$05,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00

PatternDebugWireFrameRightSide:
	dc.w	$0000	; 1 row

	dc.w	$0027	; 40 columns

	; row 00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$05

PatternDebugWireFrameNorthFrameClosed:
	dc.w	$0000	; 1 rows

	dc.w	$0027	; 40 columns

	; row 0	
	dc.w	$02,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$04

PatternDebugWireFrameNorthFrameOpen:
	dc.w	$0000	; 1 rows

	dc.w	$0027	; 40 columns

	; row 0	
	dc.w	$02,$03,$03,$03,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$09,$00,$00,$00
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$00,$00,$00,$09,$03,$03,$03,$03
	dc.w	$03,$03,$03,$03,$03,$03,$03,$04

PatternDebugWireFrameNorthWindow:
	dc.w	$0002	; 3 rows

	dc.w	$0027	; 40 columns

	; row 0	
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05
	; row 1
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05
	; row 2	
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05
	dc.w	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05,$00,$00,$00,$00,$00
	dc.w	$05
