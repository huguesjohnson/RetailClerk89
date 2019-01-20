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
MEM_OBJECTIVE=$FFFF009A	; which text to show on objectives
MEM_PLAYER_SPRITE=$FFFF009C	; which sprite to use for the player
MEM_DAY_EVENT_FLAGS=$FFFF009E	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF00A2	; track events in the current mission
MEM_CUSTOMER_FEEDBACK_SCORE=$FFFF00A6	; used for some missions
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF00A8	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF00AC	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF00AE	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF00B0	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF00B4	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF00B6	; four items
MEM_PLAYER_STORE_KEYS=$FFFF00BE	; track which store keys the player has
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF00C2	; which menu item is selected - used for sprite 0
MEM_MENU_RESPONSE=$FFFF00C4	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF00C6	; used to manage dialogs
MEM_DIALOG_TITLE=$FFFF00CA	; pointer to location of dialog title
MEM_DIALOG_TEXT=$FFFF00CE	; pointer to location of dialog text
MEM_DIALOG_VDP=$FFFF00D2	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF00D6	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF00DA	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00DC	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00DE	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00E0	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00E2	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00E4	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00E6	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00E8	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00EA	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00EC	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00EE	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00F0	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00F4	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00F6	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00F8	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00FA	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00FC	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00FE	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF0100	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0102	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0104	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0106	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF0108	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF010A	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF010E	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0110	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0112	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF0114	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF0116	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF0118	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF011A	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF011C	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF011E	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0120	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0122	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0124	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF0128	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF012A	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF012C	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF012E	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF0130	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0132	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0134	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0136	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF0138	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF013A	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF013C	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF013E	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0142	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0144	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0146	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF0148	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF014A	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF014C	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF014E	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF0150	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0152	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0154	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0156	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF0158	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF015C	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF015E	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF0160	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF0162	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF0164	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF0166	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF0168	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF016A	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF016C	; row of map data
MEM_COLLISION_RESULT=$FFFF0170	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0172	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0174	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0176	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0178	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF017A	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF017C	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF017E	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF01BA	; list of npcs in current map
MEM_SCENE_BGM=$FFFF01D2	; reference to current background music
MEM_SCENE_PALETTE=$FFFF01D6	; storing for fade in/out
MEM_COLLISION_DATA=$FFFF0256	; collision data for the current map
MEM_END=$FFFF0356
