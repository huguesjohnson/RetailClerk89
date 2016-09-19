;-------------------------------------------------------------------------------
; Z80 initialization data
; from http://md.squee.co/Zilog_Z80#Initialise_the_Z80
;-------------------------------------------------------------------------------
Z80InitDataStart:
	dc.w	$af01
	dc.w	$d91f
	dc.w	$1127
	dc.w	$0021
	dc.w	$2600
	dc.w	$f977 
	dc.w    $edb0
	dc.w	$dde1
	dc.w	$fde1
	dc.w	$ed47
	dc.w	$ed4f
	dc.w	$d1e1                                   
	dc.w    $f108
	dc.w	$d9c1
	dc.w	$d1e1
	dc.w	$f1f9
	dc.w	$f3ed
	dc.w	$5636
	dc.w	$e9e9 
Z80InitDataEnd:
