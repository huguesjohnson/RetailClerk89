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
MEM_INTRO_SCENE_COUNTER=$FFFF0092	; counter for displaying the intro screen
MEM_DAY=$FFFF0094	; what day is it in the story
MEM_DAY_EVENT_FLAGS=$FFFF0096	; track events in the current day
MEM_MISSION_EVENT_FLAGS=$FFFF009A	; track events in the current mission
;-------------------------------------------------------------------------------
; scripted event management
;-------------------------------------------------------------------------------
MEM_SCRIPTED_EVENT_ADDR=$FFFF009E	; pointer to scripted event running
MEM_SCRIPTED_EVENT_ACTION=$FFFF00A2	; current scripted event action
MEM_SCRIPTED_EVENT_STEPS=$FFFF00A4	; steps remaining in current action
MEM_SCRIPTED_SPRITE_ADDR=$FFFF00A6	; which sprite to move
;-------------------------------------------------------------------------------
; player inventory
;-------------------------------------------------------------------------------
MEM_PLAYER_ITEM_COUNT=$FFFF00AA	; how many items the player is holding
MEM_PLAYER_ITEMS=$FFFF00AC	; four items
;-------------------------------------------------------------------------------
; dialog & menu management
;-------------------------------------------------------------------------------
MEM_MENU_SELECTION=$FFFF00B4	; which menu item is selected - used for sprite
MEM_MENU_RESPONSE=$FFFF00B6	; which dialog choice was selected
MEM_DIALOG_FLAGS=$FFFF00B8	; used to manage dialogs
MEM_DIALOG_TEXT=$FFFF00BC	; pointer to location of dialog text
MEM_DIALOG_VPD=$FFFF00C0	; pointer to VPD location to write text
MEM_DIALOG_ITEM_LIST=$FFFF00C4	; pointer to location of item list to display
MEM_DIALOG_ITEM_INDEX=$FFFF00C8	; track which item in the list is being drawn
;-------------------------------------------------------------------------------
; sprite management
;-------------------------------------------------------------------------------
MEM_SPRITE_Y_ORDER_CHANGED=$FFFF00CA	; track if sprite order has changed
MEM_PLAYER_SPRITE_ID=$FFFF00CC	; sprite table id of player sprite
MEM_PLAYER_SPRITE_X=$FFFF00CE	; virtual x position of the player
MEM_PLAYER_SPRITE_Y=$FFFF00D0	; virtual y position of the player
MEM_PLAYER_SPRITE_PATTERN_INDEX=$FFFF00D2	; index of pattern in VDP
MEM_PLAYER_SPRITE_DIRECTION=$FFFF00D4	; which direction the player faces
MEM_PLAYER_SPRITE_FRAME=$FFFF00D6	; animation frame of player sprite
MEM_PLAYER_SPRITE_STEP_COUNTER=$FFFF00D8	; used to determine when to move
MEM_PLAYER_MOVEMENT_COUNTER=$FFFF00DA	; used to determine how far to move
MEM_PLAYER_MOVE_FREQUENCY=$FFFF00DC	; how often to move
MEM_PLAYER_MOVE_PATTERN=$FFFF00DE	; movement pattern
MEM_PLAYER_MOVE_PATTERN_LENGTH=$FFFF00E2	; length of movement pattern
MEM_PLAYER_MOVE_INDEX=$FFFF00E4	; where the sprite is the movement pattern
MEM_NPC0_SPRITE_ID=$FFFF00E6	; sprite table id of NPC0 sprite
MEM_NPC0_SPRITE_X=$FFFF00E8	; virtual x position of NPC0 sprite
MEM_NPC0_SPRITE_Y=$FFFF00EA	; virtual y position of NPC0 sprite
MEM_NPC0_SPRITE_PATTERN_INDEX=$FFFF00EC	; index of pattern in VDP
MEM_NPC0_SPRITE_DIRECTION=$FFFF00EE	; which direction NPC0 faces
MEM_NPC0_SPRITE_FRAME=$FFFF00F0	; animation frame of NPC0 sprite
MEM_NPC0_SPRITE_STEP_COUNTER=$FFFF00F2	; used to determine when to move
MEM_NPC0_MOVEMENT_COUNTER=$FFFF00F4	; used to determine how far to move
MEM_NPC0_MOVE_FREQUENCY=$FFFF00F6	; how often to move
MEM_NPC0_MOVE_PATTERN=$FFFF00F8	; movement pattern
MEM_NPC0_MOVE_PATTERN_LENGTH=$FFFF00FC	; length of movement pattern
MEM_NPC0_MOVE_INDEX=$FFFF00FE	; where the sprite is the movement pattern
MEM_NPC1_SPRITE_ID=$FFFF0100	; sprite table id of NPC1 sprite
MEM_NPC1_SPRITE_X=$FFFF0102	; virtual x position of NPC1 sprite
MEM_NPC1_SPRITE_Y=$FFFF0104	; virtual y position of NPC1 sprite
MEM_NPC1_SPRITE_PATTERN_INDEX=$FFFF0106	; index of pattern in VDP
MEM_NPC1_SPRITE_DIRECTION=$FFFF0108	; which direction NPC1 faces
MEM_NPC1_SPRITE_FRAME=$FFFF010A	; animation frame of NPC1 sprite
MEM_NPC1_SPRITE_STEP_COUNTER=$FFFF010C	; used to determine when to move
MEM_NPC1_MOVEMENT_COUNTER=$FFFF010E	; used to determine how far to move
MEM_NPC1_MOVE_FREQUENCY=$FFFF0110	; how often to move
MEM_NPC1_MOVE_PATTERN=$FFFF0112	; movement pattern
MEM_NPC1_MOVE_PATTERN_LENGTH=$FFFF0116	; length of movement pattern
MEM_NPC1_MOVE_INDEX=$FFFF0118	; where the sprite is the movement pattern
MEM_NPC2_SPRITE_ID=$FFFF011A	; sprite table id of NPC2 sprite
MEM_NPC2_SPRITE_X=$FFFF011C	; virtual x position of NPC2 sprite
MEM_NPC2_SPRITE_Y=$FFFF011E	; virtual y position of NPC2 sprite
MEM_NPC2_SPRITE_PATTERN_INDEX=$FFFF0120	; index of pattern in VDP
MEM_NPC2_SPRITE_DIRECTION=$FFFF0122	; which direction NPC2 faces
MEM_NPC2_SPRITE_FRAME=$FFFF0124	; animation frame of NPC2 sprite
MEM_NPC2_SPRITE_STEP_COUNTER=$FFFF0126	; used to determine when to move
MEM_NPC2_MOVEMENT_COUNTER=$FFFF0128	; used to determine how far to move
MEM_NPC2_MOVE_FREQUENCY=$FFFF012A	; how often to move
MEM_NPC2_MOVE_PATTERN=$FFFF012C	; movement pattern
MEM_NPC2_MOVE_PATTERN_LENGTH=$FFFF0130	; length of movement pattern
MEM_NPC2_MOVE_INDEX=$FFFF0132	; where the sprite is the movement pattern
MEM_NPC3_SPRITE_ID=$FFFF0134	; sprite table id of NPC3 sprite
MEM_NPC3_SPRITE_X=$FFFF0136	; virtual x position of NPC3 sprite
MEM_NPC3_SPRITE_Y=$FFFF0138	; virtual y position of NPC3 sprite
MEM_NPC3_SPRITE_PATTERN_INDEX=$FFFF013A	; index of pattern in VDP
MEM_NPC3_SPRITE_DIRECTION=$FFFF013C	; which direction NPC3 faces
MEM_NPC3_SPRITE_FRAME=$FFFF013E	; animation frame of NPC3 sprite
MEM_NPC3_SPRITE_STEP_COUNTER=$FFFF0140	; used to determine when to move
MEM_NPC3_MOVEMENT_COUNTER=$FFFF0142	; used to determine how far to move
MEM_NPC3_MOVE_FREQUENCY=$FFFF0144	; how often to move
MEM_NPC3_MOVE_PATTERN=$FFFF0146	; movement pattern
MEM_NPC3_MOVE_PATTERN_LENGTH=$FFFF014A	; length of movement pattern
MEM_NPC3_MOVE_INDEX=$FFFF014C	; where the sprite is the movement pattern
;-------------------------------------------------------------------------------
; collision detection
;-------------------------------------------------------------------------------
MEM_ACTIVE_SPRITE_LEFT_COLUMN=$FFFF014E	; left column of active sprite
MEM_ACTIVE_SPRITE_HIGH_LEFT=$FFFF0150	; high left row of active sprite
MEM_ACTIVE_SPRITE_LOW_LEFT=$FFFF0152	; low left row of active sprite
MEM_ACTIVE_SPRITE_RIGHT_COLUMN=$FFFF0154	; right column of active sprite
MEM_ACTIVE_SPRITE_HIGH_RIGHT=$FFFF0156	; high right row of active sprite
MEM_ACTIVE_SPRITE_LOW_RIGHT=$FFFF0158	; low right row of active sprite
MEM_COLLISION_MAP_ROW=$FFFF015A	; row of map data
MEM_COLLISION_RESULT=$FFFF015E	; result of collision test
;-------------------------------------------------------------------------------
; active scene
;-------------------------------------------------------------------------------
MEM_ACTIVE_SCENE_ID=$FFFF0160	; ID of the active scene
MEM_ACTIVE_SCENE_EXIT_S=$FFFF0162	; south exit of active scene
MEM_ACTIVE_SCENE_EXIT_N=$FFFF0164	; north exit of active scene
MEM_ACTIVE_SCENE_EXIT_W=$FFFF0166	; west exit of active scene
MEM_ACTIVE_SCENE_EXIT_E=$FFFF0168	; east exit of active scene
MEM_ACTIVE_NPC_COUNT=$FFFF016A	; number of NPCs in the current scene
MEM_OBJECT_LIST_OBJS=$FFFF016C	; list of objects in current map
MEM_OBJECT_LIST_NPCS=$FFFF01A8	; list of npcs in current map
MEM_SCENE_BGM=$FFFF01C0	; reference to current background music
MEM_COLLISION_DATA=$FFFF01C4	; collision data for the current map
