MEM_START=$FFFF0000
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
; MEM_OBJECTIVE is first because it's used for save game title 
MEM_OBJECTIVE=$FFFF0026	; which text to show on objectives
MEM_GAME_STATE=$FFFF0028	; used to control the main loop flow
MEM_ACTION_ID=$FFFF002C	; current action selected by player
MEM_ACTION_TARGET_OBJID=$FFFF002E	; action target object id
MEM_ACTION_TARGET_NPCID=$FFFF0030	; NPC id if action target is an NPC
MEM_ACTION_TARGET_NPC_DIRECTION=$FFFF0032	; put NPC back in right direction
MEM_ACTION_TABLE_OFFSET=$FFFF0034	; relative address of action table entry
MEM_ACTIVE_ITEM=$FFFF0036	; item that is currently being used
MEM_NPC_LOCATIONS=$FFFF0038	; table to track where NPCs are located
MEM_INTRO_SCENE_COUNTER=$FFFF0098	; counter for displaying the intro screen
MEM_DAY=$FFFF009A	; what day is it in the story
MEM_PLAYER_SPRITE=$FFFF009C	; which sprite to use for the player
MEM_GLOBAL_EVENT_FLAGS=$FFFF009E	; track events across days
MEM_DAY_EVENT_FLAGS=$FFFF00A2	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF00A6	; track events in the current mission
MEM_CUSTOMER_FEEDBACK_SCORE=$FFFF00AA	; used for some missions
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF00AC	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF00AE	; four items
MEM_PLAYER_STORE_KEYS=$FFFF00B6	; track which store keys the player has
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00BA	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00BC	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00BE	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00C0	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00C2	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00C4	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00C6	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00C8	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00CA	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00CC	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00CE	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00D2	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00D4	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00D6	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00D8	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00DA	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00DC	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF00DE	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF00E0	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF00E2	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF00E4	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF00E6	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF00E8	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF00EC	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF00EE	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF00F0	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF00F2	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF00F4	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF00F6	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF00F8	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF00FA	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF00FC	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF00FE	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0100	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0102	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF0106	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF0108	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF010A	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF010C	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF010E	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0110	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0112	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0114	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF0116	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF0118	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF011A	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF011C	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0120	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0122	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0124	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF0126	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF0128	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF012A	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF012C	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF012E	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0130	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0132	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0134	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF0136	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF013A	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF013C	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF013E	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0140	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0142	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0144	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF0146	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF0148	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF014A	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF0186	; list of npcs in current map
MEM_SCENE_BGM=$FFFF019E	; reference to current background music
MEM_SCENE_PALETTE=$FFFF01A2	; storing for fade in/out
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF0222	; which menu item is selected - used for sprite 0
MEM_MENU_RESPONSE=$FFFF0224	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF0226	; used to manage dialogs
MEM_DIALOG_TITLE=$FFFF022A	; pointer to location of dialog title
MEM_DIALOG_TEXT=$FFFF022E	; pointer to location of dialog text
MEM_DIALOG_VDP=$FFFF0232	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF0236	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF023A	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF023C	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF0240	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF0242	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF0244	; which sprite to move
;-------------------------------------------------------------------------------
; temp working space
;-------------------------------------------------------------------------------
MEM_TEMP_SPACE=$FFFF0248	; temp working space
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF0288	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF028A	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF028C	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF028E	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF0290	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF0292	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF0294	; row of map data
MEM_COLLISION_RESULT=$FFFF0298	; result of collision test
MEM_COLLISION_DATA=$FFFF029A	; collision data for the current map
MEM_END=$FFFF039A
