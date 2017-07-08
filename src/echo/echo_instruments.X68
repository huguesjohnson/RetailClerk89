;****************************************************************************
;Echo License
;https://github.com/sikthehedgehog/Echo
;
;© 2010-2013 Javier Degirolmo
;
;This software is provided 'as-is',without any express or implied
;warranty.  In no event will the authors be held liable for any damages
;arising from the use of this software.
;
;Permission is granted to anyone to use this software for any purpose,
;including commercial applications,and to alter it and redistribute it
;freely,subject to the following restrictions:
;
;1. The origin of this software must not be misrepresented; you must not
;   claim that you wrote the original software. If you use this software
;   in a product,an acknowledgment in the product documentation would be
;   appreciated but is not required.
;2. Altered source versions must be plainly marked as such,and must not be
;   misrepresented as being the original software.
;3. This notice may not be removed or altered from any source distribution.
;****************************************************************************

;****************************************************************************
; Minor formatting changes by Hugues Johnson (http://huguesjohnson.com/)
; to address errors & warnings building with vasm
;****************************************************************************

;****************************************************************************
; Instrument $00 [PSG]
; Flat PSG instrument (no envelope)
;****************************************************************************

Instr_00_Start:
    dc.b    $FE,$00,$FF
Instr_00_End:

;****************************************************************************
; Instrument $01 [FM]
; Distortion guitar
;****************************************************************************

Instr_01_Start:
    incbin  'echo/dguitar.eif'
Instr_01_End:

;****************************************************************************
; Instrument $02 [PCM]
; Snare drum
;****************************************************************************

Instr_02_Start:
    incbin  'echo/snare.ewf'
Instr_02_End:

;****************************************************************************
; Instrument $03 [PCM]
; Bass drum
;****************************************************************************

Instr_03_Start:
    incbin  'echo/kick.ewf'
Instr_03_End:

;****************************************************************************
; Instrument $04 [FM]
; String ensemble
;****************************************************************************

Instr_04_Start:
    incbin  'echo/string.eif'
Instr_04_End:

;****************************************************************************
; Instrument $05 [FM]
; Standard bass
;****************************************************************************

Instr_05_Start:
    incbin  'echo/bass.eif'
Instr_05_End:

;****************************************************************************
; Instrument $06 [PSG]
; "Soft" PSG envelope
;****************************************************************************

Instr_06_Start:
    dc.b    $00,$01,$01,$02,$02,$02,$03,$03,$03,$03,$FE,$04,$FF
Instr_06_End:

;****************************************************************************
; Instrument $07 [PSG]
; Piano-like PSG instrument
;****************************************************************************

Instr_07_Start:
    dc.b    $00,$01,$02,$03,$04,$04,$05,$05
    dc.b    $06,$06,$07,$07,$08,$08,$08,$08
    dc.b    $09,$09,$09,$09,$0A,$0A,$0A,$0A
    dc.b    $0B,$0B,$0B,$0B,$0C,$0C,$0C,$0C
    dc.b    $0C,$0C,$0C,$0C,$0D,$0D,$0D,$0D
    dc.b    $0D,$0D,$0D,$0D,$0E,$0E,$0E,$0E
    dc.b    $0E,$0E,$0E,$0E,$FE,$0F,$FF
Instr_07_End:

;****************************************************************************
; Instrument $08 [PSG]
; MIDI square wave instrument (GM81)
;****************************************************************************

Instr_08_Start:
    dc.b    $00,$01,$02,$FE,$03,$FF
Instr_08_End:

;****************************************************************************
; Instrument $09 [FM]
; MIDI acoustic piano (GM01)
;****************************************************************************

Instr_09_Start:
    incbin  'echo/piano.eif'
Instr_09_End:

;****************************************************************************
; Instrument $0A [FM]
; MIDI square wave instrument (GM81)
;****************************************************************************

Instr_0A_Start:
    incbin  'echo/square.eif'
Instr_0A_End:

;****************************************************************************
; Instrument $0B [FM]
; MIDI sawtooth wave instrument (GM82)
;****************************************************************************

Instr_0B_Start:
    incbin  'echo/saw.eif'
Instr_0B_End:

;****************************************************************************
; Instrument $0C [FM]
; MIDI flute instrument (GM74)
;****************************************************************************

Instr_0C_Start:
    incbin  'echo/flute.eif'
Instr_0C_End:

;****************************************************************************
; Instrument $0D [PSG]
; Nepel Four PSG instrument
;****************************************************************************

Instr_0D_Start:
    dc.b    $05,$06,$FE,$07,$FF
Instr_0D_End:

;****************************************************************************
; Instrument $0E [FM]
; MIDI synth bass (GM39)
;****************************************************************************

Instr_0E_Start:
    incbin  'echo/ebass.eif'
Instr_0E_End:

;****************************************************************************
; Instrument $0F [FM]
; MIDI square wave instrument (GM81) (filtered)
;****************************************************************************

Instr_0F_Start:
    incbin  'echo/squaref.eif'
Instr_0F_End:

;****************************************************************************
; Instrument $10 [FM]
; MIDI sawtooth wave instrument (GM82) (filtered)
;****************************************************************************

Instr_10_Start:
    incbin  'echo/sawf.eif'
Instr_10_End:

;****************************************************************************
; Instrument $11 [PSG]
; Seashore
;****************************************************************************

Instr_11_Start:
    dcb.b   4, $0E
    dcb.b   4, $0D
    dcb.b   4, $0C
    dcb.b   4, $0B
    dcb.b   4, $0A
    dcb.b   4, $09
    dcb.b   4, $08
    dcb.b   4, $07
    dcb.b   4, $06
    dcb.b   60, $05
    dcb.b   4, $06
    dcb.b   4, $07
    dcb.b   4, $08
    dcb.b   4, $09
    dcb.b   4, $0A
    dcb.b   4, $0B
    dcb.b   4, $0C
    dcb.b   4, $0D
    dcb.b   4, $0E
    dc.b    $FE, $0F, $FF
Instr_11_End:

;****************************************************************************
; Instrument $12 [PSG]
; Hit-hat
;****************************************************************************

Instr_12_Start:
    dc.b    $00, $01, $02, $04, $06, $08, $0C
    dc.b    $FE, $0F, $FF
Instr_12_End:

;****************************************************************************
; Instrument $13 [PSG]
; PSG string
;****************************************************************************

Instr_13_Start:
    dcb.b   4, $0E
    dcb.b   4, $0D
    dcb.b   4, $0C
    dcb.b   4, $0B
    dcb.b   4, $0A
    dcb.b   4, $09
    dcb.b   4, $08
    dc.b    $FE, $07, $FF
Instr_13_End:

;****************************************************************************
; Instrument $14 [FM]
; Electric guitar
;****************************************************************************

Instr_14_Start:
	incbin	'echo/eguitar.eif'
Instr_14_End:

