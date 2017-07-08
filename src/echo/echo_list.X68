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
; Brute-force location list, here to fix 'illegal relocation' errors in vasm 
; which seem to occur when bitwise operations are used on address labels 
;****************************************************************************
INSTR_00=ROM_ADDR_INSTRUMENTS
INSTR_01=INSTR_00+(Instr_00_End-Instr_00_Start)
INSTR_02=INSTR_01+(Instr_01_End-Instr_01_Start)
INSTR_03=INSTR_02+(Instr_02_End-Instr_02_Start)
INSTR_04=INSTR_03+(Instr_03_End-Instr_03_Start)
INSTR_05=INSTR_04+(Instr_04_End-Instr_04_Start)
INSTR_06=INSTR_05+(Instr_05_End-Instr_05_Start)
INSTR_07=INSTR_06+(Instr_06_End-Instr_06_Start)
INSTR_08=INSTR_07+(Instr_07_End-Instr_07_Start)
INSTR_09=INSTR_08+(Instr_08_End-Instr_08_Start)
INSTR_0A=INSTR_09+(Instr_09_End-Instr_09_Start)
INSTR_0B=INSTR_0A+(Instr_0A_End-Instr_0A_Start)
INSTR_0C=INSTR_0B+(Instr_0B_End-Instr_0B_Start)
INSTR_0D=INSTR_0C+(Instr_0C_End-Instr_0C_Start)
INSTR_0E=INSTR_0D+(Instr_0D_End-Instr_0D_Start)
INSTR_0F=INSTR_0E+(Instr_0E_End-Instr_0E_Start)
INSTR_10=INSTR_0F+(Instr_0F_End-Instr_0F_Start)
INSTR_11=INSTR_10+(Instr_10_End-Instr_10_Start)
INSTR_12=INSTR_11+(Instr_11_End-Instr_11_Start)
INSTR_13=INSTR_12+(Instr_12_End-Instr_12_Start)
INSTR_14=INSTR_13+(Instr_13_End-Instr_13_Start)

;****************************************************************************
; PointerList
; Pointer list used by Echo
;****************************************************************************

EchoPointerList:
	Echo_ListEntry INSTR_00		; $00 [PSG] Flat PSG instrument
	Echo_ListEntry INSTR_01		; $01 [FM] Distortion guitar
	Echo_ListEntry INSTR_02		; $02 [PCM] Snare drum
	Echo_ListEntry INSTR_03		; $03 [PCM] Bass drum (kick)
	Echo_ListEntry INSTR_04		; $04 [FM] String ensemble
	Echo_ListEntry INSTR_05		; $05 [FM] Standard bass
	Echo_ListEntry INSTR_06		; $06 [PSG] Soft PSG envelope
	Echo_ListEntry INSTR_07		; $07 [PSG] Piano PSG instrument
	Echo_ListEntry INSTR_08		; $08 [PSG] MIDI square lead
	Echo_ListEntry INSTR_09		; $09 [FM] MIDI piano
	Echo_ListEntry INSTR_0A		; $0A [FM] MIDI square lead
	Echo_ListEntry INSTR_0B		; $0B [FM] MIDI sawtooth lead
	Echo_ListEntry INSTR_0C		; $0C [FM] MIDI flute
	Echo_ListEntry INSTR_0D		; $0D [PSG] Nepel Four PSG instr.
	Echo_ListEntry INSTR_0E		; $0E [FM] MIDI synth bass
	Echo_ListEntry INSTR_0F		; $0F [FM] MIDI square (filtered)
	Echo_ListEntry INSTR_10		; $10 [FM] MIDI sawtooth (filtered)
	Echo_ListEntry INSTR_11		; $11 [PSG] Seashore
	Echo_ListEntry INSTR_12		; $12 [PSG] Hit-hat
	Echo_ListEntry INSTR_13		; $13 [PSG] PSG string
	Echo_ListEntry INSTR_14		; $14 [FM] Electric guitar
    Echo_ListEnd

