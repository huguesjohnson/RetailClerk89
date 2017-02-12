;*******************************************************************************
; There's a 0.000001% chance this will ever be translated to another language.
; All the game text is in one file to make it easier if that somehow happens.
;
; The best way to go about it is:
;  1) Copy this file and rename it to 'string_[locale].X68'
;  2) Painfully change all the text
;  3) Not rename any of the labels
;  4) Change the include path in the main file
;  5) Change version in init_Header to avoid confusion
;  6) Rebuild
;
; Things that will make translations difficult:
;  1) In the overhead view, the dialog displays a fixed 22 chars per row
;  2) Game font only includes ASCII, unused chars could be re-purposed though
;*******************************************************************************

;-------------------------------------------------------------------------------
; messages
;-------------------------------------------------------------------------------
DialogTextNothing:
	;		"1234567890123456789012"
	dc.b	"There's nothing very",LF
	dc.b	"interesting here.",ETX

DialogTextNoItems:
	;		"1234567890123456789012"
	dc.b	"You aren't carrying",LF
	dc.b	"anything right now.",ETX

DialogTextNothingHappens:
	;		"1234567890123456789012"
	dc.b	"Nothing happens.",ETX

DialogTextCantTake:
	;		"1234567890123456789012"
	dc.b	"You can't take this.",ETX

DialogTextAlreadyHaveIt:
	;		"1234567890123456789012"
	dc.b	"You already have one.",ETX

WelcomeMessage:
	;		"1234567890123456789012"
	dc.b	"Welcome to the Retail",LF
	dc.b	"Clerk '89 demo.      ^",FF
	dc.b	"Press A to look at",LF
	dc.b	"nearby items & talk. ^",FF
	dc.b	"Press C to open the",LF
	dc.b	"menu.                ^",FF
	dc.b	"In menus, A & C select",LF
	dc.b	"items and B cancels. ^",FF
	dc.b	"The Start button",LF
	dc.b	"pauses the game.",ETX

;-------------------------------------------------------------------------------
; dialog text
;-------------------------------------------------------------------------------
DialogTextDaniScene0Day0Flag0:
	;		"1234567890123456789012"
	dc.b	"`Isn't it time to",LF
	dc.b	"close already?       ^",FF
	dc.b	"Get that guy out of",LF
	dc.b	"here so we can leave.'",ETX

DialogTextDaniScene0Day0Flag1:
	;		"1234567890123456789012"
	dc.b	"`Maybe you should",LF
	dc.b	"actually talk to him.^",FF
	dc.b	"`You know, like",LF
	dc.b	"do your job.'",ETX

DialogTextMaleShopper0Scene0Day0Flag0:
	;		"1234567890123456789012"
	dc.b	"`If I have a mouse on",LF
	dc.b	"COM2 using IRQ3 can I^",FF
	dc.b	"hookup a modem on",LF
	dc.b	"COM4 using IRQ4?'    ^",FF
	dc.b	"{Sure, why not?",LF
	dc.b	"{I make $3.35 an hour.",ETX

DialogTextMaleShopper0Scene0Day0Flag0R0:
	;		"1234567890123456789012"
	dc.b	"`You chose response",LF
	dc.b	"zero, neat.'",ETX

DialogTextMaleShopper0Scene0Day0Flag0R1:
	;		"1234567890123456789012"
	dc.b	"`You chose response",LF
	dc.b	"one, alright.'",ETX

DialogTextMaleShopper0Scene0Day0Flag2:
	;		"1234567890123456789012"
	dc.b	"`You're talking to me",LF
	dc.b	"again now.'",ETX

;-------------------------------------------------------------------------------
; default object descriptions
;-------------------------------------------------------------------------------
DialogText8Bit:
	;		"1234567890123456789012"
	dc.b	"The shelves are lined",LF
	dc.b	"with 8-bit games.",ETX

DialogTextMags:
	;		"1234567890123456789012"
	dc.b	"Below the counter are",LF
	dc.b	"gaming magazines.",ETX

DialogTextCounter:
	;		"1234567890123456789012"
	dc.b	"The counter is empty.",ETX

DialogTextRegister:
	;		"1234567890123456789012"
	dc.b	"The register stares",LF
	dc.b	"back at you blankly.",ETX

DialogTextHardware:
	;		"1234567890123456789012"
	dc.b	"This is a wire rack",LF
	dc.b	"of computer hardware.",ETX

DialogText16Bit:
	;		"1234567890123456789012"
	dc.b	"Here are the latest",LF
	dc.b	"16-bit games.",ETX

;-------------------------------------------------------------------------------
; default NPC descriptions
;-------------------------------------------------------------------------------
DialogTextMaleShopper0:
	;		"1234567890123456789012"
	dc.b	"He has been browsing",LF
	dc.b	"for over an hour now.",ETX

DialogTextDaniScene0Day0Action0:
	;		"1234567890123456789012"
	dc.b	"She gives you a look",LF
	dc.b	"that clearly says    ^",FF
	dc.b	"you'll be walking home",LF
	dc.b	"if you take too long.",ETX

;-------------------------------------------------------------------------------
; menus
;-------------------------------------------------------------------------------
NPCMenu:
	;		"1234567890123456789012"
	dc.b	"{Look  {Talk  {Give",ETX

ObjectMenu:
	;		"1234567890123456789012"
	dc.b	"{Look  {Use   {Take",ETX

ItemMenu:
	;		"1234567890123456789012"
	dc.b	"{",ITEMNAMESTART

;-------------------------------------------------------------------------------
; take menus and messages
;-------------------------------------------------------------------------------
TakeMenuFull:
	;		"1234567890123456789012"
	dc.b	"You can't carry any",LF
	dc.b	"more items.",ETX

TakeMenuMagazines:
	;		"1234567890123456789012"
	dc.b	"Which magazine do you",LF
	dc.b	"want to take?        ^",FF
	dc.b	"{",ITEMNAMESTART

TakeMagazinesOption0:
	;		"1234567890123456789012"
	dc.b	"You selected option 0.",ETX

TakeMagazinesOption1:
	;		"1234567890123456789012"
	dc.b	"You selected option 1.",ETX

TakeMagazinesOption2:
	;		"1234567890123456789012"
	dc.b	"You selected option 2.",ETX

TakeMagazinesOption3:
	;		"1234567890123456789012"
	dc.b	"You selected option 3.",ETX

;-------------------------------------------------------------------------------
; object names
;-------------------------------------------------------------------------------
ObjectName8Bit:
	dc.b	"Wall of 8-bit games",OBJNAMEEND

ObjectNameComputerHardware:
	dc.b	"Computer hardware",OBJNAMEEND

ObjectName16Bit:
	dc.b	"Rack of 16-bit games",OBJNAMEEND

ObjectNameMagazines:
	dc.b	"Magazine rack",OBJNAMEEND

ObjectNameCounter:
	dc.b	"Counter",OBJNAMEEND

ObjectNameRegister:
	dc.b	"Cash register",OBJNAMEEND

;-------------------------------------------------------------------------------
; npc names
;-------------------------------------------------------------------------------
NPCNameDani:
	dc.b	"Dani (your sister)",NPCNAMEEND

NPCNameMapperShopper0:
	dc.b	"Business casual guy",NPCNAMEEND

;-------------------------------------------------------------------------------
; item names
;-------------------------------------------------------------------------------
ItemNameNothing:
	dc.b	"Nothing",ITEMNAMEEND

ItemNameMagGamePro:
	dc.b	"GamePro",ITEMNAMEEND

ItemNameMagEGM:
	dc.b	"EGM",ITEMNAMEEND

ItemNameMagAntic:
	dc.b	"Antic",ITEMNAMEEND

ItemNameMagAnalog:
	dc.b	"Analog",ITEMNAMEEND

;-------------------------------------------------------------------------------
; end
;-------------------------------------------------------------------------------
	align 2
