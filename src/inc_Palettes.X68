;-------------------------------------------------------------------------------
; store palettes
;-------------------------------------------------------------------------------
StorePalettes:

; store 00 (video buffet)
Store00Palettes:
	include 'palettes/pal_Store_vb_00.X68'
	include 'palettes/pal_Store_vb_01.X68'
	include 'palettes/pal_Store_vb_02.X68'
	include 'palettes/pal_People_00.X68'

; store 01 (west hallway west)
Store01Palettes:
	include 'palettes/pal_Store_vb_00.X68'	; north wall is video buffet
	include 'palettes/pal_Hallway_00.X68'
	include 'palettes/pal_Store_tbooks_01.X68'	; south wall is bookstore
	include 'palettes/pal_People_00.X68'

; store 02 (west hallway east)
Store02Palettes:
	include 'palettes/pal_Store_cplanet_00.X68'	; north wall is cassette planet
	include 'palettes/pal_Hallway_00.X68'
	include 'palettes/pal_Store_cnow_00.X68'	; south wall is clothesnow
	include 'palettes/pal_People_00.X68'

; store 03 (center)
Store03Palettes:
	include 'palettes/pal_Store_workshop_00.X68'	; north wall is workshop
	include 'palettes/pal_Hallway_00.X68'
	include 'palettes/pal_Store_workshop_01.X68'	; used for sign
	include 'palettes/pal_People_00.X68'

; store 04 (south hallway)
Store04Palettes:
	include 'palettes/pal_Store_pogodawg_00.X68'	; west wall is pogo dawg
	include 'palettes/pal_Hallway_03.X68'
	include 'palettes/pal_Store_nshack_00.X68'	; east wall is nut shack
	include 'palettes/pal_People_00.X68'

; store 05 (parking lot)
Store05Palettes:
	include 'palettes/pal_Store_parking_00.X68'
	include 'palettes/pal_Store_parking_01.X68'
	include 'palettes/pal_Store_parking_02.X68'
	include 'palettes/pal_People_00.X68'

; store 06 (east hallway west)
Store06Palettes:
	include 'palettes/pal_Store_checkers_00.X68'	; north wall is checkers
	include 'palettes/pal_Hallway_01.X68'
	include 'palettes/pal_Store_dcountry_01.X68'	; south wall is denimcountry
	include 'palettes/pal_People_00.X68'

; store 07 (east hallway east)
Store07Palettes:
	include 'palettes/pal_Store_cavern_00.X68'	; north wall is the cavern
	include 'palettes/pal_Hallway_01.X68'
	include 'palettes/pal_Store_tlodge_00.X68'	; south wall is tlodge
	include 'palettes/pal_People_00.X68'

; store 08 (denim country)
Store08Palettes:
	include 'palettes/pal_Store_dcountry_00.X68'
	include 'palettes/pal_Store_dcountry_01.X68'
	include 'palettes/pal_Store_dcountry_02.X68'
	include 'palettes/pal_People_00.X68'

; store 09 (checkers)
Store09Palettes:
	include 'palettes/pal_Store_checkers_00.X68'
	include 'palettes/pal_Store_checkers_01.X68'
	include 'palettes/pal_Store_checkers_02.X68'
	include 'palettes/pal_People_00.X68'

; store 0A (transistor lodge)
Store0APalettes:
	include 'palettes/pal_Store_tlodge_00.X68'
	include 'palettes/pal_Store_tlodge_01.X68'
	include 'palettes/pal_Store_tlodge_02.X68'
	include 'palettes/pal_People_00.X68'

; store 0B (the cavern)
Store0BPalettes:
	include 'palettes/pal_Store_cavern_00.X68'
	include 'palettes/pal_Store_cavern_01.X68'
	include 'palettes/pal_Store_cavern_02.X68'
	include 'palettes/pal_People_00.X68'

; store 0C (sunset video)
Store0CPalettes:
	include 'palettes/pal_Store_svideo_00.X68'
	include 'palettes/pal_Store_svideo_01.X68'
	include 'palettes/pal_Store_svideo_02.X68'
	include 'palettes/pal_People_00.X68'

; store 0D (santa's workshop)
Store0DPalettes:
	include 'palettes/pal_Store_workshop_00.X68'
	include 'palettes/pal_Store_workshop_01.X68'
	include 'palettes/pal_Store_workshop_02.X68'
	include 'palettes/pal_People_00.X68'

; store 0E (nut shack)
Store0EPalettes:
	include 'palettes/pal_Store_nshack_00.X68'
	include 'palettes/pal_Store_nshack_01.X68'
	include 'palettes/pal_Store_nshack_02.X68'
	include 'palettes/pal_People_00.X68'

; store 0F (pogo dawg)
Store0FPalettes:
	include 'palettes/pal_Store_pogodawg_00.X68'
	include 'palettes/pal_Store_pogodawg_01.X68'
	include 'palettes/pal_Store_pogodawg_02.X68'
	include 'palettes/pal_People_00.X68'

; store 10 (cassette planet)
Store10Palettes:
	include 'palettes/pal_Store_cplanet_00.X68'
	include 'palettes/pal_Store_cplanet_01.X68'
	include 'palettes/pal_Store_cplanet_02.X68'
	include 'palettes/pal_People_00.X68'

; store 11 (clothesnow)
Store11Palettes:
	include 'palettes/pal_Store_cnow_00.X68'
	include 'palettes/pal_Store_cnow_01.X68'
	include 'palettes/pal_Store_cnow_02.X68'
	include 'palettes/pal_People_00.X68'

; store 12 (bookstore)
Store12Palettes:
	include 'palettes/pal_Store_tbooks_00.X68'
	include 'palettes/pal_Store_tbooks_01.X68'
	include 'palettes/pal_Store_tbooks_02.X68'
	include 'palettes/pal_People_00.X68'

; store 13 (fish or cut bait - checkout)
Store13Palettes:
	include 'palettes/pal_Store_fcb_00.X68'
	include 'palettes/pal_Store_fcb_01.X68'
	include 'palettes/pal_Store_fcb_02.X68'
	include 'palettes/pal_People_00.X68'

; store 14 (fish or cut bait - firearms)
Store14Palettes:
	include 'palettes/pal_Store_fcb_00.X68'
	include 'palettes/pal_Store_fcb_03.X68'
	include 'palettes/pal_Store_fcb_04.X68'
	include 'palettes/pal_People_00.X68'

; store 15 (fish or cut bait - fishing)
Store15Palettes:
	include 'palettes/pal_Store_fcb_00.X68'
	include 'palettes/pal_Store_fcb_01.X68'
	include 'palettes/pal_Store_fcb_06.X68'
	include 'palettes/pal_People_00.X68'

; store 16 (fish or cut bait - camping)
Store16Palettes:
	include 'palettes/pal_Store_fcb_00.X68'
	include 'palettes/pal_Store_fcb_07.X68'
	include 'palettes/pal_Store_fcb_08.X68' 
	include 'palettes/pal_People_00.X68'

; store 17 (south center)
Store17Palettes:
	include 'palettes/pal_Store_cnow_00.X68'	; west wall is clothesnow
	include 'palettes/pal_Hallway_02.X68'
	include 'palettes/pal_Store_dcountry_01.X68'	; east wall is denimcountry
	include 'palettes/pal_People_00.X68'

;-------------------------------------------------------------------------------
; game paused palettes
;-------------------------------------------------------------------------------
StorePalettesPaused:

; store 00 (video buffet)
Store00PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_03.X68'

; store 01 (west hallway west)
Store01PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_03.X68'

; store 02 (west hallway east)
Store02PalettesPaused:
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_03.X68'

; store 03 (center)
Store03PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_05.X68'
	include 'palettes/pal_Paused_03.X68'

; store 04 (south hallway)
Store04PalettesPaused:
	include 'palettes/pal_Paused_04.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_04.X68'
	include 'palettes/pal_Paused_03.X68'

; store 05 (parking log)
Store05PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_03.X68'

; store 06 (east hallway west)
Store06PalettesPaused:
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_03.X68'

; store 07 (east hallway east)
Store07PalettesPaused:
	include 'palettes/pal_Paused_05.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_03.X68'

; store 08 (denim country)
Store08PalettesPaused:
	include 'palettes/pal_Paused_04.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_03.X68'
	include 'palettes/pal_Paused_03.X68'

; store 09 (checkers)
Store09PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_03.X68'

; store 0A (transistor lodge)
Store0APalettesPaused:
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_03.X68'

; store 0B (the cavern)
Store0BPalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_03.X68'

; store 0C (sunset video)
Store0CPalettesPaused:
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_03.X68'

; store 0D (santa's workshop)
Store0DPalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_05.X68'
	include 'palettes/pal_Paused_03.X68'

; store 0E (nut shack)
Store0EPalettesPaused:
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_03.X68'

; store 0F (pogo dawg)
Store0FPalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_03.X68'

; store 10 (cassette planet)
Store10PalettesPaused:
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_03.X68'

; store 11 (clothesnow)
Store11PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_01.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_03.X68'

; store 12 (bookstore)
Store12PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_03.X68'

; store 13 (fish or cut bait - checkout)
Store13PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_03.X68'

; store 14 (fish or cut bait - firearms)
Store14PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_05.X68'
	include 'palettes/pal_Paused_03.X68'

; store 15 (fish or cut bait - fishing)
Store15PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_03.X68'

; store 16 (fish or cut bait - camping)
Store16PalettesPaused:
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_00.X68'
	include 'palettes/pal_Paused_03.X68'

; store 17 (south center)
Store17PalettesPaused:
	include 'palettes/pal_Paused_04.X68'
	include 'palettes/pal_Paused_02.X68'
	include 'palettes/pal_Paused_04.X68'
	include 'palettes/pal_Paused_03.X68'

;-------------------------------------------------------------------------------
; day intro screen palettes
;-------------------------------------------------------------------------------
DayIntroScreenPalettes:
	include 'palettes/pal_DayIntroScreen_00.X68'
	include 'palettes/pal_DayIntroScreen_01.X68'
	include 'palettes/pal_DayIntroScreen_02.X68'
	include 'palettes/pal_DayIntroScreen_03.X68'

;-------------------------------------------------------------------------------
; title palettes
;-------------------------------------------------------------------------------
PaletteTitleScreen00:
	include 'palettes/pal_TitleScreen_00.X68'
	include 'palettes/pal_TitleScreen_01.X68'
	include 'palettes/pal_TitleScreen_02.X68'
	include 'palettes/pal_TitleScreen_03.X68'

;-------------------------------------------------------------------------------
; end palettes
;-------------------------------------------------------------------------------
PaletteEndScreen00:
	include 'palettes/pal_EndScreen_00.X68'
	include 'palettes/pal_EndScreen_01.X68'
	include 'palettes/pal_EndScreen_02.X68'
	include 'palettes/pal_EndScreen_03.X68'

