;-------------------------------------------------------------------------------
; VDP initialization data
; some values used are from http://www.hacking-cult.org/?r/18/30
; some other values used are from http://md.squee.co/VDP
; inline documentation from http://devster.monkeeh.com/sega/yavdp.html
;-------------------------------------------------------------------------------
VDPInitDataStart:
	;---------------------------------------------------------------------------
	; Register 0: Mode Set Register 1 - [move.w #$80xx,($C00004)]
	; bit 0 = Display Disable (0: Disabled, 1: Enabled)  
	; bit 1 = HV Counter Latch Enabled (0: Disabled, 1: Enabled)
	; bit 2 = Palette Select (0: 3-bit palette, 1: 9-bit palette)
	; bit 3 = Not used?
	; bit 4 = Horizontal Interrupt Enable (0: Disabled, 1: Enabled)
	; bit 5 = Not used
	; bit 6 = Not used
	; bit 7 = Not used
	;---------------------------------------------------------------------------
	dc.w	$8004	; 04=00000100 -> 9-bit palette, everything else disabled
	
	;---------------------------------------------------------------------------
	; Register 1: Mode Set Register 2 - [move.w #$81xx,($C00004)]
	; bit 0 = Not used
	; bit 1 = Not used
	; bit 2 = SMS Mode (0: Do nothing, 1: SMS/Genesis display modes)
	; bit 3 = PAL/NTSC (0: NTSC, 1: PAL)
	; bit 4 = DMA Enable (0: Disabled, 1: Enabled)
	; bit 5 = Vertical Interrupt Enable (0: Disabled, 1: Enabled)
	; bit 6 = Display Enable (0: Disable display+draw backdrop only, 1: Enabled)
	; bit 7 = TMS9918 Mode (0: Genesis mode, 1: SMS mode)
	;---------------------------------------------------------------------------
	dc.w	$8174	; 74=01110100 -> Genesis display mode, DMA & V-int enabled
	             
	;---------------------------------------------------------------------------
	; Register 2: VRAM Address for Scroll A - [move.w #$82xx,($C00004)]
	; bit 0 = Not used
	; bit 1 = Not used
	; bit 2 = Not used
	; bits 3-5 = bits 15-13 in the address of the pattern name table
	; bit 6 = Not used
	; bit 7 = Not used
	;---------------------------------------------------------------------------
	dc.w	$8230	; 30=00110000 -> 1100000000000000 -> $C000
					; 01000000000000000000000000000011 -> 40000003
	
	;---------------------------------------------------------------------------
	; Register 3: VRAM Address for Window - [move.w #$83xx,($C00004)]
	; bit 0 = Not used
	; bits 1-5 = bits 15-11 in the address of the pattern name table
	; bit 6 = Not used
	; bit 7 = Not used
	;---------------------------------------------------------------------------
	dc.w	$8328	; 3E=00101000 -> 1010000000000000 -> $A000
					; 01100000000000000000000000000010 -> 60000002

	;---------------------------------------------------------------------------
	; Register 4: VRAM Address for Scroll B - [move.w #$84xx,($C00004)]
	; bits 0-2 = bits 15-13 in the address of the pattern name table
	; bit 3 = Not used
	; bit 4 = Not used
	; bit 5 = Not used
	; bit 6 = Not used
	; bit 7 = Not used
	;---------------------------------------------------------------------------
	dc.w	$8407	; 07=00000111 -> 1110000000000000 -> $E000
					; 01100000000000000000000000000011 -> 60000003
	
	;---------------------------------------------------------------------------
	; Register 5: VRAM Address for Sprite Attributes - [move.w #$85xx,($C00004)]
	; bits 0-6 = bits 15-9 in the address of the pattern name table
	; bit 7 = Not used
	;---------------------------------------------------------------------------
	dc.w	$855C	; 5C=01011100 -> 1011100000000000 -> $B800
					; 01111000000000000000000000000010 -> 78000002

	;---------------------------------------------------------------------------
	; Register 6: Not used (used by Master System?)
	;---------------------------------------------------------------------------
	dc.w	$8600	; unused

	;---------------------------------------------------------------------------
	; Register 7: Backdrop Color - [move.w #$87xx,($C00004)]
	; bits 0-3 = Which palette to use (0-3)
	; bits 5-4 = Which color to use in the selected palette (0-15)
	; bit 6 = Not used
	; bit 7 = Not used
	;---------------------------------------------------------------------------
	dc.w	$8700	; background color, last two digits are palette#+color#

	;---------------------------------------------------------------------------
	; Register 8: Not used (used by Master System?)
	;---------------------------------------------------------------------------
	dc.w	$8800	; unused

	;---------------------------------------------------------------------------
	; Register 9: Not used (used by Master System?)
	;---------------------------------------------------------------------------
	dc.w	$8900	; unused

	;---------------------------------------------------------------------------
	; Register 10: Horizontal Interrupt Register - [move.w #$8Axx,($C00004)]
	; bits 0-7 = The number of lines it takes to generate a h-int
	;---------------------------------------------------------------------------
	dc.w	$8A00	; HInterrupt register 0 = h-int generated every line

	;---------------------------------------------------------------------------
	; Register 11: Mode Set Register No. 3 - [move.w #$8Bxx,($C00004)]
	; bits 0-1 = Horizontal Scroll Mode
	; 	00=full screen scrolling, 01||11=line scrolling, 11=cell scrolling
	; bit 2 = Vertical Scroll Mode
	; 	0=full screen scrolling, 1=two-cell column based vertical scrolling
	; bit 3 = External Interrupt Enabled (0: Disabled, 1: Enabled)
	; bit 4 = Not used
	; bit 5 = Not used
	; bit 6 = Not used
	; bit 7 = Not used
	;---------------------------------------------------------------------------
	dc.w	$8B00	; full screen scroll, no external interrupts
	
	;---------------------------------------------------------------------------
	; Register 12: Mode Set Register No. 4 - [move.w #$8Cxx,($C00004)]
	; bits 0+7 = cell mode 
	; 	0,0=32=cells display, 1,1=40 cells display, 0,1 & 1,0 are invalid
	; bits 1-2 = Interlace Mode
	;	00,10=No interlace, 01=Interlace (normal), 11=Interlace (double)
	; bit 3 = Shadow/Highlighting Mode Enabled  (0: Disabled, 1: Enabled)
	; bit 4 = Not used
	; bit 5 = Not used
	; bit 6 = Not used
	;---------------------------------------------------------------------------
	dc.w	$8C81	; 81 = 10000001 -> 40 cell display, no interlace

	;---------------------------------------------------------------------------
	; Register 13: Horizontal Scroll VRAM Address - [move.w #$8Dxx,($C00004)]
	; bits 0-5 = bits 15-10 in the address of the pattern name table
	; bit 6 = Not used
	; bit 7 = Not used
	;---------------------------------------------------------------------------
	dc.w	$8D2F	; 2F=00101111 -> 1011110000000000 -> $BC00
					; 01111100000000000000000000000010 -> 7C000002

	;---------------------------------------------------------------------------
	; Register 14: Not used
	;---------------------------------------------------------------------------
	dc.w	$8E00	; unused

	;---------------------------------------------------------------------------
	; Register 15: Auto Increment Data - [move.w #$8Fxx,($C00004)]
	; bits 0-7 = value added to the VDP's address register after every r/w
	;---------------------------------------------------------------------------
	dc.w	$8F02	; VDP auto increment

	;---------------------------------------------------------------------------
	; Register 16: Scroll Size - [move.w #$90xx,($C00004)]
	; bits 0-1 = Horizontal Scroll Size 
	; 	00 = 32-cells, 01 = 64-cells, 10 = invalid, 11 = 128-cells
	; bit 2 = Not used
	; bit 3 = Not used
	; bits 4-5 = Vertical Scroll Size
	; 	00 = 32-cells, 01 = 64-cells, 10 = invalid, 11 = 128-cells
	; bit 6 = Not used
	; bit 7 = Not used
	;---------------------------------------------------------------------------
	dc.w	$9001	; 01 = 00000001 -> 64 cells hscroll, 32 cells vscroll 

	;---------------------------------------------------------------------------
	; Register 17: Window Horizontal Position - [move.w #$91xx,($C00004)]
	; bits 0-4 = how many cells to move the window plane horizontally
	; bit 5 = Not used
	; bit 6 = Not used
	; bit 7 = Direction to move the window plane horizontally (0=left, 1=right)
	;---------------------------------------------------------------------------
	dc.w	$9100	; window H position

	;---------------------------------------------------------------------------
	; Register 18: Window Vertical Position - [move.w #$92xx,($C00004)]
	; bits 0-4 = how many cells to move the window plane vertically
	; bit 5 = Not used
	; bit 6 = Not used
	; bit 7 = Direction to move the window plane vertically (0=up, 1=down)	
	;---------------------------------------------------------------------------
	dc.w	$9200	; window V position

	;---------------------------------------------------------------------------
	; Register 19: DMA length low word - [move.w #$93xx,($C00004)]
	; bits 0-7 = low bytes of DMA length
	;---------------------------------------------------------------------------
	dc.w	$93FF	; DMA length low
	
	;---------------------------------------------------------------------------
	; Register 20: DMA length high word - [move.w #$94xx,($C00004)]
	; bits 0-7 = high bytes of DMA length
	;---------------------------------------------------------------------------
	dc.w	$94FF	; DMA length high

	;---------------------------------------------------------------------------
	; Register 21: DMA source address low word - [move.w #$95xx,($C00004)]
	; bits 0-7 = low bytes of DMA source address
	;---------------------------------------------------------------------------
	dc.w	$9500	; DMA source address low

	;---------------------------------------------------------------------------
	; Register 22: DMA source address high word - [move.w #$96xx,($C00004)]
	; bits 0-7 = high bytes of DMA source address
	;---------------------------------------------------------------------------
	dc.w	$9600	; DMA source address high

	;---------------------------------------------------------------------------
	; Register 23: DMA Type - [move.w #$97xx,($C00004)]
	; If bit 7 is 0:
	;	DMA type is Memory to VRAM
	;	bits 0-6 = bits 22-16 of DMA source address
	; If bit 7 is 1:
	;	DMA type is VRAM fill (if bit 6 = 0) or VRAM to VRAM copy (if bit 6 = 1)
	;	bits 0-5 are ignored
	;---------------------------------------------------------------------------
	dc.w	$9780	; DMA Type
VDPInitDataEnd:
