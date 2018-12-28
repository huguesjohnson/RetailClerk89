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
TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	" Unstable Debug Build (January 2019)  ",ETX
	else
TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	" Story Demo: Days 1-2 (January 2019)  ",ETX
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

MenuMannequinSub00NPC2Show:
	;		"1234567890123456789012"
	dc.b	"Show this suit to the",LF
	dc.b	"customer?           ^",FF
	dc.b	"{Show to customer",LF
	dc.b	"{Nevermind",ETX

MenuMannequinSub00NPC2ShowCancel:
	;		"1234567890123456789012"
	dc.b	"He looks like he's",LF
	dc.b	"getting impatient.",ETX

	align 2
DialogTextDay01Sub00NPC2D1:
	dc.w	OBJ_NPC_GENERICSHOPPER
	;		"1234567890123456789012"
	dc.b	"All wrong. I",LF
	dc.b	"need something nobody^",FF
	dc.b	"has seen before, this ",LF
	dc.b	"is way too average.",ETX

	align 2
DialogTextDay01Sub00NPC2D2:
	dc.w	OBJ_NPC_DANI
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
DialogTextGreenbergDay02Sub00NotComplete:
	dc.w	OBJ_NPC_GREENBERG
	;		"1234567890123456789012"
	dc.b	"I hope you have better",LF
	dc.b	"luck than I did.",ETX

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
	dc.b	"I don't see any real",LF
	dc.b	"connection between   ^",FF
	dc.b	"these missing items.",LF
	dc.b	"                     ^",FF
	dc.b	"We need to keep an eye",LF
	dc.b	"on this for a while.",ETX

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
DialogTextDenimCountryDaniSub01Talk:
	dc.w	OBJ_NPC_DENIMCOUNTRY_STAFF
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
DialogTextDaniScene05Day03:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2",ETX

;-------------------------------------------------------------------------------
; dialog text - day 04
;------------------------------------------------------------------------------
	align 2
DialogTextDaniScene05Day04:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2",ETX

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
	dc.b	"Holiday weekend hours",LF
	dc.b	"start tomorrow.      ^",FF
	dc.b	"All stores will stay",LF
	dc.b	"open until 10:00.",ETX

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

NPCNameMapperShopper0:
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
	dc.b	"line 0",ETX

Day02IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 1",ETX

Day02IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 2",ETX

Day02IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 3",ETX

Day02IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 4",ETX

Day02IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 5",ETX

Day03IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"            December 3, 1989            ",ETX

Day03IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 0",ETX

Day03IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 1",ETX

Day03IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 2",ETX

Day03IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 3",ETX

Day03IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 4",ETX

Day03IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 5",ETX

Day04IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"            December 10, 1989           ",ETX

Day04IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 0",ETX

Day04IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 1",ETX

Day04IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 2",ETX

Day04IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 3",ETX

Day04IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 4",ETX

Day04IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 5",ETX

Day05IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"            December 17, 1989           ",ETX

Day05IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 0",ETX

Day05IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 1",ETX

Day05IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 2",ETX

Day05IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 3",ETX

Day05IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 4",ETX

Day05IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 5",ETX

Day06IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"            December 24, 1989           ",ETX

Day06IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 0",ETX

Day06IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 1",ETX

Day06IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 2",ETX

Day06IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 3",ETX

Day06IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 4",ETX

Day06IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 5",ETX

Day07IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	" December 31, 1989: Last Day of the 80s",ETX

Day07IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 0",ETX

Day07IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 1",ETX

Day07IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 2",ETX

Day07IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 3",ETX

Day07IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 4",ETX

Day07IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"line 5",ETX

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

StatusScreenDay02Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 26, 1989: Missing items",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"some stuff",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"some more stuff",ETX

StatusScreenDay03Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 3, 1989: Making new friends",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"some stuff",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"some more stuff",ETX

StatusScreenDay04Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 10, 1989: Secret Santa",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"The Secret Santa exchange is a",LF
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
	dc.b	"Copyright (c) 2015-2018 Hugues Johnson",ETX
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
