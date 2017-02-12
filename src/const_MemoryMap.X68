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
MEM_ACTIVE_ITEM=$FFFF001A	; item that is currently being used
MEM_NPC_LOCATIONS=$FFFF001C	; table to track where NPCs are located
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF0020	; track if sprite order has changed
MEM_DAY=$FFFF0022	; what day is it in the story
MEM_DAY_EVENT_FLAGS=$FFFF0024	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF0028	; track events in the current mission
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF002C	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF002E	; four items
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF0036	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF0038	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF003A	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF003E	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF0042	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF0046	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF004A	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_PLAYER_SPRITE_ID=$FFFF004C	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF004E	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF0050	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF0052	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF0054	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF0056	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF0058	; used to determine when to move
MEM_PLAYER_SPRITE_LINK_TO=$FFFF005A	; sprite ID the player sprite links to
MEM_PLAYER_SPRITE_LINK_FROM=$FFFF005C	; sprite ID linked to the player sprite
MEM_NPC0_SPRITE_ID=$FFFF005E	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF0060	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF0062	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF0064	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF0066	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0068	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF006A	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF006C	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF006E	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF0070	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF0074	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0076	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0078	; sprite table id of NPC0 sprite
MEM_NPC1_SPRITE_X=$FFFF007A	; virtual x position of NPC0 sprite
MEM_NPC1_SPRITE_Y=$FFFF007C	; virtual y position of NPC0 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF007E	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF0080	; which direction NPC0 faces
MEM_NPC1_SPRITE_FRAME=$FFFF0082	; animation frame of NPC0 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0084	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0086	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0088	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF008A	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF008E	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF0090	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF0092	; sprite table id of NPC0 sprite
MEM_NPC2_SPRITE_X=$FFFF0094	; virtual x position of NPC0 sprite
MEM_NPC2_SPRITE_Y=$FFFF0096	; virtual y position of NPC0 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0098	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF009A	; which direction NPC0 faces
MEM_NPC2_SPRITE_FRAME=$FFFF009C	; animation frame of NPC0 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF009E	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF00A0	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF00A2	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF00A4	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF00A8	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF00AA	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF00AC	; sprite table id of NPC0 sprite
MEM_NPC3_SPRITE_X=$FFFF00AE	; virtual x position of NPC0 sprite
MEM_NPC3_SPRITE_Y=$FFFF00B0	; virtual y position of NPC0 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF00B2	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF00B4	; which direction NPC0 faces
MEM_NPC3_SPRITE_FRAME=$FFFF00B6	; animation frame of NPC0 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF00B8	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF00BA	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF00BC	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF00BE	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF00C2	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF00C4	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF00C6	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF00C8	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF00CA	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF00CC	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF00CE	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF00D0	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF00D2	; row of map data
MEM_COLLISION_RESULT=$FFFF00D6	; result of collision test
;-------------------------------------------------------------------------------
; map scroll management
;-------------------------------------------------------------------------------
MEM_MAP_POSITION_X=$FFFF00D8	; x position of the map
MEM_MAP_POSITION_Y=$FFFF00DA	; y position of the map
MEM_FLAG_MAP_POSITION_CHANGED=$FFFF00DC	; >0 if map position changed
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF00DE	; ID of the active scene
MEM_ACTIVE_NPC_COUNT=$FFFF00E0	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF00E2	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF011E	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF0136	; collision data for the current map
