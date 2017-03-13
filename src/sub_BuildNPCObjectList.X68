BuildNPCObjectList:
	;---------------------------------------------------------------------------
	; point a1 to location of the NPC list for the current scene
	;---------------------------------------------------------------------------
	lea	MEM_NPC_LOCATIONS,a1	; point a1 to the start of the list
	move.w	(MEM_ACTIVE_SCENE_ID),d5	; copy active scene ID to d5
	mulu.w	#NPC_LIST_LENGTH,d5	; multiply by list length
	adda.w	d5,a1	; add result to a1 to move to npc list for active scene
	;---------------------------------------------------------------------------
	; setup loop control - 2 NPCs per word in MEM_NPC_LOCATIONS
	;---------------------------------------------------------------------------
	move.w	#(NPC_LIST_LENGTH-1)/2,d4	; use d4 for loop control
	;---------------------------------------------------------------------------
	; loop through all NPCs and add them to the list
	;---------------------------------------------------------------------------
	lea	MEM_OBJECT_LIST_NPCS,a0	; point to start of NPC location table
	lea	MEM_NPC0_SPRITE_ID,a2	; point to first NPC in memory
BuildNPCObjectListLoop:
	;---------------------------------------------------------------------------
	; object list structure
	; word0=Object ID (0-65535)
	; word1[0-8]=x0 (0-511)
	; word1[9-15]=width (0-127)
	; word2[0-8]=y0 (0-512)
	; word2[9-15]=height (0-127)
	;---------------------------------------------------------------------------	
	move.w	(a1)+,d3	; copy next NPC pair to d3
	move.w	d3,d2	; use d2 for first byte
	and.w	#$FF00,d2	; clear low byte	
	beq.s	.1	; branch if the result of the and is zero
	lsr.w	#$8,d2	; shift upper word to lower
	jsr	StoreNPC	; save this NPC
	bra.s	.2	; move to next NPC
.1	; first NPC in pair is 0
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
.2	; test the second NPC in the pair
	move.w	d3,d2	; copy NPC pair to d2 again
	and.w	#$00FF,d2	; clear high byte	
	beq.s	.3	; branch if the result of the and is zero
	jsr	StoreNPC	; save this NPC
	bra.s	.4	; move to next NPC pair
.3	; second NPC in pair is 0
	move.w	#OBJ_NOTHING,(a0)+
	move.w	#$0000,(a0)+
	move.w	#$0000,(a0)+
.4	; move to the next NPC pair
	dbra d4,BuildNPCObjectListLoop	; loop
ExitBuildNPCObjectList:
	rts

StoreNPC:
	; word0=Object ID (0-65535)
	move.w	#OBJ_NPC_BASE,d5	; NPC base ID
	add.w	d2,d5	; add NPC ID
	move.w	d5,(a0)+	; add to object list
	; word1[0-8]=x0 (0-511)
	; word1[9-15]=width (0-127)
	move.w	(STRUCT_SPRITE_X,a2),d5	; store x position in d5
	subq	#$0008,d5	; buffer area around sprite
	or.w	#%0100000000000000,d5	; append sprite width+buffer to bits [9-15]
	move.w	d5,(a0)+	; store word 1
	; word2[0-8]=y0 (0-512)
	; word2[9-15]=height (0-127)
	move.w	(STRUCT_SPRITE_Y,a2),d5	; store y position in d5
	subq	#$0008,d5	; buffer area around sprite
	or.w	#%0110000000000000,d5	; append sprite height+buffer to bits [9-15]
	move.w	d5,(a0)+	; store word 2
ExitStoreNPC:
	adda.w	#NPC_RECORD_SIZE,a2	; increment to next NPC
	rts

