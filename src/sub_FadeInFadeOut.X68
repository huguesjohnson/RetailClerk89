;-------------------------------------------------------------------------------
; FadeIn
; Fades in the screen to MEM_SCENE_PALETTE, MEM_SCENE_PALETTE is not modified
; a0, d0-d3 are modified
;-------------------------------------------------------------------------------
FadeIn:
	move.w	#$0002,d3	; d3 is the number of times to loop
LoadSceneFadeInOuterLoop:
	move.w	d3,d2	; d2 will be used as the lsr loop counter
	bsr.w	FadeFrameDelay	; fade in/out delay frames
	bsr.w	WaitVBlankStart	; wait to load palettes until VBlank starts
	move.l	#VDP_CRAM_WRITE,(VDP_CONTROL) ; set up VDP write to CRAM
	lea	(MEM_SCENE_PALETTE),a0	; point a0 to the now previous scene palette
	move.w	#$003F,d0	; 64 words of palette data
LoadSceneFadeInInnerLoop:
	move.w	(a0)+,d1	; get the next palette entry
	tst.w	d3	; is d3 0?
	beq.s	LoadSceneFadeInWritePaletteEntry; if d3 is then then done fading
LoadSceneFadeInLsrLoop:
	lsr.w	#$01,d1	; shift bits to the right to decrease color intensity
	;	      0000BBBSGGGSRRRS
	and.w	#%0000111011101110,d1	; prevent color overflow
	dbf	d2,LoadSceneFadeInLsrLoop	; loop until done shifting
LoadSceneFadeInWritePaletteEntry:
	move.w	d1,(VDP_DATA)	; write the palette entry
	move.w	d3,d2	; reset d2
	dbf	d0,LoadSceneFadeInInnerLoop	; decrement d0 and loop
	dbf	d3,LoadSceneFadeInOuterLoop	; decrement d3 and loop
ExitFadeIn:
	rts	; exit

;-------------------------------------------------------------------------------
; FadeOut
; Fades out the screen to black, MEM_SCENE_PALETTE is not modified
; a0, d0-d3 are modified
;-------------------------------------------------------------------------------
FadeOut:
	move.w	#$0000,d3	; d3 is the number of times to loop
FadeOutOuterLoop:
	move.w	d3,d2	; d2 will be used as the lsr loop counter
	bsr.w	FadeFrameDelay	; fade in/out delay frames
	bsr.w	WaitVBlankStart	; wait to load palettes until VBlank starts
	move.l	#VDP_CRAM_WRITE,(VDP_CONTROL) ; set up VDP write to CRAM
	lea	(MEM_SCENE_PALETTE),a0	; point a0 to the now previous scene palette
	move.w	#$003F,d0	; 64 words of palette data
FadeOutInnerLoop:
	move.w	(a0)+,d1	; get the next palette entry
FadeOutLsrLoop:
	lsr.w	#$01,d1	; shift bits to the right to decrease color intensity
	;	      0000BBBSGGGSRRRS
	and.w	#%0000111011101110,d1	; prevent color overflow
	dbf	d2,FadeOutLsrLoop	; loop until done shifting
	move.w	d1,(VDP_DATA)	; write the palette entry
	move.w	d3,d2	; reset d2
	dbf	d0,FadeOutInnerLoop	; decrement d0 and loop
	addq	#$0001,d3	; increment d3
	cmpi.w	#$0003,d3	; loop for three shifts
	blt.s	FadeOutOuterLoop	; loop until fade is complete
ExitFadeOut:
	rts	; exit

FadeFrameDelay:
	move.w	#FADE_FRAME_DELAY,d1	; copy frame delay to d1
FadeFrameDelayLoop:
	bsr.w	WaitVBlank	; force waiting for a frame
	dbf.w	d1,FadeFrameDelayLoop	; frame delay loop
	rts	; exit
