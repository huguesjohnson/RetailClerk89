;-------------------------------------------------------------------------------
; debug registers
;-------------------------------------------------------------------------------
MEM_DEBUG_1=$FFFF0000	; general debug register
MEM_DEBUG_2=$FFFF0002	; general debug register
;-------------------------------------------------------------------------------
; table to sort the draw order of sprites
;-------------------------------------------------------------------------------
MEM_SPRITE_SORT_TABLE_SORTED=$FFFF0004	; 0000=sorted
MEM_SPRITE_SORT_TABLE_ID0=$FFFF0006	; sort table ID 0
MEM_SPRITE_SORT_TABLE_VALUE0=$FFFF0008	; sort table value 0
MEM_SPRITE_SORT_TABLE_ID1=$FFFF000A	; sort table ID 1
MEM_SPRITE_SORT_TABLE_VALUE1=$FFFF000C	; sort table value 1
MEM_SPRITE_SORT_TABLE_ID2=$FFFF000E	; sort table ID 2
MEM_SPRITE_SORT_TABLE_VALUE2=$FFFF0010	; sort table value 2
MEM_SPRITE_SORT_TABLE_ID3=$FFFF0012	; sort table ID 3
MEM_SPRITE_SORT_TABLE_VALUE3=$FFFF0014	; sort table value 3
;-------------------------------------------------------------------------------
; counters
;-------------------------------------------------------------------------------
MEM_VBLANK_COUNTER=$FFFF0016	; incremented at vblank - used for debug & RNG
MEM_MAINLOOP_COUNTER=$FFFF0018	; used for debug & RNG
MEM_FRAME_COUNTER=$FFFF001A	; current frame - cycles from 0-59
;-------------------------------------------------------------------------------
; program flow
;-------------------------------------------------------------------------------
MEM_NPC_LOOP_COUNTER=$FFFF001C	; used for loop control in main
;-------------------------------------------------------------------------------
; controller input
;-------------------------------------------------------------------------------
MEM_CONTROL_HELD=$FFFF001E	; store value of a held button
MEM_CONTROL_PRESSED=$FFFF0020	; store value of a pressed button
;-------------------------------------------------------------------------------
; game state
;-------------------------------------------------------------------------------
MEM_GAME_STATE=$FFFF0022	; used to control the main loop flow
MEM_ACTION_ID=$FFFF0026	; current action selected by player
MEM_ACTION_TARGET_OBJID=$FFFF0028	; action target object id
MEM_ACTION_TARGET_NPCID=$FFFF002A	; NPC id if action target is an NPC
MEM_ACTION_TARGET_NPC_DIRECTION=$FFFF002C	; put NPC back in right direction
MEM_ACTION_TABLE_OFFSET=$FFFF002E	; relative address of action table entry
MEM_ACTIVE_ITEM=$FFFF0030	; item that is currently being used
MEM_NPC_LOCATIONS=$FFFF0032	; table to track where NPCs are located
MEM_INTRO_SCENE_COUNTER=$FFFF0036	; counter for displaying the intro screen
MEM_DAY=$FFFF0038	; what day is it in the story
MEM_DAY_EVENT_FLAGS=$FFFF003A	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF003E	; track events in the current mission
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF0042	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF0046	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF0048	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF004A	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF004E	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF0050	; four items
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF0058	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF005A	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF005C	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF0060	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF0064	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF0068	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF006C	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF006E	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF0070	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF0072	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF0074	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF0076	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF0078	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF007A	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF007C	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF007E	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF0080	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF0082	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF0086	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF0088	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF008A	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF008C	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF008E	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF0090	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF0092	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0094	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0096	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0098	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF009A	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF009C	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF00A0	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF00A2	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF00A4	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF00A6	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF00A8	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF00AA	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF00AC	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF00AE	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF00B0	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF00B2	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF00B4	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF00B6	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF00BA	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF00BC	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF00BE	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF00C0	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF00C2	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF00C4	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF00C6	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF00C8	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF00CA	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF00CC	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF00CE	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF00D0	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF00D4	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF00D6	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF00D8	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF00DA	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF00DC	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF00DE	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF00E0	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF00E2	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF00E4	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF00E6	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF00E8	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF00EA	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF00EE	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF00F0	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF00F2	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF00F4	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF00F6	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF00F8	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF00FA	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF00FC	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF00FE	; row of map data
MEM_COLLISION_RESULT=$FFFF0102	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0104	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0106	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0108	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF010A	; east exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF010C	; west exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF010E	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF0110	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF014C	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF0164	; collision data for the current map
