FindActionTarget:	; note - d6 and d7 are used by caller
	; d4 - store player sprite x
	move.w	(MEM_PLAYER_SPRITE_X),d4	; move base sprite x
	; d5 - store sprite y
	move.w	(MEM_PLAYER_SPRITE_Y),d5	; move base sprite y
	add.w	#SPRITE_COLLISION_Y,d5	; adjust for collision Y
	; determine what the player is looking at
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d3	; copy direction
	cmpi.w	#DIRECTION_UP,d3	; test if sprite is facing up
	bne.s	.1 	; branch if not
	subq	#SPRITE_COLLISION_UP,d5	; adjust y
	bra.w	.4	; branch to object list search
.1	; down
	cmpi.w	#DIRECTION_DOWN,d3	; test if sprite is facing down
	bne.s	.2 	; branch if not
	add.w	#SPRITE_COLLISION_DOWN,d5	; adjust y
	bra.w	.4	; branch to object list search
.2	; left
	cmpi.w	#DIRECTION_LEFT,d3	; test if sprite is facing left
	bne.s	.3 	; branch if not
	subq	#SPRITE_COLLISION_LEFT,d4	; adjust x
	bra.w	.4	; branch to object list search
.3	; right
	cmpi.w	#DIRECTION_RIGHT,d3	; test if sprite is facing right
	bne.s	.4 	; not reachable unless there's a bug in MovePlayer
	add.w	#SPRITE_COLLISION_RIGHT,d4	; adjust x
.4
	; search object list	
	lea	MEM_OBJECT_LIST_OBJS,a0	; point a0 to the object list
	move.w	#OBJ_LIST_LOOP_CTRL,d3	; use d3 for loop control
	;---------------------------------------------------------------------------
	; hit test = ((htx>=x1)&&(htx<=x0))&&((hty>y0)&&(hty<y1))
	; where
	; htx = sprite x adjusted for map scroll
	; hty = sprite y adjusted for map scorll
	; x0 = right edge of object rect
	; x1 = left edge of object rect
	; y0 = bottom edge of object rect
	; y1 = top edge of object rect
	;---------------------------------------------------------------------------
FindActionTargetObjectLoop:
	;---------------------------------------------------------------------------
	; a0   = word0=Object ID (0-65535)
	; a0+2 = word1[0-8]=x0 (0-511) word1[9-15]=width (0-127)
	; a0+4 = word2[0-8]=y0 (0-512) word2[9-15]=height (0-127)
	;---------------------------------------------------------------------------
	move.w	(a0),(MEM_ACTION_TARGET_OBJID)	; copy the current object id
	cmpi.w	#OBJ_NOTHING,(MEM_ACTION_TARGET_OBJID)	; looking at nothing?
	beq.w	FindActionTargetObjectLoopDbra	; if so loop to next object
	; test if sprite x is between left and right edge
	move.w	(2,a0),d2	; copy word 1 (x and width)
	move.w	d2,d1	; use d1 for width
	and.w	#%0000000111111111,d2	; clear bits[9-15]
	cmp.w	d2,d4	; (htx>=x1)
	blt.w	FindActionTargetObjectLoopDbra ; loop if sprite x < object left
	; need to shift 9 bits right
	lsr.w	#$08,d1	; shift 8
	lsr.w	#$01,d1	; shift 1 more
	add.w	d1,d2	; add width to left edge to get right edge
	cmp.w	d2,d4	; (htx<=x0)
	bgt.w	FindActionTargetObjectLoopDbra ; loop if sprite x > object right
	; test if sprite y is between top and bottom edge
	move.w	(4,a0),d2	; copy word 2 (y and width)
	move.w	d2,d1	; use d1 for height
	and.w	#%0000000111111111,d2	; clear bits[9-15]
	cmp.w	d2,d5	; (hty>y0)
	blt.w	FindActionTargetObjectLoopDbra ; loop if sprite y < object top
	; need to shift 9 bits right
	lsr.w	#$08,d1	; shift 8
	lsr.w	#$01,d1	; shift 1 more
	add.w	d1,d2	; add height to top edge to get bottom edge
	cmp.w	d2,d5	; (hty<y1)
	bge.w	FindActionTargetObjectLoopDbra ; loop if no hit
	; determine if this is an NPC
	move.w	#NPC_LIST_LENGTH-1,d2	; if d3<NPC_LIST_LENGTH then we have an NPC
	sub.w	d3,d2	; subtract d3 from d2
	bge.s	.1	; branch if the result is positive
	move.w	#$FFFF,d2	; set NPC id as -1 
.1
	move.w	d2,(MEM_ACTION_TARGET_NPCID)	; store NPC id
	bra.s	ExitFindActionTarget	; exit
FindActionTargetObjectLoopDbra:
	adda.w	#OBJ_LIST_STRUCT_SIZE,a0	; move to next object list entry
	dbra    d3,FindActionTargetObjectLoop	; decrement and loop
ActionTargetNotFound:
	move.w	#OBJ_NOTHING,(MEM_ACTION_TARGET_OBJID)	; nothing by default
	move.w	#$FFFF,(MEM_ACTION_TARGET_NPCID)	; nothing by default
ExitFindActionTarget:
	rts

