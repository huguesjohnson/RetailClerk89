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
MEM_DAY_EVENT_FLAGS=$FFFF0022	; track events in the current day
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF0026	; which menu item is selected
MEM_MENU_RESPONSE=$FFFF0028	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF002A	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF002E	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF0032	; pointer to VPD location to write text
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_PLAYER_SPRITE_ID=$FFFF0036	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF0038	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF003A	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF003C	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF003E	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF0040	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF0042	; used to determine when to move
MEM_PLAYER_SPRITE_LINK_TO=$FFFF0044	; sprite ID the player sprite links to
MEM_PLAYER_SPRITE_LINK_FROM=$FFFF0046	; sprite ID linked to the player sprite
MEM_NPC0_SPRITE_ID=$FFFF0048	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF004A	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF004C	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF004E	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF0050	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0052	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0054	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0056	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF0058	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF005A	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF005E	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0060	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0062	; sprite table id of NPC0 sprite
MEM_NPC1_SPRITE_X=$FFFF0064	; virtual x position of NPC0 sprite
MEM_NPC1_SPRITE_Y=$FFFF0066	; virtual y position of NPC0 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF0068	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF006A	; which direction NPC0 faces
MEM_NPC1_SPRITE_FRAME=$FFFF006C	; animation frame of NPC0 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF006E	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0070	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0072	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0074	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF0078	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF007A	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF007C	; sprite table id of NPC0 sprite
MEM_NPC2_SPRITE_X=$FFFF007E	; virtual x position of NPC0 sprite
MEM_NPC2_SPRITE_Y=$FFFF0080	; virtual y position of NPC0 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0082	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0084	; which direction NPC0 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0086	; animation frame of NPC0 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF0088	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF008A	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF008C	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF008E	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0092	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0094	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0096	; sprite table id of NPC0 sprite
MEM_NPC3_SPRITE_X=$FFFF0098	; virtual x position of NPC0 sprite
MEM_NPC3_SPRITE_Y=$FFFF009A	; virtual y position of NPC0 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF009C	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF009E	; which direction NPC0 faces
MEM_NPC3_SPRITE_FRAME=$FFFF00A0	; animation frame of NPC0 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF00A2	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF00A4	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF00A6	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF00A8	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF00AC	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF00AE	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF00B0	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF00B2	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF00B4	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF00B6	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF00B8	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF00BA	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF00BC	; row of map data
MEM_COLLISION_RESULT=$FFFF00C0	; result of collision test
;-------------------------------------------------------------------------------
; map scroll management
;-------------------------------------------------------------------------------
MEM_MAP_POSITION_X=$FFFF00C2	; x position of the map
MEM_MAP_POSITION_Y=$FFFF00C4	; y position of the map
MEM_FLAG_MAP_POSITION_CHANGED=$FFFF00C6	; >0 if map position changed
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF00C8	; ID of the active scene
MEM_ACTIVE_NPC_COUNT=$FFFF00CA	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF00CC	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF0108	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF0120	; collision data for the current map
