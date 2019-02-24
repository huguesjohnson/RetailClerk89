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

	if _DEBUG_

TitleScreenTextDebug:
	dc.b	"Debug",ETX

TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	"   Unstable Debug Build (March 2019)  ",ETX

	else

TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	"   Story Demo: Days 1-6 (March 2019)  ",ETX
	endif

	if _DEBUG_

	; 28 lines available on the debug screen (28-1 = 1B)

	DebugScreenLine00:
	;		"12345678901234567890123456789012345678"
	dc.b	"Debug starting scene",ETX

	DebugScreenLine01:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 0 title screen",ETX

	DebugScreenLine02:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 0 After demo mission",ETX

	DebugScreenLine03:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 1 title screen",ETX

	DebugScreenLine04:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 1 mid point",ETX

	DebugScreenLine05:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 1 end",ETX

	DebugScreenLine06:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 2 title screen",ETX

	DebugScreenLine07:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 2 mid point",ETX

	DebugScreenLine08:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 2 end",ETX

	DebugScreenLine09:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 3 title",ETX

	DebugScreenLine0A:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 3 mid point",ETX

	DebugScreenLine0B:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 4 title",ETX

	DebugScreenLine0C:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 4 mid point",ETX

	DebugScreenLine0D:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 4 end",ETX

	DebugScreenLine0E:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Day 5 title",ETX

	DebugScreenLine0F:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine10:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine11:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine12:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine13:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine14:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine15:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine16:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine17:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine18:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine19:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine1A:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ (not implemented)",ETX

	DebugScreenLine1B:
	;		"12345678901234567890123456789012345678"
	dc.b	"{ Ending credits",ETX

	endif

;-------------------------------------------------------------------------------
; credits and end screen
;-------------------------------------------------------------------------------
EndScreenTextLine1:
	;		"12345678901234567890123456789012345678"
	dc.b	"Thank you for trying this little demo.",ETX

EndScreenTextLine2:
	;		"12345678901234567890123456789012345678"
	dc.b	"Follow the progress of this project at",ETX

EndScreenTextLine3:
	;		"12345678901234567890123456789012345678"
	dc.b	"https://HuguesJohnson.com/",ETX

EndScreenTextLine4:
	;		"12345678901234567890123456789012345678"
	dc.b	"Look for the final game in stores",ETX

EndScreenTextLine5:
	;		"12345678901234567890123456789012345678"
	dc.b	"sometime around Xmas 2040.",ETX

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
	dc.b	"Story and program by Hugues Johnson",ETX

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
	dc.b	"          3rd Party Graphics          ",ETX

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
	dc.b	"Some text is based on Tragic Marker",ETX

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
	dc.b	"            3rd Party Music           ",ETX

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
	dc.b	"`You know, like",LF
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
	dc.b	"whenever he bothers  ^",FF
	dc.b	"to show up again.",ETX

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
	dc.b	"Did I just see a guy",LF
	dc.b	"walking out with a   ^",FF
	dc.b	"copy of Baby Boomer?",LF
	dc.b	"You're the best sales^",FF
	dc.b	"person I hired this",LF
	dc.b	"season.              ^",FF
	dc.b	"Sorry for being gone a",LF
	dc.b	"while, there was a   ^",FF
	dc.b	"sale at the other end",LF
	dc.b	"of the mall.         ^",FF
	dc.b	"You did fine though so",LF
	dc.b	"get on home.",ETX

	align 2
DialogTextGreenbergScene00Day00Talk:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Don't keep",LF
	dc.b	"that nice young lady ^",FF
	dc.b	"waiting too long.",ETX

	align 2
DialogTextGreenbergScene00Day00Give:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"You're not",LF
	dc.b	"stealing either?     ^",FF
	dc.b	"You're the model",LF
	dc.b	"employee today.",ETX

	align 2 
DialogTextScene00Day00Event0D0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"This is taking",LF
	dc.b	"forever.",ETX

	align 2 
DialogTextScene00Day00Event0D1:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Here, this is the game",LF
	dc.b	"your kid wants.      ^",ETX

	align 2
DialogTextScene00Day00Event0D2:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Baby Boomer?",LF
	dc.b	"That can't be right. ^",FF
	dc.b	"Do you even work",LF
	dc.b	"here?                ^",ETX

	align 2
DialogTextScene00Day00Event0D3:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Trust me. It's",LF
	dc.b	"what all the kids    ^",FF
	dc.b	"are playing today.",LF
	dc.b	"It's really popular. ^",ETX

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
	dc.b	"COM4 using IRQ4?    ^",FFR
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
	dc.b	"Do you have it?     ^",FFR
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
	dc.b	"box or maybe a car.^",FF
	dc.b	"Do you know the one",LF
	dc.b	"I'm talking about?  ^",FFR
	dc.b	"{Oh yeah, that one.",LF
	dc.b	"{It's sold out.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag2R0:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Someone and Iggy vs",LF
	dc.b	"whatever & something.^",FF
	dc.b	"You know all these ",LF
	dc.b	"games, go find it.",ETX

	align 2
DialogTextMaleShopper0Scene00Day00Flag2R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"It's the one with two",LF
	dc.b	"controllers on the TV^",FF
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

DialogTextDaniCarGameEnd:
	;		"1234567890123456789012"
	dc.b	"Do you want to end",LF
	dc.b	"this little demo?    ^",FF
	dc.b	"{Yeah, I'm done",LF
	dc.b	"{Not yet",ETX

DialogTextDaniCarGameEndR0:
	;		"1234567890123456789012"
	dc.b	"OK, come back whenever",LF
	dc.b	"you're ready.",ETX

	align 2
DialogTextDaniWalkingHome:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"In 10 minutes",LF
	dc.b	"you're walking home.",ETX

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
	dc.b	"night and stay warm.",ETX

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
	dc.b	"but it's totally",LF
	dc.b	"empty in here.       ^",FF
	dc.b	"Since Marcy's had that",LF
	dc.b	"fire it's been dead. ^",FF
	dc.b	"Why can't they get a ",LF
	dc.b	"new store to move in?^",FF
	dc.b	"That Santa thing there",LF
	dc.b	"now doesn't count.   ^",FF
	dc.b	"Our store may close f",LF
	dc.b	"sales don't improve.'",ETX

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
	dc.b	"Mall's closing in 5.",LF
	dc.b	"minutes, move along.",ETX

	align 2
DialogTextDay01VBDBDefaultTalk:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I'm stuck",LF
	dc.b	"closing tonight.     ^",FF
	dc.b	"Head over to my store",LF
	dc.b	"after your shift.    ^",FF
	dc.b	"Here's a key so you",LF
	dc.b	"can let yourself in. ^",FF
	dc.b	"Let's share any keys",LF
	dc.b	"we get, just in case.^",FF
	dc.b	"I can make copies of",LF
	dc.b	"them in our garage.  ^",FF
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
	dc.b	"I'm glad you're ",LF
	dc.b	"here. The rest of the^",FF
	dc.b	"staff called in sick. ",LF
	dc.b	"I'm stuck here alone ^",FF
	dc.b	"and starving. Would   ",LF
	dc.b	"you mind watching the^",FF
	dc.b	"store for just a tiny ",LF
	dc.b	"bit? I'll be fast.   ^",FFR
	dc.b	"{Yeah, whatever",LF
	dc.b	"{Give me five minutes",ETX

	align 2
DialogTextDay01Sub00IntroDecline:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Sure, whenever",LF
	dc.b	"you're free is cool.",ETX

	align 2
DialogTextDay01Sub00Start00:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Thanks, I won't ",LF
	dc.b	"be long I promise.   ^",FF
	dc.b	"It's not like there",LF
	dc.b	"are many choices here.",ETX

	align 2
DialogTextDay01Sub00Start01:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Just to warn you,    ",LF
	dc.b	"the customers here  ^",FF
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
	dc.b	"Right, you were      ",LF
	dc.b	"working at the shoe  ^",FF
	dc.b	"store the other day.  ",ETX

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
	dc.b	"go out those doors & ^",FF
	dc.b	"turn right. Keep going",LF
	dc.b	"it'll be to the left.",ETX

	align 2
DialogTextDay01Sub00NPC1D1R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Can you go  ",LF
	dc.b	"see if you have it?",ETX

	align 2
DialogTextDay01Sub00NPC1D1R1Dani:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Well this is a  ",LF
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
	dc.b	"You kids all look",LF
	dc.b	"the same.",ETX

	align 2
DialogTextDay01Sub00NPCD2:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"This is some kind of ",LF
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
	dc.b	"Yes, this store ",LF
	dc.b	"has been in my family^",FF
	dc.b	"for over seven        ",LF
	dc.b	"generations now.    ^",ETX

	align 2
DialogTextDay01Sub00NPC1D2R0NPC:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"OK then.",ETX

	align 2
DialogTextDay01Sub00NPC1D2R1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"Great. I'm  ",LF
	dc.b	"looking for this new ^",FF
	dc.b	"board game. It's this",LF
	dc.b	"real estate game like^",FF
	dc.b	"Monopoly but it's     ",LF
	dc.b	"based on..           ^",ETX

	align 2
DialogTextDay01Sub00NPC1D2R1Dani:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Nope, stop right",LF
	dc.b	"there. We are so not ^",FF
	dc.b	"doing this. You should",LF
	dc.b	"just move along now. ",ETX

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
;	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"All wrong. I",LF
	dc.b	"need something nobody^",FF
	dc.b	"has seen before, this ",LF
	dc.b	"is way too average.",ETX

	align 2
DialogTextDay01Sub00NPC2D2:
;	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Here, this one is,   ",LF
	dc.b	"really something.",ETX

	align 2
DialogTextDay01Sub00NPC2D2NPC:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"What is that",LF
	dc.b	"color? It's not blue,^",FF
	dc.b	"it's not green, I've  ",LF
	dc.b	"never seen it.",ETX

	align 2
DialogTextDay01Sub00NPC2D2Dani:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"It's says it's",LF
	dc.b	"called",CHAR_DQUOTE,"teal",CHAR_DQUOTE,".",ETX

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
	dc.b	"`I don't have forever,",LF
	dc.b	"ring me up already.'",ETX

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
	dc.b	"kipper ties?        ^",FFR
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
	dc.b	"you want to mention? ^",FF
	dc.b	"{Yes of course",LF
	dc.b	"{Please leave",ETX

	align 2
DialogTextDay01Sub00NPC3D3R0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yes, today only",LF
	dc.b	"everything is two    ^",FF
	dc.b	"for the price of two!",ETX

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
	dc.b	"Hey, wait sec!",ETX

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
	dc.b	"Hey wait, my parents ",LF
	dc.b	"will be out of town  ^",FF
	dc.b	"for New Years and they",LF
	dc.b	"said I could have a  ^",FF
	dc.b	"few people over. Why  ",LF
	dc.b	"don't you come by?",ETX

	align 2
DialogTextDay01Sub00End03:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Just as a friend!    ",LF
	dc.b	"Just as a friend!    ^",FF
	dc.b	"You can even bring    ",LF
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
	dc.b	"for on your way out.^",FFR
	dc.b	"[Received",LF
	dc.b	"Mystery Package]",ETX

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
	dc.b	"our stores confused  ^",FF
	dc.b	"all the time, but this",LF
	dc.b	"one isn't for us.    ^",FF
	dc.b	"It's too small, might",LF
	dc.b	"be an old beta tape. ^",FF
	dc.b	"Check back sometime, ",LF
	dc.b	"we get stuff for your^",FF
	dc.b	"store every once a",LF
	dc.b	"week or so.",ETX

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
	dc.b	"It's a replacement",LF
	dc.b	"tape for our security^",FF
	dc.b	"system. The old one ",LF
	dc.b	"is so worn out that  ^",FF
	dc.b	"we couldn't see who.. ",LF
	dc.b	"nevermind. Thanks.",ETX

	align 2
DialogTextDay01End:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"You're just in time",LF
	dc.b	"for once. I'm done   ^",FF
	dc.b	"closing out the",LF
	dc.b	"register. Let's get  ^",FF
	dc.b	"home before it's too",LF
	dc.b	"cold outside.",ETX

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
	dc.b	"getting by alright. ^",FF
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

;-------------------------------------------------------------------------------
; dialog text - day 02
;-------------------------------------------------------------------------------
	align 2
DialogTextScriptedEventDay02Start:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"We're out of quarters",LF
	dc.b	"& no one on this end ^",FF
	dc.b	"of the mall had any to",LF
	dc.b	"spare. Why don't you ^",FF
	dc.b	"try other stores. You",LF
	dc.b	"might have good luck.^",FF
	dc.b	"By the way, when I",LF
	dc.b	"stopped over at the  ^",FF
	dc.b	"bookstore your friend",LF
	dc.b	"asked me to tell you ^",FF
	dc.b	"to come over to talk",LF
	dc.b	"about something.     ^",FF
	dc.b	"Anyway here's $10, see",LF
	dc.b	"if anyone has change.^",FFR
	dc.b	"[Received $10 bill]",ETX

	align 2
DialogTextCavernStaffDay02Sub00:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"You're from that video",LF
	dc.b	"game store right?    ^",FF
	;		"1234567890123456789012"
	dc.b	"First you steal all my",LF
	dc.b	"business now you want^",FF
	;		"1234567890123456789012"
	dc.b	"all my change too? I'm",LF
	dc.b	"not the bank kid.    ^",FF
	;		"1234567890123456789012"
	dc.b	"...",LF
	dc.b	"                     ^",FF
	;		"1234567890123456789012"
	dc.b	"Sorry, I'm cranky from",LF
	dc.b	"working too long.    ^",FF
	;		"1234567890123456789012"
	dc.b	"Here, have a roll of",LF
	dc.b	"quarters.            ^",FF
	;		"1234567890123456789012"
	dc.b	"Do yourself a favor &",LF
	dc.b	"don't work too hard. ^",FF
	;		"1234567890123456789012"
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
	;		"1234567890123456789012"
	dc.b	"I have to leave early",LF
	dc.b	"but I think you can  ^",FF
	;		"1234567890123456789012"
	dc.b	"handle closing on your",LF
	dc.b	"own. Here's a key so ^",FF
	;		"1234567890123456789012"
	dc.b	"you can lock up. Don't",LF
	dc.b	"worry, it'll be fine.",ETX

	align 2
DialogTextDay02Transition00:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"I thought you said",LF
	dc.b	"D.B. was meeting you ^",FF
	dc.b	"here an hour ago?",LF
	dc.b	"Your shift is over.",ETX

	align 2
DialogTextDay02Transition01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"He probably got lost.",ETX

	align 2
DialogTextDay02SubsNotComplete:
	;		"1234567890123456789012"
	dc.b	"There are still things",LF
	dc.b	"you need to finish.",ETX

	align 2
DialogTextTBooksStaffDay02TalkSub01NotStarted:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"We have a problem. You",LF
	dc.b	"& Dani are the only  ^",FF
	;		"1234567890123456789012"
	dc.b	"ones I trust to help.",LF
	dc.b	"I think there's a pro^",FF
	;		"1234567890123456789012"
	dc.b	"shoplifter working",LF
	dc.b	"this mall. We got hit^",FF
	;		"1234567890123456789012"
	dc.b	"by them. When I took",LF
	dc.b	"inventory some pricey^",FF
	;		"1234567890123456789012"
	dc.b	"science books were",LF
	dc.b	"missing. I think they^",FF
	;		"1234567890123456789012"
	dc.b	"are being resold. I'm",LF
	dc.b	"stuck alone today so ^",FF
	;		"1234567890123456789012"
	dc.b	"I need you to ask the",LF
	dc.b	"other stores if they ^",FF
	;		"1234567890123456789012"
	dc.b	"were hit. Let me know",LF
	dc.b	"everything you heard.",ETX

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
	dc.b	"Thanks for looking ",LF
	dc.b	"into this. It's odd. ^",FF
	;		"1234567890123456789012"
	dc.b	"I don't see any real",LF
	dc.b	"connection between   ^",FF
	;		"1234567890123456789012"
	dc.b	"these missing items.",LF
	dc.b	"                     ^",FF
	;		"1234567890123456789012"
	dc.b	"We need to keep an eye",LF
	dc.b	"on this for a while. ^",FF
	;		"1234567890123456789012"
	dc.b	"I don't remember ever",LF
	dc.b	"giving you a key.    ^",FF
	;		"1234567890123456789012"
	dc.b	"Here, take one now &",LF
	dc.b	"stop by to borrow    ^",FF
	;		"1234567890123456789012"
	dc.b	"whatever you like",LF
	dc.b	"after the mall closes.",ETX

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
	dc.b	"Anything missing? Not",LF
	dc.b	"that I've seen.",ETX

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
	dc.b	"Nothing's been stolen",LF
	dc.b	"but we are missing a ^",FF
	;		"1234567890123456789012"
	dc.b	"shipment. It's for the",LF
	dc.b	"new line of police   ^",FF
	;		"1234567890123456789012"
	dc.b	"scanners. They support",LF
	dc.b	"over 20K frequencies,^",FF
	;		"1234567890123456789012"
	dc.b	"extended warranty ",LF
	dc.b	"available for $20.   ^",FF
	;		"1234567890123456789012"
	dc.b	"I assumed they shipped",LF
	dc.b	"to the wrong store.",ETX

	align 2
DialogTextCavernStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"Stolen items? Yeah",LF
	dc.b	"some guy just took a ^",FF
	dc.b	"roll of quarters from",LF
	dc.b	"me. I don't suppose  ^",FF
	dc.b	"you know anything",LF
	dc.b	"about that?",ETX

	align 2
DialogTextSVideoStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"Nothing is missing",LF
	dc.b	"from the shelves but ^",FF
	dc.b	"there is something",LF
	dc.b	"weird here. Movies   ^",FF
	dc.b	"that don't sell get",LF
	dc.b	"thrown out but first ^",FF
	dc.b	"we run them through ",LF
	dc.b	"a tape eraser. Keeps ^",FF
	dc.b	"the dumpster divers",LF
	dc.b	"away. Well overnight ^",FF
	dc.b	"someone broke in and",LF
	dc.b	"stole the eraser     ^",FF
	dc.b	"out of our backroom.",LF
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
	dc.b	"There are some boy",LF
	dc.b	"band CDs that I wish ^",FF
	dc.b	"would get stolen. Go",LF
	dc.b	"ahead and take them.",ETX

	align 2
DialogTextCNowStaffDay02Sub01Talk:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"Nothing's missing from",LF
	dc.b	"here but this reminds^",FF
	dc.b	"me of a story from",LF
	dc.b	"last summer..        ^",FF
	dc.b	"[30 minutes pass]",LF
	dc.b	"                     ^",FF
	dc.b	".. he never said why",LF
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
	dc.b	"I swear someone has  ^",FF
	dc.b	"been stealing from us",LF
	dc.b	"at night. In the     ^",FF
	dc.b	"morning we always seem",LF
	dc.b	"to be missing a few  ^",FF
	dc.b	"small things we locked",LF
	dc.b	"up at close. I was   ^",FF
	dc.b	"worried about rodents",LF
	dc.b	"but could it be a    ^",FF
	dc.b	"person taking things",LF
	dc.b	"overnight?",ETX

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
	dc.b	"There was secret",LF
	dc.b	"shopper here last    ^",FF
	;		"1234567890123456789012"
	dc.b	"week & our review was",LF
	dc.b	"amazing. We're all   ^",FF
	;		"1234567890123456789012"
	dc.b	"getting a big bonus.",LF
	dc.b	"I'm spending mine to ^",FF
	;		"1234567890123456789012"
	dc.b	"make my New Years",LF
	dc.b	"party the best ever.",ETX

	align 2
DialogTextCheckersStaffDay02DaniTalkMid:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"I guess we had a ",LF
	dc.b	"secret shopper last  ^",FF
	;		"1234567890123456789012"
	dc.b	"week. I don't remember",LF
	dc.b	"them at all.         ^",FF
	;		"1234567890123456789012"
	dc.b	"We did OK I guess. It",LF
	dc.b	"could have been worse.",ETX

	align 2
DialogTextCheckersStaffDay02DaniTalkBad:
	dc.w	OBJ_NPC_CHECKERS_STAFF
	;		"1234567890123456789012"
	dc.b	"Be careful at your",LF
	dc.b	"store. We just got a ^",FF
	;		"1234567890123456789012"
	dc.b	"really bad secret",LF
	dc.b	"shopper review here. ^",FF
	;		"1234567890123456789012"
	dc.b	"Now we all have to",LF
	dc.b	"take extra training.",ETX

	align 2
ScriptedEventDay02Mid00:
	dc.w	OBJ_NPC_FEMALE_SHOPPER0
	;		"1234567890123456789012"
	dc.b	"I can't decide which",LF
	dc.b	"game system to get my^",FF
	;		"1234567890123456789012"
	dc.b	"kids. They want the",LF
	dc.b	"new 16-bit one. Is it^",FF
	;		"1234567890123456789012"
	dc.b	"this Turbo 16 one or",LF
	dc.b	"the Sega Gemini?",ETX

	align 2
ScriptedEventDay02Mid01:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"Yeah. The TuboGrafx",LF
	dc.b	"has 16 right there   ^",FF
	;		"1234567890123456789012"
	dc.b	"in the name & is $10",LF
	dc.b	"cheaper making it the^",FF
	;		"1234567890123456789012"
	dc.b	"more family budget",LF
	dc.b	"friendly option.",ETX

	align 2
ScriptedEventDay02Mid02:
	dc.w	OBJ_NPC_FEMALE_SHOPPER0
	;		"1234567890123456789012"
	dc.b	"Wow, that's exactly",LF
	dc.b	"what I wanted hear.  ^",FF
	;		"1234567890123456789012"
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
	dc.b	"You have to believe me",LF
	dc.b	"on this. In a year   ^",FF
	;		"1234567890123456789012"
	dc.b	"you won't be able to",LF
	dc.b	"find any games for   ^",FF
	;		"1234567890123456789012"
	dc.b	"that thing. It'll be ",LF
	dc.b	"complete waste.      ^",FF
	;		"1234567890123456789012"
	dc.b	"I can't tell you how I",LF
	dc.b	"know this, I just do.^",FF
	;		"1234567890123456789012"
	dc.b	"And if you don't",LF
	dc.b	"listen to me your    ^",FF
	;		"1234567890123456789012"
	dc.b	"kids will eventually",LF
	dc.b	"be very disappointed.",ETX

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
	;		"1234567890123456789012"
	dc.b	"You need to mind your",LF
	dc.b	"own business.",ETX

	align 2
ScriptedEventDay02Mid08:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"I.. I'm sorry, I just",LF
	dc.b	"don't like to see    ^",FF
	;		"1234567890123456789012"
	dc.b	"people make mistakes",LF
	dc.b	"they can't undo.",ETX

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
	;		"1234567890123456789012"
	dc.b	"Why are you looking at",LF
	dc.b	"me like that?        ^",FF
	;		"1234567890123456789012"
	dc.b	"OK, fine. I was asleep",LF
	dc.b	"for the past hour.",ETX

	align 2
DialogTextFCBFirearmsStaffDay02Sub02Talk:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"That guy never talks",LF
	dc.b	"to me.               ^",FF
	;		"1234567890123456789012"
	dc.b	"I don't care where he",LF
	dc.b	"is.",ETX

	align 2
DialogTextFCBFishingStaffDay02Sub02Talk:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"I haven't seen him",LF
	dc.b	"since he went on his ^",FF
	;		"1234567890123456789012"
	dc.b	"30-minute break. He's",LF
	dc.b	"usually back by now.",ETX

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
	;		"1234567890123456789012"
	dc.b	"He must be somewhere",LF
	dc.b	"else in the mall.",ETX

	align 2
ScriptedEventDay02Sub02Mid00:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Hey, you can mess up",LF
	dc.b	"your own store all   ^",FF
	;		"1234567890123456789012"
	dc.b	"you want by leave my",LF
	dc.b	"brother alone.       ^",FF
	;		"1234567890123456789012"
	dc.b	"He's trying to save",LF
	dc.b	"for college and can't^",FF
	;		"1234567890123456789012"
	dc.b	"afford to lose",LF
	dc.b	"another job.",ETX

	align 2
ScriptedEventDay02Sub02Mid01:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"OK, I'm sorry.",LF
	dc.b	"I just..             ^",FF
	dc.b	"It won't happen again.",ETX

	align 2
ScriptedEventDay02Sub02End00:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Alright, I found him.",LF
	dc.b	"Let me know if he    ^",FF
	;		"1234567890123456789012"
	dc.b	"bugs you again. Finish",LF
	dc.b	"closing & let's leave.",ETX

	align 2
ScriptedEventDay02Sub02End01:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"ok.. so F9 then 'Y'.",LF
	dc.b	"I think that's right.",ETX

	align 2
DialogTextDaniScene05Day02:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"That was some day.",LF
	dc.b	"Pretty typical for   ^",FF
	dc.b	"this time of year",LF
	dc.b	"though. Let's go.",ETX

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
	dc.b	"Hey, are you still",LF
	dc.b	"interested in finding^",FF
	dc.b	"missing items from",LF
	dc.b	"stores?              ^",FFR
	dc.b	"{Go on...",LF
	dc.b	"{Maybe later",ETX

	align 2
DialogTextScene09Day03IntroR0:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"We had a shipment of 4",LF
	dc.b	"spy cameras get lost.^",FF
	;		"1234567890123456789012"
	dc.b	"They're a hot Xmas",LF
	dc.b	"gift this year.      ^",FF
	;		"1234567890123456789012"
	dc.b	"Extended warranty",LF
	dc.b	"available for $15.   ^",FF
	;		"1234567890123456789012"
	dc.b	"I thought they were",LF
	dc.b	"gone for good.       ^",FF
	;		"1234567890123456789012"
	dc.b	"The other day I went",LF
	dc.b	"to make a call and   ^",FF
	;		"1234567890123456789012"
	dc.b	"I saw one hidden by",LF
	dc.b	"the phone booths.    ^",FF
	;		"1234567890123456789012"
	dc.b	"Someone's using it to",LF
	dc.b	"spy on people here.  ^",FF
	;		"1234567890123456789012"
	dc.b	"I can't leave today to",LF
	dc.b	"look for the other 3.^",FF
	;		"1234567890123456789012"
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
	dc.b	"cameras hidden around^",FF
	dc.b	"the mall if my theory",LF
	dc.b	"is correct.",ETX

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
	dc.b	"camera out there.",ETX

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
	dc.b	"Hey, there's something",LF
	dc.b	"under the bench..",FF
	dc.b	"(Found Camera)",LF
	dc.b	"",ETX

DialogTextDay03FindCamera2:
	;		"1234567890123456789012"
	dc.b	"You dig through the",LF
	dc.b	"plant for a minute..",FF
	dc.b	"(Found Camera)",LF
	dc.b	"",ETX

DialogTextDay03FindCamera3:
	;		"1234567890123456789012"
	dc.b	"There's something",LF
	dc.b	"hidden in this pot..",FF
	dc.b	"(Found Camera)",LF
	dc.b	"",ETX

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
	dc.b	"Feel free to use the",LF
	dc.b	"computer or borrow   ^",FF
	dc.b	"anything you want",LF
	dc.b	"after hours.         ^",FF
	dc.b	"I don't understand why",LF
	dc.b	"someone wants to spy ^",FF
	dc.b	"on the mall. Nothing",LF
	dc.b	"exciting happens here.",ETX

	align 2
DialogTextDay03ScriptedEventMid01:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, yeah. So like,",LF
	dc.b	"that dude. Todd.     ^",FF
	dc.b	"He was just at, where",LF
	dc.b	"was it again? Uh..   ^",FF
	dc.b	"That place I work with",LF
	dc.b	"the food. He said you^",FF
	dc.b	"were watching his",LF
	dc.b	"store for him.       ^",FF
	dc.b	"So like, do you help",LF
	dc.b	"with other stuff too?",ETX

	align 2
DialogTextDay03ScriptedEventMid02:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"That was two weeks  ",LF
	dc.b	"ago.",ETX

	align 2
DialogTextDay03ScriptedEventMid03:
	dc.w	OBJ_NPC_POGODAWG_STAFF
	;		"1234567890123456789012"
	dc.b	"Huh. Yeah. Dude, yeah",LF
	dc.b	"OK. So we're going to^",FF
	dc.b	"close at the end of,",LF
	dc.b	"uh, the month, if we ^",FF
	dc.b	"don't get more, what",LF
	dc.b	"are they called?     ^",FF
	dc.b	"Right, customers. Can",LF
	dc.b	"you help get people  ^",FF
	dc.b	"to like eat at our",LF
	dc.b	"restaurant more?",ETX

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
	dc.b	"Oh. Uh. Thanks. So we",LF
	dc.b	"have, like, I think ^",FF
	dc.b	"until the end of the",LF
	dc.b	"month or we'll close.",ETX

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
	dc.b	"Where's D.B.? Oh, I",LF
	dc.b	"sent him to find that^",FF
	;		"1234567890123456789012"
	dc.b	"young man's parent so",LF
	dc.b	"we can close. I think^",FF
	;		"1234567890123456789012"
	dc.b	"they must work in the",LF
	dc.b	"mall and their sitter^",FF
	;		"1234567890123456789012"
	dc.b	"canceled. Here's been",LF
	dc.b	"here quite a while.  ^",FF
	;		"1234567890123456789012"
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
	dc.b	"Oh Billy? He's my",LF
	dc.b	"grandson. His parents^",FF
	;		"1234567890123456789012"
	dc.b	"had tickets to a show",LF
	dc.b	"tonight & asked me to^",FF
	;		"1234567890123456789012"
	dc.b	"watch him. He would",LF
	dc.b	"have been so bored   ^",FF
	;		"1234567890123456789012"
	dc.b	"here so I sent him to",LF
	dc.b	"the game store.      ^",FF
	;		"1234567890123456789012"
	dc.b	"I hope he didn't get",LF
	dc.b	"in the way too badly.^",FF
	;		"1234567890123456789012"
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
	dc.b	"I'm just glad they ",LF
	dc.b	"weren't ditched here.",ETX

	align 2
DialogTextTLodgeStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_TLODGE_STAFF
	;		"1234567890123456789012"
	dc.b	"That's definitely not",LF
	dc.b	"my kid.              ^",FF
	;		"1234567890123456789012"
	dc.b	"While you're here, any",LF
	dc.b	"interest in a new PC?",ETX

	align 2
DialogTextCavernStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"If I had kids I sure",LF
	dc.b	"wouldn't leave them  ^",FF
	dc.b	"unsupervised here.",LF
	dc.b	"There are some real  ^",FF
	dc.b	"unsavory types that",LF
	dc.b	"hang around this mall.",ETX

	align 2
DialogTextSVideoStaffDay03SubVBTalk:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"I think he was ditched",LF
	dc.b	"here once too.       ^",FF
	dc.b	"I don't know who left",LF
	dc.b	"him here though.",ETX

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
	dc.b	"Kids are great but I ",LF
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
	dc.b	"Everyone is trying to^",FF
	dc.b	"close now so let's get",LF
	dc.b	"out of here already.",ETX

	align 2
DialogTextDay03Scene02Action00NPCDB:
	;		"1234567890123456789012"
	dc.b	"(Why is he searching",LF
	dc.b	"here anyway?)",ETX

	align 2
DialogTextDay03Scene07NPCGuard:
	dc.w	OBJ_NPC_GUARD0
	;		"1234567890123456789012"
	dc.b	"Finish up your",LF
	dc.b	"business & leave.",ETX

	align 2
DialogTextDaniScene05Day03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"I hear you're playing",LF
	dc.b	"detective now.       ^",FF
	dc.b	"Don't get yourself",LF
	dc.b	"into any trouble.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 04
;------------------------------------------------------------------------------

	align 2
DialogTextScriptedEventDay04Start00:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
	;		"1234567890123456789012"
	dc.b	"Hey, I got that Todd",LF
	dc.b	"guy in the employee  ^",FF
	dc.b	"Secret Santa Exchange.",LF
	dc.b	"You went to high     ^",FF
	dc.b	"school with him right?",LF
	dc.b	"What should I get him?",ETX

	align 2
DialogTextScriptedEventDay04Start01:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"A clue would be a",LF
	dc.b	"good start.",ETX

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
	dc.b	"we could really use  ^",FF
	dc.b	"one more person. Do",LF
	dc.b	"you think you could  ^",FF
	dc.b	"find one more person",LF
	dc.b	"to sign-up today?",ETX

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
	dc.b	"When you find the ",LF
	dc.b	"perfect gift please  ^",FF
	dc.b	"give it to me. I'll",LF
	dc.b	"take care of the rest.",ETX

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
	dc.b	"(Received Envelope)",ETX

	align 2
DialogTextDay04Scene03SubChoose1:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Interesting pick.",LF
	dc.b	"Good luck!           ^",FFR
	dc.b	"(Received Envelope)",ETX

	align 2
DialogTextDay04Scene03SubStartGift0:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"The rules are simple,",LF
	dc.b	"find a gift for the  ^",FF
	dc.b	"name in your envelope.",LF
	dc.b	"Then give it to me.  ^",FF
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
	dc.b	"Are you interested in ",LF
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
	dc.b	"your store for my    ^",FF
	dc.b	"Secret Santa gift. So",LF
	dc.b	"how about you take   ^",FF
	dc.b	"whatever you need from",LF
	dc.b	"here for your gift   ^",FF
	dc.b	"in exchange? Consider",LF
	dc.b	"it an even trade.",ETX

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
	dc.b	"whatever you want.   ^",FF
	dc.b	"If you change your",LF
	dc.b	"mind about a book    ^",FF
	dc.b	"give it to me and I'll",LF
	dc.b	"put it back.",ETX

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
DialogTextDay04Scene03StartSub:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"OK, here's how it",LF
	dc.b	"works. Inside these  ^",FF
	dc.b	"envelopes are the",LF
	dc.b	"names of who you are ^",FF
	dc.b	"finding gifts for.",LF
	dc.b	"Once you find a gift ^",FF
	dc.b	"bring it back here.",LF
	dc.b	"Which do you want?   ^",FF
	dc.b	"{Envelope 1",LF
	dc.b	"{Envelope 2",ETX

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
	dc.b	"The gift exchange",LF
	dc.b	"went perfectly!      ^",FF
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
	dc.b	"Gift exchange? Were",LF
	dc.b	"you replaced with a  ^",FF
	dc.b	"clone overnight?",LF
	dc.b	"I'm probably alone   ^",FF
	dc.b	"tonight so I can't",LF
	dc.b	"help with all of that.",ETX

	align 2
DialogTextDBDay04SubFindGift:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Hey, I'm taking ",LF
	dc.b	"something for this   ^",FF
	dc.b	"gift exchange. I",LF
	dc.b	"assume you don't care.",ETX

	align 2
DialogTextTBooksStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_TBOOKS_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm already in the ",LF
	dc.b	"gift exchange.       ^",FF
	dc.b	"Feel free to grab",LF
	dc.b	"something from here  ^",FF
	dc.b	"when you're looking",LF
	dc.b	"for a gift.",ETX

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
	dc.b	"I'm signed-up for it",LF
	dc.b	"already.",ETX

	align 2
DialogTextNShackStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_NSHACK_STAFF
	;		"1234567890123456789012"
	dc.b	"It sounds interesting",LF
	dc.b	"but I never know     ^",FF
	dc.b	"what to get people so",LF
	dc.b	"I'll pass this time.",ETX

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
	dc.b	"Whoever got my name",LF
	dc.b	"better get it right.",ETX

	align 2
DialogTextCNowStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_CNOW_STAFF
	;		"1234567890123456789012"
	dc.b	"I'm in already, I love",LF
	dc.b	"presents. Last year..^",FF
	dc.b	"(30 minutes later)",LF
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

DialogTextSouthCenterStaffDay04SubFindNPC:
	dc.w	OBJ_NPC_FCBCAMPING_STAFF
	;		"1234567890123456789012"
	dc.b	"Too late, I signed-up",LF
	dc.b	"this morning.",ETX

	align 2
DialogTextWorkshopStaff0Day04SubFindNPC:
	dc.w	OBJ_NPC_WORKSHOP_STAFF0
	;		"1234567890123456789012"
	dc.b	"I'm already signed-up,",LF
	dc.b	"don't know when I'll ^",FF
	dc.b	"get a long enough",LF
	dc.b	"break to shop.",ETX

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
	;		"1234567890123456789012"
	dc.b	"definitely not me,   ^",FF
	;		"1234567890123456789012"
	dc.b	"got your name in the",LF
	;		"1234567890123456789012"
	dc.b	"Secret Santa exchange.",ETX

	align 2
DialogTextSVideoStaffDay04SubFindGift1:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"You mean D.B.? He",LF
	;		"1234567890123456789012"
	dc.b	"seems nice.          ^",FF
	;		"1234567890123456789012"
	dc.b	"Is he really just a",LF
	;		"1234567890123456789012"
	dc.b	"senior?",ETX

	align 2
DialogTextSVideoStaffDay04SubFindGift2:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Yeah, he might even",LF
	;		"1234567890123456789012"
	dc.b	"graduate this year.  ^",FF
	;		"1234567890123456789012"
	dc.b	"So what do you want",LF
	;		"1234567890123456789012"
	dc.b	"anyway?",ETX

	align 2
DialogTextSVideoStaffDay04SubFindGift3:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"I just started junior",LF
	;		"1234567890123456789012"
	dc.b	"college in August.   ^",FF
	;		"1234567890123456789012"
	dc.b	"I'm thinking of",LF
	;		"1234567890123456789012"
	dc.b	"majoring in math or  ^",FF
	;		"1234567890123456789012"
	dc.b	"computer science.",LF
	;		"1234567890123456789012"
	dc.b	"I can't decide.      ^",FF
	;		"1234567890123456789012"
	dc.b	"I'm really interested",LF
	;		"1234567890123456789012"
	dc.b	"in both right now.",ETX

	align 2
DialogTextSVideoStaffDay04SubFindGift4:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"OK, maybe he can",LF
	;		"1234567890123456789012"
	dc.b	"manage that.",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift0:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Hey so that Secret",LF
	;		"1234567890123456789012"
	dc.b	"Santa exchange,      ^",FF
	dc.b	"It's really dumb",LF
	;		"1234567890123456789012"
	dc.b	"right?",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift1:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"Yeah, I only signed-up",LF
	;		"1234567890123456789012"
	dc.b	"as a joke.           ^",FF
	;		"1234567890123456789012"
	dc.b	"You know, to mess with",LF
	;		"1234567890123456789012"
	dc.b	"people.",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift2:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Of course. So my",LF
	;		"1234567890123456789012"
	dc.b	"brother, not me,     ^",FF
	;		"1234567890123456789012"
	dc.b	"signed-up and got your",LF
	;		"1234567890123456789012"
	dc.b	"name. He's kind of   ^",FF
	;		"1234567890123456789012"
	dc.b	"useless so could you",LF
	;		"1234567890123456789012"
	dc.b	"give me an idea..    ^",FF
	;		"1234567890123456789012"
	dc.b	"For him, not me.",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift3:
	dc.w	OBJ_NPC_CPLANET_STAFF
	;		"1234567890123456789012"
	dc.b	"Anything that's dark",LF
	;		"1234567890123456789012"
	dc.b	"and mysterious,      ^",FF
	;		"1234567890123456789012"
	dc.b	"Like my heart.",ETX

	align 2
DialogTextCPlanetStaffDay04SubFindGift4:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"OK, yeah, he'll figure",LF
	;		"1234567890123456789012"
	dc.b	"something out I guess.",ETX

	align 2
DialogTextDay04ScriptedEventTransition:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"Alright, I'm just",LF
	dc.b	"about done closing.  ^",FF
	dc.b	"Go ahead and leave for",LF
	dc.b	"the night.           ^",FF
	dc.b	"I'll take care of",LF
	dc.b	"cleaning-up tonight  ^",FF
	dc.b	"Since you were alone",LF
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
	dc.b	"Dani just left a ",LF
	dc.b	"second ago.",ETX

	align 2
DialogTextTLodgeStaffDay04MallClosed:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"I have to stop by the",LF
	dc.b	"info desk before they^",FF
	dc.b	"leave to see what I ",LF
	dc.b	"got in the exchange.",ETX

	align 2
DialogTextCenterStaffDay04MallClosed:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Please tell your",LF
	dc.b	"sister to stop by &  ^",FF
	dc.b	"pick-up her Secret",LF
	dc.b	"Santa gift soon.",ETX

	align 2
DialogTextSouthCenterStaffDay04MallClosed:
	dc.w	OBJ_NPC_SOUTH_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I hope security finds",LF
	dc.b	"the person who's been^",FF
	dc.b	"stealing from us",LF
	dc.b	"overnight.",ETX

	align 2
DialogTextDaniScene05Day04:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"Don't ask about it,",LF
	dc.b	"let's just go.",ETX

;-------------------------------------------------------------------------------
; dialog text - day 05
;-------------------------------------------------------------------------------
	align 2
DialogTextDaniScene05Day05:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2",ETX

;-------------------------------------------------------------------------------
; dialog text - day 06
;-------------------------------------------------------------------------------
	align 2
DialogTextDaniScene05Day06:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2",ETX

;-------------------------------------------------------------------------------
; dialog text - day 07
;-------------------------------------------------------------------------------
	align 2
DialogTextDaniScene05Day07:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2",ETX

;-------------------------------------------------------------------------------
; information desk
;-------------------------------------------------------------------------------

	align 2
DialogTextInfoDeskDay00R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Santa's Workshop just",LF
	dc.b	"opened this morning. ^",FF
	dc.b	"It was already very",LF
	dc.b	"busy there today.",ETX

	align 2
DialogTextInfoDeskDay00R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"This is exciting! The",LF
	dc.b	"mall will be open at ^",FF
	dc.b	"6:00 AM on Black",LF
	dc.b	"Friday this year.",ETX

	align 2
DialogTextInfoDeskDay00R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"The first Fish or Cut",LF
	dc.b	"Bait store in our    ^",FF
	dc.b	"area is open now. They",LF
	dc.b	"have this fun gimmick^",FF
	dc.b	"where their staff",LF
	dc.b	"dress as lumberjacks.",ETX

	align 2
DialogTextInfoDeskDay00R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"I really shouldn't",LF
	dc.b	"tell you this but..  ^",FF
	dc.b	"One store here isn't",LF
	dc.b	"doing well & might be^",FF
	dc.b	"sold next year. Don't",LF
	dc.b	"tell anyone please.",ETX

	align 2
DialogTextInfoDeskDay01R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"It's secret shopper",LF
	dc.b	"at the mall. All our ^",FF
	dc.b	"stores are being rated",LF
	dc.b	"by undercover experts.",ETX

	align 2
DialogTextInfoDeskDay01R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"We're trying to ",LF
	dc.b	"organize a really fun^",FF
	dc.b	"Secret Santa exchange",LF
	dc.b	"for mall employees.  ^",FF
	dc.b	"Sign-ups start next",LF
	dc.b	"week, please join us!",ETX

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
	dc.b	"December weekend ",LF
	dc.b	"hours start soon.    ^",FF
	dc.b	"All stores will stay",LF
	dc.b	"open until 10:00.",ETX

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
	dc.b	"Transistor Lodge is ",LF
	dc.b	"getting all kinds of ^",FF
	dc.b	"exciting new products",LF
	dc.b	"just in time for Xmas.",ETX

	align 2
DialogTextInfoDeskDay02R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"You're friends with",LF
	dc.b	"Charles right?       ^",FF
	;		"1234567890123456789012"
	dc.b	"It's not my business",LF
	dc.b	"but he seems really  ^",FF
	;		"1234567890123456789012"
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
	dc.b	"exchange! I'll be fun!",ETX

	align 2
DialogTextInfoDeskDay03R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"Transistor Lodge is ",LF
	dc.b	"expecting some really^",FF
	dc.b	"exciting new items",LF
	dc.b	"this month!          ^",FF
	dc.b	"You should go see what",LF
	dc.b	"they have!",ETX

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
	dc.b	"day 05 mall news ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay05R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 05 events ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay05R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 05 store news ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay05R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 05 rumors ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay06R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 06 mall news ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay06R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 06 events ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay06R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 06 store news ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay06R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 06 rumors ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay07R0:	; mall news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 07 mall news ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay07R1:	; events
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 07 events ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay07R2:	; store news
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 07 store news ",LF
	dc.b	"",ETX

	align 2
DialogTextInfoDeskDay07R3:	; rumors
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"1234567890123456789012"
	dc.b	"day 07 rumors ",LF
	dc.b	"",ETX

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
	dc.b	"get you kicked out.",ETX

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
	dc.b	"an oldies station.",ETX

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
	dc.b	"Here are the new and",LF
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
	dc.b	"`So what's your deal?'",ETX

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
	dc.b	"that you're staring.",ETX

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
DialogTextCavernStaffDefaultTalk:
	dc.w	OBJ_NPC_CAVERN_STAFF
	;		"1234567890123456789012"
	dc.b	"What do you need?",ETX

	align 2
DialogTextSVideoStaffDefaultTalk:
	dc.w	OBJ_NPC_SVIDEO_STAFF
	;		"1234567890123456789012"
	dc.b	"If you're looking for",LF
	dc.b	"a specific movie we  ^",FF
	dc.b	"probably have it.",ETX

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
	dc.b	"happened today!'     ^",FF
	dc.b	"(30 minutes later)",LF
	dc.b	"                     ^",FF
	dc.b	"'..and that's why I'm ",LF
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
	dc.b	"Are you going to buy",LF
	dc.b	"something or are you ^",FF
	dc.b	"just here to annoy",LF
	dc.b	"me?",ETX

	align 2
DialogTextFCBFirearmsStaffDefaultTalk:
	dc.w	OBJ_NPC_FCBFIREARMS_STAFF
	;		"1234567890123456789012"
	dc.b	"There's no better",LF
	dc.b	"gift for someone you ^",FF
	dc.b	"care about than a new",LF
	dc.b	"RK62 rifle.",ETX

	align 2
DialogTextFCBFishingStaffDefaultTalk:
	dc.w	OBJ_NPC_FCBFISHING_STAFF
	;		"1234567890123456789012"
	dc.b	"Ice fishing season is",LF
	dc.b	"almost here. We have ^",FF
	dc.b	"everything you need",LF
	dc.b	"to catch a ton.",ETX

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
	dc.b	"Good evening.",ETX

	align 2
DialogTextWorkshopStaff0DefaultTalk:
	dc.w	OBJ_NPC_WORKSHOP_STAFF0
	;		"1234567890123456789012"
	dc.b	"Sorry, only children",LF
	dc.b	"under 12 can take    ^",FF
	dc.b	"photos with Santa.",ETX

	align 2
DialogTextWorkshopStaff1DefaultTalk:
	dc.w	OBJ_NPC_WORKSHOP_STAFF1
	;		"1234567890123456789012"
	dc.b	"Aren't you supposed",LF
	dc.b	"to have a kid with   ^",FF
	dc.b	"you to visit Santa?",ETX

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

	align 2
InfoDeskMenu:
	dc.w	OBJ_NPC_CENTER_STAFF
	;		"{1234567890{1234567890"	
	dc.b	"What do you want to",LF
	dc.b	"know about today?    ^",FFR
	dc.b	"{Mall news {Store news",LF
	dc.b	"{Events    {Rumors",ETX

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
	dc.w	OBJ_NPC_WORKSHOP_STAFF0
	;		"1234567890123456789012"
	dc.b	"What do you want me",LF
	dc.b	"to do with that?",ETX

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
	dc.b	"Cooking books",OBJNAMEEND

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
	dc.b	"Fighting, driving, and",LF
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
	dc.b	"The 'Last Battle', we",LF
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
	dc.b	"Includes the modem and",LF
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
	dc.b	"Camera",ITEMNAMEEND

ItemDescriptionCamera1:
	;		"1234567890123456789012"
	dc.b	"This was hidden under",LF
	dc.b	"a bench by your store.",ETX

ItemNameCamera2:
	;		"1234567890"
	dc.b	"Camera",ITEMNAMEEND

ItemDescriptionCamera2:
	;		"1234567890123456789012"
	dc.b	"This was hidden in the",LF
	dc.b	"easternmost hallway.",ETX

ItemNameCamera3:
	;		"1234567890"
	dc.b	"Camera",ITEMNAMEEND

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
	;		"1              234567890123456"
	dc.b	"",CHAR_DQUOTE,"New paranormal",LF
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
	dc.b	"Trading Items",ETX

Day01IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Each store has items than can be traded",ETX

Day01IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"You can take items from your store",ETX

Day01IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"New items are unlocked by trading",ETX

Day01IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"You can carry up to four trading items",ETX

Day01IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Talk to NPCs to see what items they want",ETX

Day02IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           November 26, 1989            ",ETX

Day02IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Store keys let you enter a store after",ETX

Day02IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"the mall is closed and borrow items",ETX

Day02IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Keys can be earned by completing tasks",ETX

Day02IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"that help the store",ETX

Day02IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Try talking to other mall employees to",ETX

Day02IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"see who needs help each day.",ETX

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
	dc.b	"and it's possible to miss events.",ETX

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
	dc.b	"how the other missions turned out.",ETX

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
	dc.b	"Bayhurst mall opened back in 1975.",ETX

Day05IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"They say it's never once closed due to",ETX

Day05IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"bad weather in that time.",ETX

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
	dc.b	"something suspicious you'll have to",ETX

Day06IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"restart the mission from the beginning.",ETX

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
	dc.b	" December 31, 1989: Last Day of the 80s",ETX

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
	dc.b	"",ETX

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
	dc.b	"package and meet your sister.",ETX

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
	dc.b	"1) Track that guy down",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"2) Go home",ETX

StatusScreenDay03Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 3, 1989: Making new friends",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Maybe someone has an update on the",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"items missing from their store?",ETX

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
	dc.b	"You have to find that kid's parents",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"and D.B. before you can leave.",ETX

StatusScreenDay04Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 10, 1989: Secret Santa",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"The Secret Santa exchange might be a",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"good way to earn a new store key.",ETX

StatusScreenDay05Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 17, 1989: The Blizzard",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"If you're snowed-in you'll need to",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"find food and a place to sleep.",ETX

StatusScreenDay06Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 24, 1989: Christmas Eve",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Help Jordan sneak into Santa's",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Workshop while avoiding the guards.",ETX

StatusScreenDay07Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 31, 1989: Epilogue",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"New Year's Eve is a great time to see",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"friends and wrap-up loose ends.",ETX

StatusScreenEmptySave:
	;		"1234567890123456789012"
	dc.b	"{(not implemented yet)",ETX

StatusScreenSaveDialog:
	;		"1234567890123456789012"
	dc.b	"Nope, saving is still",LF
	dc.b	"not coded. Try later.",ETX

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
	dc.b	"Copyright (c) 2010-2017               ",ETX
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
