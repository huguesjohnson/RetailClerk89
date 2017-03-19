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
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF002C	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF0030	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF0032	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF0034	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF0038	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF003A	; four items
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF0042	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF0044	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF0046	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF004A	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF004E	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF0052	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF0056	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_PLAYER_SPRITE_ID=$FFFF0058	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF005A	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF005C	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF005E	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF0060	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF0062	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF0064	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF0066	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF0068	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF006A	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF006E	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF0070	; where the sprite is the movement pattern
MEM_PLAYER_SPRITE_LINK_TO=$FFFF0072	; sprite ID the player sprite links to
MEM_PLAYER_SPRITE_LINK_FROM=$FFFF0074	; sprite ID linked to the player sprite
MEM_NPC0_SPRITE_ID=$FFFF0076	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF0078	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF007A	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF007C	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF007E	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0080	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0082	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0084	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF0086	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF0088	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF008C	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF008E	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0090	; sprite table id of NPC0 sprite
MEM_NPC1_SPRITE_X=$FFFF0092	; virtual x position of NPC0 sprite
MEM_NPC1_SPRITE_Y=$FFFF0094	; virtual y position of NPC0 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF0096	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF0098	; which direction NPC0 faces
MEM_NPC1_SPRITE_FRAME=$FFFF009A	; animation frame of NPC0 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF009C	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF009E	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF00A0	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF00A2	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF00A6	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF00A8	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF00AA	; sprite table id of NPC0 sprite
MEM_NPC2_SPRITE_X=$FFFF00AC	; virtual x position of NPC0 sprite
MEM_NPC2_SPRITE_Y=$FFFF00AE	; virtual y position of NPC0 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF00B0	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF00B2	; which direction NPC0 faces
MEM_NPC2_SPRITE_FRAME=$FFFF00B4	; animation frame of NPC0 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF00B6	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF00B8	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF00BA	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF00BC	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF00C0	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF00C2	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF00C4	; sprite table id of NPC0 sprite
MEM_NPC3_SPRITE_X=$FFFF00C6	; virtual x position of NPC0 sprite
MEM_NPC3_SPRITE_Y=$FFFF00C8	; virtual y position of NPC0 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF00CA	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF00CC	; which direction NPC0 faces
MEM_NPC3_SPRITE_FRAME=$FFFF00CE	; animation frame of NPC0 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF00D0	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF00D2	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF00D4	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF00D6	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF00DA	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF00DC	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF00DE	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF00E0	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF00E2	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF00E4	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF00E6	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF00E8	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF00EA	; row of map data
MEM_COLLISION_RESULT=$FFFF00EE	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF00F0	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF00F2	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF00F4	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF00F6	; east exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF00F8	; west exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF00FA	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF00FC	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF0138	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF0150	; collision data for the current map
