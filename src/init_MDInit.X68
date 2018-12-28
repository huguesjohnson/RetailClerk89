;*******************************************************************************
; initialization
;*******************************************************************************
		
Start:

	move.w	#$2700,sr		; disable interrupts

SecurityCheck:
	move.b	(REG_HWVERSION),d0	; get the hardware version
	andi.b	#$0F,d0				; the last four bits contains the version
	beq.b	SkipSecurity		; skip the next instruction on v1 hardware
	move.l	#'SEGA',(REG_TMS)	; otherwise copy 'SEGA' to TMS register
SkipSecurity:

	if _ATGAMES_HACKS
    ; AtGames audio fix
	; https://bigevilcorporation.co.uk/2018/04/18/taming-the-atgames-firecore/
	move.w #$FFFF,($00000000)  ; Latch 0x0000
	move.b #$78,($00B00018)    ; Write new PSG frequency
	move.b #$26,($00B01054)    ; Write new FM frequency
	move.b #$20,($00B01055)    ; Write new FM clock
	move.w #$FFF7,($00000000)  ; Latch 0x0000
	endif

InitController:
	move.b	#$40,(CTRL_1_CONTROL)
	move.b	#$40,(CTRL_1_DATA)

InitVDP:
	lea	(VDPInitDataStart),a0	; load the address of the VDP init data to a0
	move.w	#(VDPInitDataEnd-VDPInitDataStart)/2,d1	; length of init data to d1
InitVDPDataLoop:
	move.w	(a0)+,(VDP_CONTROL)	; write the init data
	dbf	d1,InitVDPDataLoop		; decrement value of d1 and loop if not 0

ClearCRAM:
	move.l	#VDP_CRAM_WRITE,(VDP_CONTROL); set VDP ctrl to CRAM write
	move.w	#$003f,d1	; 3f = 63 = (64 palettes in CRAM - 1)
ClearCRAMLoop:
	if _DEBUG_
	move.w	#$FFFF,(VDP_DATA)
	else
	move.w	#$0000,(VDP_DATA)
	endif
	dbf	d1,ClearCRAMLoop

; clear VRAM - prevents garbage tiles from showing at boot on clone systems
	bsr.w	ClearVRAM	; clear VRAM

ClearRAM:
	lea	MEM_START,a0
	move.w	#(MEM_END-MEM_START),d1
ClearRAMLoop:
	move.w	#$0000,(a0)+
	dbf	d1,ClearRAMLoop

InitEcho:
	lea (EchoPointerList),a0
	jsr Echo_Init

	move.w	#$2000,sr		; re-enable interrupts
