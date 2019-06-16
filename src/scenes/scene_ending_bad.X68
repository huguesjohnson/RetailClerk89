SceneEndingBad0:
	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_ENDING_BAD0

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0008	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	BadEndingBackgroundTilesStart
	dc.l	BadEndingBackgroundTilesEnd

	; tileset 2
	dc.l	EndingFrameTilesStart
	dc.l	EndingFrameTilesEnd

	; tileset 3
	dc.l	PavementTilesStart
	dc.l	PavementTilesEnd

	; tileset 4
	dc.l	SnowTilesStart
	dc.l	SnowTilesEnd

	; tileset 5
	dc.l	MallExteriorTilesStart
	dc.l	MallExteriorTilesEnd

	; tileset 6
	dc.l	BadEnding0TilesStart
	dc.l	BadEnding0TilesEnd

	; tileset 7
	dc.l	tileset_PlayerDani_Frame3Start
	dc.l	tileset_PlayerDani_Frame3End

	; tileset 8
	dc.l	tileset_PlayerDB_Frame3Start
	dc.l	tileset_PlayerDB_Frame3End

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	BadEnding0Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0012	; scenery count - 1

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

	; picture - driveway
	dc.l	Pattern32x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00200000	; initial drawing location

	dc.l	Pattern32x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000011001	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00280000	; initial drawing location

	; picture - snow
	dc.l	Pattern32x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000101001	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00120000	; initial drawing location

	dc.l	Pattern32x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000101001	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03800000+$001A0000	; initial drawing location

	dc.l	Pattern32x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000101001	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03800000+$002E0000	; initial drawing location

	dc.l	Pattern32x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000101001	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00360000	; initial drawing location

	; house siding
	dc.l	PatternMallExteriorSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00120000	; initial drawing location

	dc.l	PatternMallExteriorSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$01800000+$00120000	; initial drawing location

	dc.l	PatternMallExteriorSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00260000	; initial drawing location

	dc.l	PatternMallExteriorSide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$01800000+$00260000	; initial drawing location

	; door
	dc.l	PatternEndingBadDoubleDoor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111101	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00220000	; initial drawing location

	; light

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001010110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00300000	; initial drawing location

	; sprites

	dc.l	Pattern16x32Rotated	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000001011010	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$04000000+$002A0000	; initial drawing location

	dc.l	Pattern16x32Rotated	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000001100010	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00220000	; initial drawing location

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

SceneEndingBad1:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_ENDING_BAD1

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	BadEndingBackgroundTilesStart
	dc.l	BadEndingBackgroundTilesEnd

	; tileset 2
	dc.l	EndingFrameTilesStart
	dc.l	EndingFrameTilesEnd

	; tileset 3
	dc.l	TackyFloorTilesStart
	dc.l	TackyFloorTilesEnd

	; tileset 4
	dc.l	tileset_PlayerDani_Frame0Start
	dc.l	tileset_PlayerDani_Frame0End

	; tileset 5
	dc.l	tileset_Scene09StaffNPC_Frame9Start
	dc.l	tileset_Scene09StaffNPC_Frame9End

	; tileset 6
	dc.l	BadEnding1TilesStart
	dc.l	BadEnding1TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	BadEnding0Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000B	; scenery count - 1

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

	; picture - floor

	dc.l	PatternEndingBadCarpet	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011001	; base pattern
	dc.w	$0002	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B+$01800000+$00120000	; initial drawing location

	; picture - sprites

	dc.l	Pattern16x32Rotated	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000011110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00140000	; initial drawing location

	dc.l	Pattern16x32Rotated	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000100110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$03000000+$002E0000	; initial drawing location

	dc.l	Pattern16x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$03000000+$00340000	; initial drawing location

	; picture - couch

	dc.l	PatternEndingBadCouch	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00180000	; initial drawing location

	; picture - tables

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000010	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00120000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000010	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00380000	; initial drawing location

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

SceneEndingBad2:
	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_ENDING_BAD2

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	BadEndingBackgroundTilesStart
	dc.l	BadEndingBackgroundTilesEnd

	; tileset 2
	dc.l	EndingFrameTilesStart
	dc.l	EndingFrameTilesEnd

	; tileset 3
	dc.l	tileset_PlayerDB_Frame0Start
	dc.l	tileset_PlayerDB_Frame0End

	; tileset 4
	dc.l	SnowTilesStart
	dc.l	SnowTilesEnd

	; tileset 5
	dc.l	WoodFloorVTilesStart
	dc.l	WoodFloorVTilesEnd

	; tileset 6
	dc.l	BadEnding2TilesStart
	dc.l	BadEnding2TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	BadEnding0Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000F	; scenery count - 1

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

	; picture - sprite

	dc.l	Pattern16x32Rotated	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000011001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$03000000+$00160000	; initial drawing location

	; picture - patio

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110001
	dc.w	$0000	; repeat 0 times 
	dc.l	VDP_VRAM_WRITE_B+$01800000+$00120000	; initial drawing location

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110001
	dc.w	$0000	; repeat 0 times 
	dc.l	VDP_VRAM_WRITE_B+$01800000+$00260000	; initial drawing location

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110001
	dc.w	$0000	; repeat 0 times 
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00120000	; initial drawing location

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110001
	dc.w	$0000	; repeat 0 times 
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00260000	; initial drawing location

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110001
	dc.w	$0000	; repeat 0 times 
	dc.l	VDP_VRAM_WRITE_B+$05800000+$00120000	; initial drawing location

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110001
	dc.w	$0000	; repeat 0 times 
	dc.l	VDP_VRAM_WRITE_B+$05800000+$00260000	; initial drawing location

	; picture - snow

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00120000	; initial drawing location

	dc.l	Pattern32x32x3	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00260000	; initial drawing location

	; picture - passed out dude

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000001000001
	dc.w	$0000	; repeat 0 times 
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00340000	; initial drawing location

	; picture - hot tub
	dc.l	Pattern80x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001001001
	dc.w	$0000	; repeat 0 times 
	dc.l	VDP_VRAM_WRITE_B+$05800000+$001E0000	; initial drawing location

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

