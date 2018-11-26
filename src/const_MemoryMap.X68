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
MEM_DIALOG_TITLE=$FFFF00C8	; pointer to location of dialog title
MEM_DIALOG_TEXT=$FFFF00CC	; pointer to location of dialog text
MEM_DIALOG_VDP=$FFFF00D0	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF00D4	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF00D8	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00DA	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00DC	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00DE	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00E0	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00E2	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00E4	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00E6	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00E8	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00EA	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00EC	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00EE	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00F2	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00F4	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00F6	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00F8	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00FA	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00FC	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF00FE	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF0100	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF0102	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF0104	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF0106	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF0108	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF010C	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF010E	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0110	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF0112	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF0114	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF0116	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF0118	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF011A	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF011C	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF011E	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0120	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0122	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF0126	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF0128	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF012A	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF012C	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF012E	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0130	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0132	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0134	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF0136	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF0138	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF013A	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF013C	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0140	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0142	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0144	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF0146	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF0148	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF014A	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF014C	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF014E	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0150	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0152	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0154	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF0156	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF015A	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF015C	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF015E	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF0160	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF0162	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF0164	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF0166	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF0168	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF016A	; row of map data
MEM_COLLISION_RESULT=$FFFF016E	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0170	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0172	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0174	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0176	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF0178	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF017A	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF017C	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF01B8	; list of npcs in current map
MEM_SCENE_BGM=$FFFF01D0	; reference to current background music
MEM_SCENE_PALETTE=$FFFF01D4	; storing for fade in/out
MEM_COLLISION_DATA=$FFFF0254	; collision data for the current map
MEM_END=$FFFF0354
