;*******************************************************************************
; initialization
;*******************************************************************************
		
Start:
	tst.l	(CTRL_1_CONTROL).l	; test controller 1
	bne	SecurityCheck
	tst.w	(CTRL_2_CONTROL).l	; test controller 2
	; if no controllers are detected should we branch to an error screen?

SecurityCheck:
	move.b	(REG_HWVERSION),d0	; get the hardware version
	andi.b	#$0F,d0				; the last four bits contains the version
	beq.b	SkipSecurity		; skip the next instruction on v1 hardware
	move.l	#'SEGA',(REG_TMS)	; otherwise copy 'SEGA' to TMS register
SkipSecurity:

InitVDP:
	lea	(VDPInitDataStart),a0	; load the address of the VDP init data to a0
	move.w	#(VDPInitDataEnd-VDPInitDataStart)/2,d1	; length of init data to d1
InitVDPDataLoop:
	move.w	(a0)+,(VDP_CONTROL)	; write the init data
	dbf	d1,InitVDPDataLoop		; decrement value of d1 and loop if not 0

ClearRAM:
	lea	(RAM_START).l,a0
	move.w	#$0000,d1
ClearRAMLoop:
	move.l	#0,(a0)+
	dbf	d1,ClearRAMLoop

ClearCRAM:
	move.l	#VDP_CRAM_WRITE,(VDP_CONTROL); set VDP ctrl to CRAM write
	move.w	#$3f,d1	; 3f = 63 = (64 palettes in CRAM - 1 since loop counts to 0)
ClearCRAMLoop:
	move.w	#0,(VDP_DATA)
	dbf	d1,ClearCRAMLoop

InitEcho:
	lea (EchoPointerList),a0
	bsr.w Echo_Init

