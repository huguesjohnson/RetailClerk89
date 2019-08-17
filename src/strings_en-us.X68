;*******************************************************************************
; There's a 0.000001% chance this will ever be translated to another language.
; (Almost) All the game text is in one file to make it easier if that happens.
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
;  3) The game logo text is not in this file
;  4) Character & item names are also restricted to small values
;
; The second item is the one I feel worst about..
; It makes adding non-English characters a complete nightmare.
; Another option would be extending the dialog font but that has issues too..
; Hint: If you try doing that also make sure to update DIALOG_BASE_TILE.
;
; Yes, this script was written by a native English speaker.
; I know that is very difficult to believe.
;*******************************************************************************

;-------------------------------------------------------------------------------
; character constants
;-------------------------------------------------------------------------------
LF=$0A	; '\n' - used to break text into multiple lines
FF=$0C	; form feed - used to break text into pages
FFR=$0D	; form feed & reset dialog style
ETX=$03	; end of text
OBJNAMEEND=$1E	; end of object name
NPCNAMEEND=$1F	; end of NPC name
ITEMNAMESTART=$1C	; indicator to draw the next item name
ITEMNAMEEND=$1D	; end of item name
CHAR_DQUOTE=$22	; ACSII code for double quote character

;-------------------------------------------------------------------------------
; title screen
;-------------------------------------------------------------------------------
TitleScreenTextNewGame:
	dc.b	"New Game",ETX

TitleScreenTextLoadGame:
	dc.b	"Load Game",ETX

	if _DEBUG_

TitleScreenTextDebug:
	dc.b	"Debug",ETX

TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	"   Stable Debug Build (August 2019)   ",ETX

	else

TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	"     Release Build (August 2019)      ",ETX
	endif

	if _DEBUG_

	; 28 lines available on the debug screen (28-1 = 1B)

	DebugScreenLine00:
	;		"12345678901234567890123456789012345678"
	dc.b	"Debug starting scene                  ",ETX

	DebugScreenLine01:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 0 (11/19) title screen          ",ETX

	DebugScreenLine02:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 0 (11/19) After demo mission    ",ETX

	DebugScreenLine03:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 1 (11/24) title screen          ",ETX

	DebugScreenLine04:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 1 (11/24) mid point             ",ETX

	DebugScreenLine05:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 1 (11/24) end                   ",ETX

	DebugScreenLine06:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 2 (11/26) title screen          ",ETX

	DebugScreenLine07:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 2 (11/26) mid point             ",ETX

	DebugScreenLine08:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 2 (11/26) end                   ",ETX

	DebugScreenLine09:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 3 (12/3) title                  ",ETX

	DebugScreenLine0A:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 3 (12/3) mid point              ",ETX

	DebugScreenLine0B:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 4 (12/10) title                 ",ETX

	DebugScreenLine0C:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 4 (12/10) mid point             ",ETX

	DebugScreenLine0D:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 4 (12/10) end                   ",ETX

	DebugScreenLine0E:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 5 (12/17) title                 ",ETX

	DebugScreenLine0F:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 5 (12/17) parking lot blizzard  ",ETX

	DebugScreenLine10:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 5 (12/17) camp scene            ",ETX

	DebugScreenLine11:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 5 (12/17) end                   ",ETX

	DebugScreenLine12:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 6 (12/24) title                 ",ETX

	DebugScreenLine13:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 6 (12/24) start of night mission",ETX

	DebugScreenLine14:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 6 (12/24) end of night mission  ",ETX

	DebugScreenLine15:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 7 (12/31) title - bad           ",ETX

	DebugScreenLine16:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 7 (12/31) mid point - bad       ",ETX

	DebugScreenLine17:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 7 (12/31) title - good          ",ETX

	DebugScreenLine18:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 7 (12/31) end - good            ",ETX

	DebugScreenLine19:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 7 (12/31) title - perfect       ",ETX

	DebugScreenLine1A:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 7 (12/31) end - perfect         ",ETX

	DebugScreenLine1B:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Work in-progress scene test         ",ETX

	endif

;-------------------------------------------------------------------------------
; credits and end screen
;-------------------------------------------------------------------------------
EndScreenTextLine1:
	;		"12345678901234567890123456789012345678"
	dc.b	"Thank you for trying this little demo!",ETX

EndScreenTextLine2:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

EndScreenTextLine3:
	;		"12345678901234567890123456789012345678"
	dc.b	"Check out my other projects over at",ETX

EndScreenTextLine4:
	;		"12345678901234567890123456789012345678"
	dc.b	"https://HuguesJohnson.com/",ETX

EndScreenTextLine5:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

EndScreenTextLine6:
	;		"12345678901234567890123456789012345678"
	dc.b	"Press the start button to reset.",ETX

CreditsScreen00Line00:
	;		"12345678901234567890123456789012345678"
	dc.b	"                Credits               ",ETX

CreditsScreen00Line01:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line02:
	;		"12345678901234567890123456789012345678"
	dc.b	"Story & program by Hugues Johnson",ETX

CreditsScreen00Line03:
	;		"12345678901234567890123456789012345678"
	dc.b	"Echo Sound Driver by Javier Degirolmo",ETX

CreditsScreen00Line04:
	;		"12345678901234567890123456789012345678"
	dc.b	"Some code is based on examples by ",ETX

CreditsScreen00Line05:
	;		"12345678901234567890123456789012345678"
	dc.b	"Matt Phillips (tanglewoodgame.com)",ETX

CreditsScreen00Line06:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line07:
	;		"12345678901234567890123456789012345678"
	dc.b	"               Graphics               ",ETX

CreditsScreen00Line08:
	;		"12345678901234567890123456789012345678"
	dc.b	"Title screen font based on Audiowide",ETX

CreditsScreen00Line09:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2012 Brian J Bonislawsky",ETX

CreditsScreen00Line0A:
	;		"12345678901234567890123456789012345678"
	dc.b	"Dialog & menu font based on",ETX

CreditsScreen00Line0B:
	;		"12345678901234567890123456789012345678"
	dc.b	"Deathwake font by Zee-3",ETX

CreditsScreen00Line0C:
	;		"12345678901234567890123456789012345678"
	dc.b	"Santa sign is based on Tragic Marker",ETX

CreditsScreen00Line0D:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2016 Missy Meyer",ETX

CreditsScreen00Line0E:
	;		"12345678901234567890123456789012345678"
	dc.b	"Some scenery is based on tilesets",ETX

CreditsScreen00Line0F:
	;		"12345678901234567890123456789012345678"
	dc.b	"created by Sithjester",ETX

CreditsScreen00Line10:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line11:
	;		"12345678901234567890123456789012345678"
	dc.b	"                Music                 ",ETX

CreditsScreen00Line12:
	;		"12345678901234567890123456789012345678"
	dc.b	"Soundtrack contains conversions of",ETX

CreditsScreen00Line13:
	;		"12345678901234567890123456789012345678"
	dc.b	"Chip Overture, The Radix Point, and",ETX

CreditsScreen00Line14:
	;		"12345678901234567890123456789012345678"
	dc.b	"October Chip by Drozerix",ETX

CreditsScreen00Line15:
	;		"12345678901234567890123456789012345678"
	dc.b	"All under Public Domain license",ETX

CreditsScreen00Line16:
	;		"12345678901234567890123456789012345678"
	dc.b	"Soundtrack contains a conversion of",ETX

CreditsScreen00Line17:
	;		"12345678901234567890123456789012345678"
	dc.b	"The Spirit of Mods by Blurry",ETX

CreditsScreen00Line18:
	;		"12345678901234567890123456789012345678"
	dc.b	"Under Attribution Share Alike license",ETX

CreditsScreen00Line19:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line1A:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line1B:
	;		"12345678901234567890123456789012345678"
	dc.b	"See CREDITS & LICENSE for details",ETX

LegalScreenLine00BadEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"    Retail Clerk '89 - Bad Ending     ",ETX

LegalScreenLine00GoodEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"    Retail Clerk '89 - Good Ending    ",ETX

LegalScreenLine00PerfectEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"  Retail Clerk '89 - Perfect Ending   ",ETX

;-------------------------------------------------------------------------------
; general messages
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

DialogTextCantLeaveStoreUnattended:
	;		"1234567890123456789012"
	dc.b	"You can't leave the",LF
	dc.b	"store unattended.",ETX

DialogTextStoreClosed:
	;		"1234567890123456789012"
	dc.b	"They are closed for ",LF
	dc.b	"the night.           ^",FF
	dc.b	"Maybe if you had a key",LF
	dc.b	"to the store...",ETX

DialogTextStoreClosedDay05Storm:
	;		"1234567890123456789012"
	dc.b	"Looks like they closed",LF
	dc.b	"because of the storm.^",FF
	dc.b	"Maybe if you had a key",LF
	dc.b	"to the store...",ETX

DialogTextLongWalk:
	;		"1234567890123456789012"
	dc.b	"It's an awful long way",LF
	dc.b	"to walk home.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 00
;-------------------------------------------------------------------------------
DialogTextDaniScene00Day00Action0:
	;		"1234567890123456789012"
	dc.b	"She gives you a look",LF
	dc.b	"that clearly says    ^",FF
	dc.b	"you'll be walking home",LF
	dc.b	"if you take too long.",ETX

	align 2
DialogTextDaniScene00Day00Flag0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"It's 10 minutes past",LF
	dc.b	"closing time already.^",FF
	dc.b	"Get that guy out of",LF
	dc.b	"here so we can leave.",ETX

	align 2
DialogTextDaniScene00Day00Flag1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Maybe you should",LF
	dc.b	"actually talk to him.^",FF
	dc.b	"You know, like,",LF
	dc.b	"do your job.",ETX

	align 2
DialogTextDaniScene00Day00Flag8:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Do I have to explain",LF
	dc.b	"everything to you?   ^",FF
	dc.b	"Go ring him up & let's",LF
	dc.b	"get out of here.",ETX

	align 2
DialogTextDaniScene00Day00Exit0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You know what your",LF
	dc.b	"problem is?          ^",FF
	dc.b	"You tried listening to",LF
	dc.b	"the customer.        ^",FF
	dc.b	"They never actually",LF
	dc.b	"know what they want. ^",FF
	dc.b	"They'll loiter forever",LF
	dc.b	"if you let them.     ^",FF
	dc.b	"They're either bored",LF
	dc.b	"or lonely or stupid. ^",FF
	dc.b	"Just figure out what",LF
	dc.b	"they want to hear.   ^",FF
	dc.b	"That will get them to",LF
	dc.b	"buy anything & leave.",ETX

	align 2
DialogTextDaniScene00Day00Exit1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I can't believe",LF
	dc.b	"your manager is MIA. ^",FF
	dc.b	"He better give you a",LF
	dc.b	"a key tomorrow.",ETX

	align 2
DialogTextDaniScene00Day00Exit2:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Meet me at the car",LF
	dc.b	"when he shows up.",ETX

	align 2
DialogTextDaniScene05Day00:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Did you get lost?",LF
	dc.b	"                     ^",FF
	dc.b	"Just get in the car.",ETX

	align 2
DialogTextGreenbergScene00Day00Exit:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Did I see a guy with a",LF
	dc.b	"copy of Baby Boomer? ^",FF
	dc.b	"You're the best hire",LF
	dc.b	"of the season if so. ^",FF
	dc.b	"Sorry for being gone a",LF
	dc.b	"while.               ^",FF
	dc.b	"There was a sale at",LF
	dc.b	"my favorite store.   ^",FF
	dc.b	"You did fine though so",LF
	dc.b	"get on home.",ETX

	align 2
DialogTextGreenbergScene00Day00Talk:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Don't keep that nice",LF
	dc.b	"young lady waiting.",ETX

	align 2
DialogTextGreenbergScene00Day00Give:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"You're not stealing",LF
	dc.b	"either?              ^",FF
	dc.b	"You're the model",LF
	dc.b	"employee today.",ETX

	align 2 
DialogTextScene00Day00Event0D0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Ugh, this is taking",LF
	dc.b	"forever.",ETX

	align 2 
DialogTextScene00Day00Event0D1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Here, this is the game",LF
	dc.b	"your kid wants.",ETX

	align 2
DialogTextScene00Day00Event0D2:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Baby Boomer?",LF
	dc.b	"That can't be right. ^",FF
	dc.b	"Do you even work here?",ETX

	align 2
DialogTextScene00Day00Event0D3:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Trust me. It's a very",LF
	dc.b	"popular game.        ^",FF
	dc.b	"All the kids are",LF
	dc.b	"playing it today.",ETX

	align 2
DialogTextScene00Day00Event0D4:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Uh, OK.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"If I have a mouse on",LF
	dc.b	"COM2 using IRQ3 can I^",FF
	dc.b	"hookup a modem on",LF
	dc.b	"COM4 using IRQ4?     ^",FFR
	dc.b	"{Sure, why not?",LF
	dc.b	"{I make $3.35 an hour.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag0R0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Great, thanks.",FF
	dc.b	"There's one more thing",LF
	dc.b	"I need tonight.      ^",FF
	dc.b	"My kid wants this one",LF
	dc.b	"video game for Xmas. ^",FF
	dc.b	"Do you have it?      ^",FFR
	dc.b	"{Um, what's it called?",LF
	dc.b	"{What system is it on?",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag0R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Sorry I asked.",LF
	dc.b	"                     ^",FF
	dc.b	"Maybe you can help",LF
	dc.b	"with something else. ^",FF
	dc.b	"I'm supposed to pickup",LF
	dc.b	"some game for my kid.^",FF
	dc.b	"It has a guy on the",LF
	dc.b	"box or maybe a car.  ^",FF
	dc.b	"Do you know the one",LF
	dc.b	"I'm talking about?   ^",FFR
	dc.b	"{Oh yeah, that one.",LF
	dc.b	"{It's sold out.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag2R0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Someone & Iggy vs",LF
	dc.b	"whatever & something.^",FF
	dc.b	"You know all these ",LF
	dc.b	"games, go find it.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag2R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"It's the one on the TV",LF
	dc.b	"with two controllers.^",FF
	dc.b	"I thought you were",LF
	dc.b	"the expert on this.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag3R0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Great, go get it.",LF
	dc.b	"I'll wait here.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag3R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Can you check anyway?",LF
	dc.b	"I'm sure it's here.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag4:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Have you found that",LF
	dc.b	"game yet?",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag8:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Ring this up, I don't",LF
	dc.b	"have all night.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag4Give:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"That doesn't look",LF
	dc.b	"right at all.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag5Give:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"No, that's even worse.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag6Give:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Did you listen to me",LF
	dc.b	"at all?",ETX

	align 2
DialogTextMaleShopperDefaultGive:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"What's this for?",ETX

DialogTextNotTimeToLeave:
	;		"1234567890123456789012"
	dc.b	"It's too early to",LF
	dc.b	"leave for the day.",ETX

DialogTextDaniCarDayEnd:
	;		"1234567890123456789012"
	dc.b	"Are you ready to go",LF
	dc.b	"home for the day?    ^",FF
	dc.b	"{Yeah, time to leave",LF
	dc.b	"{Not yet",ETX

DialogTextDaniCarGameEndR0:
	;		"1234567890123456789012"
	dc.b	"OK, come back whenever",LF
	dc.b	"you're ready.",ETX

	align 2
DialogTextDaniWalkingHome:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"In 10 minutes you're",LF
	dc.b	"walking home.",ETX

	align 2
DialogTextNPCSouthCenterStaffDay00:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Are you going home",LF
	dc.b	"for the night?       ^",FFR
	dc.b	"{Uh, sure",LF
	dc.b	"{No I'm sleeping here",ETX

	align 2
DialogTextNPCSouthCenterStaffDay00R0:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Well you have a good",LF
	dc.b	"night & stay warm.",ETX

	align 2
DialogTextNPCSouthCenterStaffDay00R1:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Oh, at least you're",LF
	dc.b	"indoors tonight.",ETX

	align 2
DialogTextSecurityGuardDay00:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"The mall is closed.",LF
	dc.b	"Get a move on.",ETX

	align 2
DialogTextMallManagerDay00:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"Hi, I'm the manager of",LF
	dc.b	"the mall.            ^",FF
	dc.b	"You must be the new",LF
	dc.b	"guy I heard about.   ^",FF
	dc.b	"Welcome to the",LF
	dc.b	"Bayhust Mall family! ^",FF
	dc.b	"I've been here since",LF
	dc.b	"opening day in 1975. ^",FF
	dc.b	"The mall has changed a",LF
	dc.b	"lot since then.      ^",FF
	dc.b	"I hope you have a long",LF
	dc.b	"& fruitful career.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 01
;-------------------------------------------------------------------------------
DialogTextDay01CantReturnYet:
	;		"1234567890123456789012"
	dc.b	"You're not ready to",LF
	dc.b	"deal with work again.",ETX

DialogTextDay01Sub02CantEnter:
	;		"1234567890123456789012"
	dc.b	"You have to get rid",LF
	dc.b	"of this package first.",ETX

	align 2
DialogTextDay01Intro00:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"This is bad.",LF
	dc.b	"This is really bad.  ^",FF
	dc.b	"Today should be the",LF
	dc.b	"busiest day all year,^",FF
	dc.b	"but it's totally empty",LF
	dc.b	"in here.             ^",FF
	dc.b	"Since Marcy's had that",LF
	dc.b	"fire it's been dead. ^",FF
	dc.b	"Why can't they get a ",LF
	dc.b	"new store to move in?^",FF
	dc.b	"That Santa thing there",LF
	dc.b	"now doesn't count.   ^",FF
	dc.b	"Our store may close if",LF
	dc.b	"sales don't improve.",ETX

	align 2
DialogTextDay01Intro01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Whatever.",ETX

	align 2
DialogTextDay01Intro02:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"123456  7            89012345  6           789012"
	dc.b	"",CHAR_DQUOTE,"Whatever",CHAR_DQUOTE,"?!",LF
	;		"1234567890123456789012"
	dc.b	"                     ^",FF
	dc.b	"Don't you care about",LF
	dc.b	"your career?",ETX

	align 2
DialogTextDay01Intro03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"My career?",LF
	dc.b	"                     ^",FF
	dc.b	"I have one semester of",LF
	dc.b	"junior college left, ^",FF
	dc.b	"then I'm transferring",LF
	dc.b	"to state.            ^",FF
	dc.b	"They can bulldoze the",LF
	dc.b	"mall for all I care. ^",FF
	dc.b	"I think I'll take my",LF
	dc.b	"break now.",ETX

	align 2
DialogTextSecurityGuardDay01:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Mall's closing in 5",LF
	dc.b	"minutes, move along.",ETX

	align 2
DialogTextDay01VBDBDefaultTalk:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I'm stuck closing",LF
	dc.b	"tonight.             ^",FF
	dc.b	"Head over to my store",LF
	dc.b	"after your shift.    ^",FF
	dc.b	"Here's a key so you",LF
	dc.b	"can let yourself in. ^",FF
	dc.b	"Let's share any keys",LF
	dc.b	"we get, just in case.^",FF
	dc.b	"I know how to make",LF
	dc.b	"copies of them.      ^",FF
	dc.b	"Dad taught me how when",LF
	dc.b	"he was in his fallout^",FF
	dc.b	"shelter phase a few",LF
	dc.b	"years ago.",ETX

	align 2
DialogTextDay01VBDBTalk01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Head over to my ",LF
	dc.b	"store after close.",ETX

	align 2
DialogTextDay01Sub00Intro:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm glad you're here.",LF
	dc.b	"                     ^",FF
	dc.b	"The rest of the staff",LF
	dc.b	"called in sick.      ^",FF
	dc.b	"I'm stuck here alone",LF
	dc.b	"all night & starving.^",FF
	dc.b	"Would you mind",LF
	dc.b	"watching the store?  ^",FF
	dc.b	"It's just for a little",LF
	dc.b	"bit? I'll be fast.   ^",FFR
	dc.b	"{Yeah, whatever",LF
	dc.b	"{Give me five minutes",ETX

	align 2
DialogTextDay01Sub00IntroDecline:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Sure, whenever you're",LF
	dc.b	"free is cool.",ETX

	align 2
DialogTextDay01Sub00Start00:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks, I won't be",LF
	dc.b	"long I promise.      ^",FF
	dc.b	"It's not like there",LF
	dc.b	"are many choices here.",ETX

	align 2
DialogTextDay01Sub00Start01:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Warning, our customers",LF
	dc.b	"can be pretty dim.",ETX

	align 2
DialogTextDay01Sub00Start02:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"You'll be OK. No one ",LF
	dc.b	"shops here this late.",ETX

	align 2
DialogTextDay01Sub00NPC1D0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Have we met before? ",LF
	dc.b	"                     ^",FFR
	dc.b	"{Maybe",LF
	dc.b	"{Absolutely not",ETX

	align 2
DialogTextDay01Sub00NPC1D0R0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Right, you were at the",LF
	dc.b	"shoe store yesterday.",ETX

	align 2
DialogTextDay01Sub00NPCD1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Do you have that new  ",LF
	dc.b	"Stephen King book?   ^",FFR
	dc.b	"{Yes",LF
	dc.b	"{No",ETX

	align 2
DialogTextDay01Sub00NPC1D1R0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"It's in our west wing",LF
	dc.b	"go out & turn right. ^",FF
	dc.b	"Keep going until you",LF
	dc.b	"find the book section.",ETX

	align 2
DialogTextDay01Sub00NPC1D1R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Can you go see if you",LF
	dc.b	"have it in the back?",ETX

	align 2
DialogTextDay01Sub00NPC1D1R1Dani:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Well this is a",LF
	dc.b	"clothing store so..",ETX

	align 2
DialogTextDay01Sub00NPC1D1R1NPC:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Hmm, that's a good",LF
	dc.b	"point.",ETX

	align 2
DialogTextDay01Sub00NPC1D0R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"You kids all look the",LF
	dc.b	"same.",ETX

	align 2
DialogTextDay01Sub00NPCD2:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"This is some kind of",LF
	dc.b	"board game store?    ^",FFR
	dc.b	"{Not even a little",LF
	dc.b	"{In a way",ETX

	align 2
DialogTextDay01Sub00NPC1D2R0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Are you sure?",ETX

	align 2
DialogTextDay01Sub00NPC1D2R0Dani:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yes, my great grandpa",LF
	dc.b	"opened this store.   ^",FF
	dc.b	"For 60 years now our",LF
	dc.b	"family has run it.",ETX

	align 2
DialogTextDay01Sub00NPC1D2R0NPC:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"OK then.",ETX

	align 2
DialogTextDay01Sub00NPC1D2R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Great, I'm looking for",LF
	dc.b	"this new board game. ^",FF
	dc.b	"It's this real estate",LF
	dc.b	"game like Monopoly.  ^",FF
	dc.b	"Only it's based on.. ",ETX

	align 2
DialogTextDay01Sub00NPC1D2R1Dani:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Nope, stop right",LF
	dc.b	"there.               ^",FF
	dc.b	"We are so not doing",LF
	dc.b	"this.                ^",FF
	dc.b	"You should move along",LF
	dc.b	"now.",ETX

	align 2
DialogTextDay01Sub00NPC2D0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"I'm invited to the",LF
	dc.b	"hottest New Years    ^",FF
	dc.b	"party & can't afford",LF
	dc.b	"to look like a loser.^",FF
	dc.b	"I need a fresh style, ",LF
	dc.b	"what do you have?",ETX

	align 2
DialogTextDay01Sub00NPC2DefaultTalk:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"I don't have forever,",LF
	dc.b	"show me something.",ETX

	align 2
MenuMannequinSub00NPC2Show:
	;		"1234567890123456789012"
	dc.b	"Show this suit to the",LF
	dc.b	"customer?           ^",FF
	dc.b	"{Show to customer",LF
	dc.b	"{Nevermind",ETX

	align 2
MenuMannequinSub00NPC2ShowCancel:
	;		"1234567890123456789012"
	dc.b	"He looks like he's",LF
	dc.b	"getting impatient.",ETX

	align 2
DialogTextDay01Sub00NPC2D1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"All wrong.",LF
	dc.b	"                     ^",FF
	dc.b	"I need something",LF
	dc.b	"nobody has seen.     ^",FF
	dc.b	"This is way too",LF
	dc.b	"average.",ETX

	align 2
DialogTextDay01Sub00NPC2D2:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Here, this one is",LF
	dc.b	"really something.",ETX

	align 2
DialogTextDay01Sub00NPC2D2NPC:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"What is this color?",LF
	dc.b	"                     ^",FF
	dc.b	"It's not blue..",LF
	dc.b	"It's not green..     ^",FF
	dc.b	"I've never seen",LF
	dc.b	"anything like it.",ETX

	align 2
DialogTextDay01Sub00NPC2D2Dani:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"It says it's called",LF
	dc.b	CHAR_DQUOTE,"teal",CHAR_DQUOTE,".",ETX

	align 2
DialogTextDay01Sub00NPC2D2NPC2:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"It's the future.",LF
	dc.b	"I'll take it!",ETX

	align 2
DialogTextDay01Sub00NPC2D3:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"I don't have forever,",LF
	dc.b	"ring me up already.",ETX

	align 2
DialogTextDay01Sub00NPC3D0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Hello, good evening.",LF
	dc.b	"                     ^",FF
	dc.b	"{How can I help!?",LF
	dc.b	"{Fine, let's do this",ETX

	align 2
DialogTextDay01Sub00NPC3D0R0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Clearly you are our",LF
	dc.b	"target demographic!",ETX

	align 2
DialogTextDay01Sub00NPC3D0R1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Just make it quick.",ETX

	align 2
DialogTextDay01Sub00NPC3D1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"I don't see a nametag",LF
	dc.b	"what's your name?",FFR
	dc.b	"{Joy McHelpful",LF
	dc.b	"{Morgan Fairchild",ETX

	align 2
DialogTextDay01Sub00NPC3D1R0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"And customer service",LF
	dc.b	"is my true passion.",ETX

	align 2
DialogTextDay01Sub00NPC3D1R1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"And I'm down on my",LF
	dc.b	"luck right now.",ETX

	align 2
DialogTextDay01Sub00NPC3D2:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Do you sell paisley",LF
	dc.b	"kipper ties?         ^",FFR
	dc.b	"{I'm so sorry but..",LF
	dc.b	"{Not this decade",ETX

	align 2
DialogTextDay01Sub00NPC3D2R0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Could I interest you",LF
	dc.b	"in a suit instead?",ETX

	align 2
DialogTextDay01Sub00NPC3D2R1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Maybe there's a time",LF
	dc.b	"portal around.",ETX

	align 2
DialogTextDay01Sub00NPC3D3:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Do you have any deals",LF
	dc.b	"you want to mention? ^",FFR
	dc.b	"{Yes of course",LF
	dc.b	"{Please leave",ETX

	align 2
DialogTextDay01Sub00NPC3D3R0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Today only everything",LF
	dc.b	"is two for two.      ^",ETX

	align 2
DialogTextDay01Sub00NPC3D3R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"...",ETX

	align 2
DialogTextDay01Sub00NPC3D3NPC:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Good bye.",ETX

	align 2
DialogTextDay01Sub00NPC0Talk:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks for helping.  ",LF
	dc.b	"I really own you one.",ETX

	align 2
DialogTextDay01Sub00End00:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, wait a sec!",ETX

	align 2
DialogTextDay01Sub00End01:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Here, have a key to  ",LF
	dc.b	"the store, you know, ^",FF
	dc.b	"just in case you ever ",LF
	dc.b	"need anything.",ETX

	align 2
DialogTextDay01Sub00End02:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Hold on!",LF
	dc.b	"                     ^",FF
	dc.b	"My parents will be out",LF
	dc.b	"of town on New Years.^",FF
	dc.b	"They said I could have",LF
	dc.b	"a few people over.   ^",FF
	dc.b	"Why don't you stop by",LF
	dc.b	"if you can?",ETX

	align 2
DialogTextDay01Sub00End03:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Just as a friend!    ",LF
	dc.b	"Just as a friend!    ^",FF
	dc.b	"You can even bring ",LF
	dc.b	"someone, it's cool.",ETX

	align 2
DialogTextDay01Sub00End04:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"I didn't hear a no.",ETX

	align 2
DialogTextDay01Sub02VBExit:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"I need to talk to you",LF
	dc.b	"before you leave.",ETX

	align 2
DialogTextDay01Sub02Start:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"It's slow tonight so",LF
	dc.b	"you can leave early. ^",FF
	dc.b	"I need your help with",LF
	dc.b	"one thing though.    ^",FF
	dc.b	"The delivery guy left ",LF
	dc.b	"this package here but^",FF
	dc.b	"it's not for us. It",LF
	dc.b	"might be a VHS tape. ^",FF
	dc.b	"I can't tell, the",LF
	dc.b	"label is worn off.   ^",FF
	dc.b	"Find out who this is",LF
	dc.b	"for on your way out. ^",FFR
	dc.b	"[Received mystery",LF
	dc.b	"package]",ETX

	align 2
DialogTextDay01Sub02TalkGreenberg:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"I know you can figure",LF
	dc.b	"this out.",ETX

	align 2
DialogTextDay01Sub02D0:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"The delivery guy gets",LF
	dc.b	"our stores confused. ^",FF
	dc.b	"It happens at least",LF
	dc.b	"once a week.         ^",FF
	dc.b	"This one isn't for us",LF
	dc.b	"though.              ^",FF
	dc.b	"It's too small, might",LF
	dc.b	"be a camcorder tape. ^",FF
	dc.b	"I don't know who here",LF
	dc.b	"sells them.",ETX

	align 2
DialogTextDay01Sub02TalkNPCStaffSVideo:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"We have to look out",LF
	dc.b	"for each other.",ETX

	align 2
DialogTextDay01Sub02D1:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Hey, we've been",LF
	dc.b	"looking for that!    ^",FF
	dc.b	"It's a replacement for",LF
	dc.b	"our security system. ^",FF
	dc.b	"The old one is so worn",LF
	dc.b	"out we couldn't see..^",FF
	dc.b	"Nevermind. Thanks.",ETX

	align 2
DialogTextDay01End:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You're just in time",LF
	dc.b	"for once.            ^",FF
	dc.b	"I'm done closing out",LF
	dc.b	"the register.        ^",FF
	dc.b	"Let's get home before",LF
	dc.b	"it's too cold out.",ETX

	align 2
DialogTextDay01ParkingLot:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"So you're starting to",LF
	dc.b	"make yourself useful.^",FF
	dc.b	"You still have a way",LF
	dc.b	"to go though.",ETX

	align 2
DialogTextCheckersStaffDay01MallClosed:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, I'm trying to",LF
	dc.b	"close the register.  ^",FF
	dc.b	"Can this wait until",LF
	dc.b	"tomorrow?",ETX

	align 2
DialogTextTBooksStaffDay01Talk0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"My store's dead.",LF
	dc.b	"Are you busy today?",ETX

	align 2
DialogTextTBooksStaffDay01Talk1:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"A little bit but I'm",LF
	dc.b	"getting by alright.  ^",FF
	dc.b	"Knowing it's my last",LF
	dc.b	"winter here helps.",ETX

	align 2
DialogTextTBooksStaffDay01Talk2:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I'm almost done with",LF
	dc.b	"this place too.      ^",FF
	dc.b	"It'll be weird not",LF
	dc.b	"seeing you every day.^",FF
	dc.b	"We've been neighbors,",LF
	dc.b	"since kindergarten.",ETX

	align 2
DialogTextTBooksStaffDay01Talk3:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"Yeah, that sounds",LF
	dc.b	"about right.         ^",FF
	dc.b	"Let's plan to hang out",LF
	dc.b	"next winter break.",ETX

	align 2
DialogTextMallManagerDay01:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"Did I hear the new guy",LF
	dc.b	"is your brother?     ^",FF
	dc.b	"That is so great to",LF
	dc.b	"hear.                ^",FF
	dc.b	"We strive to keep the",LF
	dc.b	"mall family friendly.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 02
;-------------------------------------------------------------------------------
	align 2
DialogTextScriptedEventDay02Start:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"I tried every store on",LF
	dc.b	"this end of the mall.^",FF
	dc.b	"They're all running",LF
	dc.b	"low on change too.   ^",FF
	dc.b	"We're only out of",LF
	dc.b	"quarters now.        ^",FF
	dc.b	"That's how it always",LF
	dc.b	"starts.              ^",FF
	dc.b	"If we don't get some,",LF
	dc.b	"dimes will be next.  ^",FF
	dc.b	"Why don't you try the",LF
	dc.b	"other stores?        ^",FF
	dc.b	"You might have better",LF
	dc.b	"luck than me.        ^",FF
	dc.b	"Your friend across the",LF
	dc.b	"hall asked about you.^",FF
	dc.b	"He said to come over &",LF
	dc.b	"talk when you can.   ^",FF
	dc.b	"Anyway, try to find us",LF
	dc.b	"some quarters.       ^",FFR
	dc.b	"[Received $10 bill]",ETX

	align 2
DialogTextCavernStaffDay02Sub00:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"You're from that video",LF
	dc.b	"game store right?    ^",FF
	dc.b	"You guys are stealing",LF
	dc.b	"half my business.    ^",FF
	dc.b	"Now you want me to do",LF
	dc.b	"you a favor?         ^",FF
	dc.b	"I'm not the bank kid.",LF
	dc.b	"                     ^",FF
	dc.b	"...",LF
	dc.b	"                     ^",FF
	dc.b	"Sorry, I'm cranky from",LF
	dc.b	"working too long.    ^",FF
	dc.b	"Here, have a roll of",LF
	dc.b	"quarters.            ^",FF
	dc.b	"Do yourself a favor &",LF
	dc.b	"don't work too hard. ^",FF
	dc.b	"It's not worth it in",LF
	dc.b	"the end.             ^",FFR
	;		"1234567890123456789012"
	dc.b	"[Received Quarters]",ETX

	align 2
DialogTextGreenbergDay02Sub00NotComplete:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"I hope you have better",LF
	dc.b	"luck than I did.",ETX

	align 2
DialogTextGreenbergDay02Sub00Complete:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Did you have any luck?",ETX

	align 2
DialogTextGreenbergDay02Transition:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Great job, I knew you",LF
	dc.b	"could get it done.   ^",FF
	dc.b	"I'm sorry but I have",LF
	dc.b	"to leave early.      ^",FF
	dc.b	"I think you can handle",LF
	dc.b	"closing on your own. ^",FF
	dc.b	"Here's a key so you",LF
	dc.b	"can lock up.         ^",FF
	dc.b	"Don't worry at all,",LF
	dc.b	"you'll be fine.      ^",FFR
	dc.b	"[Received store key]",ETX

	align 2
DialogTextDay02Transition00:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Your shift is over.",LF
	dc.b	"Why are you here?",ETX

	align 2
DialogTextDay02Transition01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I was waiting for my",LF
	dc.b	"brother to show up.  ^",FF
	dc.b	"He should have been",LF
	dc.b	"here an hour ago.    ^",FF
	dc.b	"He probably got lost.",LF
	dc.b	"I better find him.",ETX

	align 2
DialogTextDay02SubsNotComplete:
	;		"1234567890123456789012"
	dc.b	"There are still things",LF
	dc.b	"you need to finish.",ETX

	align 2
DialogTextTBooksStaffDay02TalkSub01NotStarted:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"We have a problem.",LF
	dc.b	"                     ^",FF
	dc.b	"I only trust you &",LF
	dc.b	"Dani to help with it.^",FF
	dc.b	"I think there's a pro",LF
	dc.b	"shoplifter here.     ^",FF
	dc.b	"We got hit by them",LF
	dc.b	"yesterday.           ^",FF
	dc.b	"Some pricey science",LF
	dc.b	"books are missing.   ^",FF
	dc.b	"Could be they are",LF
	dc.b	"reselling them.      ^",FF
	dc.b	"I don't know why else",LF
	dc.b	"they'd take them.    ^",FF
	dc.b	"I need you to check",LF
	dc.b	"the other stores.    ^",FF
	dc.b	"See if any of them",LF
	dc.b	"were also hit.       ^",FF
	dc.b	"Let me know everything",LF
	dc.b	"you hear.",ETX

	align 2
DialogTextTBooksStaffDay02TalkSub01Started:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"Doesn't sound like you",LF
	dc.b	"found enough info yet.",ETX

	align 2
DialogTextTBooksStaffDay02TalkSub01Mid:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks for looking",LF
	dc.b	"into this.           ^",FF
	dc.b	"I don't see an obvious",LF
	dc.b	"connection here.     ^",FF
	dc.b	"These missing items",LF
	dc.b	"are all different.   ^",FF
	dc.b	"We need to keep an eye",LF
	dc.b	"on this for a while. ^",FF
	dc.b	"I don't remember ever",LF
	dc.b	"giving you a key.    ^",FF
	dc.b	"Here, take one now &",LF
	dc.b	"stop by whenever.    ^",FFR
	dc.b	"[Received store key]",ETX

	align 2
DialogTextTBooksStaffDay02TalkSub01Complete:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"There's something odd",LF
	dc.b	"about these thefts.",ETX

	align 2
DialogTextDenimCountryStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Anything missing?",LF
	dc.b	"Not that I've seen.",ETX

	align 2
DialogTextDenimCountryDaniDay02Talk:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Does your boss think",LF
	dc.b	"you're working?",ETX

	align 2
DialogTextCheckersStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"No, nothing unusual",LF
	dc.b	"lately.              ^",FF
	dc.b	"Hey, did you sister",LF
	dc.b	"say anything about.. ^",FF
	dc.b	"Oh nevermind.",ETX

	align 2
DialogTextTLodgeStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"We haven't had",LF
	dc.b	"anything stolen.     ^",FF
	dc.b	"We are missing one",LF
	dc.b	"shipment though.     ^",FF
	dc.b	"It's for a new line",LF
	dc.b	"of police scanners.  ^",FF
	dc.b	"They support over 20K",LF
	dc.b	"frequencies.         ^",FF
	dc.b	"Extended warranty",LF
	dc.b	"available for $20.   ^",FF
	dc.b	"I assumed they shipped",LF
	dc.b	"to the wrong store.",ETX

	align 2
DialogTextCavernStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"Stolen items?",LF
	dc.b	"                     ^",FF
	dc.b	"Yeah some guy just",LF
	dc.b	"took my quarters.    ^",FF
	dc.b	"You already know about",LF
	dc.b	"that.",ETX

	align 2
DialogTextSVideoStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"Nothing is missing",LF
	dc.b	"from the shelves.    ^",FF
	dc.b	"There is something",LF
	dc.b	"weird missing though.^",FF
	dc.b	"We throw out movies",LF
	dc.b	"that don't sell.     ^",FF
	dc.b	"First we run a tape",LF
	dc.b	"eraser over them.    ^",FF
	dc.b	"It keeps the dumpster",LF
	dc.b	"divers away.         ^",FF
	dc.b	"Well someone broke in",LF
	dc.b	"overnight & took it. ^",FF
	dc.b	"Who would do that?",ETX

	align 2
DialogTextNShackStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"It's been quiet here,",LF
	dc.b	"nothing like that.",ETX

	align 2
DialogTextPogoDawgStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Dude. Did you say?",LF
	dc.b	"Dude. Huh? Dude..",ETX

	align 2
DialogTextCPlanetStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"I wish someone stole",LF
	dc.b	"these boy band CDs.  ^",FF
	dc.b	"I don't suppose you",LF
	dc.b	"want them?",ETX

	align 2
DialogTextCNowStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Nothing's missing from",LF
	dc.b	"here.                ^",FF
	dc.b	"This reminds me of",LF
	dc.b	"last summer though...^",FF
	dc.b	"[30 minutes pass]",LF
	dc.b	"                     ^",FF
	dc.b	"...he never said why",LF
	dc.b	"he didn't call back.",ETX

	align 2
DialogTextFCBCheckoutStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_FCBCHECKOUT_STAFF
	;		"1234567890123456789012"
	dc.b	"Shoplifters can't",LF
	dc.b	"get past me.",ETX

	align 2
DialogTextFCBFirearmsStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"Everything here is",LF
	dc.b	"behind a glass case.",ETX

	align 2
DialogTextFCBFishingStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"Sorry, I haven't seen",LF
	dc.b	"anything suspicious.",ETX

	align 2
DialogTextFCBCampingStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Why are you asking me",LF
	dc.b	"about this?          ^",FF
	dc.b	"Why do you think I",LF
	dc.b	"know about it?",ETX

	align 2
DialogTextSouthCenterStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Funny you should ask.",LF
	dc.b	"                     ^",FF
	dc.b	"I swear someone is",LF
	dc.b	"stealing at night.   ^",FF
	dc.b	"A few small items go",LF
	dc.b	"missing every day.   ^",FF
	dc.b	"I was worried about",LF
	dc.b	"rodents.             ^",FF
	dc.b	"Do you think it's a",LF
	dc.b	"person instead?",ETX

	align 2
DialogTextWorkshopStaff0Day02Sub01Talk:
	dc.w	OBJ_NPC_WORKSHOP_STAFF0
	;		"1234567890123456789012"
	dc.b	"I don't have time for",LF
	dc.b	"this today.",ETX

	align 2
DialogTextWorkshopStaff1Day02Sub01Talk:
	dc.w	OBJ_NPC_WORKSHOP_STAFF1
	;		"1234567890123456789012"
	dc.b	"Nothing unusual here.",LF
	dc.b	"Why are you asking?",ETX

	align 2
DialogTextCheckersStaffDay02DaniTalkGood:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"We had a secret",LF
	dc.b	"shopper last week.   ^",FF
	dc.b	"Our review was",LF
	dc.b	"amazing!             ^",FF
	dc.b	"We're all getting a",LF
	dc.b	"bonus from it.       ^",FF
	dc.b	"My New Years party",LF
	dc.b	"will be great now!",ETX

	align 2
DialogTextCheckersStaffDay02DaniTalkMid:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"I guess we had a ",LF
	dc.b	"secret shopper here. ^",FF
	dc.b	"I don't remember them",LF
	dc.b	"at all.              ^",FF
	dc.b	"We did OK I guess. It",LF
	dc.b	"could have been worse.",ETX

	align 2
DialogTextCheckersStaffDay02DaniTalkBad:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Be careful at your",LF
	dc.b	"store.               ^",FF
	dc.b	"We just got a bad",LF
	dc.b	"secret shopper score.^",FF
	dc.b	"Now we all have to",LF
	dc.b	"take extra training.",ETX

	align 2
ScriptedEventDay02Mid00:
	dc.w	OBJ_NPC_FEMALE_SHOPPER0
	;		"1234567890123456789012"
	dc.b	"I can't decide which",LF
	dc.b	"system to get my kid.^",FF
	dc.b	"They want the new",LF
	dc.b	"new 16-bit one.      ^",FF
	dc.b	"Is it the Turbo 16 or",LF
	dc.b	"the Sega Gemini?",ETX

	align 2
ScriptedEventDay02Mid01:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"The TurboGrafx has 16",LF
	dc.b	"right in its name.   ^",FF
	dc.b	"It's also $10 cheaper.",LF
	dc.b	"                     ^",FF
	dc.b	"So it's better on the",LF
	dc.b	"family budget too.",ETX

	align 2
ScriptedEventDay02Mid02:
	dc.w	OBJ_NPC_FEMALE_SHOPPER0
	;		"1234567890123456789012"
	dc.b	"Wow, that's exactly",LF
	dc.b	"what I wanted hear.  ^",FF
	dc.b	"I'll take it then.",ETX

	align 2
ScriptedEventDay02Mid03:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"No wait, you're making",LF
	dc.b	"a terrible mistake.",ETX

	align 2
ScriptedEventDay02Mid04:
	dc.w	OBJ_NPC_FEMALE_SHOPPER0
	;		"1234567890123456789012"
	dc.b	"Excuse me? What are",LF
	dc.b	"you talking about?",ETX

	align 2
ScriptedEventDay02Mid05:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"In two years that",LF
	dc.b	"system will be dead. ^",FF
	dc.b	"You won't be able to",LF
	dc.b	"find any new games.  ^",FF
	dc.b	"Your kid will be very",LF
	dc.b	"disappointed.        ^",FF
	dc.b	"You have to believe me",LF
	dc.b	"on this.",ETX

	align 2
ScriptedEventDay02Mid06:
	dc.w	OBJ_NPC_FEMALE_SHOPPER0
	;		"1234567890123456789012"
	dc.b	"This is too confusing.",LF
	dc.b	"I'm leaving.",ETX

	align 2
ScriptedEventDay02Mid07:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"What's your problem?",LF
	dc.b	"You just blew a sale.^",FF
	dc.b	"You need to mind your",LF
	dc.b	"own business.",ETX

	align 2
ScriptedEventDay02Mid08:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I.. look.. I'm sorry.",LF
	dc.b	"OK. I'm sorry.       ^",FF
	dc.b	"I just didn't want her",LF
	dc.b	"to make a mistake.   ^",FF
	dc.b	"You can't undo some",LF
	dc.b	"mistakes.",ETX

	align 2
ScriptedEventDay02Mid09:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I'm not done with that",LF
	dc.b	"guy yet.",ETX

	align 2
DialogTextFCBCheckoutStaffDay02Sub02Talk:
	dc.w	OBJ_NPC_FCBCHECKOUT_STAFF
	;		"1234567890123456789012"
	dc.b	"I think I'd notice if",LF
	dc.b	"he left & came back. ^",FF
	dc.b	"Why are you looking at",LF
	dc.b	"me like that?        ^",FF
	dc.b	"OK, fine. I was asleep",LF
	dc.b	"for the past hour.",ETX

	align 2
DialogTextFCBFirearmsStaffDay02Sub02Talk:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"That guy never talks",LF
	dc.b	"to me.               ^",FF
	dc.b	"I don't care where he",LF
	dc.b	"is.",ETX

	align 2
DialogTextFCBFishingStaffDay02Sub02Talk:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"I saw him leaving for",LF
	dc.b	"his 30-minute break. ^",FF
	dc.b	"He's usually back by",LF
	dc.b	"now.",ETX

	align 2
DialogTextDBDay02Sub02StartedTalk:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I think that guy works",LF
	dc.b	"next door.",ETX

	align 2
DialogTextDBDay02Sub02MidTalk:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"He hasn't gone back to",LF
	dc.b	"his store yet.       ^",FF
	dc.b	"He must be somewhere",LF
	dc.b	"else in the mall.",ETX

	align 2
ScriptedEventDay02Sub02Mid00:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You can mess up your",LF
	dc.b	"store all you want.  ^",FF
	dc.b	"But you better leave",LF
	dc.b	"my brother alone.    ^",FF
	dc.b	"He's trying to save",LF
	dc.b	"for college.         ^",FF
	dc.b	"He can't afford to",LF
	dc.b	"lose another job.",ETX

	align 2
ScriptedEventDay02Sub02Mid01:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"OK, I'm sorry.",LF
	dc.b	"It won't happen again.",ETX

	align 2
ScriptedEventDay02Sub02End00:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Alright, I found him.",LF
	dc.b	"                     ^",FF
	dc.b	"Let me know if he bugs",LF
	dc.b	"you again.           ^",FF
	dc.b	"Finish up closing &",LF
	dc.b	"let's leave already.",ETX

	align 2
ScriptedEventDay02Sub02End01:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"ok.. so F9 then `Y'.",LF
	dc.b	"I think that's right.",ETX

	align 2
DialogTextDaniScene05Day02:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"That was some day.",LF
	dc.b	"                     ^",FF
	dc.b	"Pretty typical for",LF
	dc.b	"this time of year.",ETX

	align 2
DialogTextMallManagerDay02:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"I'm out making my",LF
	dc.b	"daily rounds.        ^",FF
	dc.b	"I hope your store is",LF
	dc.b	"doing well today.    ^",FF
	dc.b	"This next month is",LF
	dc.b	"our time to shine.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 03
;-------------------------------------------------------------------------------
	align 2
DialogTextScriptedEventDay03Start:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm sorry to stop you",LF
	dc.b	"on your break.       ^",FF
	dc.b	"I wanted to apologize",LF
	dc.b	"for last week.       ^",FF
	dc.b	"I can't explain why I",LF
	dc.b	"acted that way.      ^",FF
	dc.b	"I guess I thought I",LF
	dc.b	"was being helpful.   ^",FF
	dc.b	"If it's OK I'd like to",LF
	dc.b	"stop by again.       ^",FF
	dc.b	"Just to look at games,",LF
	dc.b	"it cheers me up.     ^",FF
	dc.b	"I won't be a problem.",LF
	dc.b	"I promise.",ETX

	align 2
DialogTextDaniScene08Day03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Break time again?",LF
	dc.b	"How is that possible?",ETX

	align 2
DialogTextScene09Day03Intro:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"Are you still looking",LF
	dc.b	"for missing items?   ^",FFR
	dc.b	"{Go on...",LF
	dc.b	"{Maybe later",ETX

	align 2
DialogTextScene09Day03IntroR0:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"We had a shipment of 4",LF
	dc.b	"spy cameras get lost.^",FF
	dc.b	"They're a hot Xmas",LF
	dc.b	"gift this year.      ^",FF
	dc.b	"Extended warranty",LF
	dc.b	"available for $15.   ^",FF
	dc.b	"I thought they were",LF
	dc.b	"gone for good.       ^",FF
	dc.b	"Today I spotted one",LF
	dc.b	"by the phone booths. ^",FF
	dc.b	"Someone's using it to",LF
	dc.b	"spy on people here.  ^",FF
	dc.b	"I can't leave today to",LF
	dc.b	"look for the other 3.^",FF
	dc.b	"If you find them, I'll",LF
	dc.b	"come up with a reward.",ETX

	align 2
DialogTextScene09Day03IntroR1:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"OK, stop by if you're",LF
	dc.b	"interested later.",ETX

	align 2
DialogTextScene09Day03Found0:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"There should be 3 more",LF
	dc.b	"cameras out there.",ETX

	align 2
DialogTextScene09Day03Found1:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"There should be 2 more",LF
	dc.b	"cameras hiding.",ETX

	align 2
DialogTextScene09Day03Found2:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"So close, just 1 more",LF
	dc.b	"camera to find.",ETX

	align 2
DialogTextScene09Day03Give1:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"Alright! 1 down and 2",LF
	dc.b	"more to go.",ETX

	align 2
DialogTextScene09Day03Give2:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks! Just 1 more",LF
	dc.b	"camera to find.",ETX

DialogTextDay03FindCamera1:
	;		"1234567890123456789012"
	dc.b	"(Hey, something is",LF
	dc.b	"under the bench..)   ^",FF
	dc.b	"[Found Camera]",ETX

DialogTextDay03FindCamera2:
	;		"1234567890123456789012"
	dc.b	"You dig through the",LF
	dc.b	"plant for a minute.. ^",FF
	dc.b	"[Found Camera]",ETX

DialogTextDay03FindCamera3:
	;		"1234567890123456789012"
	dc.b	"(There's something",LF
	dc.b	"hidden in this pot..)^",FF
	dc.b	"[Found Camera]",ETX

	align 2
DialogTextDay03CantEnterVB:
	;		"1234567890123456789012"
	dc.b	"There's still time",LF
	dc.b	"left on your break.",ETX

	align 2
DialogTextDay03ScriptedEventMid00:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks for finding",LF
	dc.b	"these cameras.       ^",FF
	dc.b	"Have a key to the",LF
	dc.b	"store in return.     ^",FF
	dc.b	"I don't understand who",LF
	dc.b	"wants to spy on us.  ^",FF
	dc.b	"Nothing exciting ever",LF
	dc.b	"happens here.        ^",FFR
	dc.b	"[Received store key]",ETX

	align 2
DialogTextDay03ScriptedEventMid01:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, yeah. So like,",LF
	dc.b	"that dude. Todd.     ^",FF
	dc.b	"He was just at, where",LF
	dc.b	"was it again? Uh..   ^",FF
	dc.b	"That place I work with",LF
	dc.b	"the food.            ^",FF
	dc.b	"He said you were like",LF
	dc.b	"watching the store.  ^",FF
	dc.b	"So, huh, do you help",LF
	dc.b	"with other stuff too?",ETX

	align 2
DialogTextDay03ScriptedEventMid02:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"That was two weeks",LF
	dc.b	"ago.",ETX

	align 2
DialogTextDay03ScriptedEventMid03:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"We have to close this",LF
	dc.b	"month. Like forever. ^",FF
	dc.b	"We don't have enough,",LF
	dc.b	"uh, customers? Right?^",FF
	dc.b	"Can you get people to",LF
	dc.b	"eat at our place more?",ETX

	align 2
DialogTextDay03ScriptedEventMid04:
	;		"1234567890123456789012"
	dc.w	OBJ_NPC_DANI
	dc.b	"I guess I've done",LF
	dc.b	"worse things.",ETX

	align 2
DialogTextDay03ScriptedEventMid05:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Uh. Yeah. Thanks.",LF
	dc.b	"                     ^",FF
	dc.b	"We have, uh, like",LF
	dc.b	"a couple weeks left.",ETX

	align 2
DialogTextDay03Scene08NPCShopper:
	dc.w	OBJ_NPC_FEMALE_SHOPPER0
	;		"1234567890123456789012"
	dc.b	"I just can't decide.",ETX

	align 2
DialogTextDay03BillyDefault:
	dc.w	OBJ_NPC_BILLY
	;		"1234567890123456789012"
	dc.b	"I'm not causing any",LF
	dc.b	"trouble here.",ETX

	align 2
DialogTextDay03BillySubStarted:
	dc.w	OBJ_NPC_BILLY
	;		"1234567890123456789012"
	dc.b	"You're not going to",LF
	dc.b	"kick me out are you?",ETX

	align 2
DialogTextDay03GreenbergStartSub:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Where's D.B.?",LF
	dc.b	"                     ^",FF
	dc.b	"He's looking for that",LF
	dc.b	"young man's parent.  ^",FF
	dc.b	"I think they work in",LF
	dc.b	"the mall.            ^",FF
	dc.b	"Maybe their sitter",LF
	dc.b	"canceled.            ^",FF
	dc.b	"He's been here for",LF
	dc.b	"quite a while.       ^",FF
	dc.b	"We can't close while",LF
	dc.b	"he's still here.     ^",FF
	dc.b	"I bet he could use a",LF
	dc.b	"hand searching.",ETX

	align 2
DialogTextDay03GreenbergSubInProgress:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Any luck finding that",LF
	dc.b	"young fellow's parent?",ETX

	align 2
DialogTextDay03GreenbergSubComplete:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"If you find D.B. tell",LF
	dc.b	"him he can go home.",ETX

	align 2
DialogTextDay03GreenbergMallClosed:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"I don't need any help",LF
	dc.b	"closing tonight.",ETX

	align 2
DialogTextScene17Day03Event:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Oh Billy?",LF
	dc.b	"He's my grandson.    ^",FF
	dc.b	"His parents had plans",LF
	dc.b	"tonight.             ^",FF
	dc.b	"Then I had to come in",LF
	dc.b	"at the last minute.  ^",FF
	dc.b	"He would have been so",LF
	dc.b	"bored here.          ^",FF
	dc.b	"That's why I left him",LF
	dc.b	"at the game store.   ^",FF
	dc.b	"I hope he didn't get",LF
	dc.b	"in the way too badly.^",FF
	dc.b	"It's almost closing",LF
	dc.b	"time so I'll get him.",ETX

	align 2
DialogTextTBooksStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"Sorry, I don't know",LF
	dc.b	"whose kid that is.",ETX

	align 2
DialogTextDenimCountryStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Why are you still here",LF
	dc.b	"this late?",ETX

	align 2
DialogTextCheckersStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm just glad they",LF
	dc.b	"weren't ditched here.",ETX

	align 2
DialogTextTLodgeStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"That's definitely not",LF
	dc.b	"my kid.              ^",FF
	dc.b	"While you're here, any",LF
	dc.b	"interest in a new PC?",ETX

	align 2
DialogTextCavernStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"If I had kids I would",LF
	dc.b	"not bring them here. ^",FF
	dc.b	"There are some real",LF
	dc.b	"unsavory types around.",ETX

	align 2
DialogTextSVideoStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"I think he was ditched",LF
	dc.b	"here once too.       ^",FF
	dc.b	"I don't know who left",LF
	dc.b	"him though.",ETX

	align 2
DialogTextNShackStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Sorry, I don't know",LF
	dc.b	"anything about it.",ETX

	align 2
DialogTextPogoDawgStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Huh? Where's who?",ETX

	align 2
DialogTextCPlanetStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"You're really asking",LF
	dc.b	"me about some kid?",ETX

	align 2
DialogTextCNowStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Kids are great but I",LF
	dc.b	"don't have any yet.  ^",FF
	dc.b	"One day though I'd",LF
	dc.b	"like to have some.   ^",FF
	dc.b	"I've already picked",LF
	dc.b	"out names like..     ^",FF
	dc.b	"[30 minutes pass]",LF
	dc.b	"                     ^",FF
	dc.b	".. I'll invite you to",LF
	dc.b	"all the showers too!",ETX

	align 2
DialogTextFCBCheckoutStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_FCBCHECKOUT_STAFF
	;		"1234567890123456789012"
	dc.b	"My ex in Jersey has",LF
	dc.b	"the kids.",ETX

	align 2
DialogTextFCBFirearmsStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"That store sure has a",LF
	dc.b	"lot of problems.",ETX

	align 2
DialogTextFCBFishingStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"Sorry, I don't know",LF
	dc.b	"about that at all.",ETX

	align 2
DialogTextFCBCampingStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"That's a weird thing",LF
	dc.b	"to ask about.        ^",FF
	dc.b	"I'm not even married",LF
	dc.b	"yet.",ETX

	align 2
DialogTextWorkshopStaff0Day03SubVBTalk:
	dc.w	OBJ_NPC_WORKSHOP_STAFF0
	;		"1234567890123456789012"
	dc.b	"I don't have time to",LF
	dc.b	"deal with this today.",ETX

	align 2
DialogTextWorkshopStaff1Day03SubVBTalk:
	dc.w	OBJ_NPC_WORKSHOP_STAFF1
	;		"1234567890123456789012"
	dc.b	"I'm sure the parents",LF
	dc.b	"will return for him.",ETX

	align 2
DialogTextDay03End:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I took care of your",LF
	dc.b	"store's kid problem. ^",FF
	dc.b	"You're welcome.",LF
	dc.b	"                     ^",FF
	dc.b	"It's closing time so",LF
	dc.b	"let's go already.",ETX

	align 2
DialogTextDay03Scene02Action00NPCDB:
	;		"1234567890123456789012"
	dc.b	"(Why is he searching",LF
	dc.b	"here anyway?)",ETX

	align 2
DialogTextDaniScene05Day03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I hear you're playing",LF
	dc.b	"detective now.       ^",FF
	dc.b	"Don't get yourself",LF
	dc.b	"into any trouble.",ETX

	align 2
DialogTextMallManagerDay03:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"I heard your brother",LF
	dc.b	"was snooping around. ^",FF
	dc.b	"You should talk to me",LF
	dc.b	"if something is wrong.",ETX

	align 2
DialogTextDay03PDawgCustomer00:
	dc.w	OBJ_NPC_FEMALE_SHOPPER1
	;		"1234567890123456789012"
	dc.b	"Cooking sure looks",LF
	dc.b	"difficult.           ^",FF
	dc.b	"I wonder if there's an",LF
	dc.b	"easier way to eat?",ETX

	align 2
DialogTextDay03PDawgCustomer01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You could try going to",LF
	dc.b	"Pogo Dawg.           ^",FF
	dc.b	"They have something",LF
	dc.b	"similar to food.     ^",FF
	dc.b	"It's usually already",LF
	dc.b	"been cooked too.",ETX

	align 2
DialogTextDay03PDawgCustomer02:
	dc.w	OBJ_NPC_FEMALE_SHOPPER1
	;		"1234567890123456789012"
	dc.b	"Thanks, I'll give that",LF
	dc.b	"a try.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 04
;------------------------------------------------------------------------------

	align 2
DialogTextScriptedEventDay04Start00:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, I got Todd in the",LF
	dc.b	"Secret Santa thing.  ^",FF
	dc.b	"You went to the same",LF
	dc.b	"high school right?   ^",FF
	dc.b	"What should I get him?",ETX

	align 2
DialogTextScriptedEventDay04Start01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"A clue would be a good",LF
	dc.b	"start.",ETX

	align 2
DialogTextScriptedEventDay04Start02:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Uh, OK. I'll see what ",LF
	dc.b	"I can do there..     ^",FF
	dc.b	"You should sign-up for",LF
	dc.b	"the exchange too.    ^",FF
	dc.b	"A little holiday cheer",LF
	dc.b	"wouldn't kill you.",ETX

	align 2
DialogTextDay04Scene03SubNotStarted:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Are you here for the",LF
	dc.b	"Secret Santa exchange?",FFR
	dc.b	"{Apparently so",LF
	dc.b	"{Are you kidding?",ETX

	align 2
DialogTextDay04Scene03SubNotStartedR0:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Wow! You were the last",LF
	dc.b	"person I expected.   ^",FF
	dc.b	"We have just one",LF
	dc.b	"small problem though.^",FF
	dc.b	"There was a mix-up &",LF
	dc.b	"we need 1 more gift. ^",FF
	dc.b	"Do you think you could",LF
	dc.b	"find someone to join?",ETX

	align 2
DialogTextDay04Scene03SubNotStartedR1:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Stop back if you",LF
	dc.b	"change your mind.",ETX

	align 2
DialogTextDay04Scene03SubStarted0:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"When you find a gift",LF
	dc.b	"please give it to me.^",FF
	dc.b	"I'll take care of the",LF
	dc.b	"rest!",ETX

	align 2
DialogTextDay04Scene03SubChoose:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks for finding",LF
	dc.b	"someone else!        ^",FF
	dc.b	"Which Secret Santa",LF
	dc.b	"envelope do you want?^",FFR
	dc.b	"{Envelope 1",LF
	dc.b	"{Envelope 2",ETX

	align 2
DialogTextDay04Scene03SubChoose0:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Here you go!",LF
	dc.b	"                     ^",FFR
	dc.b	"[Received Envelope]",ETX

	align 2
DialogTextDay04Scene03SubChoose1:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Interesting pick.",LF
	dc.b	"Good luck!           ^",FFR
	dc.b	"[Received Envelope]",ETX

	align 2
DialogTextDay04Scene03SubStartGift0:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"The rules are simple,",LF
	dc.b	"                     ^",FF
	dc.b	"find a gift for the",LF
	dc.b	"name in the envelope.^",FF
	dc.b	"Then bring the gift to",LF
	dc.b	"me.                  ^",FF
	dc.b	"I'll wrap it & give it",LF
	dc.b	"to them before Xmas.",ETX

	align 2
DialogTextDay04Scene03SubStartGift1:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Sweet, mine is really",LF
	dc.b	"easy.",ETX

	align 2
DialogTextDay04Scene03SubTBooks0:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, glad you're here.",LF
	dc.b	"                     ^",FF
	dc.b	"Are you interested in",LF
	dc.b	"making a trade?",ETX

	align 2
DialogTextDay04Scene03SubTBooks1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Go on..",ETX

	align 2
DialogTextDay04Scene03SubTBooks2:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"I need something from",LF
	dc.b	"your store.          ^",FF
	dc.b	"It's for my Secret",LF
	dc.b	"Santa gift.          ^",FF
	dc.b	"In exchange you grab",LF
	dc.b	"a gift from here.    ^",FF
	dc.b	"We'll consider it an",LF
	dc.b	"even trade.",ETX

	align 2
DialogTextDay04Scene03SubTBooks3:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Let me consider the",LF
	dc.b	"ethical implications.^",FF
	dc.b	"...",LF
	dc.b	"Yes.",ETX

	align 2
DialogTextDay04Scene03SubTBooks4:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"Great, just take",LF
	dc.b	"whatever you need.   ^",FF
	dc.b	"Give a book back to me",LF
	dc.b	"if you don't want it.",ETX

	align 2
DialogTextDay04Scene03NPCGive:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"I'll put this one back",LF
	dc.b	"on the right shelf.",ETX

	align 2
DialogTextDay04Scene00NPCGive:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Here, you're taking",LF
	dc.b	"this. Don't complain.",ETX

	align 2
DialogTextDay04Scene03SubStartedGive:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Is this the gift you",LF
	dc.b	"want to give?",FFR
	dc.b	"{Yeah, it's the one",LF
	dc.b	"{On second thought..",ETX

	align 2
DialogTextDay04Scene03SubStartedGiveR0:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Great! I'll make sure",LF
	dc.b	"they get it.         ^",FF
	dc.b	"Stop by later to get",LF
	dc.b	"your secret gift.",ETX

	align 2
DialogTextDay04Scene03StartSubR:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Here you go, good luck",LF
	dc.b	"and have fun shopping!",ETX

	align 2
DialogTextDay04Scene03SubComplete:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"The gift exchange went",LF
	dc.b	"perfectly!           ^",FF
	dc.b	"I can't wait until",LF
	dc.b	"next year!",ETX

	align 2
DialogTextDay04Scene03TalkNPC:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I wonder who we'll",LF
	dc.b	"each get?",ETX

	align 2
DialogTextDBDay04:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Is your manager ever",LF
	dc.b	"here anymore?",ETX

	align 2
DialogTextDBDay04SubFindNPC:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Gift exchange?",LF
	dc.b	"                     ^",FF
	dc.b	"Were you replaced with",LF
	dc.b	"a clone overnight?   ^",FF
	dc.b	"I'm alone now so I",LF
	dc.b	"can't help with that.",ETX

	align 2
DialogTextDBDay04SubFindGift:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I'm taking something",LF
	dc.b	"for the exchange.    ^",FF
	dc.b	"I assume you don't",LF
	dc.b	"care.",ETX

	align 2
DialogTextTBooksStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm already in the ",LF
	dc.b	"gift exchange.       ^",FF
	dc.b	"Stop by later if you",LF
	dc.b	"need a gift.",ETX

	align 2
DialogTextTBooksGreenbergDay0400:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Shouldn't you be at",LF
	dc.b	"your store?",ETX

	align 2
DialogTextTBooksGreenbergDay0401:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Shouldn't you be at",LF
	dc.b	"your store?",ETX

	align 2
DialogTextTBooksGreenbergDay0402:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yeah, alright.",ETX

	align 2
DialogTextTBooksGreenbergDay0403:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"You worry too much.",LF
	dc.b	"                     ^",FF
	dc.b	"I'm sure D.B. is doing",LF
	dc.b	"just fine right now.",ETX

	align 2
DialogTextDenimCountryStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"You're really doing",LF
	dc.b	"the gift exchange?   ^",FF
	dc.b	"That's so, not, oh,",LF
	dc.b	"nevermind I guess.",ETX

	align 2
DialogTextCheckersStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Wish I could help but",LF
	dc.b	"I joined yesterday.  ^",FF
	dc.b	"I have no idea what to",LF
	dc.b	"get my person.",ETX

	align 2
DialogTextTLodgeStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm in the Secret",LF
	dc.b	"Santa exchange.      ^",FF
	dc.b	"I'm going to nail",LF
	dc.b	"my gift too..",ETX

	align 2
DialogTextCavernStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"Gift exchange?",LF
	dc.b	"Sorry, not my thing.",ETX

	align 2
DialogTextSVideoStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"Sorry, too late.",LF
	dc.b	"I'm already in it.",ETX

	align 2
DialogTextNShackStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm signed-up for it",LF
	dc.b	"already.",ETX

	align 2
DialogTextPogoDawgStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Huh? Did you say you",LF
	dc.b	"bought me a present?",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"Oh I'm signed-up.",LF
	dc.b	"                     ^",FF
	dc.b	"Whoever drew my name",LF
	dc.b	"better get it right.",ETX

	align 2
DialogTextCNowStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm in already, I love",LF
	dc.b	"presents. Last year..^",FF
	dc.b	"[30 minutes later]",LF
	dc.b	"                     ^",FF
	dc.b	"..the doctor said she",LF
	dc.b	"never saw it before.",ETX

	align 2
DialogTextFCBCheckoutStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_FCBCHECKOUT_STAFF
	;		"1234567890123456789012"
	dc.b	"Are you trying to",LF
	dc.b	"prank me?",ETX

	align 2
DialogTextFCBFirearmsStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"Nah, I don't have time",LF
	dc.b	"for that.",ETX

	align 2
DialogTextFCBFishingStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"Not only did I join",LF
	dc.b	"but I'm done shopping.",ETX

	align 2
DialogTextFCBCampingStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Secret Santa? Yeah,",LF
	dc.b	"yeah, OK, I'll do it.^",FF
	dc.b	"Consider it my way",LF
	dc.b	"of apologizing.      ^",FF
	dc.b	"Plus I know everyone",LF
	dc.b	"here well by now.",ETX

	align 2
DialogTextSouthCenterStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Too late, I signed-up",LF
	dc.b	"this morning.",ETX

	align 2
DialogTextWorkshopStaff0Day04SubFindNPC:
	dc.w	OBJ_NPC_WORKSHOP_STAFF0
	;		"1234567890123456789012"
	dc.b	"I'm already signed-up.",ETX

	align 2
DialogTextWorkshopStaff1Day04SubFindNPC:
	dc.w	OBJ_NPC_WORKSHOP_STAFF1
	;		"1234567890123456789012"
	dc.b	"Sorry, I have my hands",LF
	dc.b	"full with real Santa.",ETX

	align 2
DialogTextSVideoStaffDay04SubFindGift0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"My little brother,",LF
	dc.b	"definitely not me,   ^",FF
	dc.b	"got your name in the",LF
	dc.b	"Secret Santa exchange.",ETX

	align 2
DialogTextSVideoStaffDay04SubFindGift1:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"You mean D.B.?",LF
	dc.b	"He seems nice.       ^",FF
	dc.b	"Is he really just a",LF
	dc.b	"senior?",ETX

	align 2
DialogTextSVideoStaffDay04SubFindGift2:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yeah, he might even",LF
	dc.b	"graduate this year.  ^",FF
	dc.b	"So what do you want",LF
	dc.b	"anyway?",ETX

	align 2
DialogTextSVideoStaffDay04SubFindGift3:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"I just started junior",LF
	dc.b	"college in August.   ^",FF
	dc.b	"I want to study math",LF
	dc.b	"& computer science.  ^",FF
	dc.b	"I can't decide which",LF
	dc.b	"to major in though.  ^",FF
	dc.b	"I'm really interested",LF
	dc.b	"in both right now.",ETX

	align 2
DialogTextSVideoStaffDay04SubFindGift4:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"OK, maybe he can find",LF
	dc.b	"something to help.",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Hey so that Secret",LF
	dc.b	"Santa exchange,      ^",FF
	dc.b	"It's really dumb",LF
	dc.b	"right?",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift1:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"Yeah, I only signed-up",LF
	dc.b	"as a joke.           ^",FF
	dc.b	"You know, to mess with",LF
	dc.b	"people.",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift2:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Of course.",LF
	dc.b	"                     ^",FF
	dc.b	"So my brother, not me,",LF
	dc.b	"signed-up & got you. ^",FF
	dc.b	"He's kind of useless,",LF
	dc.b	"could I get a hint?  ^",FF
	dc.b	"For him, not me.",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift3:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"Anything that's dark &",LF
	dc.b	"mysterious,          ^",FF
	dc.b	"Like my heart.",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift4:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"OK, yeah, he'll figure",LF
	dc.b	"something out I guess.",ETX

	align 2
DialogTextDay04ScriptedEventTransition:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Alright, I'm just",LF
	dc.b	"about done closing.  ^",FF
	dc.b	"Go ahead & leave for",LF
	dc.b	"the night.           ^",FF
	dc.b	"I'll take care of",LF
	dc.b	"cleaning-up tonight, ^",FF
	dc.b	"since you were alone",LF
	dc.b	"most of the day.",ETX

	align 2
DialogTextVBStaffDay04MallClosed:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Did you forget",LF
	dc.b	"something?",ETX

	align 2
DialogTextTBooksStaffDay04MallClosed:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"What brings you here",LF
	dc.b	"this late?",ETX

	align 2
DialogTextCheckersStaffDay04MallClosed:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, so did.. oh",LF
	dc.b	"nevermind I guess.",ETX

	align 2
DialogTextDCountryStaffDay04MallClosed:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Dani just left a",LF
	dc.b	"second ago.",ETX

	align 2
DialogTextTLodgeStaffDay04MallClosed:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm trying to close,",LF
	dc.b	"we can talk later.",ETX

	align 2
DialogTextCenterStaffDay04MallClosed:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Please ask your sister",LF
	dc.b	"to pick-up her gift.",ETX

	align 2
DialogTextSouthCenterStaffDay04MallClosed:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I hope security finds",LF
	dc.b	"who's been stealing.",ETX

	align 2
DialogTextSVideoStaffDay04MallClosed:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"I didn't think you'd",LF
	dc.b	"stop by so soon.     ^",FF
	dc.b	"I have to study for",LF
	dc.b	"finals tonight.      ^",FF
	dc.b	"So maybe another time.",ETX

	align 2
DialogTextCPlanetStaffDay04MallClosed:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"You sure don't wait",LF
	dc.b	"long, huh.           ^",FF
	dc.b	"I can't talk tonight.",LF
	dc.b	"                     ^",FF
	dc.b	"I'm heading out to the",LF
	dc.b	"Rocky Horror show.   ^",FF
	dc.b	"I go every week. Just",LF
	dc.b	"as a joke of course.",ETX

	align 2
DialogTextDay04SVideoGoodGift:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"I know it was you who",LF
	dc.b	"found my gift.       ^",FF
	dc.b	"Thanks, it was really",LF
	dc.b	"great.               ^",FF
	dc.b	"Have a key to my store",LF
	dc.b	"& stop by anytime.",ETX

	align 2
DialogTextDay04CPlanetGoodGift:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks for that Secret",LF
	dc.b	"Santa gift.          ^",FF
	dc.b	"I never would have",LF
	dc.b	"thought to buy it.   ^",FF
	dc.b	"You might be alright",LF
	dc.b	"after all.           ^",FF
	dc.b	"Have a key to my store",LF
	dc.b	"& don't be a stranger.",ETX

	align 2
DialogTextDay04SDBGoodGift:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"(...)",ETX

	align 2
DialogTextDaniScene05Day04:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Don't ask about it,",LF
	dc.b	"let's just go.",ETX

	align 2
DialogTextMallManagerDay04:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"Oh, there you are.",LF
	dc.b	"                     ^",FF
	dc.b	"You know I take mall",LF
	dc.b	"safety seriously.    ^",FF
	dc.b	"You should tell me",LF
	dc.b	"anything you hear.   ^",FF
	dc.b	"Together we can keep",LF
	dc.b	"Bayhurst Mall safe.",ETX

	align 2
DialogTextDay04PDawgCustomer00:
	dc.w	OBJ_NPC_MALE_SHOPPER2
	;		"1234567890123456789012"
	dc.b	"I'm so hungry that",LF
	dc.b	"I'm taking up hunting.",ETX

	align 2
DialogTextDay04PDawgCustomer01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"That's one thing that",LF
	dc.b	"will work.           ^",FF
	dc.b	"But it's probably",LF
	dc.b	"easier to buy food.  ^",FF
	dc.b	"Have you tried Pogo",LF
	dc.b	"Dawg?                ^",FF
	dc.b	"If you still want to",LF
	dc.b	"kill live animals,   ^",FF
	dc.b	"you can check out",LF
	dc.b	"their kitchen.",ETX

	align 2
DialogTextDay04PDawgCustomer02:
	dc.w	OBJ_NPC_MALE_SHOPPER2
	;		"1234567890123456789012"
	dc.b	"Sounds like a win-win,",LF
	dc.b	"thanks.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 05
;-------------------------------------------------------------------------------

	align 2
DialogTextDay05ScriptedEventIntro00:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"We haven't had any",LF
	dc.b	"shoppers for an hour.^",FF
	dc.b	"I know there's a storm",LF
	dc.b	"due overnight.       ^",FF
	dc.b	"Maybe it arrived",LF
	dc.b	"early?               ^",FF
	dc.b	"Can you go find out",LF
	dc.b	"what's going on?",ETX

	align 2
DialogTextGreenbergScene00Day05Storm:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"You should get out",LF
	dc.b	"while you still can. ^",FF
	dc.b	"No point in both of ",LF
	dc.b	"us being stuck here.",ETX

	align 2
DialogTextGreenbergScene00Day05SnowedIn:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Don't worry about me.",LF
	dc.b	"                     ^",FF
	dc.b	"I'll catch-up on",LF
	dc.b	"taking inventory.",ETX

	align 2
DialogTextScene04Day05NPC11SnowedIn:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"Sorry, not now.",LF
	dc.b	"                     ^",FF
	dc.b	"I'm trying to reach my",LF
	dc.b	"friend with the ATV.",ETX

	align 2
DialogTextScene04Day05NPC01SnowedIn:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Bad news.",LF
	dc.b	"Go see for yourself.",ETX

	align 2
DialogTextDay05ScriptedEventSnowedIn:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"We better find a place",LF
	dc.b	"to wait this out.    ^",FF
	dc.b	"We might be stuck here",LF
	dc.b	"all night.",ETX

	align 2
DialogTextScene14Day05NPC10SnowedIn:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm staying here all",LF
	dc.b	"night if I have to.  ^",FF
	dc.b	"This is exactly when",LF
	dc.b	"looters come out.",ETX

	align 2
DialogTextScene0EDay05NPC0ASnowedIn:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"I wish I could leave",LF
	dc.b	"like everyone else,  ^",FF
	dc.b	"but I don't have a",LF
	dc.b	"car. I'll be OK.",ETX

	align 2
DialogTextScene0FDay05NPC0BSnowedIn:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"It's like, yeah, real",LF
	dc.b	"slow today. Dude.",ETX

	align 2
DialogTextScene13Day05NPC12SnowedIn:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Half of my store left",LF
	dc.b	"early.               ^",FF
	dc.b	"What are you still",LF
	dc.b	"doing here?",ETX

	align 2
DialogTextScene13Day05NPC08SnowedIn:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"Why's everyone leaving",LF
	dc.b	"over a little snow?",ETX

	align 2
DialogTextDay05ScriptedEventGoodExcuse:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Blizzard?",LF
	dc.b	"                     ^",FF
	dc.b	"That's a good enough",LF
	dc.b	"excuse to leave.",ETX

	align 2
DialogTextDay05ScriptedEventStartSub00:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yeah, we're kind of",LF
	dc.b	"stranded here.",ETX

	align 2
DialogTextDay05ScriptedEventStartSub01:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"That's too bad but it",LF
	dc.b	"will be OK, I swear. ^",FF
	dc.b	"You can stay in the",LF
	dc.b	"camping area here.   ^",FF
	dc.b	"It won't be a problem",LF
	dc.b	"at all.              ^",FF
	dc.b	"There are enough tents",LF
	dc.b	"for all of us.",ETX

	align 2
DialogTextDay05ScriptedEventStartSub02:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"What's the catch?",ETX

	align 2
DialogTextDay05ScriptedEventStartSub03:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"No catch, I'm not like",LF
	dc.b	"that at all.         ^",FF
	dc.b	"Bring something to eat",LF
	dc.b	"& we'll call it even?^",FF
	dc.b	"Maybe find something",LF
	dc.b	"for heat too.        ^",FF
	dc.b	"It gets cold back",LF
	dc.b	"there at night.",ETX

	align 2
DialogTextDay05ScriptedEventStartSub04:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Alright, I'll cover",LF
	dc.b	"the food.",ETX

	align 2
DialogTextDay05ScriptedEventStartSub05:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"You go find something",LF
	dc.b	"highly flammable.",ETX

	align 2
DialogTextDay05ScriptedEventStartSub06:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"So what do you want",LF
	dc.b	"anyway?",ETX

	align 2
DialogTextDay05ScriptedEventStartSub07:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm on a strict vegan",LF
	dc.b	"& gluten-free diet.",ETX

	align 2
DialogTextDay05ScriptedEventStartSub08:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"(what's gluten?)",LF
	dc.b	"(wait, what's vegan?)^",FF
	dc.b	"OK, I'll see what I",LF
	dc.b	"can manage.",ETX

	align 2
DialogTextDay05ScriptedEventStartSub09:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I know it's a limited",LF
	dc.b	"selection here.      ^",FF
	dc.b	"You should be able to",LF
	dc.b	"find a couple things.",ETX

	align 2
DialogTextDay05Scene12UseBookshelf:
	;		"1234567890123456789012"
	dc.b	"(Alright, let's see..",LF
	dc.b	"                     ^",FF
	dc.b	"So gluten is just like",LF
	dc.b	"bread, ok.           ^",FF
	dc.b	"Vegan means no animal",LF
	dc.b	"stuff.               ^",FF
	dc.b	"So no bread & no meat,",LF
	dc.b	"yeah, sounds easy.)",ETX
		
	align 2
DialogTextDay05SubDontKnow:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"(I still don't know",LF
	dc.b	"what I'm looking for)^",FF
	dc.b	"(Maybe a cookbook",LF
	dc.b	"would help)",ETX

	align 2
DialogTextDay05SubNoChance:
	;		"1234567890123456789012"
	dc.b	"(No chance I'll find",LF
	dc.b	"anything here)",ETX

	align 2
DialogTextDay05ScriptedEventSub00D0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I need stuff without",LF
	dc.b	"meat or gluten.      ^",FF
	dc.b	"I hope that means",LF
	dc.b	"something to you.",ETX

	align 2
DialogTextDay05ScriptedEventSub00D1:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"This must be for",LF
	dc.b	"Jordan right?        ^",FF
	dc.b	"He's here often, take",LF
	dc.b	"these for him.",ETX

	align 2
DialogTextScene0EDay05NPCSub00:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks for the invite,",LF
	dc.b	"I'll head over soon.",ETX

	align 2
DialogTextDay05ScriptedEventSub00D2:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"OK, thanks.",LF
	dc.b	"                     ^",FF
	dc.b	"I'm sure he'd welcome",LF
	dc.b	"you too tonight.     ^",FFR
	dc.b	"[Received mixed nuts]",ETX

	align 2
DialogTextDay05ScriptedEventSub01D0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"How much meat is in a",LF
	dc.b	"pogo dog anyway?",ETX

	align 2
DialogTextDay05ScriptedEventSub01D1:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Uh, some I think.",ETX

	align 2
DialogTextDay05ScriptedEventSub01D2:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"OK, just give me a few",LF
	dc.b	"bowls of relish then.",ETX

	align 2
DialogTextDay05ScriptedEventSub01D3:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Dude, even I think",LF
	dc.b	"this is weird.",FFR
	dc.b	"[Received relish]",ETX

	align 2
DialogTextDay05ExitParkingLot0:
	;		"1234567890123456789012"
	dc.b	"(I should get a ride",LF
	dc.b	"before leaving)",ETX

	align 2
DialogTextDay05Scene13Give0:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Alright, that's a",LF
	dc.b	"good start.",ETX

	align 2
DialogTextDay05ScriptedEventCamp00:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks, this will be",LF
	dc.b	"great too.",ETX

	align 2
DialogTextDay05ScriptedEventCamp01:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Looks like we're all",LF
	dc.b	"set for tonight.",ETX

	align 2
DialogTextDay05ScriptedEventCamp02:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"This isn't so bad.",LF
	dc.b	"                     ^",FF
	dc.b	"Better than our last",LF
	dc.b	"family camping trip. ^",FF
	dc.b	"D.B. is still scared",LF
	dc.b	"of fire because of it.",ETX

	align 2
DialogTextDay05ScriptedEventCamp03:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"When was that?",ETX

	align 2
DialogTextDay05ScriptedEventCamp04:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"10 years ago.",LF
	dc.b	"                     ^",FF
	dc.b	"Our father was in a",LF
	dc.b	"rambling man phase.",ETX

	align 2
DialogTextDay05ScriptedEventCamp05:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"My last camping trip",LF
	dc.b	"was bad too.         ^",FF
	dc.b	"This is already a lot",LF
	dc.b	"better.",ETX

	align 2
DialogTextDay05ScriptedEventCamp06:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"My family never went",LF
	dc.b	"camping.             ^",FF
	dc.b	"We're more of an",LF
	dc.b	"indoor crowd.",ETX

	align 2
DialogTextDay05ScriptedEventCamp07:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You managed a nice",LF
	dc.b	"setup here anyway.",ETX

	align 2
DialogTextDay05ScriptedEventCamp08:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Yeah.. I guess.",ETX

	align 2
DialogTextDay05ScriptedEventCamp09:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I don't recall seeing",LF
	dc.b	"you before November. ^",FF
	dc.b	"Did you move here",LF
	dc.b	"recently?",ETX

	align 2
DialogTextDay05ScriptedEventCamp0A:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Sort of, I grew up",LF
	dc.b	"around here.         ^",FF
	dc.b	"I moved years ago but",LF
	dc.b	"I guess I'm back now.",ETX

	align 2
DialogTextDay05ScriptedEventCamp0B:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Sorry if that's a sore",LF
	dc.b	"subject.",ETX

	align 2
DialogTextDay05ScriptedEventCamp0C:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"It's not that.. it's",LF
	dc.b	"hard to explain.",ETX

	align 2
DialogTextDay05ScriptedEventCamp0D:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"You can tell us.",LF
	dc.b	"I see you every day. ^",FF
	dc.b	"I know something is",LF
	dc.b	"troubling you.",ETX

	align 2
DialogTextDay05ScriptedEventCamp0E:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I can't.. you wouldn't",LF
	dc.b	"believe it anyway.",ETX

	align 2
DialogTextDay05ScriptedEventCamp0F:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Hey, I figured it out.",LF
	dc.b	"You're homeless.     ^",FF
	dc.b	"You're living here in",LF
	dc.b	"the mall.            ^",FF
	dc.b	"Living off mall snacks",LF
	dc.b	"& sleeping back here.^",FF
	dc.b	"Is that about right?",ETX

	align 2
DialogTextDay05ScriptedEventCamp10:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Yeah, that's right.",LF
	dc.b	"I'm living here.     ^",FF
	dc.b	"That's all.",ETX

	align 2
DialogTextDay05ScriptedEventCamp11:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"How did this happen?",ETX

	align 2
DialogTextDay05ScriptedEventCamp12:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"It just did.",ETX

	align 2
DialogTextDay05ScriptedEventCamp13:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"You're obviously in",LF
	dc.b	"some trouble.        ^",FF
	dc.b	"Maybe we can help.",ETX

	align 2
DialogTextDay05ScriptedEventCamp14:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"You're going to think",LF
	dc.b	"I'm crazy or lying.  ^",FF
	dc.b	"I'm not even sure",LF
	dc.b	"myself anymore.",ETX

	align 2
DialogTextDay05ScriptedEventCamp15:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Do your worst.",ETX

	align 2
DialogTextDay05ScriptedEventCamp16:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Fine. Look, I was here",LF
	dc.b	"before, when I was 4.^",FF
	dc.b	"We came to see Santa.",LF
	dc.b	"It's my first memory.",ETX

	align 2
DialogTextDay05ScriptedEventCamp17:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"That's not so crazy.",ETX

	align 2
DialogTextDay05ScriptedEventCamp18:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yeah it is.",LF
	dc.b	"                     ^",FF
	dc.b	"This is the first year",LF
	dc.b	"the mall has a Santa.",ETX

	align 2
DialogTextDay05ScriptedEventCamp19A:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"That's right. It was",LF
	dc.b	"25 years ago for me. ^",ETX

	align 2
DialogTextDay05ScriptedEventCamp19B:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Everything was so",LF
	dc.b	"perfect that day.    ^",FF
	dc.b	"We were such a happy",LF
	dc.b	"family back then.    ^",FF
	dc.b	"It wasn't long before",LF
	dc.b	"everything changed.  ^",FF
	dc.b	"This was our last",LF
	dc.b	"good time together.  ^",FF
	dc.b	"I grew up, went to",LF
	dc.b	"college, got engaged.^",FF
	dc.b	"You know, all the",LF
	dc.b	"expected things,     ^",FF
	dc.b	"I came back here last",LF
	dc.b	"month, November 2014.^",FF
	dc.b	"I was in town for a",LF
	dc.b	"boring work thing.   ^",FF
	dc.b	"I stopped by the mall",LF
	dc.b	"hoping it would help.^",FF
	dc.b	"I'm getting married",LF
	dc.b	"next summer, but..   ^",FF
	dc.b	"I'm just really scared",LF
	dc.b	"to start a family.   ^",FF
	dc.b	"I don't want it to end",LF
	dc.b	"like mine did.       ^",FF
	dc.b	"I wanted to remember",LF
	dc.b	"how it went so wrong.^",FF
	dc.b	"Maybe I could figure",LF
	dc.b	"it out & prevent it.",ETX

	align 2
DialogTextDay05ScriptedEventCamp1A:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Wait 2014? Who's the",LF
	dc.b	"president then?",ETX

	align 2
DialogTextDay05ScriptedEventCamp1B:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Oh, no one you know.",LF
	dc.b	"He's still in college.",ETX

	align 2
DialogTextDay05ScriptedEventCamp1C:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Guess I'll find out ",LF
	dc.b	"when it happens.     ^",FF
	dc.b	"Go on.",ETX

	align 2
DialogTextDay05ScriptedEventCamp1D:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"The mall was a",LF
	dc.b	"complete ghost town. ^",FF
	dc.b	"There were just a few",LF
	dc.b	"stores still open.   ^",FF
	dc.b	"The workshop location",LF
	dc.b	"was a Wire Warehouse.^",FF
	dc.b	"It was closing though,",LF
	dc.b	"final 10 days.       ^",FF
	dc.b	"In the back I saw it,",LF
	dc.b	"by a pile of boxes.  ^",FF
	dc.b	"It was the remnants of",LF
	dc.b	"Santa's Workshop.    ^",FF
	dc.b	"It must have been in",LF
	dc.b	"storage forever.     ^",FF
	dc.b	"I went up to it and it",LF
	dc.b	"all came back to me. ^",FF
	dc.b	"I pictured that moment",LF
	dc.b	"in 1989 clearly.     ^",FF
	dc.b	"But then it wasn't a",LF
	dc.b	"memory. I was there.",ETX

	align 2
DialogTextDay05ScriptedEventCamp1E:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Hey! What are you",LF
	dc.b	"doing here!          ^",FF
	dc.b	"This place doesn't",LF
	dc.b	"open until noon.",ETX

	align 2
DialogTextDay05ScriptedEventCamp1F:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I, uh, I was just..",LF
	dc.b	"Wait, where am I?",ETX

	align 2
DialogTextDay05ScriptedEventCamp20:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Is it your first day",LF
	dc.b	"or are you dumb?     ^",FF
	dc.b	"Get back to your own",LF
	dc.b	"store.",ETX

	align 2
DialogTextDay05ScriptedEventCamp21:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"My store?",ETX

	align 2
DialogTextDay05ScriptedEventCamp22:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Down the hall to the",LF
	dc.b	"right.               ^",FF
	dc.b	"With all the other",LF
	dc.b	CHAR_DQUOTE,"lumberjacks",CHAR_DQUOTE,".",ETX

	align 2
DialogTextDay05ScriptedEventCamp23:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Oh, ok.",ETX

	align 2
DialogTextDay05ScriptedEventCamp24:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"I better not find you",LF
	dc.b	"messing around here. ^",FF
	dc.b	"You'll earn a lifetime",LF
	dc.b	"ban from the mall.",ETX

	align 2
DialogTextDay05ScriptedEventCamp25:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"So you turned into a",LF
	dc.b	"lumberjack too?",ETX

	align 2
DialogTextDay05ScriptedEventCamp26:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"What? I've never even",LF
	dc.b	"held an axe.         ^",FF
	dc.b	"This is just a style,",LF
	dc.b	"that's popular.      ^",FF
	dc.b	"It's so you don't look",LF
	dc.b	"like everyone else.",ETX

	align 2
DialogTextDay05ScriptedEventCamp27:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"But if it's popular",LF
	dc.b	"then... nevermind.   ^",FF
	dc.b	"Do you want to go",LF
	dc.b	"back to 2014?",ETX

	align 2
DialogTextDay05ScriptedEventCamp28:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Yeah. I only wanted to",LF
	dc.b	"remember this time.  ^",FF
	dc.b	"Now I can't escape it.",LF
	dc.b	"I'm scared I'm stuck.",ETX

	align 2
DialogTextDay05ScriptedEventCamp29:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Is anyone looking for",LF
	dc.b	"you back home?",ETX

	align 2
DialogTextDay05ScriptedEventCamp2A:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I automated most of my",LF
	dc.b	"job.                 ^",FF
	dc.b	"They won't notice I'm",LF
	dc.b	"gone for a while.    ^",FF
	dc.b	"My fiance will be back",LF
	dc.b	"in town soon though. ^",FF
	dc.b	"She's visiting family",LF
	dc.b	"in India for a month.^",FF
	dc.b	"They don't have good",LF
	dc.b	"wifi in the village. ^",FF
	dc.b	"I don't think she'll",LF
	dc.b	"try to contact me.   ^",FF
	dc.b	"She's flying home on",LF
	dc.b	"December 26th.       ^",FF
	dc.b	"I need to be there",LF
	dc.b	"when she lands.",ETX

	align 2
DialogTextDay05ScriptedEventCamp2A1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"(Whyfye? Maybe it's a",LF
	dc.b	"new phone company?)",ETX

	align 2
DialogTextDay05ScriptedEventCamp2B:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"What if you went back",LF
	dc.b	"to Santa's Workshop? ^",FF
	dc.b	"Do you think it would",LF
	dc.b	"take you back?",ETX

	align 2
DialogTextDay05ScriptedEventCamp2C:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I thought about it,",LF
	dc.b	"but I can't get in.  ^",FF
	dc.b	"Daytime's no good.",LF
	dc.b	"It's locked at night.^",FF
	dc.b	"If the guards see me",LF
	dc.b	"I might get banned.",ETX

	align 2
DialogTextDay05ScriptedEventCamp2D:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"What about right after",LF
	dc.b	"closing on Xmas Eve? ^",FF
	dc.b	"They probably stop",LF
	dc.b	"guarding it then.",ETX

	align 2
DialogTextDay05ScriptedEventCamp2E:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Do you think that",LF
	dc.b	"would work?",ETX

	align 2
DialogTextDay05ScriptedEventCamp2F
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"It's worth a try.",LF
	dc.b	"                     ^",FF
	dc.b	"Worst case is we snag",LF
	dc.b	"some free decorations.",ETX

	align 2
DialogTextDay05ScriptedEventCamp30:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Alright, let's do it.",LF
	dc.b	"Xmas Eve it is.",ETX

	align 2
DialogTextDay05ScriptedEventCamp31:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Let's meet in my store",LF
	dc.b	"that morning to plan.",ETX

	align 2
DialogTextDay05ScriptedEventCamp32:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"We'll get you there.",LF
	dc.b	"                     ^",FF
	dc.b	"Meanwhile, I'm going",LF
	dc.b	"to get some sleep.",ETX

	align 2
DialogTextDay05ScriptedEventCamp33:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Ok, we're all clear to",LF
	dc.b	"leave now.",ETX

	align 2
DialogTextDay05Scene13NPCAfterCamp:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm nervous, what if",LF
	dc.b	"it doesn't work?",ETX

	align 2
DialogTextDay05Scene14NPCAfterCamp:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm not even tired",LF
	dc.b	"a little.",ETX

	align 2
DialogTextDay05ExitParkingLot1:
	;		"1234567890123456789012"
	dc.b	"(We're not making it",LF
	dc.b	"out tonight)",ETX

	align 2
DialogTextMallManagerDay05:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"Bayhurst Mall is proud",LF
	dc.b	"to always stay open. ^",FF
	dc.b	"Please report any",LF
	dc.b	"stores closing early.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 06
;-------------------------------------------------------------------------------
	align 2
DialogTextDay06ScriptedEventIntro00:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"I heard Todd invited",LF
	dc.b	"you to his party.    ^",FF
	dc.b	"You are so lucky!",LF
	dc.b	"You're going right?",ETX

	align 2
DialogTextDay06ScriptedEventIntro01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I don't know.",LF
	dc.b	"Hopefully not.",ETX

	align 2
DialogTextDay06ScriptedEventIntro02:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Don't ditch, I heard",LF
	dc.b	"last year was crazy. ^",FF
	dc.b	"I'm stuck at home,",LF
	dc.b	"unless.. nevermind.",ETX

	align 2
DialogTextDay06ScriptedEventIntro03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Already forgot about",LF
	dc.b	"it.",ETX

	align 2
DialogTextDay06ScriptedEventPlan00:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"We need to sneak into",LF
	dc.b	"the workshop tonight.^",FF
	dc.b	"How are we doing it?",ETX

	align 2
DialogTextDay06ScriptedEventPlan01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"He needs a clear path.",LF
	dc.b	"                     ^",FF
	dc.b	"The rest of us have to",LF
	dc.b	"keep the guard busy.",ETX

	align 2
DialogTextDay06ScriptedEventPlan02:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"But if he catches you,",LF
	dc.b	"you'll get banned,   ^",FF
	dc.b	"he loves to give out",LF
	dc.b	"lifetime bans.",ETX

	align 2
DialogTextDay06ScriptedEventPlan03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I don't really see",LF
	dc.b	"the downside to that.^",FF
	dc.b	"We need every store",LF
	dc.b	"key we can find.     ^",FF
	dc.b	"It will give us more",LF
	dc.b	"places to hide.",ETX

	align 2
DialogTextDay06ScriptedEventPlan04:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Good thinking.",LF
	dc.b	"Here's my spare key.",ETX

	align 2
DialogTextDay06ScriptedEventPlan05:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"My Secret Santa giftee",LF
	dc.b	"gave me this key.    ^",FF
	dc.b	"I guess it was her way",LF
	dc.b	"of saying thank you. ^",FFR
	dc.b	"[Received store keys]",ETX

	align 2
DialogTextDay06ScriptedEventPlan06:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Thanks but there are",LF
	dc.b	"two more we need.    ^",FF
	dc.b	"The workshop itself",LF
	dc.b	"& also ClothesNow.   ^",FF
	dc.b	"We can bypass the",LF
	dc.b	"center hallway there.",ETX

	align 2
DialogTextDay06ScriptedEventPlan07:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"I'll get it.",ETX

	align 2
DialogTextDay06ScriptedEventPlan08:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You volunteering?",LF
	dc.b	"That's unexpected.",ETX

	align 2
DialogTextDay06ScriptedEventPlan09:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"I dunno, I just think",LF
	dc.b	"I'm the right person.",ETX

	align 2
DialogTextDay06ScriptedEventPlan0A:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I have an idea how to",LF
	dc.b	"get the workshop key.^",FF
	dc.b	"It's going to be real",LF
	dc.b	"ugly though.",ETX

	align 2
DialogTextDay06ScriptedEventPlan0B:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Sounds like we have",LF
	dc.b	"a plan.",ETX

	align 2
DialogTextDay06ScriptedEventPlan0C:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Let's meet at Video",LF
	dc.b	"Buffet after close.  ^",FF
	dc.b	"It's next to Jordan's",LF
	dc.b	"store.               ^",FF
	dc.b	"The guard won't see",LF
	dc.b	"him duck in there.   ^",FF
	dc.b	"They know I go there",LF
	dc.b	"after close often.   ^",FF
	dc.b	"They shouldn't be",LF
	dc.b	"suspicious of me.",ETX

DialogTextDay06EnterVB:
	;		"1234567890123456789012"
	dc.b	"Entering will advance",LF
	dc.b	"time to the night.   ^",FF
	dc.b	"Are you ready?",LF
	dc.b	"                     ^",FF
	dc.b	"{Yeah, let's do it",LF
	dc.b	"{Maybe later",ETX

	align 2
DialogTextDay06EnterVBLater:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"(I can waste a little",LF
	dc.b	"more time in the mall)",ETX

	align 2
DialogTextDay06Sub00Start00:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"I'm here to apply for",LF
	dc.b	"a job.               ^",FF
	dc.b	"I can start",LF
	dc.b	"immediately.",ETX

	align 2
DialogTextDay06Sub00Start01:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Wow that's great!",LF
	dc.b	"No one applies here. ^",FF
	dc.b	"I don't need help",LF
	dc.b	"tonight though.      ^",FF
	dc.b	"Our annual inventory",LF
	dc.b	"is next Tuesday.     ^",FF
	dc.b	"We need people who can",LF
	dc.b	"work it overnight.   ^",FF
	dc.b	"It's a temporary job",LF
	dc.b	"only if that's ok?",ETX

	align 2
DialogTextDay06Sub00Start02:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Bring it on.",ETX

	align 2
DialogTextDay06Sub00Start03:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Let's do the interview",LF
	dc.b	"now then.            ^",FF
	dc.b	"The most important",LF
	dc.b	"thing I look for is..^",FF
	dc.b	"Listening. You have to",LF
	dc.b	"be a good listener.  ^",FF
	dc.b	"Last year we hired",LF
	dc.b	"someone and..        ^",FFR
	dc.b	"[30 minutes later]",ETX

	align 2
DialogTextDay06Sub00Start04:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"(I feel asleep)",ETX

	align 2
DialogTextDay06Sub00Start05:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Did you hear all that?",ETX

	align 2
DialogTextDay06Sub00Start06:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Huh.",ETX

	align 2
DialogTextDay06Sub00Start07:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Were you listening to",LF
	dc.b	"me at all?           ^",FF
	dc.b	"If you can't listen,",LF
	dc.b	"you can't work here.",ETX

	align 2
DialogTextDay06Scene11SubInprogress:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"(I need something to",LF
	dc.b	"help me stay awake)",ETX

	align 2
DialogTextDay06Sub00GetItem00:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"So, the other night,",LF
	dc.b	"how'd you stay awake?",ETX

	align 2
DialogTextDay06Sub00GetItem01:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"Pure will power.",ETX

	align 2
DialogTextDay06Sub00GetItem02:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Really, that seems",LF
	dc.b	"tough.               ^",FF
	dc.b	"Just you alone all",LF
	dc.b	"night.               ^",FF
	dc.b	"Nothing but the sound",LF
	dc.b	"of the heating vents.^",FF
	dc.b	"You had to get sleepy,",LF
	dc.b	"just a little.",ETX

	align 2
DialogTextDay06Sub00GetItem03:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"OK, I had some help.",LF
	dc.b	"Hunter's Formula Max.^",FF
	dc.b	"It's a caffeine pill",LF
	dc.b	"Great for bear hunts.^",FF
	dc.b	"I'll give you a few if",LF
	dc.b	"you keep it quiet.",ETX

	align 2
DialogTextDay06Sub00GetItem04:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"It's a secret to",LF
	dc.b	"everybody.",ETX

	align 2
DialogTextDay06Sub00Complete00:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Are you ready to try",LF
	dc.b	"this again?",ETX

	align 2
DialogTextDay06Sub00Complete01:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Hold on one second...",LF
	dc.b	"Ok, let's do this.",ETX

	align 2
DialogTextDay06Sub00Complete02:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"So like I was saying,",LF
	dc.b	"they were always...  ^",FFR
	dc.b	"[30 minutes later]",ETX

	align 2
DialogTextDay06Sub00Complete03:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"..and that's why we",LF
	dc.b	"keep it in back now. ^",FF
	dc.b	"Do you understand why",LF
	dc.b	"listening is critical?",ETX

	align 2
DialogTextDay06Sub00Complete04:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Yes, absolutely.",LF
	dc.b	"                     ^",FF
	dc.b	"(Why am I sweating",LF
	dc.b	"so much?)",ETX

	align 2
DialogTextDay06Sub00Complete05:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"That's all I needed!",LF
	dc.b	"                     ^",FF
	dc.b	"Here's a key for",LF
	dc.b	"Tuesday night.       ^",FF
	dc.b	"Inventory starts at",LF
	dc.b	"1:00 AM sharp.",ETX

	align 2
DialogTextDay06Scene11SubComplete:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Remember, inventory",LF
	dc.b	"is Tuesday at 1:00 AM.",ETX

	align 2
DialogTextDay06Scene0DNPCDani:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"If you say one word",LF
	dc.b	"about this to anyone..",ETX

	align 2
DialogTextDay06Sub00Scene00NPC:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Something to help you",LF
	dc.b	"stay awake?          ^",FF
	dc.b	"What crazy things do",LF
	dc.b	"you have planned?",ETX

	align 2
DialogTextDay06Sub12Scene00NPC:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"What? That's a weird",LF
	dc.b	"thing to look for.   ^",FF
	dc.b	"You should take better",LF
	dc.b	"care of yourself.",ETX

	align 2
DialogTextDay06Sub0AScene00NPC:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"You need help staying",LF
	dc.b	"awake?               ^",FF
	dc.b	"We sold out of alarm",LF
	dc.b	"clocks yesterday.",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub00:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"If this doesn't work,",LF
	dc.b	"can I get a job here?^",FF
	dc.b	"I think I'd be pretty",LF
	dc.b	"good at it.",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Bad news.",LF
	dc.b	"                     ^",FF
	dc.b	"Someone told security",LF
	dc.b	"a prank was planned. ^",FF
	dc.b	"They added a guard",LF
	dc.b	"at the info desk.    ^",FF
	dc.b	"He gave me the stink",LF
	dc.b	"eye on my way over.  ^",FF
	dc.b	"That makes two guards",LF
	dc.b	"to deal with tonight.",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub02:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I have a plan though.",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You're our decoy.",LF
	dc.b	"Cause a distraction. ^",FF
	dc.b	"Somewhere away from",LF
	dc.b	"Santa's Workshop.",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub04:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"When the hallway guard",LF
	dc.b	"is distracted by you ^",FF
	dc.b	"2014 boy & me will run",LF
	dc.b	"to the workshop.",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub05:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"He can catch me, you",LF
	dc.b	"rush for the door.",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub06:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"You're willing to do",LF
	dc.b	"that for me?         ^",FF
	dc.b	"Even if you might get",LF
	dc.b	"banned from the mall?",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub07:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I'm moving at the end",LF
	dc.b	"of summer anyway.    ^",FF
	dc.b	"I have enough saved",LF
	dc.b	"already.             ^",FF
	dc.b	"D.B. will cover bail",LF
	dc.b	"if it goes real bad.",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub08:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"I'll cover what?",ETX

	align 2
DialogTextDay06ScriptedEventDayStartSub09:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Just get to being",LF
	dc.b	"distracting already.",ETX

	align 2
DialogTextDay06SleepingGuardTalk:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"(He's breathing but",LF
	dc.b	"not responding.)",ETX

	align 2
DialogTextDay06Hurry:
	;		"1234567890123456789012"
	dc.b	"(I have to hurry, no",LF
	dc.b	"time to explore.)",ETX

	align 2
DialogTextDay06CantGoBack:
	;		"1234567890123456789012"
	dc.b	"(I can't back out of",LF
	dc.b	"this now.)",ETX

	align 2
DialogTextDay06Backtrack:
	;		"1234567890123456789012"
	dc.b	"(I don't want to",LF
	dc.b	"backtrack later.)",ETX

	align 2
DialogTextDay06FootstepsNorth:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"(I heard footsteps",LF
	dc.b	"to the north.)",ETX

	align 2
DialogTextDay06GuardSomeoneHere:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Hey, is someone here!?",ETX

	align 2
DialogTextDay06CantGetCaught:
	;		"1234567890123456789012"
	dc.b	"(I can't get caught by",LF
	dc.b	"the info desk guard.)",ETX

	align 2
DialogTextDay06InMissionScriptedEvent0000:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"You're still here?",ETX	

	align 2
DialogTextDay06InMissionScriptedEvent0001:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"I can't do much to",LF
	dc.b	"help.                ^",FF	
	dc.b	"I can only offer a",LF
	dc.b	"safe place to..",ETX	

	align 2
DialogTextDay06InMissionScriptedEvent0002:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Just me, I'm still",LF
	dc.b	"counting the register.",ETX	

	align 2
DialogTextDay06InMissionScriptedEvent0003:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Alright, carry on.",FFR
	dc.b	"(You hear footsteps",LF
	dc.b	"walking away.)",ETX	

	align 2
DialogTextDay06Scene0ENPCInMission:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Hide out here as long",LF
	dc.b	"as you need to.",ETX

	align 2
DialogTextDay06ScriptedEventExitTLodge00:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Hey! What's all that",LF
	dc.b	"noise over there!?",ETX

	align 2
DialogTextDay06ExitEEHallSouth:
	;		"1234567890123456789012"
	dc.b	"(If he sees me there",LF
	dc.b	"I'm busted for sure.)",ETX

	align 2
DialogTextDay06ScriptedEventEndMissionGood00:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"(I think I hear the",LF
	dc.b	"guard approaching.)  ^",FF
	dc.b	"(Sounds like he's",LF
	dc.b	"walking south now.)",ETX

	align 2
DialogTextDay06ScriptedEventEndMissionGood01:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Hey! What's going on",LF
	dc.b	"in there?!",ETX

	align 2
DialogTextDay06ScriptedEventEndMissionGood02:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"(I think I'm safe in",LF
	dc.b	"here for a while.)",ETX

	align 2
DialogTextDay06ScriptedEventEndMissionGood03:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"`Sorry but we're sold",LF
	dc.b	"out of Chrono Trigger^",FF
	dc.b	"try again next week,",LF
	dc.b	"yeah Earthbound too.'",ETX

	align 2
DialogTextDay06ScriptedEventEndMissionGood04:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Hey, knock it off.",LF
	dc.b	"                     ^",FF
	dc.b	"Did you hear all that",LF
	dc.b	"shouting?            ^",FF
	dc.b	"I think we're good",LF
	dc.b	"to go.               ^",FF
	dc.b	"I'll lead the way.",LF
	dc.b	"We need to hurry.",ETX

	align 2
DialogTextDay06ScriptedEventEndMissionBad00:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"What are you doing",LF
	dc.b	"here?!",ETX

	align 2
DialogTextDay06ScriptedEventEndMissionBad01:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Yeah, about that..",ETX

	align 2
DialogTextDay06ScriptedEventEndMissionBad02:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"`So if you preorder",LF
	dc.b	"then you also get..'",ETX

	align 2
DialogTextDay06ScriptedEventEndMissionBad03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Shh. I think I heard",LF
	dc.b	"a commotion outside. ^",FF
	dc.b	"Like someone running",LF
	dc.b	"toward the exit.     ^",FF
	dc.b	"C'mon, quit messing",LF
	dc.b	"around and follow me.",ETX

	align 2
DialogTextDay06Scene03Dani:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"He was like this when",LF
	dc.b	"I got here, I swear. ^",FF
	dc.b	"He's out cold.",ETX

	align 2
DialogTextDay06ScriptedEventEnding000:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"Where are you off to",LF
	dc.b	"in such a hurry?",ETX

	align 2
DialogTextDay06ScriptedEventEnding001:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"What's going on?",LF
	dc.b	"                     ^",FF
	dc.b	"Did you do this to",LF
	dc.b	"the guard?",ETX

	align 2
DialogTextDay06ScriptedEventEnding002:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"He'll be fine, just",LF
	dc.b	"taking a little nap. ^",FF
	dc.b	"He won't remember a",LF
	dc.b	"thing when he wakes. ^",FF
	dc.b	"I'm sorry but this",LF
	dc.b	"mess is all my fault.^",FF
	dc.b	"I was so young when it",LF
	dc.b	"started.             ^",FF
	dc.b	"I'd only been out of",LF
	dc.b	"school a week.       ^",FF
	dc.b	"They hired me to ",LF
	dc.b	"program this new     ^",FF
	dc.b	"cutting edge mall ",LF
	dc.b	"management system.",ETX

	align 2
DialogTextDay06ScriptedEventEnding003:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"It's not unethical, it",LF
	dc.b	"is the latest craze. ^",FF
	dc.b	"It's called subliminal",LF
	dc.b	"messaging.           ^",FF
	dc.b	"You just need to wire",LF
	dc.b	"it into the music.",ETX

	align 2
DialogTextDay06ScriptedEventEnding004:
	dc.w	OBJ_NPC_CAVERN_STAFF_PAST
	;		"1234567890123456789012"
	dc.b	"Are you sure it's ok?",ETX

	align 2
DialogTextDay06ScriptedEventEnding005:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"Everyone else is doing",LF
	dc.b	"it.                  ^",FF
	dc.b	"It doesn't force you",LF
	dc.b	"to do anything.      ^",FF
	dc.b	"It's more like a",LF
	dc.b	"suggestion.          ^",FF
	dc.b	"You like working here",LF
	dc.b	"right?",ETX

	align 2
DialogTextDay06ScriptedEventEnding006:
	dc.w	OBJ_NPC_CAVERN_STAFF_PAST
	;		"1234567890123456789012"
	dc.b	"Yeah, ok, I'll do it.",ETX

	align 2
DialogTextDay06ScriptedEventEnding007:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"We're losing too much",LF
	dc.b	"business.            ^",FF
	dc.b	"Everyone is going to",LF
	dc.b	"these super stores.  ^",FF
	dc.b	"We have to do more.",LF
	dc.b	"                     ^",FF
	dc.b	"Is it integrated with",LF
	dc.b	"all the monitors yet?",ETX

	align 2
DialogTextDay06ScriptedEventEnding008:
	dc.w	OBJ_NPC_CAVERN_STAFF_PAST
	;		"1234567890123456789012"
	dc.b	"It's close, but it may",LF
	dc.b	"cause some problems.",ETX

	align 2
DialogTextDay06ScriptedEventEnding009:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"Don't tell me about",LF
	dc.b	"problems.",ETX

	align 2
DialogTextDay06ScriptedEventEnding00A:
	dc.w	OBJ_NPC_CAVERN_STAFF_PAST
	;		"1234567890123456789012"
	dc.b	"But these are serious,",LF
	dc.b	"the images, they.. ",ETX

	align 2
DialogTextDay06ScriptedEventEnding00B:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"They're subconscious, ",LF
	dc.b	"completely harmless. ^",FF
	dc.b	"It's just some screens",LF
	dc.b	"with videos and info.^",FF
	dc.b	"What harm will 1 frame",LF
	dc.b	"out of 60 do?",ETX

	align 2
DialogTextDay06ScriptedEventEnding00C:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"Mall traffic is down",LF
	dc.b	"again.               ^",FF
	dc.b	"We have to turn on the",LF
	dc.b	"Nostalgia Engine.",ETX

	align 2
DialogTextDay06ScriptedEventEnding00D:
	dc.w	OBJ_NPC_CAVERN_STAFF_PAST
	;		"1234567890123456789012"
	dc.b	"It's not ready yet.",LF
	dc.b	"                     ^",FF
	dc.b	"We don't know all the",LF
	dc.b	"side-effects.",ETX

	align 2
DialogTextDay06ScriptedEventEnding00E:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"The effects are all",LF
	dc.b	"temporary.           ^",FF
	dc.b	"They're just waves",LF
	dc.b	"that make you happy. ^",FF
	dc.b	"Happy people buy more.",LF
	dc.b	"It's a fact.         ^",FF
	dc.b	"So what if they think",LF
	dc.b	"it's the 1980s again?^",FF
	dc.b	"They're happy &",LF
	dc.b	"spending money.",ETX

	align 2
DialogTextDay06ScriptedEventEnding00F:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"We don't have much",LF
	dc.b	"time left!           ^",FF
	dc.b	"You have to make it",LF
	dc.b	"work!                ^",FF
	dc.b	"This will be the thing",LF
	dc.b	"that saves the mall. ^",FF
	dc.b	"Imagine how beautiful",LF
	dc.b	"it will be.          ^",FF
	dc.b	"A mall that's exactly",LF
	dc.b	"how you remember it. ^",FF
	dc.b	"But it's not just a",LF
	dc.b	"memory, you're there.",ETX

	align 2
DialogTextDay06ScriptedEventEnding010:
	dc.w	OBJ_NPC_CAVERN_STAFF_PAST
	;		"1234567890123456789012"
	dc.b	"I'm close but..",ETX

	align 2
DialogTextDay06ScriptedEventEnding011:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"I don't want to hear",LF
	dc.b	"about `but'.",ETX

	align 2
DialogTextDay06ScriptedEventEnding012:
	dc.w	OBJ_NPC_CAVERN_STAFF_PAST
	;		"1234567890123456789012"
	dc.b	"I don't know if they",LF
	dc.b	"can leave.           ^",FF
	dc.b	"Who will test this?",ETX

	align 2
DialogTextDay06ScriptedEventEnding013:
	dc.w	OBJ_NPC_MALLMANAGER_PAST
	;		"1234567890123456789012"
	dc.b	"Why are you always so",LF
	dc.b	"difficult?           ^",FF
	dc.b	"It's not like we're",LF
	dc.b	"forcing them to.     ^",FF
	dc.b	"The sensors have to ",LF
	dc.b	"read their desire.   ^",FF
	dc.b	"They have to really",LF
	dc.b	"want to go back.     ^",FF
	dc.b	"I'll test it, nothing",LF
	dc.b	"bad will happen.",ETX

	align 2
DialogTextDay06ScriptedEventEnding014:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"The mall was bulldozed",LF
	dc.b	"in 2016.             ^",FF
	dc.b	"Replaced by a hipster",LF
	dc.b	"outdoor market.      ^",FF
	dc.b	"Vegan restaurants.",LF
	dc.b	"                     ^",FF
	dc.b	"Overpriced beer made",LF
	dc.b	"in someone's garage. ^",FF
	dc.b	"Miniature dogs in",LF
	dc.b	"baby strollers.      ^",FF
	dc.b	"That's what put me",LF
	dc.b	"out of work.         ^",FF
	dc.b	"Almost 40 years of",LF
	dc.b	"work lost to them.   ^",FF
	dc.b	"So I came back too.",LF
	dc.b	"                     ^",FF
	dc.b	"I never took a day off",LF
	dc.b	"in 40 years.         ^",FF
	dc.b	"I never did anything",LF
	dc.b	"just for fun.        ^",FF
	dc.b	"So I came back to run",LF
	dc.b	"the arcade.          ^",FF
	dc.b	"I wanted to be",LF
	dc.b	"somewhere fun once.  ^",FF
	dc.b	"I know it will close",LF
	dc.b	"in 7-8 years.        ^",FF
	dc.b	"Hopefully I'll be",LF
	dc.b	"dead by then.",ETX

	align 2
DialogTextDay06ScriptedEventEnding015:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"What happened to the",LF
	dc.b	"mall manager?",ETX

	align 2
DialogTextDay06ScriptedEventEnding016:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"I think I know now.",LF
	dc.b	"                     ^",FF
	dc.b	"The system is getting",LF
	dc.b	"stronger over time.  ^",FF
	dc.b	"People are coming from",LF
	dc.b	"before 2014.         ^",FF
	dc.b	"That means it was",LF
	dc.b	"finished sooner.     ^",FF
	dc.b	"The first time I was",LF
	dc.b	"in 1989              ^",FF
	dc.b	"there weren't people",LF
	dc.b	"like beardy here.    ^",FF
	dc.b	"I tried to burn it all",LF
	dc.b	"down; it didn't work.^",FF
	dc.b	"The technology is",LF
	dc.b	"advancing too fast.  ^",FF
	dc.b	"He must be here then,",LF
	dc.b	"working on the system.",ETX

	align 2
DialogTextDay06ScriptedEventEnding017:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You said `people'..",LF
	dc.b	"Are there others?",ETX

	align 2
DialogTextDay06ScriptedEventEnding018:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"Too many already.",LF
	dc.b	"                     ^",FF
	dc.b	"There will be more if",LF
	dc.b	"I can't stop it.     ^",FF
	dc.b	"It's funny isn't it?",LF
	dc.b	"                     ^",FF
	dc.b	"The same people who",LF
	dc.b	"destroyed this mall  ^",FF
	dc.b	"want to come back to",LF
	dc.b	"it again.            ^",FF
	dc.b	"I won't let them ruin",LF
	dc.b	"my life twice.",ETX

	align 2
DialogTextDay06ScriptedEventEnding019:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Can I get home the way",LF
	dc.b	"I entered?",ETX

	align 2
DialogTextDay06ScriptedEventEnding01A:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"Oh you'd like that.",LF
	dc.b	"                     ^",FF
	dc.b	"Go back & tell all",LF
	dc.b	"your manbun friends. ^",FF
	dc.b	"`Hey bros, check out",LF
	dc.b	"this neat lifehack!' ^",FF
	dc.b	"The mall will be",LF
	dc.b	"crawling with them.  ^",FF
	dc.b	"I'm not letting that",LF
	dc.b	"happen.",ETX

	align 2
DialogTextDay06ScriptedEventEnding01B:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"No, go back. Tell",LF
	dc.b	"everyone about it.   ^",FF
	dc.b	"The mall will make",LF
	dc.b	"billions!",ETX

	align 2
DialogTextDay06ScriptedEventEnding01C:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"That's all this has",LF
	dc.b	"been about for you.  ^",FF
	dc.b	"Manipulating people",LF
	dc.b	"just to get rich.",ETX

	align 2
DialogTextDay06ScriptedEventEnding01D:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"At least I have a",LF
	dc.b	"plan.                ^",FF
	dc.b	"You go along with",LF
	dc.b	"whatever you're told.",ETX

	align 2
DialogTextDay06ScriptedEventEnding01E:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I don't know who to",LF
	dc.b	"cheer for.           ^",FF
	dc.b	"They're both pretty",LF
	dc.b	"awful.",ETX

	align 2
DialogTextDay06ScriptedEventEnding01F:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Looks like they'll be",LF
	dc.b	"at it for a while.  ^",FF
	dc.b	"You should go while",LF
	dc.b	"they're distracted.",ETX

	align 2
DialogTextDay06ScriptedEventEnding020:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Yeah, this has been",LF
	dc.b	"good times & all that^",FF
	dc.b	"but I need to get back",LF
	dc.b	"to my life.",ETX

	align 2
DialogTextDay06ScriptedEventEnding021:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"You can assure him I",LF
	dc.b	"won't tell anyone.   ^",FF
	dc.b	"Best to leave this on",LF
	dc.b	"the downlow.         ^",FF
	dc.b	"Thanks for all your ",LF
	dc.b	"help.                ^",FF
	dc.b	"I'll really miss all",LF
	dc.b	"of you.              ^",FF
	dc.b	"Don't try to find me",LF
	dc.b	"before November 2014.^",FF
	dc.b	"Who knows what will",LF
	dc.b	"happen.              ^",FF
	dc.b	"How about I invite you",LF
	dc.b	"to my wedding?       ^",FF
	dc.b	"We'll catch-up then.",LF
	dc.b	"                     ^",FF
	dc.b	"That shouldn't mess",LF
	dc.b	"with timelines.      ^",FF
	dc.b	"It'll be a longer wait",LF
	dc.b	"for you than me.",ETX

	align 2
DialogTextDay06ScriptedEventEnding022:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"On the downlow?",ETX

	align 2
DialogTextDay06ScriptedEventEnding100:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Here goes nothing...",ETX

	align 2
DialogTextDay06ScriptedEventEnding101:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"It's been over an hour",LF
	dc.b	"now.",ETX

	align 2
DialogTextDay06ScriptedEventEnding102:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"I saw security drag",LF
	dc.b	"that arcade guy out. ^",FF
	dc.b	"I wonder what he'll",LF
	dc.b	"do now?",ETX

	align 2
DialogTextDay06ScriptedEventEnding103:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Not my problem.",LF
	dc.b	"                     ^",FF
	dc.b	"If he's smart, he'll",LF
	dc.b	"stay away.",ETX

	align 2
DialogTextDay06ScriptedEventEnding104:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"What was he up to",LF
	dc.b	"anyway?",ETX

	align 2
DialogTextDay06ScriptedEventEnding105:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Some crazy story about",LF
	dc.b	"his younger self.    ^",FF
	dc.b	"People traveling back",LF
	dc.b	"in time to shop here.^",FF
	dc.b	"Or maybe not that,",LF
	dc.b	"maybe.. I don't know.^",FF
	dc.b	"We'll talk about it",LF
	dc.b	"on the drive home.   ^",FF
	dc.b	"I guess it really",LF
	dc.b	"doesn't matter.      ^",FF
	dc.b	"This is all getting",LF
	dc.b	"demolished one day.  ^",FF
	dc.b	"If there are others",LF
	dc.b	"we won't meet them.  ^",FF
	dc.b	"I'm sure they bought",LF
	dc.b	"stocks & retired.",ETX

	align 2
DialogTextDay06ScriptedEventEnding106:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Why would they want",LF
	dc.b	"to hang out here?",ETX

	align 2
DialogTextDay06ScriptedEventEnding107:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Exactly.",LF
	dc.b	"                     ^",FF
	dc.b	"Let's get home before",LF
	dc.b	"our parents wake up.",ETX

	align 2
DialogTextDay06Scene0ENPCEnding:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Go on, I'll lock up",LF
	dc.b	"after you leave.",ETX

	align 2
DialogTextMallManagerDay06:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"It seems like you",LF
	dc.b	"are always on break. ^",FF
	dc.b	"I hope you're not",LF
	dc.b	"causing any trouble. ^",FF
	dc.b	"Maintaining the image",LF
	dc.b	"of Bayhurst Mall     ^",FF
	dc.b	"is my number one",LF
	dc.b	"priority.",ETX

	align 2
DialogTextDay06PDawgCustomer00:
	dc.w	OBJ_NPC_MALE_SHOPPER1
	;		"1234567890123456789012"
	dc.b	"It's my turn to host",LF
	dc.b	"movie night,         ^",FF
	dc.b	"but my friends always",LF
	dc.b	"stay too late.       ^",FF
	dc.b	"I don't want to be",LF
	dc.b	"rude & kick them out,^",FF
	dc.b	"but I need to get some",LF
	dc.b	"sleep before work.",ETX

	align 2
DialogTextDay06PDawgCustomer01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Try serving them",LF
	dc.b	"some Pogo Dawg.      ^",FF
	dc.b	"They'll be rushing",LF
	dc.b	"home in no time.     ^",FF
	dc.b	"They also might lose",LF
	dc.b	"a few pounds.",ETX

	align 2
DialogTextDay06PDawgCustomer02:
	dc.w	OBJ_NPC_MALE_SHOPPER1
	;		"1234567890123456789012"
	dc.b	"You're pretty smart.",LF
	dc.b	"I like that idea.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 07
;-------------------------------------------------------------------------------

	align 2
DialogTextDay07PDawgClosed:
	;		"1234567890123456789012"
	dc.b	"There's a sign that",LF
	dc.b	"says they're closed.",ETX

	align 2
DialogTextDay07CavernClosed:
	;		"1234567890123456789012"
	dc.b	"It's been locked-up",LF
	dc.b	"since Xmas Eve.      ^",FF
	dc.b	"Maybe someone has a",LF
	dc.b	"key?",ETX

	align 2
DialogTextDay07ExitScene0F:
	;		"1234567890123456789012"
	dc.b	"(Wasn't there some",LF
	dc.b	"reason I came here?)",ETX

	align 2
DialogTextDay07Scene0FGetKey0:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey. Yeah. So I guess",LF
	dc.b	"we're, uh, open.     ^",FF
	dc.b	"Uh, here. Have one of",LF
	dc.b	"these, what is it?   ^",FF
	dc.b	"Huh. What are you",LF
	dc.b	"doing here?          ^",FF
	dc.b	"Oh right, a key.",LF
	dc.b	"I remember now.      ^",FF
	dc.b	"In case you want to,",LF
	dc.b	"like, cook something.",ETX

	align 2
DialogTextDay07EnterDCountryLater:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"(I'll clock in later)",ETX

	align 2
DialogTextDay07Scene0FGetKey1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"That's totally a thing",LF
	dc.b	"I planned to do.",ETX

	align 2
DialogTextDay07EnterDCountry:
	;		"1234567890123456789012"
	dc.b	"Returning to work will",LF
	dc.b	"advance the story.   ^",FF
	dc.b	"Are you ready?",LF
	dc.b	"                     ^",FF
	dc.b	"{Yeah, that's cool",LF
	dc.b	"{Maybe later",ETX

	align 2
DialogTextScene00Day07NPC00:
	dc.w	OBJ_NPC_BILLY
	;		"1234567890123456789012"
	dc.b	"Are you going to kick",LF
	dc.b	"me out again?",ETX

	align 2
DialogTextScene00Day07NPC01:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"If I set the jumpers",LF
	dc.b	"on my hard drive to  ^",FF
	dc.b	"non-translation mode",LF
	dc.b	"do I also need to set^",FF
	dc.b	"the interleave factor",LF
	dc.b	"to 6 or leave it at 1?",ETX

	align 2
DialogTextDay07ExitVB:
	;		"1234567890123456789012"
	dc.b	"(I better make sure",LF
	dc.b	"it's ok to leave)",ETX

	align 2
DialogTextScene00Day07NPCGreenberg00:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Go ahead and take your",LF
	dc.b	"break now.           ^",FF
	dc.b	"You seem a little off",LF
	dc.b	"today.               ^",FF
	dc.b	"I hope everything is",LF
	dc.b	"alright.",ETX

	align 2
DialogTextScene00Day07NPCGreenberg01:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Oh by the way...",LF
	dc.b	"                     ^",FF
	dc.b	"Al the mall manager",LF
	dc.b	"asked me about you.  ^",FF
	dc.b	"He seemed really",LF
	dc.b	"irritated.           ^",FF
	dc.b	"What did you do to",LF
	dc.b	"set him off?",ETX

	align 2
DialogTextScene08Day07ScriptedEvent00:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You're off early.",LF
	dc.b	"Did you get fired?",ETX

	align 2
DialogTextScene08Day07ScriptedEvent01:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Nah, I just had to",LF
	dc.b	"get out.             ^",FF
	dc.b	"It's like every day",LF
	dc.b	"there is the same.   ^",FF
	dc.b	"I needed a break.",ETX

	align 2
DialogTextScene08Day07ScriptedEvent02:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"That's how it is here.",LF
	dc.b	"                     ^",FF
	dc.b	"Last week was the most",LF
	dc.b	"excitement we'll get.^",FF
	dc.b	"Stick it out a couple",LF
	dc.b	"years, you'll live.  ^",FF
	dc.b	"I might as well head",LF
	dc.b	"out early too.       ^",FF
	dc.b	"I think I'll grab a",LF
	dc.b	"snack on my way out.",ETX

	align 2
DialogTextScene08Day07DenimCountryStaffTalk:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"I hope we stay open",LF
	dc.b	"another year.",ETX

	align 2
DialogTextScene08Day07DenimCountryStaffTalkEvent0:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Did she just leave",LF
	dc.b	"without telling me?",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent00:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"So he really",LF
	dc.b	"confronted you?",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yeah, he came into my",LF
	dc.b	"store and everything.",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent02:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"I know what you think",LF
	dc.b	"you heard that night.^",FF
	dc.b	"I was all ramblings of",LF
	dc.b	"a sick mind.         ^",FF
	dc.b	"Both him & your friend",LF
	dc.b	"are delusional.",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"It sure seemed like",LF
	dc.b	"you believed them.",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent04:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"No, now that's just",LF
	dc.b	"crazy talk.          ^",FF
	dc.b	"I was stalling until",LF
	dc.b	"security arrived.    ^",FF
	dc.b	"You don't really",LF
	dc.b	"think they...        ^",FF
	dc.b	"Hmph, no one would",LF
	dc.b	"believe you anyway.  ^",FF
	dc.b	"They're both banned",LF
	dc.b	"from the mall now.   ^",FF
	dc.b	"You'll be next if you",LF
	dc.b	"cause trouble.",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent05:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Please, anything but",LF
	dc.b	"that.",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent06:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"What do you think",LF
	dc.b	"about what he said?",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent07:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I don't know.",LF
	dc.b	"                     ^",FF
	dc.b	"I think Jordan was",LF
	dc.b	"telling the truth.   ^",FF
	dc.b	"Or maybe he only",LF
	dc.b	"thought he was.      ^",FF
	dc.b	"If he was imagining it",LF
	dc.b	"all then what are we?^",FF
	dc.b	"Like are we part of an",LF
	dc.b	"80s illusion or real?",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent08:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"I don't think he was",LF
	dc.b	"delusional.          ^",FF
	dc.b	"I'm confident we're in",LF
	dc.b	"the 1980s.",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent09:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yeah...",LF
	dc.b	"                     ^",FF
	dc.b	"Not for much longer",LF
	dc.b	"though, right.       ^",FF
	dc.b	"It's just a few hours",LF
	dc.b	"until the 90s.       ^",FF
	dc.b	"At least they can't be",LF
	dc.b	"worse than the 80s.",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent0A:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Do you have plans for",LF
	dc.b	"tonight?",ETX


	align 2
DialogTextScene0EDay07ScriptedEvent0B:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Not really.",LF
	dc.b	"                     ^",FF
	dc.b	"I got an invite to",LF
	dc.b	"Todd's party.        ^",FF
	dc.b	"I might drag D.B.",LF
	dc.b	"along as my guest.",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent0C:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Todd's party?",LF
	dc.b	"                     ^",FF
	dc.b	"He's kind of a tool.",ETX

	align 2
DialogTextScene0EDay07ScriptedEvent0D:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I can't imagine his",LF
	dc.b	"friends are better.  ^",FF
	dc.b	"It's the last day of",LF
	dc.b	"the 1980s.           ^",FF
	dc.b	"I'm not spending it",LF
	dc.b	"with our parents.    ^",FF
	dc.b	"So that's what we're",LF
	dc.b	"doing I guess.       ^",FF
	dc.b	"Unless you have",LF
	dc.b	"another idea..",ETX

	align 2
DialogTextScene0EDay07MoreTime:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"So what are we doing?",LF
	dc.b	"                     ^",FF
	dc.b	"Todd's party or do you",LF
	dc.b	"have a better idea?  ^",FFR
	dc.b	"{Todd's party I guess",LF
	dc.b	"{Give me more time",ETX

	align 2
DialogTextScene0EDay07BetterPlan:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You've had plenty of",LF
	dc.b	"time to think now,   ^",FF
	dc.b	"Todd's party or do you",LF
	dc.b	"have a better idea?  ^",FFR
	dc.b	"{Todd's party I guess",LF
	dc.b	"{I have a better idea",ETX

	align 2
DialogTextScene0EDay07NShackStaffTalk
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"I have a feeling the",LF
	dc.b	"90s will be great.",ETX

	align 2
DialogTextScene0EDay07Respond0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Fine, if you insist.",ETX

	align 2
DialogTextScene0EDay07Respond1MoreTime:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Don't keep me waiting",LF
	dc.b	"until next year.",ETX

	align 2
DialogTextScene0EDay07RespondGood:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"I have an idea,",LF
	dc.b	"follow me.",ETX

	align 2
DialogTextGoodEnding00:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"We'd have the place to",LF
	dc.b	"ourselves.           ^",FF
	dc.b	"Everything is on free",LF
	dc.b	"play too.            ^",FF
	dc.b	"Anyone else without",LF
	dc.b	"plans is welcome too.",ETX

	align 2
DialogTextGoodEnding01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Hmm, you know what?",LF
	dc.b	"This isn't half-bad.",ETX

	align 2
DialogTextGoodEnding02:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, nice setup here.",LF
	dc.b	"                     ^",FF
	dc.b	"I assume you have room",LF
	dc.b	"for an old friend.",ETX

	align 2
DialogTextGoodEnding03:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"This beats what I had",LF
	dc.b	"planned, thanks.",ETX

	align 2
DialogTextGoodEnding04:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I thought I saw you",LF
	dc.b	"headed this way.     ^",FF
	dc.b	"What a fun idea!",ETX

	align 2
DialogTextDay07CavernUse:
	;		"1234567890123456789012"
	dc.b	"Maybe these other keys",LF
	dc.b	"are for the games..",FF
	dc.b	"Yeah, it's in free",LF
	dc.b	"play mode now.",ETX

DialogTextDay07TQTent0:
	;		"1234567890123456789012"
	dc.b	"(He really was living",LF
	dc.b	"in here, it's a mess.^",FF
	dc.b	"Maybe there's",LF
	dc.b	"something good left.)^",FF
	dc.b	"[Found wood comb]",LF
	dc.b	"                     ^",FF
	dc.b	"(I wonder if anyone",LF
	dc.b	"could use this?)",ETX

DialogTextDay07TQTent1:
	;		"1234567890123456789012"
	dc.b	"There's nothing else",LF
	dc.b	"worth taking.",ETX

	align 2
DialogTextDay07TQCheckers:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, this is pretty",LF
	dc.b	"nice, thanks.        ^",FF
	dc.b	"I bet it will help me",LF
	dc.b	"get my hair perfect. ^",FF
	dc.b	"After Xmas we get rid",LF
	dc.b	"of our excess stock. ^",FF
	dc.b	"Just like all the",LF
	dc.b	"stores do around now.^",FF
	dc.b	"This went out of style",LF
	dc.b	"but could come back. ^",FF
	dc.b	"It will at least keep",LF
	dc.b	"you warm.            ^",FFR
	dc.b	"[Received black",LF
	dc.b	"leather jacket]",ETX

	align 2
DialogTextDay07TQCPlanet:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"This is perfect for",LF
	dc.b	"Rocky Horror night.  ^",FF
	dc.b	"I didn't think you",LF
	dc.b	"were so cool.        ^",FF
	dc.b	"If you really want to",LF
	dc.b	"be edgy though,      ^",FF
	dc.b	"then you need to get",LF
	dc.b	"a nose hoop.         ^",FF
	dc.b	"Here, take a couple.",LF
	dc.b	"                     ^",FF
	dc.b	"I know a guy who will",LF
	dc.b	"pierce you for free. ^",FFR
	dc.b	"[Received nose hoops]",ETX

	align 2
DialogTextDay07TQFCBFishing:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"What are these? Some",LF
	dc.b	"kind of new hook?    ^",FF
	dc.b	"I'll give them a try.",LF
	dc.b	"Thanks for sharing.  ^",FF
	dc.b	"I didn't think you",LF
	dc.b	"were into fishing.   ^",FF
	dc.b	"Ice fishing season is",LF
	dc.b	"about to start.      ^",FF
	dc.b	"Here's a fish decoy",LF
	dc.b	"that works great.    ^",FFR
	dc.b	"[Received decoy fish]",ETX

	align 2
DialogTextDay07TQCNow:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Is this a necklace?",LF
	dc.b	"                     ^",FF
	dc.b	"It looks just like the",LF
	dc.b	"fish on my car!      ^",FF
	dc.b	"Sorry but we only have",LF
	dc.b	"women's clothing.    ^",FF
	dc.b	"You can give this to",LF
	dc.b	"someone special.     ^",FF
	dc.b	"It's too wild for our",LF
	dc.b	"store.               ^",FFR
	dc.b	"[Received neon dress]",ETX

	align 2
DialogTextDay07TQFCBFirearms:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"I could make some",LF
	dc.b	"great camo from this.^",FF
	dc.b	"Here's something for",LF
	dc.b	"you in exchange.     ^",FF
	dc.b	"We're not allowed to",LF
	dc.b	"sell it anymore.     ^",FFR
	dc.b	"[Received landmine]",ETX

	align 2
DialogTextDay07TQTBooks:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"Why are you walking",LF
	dc.b	"around with that?!   ^",FF
	dc.b	"I thought I knew you",LF
	dc.b	"better.              ^",FF
	dc.b	"Give it to me & I'll",LF
	dc.b	"dispose of it.       ^",FF
	dc.b	"You need to get",LF
	dc.b	"yourself in order.   ^",FF
	dc.b	"Take these",LF
	dc.b	"motivational books.  ^",FF
	dc.b	"Maybe you can find a",LF
	dc.b	"better direction.    ^",FF
	dc.b	"We can't sell them.",LF
	dc.b	"No one that shops at ^",FF
	dc.b	"this mall wants to",LF
	dc.b	"improve themselves.  ^",FFR
	dc.b	"[Received",LF
	dc.b	"motivational books]",ETX

	align 2
DialogTextDay07TQTLodge:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"Yeah, I need to work",LF
	dc.b	"on my selling skills.^",FF
	dc.b	"Let me trade for this",LF
	dc.b	"graphing calculator. ^",FF
	dc.b	"It's an older model so",LF
	dc.b	"no extended warranty.^",FFR
	dc.b	"[Received graphing",LF
	dc.b	"calculator]",ETX

	align 2
DialogTextDay07TQSVideo:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"This will be so much",LF
	dc.b	"help in class.       ^",FF
	dc.b	"This is too nice of",LF
	dc.b	"you.                 ^",FF
	dc.b	"All I have are these",LF
	dc.b	"old Betamax tapes.   ^",FF
	dc.b	"Maybe you still have",LF
	dc.b	"a player around.     ^",FF
	dc.b	"[Received Betamax",LF
	dc.b	"tapes]",ETX

	align 2
DialogTextDay07TQSCenter:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Yeah I can use these",LF
	dc.b	"when I babysit.      ^",FF
	dc.b	"Sorry I don't have",LF
	dc.b	"anything good.       ^",FF
	dc.b	"We close for the",LF
	dc.b	"season tonight,      ^",FF
	dc.b	"but you can take",LF
	dc.b	"whatever you want.   ^",FF
	dc.b	"The Xmas sausage might",LF
	dc.b	"be a little grungy.  ^",FF
	dc.b	"If you fry it enough",LF
	dc.b	"I'm sure it's fine.  ^",FFR
	dc.b	"[Received rancid meat]",ETX

	align 2
DialogTextDay07TQPDawg:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Uh, are you the new,",LF
	dc.b	"yeah, delivery dude? ^",FF
	dc.b	"You're, what's it",LF
	dc.b	"called, late.        ^",FF
	dc.b	"Here's the daily lunch",LF
	dc.b	"delivery for...      ^",FF
	dc.b	"Hey, when did you get",LF
	dc.b	"here?                ^",FF
	dc.b	"Right, uh, dude, the",LF
	dc.b	"lunch delivery for...^",FF
	dc.b	"That one who can't",LF
	dc.b	"leave their, um, job.^",FFR
	dc.b	"[Received lunch",LF
	dc.b	"delivery]",ETX

	align 2
DialogTextDay07TQPDawgStuck:
	;		"1234567890123456789012"
	dc.b	"(No one else would",LF
	dc.b	"want this rancid meat^",FF
	dc.b	"but they're closed..",FF
	dc.b	"I'm stuck with it.)",ETX

	align 2
DialogTextDay07TQCenter:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks! There's never",LF
	dc.b	"a backup here.       ^",FF
	dc.b	"This is what I'm stuck",LF
	dc.b	"with every day.      ^",FF
	dc.b	"Since you're out",LF
	dc.b	"running errands,     ^",FF
	dc.b	"I found this on the",LF
	dc.b	"floor this morning.  ^",FF
	dc.b	"Please give it back to",LF
	dc.b	"the owner.           ^",FFR
	dc.b	"[Received Cavern keys]",ETX

	align 2
DialogTextDay07TQCavern:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"(It looks like he's",LF
	dc.b	"really gone.         ^",FF
	dc.b	"I could do whatever",LF
	dc.b	"I wanted to here.)",ETX

	align 2
DialogTextPerfectEnding00:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Hey, here you are.",ETX

	align 2
DialogTextPerfectEnding01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yeah, just saying bye",LF
	dc.b	"to people I'll miss. ^",FF
	dc.b	"I feel like we're part",LF
	dc.b	"of a secret club.",ETX

	align 2
DialogTextPerfectEnding02:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"No kidding.",LF
	dc.b	"                     ^",FF
	dc.b	"Are you moving to the",LF
	dc.b	"dorm tomorrow?",ETX

	align 2
DialogTextPerfectEnding03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"That's the plan.",LF
	dc.b	"                     ^",FF
	dc.b	"I sure won't miss",LF
	dc.b	"working Xmas retail. ^",FF
	dc.b	"Junior over here has",LF
	dc.b	"two more years of it.",ETX

	align 2
DialogTextPerfectEnding04:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"This will be my last",LF
	dc.b	"Xmas at this store.",ETX

	align 2
DialogTextPerfectEnding05:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I hope it's not so",LF
	dc.b	"weird for you again.",ETX

	align 2
DialogTextPerfectEnding06:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"I think it will be",LF
	dc.b	"quiet.               ^",FF
	dc.b	"I just have to get",LF
	dc.b	"through a few months.",ETX

	align 2
DialogTextPerfectEnding07:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Good luck. Maybe I'll",LF
	dc.b	"visit over Xmas break.",ETX

	align 2
DialogTextPerfectEnding08:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Speaking of Xmas, you",LF
	dc.b	"never found out who  ^",FF
	dc.b	"gave you those",LF
	dc.b	"necklaces.",ETX

	align 2
DialogTextPerfectEnding09:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"They're so strange.",LF
	dc.b	"I don't get them.",ETX

	align 2
DialogTextPerfectEnding0A:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"It's just an",LF
	dc.b	"Ouroboros charm.     ^",FF
	dc.b	"I thought everyone",LF
	dc.b	"knew what it was.    ^",FF
	dc.b	"It represents a cycle",LF
	dc.b	"of death & rebirth.  ^",FF
	dc.b	"Like how one day this",LF
	dc.b	"will all be gone.    ^",FF
	dc.b	"Then something new",LF
	dc.b	"will be born from it.^",FF
	dc.b	"That arcade guy",LF
	dc.b	"couldn't accept it.  ^",FF
	dc.b	"You see how it ended",LF
	dc.b	"for him.             ^",FF
	dc.b	"It's impossible to",LF
	dc.b	"fight the cycle.",ETX

	align 2
DialogTextPerfectEnding0B:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Oh, thanks then.",LF
	dc.b	"                     ^",FF
	dc.b	"I assume this was an",LF
	dc.b	"admission of guilt.",ETX

	align 2
DialogTextPerfectEnding0C:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Yes, guilty. It has",LF
	dc.b	"some meaning to me.  ^",FF
	dc.b	"I thought you might ",LF
	dc.b	"relate to it to.     ^",FF
	dc.b	"It seems to fit your",LF
	dc.b	"personality at least.",ETX

	align 2
DialogTextPerfectEnding0D:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"This is getting",LF
	dc.b	"deeper than I planned.",ETX

	align 2
DialogTextPerfectEnding0E:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Let's just call it our",LF
	dc.b	"club symbol then.",ETX

	align 2
DialogTextPerfectEnding0F:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I'm good with that.",LF
	dc.b	"See you later maybe.",ETX

	align 2
DialogTextPerfectEnding10:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Let's get out of here",LF
	dc.b	"before it's late.",ETX

;-------------------------------------------------------------------------------
; information desk
;-------------------------------------------------------------------------------

	align 2
DialogTextInfoDeskDay00R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Santa's Workshop",LF
	dc.b	"opened this morning. ^",FF
	dc.b	"It was already very",LF
	dc.b	"busy there today.",ETX

	align 2
DialogTextInfoDeskDay00R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"The mall opens at 6:00",LF
	dc.b	"AM on Black Friday!",ETX

	align 2
DialogTextInfoDeskDay00R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"We now have a Fish or",LF
	dc.b	"Cut Bait store.      ^",FF
	dc.b	"All their employees",LF
	dc.b	"dress as lumberjacks.",ETX

	align 2
DialogTextInfoDeskDay00R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I really shouldn't",LF
	dc.b	"tell you this but..  ^",FF
	dc.b	"One store isn't doing",LF
	dc.b	"well & might close.  ^",FF
	dc.b	"It might happen at the",LF
	dc.b	"end of the year.",ETX

	align 2
DialogTextInfoDeskDay01R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"It's secret shopper",LF
	dc.b	"season at the mall.  ^",FF
	dc.b	"Stores are being rated",LF
	dc.b	"by undercover experts.",ETX

	align 2
DialogTextInfoDeskDay01R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"We're organizing a",LF
	dc.b	"Secret Santa exchange^",FF
	dc.b	"open to all mall",LF
	dc.b	"employees.           ^",FF
	dc.b	"Sign-ups start soon,",LF
	dc.b	"please join us!",ETX

	align 2
DialogTextInfoDeskDay01R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Checkers is having an",LF
	dc.b	"out of fashion sale. ^",FF
	dc.b	"50% off anything",LF
	dc.b	"older than a week.   ^",FF
	dc.b	"They've been very busy",LF
	dc.b	"today because of it.",ETX

	align 2
DialogTextInfoDeskDay01R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I really shouldn't",LF
	dc.b	"tell you this but..  ^",FF
	dc.b	"The mall manager still",LF
	dc.b	"hasn't hired a new   ^",FF
	dc.b	"snowplow company since",LF
	dc.b	"the last one quit.",ETX

	align 2
DialogTextInfoDeskDay02R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"December weekend hours",LF
	dc.b	"start soon.          ^",FF
	dc.b	"All stores will stay",LF
	dc.b	"open until 10:00 PM.",ETX

	align 2
DialogTextInfoDeskDay02R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"The mall employee",LF
	dc.b	"Secret Santa exchange^",FF
	dc.b	"will be on 12/10.",LF
	dc.b	"Please don't forget  ^",FF
	dc.b	"to sign-up, you might",LF
	dc.b	"get something good.",ETX

	align 2
DialogTextInfoDeskDay02R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"The kiosk down the",LF
	dc.b	"hall was busy today. ^",FF
	dc.b	"They ran out of",LF
	dc.b	"several favorites.",ETX

	align 2
DialogTextInfoDeskDay02R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"You're friends with",LF
	dc.b	"Charles right?       ^",FF
	dc.b	"It's not my business",LF
	dc.b	"but he seems really  ^",FF
	dc.b	"upset every time I see",LF
	dc.b	"him. I hope he's OK.",ETX

	align 2
DialogTextInfoDeskDay03R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Santa's Workshop has ",LF
	dc.b	"been a big success.  ^",FF
	dc.b	"The mall manager is",LF
	dc.b	"already planning for ^",FF
	dc.b	"something even larger",LF
	dc.b	"next year!",ETX

	align 2
DialogTextInfoDeskDay03R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Only one week until ",LF
	dc.b	"our very first mall  ^",FF
	dc.b	"employee Secret Santa",LF
	dc.b	"exchange!",ETX

	align 2
DialogTextInfoDeskDay03R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Transistor Lodge is ",LF
	dc.b	"getting all kinds of ^",FF
	dc.b	"exciting new products",LF
	dc.b	"just in time for Xmas.",ETX

	align 2
DialogTextInfoDeskDay03R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I really shouldn't ",LF
	dc.b	"tell you this but...",FF
	dc.b	"The mall manager is",LF
	dc.b	"interviewing for more^",FF
	dc.b	"night guards due to",LF
	dc.b	"the recent thefts.",ETX

	align 2
DialogTextInfoDeskDay05R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"The mall plans to stay",LF
	dc.b	"open today despite   ^",FF
	dc.b	"the weather forecast.",ETX

	align 2
DialogTextInfoDeskDay05R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Santa's Workshop will ",LF
	dc.b	"be open all the way  ^",FF
	dc.b	"through Xmas Eve.",ETX

	align 2
DialogTextInfoDeskDay05R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"There's only one week",LF
	dc.b	"until Xmas so most   ^",FF
	dc.b	"stores are having",LF
	dc.b	"their best sales now.",ETX

	align 2
DialogTextInfoDeskDay05R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I really shouldn't",LF
	dc.b	"tell you this but..  ^",FF
	dc.b	"a few people told me",LF
	dc.b	"they plan to close   ^",FF
	dc.b	"early if there is a",LF
	dc.b	"blizzard today.",ETX

	align 2
DialogTextInfoDeskDay06R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"We'll be closed",LF
	dc.b	"tomorrow for Xmas.   ^",FF
	dc.b	"It's the only day that",LF
	dc.b	"the mall is closed.",ETX

	align 2
DialogTextInfoDeskDay06R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"It's the last shopping",LF
	dc.b	"day before Xmas!     ^",FF
	dc.b	"Also last chance to",LF
	dc.b	"visit Santa Claus.",ETX

	align 2
DialogTextInfoDeskDay06R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"A few stores could use",LF
	dc.b	"extra help today     ^",FF
	dc.b	"to cover all the last",LF
	dc.b	"minute shoppers.",ETX

	align 2
DialogTextInfoDeskDay06R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I really shouldn't",LF
	dc.b	"say anything but..   ^",FF
	dc.b	"The mall manager might",LF
	dc.b	"hire extra security  ^",FF
	dc.b	"because of all the odd",LF
	dc.b	"activity at night.",ETX

	align 2
DialogTextInfoDeskDay07R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"The mall will be ",LF
	dc.b	"closing early today.",ETX

	align 2
DialogTextInfoDeskDay07R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Sadly there aren't any",LF
	dc.b	"fun New Year events  ^",FF
	dc.b	"planned for the mall",LF
	dc.b	"this year.",ETX

	align 2
DialogTextInfoDeskDay07R2Bad:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Sorry but I only have",LF
	dc.b	"bad news today.      ^",FF
	dc.b	"Pogo Dawg had to close",LF
	dc.b	"due to poor sales.",ETX

	align 2
DialogTextInfoDeskDay07R2Good:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm glad you asked,",LF
	dc.b	"we have good news!   ^",FF
	dc.b	"Pogo Dawg decided to",LF
	dc.b	"renew their lease!",ETX

	align 2
DialogTextInfoDeskDay07R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I really shouldn't be",LF
	dc.b	"telling you but...   ^",FF
	dc.b	"There will be a new",LF
	dc.b	"store moving in soon.^",FF
	dc.b	"Wire Warehouse, they",LF
	dc.b	"sell electronics.",ETX

	align 2
DialogTextInfoDeskStrangeGift:	; secret santa gift
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Here's your Secret",LF
	dc.b	"Santa gift.          ^",FFR
	dc.b	"[Received Secret",LF
	dc.b	"Santa Gift]          ^",FF
	dc.b	"(What are these?)",LF
	dc.b	"                     ^",FF
	dc.b	"(They're matching",LF
	dc.b	"string necklaces with^",FF
	dc.b	"a charm of a snake",LF
	dc.b	"eating its own tail.)",ETX

;-------------------------------------------------------------------------------
; radio stations
;-------------------------------------------------------------------------------

	; radio shouldn't be reachable on day 00
;DialogTextRadioDay00R0:	; WNWT (news and weather)
;DialogTextRadioDay00R1:	; WOCX (talk radio)
;DialogTextRadioDay00R2:	; WCAS (top 40)
;DialogTextRadioDay00R3:	; WVVX (hair metal)

DialogTextRadioDay01R0:	; WNWT (news and weather)
	;		"1234567890123456789012"
	dc.b	"After traffic &",LF
	dc.b	"weather we'll check  ^",FF
	dc.b	"in on the collapse of",LF
	dc.b	"Eastern Europe.",ETX

DialogTextRadioDay01R1:	; WOCX (talk radio)
	;		"1234567890123456789012"
	dc.b	"Tonight on Sea to Sea",LF
	dc.b	"with Barty George:   ^",FF
	dc.b	"Is FEMA sending people",LF
	dc.b	"from the future back ^",FF
	dc.b	"to our time to vote",LF
	dc.b	"for Communists?",ETX

DialogTextRadioDay01R2:	; WCAS (top 40)
	;		"1234567890123456789012"
	dc.b	"Now for a block of",LF
	dc.b	"ballads by hair bands^",FF
	dc.b	"that we otherwise ",LF
	dc.b	"wouldn't ever play.",ETX

DialogTextRadioDay01R3:	; WVVX (hair metal)
	;		"1234567890123456789012"
	dc.b	"We're getting requests",LF
	dc.b	"for some Seattle band^",FF
	dc.b	"look people, we only",LF
	dc.b	"play metal here.",ETX

DialogTextRadioDay02R0:	; WNWT (news and weather)
	;		"1234567890123456789012"
	dc.b	"Time for traffic on",LF
	dc.b	"the Fibonacci Primes:^",FF
	dc.b	"and, wait, we also do",LF
	dc.b	"weather on the 3s.   ^",FF
	dc.b	"This new system is",LF
	dc.b	"a little confusing.",ETX

DialogTextRadioDay02R1:	; WOCX (talk radio)
	;		"1234567890123456789012"
	dc.b	"Tonight on Sea to Sea",LF
	dc.b	"with Barty George:   ^",FF
	dc.b	"We talk to a time",LF
	dc.b	"traveler from 2016.  ^",FF
	dc.b	"They describe life",LF
	dc.b	"under alien rule.",ETX

DialogTextRadioDay02R2:	; WCAS (top 40)
	;		"1234567890123456789012"
	dc.b	"Are you burned out on",LF
	dc.b	"Love Shack yet?      ^",FF
	dc.b	"We sure aren't so here",LF
	dc.b	"it is again.",ETX

DialogTextRadioDay02R3:	; WVVX (hair metal)
	;		"1234567890123456789012"
	dc.b	"If they play it on",LF
	dc.b	"the top 40 station   ^",FF
	dc.b	"or any other then you",LF
	dc.b	"won't hear it here.",ETX

DialogTextRadioDay03R0:	; WNWT (news and weather)
	;		"1234567890123456789012"
	dc.b	"Trying a new system",LF
	dc.b	"which has traffic on ^",FF
	dc.b	"composite numbers &",LF
	dc.b	"news at Euclid primes.",ETX

DialogTextRadioDay03R1:	; WOCX (talk radio)
	;		"1234567890123456789012"
	dc.b	"Tonight on Sea to Sea",LF
	dc.b	"with Barty George:   ^",FF
	dc.b	"Is the CIA using time",LF
	dc.b	"travel to spy on us? ^",FF
	dc.b	"We have someone from",LF
	dc.b	"2001 who says yes.",ETX

DialogTextRadioDay03R2:	; WCAS (top 40)
	;		"1234567890123456789012"
	dc.b	"Here's a song with a",LF
	dc.b	"bunch of references  ^",FF
	dc.b	"to stuff you don't",LF
	dc.b	"understand.",ETX

DialogTextRadioDay03R3:	; WVVX (hair metal)
	;		"1234567890123456789012"
	dc.b	"We're not playing any",LF
	dc.b	"of that Seattle stuff^",FF
	dc.b	"but we will be playing",LF
	dc.b	"some Midwest metal.",ETX

DialogTextRadioDay04R0:	; WNWT (news and weather)
	;		"1234567890123456789012"
	dc.b	"Hold on, I need to",LF
	dc.b	"talk to my producer..^",FF
	dc.b	"Yeah.. Ok, no.. we're",LF
	dc.b	"not covering that.   ^",FF
	dc.b	"None of our listeners",LF
	dc.b	"knows where that is. ^",FF
	dc.b	"Let's just do traffic",LF
	dc.b	"& weather on loop.",ETX

DialogTextRadioDay04R1:	; WOCX (talk radio)
	;		"1234567890123456789012"
	dc.b	"Tonight on Sea to Sea",LF
	dc.b	"with Barty George:   ^",FF
	dc.b	"We talk to a survivor",LF
	dc.b	"of the upcoming      ^",FF
	dc.b	"2012 Mayan Apocalypse.",ETX

DialogTextRadioDay04R2:	; WCAS (top 40)
	;		"1234567890123456789012"
	dc.b	"Here's that new song",LF
	dc.b	"that's a mash-up     ^",FF
	dc.b	"of things from your",LF
	dc.b	"parents' childhood.",ETX

DialogTextRadioDay04R3:	; WVVX (hair metal)
	;		"1234567890123456789012"
	dc.b	"I'm tired of answering",LF
	dc.b	"this all the time..  ^",FF
	dc.b	"the only acceptable",LF
	dc.b	"regions for metal are^",FF
	dc.b	"LA, Midwest, Norway,",LF
	dc.b	"and, uh, not Seattle.",ETX

DialogTextRadioDay05R0:	; WNWT (news and weather)
	;		"1234567890123456789012"
	dc.b	"It's 7:05 so time for",LF
	dc.b	"weather on the odds. ^",FF
	dc.b	"We're in for a rough",LF
	dc.b	"one tonight folks.   ^",FF
	dc.b	"At least 2ft of snow",LF
	dc.b	"is headed our way.   ^",FF
	dc.b	"It should be hitting",LF
	dc.b	"Bayhurst Mall soon.  ^",FF
	dc.b	"Downtown should be",LF
	dc.b	"covered by 10:00.    ^",FF
	dc.b	"Stay off the roads",LF
	dc.b	"tonight folks.       ^",FF
	dc.b	"And now it's time for",LF
	dc.b	"traffic on the evens.",ETX

DialogTextRadioDay05R1:	; WOCX (talk radio)
	;		"1234567890123456789012"
	dc.b	"You're listening to",LF
	dc.b	"Dash Diggler.        ^",FF
	dc.b	"Don't touch that dial",LF
	dc.b	"because after 10:00  ^",FF
	dc.b	"is Sea to Sea with",LF
	dc.b	"Barty George.        ^",FF
	dc.b	"He has some great",LF
	dc.b	"stuff lined-up too.  ^",FF
	dc.b	"His series on time",LF
	dc.b	"travel takes a twist.^",FF
	dc.b	"It's very important",LF
	dc.b	"you listen tonight.",ETX

DialogTextRadioDay05R2:	; WCAS (top 40)
	;		"1234567890123456789012"
	dc.b	"Up next is the latest",LF
	dc.b	"from Milli Vanilli.  ^",FF
	dc.b	"It was #1 a couple",LF
	dc.b	"weeks ago & I think  ^",FF
	dc.b	"you'll be hearing from",LF
	dc.b	"them for a long time. ",ETX

DialogTextRadioDay05R3:	; WVVX (hair metal)
	;		"1234567890123456789012"
	dc.b	"That was a demo song",LF
	dc.b	"from an underground  ^",FF
	dc.b	"Midwest metal band",LF
	dc.b	"called Wrath.",ETX

DialogTextRadioDay06R0:	; WNWT (news and weather)
	;		"1234567890123456789012"
	dc.b	"Only one shopping day",LF
	dc.b	"left & traffic around^",FF
	dc.b	"the malls is crazy.",LF
	dc.b	"Now weather..",ETX

DialogTextRadioDay06R1:	; WOCX (talk radio)
	;		"1234567890123456789012"
	dc.b	"Tonight on Sea to Sea",LF
	dc.b	"with Barty George:   ^",FF
	dc.b	"You won't believe who",LF
	dc.b	"is president in 2004.^",FF
	dc.b	"We have another time",LF
	dc.b	"traveler who exposes ^",FF
	dc.b	"the election upset of",LF
	dc.b	"the century.",ETX

DialogTextRadioDay06R2:	; WCAS (top 40)
	;		"1234567890123456789012"
	dc.b	"Starting at 10:00",LF
	dc.b	"tonight we're going  ^",FF
	dc.b	"to play all Xmas",LF
	dc.b	"music until the 26th.^",FF
	dc.b	"Some people say it's",LF
	dc.b	"too early to start   ^",FF
	dc.b	"playing Xmas music on",LF
	dc.b	"the 24th. C'mon, it's^",FF
	dc.b	"not like we're playing",LF
	dc.b	"it in November.",ETX

DialogTextRadioDay06R3:	; WVVX (hair metal)
	;		"1234567890123456789012"
	dc.b	"Alright, we're going",LF
	dc.b	"to try and find some ^",FF
	dc.b	"Xmas metal songs if",LF
	dc.b	"you people insist.",ETX

DialogTextRadioDay06NightR0:	; WNWT (news and weather)
	;		"1234567890123456789012"
	dc.b	"The forecast for Xmas",LF
	dc.b	"is nice and clear.   ^",FF
	dc.b	"Sorry to those wanting",LF
	dc.b	"a little snow..",ETX

DialogTextRadioDay06NightR1:	; WOCX (talk radio)
	;		"1234567890123456789012"
	dc.b	"Welcome to Sea to Sea",LF
	dc.b	"with Barty George.   ^",FF
	dc.b	"Yesterday's topic is",LF
	dc.b	"still on my mind.    ^",FF
	dc.b	"We know the CIA is",LF
	dc.b	"behind time travel.  ^",FF
	dc.b	"But why bring back",LF
	dc.b	"future people?       ^",FF
	dc.b	"It's really simple",LF
	dc.b	"folks.               ^",FF
	dc.b	"In the future all the",LF
	dc.b	"food is enriched with^",FF
	dc.b	"all kinds of hormones",LF
	dc.b	"& fluoride.          ^",FF
	dc.b	"These travelers make",LF
	dc.b	"ideal super soldiers.^",FF
	dc.b	"Since in the future",LF
	dc.b	"everyone must be     ^",FF
	dc.b	"10x the strength of",LF
	dc.b	"people today..",ETX

DialogTextRadioDay06NightR2:	; WCAS (top 40)
	;		"1234567890123456789012"
	dc.b	"Here's that new Xmas",LF
	dc.b	"song by NKOTB..",ETX

DialogTextRadioDay06NightR3:	; WVVX (hair metal)
	;		"1234567890123456789012"
	dc.b	"Here's a new unsigned",LF
	dc.b	"Midwest metal band.  ^",FF
	dc.b	"They're called",LF
	dc.b	"Prisoner.            ^",FF
	dc.b	"Here's their 1st song",LF
	dc.b	"`Skeletal Remains'   ^",FF
	dc.b	"(This is really loud)",ETX

DialogTextRadioDay07R0:	; WNWT (news and weather)
	;		"1234567890123456789012"
	dc.b	"It looks like people",LF
	dc.b	"are celebrating early^",FF
	dc.b	"because we have a few",LF
	dc.b	"accidents already.",ETX

DialogTextRadioDay07R1:	; WOCX (talk radio)
	;		"1234567890123456789012"
	dc.b	"Tonight on Sea to Sea",LF
	dc.b	"with Barty George:   ^",FF
	dc.b	"It wasn't time travel",LF
	dc.b	"all along.           ^",FF
	dc.b	"It was really aliens",LF
	dc.b	"creating clones with ^",FF
	dc.b	"future memories.",ETX

DialogTextRadioDay07R2:	; WCAS (top 40)
	;		"1234567890123456789012"
	dc.b	"And now for the #1",LF
	dc.b	"song in the country..^",FF
	dc.b	"Wait, is this really",LF
	dc.b	"how the 80s ends?",ETX

DialogTextRadioDay07R3:	; WVVX (hair metal)
	;		"1234567890123456789012"
	dc.b	"I think the 90s are",LF
	dc.b	"going to be a great  ^",FF
	dc.b	"decade for metal, even",LF
	dc.b	"better than the 80s.",ETX

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

DialogTextRegisterDay0Use:
	;		"1234567890123456789012"
	dc.b	"After some fumbling",LF
	dc.b	"you ring up the sale.",ETX

DialogTextHardware:
	;		"1234567890123456789012"
	dc.b	"This is a wire rack",LF
	dc.b	"of computer hardware.",ETX

DialogText16Bit:
	;		"1234567890123456789012"
	dc.b	"Here are the latest",LF
	dc.b	"16-bit games.",ETX

DialogTextHandheldGames:
	;		"1234567890123456789012"
	dc.b	"They're monochrome but",LF
	dc.b	"extremely popular.",ETX

DialogTextPCSoftware:
	;		"1234567890123456789012"
	dc.b	"PC utilities & games.",ETX

DialogTextJeans:
	;		"1234567890123456789012"
	dc.b	"Neatly folded pile of",LF
	dc.b	"jeans in many styles.",ETX

DialogTextBench:
	;		"1234567890123456789012"
	dc.b	"It doesn't look very",LF
	dc.b	"comfortable.",ETX

DialogTextTrashcan:
	;		"1234567890123456789012"
	dc.b	"It seems pretty foul",LF
	dc.b	"inside there.",ETX

DialogTextPlant:
	;		"1234567890123456789012"
	dc.b	"You can't tell if it's",LF
	dc.b	"real or fake.",ETX

DialogTextInfoDesk:
	;		"1234567890123456789012"
	dc.b	"It's a large desk with",LF
	dc.b	"various flyers on it.",ETX

DialogTextTree:
	;		"1234567890123456789012"
	dc.b	"It looks like some",LF
	dc.b	"birds moved into it.",ETX

DialogTextKiosk:
	;		"1234567890123456789012"
	dc.b	"There's an excessive",LF
	dc.b	"amount of meat here.",ETX

DialogTextPhone:
	;		"1234567890123456789012"
	dc.b	"There are a few phone",LF
	dc.b	"numbers written here.",ETX

DialogTextDaniCar:
	;		"1234567890123456789012"
	dc.b	"Somehow this thing",LF
	dc.b	"keeps running.",ETX

DialogTextMannequin:
	;		"1234567890123456789012"
	dc.b	"Keep this up & you'll",LF
	dc.b	"get kicked out.",ETX

DialogTextTMannequin:
	;		"1234567890123456789012"
	dc.b	"This new suit color",LF
	dc.b	"is really something.",ETX

DialogTextClothing:
	;		"1234567890123456789012"
	dc.b	"Folded stacks of",LF
	dc.b	"shirts and pants.",ETX

DialogTextRadio:
	;		"1234567890123456789012"
	dc.b	"You can faintly hear",LF
	dc.b	"a news station.",ETX

DialogTextCassettePlayer:
	;		"1234567890123456789012"
	dc.b	"The latest in portable",LF
	dc.b	"audio technology.",ETX

DialogTextCellPhone:
	;		"1234567890123456789012"
	dc.b	"It says they run for",LF
	dc.b	"up to 30 minutes.",ETX

DialogTextRCCar:
	;		"1234567890123456789012"
	dc.b	"This year's hot Xmas",LF
	dc.b	"gift apparently.",ETX

DialogTextComputer:
	;		"1234567890123456789012"
	dc.b	"The demo program looks",LF
	dc.b	"very complicated.",ETX

DialogTextOfficePhone:
	;		"1234567890123456789012"
	dc.b	"Office phone/answering",LF
	dc.b	"machine combo.",ETX

DialogTextVideoWall:
	;		"1234567890123456789012"
	dc.b	"There are hundreds of",LF
	dc.b	"VHS tapes here.",ETX

DialogTextVideoRack:
	;		"1234567890123456789012"
	dc.b	"Here are the new &",LF
	dc.b	"exciting releases.",ETX

DialogTextNutCase:
	;		"1234567890123456789012"
	dc.b	"Various nut & candy",LF
	dc.b	"combinations.",ETX

DialogTextNutBarrel:
	;		"1234567890123456789012"
	dc.b	"A self-serve barrel",LF
	dc.b	"of peanuts.",ETX

DialogTextTable:
	;		"1234567890123456789012"
	dc.b	"It hasn't been cleaned",LF
	dc.b	"in a while.",ETX

DialogTextTrash:
	;		"1234567890123456789012"
	dc.b	"The shoppers at this",LF
	dc.b	"mall are slobs.",ETX

DialogTextTapes:
	;		"1234567890123456789012"
	dc.b	"Too bad our car only",LF
	dc.b	"has an 8-track.",ETX

DialogTextCDs:
	;		"1234567890123456789012"
	dc.b	"All the latest albums",LF
	dc.b	"are here.",ETX

DialogTextBooksFiction:
	;		"1234567890123456789012"
	dc.b	"Here are the current",LF
	dc.b	"best-sellers.",ETX

DialogTextBooksRomance:
	;		"1234567890123456789012"
	dc.b	"The covers all have a",LF
	dc.b	"dude with no shirt on.",ETX

DialogTextBooksHistory:
	;		"1234567890123456789012"
	dc.b	"Just browsing these",LF
	dc.b	"makes you drowsy.",ETX

DialogTextBooksCooking:
	;		"1234567890123456789012"
	dc.b	"These all kind of look",LF
	dc.b	"the same to you.",ETX

DialogTextArcade0:
	;		"1234567890123456789012"
	dc.b	"Some kind of falling",LF
	dc.b	"object puzzle game.",ETX

DialogTextArcade1:
	;		"1234567890123456789012"
	dc.b	"Featuring The Savage",LF
	dc.b	"Bruiser & Dr. Pain.",ETX

DialogTextArcade2:
	;		"1234567890123456789012"
	dc.b	"It's a shooter with",LF
	dc.b	"vector graphics.",ETX

DialogTextArcade3:
	;		"1234567890123456789012"
	dc.b	"It's a rather blocky",LF
	dc.b	"looking racing game.",ETX

DialogTextArcade4:
	;		"1234567890123456789012"
	dc.b	"Classic shooter from",LF
	dc.b	"the late 1970s.",ETX

DialogTextArcade5:
	;		"1234567890123456789012"
	dc.b	"Help Captain Tiberius",LF
	dc.b	"escape certain death.",ETX

DialogTextArcade6:
	;		"1234567890123456789012"
	dc.b	"Save Chicago from drug",LF
	dc.b	"dealers & lowlifes.",ETX

DialogTextArcade7: ; Drive 'n Crash
	;		"1234567890123456789012"
	dc.b	"Survive the streets of",LF
	dc.b	"2040 Los Angeles.",ETX

DialogTextArcade8: ; YourChoice-15
	;		"1234567890123456789012"
	dc.b	"An assortment of 15",LF
	dc.b	"home games.",ETX

DialogTextFence:
	;		"1234567890123456789012"
	dc.b	"It's lined with many",LF
	dc.b	"wreathes.",ETX

DialogTextPole:
	;		"1234567890123456789012"
	dc.b	"Festive candy cane",LF
	dc.b	"Xmas pole.",ETX

DialogTextWorshop:
	;		"1234567890123456789012"
	dc.b	"Looks sturdy for being",LF
	dc.b	"built in a week.",ETX

DialogTextFountain:
	;		"1234567890123456789012"
	dc.b	"There are live fish",LF
	dc.b	"swimming around.",ETX

DialogTextFishingPoles:
	;		"1234567890123456789012"
	dc.b	"There are several",LF
	dc.b	"styles of poles.",ETX

DialogTextGunCase:
	;		"1234567890123456789012"
	dc.b	"Selling guns in malls,",LF
	dc.b	"that's something new.",ETX

DialogTextFirePit:
	;		"1234567890123456789012"
	dc.b	"It looks like it had",LF
	dc.b	"a real fire recently.",ETX

DialogTextTent:
	;		"1234567890123456789012"
	dc.b	"It says it fits 3 but",LF
	dc.b	"only if you're close.",ETX

;-------------------------------------------------------------------------------
; default NPC descriptions
;-------------------------------------------------------------------------------
DialogTextMaleShopper00DefaultLook:
	;		"1234567890123456789012"
	dc.b	"He has been browsing",LF
	dc.b	"for over an hour now.",ETX

DialogTextMaleShopper00LookDay01:
	;		"1234567890123456789012"
	dc.b	"Great, this guy again.",LF
	dc.b	"",ETX

DialogTextDaniDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She seems moderately",LF
	dc.b	"annoyed with you.",ETX

DialogTextDBDefaultLook:
	;		"1234567890123456789012"
	dc.b	"He seems a little bit",LF
	dc.b	"flustered right now.",ETX

DialogTextGreenbergDefaultLook:
	;		"1234567890123456789012"
	dc.b	"He nods a brief",LF
	dc.b	"hello to you.",ETX

DialogTextCenterStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She is looking at",LF
	dc.b	"some brochures.",ETX

DialogTextDenimCountryStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She seems very anxious",LF
	dc.b	"about something.",ETX

DialogTextCheckersStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"His outfit and hair",LF
	dc.b	"are well manicured.",ETX

DialogTextTLodgeStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"He is way too happy",LF
	dc.b	"to be here today.",ETX

DialogTextCavernStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"He must have been here",LF
	dc.b	"since it opened.",ETX

DialogTextSVideoStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"You don't think she",LF
	dc.b	"likes being stared at.",ETX

DialogTextNShackStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She looks back at you",LF
	dc.b	"a tad uncomfortably.",ETX

DialogTextPogoDawgStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"It's unclear if he's",LF
	dc.b	"aware you are here.",ETX

DialogTextCPlanetStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She doesn't seem happy",LF
	dc.b	"that you're looking.",ETX

DialogTextCNowStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She seems eager to",LF
	dc.b	"talk about anything.",ETX

DialogTextTBooksStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"Your old friend looks",LF
	dc.b	"sharp as usual.",ETX

DialogTextFCBCheckoutStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"He's trying to look",LF
	dc.b	"busy but failing.",ETX

DialogTextFCBFirearmsStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"He looks intimidating",LF
	dc.b	"even without the guns.",ETX

DialogTextFCBFishingStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She looks really",LF
	dc.b	"excited to be here.",ETX

DialogTextFCBCampingStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"He's taking the store",LF
	dc.b	"theme look seriously.",ETX

DialogTextSouthCenterStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She runs all these",LF
	dc.b	"seasonal stores.",ETX

DialogTextWorkshopStaff0DefaultLook:
	;		"1234567890123456789012"
	dc.b	"Maybe your job isn't",LF
	dc.b	"looking so bad now.",ETX

DialogTextWorkshopStaff1DefaultLook:
	;		"1234567890123456789012"
	dc.b	"That outfit can't be",LF
	dc.b	"comfortable.",ETX

DialogTextNPCSecretShopperDefaultLook:
	;		"1234567890123456789012"
	dc.b	"It's obvious she's a",LF
	dc.b	"mystery shopper.",ETX

DialogTextNPCGuard0DefaultLook:
	;		"1234567890123456789012"
	dc.b	"His shirt needs a trip",LF
	dc.b	"to the dry cleaners.",ETX

DialogTextNPCTrendyGuyDefaultLook:
	;		"1234567890123456789012"
	dc.b	"That look must take a",LF
	dc.b	"lot of effort.",ETX

	align 2
DialogTextNPCFemaleShopperDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She seems busy.",ETX

	align 2
DialogTextNPCBillyDefaultLook:
	;		"1234567890123456789012"
	dc.b	"Something about him",LF
	dc.b	"is annoying.",ETX

	align 2
DialogTextNPCMallManagerDefaultLook:
	;		"1234567890123456789012"
	dc.b	"He seems preoccupied",LF
	dc.b	"with something.",ETX

	align 2
DialogTextNPCDaniXmasDefaultLook:
	;		"1234567890123456789012"
	dc.b	"If only you had a",LF
	dc.b	"camera right now..",ETX

	align 2
DialogTextNPCSleepingGuardDefaultLook:
	;		"1234567890123456789012"
	dc.b	"It looks like he's",LF
	dc.b	"totally out.",ETX

	align 2
DialogTextMaleShopper1DefaultLook:
	;		"1234567890123456789012"
	dc.b	"Maybe he needs help",LF
	dc.b	"with something.",ETX

	align 2
DialogTextMaleShopper2DefaultLook:
	;		"1234567890123456789012"
	dc.b	"He's pacing around a",LF
	dc.b	"lot.",ETX

	align 2
DialogTextFemaleShopper1DefaultLook:
	;		"1234567890123456789012"
	dc.b	"She seems overwhelmed",LF
	dc.b	"by all the books.",ETX

;-------------------------------------------------------------------------------
; default NPC talk responses
;-------------------------------------------------------------------------------
	align 2
DialogTextGreenbergDefaultTalk:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Did you see the new",LF
	dc.b	"games that came in?",ETX

	align 2
DialogTextDenimCountryStaffDefaultTalk:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"It's way too slow",LF
	dc.b	"here for Xmas season.^",FF
	dc.b	"I hope they don't",LF
	dc.b	"close the mall.",ETX

	align 2
DialogTextDenimCountryStaffDefaultTalkDB:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"The way Dani talks",LF
	dc.b	"about you, I thought ^",FF
	dc.b	"you'd be shorter.",ETX

	align 2
DialogTextCheckersStaffDefaultTalk:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey. What's going on",LF
	dc.b	"with you today?",ETX

	align 2
DialogTextTLodgeStaffDefaultTalk:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"You know what the",LF
	dc.b	"perfect Xmas gift is?^",FF
	dc.b	"An extended warranty",LF
	dc.b	"for your new phone.",ETX

	align 2
DialogTextTLodgeStaffDefaultTalkAlt:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"Do you need an",LF
	dc.b	"extended warranty for^",FF
	dc.b	"any Xmas gifts you",LF
	dc.b	"received this year?",ETX

	align 2
DialogTextCavernStaffDefaultTalk:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"What do you need?",ETX

	align 2
DialogTextSVideoStaffDefaultTalk:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"Are you looking for a",LF
	dc.b	"specific movie?",ETX

	align 2
DialogTextNShackStaffDefaultTalk:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"Welcome. Please take",LF
	dc.b	"your time.",ETX

	align 2
DialogTextPogoDawgStaffDefaultTalk:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"...",ETX

	align 2
DialogTextCPlanetStaffDefaultTalk:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"You look like you're",LF
	dc.b	"here for that new    ^",FF
	dc.b	"boy band Xmas album.",LF
	dc.b	"It's on the CD rack.",ETX

	align 2
DialogTextCNowStaffDefaultTalk:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Hi! I'm so happy",LF
	dc.b	"you're here!         ^",FF
	dc.b	"You won't believe what",LF
	dc.b	"happened today!      ^",FF
	dc.b	"[30 minutes later]",LF
	dc.b	"                     ^",FF
	dc.b	"..and that's why I'm",LF
	dc.b	"waiting until after  ^",FF
	dc.b	"I get married!",ETX

	align 2
DialogTextTBooksStaffDefaultTalk:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey neighbor. Nice of",LF
	dc.b	"you to stop by.",ETX

	align 2
DialogTextFCBCheckoutStaffDefaultTalk:
	dc.w	OBJ_NPC_FCBCHECKOUT_STAFF
	;		"1234567890123456789012"
	dc.b	"Are you here to shop",LF
	dc.b	"or just annoy me?",ETX

	align 2
DialogTextFCBFirearmsStaffDefaultTalk:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"There's no better",LF
	dc.b	"gift for someone you ^",FF
	dc.b	"care about than a new",LF
	dc.b	"RK 62 rifle.",ETX

	align 2
DialogTextFCBFishingStaffDefaultTalk:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"We have everything you",LF
	dc.b	"need for ice fishing.",ETX

	align 2
DialogTextFCBCampingStaffDefaultTalk:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Oh hey. Yeah. Welcome",LF
	dc.b	"to the store I guess.^",FF
	dc.b	"How can I help you?",ETX

	align 2
DialogTextSouthCenterStaffDefaultTalk:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Hello.",ETX

	align 2
DialogTextWorkshopStaff0DefaultTalk:
	dc.w	OBJ_NPC_WORKSHOP_STAFF0
	;		"1234567890123456789012"
	dc.b	"Sorry, only children",LF
	dc.b	"under are 12 allowed.",ETX

	align 2
DialogTextWorkshopStaff1DefaultTalk:
	dc.w	OBJ_NPC_WORKSHOP_STAFF1
	;		"1234567890123456789012"
	dc.b	"Aren't you supposed to",LF
	dc.b	"have a kid with you?",ETX

;-------------------------------------------------------------------------------
; menus
;-------------------------------------------------------------------------------
	align 2
NPCMenu:
	;		"1234567890123456789012"
	dc.b	"{Look  {Talk  {Give",ETX

	align 2
ObjectMenu:
	;		"1234567890123456789012"
	dc.b	"{Look  {Use   {Take",ETX

	align 2
ItemMenu:
	;		"1234567890123456789012"
	dc.b	"{",ITEMNAMESTART

	align 2
InfoDeskMenu:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"{1234567890{1234567890"	
	dc.b	"What do you want to",LF
	dc.b	"know about today?    ^",FFR
	dc.b	"{Mall news {Store news",LF
	dc.b	"{Events    {Rumors",ETX

	align 2
RadioMenu:
	;		"{1234567890{1234567890"	
	dc.b	"{WNWT      {WCAS",LF
	dc.b	"{WOCX      {WVVX",ETX

;-------------------------------------------------------------------------------
; take menus and messages
;-------------------------------------------------------------------------------
TakeMenuItemTaken:
	;		"1234567890123456789012"
	dc.b	"Taken.",ETX

TakeMenuAlreadyCarrying:
	;		"1234567890123456789012"
	dc.b	"You're already",LF
	dc.b	"carrying one.",ETX

TakeMenuFull:
	;		"1234567890123456789012"
	dc.b	"You can't carry any",LF
	dc.b	"more items.",ETX

TakeMenuMagazines:
	;		"1234567890123456789012"
	dc.b	"Which magazine do you",LF
	dc.b	"want to take?        ^",FF
	dc.b	"{",ITEMNAMESTART

TakeMenuGames:
	;		"1234567890123456789012"
	dc.b	"Which game do you",LF
	dc.b	"want to take?        ^",FF
	dc.b	"{",ITEMNAMESTART

TakeMenuBooks:
	;		"1234567890123456789012"
	dc.b	"Which book do you",LF
	dc.b	"want to take?        ^",FF
	dc.b	"{",ITEMNAMESTART

TakeMenuDefault:
	;		"1234567890123456789012"
	dc.b	"What do you want to",LF
	dc.b	"take?                ^",FF
	dc.b	"{",ITEMNAMESTART

;-------------------------------------------------------------------------------
; default give messages
;-------------------------------------------------------------------------------
	align 2
DialogTextDaniDefaultGive:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yeah, whatever.",ETX

	align 2
DialogTextDBDefaultGive:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"...",ETX

	align 2
DialogTextGreenbergDefaultGive:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"I don't need that.",ETX

	align 2
DialogTextNPCCenterStaffDefaultGive:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Sorry, but the lost &",LF
	dc.b	"found is full.",ETX

	align 2
DialogTextNPCDenimCountryStaffDefaultGive:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Huh? Why don't you",LF
	dc.b	"keep that.",ETX

	align 2
DialogTextNPCCheckersStaffDefaultGive:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Get that out of here.",ETX

	align 2
DialogTextNPCTLodgeStaffDefaultGive:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"I can't do anything",LF
	dc.b	"with that.",ETX

	align 2
DialogTextNPCCavernStaffDefaultGive:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"Not interested.",ETX

	align 2
DialogTextNPCSVideoStaffDefaultGive:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"That's interesting",LF
	dc.b	"but you keep it.",ETX

	align 2
DialogTextNPCNShackStaffDefaultGive:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"No thanks.",ETX

	align 2
DialogTextNPCPogoDawgStaffDefaultGive:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"...",ETX

	align 2
DialogTextNPCCPlanetStaffDefaultGive:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"You're kinda weird.",LF
	dc.b	"You hang on to this.",ETX

	align 2
DialogTextNPCCNowStaffDefaultGive:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Is this a gift?",LF
	dc.b	"I can't accept it.",ETX

	align 2
DialogTextNPCTBooksStaffDefaultGive:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"No thanks, maybe",LF
	dc.b	"another time.",ETX

	align 2
DialogTextNPCFCBCheckoutStaffDefaultGive:
	dc.w	OBJ_NPC_FCBCHECKOUT_STAFF
	;		"1234567890123456789012"
	dc.b	"Do you want me to",LF
	dc.b	"ring this up?        ^",FF
	dc.b	"Hold on a second, we",LF
	dc.b	"don't sell this.",ETX

	align 2
DialogTextNPCFCBFirearmsStaffDefaultGive:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"Best keep that to",LF
	dc.b	"yourself.",ETX

	align 2
DialogTextNPCFCBFishingStaffDefaultGive:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"That's pretty neat",LF
	dc.b	"but I don't want it.",ETX

	align 2
DialogTextNPCFCBCampingStaffDefaultGive:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks but I don't",LF
	dc.b	"have room for this.",ETX

	align 2
DialogTextNPCSouthCenterStaffDefaultGive:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"It's nice to see you",LF
	dc.b	"in the giving spirit.^",FF
	dc.b	"But you should give",LF
	dc.b	"this to someone else.",ETX

	align 2
DialogTextNPCWorkshopStaff0DefaultGive:
	dc.w	OBJ_NPC_WORKSHOP_STAFF0
	;		"1234567890123456789012"
	dc.b	"Sorry, we're not",LF
	dc.b	"taking donations now.",ETX

	align 2
DialogTextNPCWorkshopStaff1DefaultGive:
	dc.w	OBJ_NPC_WORKSHOP_STAFF1
	;		"1234567890123456789012"
	dc.b	"What do you want me",LF
	dc.b	"to do with that?",ETX

	align 2
DialogTextNPCMallManagerDefaultGive:
	dc.w	OBJ_NPC_MALLMANAGER_SHORT
	;		"1234567890123456789012"
	dc.b	"That's interesting but",LF
	dc.b	"I don't need it.",ETX

	align 2
DialogTextNPCGenericShopperDefaultGive:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"That's not what I'm",LF
	dc.b	"looking for.",ETX

	align 2
DialogTextNPCBillyDefaultGive:
	dc.w	OBJ_NPC_BILLY
	;		"1234567890123456789012"
	dc.b	"I'm not allowed to",LF
	dc.b	"have that.",ETX

;-------------------------------------------------------------------------------
; object names
;-------------------------------------------------------------------------------
ObjectName8Bit:
	dc.b	"Wall of 8-bit games",OBJNAMEEND

ObjectNameComputerHardware:
	dc.b	"Computer hardware",OBJNAMEEND

ObjectName16Bit:
	dc.b	"Rack of 16-bit games",OBJNAMEEND

ObjectNameHandheld:
	dc.b	"Handheld games",OBJNAMEEND

ObjectNamePCSoftware:
	dc.b	"PC software",OBJNAMEEND

ObjectNameMagazines:
	dc.b	"Magazine rack",OBJNAMEEND

ObjectNameCounter:
	dc.b	"Counter",OBJNAMEEND

ObjectNameRegister:
	dc.b	"Cash register",OBJNAMEEND

ObjectNameJeans:
	dc.b	"Pile of folded jeans",OBJNAMEEND

ObjectNameBench:
	dc.b	"Wooden bench",OBJNAMEEND

ObjectNameTrashCan:
	dc.b	"Trash can",OBJNAMEEND

ObjectNamePlant:
	dc.b	"Potted plant",OBJNAMEEND

ObjectNameInfoDesk:
	dc.b	"Information desk",OBJNAMEEND

ObjectNameTree:
	dc.b	"Tree",OBJNAMEEND

ObjectNameKiosk:
	dc.b	"Seasonal kiosk",OBJNAMEEND

ObjectNamePhone:
	dc.b	"Payphone",OBJNAMEEND

ObjectNameDaniCar:
	dc.b	"Dani's car",OBJNAMEEND

ObjectNameMannequin:
	dc.b	"Mannequin",OBJNAMEEND

ObjectNameTMannequin:
	if	_DEBUG_
	dc.b	"TMannequin",OBJNAMEEND
	else
	dc.b	"Mannequin",OBJNAMEEND
	endif

ObjectNameClothing:
	dc.b	"Shelves of clothing",OBJNAMEEND

ObjectNameRadio:
	dc.b	"Radio",OBJNAMEEND

ObjectNameCassettePlayer:
	dc.b	"Mini cassette player",OBJNAMEEND

ObjectNameCellPhone:
	dc.b	"Portable phone",OBJNAMEEND

ObjectNameRCCar:
	dc.b	"RC car",OBJNAMEEND

ObjectNameComputer:
	dc.b	"Computer",OBJNAMEEND

ObjectNameOfficePhone:
	dc.b	"Phone",OBJNAMEEND

ObjectNameVideoWall:
	dc.b	"Wall of VHS tapes",OBJNAMEEND

ObjectNameVideoRack:
	dc.b	"Rack of VHS tapes",OBJNAMEEND

ObjectNameNutCase:
	dc.b	"Fancy nuts",OBJNAMEEND

ObjectNameNutBarrel:
	dc.b	"Barrel of nuts",OBJNAMEEND

ObjectNameSceneTable:
	dc.b	"Table",OBJNAMEEND

ObjectNameTrash:
	dc.b	"Trash",OBJNAMEEND

ObjectNameTapes:
	dc.b	"Cassette tapes",OBJNAMEEND

ObjectNameCDs:
	dc.b	"CD rack",OBJNAMEEND

ObjectNameBooksFiction:
	dc.b	"Fiction books",OBJNAMEEND

ObjectNameBooksRomance:
	dc.b	"Romance books",OBJNAMEEND

ObjectNameBooksHistory:
	dc.b	"History books",OBJNAMEEND

ObjectNameBooksCooking:
	dc.b	"Cookbooks",OBJNAMEEND

ObjectNameArcade0:
	dc.b	"Tiles!",OBJNAMEEND

ObjectNameArcade1:
	dc.b	"Wrestle Brawl",OBJNAMEEND

ObjectNameArcade2:
	dc.b	"Vector Zone",OBJNAMEEND

ObjectNameArcade3:
	dc.b	"Rough Steering",OBJNAMEEND

ObjectNameArcade4:
	dc.b	"UFO Armada",OBJNAMEEND

ObjectNameArcade5:
	dc.b	"Night Maze",OBJNAMEEND

ObjectNameArcade6:
	dc.b	"Crime Bashers",OBJNAMEEND

ObjectNameArcade7:
	dc.b	"Drive 'n Crash",OBJNAMEEND

ObjectNameArcade8:
	dc.b	"YourChoice-15",OBJNAMEEND

ObjectNameFence:
	dc.b	"Fence",OBJNAMEEND

ObjectNamePole:
	dc.b	"Festive pole",OBJNAMEEND

ObjectNameWorkshop:
	dc.b	"Santa's Workshop",OBJNAMEEND

ObjectNameFountain:
	dc.b	"Fountain",OBJNAMEEND

ObjectNameFishingPoles:
	dc.b	"Fishing poles",OBJNAMEEND

ObjectNameGunCase:
	dc.b	"Gun case",OBJNAMEEND

ObjectNameFirepit:
	dc.b	"Fire pit",OBJNAMEEND

ObjectNameTent:
	dc.b	"Tent",OBJNAMEEND

;-------------------------------------------------------------------------------
; npc names
;-------------------------------------------------------------------------------
NPCNameUnknown:
	dc.b	"????",NPCNAMEEND

NPCNameDani:
	dc.b	"Dani",NPCNAMEEND

NPCNameDB:
	dc.b	"D.B.",NPCNAMEEND

NPCNameMaleShopper0:
	dc.b	"Business casual guy",NPCNAMEEND

NPCNameGreenberg:
	dc.b	"Grunberg",NPCNAMEEND

NPCNameCenterStaff:
	dc.b	"Holly",NPCNAMEEND

NPCNameDeminCountryStaff:
	dc.b	"Lisa",NPCNAMEEND

NPCNameCheckersStaff:
	dc.b	"Todd",NPCNAMEEND

NPCNameTLodgeStaff:
	dc.b	"Scott",NPCNAMEEND

NPCNameCavernStaff:
	dc.b	"Gary",NPCNAMEEND

NPCNameSVideoStaff:
	dc.b	"Annette",NPCNAMEEND

NPCNameNShackStaff:
	dc.b	"Jen",NPCNAMEEND

NPCNamePogoDawgStaff:
	dc.b	"Griffy",NPCNAMEEND

NPCNameCPlanetStaff:
	dc.b	"Eliza",NPCNAMEEND

NPCNameCNowStaff:
	dc.b	"Becky",NPCNAMEEND

NPCNameTBooksStaff:
	dc.b	"Charles",NPCNAMEEND

NPCNameFCBCheckoutStaff:
	dc.b	"Thomas",NPCNAMEEND

NPCNameFCBFirearmsStaff:
	dc.b	"Randy",NPCNAMEEND

NPCNameFCBFishingStaff:
	dc.b	"Heather",NPCNAMEEND

NPCNameFCBCampingStaff:
	dc.b	"Jordan",NPCNAMEEND

NPCNameSouthCenterStaff:
	dc.b	"Carol",NPCNAMEEND

NPCNameWorkshopStaff0:
	dc.b	"Missy",NPCNAMEEND

NPCNameWorkshopStaff1:
	dc.b	"Anthony",NPCNAMEEND

NPCNameSecretShopper:
	;		"1234567890123456789012"
	dc.b	"Overt mystery shopper",NPCNAMEEND

NPCNameGuard0:
	;		"1234567890123456789012"
	dc.b	"Security",NPCNAMEEND

NPCNameTrendyGuy:
	;		"1234567890123456789012"
	dc.b	"Trendy guy",NPCNAMEEND

NPCNameBilly:
	;		"1234567890123456789012"
	dc.b	"Billy",NPCNAMEEND

NPCNameFire:
	;		"1234567890123456789012"
	dc.b	"Small fire",NPCNAMEEND

NPCNameMallManager:
	;		"1234567890123456789012"
	dc.b	"Al (mall manager)",NPCNAMEEND

NPCNameMallManagerShort:
	;		"1234567890123456789012"
	dc.b	"Al",NPCNAMEEND

NPCNameGenericShopper:
	;		"1234567890123456789012"
	dc.b	"Shopper",NPCNAMEEND

;-------------------------------------------------------------------------------
; item names and descriptions
;-------------------------------------------------------------------------------
ItemNameNothing:
	;		"1234567890"
	dc.b	"Nothing",ITEMNAMEEND

ItemNameMagGamePro:
	;		"1234567890"
	dc.b	"GamePro",ITEMNAMEEND

ItemDescriptionMagGamePro:
	;		"1234567890123456789012"
	dc.b	"Featuring a review of",LF
	dc.b	"The Wizard movie.",ETX

ItemNameMagEGM:
	;		"1234567890"
	dc.b	"EGM",ITEMNAMEEND

ItemDescriptionMagEGM:
	;		"1234567890123456789012"
	dc.b	"Special 1990 buyer's",LF
	dc.b	"guide included.",ETX

ItemNameMagAntic:
	;		"1234567890"
	dc.b	"Antic",ITEMNAMEEND

ItemDescriptionMagAntic:
	;		"1234567890123456789012"
	dc.b	"Includes source code",LF
	dc.b	"for 4 programs.",ETX

ItemNameMagAnalog:
	;		"1234567890"
	dc.b	"Analog",ITEMNAMEEND

ItemDescriptionMagAnalog:
	;		"1234567890123456789012"
	dc.b	"This issue has a",LF
	dc.b	"6502 assembler guide.",ETX

ItemName8BitMegaMan2:
	;		"1234567890"
	dc.b	"MegaMan2",ITEMNAMEEND

ItemDescription8BitMegaMan2:
	;		"1234567890123456789012"
	dc.b	"The box is kinda dorky",LF
	dc.b	"but it's selling.",ETX

ItemName8BitShadowgate:
	;		"1234567890"
	dc.b	"Shadowgate",ITEMNAMEEND

ItemDescription8BitShadowgate:
	;		"1234567890123456789012"
	dc.b	"It looks creepy.",ETX

ItemName8BitBayouBilly:
	;		"1234567890"
	dc.b	"BayouBilly",ITEMNAMEEND

ItemDescription8BitBayouBilly:
	;		"1234567890123456789012"
	dc.b	"Fighting, driving, &",LF
	dc.b	"racing in one game.",ETX

ItemName8BitTMNT:
	;		"1234567890"
	dc.b	"TMNT",ITEMNAMEEND

ItemDescription8BitTMNT:
	;		"1234567890123456789012"
	dc.b	"Not sure this is what",LF
	dc.b	"people are expecting.",ETX

ItemName16BitGoldenAxe:
	;		"1234567890"
	dc.b	"GoldenAxe",ITEMNAMEEND

ItemDescription16BitGoldenAxe:
	;		"1234567890123456789012"
	dc.b	"These characters need",LF
	dc.b	"more clothing.",ETX

ItemName16BitLastBattle:
	;		"1234567890"
	dc.b	"LastBattle",ITEMNAMEEND

ItemDescription16BitLastBattle:
	;		"1234567890123456789012"
	dc.b	"The `Last Battle', we",LF
	dc.b	"can only hope.",ETX

ItemName16BitGalaga90:
	;		"1234567890"
	dc.b	"Galaga90",ITEMNAMEEND

ItemDescription16BitGalaga90:
	;		"1234567890123456789012"
	dc.b	"A new take on an",LF
	dc.b	"arcade classic.",ETX

ItemName16BitVigilante:
	;		"1234567890"
	dc.b	"Vigilante",ITEMNAMEEND

ItemDescription16BitVigilante:
	;		"1234567890123456789012"
	dc.b	"Video game girlfriends",LF
	dc.b	"get kidnapped a lot.",ETX

ItemNameHWSBlaster:
	;		"1234567890"
	dc.b	"SndBlaster",ITEMNAMEEND

ItemDescriptionHWSBlaster:
	;		"1234567890123456789012"
	dc.b	"The latest in computer",LF
	dc.b	"audio technology.",ETX

ItemNameHWProdigy:
	;		"1234567890"
	dc.b	"Prodigy",ITEMNAMEEND

ItemDescriptionHWProdigy:
	;		"1234567890123456789012"
	dc.b	"Includes the modem &",LF
	dc.b	"software.",ETX

ItemName35Disks:
	;		"123  4            567890"
	dc.b	"3.5",CHAR_DQUOTE," disks",ITEMNAMEEND

ItemDescriptionHW35Disks:
	;		"1234567890123456789012"
	dc.b	"10-pack of 1.44 MB",LF
	dc.b	"high-density disks.",ETX

ItemNameHWPrintRibbon:
	;		"1234567890"
	dc.b	"PrntRibbon",ITEMNAMEEND

ItemDescriptionHWPrintRibbon:
	;		"1234567890123456789012"
	dc.b	"Prints 1,000+ pages.",ETX

ItemNameMysteryPackage:
	;		"1234567890"
	dc.b	"Package",ITEMNAMEEND

ItemDescriptionMysteryPackage:
	;		"1234567890123456789012"
	dc.b	"It's about the size of",LF
	dc.b	"a VHS tape.",ETX

ItemNameHandheldAlleyway:
	;		"1234567890"
	dc.b	"Alleyway",ITEMNAMEEND

ItemDescriptionHandheldAlleyway:
	;		"1234567890123456789012"
	dc.b	"This idea seems a",LF
	dc.b	"little familiar.",ETX

ItemNameHandheldMarioLand:
	;		"1234567890"
	dc.b	"MarioLand",ITEMNAMEEND

ItemDescriptionHandheldMarioLand:
	;		"1234567890123456789012"
	dc.b	"This looks fun.",ETX

ItemNameHandheldContraLCD:
	;		"1234567890"
	dc.b	"Contra LCD",ITEMNAMEEND

ItemDescriptionHandheldContraLCD:
	;		"1234567890123456789012"
	dc.b	"If you don't have any",LF
	dc.b	"other options I guess.",ETX

ItemNameHandheldTopGunLCD:
	;		"1234567890"
	dc.b	"TopGun LCD",ITEMNAMEEND

ItemDescriptionHandheldTopGunLCD:
	;		"1234567890123456789012"
	dc.b	"It can't be worse than",LF
	dc.b	"the cartridge version.",ETX

ItemNamePCWindows:
	;		"1234567890"
	dc.b	"Windows 2",ITEMNAMEEND

ItemDescriptionPCWindows:
	;		"1234567890123456789012"
	dc.b	"For some reason people",LF
	dc.b	"get angry about this.",ETX

ItemNamePCPrintShop:
	;		"1234567890"
	dc.b	"PrintShop",ITEMNAMEEND

ItemDescriptionPCPrintShop:
	;		"1234567890123456789012"
	dc.b	"Perfect for making",LF
	dc.b	"giant banners.",ETX

ItemNamePCJMFootball:
	;		"1234567890"
	dc.b	"JMFootball",ITEMNAMEEND

ItemDescriptionPCJMFootball:
	;		"1234567890123456789012"
	dc.b	"Was this guy a famous",LF
	dc.b	"player or something?",ETX

ItemNamePCSimCity:
	;		"1234567890"
	dc.b	"SimCity",ITEMNAMEEND

ItemDescriptionPCSimCity:
	;		"1234567890123456789012"
	dc.b	"This looks way too",LF
	dc.b	"complicated.",ETX

ItemNameTenDollar:
	;		"1234567890"
	dc.b	"$10 bill",ITEMNAMEEND

ItemDescriptionTenDollar:
	;		"1234567890123456789012"
	dc.b	"A crisp $10 bill.",ETX

ItemNameQuarters:
	;		"1234567890"
	dc.b	"Quarters",ITEMNAMEEND

ItemDescriptionQuarters:
	;		"1234567890123456789012"
	dc.b	"A roll of quarters.",ETX

ItemNameCamera1:
	;		"1234567890"
	dc.b	"Camera 1",ITEMNAMEEND

ItemDescriptionCamera1:
	;		"1234567890123456789012"
	dc.b	"This was hidden under",LF
	dc.b	"a bench by your store.",ETX

ItemNameCamera2:
	;		"1234567890"
	dc.b	"Camera 2",ITEMNAMEEND

ItemDescriptionCamera2:
	;		"1234567890123456789012"
	dc.b	"This was hidden in the",LF
	dc.b	"easternmost hallway.",ETX

ItemNameCamera3:
	;		"1234567890"
	dc.b	"Camera 3",ITEMNAMEEND

ItemDescriptionCamera3:
	;		"1234567890123456789012"
	dc.b	"This was in a plant",LF
	dc.b	"by Santa's Workshop.",ETX

ItemNameEnvelope:
	;		"1234567890"
	dc.b	"Envelope",ITEMNAMEEND

ItemDescriptionEnvelope1:
	;		"1234567890123456789012"
	dc.b	"Sunset Video: Annette",LF
	dc.b	"Interests: Academics",ETX

ItemDescriptionEnvelope2:
	;		"1234567890123456789012"
	dc.b	"Cassette Planet: Eliza",LF
	dc.b	"Interests: The Occult",ETX

ItemNameRBook1:
	;		"1234567890"
	dc.b	"Sexy Scot",ITEMNAMEEND

ItemDescriptionRBook1:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"Sometimes you",LF
	;		"1234567890123456789012"
	dc.b	"kiss a Sexy Scot",CHAR_DQUOTE,ETX

ItemNameRBook2:
	;		"1234567890"
	dc.b	"Dash Duke",ITEMNAMEEND

ItemDescriptionRBook2:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"Sometimes you",LF
	;		"1234567890123456789012"
	dc.b	"marry a Dashing Duke",CHAR_DQUOTE,ETX

ItemNameRBook3:
	;		"1234567890"
	dc.b	"RecklRogue",ITEMNAMEEND

ItemDescriptionRBook3:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"Sometimes you",LF
	;		"1234567890123456789012"
	dc.b	"dare a Reckless Rogue",CHAR_DQUOTE,ETX

ItemNameRBook4:
	;		"1234567890"
	dc.b	"GetAGhost",ITEMNAMEEND

ItemDescriptionRBook4:
	;		"1              234567890123456789012"
	dc.b	"",CHAR_DQUOTE,"A debut paranormal",LF
	;		"1234567890123456789012"
	dc.b	"romance series",CHAR_DQUOTE,ETX

ItemNameHBook1:
	;		"1234567890"
	dc.b	"BelgnRevo",ITEMNAMEEND

ItemDescriptionHBook1:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"History of the",LF
	;		"1234567890123456789012"
	dc.b	"Belgian Revolution",CHAR_DQUOTE,ETX

ItemNameHBook2:
	;		"1234567890"
	dc.b	"LastMilkmn",ITEMNAMEEND

ItemDescriptionHBook2:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"True story of",LF
	;		"1234567890123456789012"
	dc.b	"the last milkman",CHAR_DQUOTE,ETX

ItemNameHBook3:
	;		"1234567890"
	dc.b	"MathHstory",ITEMNAMEEND

ItemDescriptionHBook3:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"The complete",LF
	;		"1234567890123456789012"
	dc.b	"history of math",CHAR_DQUOTE,ETX

ItemNameHBook4:
	;		"1234567890"
	dc.b	"TheLastWar",ITEMNAMEEND

ItemDescriptionHBook4:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"How our last",LF
	;		"1234567890123456789012"
	dc.b	"war will be the last",CHAR_DQUOTE,ETX

ItemNameCBook1:
	;		"1234567890"
	dc.b	"Cheap Chef",ITEMNAMEEND

ItemDescriptionCBook1:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"100 easy meals",LF
	;		"1234567890123456789012"
	dc.b	"for under 10 cents",CHAR_DQUOTE,ETX

ItemNameCBook2:
	;		"1234567890"
	dc.b	"HolidayMix",ITEMNAMEEND

ItemDescriptionCBook2:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"Holiday meals",LF
	;		"1234567890123456789012"
	dc.b	"using only a blender",CHAR_DQUOTE,ETX

ItemNameCBook3:
	;		"1234567890"
	dc.b	"MicrowaveG",ITEMNAMEEND

ItemDescriptionCBook3:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"Microwave",LF
	;		"1234567890123456789012"
	dc.b	"Gourmet, 1989 edition",CHAR_DQUOTE,ETX

ItemNameCBook4:
	;		"1234567890"
	dc.b	"VegCurious",ITEMNAMEEND

ItemDescriptionCBook4:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"Are you ready",LF
	;		"1234567890123456789012"
	dc.b	"for a meat-free life?",CHAR_DQUOTE,ETX

ItemNameFBook1:
	;		"1234567890"
	dc.b	"BlackQrter",ITEMNAMEEND

ItemDescriptionFBook1:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"An author deals",LF
	;		"1234567890123456789012"
	dc.b	"with four identities",CHAR_DQUOTE,ETX

ItemNameFBook2:
	;		"1234567890"
	dc.b	"WzrdOfHysl",ITEMNAMEEND

ItemDescriptionFBook2:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"Can Peachflame",LF
	;		"1234567890123456789012"
	dc.b	"save Hysleria?",CHAR_DQUOTE,ETX

ItemNameFBook3:
	;		"1234567890"
	dc.b	"GneralThrt",ITEMNAMEEND

ItemDescriptionFBook3:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"Traitor general",LF
	;		"1234567890123456789012"
	dc.b	"steals a Soviet sub",CHAR_DQUOTE,ETX

ItemNameFBook4:
	;		"1234567890"
	dc.b	"Vodkaland",ITEMNAMEEND

ItemDescriptionFBook4:
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"A collection of",LF
	;		"1234567890123456789012"
	dc.b	"short stories",CHAR_DQUOTE,ETX

ItemNameRelish:
	;		"1234567890"
	dc.b	"Relish",ITEMNAMEEND

ItemDescriptionRelish:
	;		"1234567890123456789012"
	dc.b	"It looks pretty gross.",ETX

ItemNameMixedNuts:
	;		"1234567890"
	dc.b	"Mixed Nuts",ITEMNAMEEND

ItemDescriptionMixedNuts:
	;		"1234567890123456789012"
	dc.b	"It's mostly almonds &",LF
	dc.b	"cashews.",ETX

ItemNameStrangeGift:
	;		"1234567890"
	dc.b	"Necklace",ITEMNAMEEND

ItemDescriptionStrangeGift:
	;		"1234567890123456789012"
	dc.b	"Weird string necklace",LF
	dc.b	"with a snake charm.",ETX

ItemNameCaffeinePills:
	;		"1234567890"
	dc.b	"Pills",ITEMNAMEEND

ItemDescriptionCaffeinePills:
	;		"1234567890123456789012"
	dc.b	"Hunter's Formula Max",LF
	dc.b	"caffeine pills.",ETX

ItemNameWoodComb:
	;		"1234567890"
	dc.b	"Wood Comb",ITEMNAMEEND

ItemDescriptionWoodComb:
	;		"1234567890123456789012"
	dc.b	"It looks expensive yet",LF
	dc.b	"old-fashioned.",ETX

ItemNameJacket:
	;		"1234567890"
	dc.b	"BlckJacket",ITEMNAMEEND

ItemDescriptionJacket:
	;		"1234567890123456789012"
	dc.b	"Black leather jacket,",LF
	dc.b	"very punk.",ETX

ItemNameNoseHoops:
	;		"1234567890"
	dc.b	"Nose Hoops",ITEMNAMEEND

ItemDescriptionNoseHoops:
	;		"1234567890123456789012"
	dc.b	"These look painful.",ETX

ItemNameDecoyFish:
	;		"1234567890"
	dc.b	"Decoy Fish",ITEMNAMEEND

ItemDescriptionDecoyFish:
	;		"1234567890123456789012"
	dc.b	"A miniature fake fish",LF
	dc.b	"on a string.",ETX

ItemNameNeonDress:
	;		"1234567890"
	dc.b	"Neon Dress",ITEMNAMEEND

ItemDescriptionNeonDress:
	;		"1234567890123456789012"
	dc.b	"It's extremely bright.",ETX

ItemNameLandmine:
	;		"1234567890"
	dc.b	"Landmine",ITEMNAMEEND

ItemDescriptionLandmine:
	;		"1234567890123456789012"
	dc.b	"(I hope this isn't",LF
	dc.b	"active)",ETX

ItemNameMotivationalBooks:
	;		"1234567890"
	dc.b	"MotivBooks",ITEMNAMEEND

ItemDescriptionMotivationalBooks:
	;		"1234567890123456789012"
	dc.b	"Motivational business",LF
	dc.b	"books.",ETX

ItemNameCalculator:
	;		"1234567890"
	dc.b	"Calculator",ITEMNAMEEND

ItemDescriptionCalculator:
	;		"1234567890123456789012"
	dc.b	"Slightly outdated",LF
	dc.b	"graphing calculator.",ETX

ItemNameBetaTapes:
	;		"1234567890"
	dc.b	"Beta Tapes",ITEMNAMEEND

ItemDescriptionBetaTapes:
	;		"1234567890123456789012"
	dc.b	"Various movies on",LF
	dc.b	"Betamax.",ETX

ItemNameRancidMeat:
	;		"1234567890"
	dc.b	"RancidMeat",ITEMNAMEEND

ItemDescriptionRancidMeat:
	;		"1234567890123456789012"
	dc.b	"Might be edible if",LF
	dc.b	"it's deep-fried.",ETX

ItemNameLunchDelivery:
	;		"1234567890"
	dc.b	"LunchDlvry",ITEMNAMEEND

ItemDescriptionLunchDelivery:
	;		"1234567890123456789012"
	dc.b	"Lunch for a hungry",LF
	dc.b	"mall employee.",ETX

;-------------------------------------------------------------------------------
; store signs
;-------------------------------------------------------------------------------
StoreSignFiction:
	;		"1234567"
	dc.b	"Fiction",ETX

StoreSignCooking:
	;		"1234567"
	dc.b	"Cooking",ETX

StoreSignRomance:
	;		"1234567"
	dc.b	"Romance",ETX

StoreSignHistory:
	;		"1234567"
	dc.b	"History",ETX

;-------------------------------------------------------------------------------
; day intros
;-------------------------------------------------------------------------------
Day00IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           November 19, 1989            ",ETX

Day00IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"D-Pad: Move Player,change menu selection",ETX

Day00IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"A button: Interact with people & objects",ETX

Day00IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"C button: Open the status screen",ETX

Day00IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"A or C button: Confirm menu selection",ETX

Day00IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"B button: Cancel menu, exit status",ETX

Day00IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Start: Pause, exit this screen",ETX

Day01IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"    November 24, 1989 - Black Friday    ",ETX

Day01IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Store keys let you enter a store after",ETX

Day01IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"the mall is closed.",ETX

Day01IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Keys can be earned by completing tasks",ETX

Day01IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"that help the store.",ETX

Day01IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Try talking to other mall employees to",ETX

Day01IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"see who needs help each day.",ETX

Day02IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           November 26, 1989            ",ETX

Day02IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Most items are not carried over",ETX

Day02IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"between days.",ETX

Day02IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Try to use all items in your inventory",ETX

Day02IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"before the day ends.",ETX

Day02IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Store keys are always carried over",ETX

Day02IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"between days.",ETX

Day03IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"            December 3, 1989            ",ETX

Day03IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Some store missions might take multiple",ETX

Day03IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"days to complete.",ETX

Day03IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"The tasks in these missions may only",ETX

Day03IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"be available when the mall is open.",ETX

Day03IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"When the mall closes all shoppers leave",ETX

Day03IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"& it's possible to miss events.",ETX

Day04IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"            December 10, 1989           ",ETX

Day04IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Some days have multiple missions but",ETX

Day04IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"you can only choose to play one of them.",ETX

Day04IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Try playing again if you're curious",ETX

Day04IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"how the others turned out.",ETX

Day04IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"In some missions the choices you make",ETX

Day04IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"impact events later in the story.",ETX

Day05IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"            December 17, 1989           ",ETX

Day05IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Bayhurst Mall opened in 1975.",ETX

Day05IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"They say it never once closed due to",ETX

Day05IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"bad weather since then.",ETX

Day05IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Will this streak last 15 years?",ETX

Day05IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Or is something coming that will finally",ETX

Day05IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"force a closure for just one night..",ETX

Day06IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"            December 24, 1989           ",ETX

Day06IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"If the night guard catches you doing",ETX

Day06IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"something suspicious it will effect",ETX

Day06IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"the ending.",ETX

Day06IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"You can enter stores to hide from the",ETX

Day06IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"night guard if you have a key to them.",ETX

Day06IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Be careful & don't get busted.",ETX

Day07IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	" December 31, 1989: Last Day of the 80s ",ETX

Day07IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Xmas is over & the mall is quiet again.",ETX

Day07IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Use today for any unfinished business.",ETX

Day07IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Or go straight to the end, your call.",ETX

Day07IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Choices today may change the ending.",ETX

Day07IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"There are three possible endings.",ETX

Day07IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Thanks for playing this far.",ETX

;-------------------------------------------------------------------------------
; status screen
;-------------------------------------------------------------------------------
StatusScreenInventory:
	dc.b	"Inventory",ETX

StatusScreenSave:
	dc.b	"Save",ETX

StatusScreenStoreKeys:
	dc.b	"Store keys",ETX

StatusScreenYouAreHere:
	dc.b	" = you are here",ETX

StatusScreenDay00Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 19, 1989: Your first day",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"1) Help the customer who won't leave",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"2) Go home",ETX

StatusScreenDay01Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 24, 1989: Black Friday",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"How are all your friends handling",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"the busiest day of the year?",ETX

StatusScreenDay01Objective01:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 24, 1989: Black Friday",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Track down the owner of the mystery",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"package & meet your sister.",ETX

StatusScreenDay02Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 26, 1989: Missing items",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"1) Make change for your store",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"2) Help your friend at the bookstore",ETX

StatusScreenDay02Objective01:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 26, 1989: Missing items",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"That's weird, your brother is",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"supposed to be done with work by now.",ETX

StatusScreenDay02Objective02:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 26, 1989: Missing items",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"You need to track that guy down.",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Maybe his coworkers know something.",ETX

StatusScreenDay02Objective03:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 26, 1989: Missing items",LF
	;		"1234567890123456789012345678901234567"s
	dc.b	"He must be somewhere else in the",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"mall, time to search.",ETX

StatusScreenDay02Objective04:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 26, 1989: Missing items",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"That's enough for one day,",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"time to head out.",ETX

StatusScreenDay03Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 3, 1989: Making new friends",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Maybe someone has an update on the",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"items missing from their store?",ETX

StatusScreenDay03Objective03:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 3, 1989: Making new friends",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"There are 3 cameras hidden in the",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"mall, try looking everywhere.",ETX

StatusScreenDay03Objective01:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 3, 1989: Making new friends",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Free time, go find to D.B. whenever",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"you are ready to go home for the day.",ETX

StatusScreenDay03Objective02:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 3, 1989: Making new friends",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"You have to find that kid's parent",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"& D.B. before you can leave.",ETX

StatusScreenDay04Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 10, 1989: Secret Santa",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"The Secret Santa exchange might be a",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"good way to earn a new store key.",ETX

StatusScreenDay04Objective01:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 10, 1989: Secret Santa",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"You need to find another person to",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"join the Secret Santa gift exchange.",ETX

StatusScreenDay04Objective02:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 10, 1989: Secret Santa",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Find a good gift & bring it to the",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"information desk.",ETX

StatusScreenDay04Objective03:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 10, 1989: Secret Santa",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"End of the day,",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"head out whenever you're ready.",ETX

StatusScreenDay05Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 17, 1989: The Blizzard",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"There has to be some place where you",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"can check the weather forecast.",ETX

StatusScreenDay05Objective01:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 17, 1989: The Blizzard",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Can you make it out of the mall",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"before the storm hits?",ETX

StatusScreenDay05Objective02:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 17, 1989: The Blizzard",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"You'll need to find a place to stay",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"& supplies to get through the night.",ETX

StatusScreenDay06Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 24, 1989: Christmas Eve",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Plan how to help Jordan sneak into",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Santa's Workshop tonight.",ETX

StatusScreenDay06Objective01:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 24, 1989: Christmas Eve",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Find something to help you stay awake",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"during your job interview.",ETX

StatusScreenDay06Objective02:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 24, 1989: Christmas Eve",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Find a way to distract the guard",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"without getting busted.",ETX

StatusScreenDay07Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 31, 1989: Epilogue",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"New Year's Eve is a great time to see",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"friends & wrap-up loose ends.",ETX

StatusScreenDay07Objective01:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 31, 1989: Epilogue",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Are you stuck going to a bad party",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"or do you have a better idea?",ETX

SaveGameTitleD0O0:
	;		"123456789012345678901"
	dc.b	"November 19 (Evening)",ETX
	
SaveGameTitleD1O0:
	;		"123456789012345678901"
	dc.b	"November 24 (Day)    ",ETX

SaveGameTitleD1O1:
	;		"123456789012345678901"
	dc.b	"November 24 (Evening)",ETX

SaveGameTitleD2O0:
	;		"123456789012345678901"
	dc.b	"November 26 (Day)    ",ETX

SaveGameTitleD2O1:
	;		"123456789012345678901"
	dc.b	"November 26 (Evening)",ETX

SaveGameTitleD2O2:
	;		"123456789012345678901"
	dc.b	"November 26 (Evening)",ETX

SaveGameTitleD2O3:
	;		"123456789012345678901"
	dc.b	"November 26 (Evening)",ETX

SaveGameTitleD2O4:
	;		"123456789012345678901"
	dc.b	"November 26 (Night)  ",ETX

SaveGameTitleD3O0:
	;		"123456789012345678901"
	dc.b	"December 3 (Day)     ",ETX

SaveGameTitleD3O1:
	;		"123456789012345678901"
	dc.b	"December 3 (Evening) ",ETX

SaveGameTitleD4O0:
	;		"123456789012345678901"
	dc.b	"December 10 (Day)    ",ETX

SaveGameTitleD4O1:
	;		"123456789012345678901"
	dc.b	"December 10 (Day)    ",ETX

SaveGameTitleD4O2:
	;		"123456789012345678901"
	dc.b	"December 10 (Day)    ",ETX

SaveGameTitleD4O3:
	;		"123456789012345678901"
	dc.b	"December 10 (Night)  ",ETX

SaveGameTitleD5O0:
	;		"123456789012345678901"
	dc.b	"December 17 (Day)    ",ETX

SaveGameTitleD6O0:
	;		"123456789012345678901"
	dc.b	"December 24 (Day)    ",ETX

SaveGameTitleD7O0:
	;		"123456789012345678901"
	dc.b	"December 31 (Day)    ",ETX

SaveGameTitleD3O2:
	;		"123456789012345678901"
	dc.b	"December 3 (Evening) ",ETX

SaveGameTitleD3O3:
	;		"123456789012345678901"
	dc.b	"December 3 (Day)     ",ETX

SaveGameTitleD5O1:
	;		"123456789012345678901"
	dc.b	"December 17 (Evening)",ETX

SaveGameTitleD5O2:
	;		"123456789012345678901"
	dc.b	"December 17 (Night)  ",ETX

SaveGameTitleD6O1:
	;		"123456789012345678901"
	dc.b	"December 24 (Day)    ",ETX

SaveGameTitleD6O2:
	;		"123456789012345678901"
	dc.b	"December 24 (Night)  ",ETX

SaveGameTitleD7O1:
	;		"123456789012345678901"
	dc.b	"December 31 (Evening)",ETX

StatusScreenEmptySave:
	;		"123456789012345678901"
	dc.b	"(empty)              ",ETX

StatusScreenDefaultSave:
	dc.b	"{",ETX

StatusScreenSaveDialog:
	dc.b	"Saved",ETX

LoadScreenCaption:
	;		"123456789012345678901"
	dc.b	"Select game to load",ETX

LoadScreenHelp0:
	dc.b	"Press Start to load game",ETX

LoadScreenHelp1:
	dc.b	"Press B to cancel",ETX

;-------------------------------------------------------------------------------
; store names
;-------------------------------------------------------------------------------
StoreName00:
	;		"1234567890123456"
	dc.b	"Video Buffet",ETX

StoreName01:
	;		"1234567890123456"
	dc.b	"Cassette Planet",ETX

StoreName02:
	;		"1234567890123456"
	dc.b	"ThoreauBooks",ETX

StoreName03:
	;		"1234567890123456"
	dc.b	"ClothesNow",ETX

StoreName04:
	;		"1234567890123456"
	dc.b	"Pogo Dawg",ETX

StoreName05:
	;		"1234567890123456"
	dc.b	"Nut Shack",ETX

StoreName06:
	;		"1234567890123456"
	dc.b	"Checkers",ETX

StoreName07:
	;		"1234567890123456"
	dc.b	"The Cavern",ETX

StoreName08:
	;		"1234567890123456"
	dc.b	"Denim Country",ETX

StoreName09:
	;		"1234567890123456"
	dc.b	"Transistor Lodge",ETX

StoreName0A:
	;		"1234567890123456"
	dc.b	"Sunset Video",ETX

StoreName0B:
	;		"1234567890123456"
	dc.b	"Fish or Cut Bait",ETX

StoreName0C:
	;		"1234567890123456"
	dc.b	"Santa's Workshop",ETX

;-------------------------------------------------------------------------------
; legal screen text
;-------------------------------------------------------------------------------

LegalScreenLine00:
	;		"12345678901234567890123456789012345678"
	dc.b	"           Retail Clerk '89           ",ETX
LegalScreenLine01:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2015-2019 Hugues Johnson",ETX
LegalScreenLine02:
	;		"12345678901234567890123456789012345678"
	dc.b	"This demo is not licensed by Sega     ",ETX
LegalScreenLine03:
	;		"12345678901234567890123456789012345678"
	dc.b	"There is no relationship between the  ",ETX
LegalScreenLine04:
	;		"12345678901234567890123456789012345678"
	dc.b	"author of this demo and Sega          ",ETX
LegalScreenLine05:
	;		"12345678901234567890123456789012345678"
	dc.b	"This demo uses the Echo Sound Driver  ",ETX
LegalScreenLine06:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2010-2019               ",ETX
LegalScreenLine07:
	;		"12345678901234567890123456789012345678"
	dc.b	"Javier Degirolmo (sikthehedgehog)     ",ETX
LegalScreenLine08:
	;		"12345678901234567890123456789012345678"
	dc.b	"Inspired by '80s malls but all events,",ETX
LegalScreenLine09:
	;		"12345678901234567890123456789012345678"
	dc.b	"characters, and places are fictitious ",ETX

;-------------------------------------------------------------------------------
; end
;-------------------------------------------------------------------------------
	align 2
