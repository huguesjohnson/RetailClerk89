SceneEndingGood0:
	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_ENDING_BAD0

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0004	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	BlackLightFloorTilesStart
	dc.l	BlackLightFloorTilesEnd

	; tileset 2
	dc.l	EndingFrameTilesStart
	dc.l	EndingFrameTilesEnd

	; tileset 3
	dc.l	GoodEnding0TilesStart
	dc.l	GoodEnding0TilesEnd

	; tileset 4
	dc.l	TrashTilesStart
	dc.l	TrashTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	GoodEnding0Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000D	; scenery count - 1

	; background
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0003	; repeat 4 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; frame
	dc.l	PatternEndingFrameTop	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00100000	; initial drawing location

	dc.l	PatternEndingFrameBottom	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00100000+$07800000	; initial drawing location

	dc.l	PatternEndingFrameLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00000000+$00100000	; initial drawing location

	dc.l	PatternEndingFrameRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00000000+$003E0000	; initial drawing location

	; picture
	dc.l	PatternEndingGood0Floor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011001	; base pattern
	dc.w	$0002	; repeat 3 times
	dc.l	VDP_VRAM_WRITE_B+$00120000+$00800000	; initial drawing location

	dc.l	PatternEndingGood0FloorHalf	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00120000+$06800000	; initial drawing location

	dc.l	PatternEndingGoodWorkshop	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$001E0000+$00800000	; initial drawing location

	dc.l	Pattern16x32Rotated	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000001000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00260000+$04000000	; initial drawing location

	dc.l	Pattern48x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00120000+$00800000	; initial drawing location

	dc.l	Pattern48x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00320000+$00800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$04800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$04000000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001C0000+$05800000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0005	; text count

	dc.l	CreditsScreen00Line00	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000	; initial drawing location

	dc.l	CreditsScreen00Line02	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	dc.l	CreditsScreen00Line03	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A000000	; initial drawing location

	dc.l	CreditsScreen00Line04	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B000000	; initial drawing location

	dc.l	CreditsScreen00Line05	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B800000	; initial drawing location

	dc.l	CreditsScreen00Line1B	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0C800000	; initial drawing location
	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	$0000	; no collision data
	
	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_END	; north exit
	dc.w	SCENE_ID_END	; south exit
	dc.w	SCENE_ID_END	; east exit
	dc.w	SCENE_ID_END	; west exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc
	dc.w	$0000	; starting y location of npc
	dc.w	DIRECTION_LEFT	; starting direction of npc
	dc.w	$FFFF	; movement frequency of npc
	dc.l	NullMovementStart	; location of movement pattern for npc
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_End	; location of background music

SceneEndingGood1:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_ENDING_GOOD1

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	BlackLightFloorTilesStart
	dc.l	BlackLightFloorTilesEnd

	; tileset 2
	dc.l	EndingFrameTilesStart
	dc.l	EndingFrameTilesEnd

	; tileset 3
	dc.l	TrashTilesStart
	dc.l	TrashTilesEnd

	; tileset 4
	dc.l	tileset_Scene16StaffNPC_Frame9Start
	dc.l	tileset_Scene16StaffNPC_Frame9End

	; tileset 5
	dc.l	tileset_Scene0BStaffNPCPast_Frame6Start
	dc.l	tileset_Scene0BStaffNPCPast_Frame6End

	; tileset 6
	dc.l	GoodEnding1TilesStart
	dc.l	GoodEnding1TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	GoodEnding0Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000D	; scenery count - 1

	; background
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0003	; repeat 4 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; frame
	dc.l	PatternEndingFrameTop	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00100000	; initial drawing location

	dc.l	PatternEndingFrameBottom	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00100000+$07800000	; initial drawing location

	dc.l	PatternEndingFrameLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00000000+$00100000	; initial drawing location

	dc.l	PatternEndingFrameRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00000000+$003E0000	; initial drawing location

	; picture - trash

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00140000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00380000	; initial drawing location

	; picture - sprites

	dc.l	Pattern16x32Rotated	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000011101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$001C0000	; initial drawing location

	dc.l	Pattern16x32Rotated	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$002E0000	; initial drawing location

	dc.l	PatternEndingGoodMallFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00120000	; initial drawing location

	dc.l	PatternEndingGoodMallFloor2	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00120000	; initial drawing location

	dc.l	PatternEndingGoodMallFloor2	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01800000+$00120000	; initial drawing location

	dc.l	PatternEndingGoodMallFloor2	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$02800000+$00120000	; initial drawing location

	dc.l	PatternEndingGoodMallStore	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00120000	; initial drawing location


	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0008	; text count

	dc.l	CreditsScreen00Line07	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000	; initial drawing location

	dc.l	CreditsScreen00Line08	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08800000	; initial drawing location

	dc.l	CreditsScreen00Line09	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	dc.l	CreditsScreen00Line0A	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A000000	; initial drawing location

	dc.l	CreditsScreen00Line0B	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A800000	; initial drawing location

	dc.l	CreditsScreen00Line0C	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B800000	; initial drawing location

	dc.l	CreditsScreen00Line0D	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	dc.l	CreditsScreen00Line0E	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0D000000	; initial drawing location

	dc.l	CreditsScreen00Line0F	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	$0000	; no collision data
	
	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_END	; north exit
	dc.w	SCENE_ID_END	; south exit
	dc.w	SCENE_ID_END	; east exit
	dc.w	SCENE_ID_END	; west exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc
	dc.w	$0000	; starting y location of npc
	dc.w	DIRECTION_LEFT	; starting direction of npc
	dc.w	$FFFF	; movement frequency of npc
	dc.l	NullMovementStart	; location of movement pattern for npc
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_End	; location of background music

SceneEndingGood2:
	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_ENDING_GOOD2

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0003	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	BlackLightFloorTilesStart
	dc.l	BlackLightFloorTilesEnd

	; tileset 2
	dc.l	EndingFrameTilesStart
	dc.l	EndingFrameTilesEnd

	; tileset 3
	dc.l	GoodEnding2TilesStart
	dc.l	GoodEnding2TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	GoodEnding0Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000C	; scenery count - 1

	; background
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0003	; repeat 4 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; frame
	dc.l	PatternEndingFrameTop	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00100000	; initial drawing location

	dc.l	PatternEndingFrameBottom	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00100000+$07800000	; initial drawing location

	dc.l	PatternEndingFrameLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00000000+$00100000	; initial drawing location

	dc.l	PatternEndingFrameRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00000000+$003E0000	; initial drawing location

	; picture - floral arch
	dc.l	PatternEndingGoodFloralArch	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001001001
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$02800000+$001C0000	; initial drawing location

	; picture - sprites

	dc.l	Pattern16x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00280000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06800000+$00320000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06800000+$00360000	; initial drawing location

	; picture - sand

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101001
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00120000	; initial drawing location

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101001
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00260000	; initial drawing location

	; picture - water

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000111001
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00120000	; initial drawing location

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000111001
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00260000	; initial drawing location



	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0007	; text count

	dc.l	CreditsScreen00Line11	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000	; initial drawing location

	dc.l	CreditsScreen00Line12	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	dc.l	CreditsScreen00Line13	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09800000	; initial drawing location

	dc.l	CreditsScreen00Line14	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A000000	; initial drawing location

	dc.l	CreditsScreen00Line15	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A800000	; initial drawing location

	dc.l	CreditsScreen00Line16	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B800000	; initial drawing location

	dc.l	CreditsScreen00Line17	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	dc.l	CreditsScreen00Line18	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0C800000	; initial drawing location

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	$0000	; no collision data
	
	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_END	; north exit
	dc.w	SCENE_ID_END	; south exit
	dc.w	SCENE_ID_END	; east exit
	dc.w	SCENE_ID_END	; west exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc
	dc.w	$0000	; starting y location of npc
	dc.w	DIRECTION_LEFT	; starting direction of npc
	dc.w	$FFFF	; movement frequency of npc
	dc.l	NullMovementStart	; location of movement pattern for npc
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_End	; location of background music

