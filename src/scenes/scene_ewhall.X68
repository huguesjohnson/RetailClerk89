SceneEWHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_EWHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0001	; tileset count - 1

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	DebugWireframeTilesStart	; start of hallway tiles
	dc.l	DebugWireframeTilesEnd	; end of hallway tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.w	$0004	; four palettes
	dc.l	Store06Palettes	; start of first palette to load

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0004	; scenery count - 1

	; store front
	dc.l	PatternDebugWireFrameNorthWindow	; location of pattern to load
;	; pccvhnnnnnnnnnnn
;	; 0000000000000001	
	dc.w	$0001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; floor - top border
	dc.l	PatternDebugWireFrameFloor	; location of first pattern to load
;	; pccvhnnnnnnnnnnn
;	; 0000000000000001	
	dc.w	$0001	; base pattern
	dc.w	$0002	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; floor - bottom border
	dc.l	PatternDebugWireFrameFloor	; location of first pattern to load
;	; pccvhnnnnnnnnnnn
;	; 0000000000000001	
	dc.w	$0001	; base pattern
	dc.w	$0002	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B+$0C800000	; initial drawing location

	; north store frame
	dc.l	PatternDebugWireFrameNorthFrameClosed ; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000000001	
	dc.w	$8001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; south store frame
	dc.l	PatternDebugWireFrameSouthFrameOpen	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 1000000000000001	
	dc.w	$8001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0D800000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0000	; text count

	dc.l	StoreName06	; location of string to display
	dc.w	DIALOG_BASE_TILE	; base pattern
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
	dc.w	DEFAULT_COLLISION_DATA_SIZE	; collision data size
	
	dc.l	MapStore06Collision	; location of collision data

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_DENIMCOUNTRY	; south exit
	dc.w	SCENE_ID_CHECKERS	; north exit
	dc.w	SCENE_ID_CENTER	; west exit
	dc.w	SCENE_ID_EEHALL	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc0
	dc.w	$0000	; starting y location of npc0
	dc.w	DIRECTION_LEFT	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NullMovementStart	; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Store0	; location of background music

