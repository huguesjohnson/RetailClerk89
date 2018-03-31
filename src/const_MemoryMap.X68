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
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF00BA	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF00BC	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF00BE	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF00C2	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF00C6	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF00CA	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF00CE	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00D0	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00D2	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00D4	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00D6	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00D8	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00DA	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00DC	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00DE	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00E0	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00E2	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00E4	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00E8	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00EA	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00EC	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00EE	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00F0	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00F2	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF00F4	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF00F6	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF00F8	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF00FA	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF00FC	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF00FE	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF0102	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF0104	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0106	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF0108	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF010A	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF010C	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF010E	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF0110	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0112	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF0114	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0116	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0118	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF011C	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF011E	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF0120	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF0122	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF0124	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0126	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0128	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF012A	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF012C	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF012E	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF0130	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0132	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0136	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0138	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF013A	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF013C	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF013E	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF0140	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0142	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF0144	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0146	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0148	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF014A	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF014C	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF0150	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF0152	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF0154	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF0156	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF0158	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF015A	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF015C	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF015E	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF0160	; row of map data
MEM_COLLISION_RESULT=$FFFF0164	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0166	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0168	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF016A	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF016C	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF016E	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF0170	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF0172	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF01AE	; list of npcs in current map
MEM_SCENE_BGM=$FFFF01C6	; reference to current background music
MEM_COLLISION_DATA=$FFFF01CA	; collision data for the current map
