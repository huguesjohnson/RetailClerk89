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
MEM_ACTION_TABLE_OFFSET=$FFFF002C	; relative address of action table entry
MEM_ACTIVE_ITEM=$FFFF002E	; item that is currently being used
MEM_NPC_LOCATIONS=$FFFF0030	; table to track where NPCs are located
MEM_INTRO_SCENE_COUNTER=$FFFF0034	; counter for displaying the intro screen
MEM_DAY=$FFFF0036	; what day is it in the story
MEM_DAY_EVENT_FLAGS=$FFFF0038	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF003C	; track events in the current mission
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF0040	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF0044	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF0046	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF0048	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF004C	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF004E	; four items
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF0056	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF0058	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF005A	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF005E	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF0062	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF0066	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF006A	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF006C	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF006E	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF0070	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF0072	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF0074	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF0076	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF0078	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF007A	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF007C	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF007E	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF0080	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF0084	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF0086	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF0088	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF008A	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF008C	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF008E	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF0090	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0092	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0094	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0096	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF0098	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF009A	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF009E	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF00A0	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF00A2	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF00A4	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF00A6	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF00A8	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF00AA	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF00AC	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF00AE	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF00B0	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF00B2	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF00B4	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF00B8	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF00BA	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF00BC	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF00BE	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF00C0	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF00C2	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF00C4	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF00C6	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF00C8	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF00CA	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF00CC	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF00CE	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF00D2	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF00D4	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF00D6	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF00D8	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF00DA	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF00DC	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF00DE	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF00E0	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF00E2	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF00E4	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF00E6	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF00E8	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF00EC	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF00EE	; where the sprite is the movement pattern
;MEM_NPC3_SPRITE_LINK_TO,2,sprite ID the NPC3 sprite links to
;MEM_NPC3_SPRITE_LINK_FROM,2,sprite ID linked to the NPC3 sprite
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF00F0	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF00F2	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF00F4	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF00F6	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF00F8	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF00FA	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF00FC	; row of map data
MEM_COLLISION_RESULT=$FFFF0100	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0102	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0104	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0106	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF0108	; east exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF010A	; west exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF010C	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF010E	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF014A	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF0162	; collision data for the current map
