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
MEM_FRAME_COUNTER=$FFFF001A	; current frame
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
MEM_INTRO_SCENE_COUNTER=$FFFF008E	; counter for displaying the intro screen
MEM_DAY=$FFFF0090	; what day is it in the story
MEM_DAY_EVENT_FLAGS=$FFFF0092	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF0096	; track events in the current mission
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF009A	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF009E	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF00A0	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF00A2	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF00A6	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF00A8	; four items
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF00B0	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF00B2	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF00B4	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF00B8	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF00BC	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF00C0	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF00C4	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00C6	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00C8	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00CA	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00CC	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00CE	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00D0	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00D2	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00D4	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00D6	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00D8	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00DA	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00DE	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00E0	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00E2	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00E4	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00E6	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00E8	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF00EA	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF00EC	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF00EE	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF00F0	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF00F2	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF00F4	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF00F8	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF00FA	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF00FC	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF00FE	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF0100	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF0102	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF0104	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF0106	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF0108	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF010A	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF010C	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF010E	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF0112	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF0114	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF0116	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF0118	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF011A	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF011C	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF011E	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0120	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF0122	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF0124	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF0126	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF0128	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF012C	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF012E	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0130	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF0132	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF0134	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF0136	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF0138	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF013A	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF013C	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF013E	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0140	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF0142	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF0146	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF0148	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF014A	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF014C	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF014E	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF0150	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF0152	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF0154	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF0156	; row of map data
MEM_COLLISION_RESULT=$FFFF015A	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF015C	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF015E	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0160	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0162	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF0164	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF0166	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF0168	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF01A4	; list of npcs in current map
MEM_COLLISION_DATA=$FFFF01BC	; collision data for the current map
