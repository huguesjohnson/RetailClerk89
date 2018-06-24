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
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF00A4	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF00A8	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF00AA	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF00AC	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF00B0	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF00B2	; four items
MEM_PLAYER_STORE_KEYS=$FFFF00BA	; track which store keys the player has
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF00BE	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF00C0	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF00C2	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF00C6	; pointer to location of dialog text
MEM_DIALOG_VDP=$FFFF00CA	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF00CE	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF00D2	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00D4	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00D6	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00D8	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00DA	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00DC	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00DE	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00E0	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00E2	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00E4	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00E6	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00E8	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00EC	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00EE	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00F0	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00F2	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00F4	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00F6	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF00F8	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF00FA	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF00FC	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF00FE	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF0100	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF0102	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF0106	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0108	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF010A	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF010C	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF010E	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF0110	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF0112	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF0114	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0116	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0118	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF011A	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF011C	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF0120	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF0122	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF0124	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF0126	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF0128	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF012A	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF012C	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF012E	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF0130	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF0132	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF0134	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0136	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF013A	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF013C	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF013E	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF0140	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF0142	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF0144	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0146	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF0148	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF014A	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF014C	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF014E	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF0150	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF0154	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF0156	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF0158	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF015A	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF015C	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF015E	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF0160	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF0162	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF0164	; row of map data
MEM_COLLISION_RESULT=$FFFF0168	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF016A	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF016C	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF016E	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0170	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF0172	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF0174	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF0176	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF01B2	; list of npcs in current map
MEM_SCENE_BGM=$FFFF01CA	; reference to current background music
MEM_SCENE_PALETTE=$FFFF01CE	; storing for fade in/out
MEM_COLLISION_DATA=$FFFF024E	; collision data for the current map
MEM_END=$FFFF024E
