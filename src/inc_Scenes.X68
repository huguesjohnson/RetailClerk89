	;---------------------------------------------------------------------------
	; title, end, transition scenes
	;---------------------------------------------------------------------------
	include 'scenes/scene_legal.X68'
	include 'scenes/scene_title.X68'
	include 'scenes/scene_day00.X68'
	include 'scenes/scene_day01.X68'
	include 'scenes/scene_day02.X68'
	include 'scenes/scene_day03.X68'
	include 'scenes/scene_day04.X68'
	include 'scenes/scene_day05.X68'
	include 'scenes/scene_day06.X68'
	include 'scenes/scene_day07.X68'
	include 'scenes/scene_end.X68'
	include 'scenes/scene_credits.X68'
	if	_DEBUG_
	include 'scenes/scene_debugmenu.X68'
	endif

	;---------------------------------------------------------------------------
	; status screen
	;---------------------------------------------------------------------------
	include 'scenes/scene_status.X68'

	;---------------------------------------------------------------------------
	; stores
	;---------------------------------------------------------------------------
	; SCENE_ID_VB=$0000
	include 'scenes/scene_vb.X68'

	; SCENE_ID_WWHALL=$0001
	include 'scenes/scene_wwhall.X68'

	; SCENE_ID_WEHALL=$0002
	include 'scenes/scene_wehall.X68'

	; SCENE_ID_CENTER=$0003
	include 'scenes/scene_center.X68'

	; SCENE_ID_SHALL=$0004
	include 'scenes/scene_shall.X68'

	; SCENE_ID_PARKINGLOG=$0005
	include 'scenes/scene_parkinglot.X68'

	; SCENE_ID_EWHALL=$0006
	include 'scenes/scene_ewhall.X68'

	; SCENE_ID_EEHALL=$0007
	include 'scenes/scene_eehall.X68'

	; SCENE_ID_DENIMCOUNTRY=$0008
	include 'scenes/scene_dcountry.X68'

	; SCENE_ID_CHECKERS=$0009
	include 'scenes/scene_checkers.X68'

	; SCENE_ID_TLODGE=$000A
	include 'scenes/scene_tlodge.X68'

	; SCENE_ID_CAVERN=$000B
	include 'scenes/scene_cavern.X68'

	; SCENE_ID_SVIDEO=$000C
	include 'scenes/scene_svideo.X68'

	; SCENE_ID_WORKSHOP=$000D
	include 'scenes/scene_workshop.X68'

	; SCENE_ID_NSHACK=$000E
	include 'scenes/scene_nshack.X68'

	; SCENE_ID_POGODAWG=$000F
	include 'scenes/scene_pogodawg.X68'

	; SCENE_ID_CPLANET=$0010
	include 'scenes/scene_cplanet.X68'

	; SCENE_ID_CNOW=$0011
	include 'scenes/scene_cnow.X68'

	; SCENE_ID_TBOOKS=$0012
	include 'scenes/scene_tbooks.X68'

	; SCENE_ID_FCBCHECKOUT=$0013
	include 'scenes/scene_fcbcheckout.X68'

	; SCENE_ID_FCBFIREARMS=$0014
	include 'scenes/scene_fcbfirearms.X68'

	; SCENE_ID_FCBFISHING=$0015
	include 'scenes/scene_fcbfishing.X68'

	; SCENE_ID_FCBCAMPING=$0016
	include 'scenes/scene_fcbcamping.X68'

	; SCENE_ID_SOUTH_CENTER=$0017
	include 'scenes/scene_southcenter.X68'
	
	; SCENE_ID_PARKINGLOT_BLIZZARD=$0018
	include 'scenes/scene_parkinglotblizzard.X68'

	; SCENE_ID_FLASHBACK_1975=$0019
	include 'scenes/scene_flashback1975.X68'

	; SCENE_ID_FLASHBACK_1989=$001A
	include 'scenes/scene_flashback1989.X68'

	; SCENE_ID_FLASHBACK_1992=$001B
	include 'scenes/scene_flashback1992.X68'

	; SCENE_ID_FLASHBACK_2001=$001C
	include 'scenes/scene_flashback2001.X68'

	; SCENE_ID_FLASHBACK_2014=$001D
	include 'scenes/scene_flashback2014.X68'

