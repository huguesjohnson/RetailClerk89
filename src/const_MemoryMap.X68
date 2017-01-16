;-------------------------------------------------------------------------------
; debug registers
;-------------------------------------------------------------------------------
MEM_DEBUG_1=$FFFF0000	; general debug register
MEM_DEBUG_2=$FFFF0002	; general debug register
;-------------------------------------------------------------------------------
; counters
;-------------------------------------------------------------------------------
MEM_VBLANK_COUNTER=$FFFF0004	; incremented at vblank - used for debug & RNG
MEM_MAINLOOP_COUNTER=$FFFF0006	; used for debug & RNG
MEM_FRAME_COUNTER=$FFFF0008	; current frame - cycles from 0-59
;-------------------------------------------------------------------------------
; program flow
;-------------------------------------------------------------------------------
MEM_NPC_LOOP_COUNTER=$FFFF000A	; used for loop control in main
;-------------------------------------------------------------------------------
; controller input
;-------------------------------------------------------------------------------
MEM_CONTROL_HELD=$FFFF000C	; store value of a held button
MEM_CONTROL_PRESSED=$FFFF000E	; store value of a pressed button
;-------------------------------------------------------------------------------
; game state
;-------------------------------------------------------------------------------
MEM_GAME_STATE=$FFFF0010	; used to control the main loop flow
MEM_ACTION_ID=$FFFF0014	; current action selected by player
MEM_ACTION_TARGET_OBJID=$FFFF0016	; action target object id
MEM_ACTION_TABLE_OFFSET=$FFFF0018	; relative address of action table entry
MEM_NPC_LOCATIONS=$FFFF001A	; table to track where NPCs are located
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF001E	; track if sprite order has changed
MEM_DAY=$FFFF0020	; what day is it in the story
;-------------------------------------------------------------------------------
; dialog management
;-------------------------------------------------------------------------------
MEM_DIALOG_FLAGS=$FFFF0022	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF0026	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF002A	; pointer to VPD location to write text
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_PLAYER_SPRITE_ID=$FFFF002E	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF0030	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF0032	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF0034	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF0036	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF0038	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF003A	; used to determine when to move
MEM_PLAYER_SPRITE_LINK_TO=$FFFF003C	; sprite ID the player sprite links to
MEM_PLAYER_SPRITE_LINK_FROM=$FFFF003E	; sprite ID linked to the player sprite
MEM_NPC0_SPRITE_ID=$FFFF0040	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF0042	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF0044	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF0046	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF0048	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF004A	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF004C	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF004E	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF0050	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF0052	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF0056	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0058	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF005A	; sprite table id of NPC0 sprite
MEM_NPC1_SPRITE_X=$FFFF005C	; virtual x position of NPC0 sprite
MEM_NPC1_SPRITE_Y=$FFFF005E	; virtual y position of NPC0 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF0060	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF0062	; which direction NPC0 faces
MEM_NPC1_SPRITE_FRAME=$FFFF0064	; animation frame of NPC0 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0066	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0068	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF006A	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF006C	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF0070	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF0072	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF0074	; sprite table id of NPC0 sprite
MEM_NPC2_SPRITE_X=$FFFF0076	; virtual x position of NPC0 sprite
MEM_NPC2_SPRITE_Y=$FFFF0078	; virtual y position of NPC0 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF007A	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF007C	; which direction NPC0 faces
MEM_NPC2_SPRITE_FRAME=$FFFF007E	; animation frame of NPC0 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF0080	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF0082	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF0084	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0086	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF008A	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF008C	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF008E	; sprite table id of NPC0 sprite
MEM_NPC3_SPRITE_X=$FFFF0090	; virtual x position of NPC0 sprite
MEM_NPC3_SPRITE_Y=$FFFF0092	; virtual y position of NPC0 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF0094	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0096	; which direction NPC0 faces
MEM_NPC3_SPRITE_FRAME=$FFFF0098	; animation frame of NPC0 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF009A	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF009C	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF009E	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF00A0	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF00A4	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF00A6	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF00A8	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF00AA	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF00AC	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF00AE	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF00B0	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF00B2	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF00B4	; row of map data
MEM_COLLISION_RESULT=$FFFF00B8	; result of collision test
;-------------------------------------------------------------------------------
; map scroll management
;-------------------------------------------------------------------------------
MEM_MAP_POSITION_X=$FFFF00BA	; x position of the map
MEM_MAP_POSITION_Y=$FFFF00BC	; y position of the map
MEM_FLAG_MAP_POSITION_CHANGED=$FFFF00BE	; >0 if map position changed
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF00C0	; ID of the active scene
MEM_ACTIVE_NPC_COUNT=$FFFF00C2	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF00C4	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF0100	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF0118	; collision data for the current map
