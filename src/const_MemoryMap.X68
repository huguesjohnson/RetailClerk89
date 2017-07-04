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
MEM_ACTION_TABLE_OFFSET=$FFFF002A	; relative address of action table entry
MEM_ACTIVE_ITEM=$FFFF002C	; item that is currently being used
MEM_NPC_LOCATIONS=$FFFF002E	; table to track where NPCs are located
MEM_INTRO_SCENE_COUNTER=$FFFF0032	; counter for displaying the intro screen
MEM_DAY=$FFFF0034	; what day is it in the story
MEM_DAY_EVENT_FLAGS=$FFFF0036	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF003A	; track events in the current mission
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF003E	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF0042	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF0044	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF0046	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF004A	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF004C	; four items
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF0054	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF0056	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF0058	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF005C	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF0060	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF0064	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF0068	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF006A	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF006C	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF006E	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF0070	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF0072	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF0074	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF0076	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF0078	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF007A	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF007C	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF007E	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF0082	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF0084	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF0086	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF0088	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF008A	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF008C	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF008E	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0090	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0092	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0094	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF0096	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF0098	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF009C	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF009E	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF00A0	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF00A2	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF00A4	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF00A6	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF00A8	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF00AA	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF00AC	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF00AE	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF00B0	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF00B2	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF00B6	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF00B8	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF00BA	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF00BC	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF00BE	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF00C0	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF00C2	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF00C4	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF00C6	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF00C8	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF00CA	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF00CC	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF00D0	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF00D2	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF00D4	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF00D6	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF00D8	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF00DA	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF00DC	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF00DE	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF00E0	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF00E2	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF00E4	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF00E6	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF00EA	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF00EC	; where the sprite is the movement pattern
;MEM_NPC3_SPRITE_LINK_TO,2,sprite ID the NPC3 sprite links to
;MEM_NPC3_SPRITE_LINK_FROM,2,sprite ID linked to the NPC3 sprite
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF00EE	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF00F0	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF00F2	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF00F4	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF00F6	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF00F8	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF00FA	; row of map data
MEM_COLLISION_RESULT=$FFFF00FE	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0100	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0102	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0104	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF0106	; east exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0108	; west exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF010A	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF010C	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF0148	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF0160	; collision data for the current map
