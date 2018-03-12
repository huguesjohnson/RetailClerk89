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
MEM_SPRITE_SORT_TABLE_ID4=$FFFF0016	; sort table ID 4
MEM_SPRITE_SORT_TABLE_VALUE4=$FFFF0018	; sort table value 4
;-------------------------------------------------------------------------------
; counters
;-------------------------------------------------------------------------------
MEM_VBLANK_COUNTER=$FFFF001A	; incremented at vblank - used for debug & RNG
MEM_MAINLOOP_COUNTER=$FFFF001C	; used for debug & RNG
MEM_FRAME_COUNTER=$FFFF001E	; current frame
;-------------------------------------------------------------------------------
; program flow
;-------------------------------------------------------------------------------
MEM_NPC_LOOP_COUNTER=$FFFF0020	; used for loop control in main
;-------------------------------------------------------------------------------
; controller input
;-------------------------------------------------------------------------------
MEM_CONTROL_HELD=$FFFF0022	; store value of a held button
MEM_CONTROL_PRESSED=$FFFF0024	; store value of a pressed button
;-------------------------------------------------------------------------------
; game state
;-------------------------------------------------------------------------------
MEM_GAME_STATE=$FFFF0026	; used to control the main loop flow
MEM_ACTION_ID=$FFFF002A	; current action selected by player
MEM_ACTION_TARGET_OBJID=$FFFF002C	; action target object id
MEM_ACTION_TARGET_NPCID=$FFFF002E	; NPC id if action target is an NPC
MEM_ACTION_TARGET_NPC_DIRECTION=$FFFF0030	; put NPC back in right direction
MEM_ACTION_TABLE_OFFSET=$FFFF0032	; relative address of action table entry
MEM_ACTIVE_ITEM=$FFFF0034	; item that is currently being used
MEM_NPC_LOCATIONS=$FFFF0036	; table to track where NPCs are located
MEM_INTRO_SCENE_COUNTER=$FFFF0096	; counter for displaying the intro screen
MEM_DAY=$FFFF0098	; what day is it in the story
MEM_DAY_EVENT_FLAGS=$FFFF009A	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF009E	; track events in the current mission
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF00A2	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF00A6	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF00A8	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF00AA	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF00AE	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF00B0	; four items
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF00B8	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF00BA	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF00BC	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF00C0	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF00C4	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF00C8	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF00CC	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00CE	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00D0	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00D2	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00D4	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00D6	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00D8	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00DA	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00DC	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00DE	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00E0	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00E2	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00E6	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00E8	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00EA	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00EC	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00EE	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00F0	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF00F2	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF00F4	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF00F6	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF00F8	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF00FA	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF00FC	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF0100	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0102	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0104	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF0106	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF0108	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF010A	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF010C	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF010E	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0110	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0112	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0114	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0116	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF011A	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF011C	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF011E	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF0120	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF0122	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0124	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0126	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0128	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF012A	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF012C	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF012E	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0130	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0134	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0136	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0138	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF013A	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF013C	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF013E	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0140	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF0142	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0144	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0146	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0148	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF014A	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF014E	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF0150	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF0152	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF0154	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF0156	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF0158	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF015A	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF015C	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF015E	; row of map data
MEM_COLLISION_RESULT=$FFFF0162	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0164	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0166	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0168	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF016A	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF016C	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF016E	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF0170	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF01AC	; list of npcs in current map
MEM_SCENE_BGM=$FFFF01C4	; reference to current background music
MEM_COLLISION_DATA=$FFFF01C8	; collision data for the current map
