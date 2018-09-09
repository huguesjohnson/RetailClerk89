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
MEM_PLAYER_SPRITE=$FFFF009A	; which sprite to use for the player
MEM_DAY_EVENT_FLAGS=$FFFF009C	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF00A0	; track events in the current mission
MEM_CUSTOMER_FEEDBACK_SCORE=$FFFF00A4	; used for some missions
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF00A6	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF00AA	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF00AC	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF00AE	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF00B2	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF00B4	; four items
MEM_PLAYER_STORE_KEYS=$FFFF00BC	; track which store keys the player has
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF00C0	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF00C2	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF00C4	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF00C8	; pointer to location of dialog text
MEM_DIALOG_VDP=$FFFF00CC	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF00D0	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF00D4	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00D6	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00D8	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00DA	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00DC	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00DE	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00E0	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00E2	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00E4	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00E6	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00E8	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00EA	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00EE	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00F0	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00F2	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00F4	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00F6	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00F8	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF00FA	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF00FC	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF00FE	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0100	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF0102	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF0104	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF0108	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF010A	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF010C	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF010E	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF0110	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF0112	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF0114	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF0116	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0118	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF011A	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF011C	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF011E	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF0122	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF0124	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF0126	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF0128	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF012A	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF012C	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF012E	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0130	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF0132	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF0134	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF0136	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0138	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF013C	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF013E	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0140	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF0142	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF0144	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF0146	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0148	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF014A	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF014C	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF014E	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0150	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF0152	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF0156	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF0158	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF015A	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF015C	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF015E	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF0160	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF0162	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF0164	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF0166	; row of map data
MEM_COLLISION_RESULT=$FFFF016A	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF016C	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF016E	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0170	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0172	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF0174	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF0176	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF0178	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF01B4	; list of npcs in current map
MEM_SCENE_BGM=$FFFF01CC	; reference to current background music
MEM_SCENE_PALETTE=$FFFF01D0	; storing for fade in/out
MEM_COLLISION_DATA=$FFFF0250	; collision data for the current map
MEM_END=$FFFF0350
