;-------------------------------------------------------------------------------
; clear player inventory
;-------------------------------------------------------------------------------
ClearPlayerInventory:
	move.w	#$0000,(MEM_PLAYER_ITEM_COUNT)	; reset item count
	lea MEM_PLAYER_ITEMS,a1	; point to start of item list
	move.w	#MAX_ITEMS,d7	; copy max items to d7
	subq	#$1,d7	; decrement for zero-based list
ClearPlayerInventoryLoop:
	move.w	#$0000,(a1)+
	dbra	d7,ClearPlayerInventoryLoop	; loop to the end of the list
	rts
