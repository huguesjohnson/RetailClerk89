;-------------------------------------------------------------------------------
; debug registers
;-------------------------------------------------------------------------------
MEM_DEBUG_1=$FFFF0000	; general debug register
MEM_DEBUG_2=$FFFF0002	; general debug register
;-------------------------------------------------------------------------------
; counters
;-------------------------------------------------------------------------------
MEM_VBLANKFLAG=$FFFF0004	; indicates whether vblank in-progess
MEM_VBLANK_COUNTER=$FFFF0006	; incremented at vblank - used for debug & RNG
MEM_MAINLOOP_COUNTER=$FFFF0008	; used for debug & RNG
MEM_FRAME_COUNTER=$FFFF000A	; current frame - cycles from 0-59
;-------------------------------------------------------------------------------
; program flow
;-------------------------------------------------------------------------------
MEM_NPC_LOOP_COUNTER=$FFFF000C	; used for loop control in main
;-------------------------------------------------------------------------------
; controller input
;-------------------------------------------------------------------------------
MEM_CONTROL_HELD=$FFFF000E	; store value of a held button
MEM_CONTROL_PRESSED=$FFFF0010	; store value of a pressed button
;-------------------------------------------------------------------------------
; game state
;-------------------------------------------------------------------------------
MEM_GAME_STATE=$FFFF0012	; used to control the main loop flow
MEM_ACTION_TARGET_OBJID=$FFFF0016	; action target object id
MEM_NPC_LOCATIONS=$FFFF0018	; table to track where NPCs are located
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF001C	; track if sprite order has changed
;-------------------------------------------------------------------------------
; dialog management
;-------------------------------------------------------------------------------
MEM_DIALOG_FLAGS=$FFFF001E	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF0022	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF0026	; pointer to VPD location to write text
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_PLAYER_SPRITE_ID=$FFFF002A	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF002C	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF002E	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF0030	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF0032	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF0034	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF0036	; used to determine when to move
MEM_PLAYER_SPRITE_LINK_TO=$FFFF0038	; sprite ID the player sprite links to
MEM_PLAYER_SPRITE_LINK_FROM=$FFFF003A	; sprite ID linked to the player sprite
MEM_NPC0_SPRITE_ID=$FFFF003C	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF003E	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF0040	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF0042	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF0044	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0046	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0048	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF004A	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF004C	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF004E	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF0052	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0054	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0056	; sprite table id of NPC0 sprite
MEM_NPC1_SPRITE_X=$FFFF0058	; virtual x position of NPC0 sprite
MEM_NPC1_SPRITE_Y=$FFFF005A	; virtual y position of NPC0 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF005C	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF005E	; which direction NPC0 faces
MEM_NPC1_SPRITE_FRAME=$FFFF0060	; animation frame of NPC0 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0062	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0064	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0066	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0068	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF006C	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF006E	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF0070	; sprite table id of NPC0 sprite
MEM_NPC2_SPRITE_X=$FFFF0072	; virtual x position of NPC0 sprite
MEM_NPC2_SPRITE_Y=$FFFF0074	; virtual y position of NPC0 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0076	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0078	; which direction NPC0 faces
MEM_NPC2_SPRITE_FRAME=$FFFF007A	; animation frame of NPC0 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF007C	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF007E	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF0080	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0082	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0086	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0088	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF008A	; sprite table id of NPC0 sprite
MEM_NPC3_SPRITE_X=$FFFF008C	; virtual x position of NPC0 sprite
MEM_NPC3_SPRITE_Y=$FFFF008E	; virtual y position of NPC0 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF0090	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0092	; which direction NPC0 faces
MEM_NPC3_SPRITE_FRAME=$FFFF0094	; animation frame of NPC0 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0096	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0098	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF009A	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF009C	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF00A0	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF00A2	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF00A4	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF00A6	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF00A8	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF00AA	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF00AC	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF00AE	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF00B0	; row of map data
MEM_COLLISION_RESULT=$FFFF00B4	; result of collision test
;-------------------------------------------------------------------------------
; map scroll management
;-------------------------------------------------------------------------------
MEM_MAP_POSITION_X=$FFFF00B6	; x position of the map
MEM_MAP_POSITION_Y=$FFFF00B8	; y position of the map
MEM_FLAG_MAP_POSITION_CHANGED=$FFFF00BA	; >0 if map position changed
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF00BC	; ID of the active scene
MEM_ACTIVE_NPC_COUNT=$FFFF00BE	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF00C0	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF00FC	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF0114	; collision data for the current map
