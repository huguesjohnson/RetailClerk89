SceneWorkshop:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WORKSHOP

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0003	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	CarpetFloorTilesStart	; start of floor tiles
	dc.l	CarpetFloorTilesEnd	; end of floor tiles

	; tileset 3
	dc.l	WorkshopFrameTilesStart	; start of frame tiles
	dc.l	WorkshopFrameTilesEnd	; end of frame tiles

	; tileset 3
	dc.l	WorkshopTilesStart	; start of workshop tiles
	dc.l	WorkshopTilesEnd	; end of workshop tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store0DPalettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0017	; scenery count - 1

	; carpet floor
	dc.l	PatternFloor
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$0005	; repeat 6 times
	dc.l	VDP_VRAM_WRITE_B+$08000000	; initial drawing location

	; fake snow floor
	dc.l	Pattern32x32Tile
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0003	; repeat 4 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; frame
	dc.l	PatternWorkshopFrameSouthWest
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	dc.l	PatternWorkshopFrameSouthEast
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$002E0000	; initial drawing location

	dc.l	PatternWorkshopFrameSide
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	dc.l	PatternWorkshopFrameSide
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$004E0000+$00800000	; initial drawing location

	dc.l	PatternWorkshopFrameNorth
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00000000	; initial drawing location

	; left fence
	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$00020000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$00080000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$000E0000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$00140000	; initial drawing location

	; right fence
	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$00480000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$00420000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$003C0000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$00360000	; initial drawing location

	; workshop
	dc.l	PatternWorkshop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000101010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$01000000+$001E0000	; initial drawing location

	; poles
	dc.l	PatternWorkshopPole
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001110110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$001A0000	; initial drawing location

	dc.l	PatternWorkshopPole
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001110110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00320000	; initial drawing location

	; trees
	dc.l	Pattern24x48
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00040000	; initial drawing location

	dc.l	Pattern24x48
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$000C0000	; initial drawing location

	dc.l	Pattern24x48
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00140000	; initial drawing location

	dc.l	Pattern24x48
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00360000	; initial drawing location

	dc.l	Pattern24x48
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$003E0000	; initial drawing location

	dc.l	Pattern24x48
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00460000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_SCENE_FENCE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011100010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0001110011110010

	dc.w	OBJ_SCENE_FENCE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011100101011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0001110011110010

	dc.w	OBJ_SCENE_POLE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0001100011101010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0001110011110010

	dc.w	OBJ_SCENE_POLE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0001100101001010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0001110011110010

	dc.w	OBJ_SCENE_WORKSHOP
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1001110011111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011101000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.w	DEFAULT_COLLISION_DATA_SIZE	; collision data size
	
	dc.l	MapStore0DCollision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CENTER	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0001	; two npc slots

	dc.w	$00F8	; starting x location of npc0
	dc.w	$00F0	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$0035	; movement frequency of npc0
	dc.l	NPCMovementScene0D0Start	; location of movement pattern for npc1
	dc.w	(NPCMovementScene0D0End-NPCMovementScene0D0Start-1)	; pattern length

	dc.w	$0138	; starting x location of npc1
	dc.w	$00F0	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc1
	dc.w	$0065	; movement frequency of npc1
	dc.l	NPCMovementScene0D1Start	; location of movement pattern for npc0
	dc.w	(NPCMovementScene0D1End-NPCMovementScene0D1Start-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

