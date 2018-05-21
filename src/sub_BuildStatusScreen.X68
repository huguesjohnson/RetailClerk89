BuildStatusScreen:
	;---------------------------------------------------------------------------
	; determine spot for "you are here" icon
	;---------------------------------------------------------------------------
	move.w	(MEM_ACTIVE_SCENE_ID),d6	; copy active scene ID to d6
	mulu.w	#$4,d6	; multiply by 4 to get offset
	lea	StatusMapIconLocationTable,a6	; point a6 to the lookup table
	adda.l	d6,a6	; move to offset
	move.l	(a6),(VDP_CONTROL) ; set drawing location
	move.w  #STATUS_SCREEN_MAP_ICON_BASE_PATTERN,(VDP_DATA)	; copy pattern
	;---------------------------------------------------------------------------
	; draw the objective text
	;---------------------------------------------------------------------------
BuildStatusScreenObjectiveText:
	move.w	(MEM_DAY),d6	; copy active scene ID to d6
	mulu.w	#$4,d6	; multiply by 4 to get offset
	lea	StatusScreenObjectives,a6	; point a6 to the lookup table
	adda.l	d6,a6	; move to offset
	move.l	(a6),a0	; point a0 to the first character
	move.l	#STATUS_SCREEN_OBJECTIVE_VDP,d7	; d7 is used in the loop for LF
	move.l	#STATUS_SCREEN_OBJECTIVE_VDP,(MEM_DIALOG_VDP)
BuildStatusScreenObjectiveTextLoop:
	clr	d6	; lazy way to prevent various bugs
	move.b	(a0)+,d6	; copy current character to d6
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.s	BuildStatusScreenStoreKeys	; end of text, move on
	cmpi.b	#LF,d6	; is this a line feed character?
	bne.s	.1	; not a line feed character
	add.l	#$00800000,d7	; move down one row
	move.l	d7,(MEM_DIALOG_VDP)	; set new VDP write
.1
	; update d6 to point to the tile ID
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#DIALOG_BASE_TILE+%0010000000000000,d6	; add the base tile
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VDP
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	bra.w	BuildStatusScreenObjectiveTextLoop ; loop until ETX
BuildStatusScreenStoreKeys:
	move.w	#$000C,d7	; loop counter / key number
BuildStatusScreenStoreKeysLoop:
	; determine start position for next store name	
	clr	d6	; lazy way to prevent various bugs
	; next 3 operations are to determine the row for the text 
	move.w	#$0080,d6
	mulu.w	d7,d6
	swap d6
	add.l	#STATUS_SCREEN_STOREKEYS_VDP,d6
	move.l	d6,(MEM_DIALOG_VDP)
	clr	d6	; lazy way to prevent various bugs
	move.w	d7,d6	; copy loop counter / key number to d6
	mulu.w	#$4,d6	; multiply by 4 to get offset
	lea	StoreNameTable,a6	; point a6 to the scene lookup table
	adda.l	d6,a6	; move to offset
	move.l	(a6),a0	; point a0 to the first character
	move.l	(MEM_PLAYER_STORE_KEYS),d5
BuildStatusScreenStoreKeysLoopNextChar:
	clr	d6	; lazy way to prevent various bugs
	move.b	(a0)+,d6	; copy current character to d6
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.s	BuildStatusScreenStoreKeysLoopDec
	sub.w	#$20,d6	; subtract 32 to get the character index
	btst.l	d7,d5	; does the player have this key?
	beq.s	.1	; branch if player does not have the key
	add.w	#DIALOG_BASE_TILE+%0010000000000000,d6	; add the base tile
	bra.s	.2
.1
	add.w	#DIALOG_BASE_TILE+%0100000000000000,d6	; add the base tile
.2
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VDP
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	bra.w	BuildStatusScreenStoreKeysLoopNextChar ; loop until ETX
BuildStatusScreenStoreKeysLoopDec:
	dbra	d7,BuildStatusScreenStoreKeysLoop
BuildStatusScreenInventory:
	cmpi.w	#$0000,(MEM_PLAYER_ITEM_COUNT)	; is item count 0?
	ble.w	ExitBuildStatusScreen	; branch if no items
	move.w	(MEM_PLAYER_ITEM_COUNT),d7	; use d7 to loop through items
	subq.w	#$1,d7	; loop counter needs to be one less than item count
BuildStatusScreenInventoryLoop:
	; next 3 operations are to determine the row for the text 
	move.w	#$0080,d6
	mulu.w	d7,d6
	swap d6
	add.l	#STATUS_SCREEN_INVENTORY_VDP,d6	; add base address
	move.l	d6,(MEM_DIALOG_VDP)	; save VDP write location
	; get the name of the next item
	clr	d6	; lazy way to prevent various bugs
	move.w	d7,d6
	mulu.w	#$0002,d6
	lea	MEM_PLAYER_ITEMS,a6	; point a6 to player items
	adda.l	d6,a6	; move to offset
	move.w	(a6),d6	; copy item number to d6
	and.w	#$0FFF,d6	; clear out item mask
	mulu.w	#$0004,d6	
	lea	ItemNameTable,a6	; point a6 to the lookup table
	adda.l	d6,a6	; move to offset
	move.l	(a6),a0	; point a0 to the start of the next item name
	; menu character for next item
	clr	d6	; lazy way to prevent various bugs
	move.w	#DIALOG_BASE_TILE+%0000000001011011,d6
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	move.w  d6,(VDP_DATA)	; copy the character to VDP
BuildStatusScreenInventoryLoopNextChar:
	clr	d6	; lazy way to prevent various bugs
	move.b	(a0)+,d6
	cmpi.b	#ITEMNAMEEND,d6
	beq.s	BuildStatusScreenInventoryLoopDec
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#DIALOG_BASE_TILE,d6
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VDP
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	bra.s	BuildStatusScreenInventoryLoopNextChar
BuildStatusScreenInventoryLoopDec:
	dbra	d7,BuildStatusScreenInventoryLoop
ExitBuildStatusScreen:
	rts
