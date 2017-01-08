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
MEM_ACTION_TARGET_OBJID=$FFFF0014	; action target object id
MEM_NPC_LOCATIONS=$FFFF0016	; table to track where NPCs are located
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF001A	; track if sprite order has changed
;-------------------------------------------------------------------------------
; dialog management
;-------------------------------------------------------------------------------
MEM_DIALOG_FLAGS=$FFFF001C	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF0020	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF0024	; pointer to VPD location to write text
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_PLAYER_SPRITE_ID=$FFFF0028	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF002A	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF002C	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF002E	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF0030	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF0032	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF0034	; used to determine when to move
MEM_PLAYER_SPRITE_LINK_TO=$FFFF0036	; sprite ID the player sprite links to
MEM_PLAYER_SPRITE_LINK_FROM=$FFFF0038	; sprite ID linked to the player sprite
MEM_NPC0_SPRITE_ID=$FFFF003A	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF003C	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF003E	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF0040	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF0042	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0044	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0046	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0048	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF004A	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF004C	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF0050	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0052	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0054	; sprite table id of NPC0 sprite
MEM_NPC1_SPRITE_X=$FFFF0056	; virtual x position of NPC0 sprite
MEM_NPC1_SPRITE_Y=$FFFF0058	; virtual y position of NPC0 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF005A	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF005C	; which direction NPC0 faces
MEM_NPC1_SPRITE_FRAME=$FFFF005E	; animation frame of NPC0 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0060	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0062	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0064	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0066	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF006A	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF006C	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF006E	; sprite table id of NPC0 sprite
MEM_NPC2_SPRITE_X=$FFFF0070	; virtual x position of NPC0 sprite
MEM_NPC2_SPRITE_Y=$FFFF0072	; virtual y position of NPC0 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0074	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0076	; which direction NPC0 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0078	; animation frame of NPC0 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF007A	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF007C	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF007E	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0080	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0084	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0086	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0088	; sprite table id of NPC0 sprite
MEM_NPC3_SPRITE_X=$FFFF008A	; virtual x position of NPC0 sprite
MEM_NPC3_SPRITE_Y=$FFFF008C	; virtual y position of NPC0 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF008E	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0090	; which direction NPC0 faces
MEM_NPC3_SPRITE_FRAME=$FFFF0092	; animation frame of NPC0 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0094	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0096	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0098	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF009A	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF009E	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF00A0	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF00A2	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF00A4	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF00A6	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF00A8	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF00AA	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF00AC	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF00AE	; row of map data
MEM_COLLISION_RESULT=$FFFF00B2	; result of collision test
;-------------------------------------------------------------------------------
; map scroll management
;-------------------------------------------------------------------------------
MEM_MAP_POSITION_X=$FFFF00B4	; x position of the map
MEM_MAP_POSITION_Y=$FFFF00B6	; y position of the map
MEM_FLAG_MAP_POSITION_CHANGED=$FFFF00B8	; >0 if map position changed
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF00BA	; ID of the active scene
MEM_ACTIVE_NPC_COUNT=$FFFF00BC	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF00BE	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF00FA	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF0112	; collision data for the current map
