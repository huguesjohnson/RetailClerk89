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
	dc.b	" Unstable Debug Build (November 2018) ",ETX
	else
TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	" Story Demo: Days 1-2 (November 2018) ",ETX
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
	dc.b	"...",ETX

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

DialogTextDaniScene00Day00Flag0:
	;		"1234567890123456789012"
	dc.b	"`It's 10 minutes past",LF
	dc.b	"closing time already.^",FF
	dc.b	"Get that guy out of",LF
	dc.b	"here so we can leave.'",ETX

DialogTextDaniScene00Day00Flag1:
	;		"1234567890123456789012"
	dc.b	"`Maybe you should",LF
	dc.b	"actually talk to him.^",FF
	dc.b	"`You know, like",LF
	dc.b	"do your job.'",ETX

DialogTextDaniScene00Day00Flag8:
	;		"1234567890123456789012"
	dc.b	"`Do I have to explain",LF
	dc.b	"everything to you?   ^",FF
	dc.b	"Go ring him up & let's",LF
	dc.b	"get out of here.'",ETX

DialogTextDaniScene00Day00Exit0:
	;		"1234567890123456789012"
	dc.b	"`You know what your",LF
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
	dc.b	"buy anything & leave.'",ETX

DialogTextDaniScene00Day00Exit1:
	;		"1234567890123456789012"
	dc.b	"`I can't believe",LF
	dc.b	"your manager is MIA. ^",FF
	dc.b	"He better give you a",LF
	dc.b	"a key tomorrow.'",ETX

DialogTextDaniScene00Day00Exit2:
	;		"1234567890123456789012"
	dc.b	"`Meet me at the",LF
	dc.b	"car whenever he      ^",FF
	dc.b	"bothers to show up",LF
	dc.b	"again.'",ETX

DialogTextDaniScene05Day00:
	;		"1234567890123456789012"
	dc.b	"`Did you get lost?",LF
	dc.b	"                     ^",FF
	dc.b	"Just get in the car.'",ETX

DialogTextGreenbergScene00Day00Exit:
	;		"1234567890123456789012"
	dc.b	"`Did I just see a guy",LF
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
	dc.b	"get on home.'",ETX

DialogTextGreenbergScene00Day00Talk:
	;		"1234567890123456789012"
	dc.b	"`Don't keep",LF
	dc.b	"that nice young lady ^",FF
	dc.b	"waiting too long.'",ETX

DialogTextGreenbergScene00Day00Give:
	;		"1234567890123456789012"
	dc.b	"`You're not",LF
	dc.b	"stealing either?     ^",FF
	dc.b	"You're the model",LF
	dc.b	"employee today.'",ETX

DialogTextScene00Day00Event0D0:
	;		"1234567890123456789012"
	dc.b	"Dani:`This is taking",LF
	dc.b	"forever.'",ETX

DialogTextScene00Day00Event0D1:
	;		"1234567890123456789012"
	dc.b	"Dani:`This is the game",LF
	dc.b	"your kid wants.'     ^",FF
	dc.b	"Shopper:`Baby Boomer?",LF
	dc.b	"That can't be right. ^",FF
	dc.b	"Do you even work",LF
	dc.b	"here?'               ^",FF
	dc.b	"Dani:`Trust me. It's",LF
	dc.b	"what all the kids    ^",FF
	dc.b	"are playing today.",LF
	dc.b	"It's really popular.'^",FF
	dc.b	"Shopper:`Uh, OK.'",ETX

DialogTextMaleShopper0Scene00Day00Flag0:
	;		"1234567890123456789012"
	dc.b	"`If I have a mouse on",LF
	dc.b	"COM2 using IRQ3 can I^",FF
	dc.b	"hookup a modem on",LF
	dc.b	"COM4 using IRQ4?'    ^",FF
	dc.b	"{Sure, why not?",LF
	dc.b	"{I make $3.35 an hour.",ETX

DialogTextMaleShopper0Scene00Day00Flag0R0:
	;		"1234567890123456789012"
	dc.b	"`Great, thanks.",FF
	dc.b	"There's one more thing",LF
	dc.b	"I need tonight.      ^",FF
	dc.b	"My kid wants this one",LF
	dc.b	"video game for Xmas. ^",FF
	dc.b	"Do you have it?'     ^",FF
	dc.b	"{Um, what's it called?",LF
	dc.b	"{What system is it on?",ETX

DialogTextMaleShopper0Scene00Day00Flag0R1:
	;		"1234567890123456789012"
	dc.b	"`Sorry I asked.",LF
	dc.b	"                     ^",FF
	dc.b	"Maybe you can help",LF
	dc.b	"with something else. ^",FF
	dc.b	"I'm supposed to pickup",LF
	dc.b	"some game for my kid.^",FF
	dc.b	"It has a guy on the",LF
	dc.b	"box or maybe a car.^",FF
	dc.b	"Do you know the one",LF
	dc.b	"I'm talking about?'  ^",FF
	dc.b	"{Oh yeah, that one.",LF
	dc.b	"{It's sold out.",ETX

DialogTextMaleShopper0Scene00Day00Flag2R0:
	;		"1234567890123456789012"
	dc.b	"`Someone and Iggy vs",LF
	dc.b	"whatever & something.^",FF
	dc.b	"You know all these ",LF
	dc.b	"games, go find it.'",ETX

DialogTextMaleShopper0Scene00Day00Flag2R1:
	;		"1234567890123456789012"
	dc.b	"`It's the one with two",LF
	dc.b	"controllers on the TV^",FF
	dc.b	"I thought you were",LF
	dc.b	"the expert on this.'",ETX

DialogTextMaleShopper0Scene00Day00Flag3R0:
	;		"1234567890123456789012"
	dc.b	"`Great, go get it.",LF
	dc.b	"I'll wait here.'",ETX

DialogTextMaleShopper0Scene00Day00Flag3R1:
	;		"1234567890123456789012"
	dc.b	"`Can you check anyway?",LF
	dc.b	"I'm sure it's here.'",ETX

DialogTextMaleShopper0Scene00Day00Flag4:
	;		"1234567890123456789012"
	dc.b	"`Have you found that",LF
	dc.b	"game yet?'",ETX

DialogTextMaleShopper0Scene00Day00Flag8:
	;		"1234567890123456789012"
	dc.b	"`Ring this up, I don't",LF
	dc.b	"have all night.'",ETX

DialogTextMaleShopper0Scene00Day00Flag4Give:
	;		"1234567890123456789012"
	dc.b	"`That doesn't look",LF
	dc.b	"right at all.'",ETX

DialogTextMaleShopper0Scene00Day00Flag5Give:
	;		"1234567890123456789012"
	dc.b	"`No, that's even",LF
	dc.b	"worse.'",ETX

DialogTextMaleShopper0Scene00Day00Flag6Give:
	;		"1234567890123456789012"
	dc.b	"`Did you listen to me",LF
	dc.b	"at all?'",ETX

DialogTextMaleShopperDefaultGive:
	;		"1234567890123456789012"
	dc.b	"He accepts it with a",LF
	dc.b	"look of confusion.",ETX

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

DialogTextDaniWalkingHome:
	;		"1234567890123456789012"
	dc.b	"Dani:`In 10 minutes",LF
	dc.b	"you're walking home.'",ETX

DialogTextNPCSouthCenterStaffDay00:
	;		"1234567890123456789012"
	dc.b	"`Are you going home",LF
	dc.b	"for the night?'      ^",FF
	dc.b	"{Uh, sure",LF
	dc.b	"{No I'm sleeping here",ETX

DialogTextNPCSouthCenterStaffDay00R0:
	;		"1234567890123456789012"
	dc.b	"`Well you have a good",LF
	dc.b	"night and stay warm.'",ETX

DialogTextNPCSouthCenterStaffDay00R1:
	;		"1234567890123456789012"
	dc.b	"`Oh, at least you're",LF
	dc.b	"indoors tonight.'",ETX

DialogTextSecurityGuardDay00:
	;		"1234567890123456789012"
	dc.b	"`The mall is closed.",LF
	dc.b	"Get a move on.'",ETX

;-------------------------------------------------------------------------------
; dialog text - day 01
;-------------------------------------------------------------------------------
DialogTextDay01CantReturnYet:
	;		"1234567890123456789012"
	dc.b	"`I'm not ready to deal",LF
	dc.b	"with work again yet.'",ETX

DialogTextDay01Sub02CantEnter:
	;		"1234567890123456789012"
	dc.b	"`I have to get rid of",LF
	dc.b	"this package first.'",ETX

DialogTextDay01Intro00:
	;		"1234567890123456789012"
	dc.b	"Lisa:`This is bad.",LF
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
	dc.b	"Our store may close if",LF
	dc.b	"sales don't improve.'",ETX

DialogTextDay01Intro01:
	;		"1234567890123456789012"
	dc.b	"Dani: `Whatever.'",ETX

DialogTextDay01Intro02:
	;		"123456  7            89012345  6           789012"
	dc.b	"Lisa:`",CHAR_DQUOTE,"Whatever",CHAR_DQUOTE,"?!",LF
	;		"1234567890123456789012"
	dc.b	"                     ^",FF
	dc.b	"Don't you care about",LF
	dc.b	"your career?'",ETX

DialogTextDay01Intro03:
	;		"1234567890123456789012"
	dc.b	"Dani:`My career?",LF
	dc.b	"                     ^",FF
	dc.b	"I have one semester of",LF
	dc.b	"junior college left, ^",FF
	dc.b	"then I'm transferring",LF
	dc.b	"to state.            ^",FF
	dc.b	"They can bulldoze the",LF
	dc.b	"mall for all I care. ^",FF
	dc.b	"I think I'll take my",LF
	dc.b	"break now.'",ETX

DialogTextSecurityGuardDay01:
	;		"1234567890123456789012"
	dc.b	"`Mall's closing in 5.",LF
	dc.b	"minutes, move along.'",ETX

DialogTextDay01VBDBDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"Dani:`I'm stuck",LF
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
	dc.b	"years ago.'",ETX

DialogTextDay01VBDBTalk01:
	;		"1234567890123456789012"
	dc.b	"Dani:`Head over to my ",LF
	dc.b	"store after close.'",ETX

DialogTextDay01Sub00Intro:
	;		"1234567890123456789012"
	dc.b	"Todd:`I'm glad you're ",LF
	dc.b	"here. The rest of the^",FF
	dc.b	"staff called in sick. ",LF
	dc.b	"I'm stuck here alone ^",FF
	dc.b	"and starving. Would   ",LF
	dc.b	"you mind watching the^",FF
	dc.b	"store for just a tiny ",LF
	dc.b	"bit? I'll be fast.'  ^",FF
	dc.b	"{Yeah, whatever",LF
	dc.b	"{Give me five minutes",ETX

DialogTextDay01Sub00IntroDecline:
	;		"1234567890123456789012"
	dc.b	"`Sure, whenever",LF
	dc.b	"you're free is cool.'",ETX

DialogTextDay01Sub00Start00:
	;		"1234567890123456789012"
	dc.b	"`Thanks, I won't ",LF
	dc.b	"be long I promise.   ^",FF
	dc.b	"It's not like they're",LF
	dc.b	"many choices here.'   ",ETX

DialogTextDay01Sub00Start01:
	;		"1234567890123456789012"
	dc.b	"`Just to warn you,    ",LF
	dc.b	"the customers here  ^",FF
	dc.b	"can be pretty dim.'   ",ETX

DialogTextDay01Sub00Start02:
	;		"1234567890123456789012"
	dc.b	"`You'll be OK. No one ",LF
	dc.b	"shops here this late.'",ETX

DialogTextDay01Sub00NPC1D0:
	;		"1234567890123456789012"
	dc.b	"`Have we met before?' ",LF
	dc.b	"                     ^",FF
	dc.b	"{Maybe",LF
	dc.b	"{Absolutely not",ETX

DialogTextDay01Sub00NPC1D0R0:
	;		"1234567890123456789012"
	dc.b	"`Right, you were      ",LF
	dc.b	"working at the shoe  ^",FF
	dc.b	"store the other day.  ",ETX

DialogTextDay01Sub00NPCD1:
	;		"1234567890123456789012"
	dc.b	"`Do you have that new  ",LF
	dc.b	"Stephen King book?'  ^",FF
	dc.b	"{Yes",LF
	dc.b	"{No",ETX

DialogTextDay01Sub00NPC1D1R0:
	;		"1234567890123456789012"
	dc.b	"`It's in our west wing",LF
	dc.b	"go out those doors & ^",FF
	dc.b	"turn right. Keep going",LF
	dc.b	"it'll be to the left.'",ETX

DialogTextDay01Sub00NPC1D1R1:
	;		"1234567890123456789012"
	dc.b	"Customer:`Can you go  ",LF
	dc.b	"see if you have it?' ^",FF
	dc.b	"Dani:`Well this is a  ",LF
	dc.b	"clothing store so..' ^",FF
	dc.b	"Customer:`Hmm, that's ",LF
	dc.b	"a good point.'        ",ETX

DialogTextDay01Sub00NPC1D0R1:
	;		"1234567890123456789012"
	dc.b	"`You kids all look",LF
	dc.b	"the same.'",ETX

DialogTextDay01Sub00NPCD2:
	;		"1234567890123456789012"
	dc.b	"`This is some kind of ",LF
	dc.b	"board game store?'   ^",FF
	dc.b	"{Not even a little",LF
	dc.b	"{In a way",ETX

DialogTextDay01Sub00NPC1D2R0:
	;		"1234567890123456789012"
	dc.b	"Customer:`Are you     ",LF
	dc.b	"sure?              ' ^",FF
	dc.b	"Dani:`Yes, this store ",LF
	dc.b	"has been in my family^",FF
	dc.b	"for over seven        ",LF
	dc.b	"generations now.'    ^",FF
	dc.b	"Customer:`OK then.'   ",ETX

DialogTextDay01Sub00NPC1D2R1:
	;		"1234567890123456789012"
	dc.b	"Customer:`Great. I'm  ",LF
	dc.b	"looking for this new ^",FF
	dc.b	"board game. It's this",LF
	dc.b	"real estate game like^",FF
	dc.b	"Monopoly but it's     ",LF
	dc.b	"based on..'          ^",FF
	dc.b	"Dani:`Nope, stop right",LF
	dc.b	"there. We are so not ^",FF
	dc.b	"doing this. You should",LF
	dc.b	"just move along now.' ",ETX

DialogTextDay01Sub00NPC2D0:
	;		"1234567890123456789012"
	dc.b	"`I'm invited to the   ",LF
	dc.b	"hottest New Years    ^",FF
	dc.b	"party & can't afford  ",LF
	dc.b	"to look like a loser.^",FF
	dc.b	"I need a fresh style, ",LF
	dc.b	"what do you have?'    ",ETX

DialogTextDay01Sub00NPC2DefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`I don't have forever,",LF
	dc.b	"show me something.'",ETX

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

DialogTextDay01Sub00NPC2D1:
	;		"1234567890123456789012"
	dc.b	"`How about this? It's ",LF
	dc.b	"new and whatever.'   ^",FF
	dc.b	"Customer:`All wrong. I",LF
	dc.b	"need something nobody^",FF
	dc.b	"has seen before, this ",LF
	dc.b	"is way too average.'  ",ETX

DialogTextDay01Sub00NPC2D2:
	;		"1234567890123456789012"
	dc.b	"`Here, this one is,   ",LF
	dc.b	"really something.'   ^",FF
	dc.b	"Customer:`What is that",LF
	dc.b	"color? It's not blue,^",FF
	dc.b	"it's not green, I've  ",LF
	dc.b	"never seen it.'      ^",FF
	dc.b	"Dani:`It's says it's",LF
	dc.b	"called",CHAR_DQUOTE,"teal",CHAR_DQUOTE,".'^",FF
	dc.b	"Customer:`It's the    ",LF
	dc.b	"future. I'll take it!'",ETX

DialogTextDay01Sub00NPC2D3:
	;		"1234567890123456789012"
	dc.b	"`I don't have forever,",LF
	dc.b	"ring me up already.'",ETX

DialogTextDay01Sub00NPC3D0:
	;		"1234567890123456789012"
	dc.b	"`Hello, good evening.'",LF
	dc.b	"                     ^",FF
	dc.b	"{How can I help!?",LF
	dc.b	"{Fine, let's do this",ETX

DialogTextDay01Sub00NPC3D0R0:
	;		"1234567890123456789012"
	dc.b	"`Clearly you are our",LF
	dc.b	"target demographic!'",ETX

DialogTextDay01Sub00NPC3D0R1:
	;		"1234567890123456789012"
	dc.b	"`Just make it quick.'",ETX

DialogTextDay01Sub00NPC3D1:
	;		"1234567890123456789012"
	dc.b	"`I don't see a nametag",LF
	dc.b	"what's your name?'",FF
	dc.b	"{Joy McHelpful",LF
	dc.b	"{Morgan Fairchild",ETX

DialogTextDay01Sub00NPC3D1R0:
	;		"1234567890123456789012"
	dc.b	"`And customer service",LF
	dc.b	"is my true passion.'",ETX

DialogTextDay01Sub00NPC3D1R1:
	;		"1234567890123456789012"
	dc.b	"`And I'm down on my",LF
	dc.b	"luck right now.'",ETX

DialogTextDay01Sub00NPC3D2:
	;		"1234567890123456789012"
	dc.b	"`Do you sell paisley",LF
	dc.b	"kipper ties?'        ^",FF
	dc.b	"{I'm so sorry but..",LF
	dc.b	"{Not this decade",ETX

DialogTextDay01Sub00NPC3D2R0:
	;		"1234567890123456789012"
	dc.b	"`Could I interest you",LF
	dc.b	"in a suit instead?'",ETX

DialogTextDay01Sub00NPC3D2R1:
	;		"1234567890123456789012"
	dc.b	"`Maybe there's a time",LF
	dc.b	"portal around.'",ETX

DialogTextDay01Sub00NPC3D3:
	;		"1234567890123456789012"
	dc.b	"`Do you have any deals",LF
	dc.b	"you want to mention?'^",FF
	dc.b	"{Yes of course",LF
	dc.b	"{Please leave",ETX

DialogTextDay01Sub00NPC3D3R0:
	;		"1234567890123456789012"
	dc.b	"`Yes, today only",LF
	dc.b	"everything is two    ^",FF
	dc.b	"for the price of two!'",LF
	dc.b	"                     ^",FF
	dc.b	"Shopper:`That's",LF
	dc.b	"wonderful Thank you!'",ETX

DialogTextDay01Sub00NPC3D3R1:
	;		"1234567890123456789012"
	dc.b	"Shopper:`OK, well..",LF
	dc.b	"good bye.'",ETX

DialogTextDay01Sub00NPC0Talk:
	;		"1234567890123456789012"
	dc.b	"`Thanks for helping.  ",LF
	dc.b	"I really own you one.'",ETX

DialogTextDay01Sub00End00:
	;		"1234567890123456789012"
	dc.b	"Todd:`Hey, wait sec!'",ETX

DialogTextDay01Sub00End01:
	;		"1234567890123456789012"
	dc.b	"`Here, have a key to  ",LF
	dc.b	"the store, you know, ^",FF
	dc.b	"just in case you ever ",LF
	dc.b	"need anything.'",ETX

DialogTextDay01Sub00End02:
	;		"1234567890123456789012"
	dc.b	"`Hey wait, my parents ",LF
	dc.b	"will be out of town  ^",FF
	dc.b	"for New Years and they",LF
	dc.b	"said I could have a  ^",FF
	dc.b	"few people over. Why  ",LF
	dc.b	"don't you come by?'   ",ETX

DialogTextDay01Sub00End03:
	;		"1234567890123456789012"
	dc.b	"`Just as a friend!    ",LF
	dc.b	"Just as a friend!    ^",FF
	dc.b	"You can even bring    ",LF
	dc.b	"someone, it's cool.'  ",ETX

DialogTextDay01Sub00End04:
	;		"1234567890123456789012"
	dc.b	"`I didn't hear a no!' ",ETX

DialogTextDay01Sub02VBExit:
	;		"1234567890123456789012"
	dc.b	"Greenberg:`I need to",LF
	dc.b	"talk to you before   ^",FF
	dc.b	"you leave.'  ",ETX

DialogTextDay01Sub02Start:
	;		"1234567890123456789012"
	dc.b	"Greenberg:`It's slow",LF
	dc.b	"tonight so go ahead  ^",FF
	dc.b	"& leave early. There's",LF
	dc.b	"just one thing first.^",FF
	dc.b	"The delivery guy left ",LF
	dc.b	"this package here but^",FF
	dc.b	"it's not for us. It",LF
	dc.b	"might be a VHS tape. ^",FF
	dc.b	"I can't tell, the",LF
	dc.b	"label is worn off.   ^",FF
	dc.b	"Find out who this is",LF
	dc.b	"for on your way out.'^",FF
	dc.b	"Received",LF
	dc.b	"Mystery Package.",ETX

DialogTextDay01Sub02TalkGreenberg:
	;		"1234567890123456789012"
	dc.b	"`I know you can figure",LF
	dc.b	"this out.'",ETX

DialogTextDay01Sub02D0:
	;		"1234567890123456789012"
	dc.b	"`The delivery guy gets",LF
	dc.b	"our stores confused  ^",FF
	dc.b	"all the time, but this",LF
	dc.b	"one isn't for us.    ^",FF
	dc.b	"It's too small, might",LF
	dc.b	"be an old beta tape. ^",FF
	dc.b	"Check back sometime, ",LF
	dc.b	"we get stuff for your^",FF
	dc.b	"store every once a",LF
	dc.b	"week or so.'",ETX

DialogTextDay01Sub02TalkNPCStaffSVideo:
	;		"1234567890123456789012"
	dc.b	"`We have to look out",LF
	dc.b	"for each other.'",ETX

DialogTextDay01Sub02D1:
	;		"1234567890123456789012"
	dc.b	"`Hey, we've been",LF
	dc.b	"looking for that!    ^",FF
	dc.b	"It's a replacement",LF
	dc.b	"tape for our security^",FF
	dc.b	"system. The old one ",LF
	dc.b	"is so worn out that  ^",FF
	dc.b	"we couldn't see who.. ",LF
	dc.b	"nevermind. Thanks.'",ETX

DialogTextDay01End:
	;		"1234567890123456789012"
	dc.b	"`You're just in time",LF
	dc.b	"for once. I'm done   ^",FF
	dc.b	"closing out the",LF
	dc.b	"register. Let's get  ^",FF
	dc.b	"home before it's too",LF
	dc.b	"cold outside.'",ETX

DialogTextDay01ParkingLot:
	;		"1234567890123456789012"
	dc.b	"`So you're starting to",LF
	dc.b	"make yourself useful.^",FF
	dc.b	"You still have a way",LF
	dc.b	"to go though.'",ETX

DialogTextCheckersStaffDay01MallClosed:
	;		"1234567890123456789012"
	dc.b	"`Hey, I'm trying to",LF
	dc.b	"close the register.  ^",FF
	dc.b	"Can this wait until",LF
	dc.b	"tomorrow?'",ETX

DialogTextTBooksStaffDay01Talk:
	;		"1234567890123456789012"
	dc.b	"Dani:`My store's dead.",LF
	dc.b	"Are you busy today?' ^",FF
	dc.b	"Charles:`A little bit",LF
	dc.b	"but I'm getting by.  ^",FF
	dc.b	"Knowing it's my last",LF
	dc.b	"winter here helps.'  ^",FF
	dc.b	"Dani:`I'm almost done",LF
	dc.b	"with this place too.'^",FF
	dc.b	"It'll be weird not",LF
	dc.b	"seeing you every day.^",FF
	dc.b	"We've been neighbors,",LF
	dc.b	"since kindergarten.' ^",FF
	dc.b	"Charles:`Yeah, that",LF
	dc.b	"sounds about right.  ^",FF
	dc.b	"Let's plan to hang out",LF
	dc.b	"next winter break.'",ETX

;-------------------------------------------------------------------------------
; information desk
;-------------------------------------------------------------------------------

DialogTextInfoDeskDay00R0:	; mall news
	;		"1234567890123456789012"
	dc.b	"`Santa's Workshop just",LF
	dc.b	"opened this morning. ^",FF
	dc.b	"It was already very",LF
	dc.b	"busy there today.'",ETX

DialogTextInfoDeskDay00R1:	; events
	;		"1234567890123456789012"
	dc.b	"`This is exciting! The",LF
	dc.b	"mall will be open at ^",FF
	dc.b	"6:00 AM on Black",LF
	dc.b	"Friday this year.'",ETX

DialogTextInfoDeskDay00R2:	; store news
	;		"1234567890123456789012"
	dc.b	"`The first Fish or Cut",LF
	dc.b	"Bait store in our    ^",FF
	dc.b	"area is open now. They",LF
	dc.b	"have this fun gimmick^",FF
	dc.b	"where their staff",LF
	dc.b	"dress as lumberjacks.'",ETX

DialogTextInfoDeskDay00R3:	; rumors
	;		"1234567890123456789012"
	dc.b	"`I really shouldn't",LF
	dc.b	"tell you this but..  ^",FF
	dc.b	"One store here isn't",LF
	dc.b	"doing well & might be^",FF
	dc.b	"sold next year. Don't",LF
	dc.b	"tell anyone please.'",ETX

DialogTextInfoDeskDay01R0:	; mall news
	;		"1234567890123456789012"
	dc.b	"`Holiday weekend hours",LF
	dc.b	"start tomorrow.      ^",FF
	dc.b	"All stores will stay",LF
	dc.b	"open until 10:00.'",ETX

DialogTextInfoDeskDay01R1:	; events
	;		"1234567890123456789012"
	dc.b	"`We're trying to ",LF
	dc.b	"organize a really fun^",FF
	dc.b	"Secret Santa exchange",LF
	dc.b	"for mall employees.  ^",FF
	dc.b	"Sign-ups start next",LF
	dc.b	"week, please join us!'",ETX

DialogTextInfoDeskDay01R2:	; store news
	;		"1234567890123456789012"
	dc.b	"`Checkers is having an",LF
	dc.b	"out of fashion sale. ^",FF
	dc.b	"50% off anything",LF
	dc.b	"older than a week.   ^",FF
	dc.b	"They've been very busy",LF
	dc.b	"today because of it.'",ETX

DialogTextInfoDeskDay01R3:	; rumors
	;		"1234567890123456789012"
	dc.b	"`I really shouldn't",LF
	dc.b	"tell you this but..  ^",FF
	dc.b	"The mall manager still",LF
	dc.b	"hasn't hired a new   ^",FF
	dc.b	"snowplow company since",LF
	dc.b	"the last one quit.'",ETX

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
	dc.b	"`Do you need",LF
	dc.b	"something?'",ETX

DialogTextCenterStaffDefaultLook:
	;		"1234567890123456789012"
	dc.b	"`Hi! How can I help",LF
	dc.b	"you today?'",ETX

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
	dc.b	"`Move along unless you",LF
	dc.b	"want a lifetime ban.'",ETX

DialogTextNPCTrendyGuyDefaultLook:
	;		"1234567890123456789012"
	dc.b	"That look must take a",LF
	dc.b	"lot of effort.",ETX

;-------------------------------------------------------------------------------
; default NPC talk responses
;-------------------------------------------------------------------------------
DialogTextGreenbergDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Did you see the new",LF
	dc.b	"games that came in?'",ETX

DialogTextDenimCountryStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`It's way too slow",LF
	dc.b	"here for Xmas season.^",FF
	dc.b	"I hope they don't",LF
	dc.b	"close the mall.'",ETX

DialogTextDenimCountryStaffDefaultTalkDB:
	;		"1234567890123456789012"
	dc.b	"`The way Dani talks",LF
	dc.b	"about you, I thought ^",FF
	dc.b	"you'd be shorter.'",ETX

DialogTextCheckersStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Hey. What's going on",LF
	dc.b	"with you today?'",ETX

DialogTextTLodgeStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`You know what the",LF
	dc.b	"perfect Xmas gift is?^",FF
	dc.b	"An extended warranty",LF
	dc.b	"for your new phone.'",ETX

DialogTextCavernStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`What do you need?'",ETX

DialogTextSVideoStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`If you're looking for",LF
	dc.b	"a specific movie we  ^",FF
	dc.b	"probably have it.'",ETX

DialogTextNShackStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Welcome. Please take",LF
	dc.b	"your time.'",ETX

DialogTextPogoDawgStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"He doesn't appear to",LF
	dc.b	"be listening.",ETX

DialogTextCPlanetStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`You look like you're",LF
	dc.b	"here for that new    ^",FF
	dc.b	"boy band Xmas album.",LF
	dc.b	"It's in the CD bins.'",ETX

DialogTextCNowStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Hi! I'm so happy",LF
	dc.b	"you're here!         ^",FF
	dc.b	"You won't believe what",LF
	dc.b	"happened today!'     ^",FF
	dc.b	"(30 minutes later)",LF
	dc.b	"                     ^",FF
	dc.b	"'..and that's why I'm ",LF
	dc.b	"waiting until after   ^",FF
	dc.b	"I get married!'",ETX

DialogTextTBooksStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Hey neighbor. Nice of",LF
	dc.b	"you to stop by.'",ETX

DialogTextFCBCheckoutStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Are you going to buy",LF
	dc.b	"something or are you ^",FF
	dc.b	"just here to annoy",LF
	dc.b	"me?'",ETX

DialogTextFCBFirearmsStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`There's no better",LF
	dc.b	"gift for someone you ^",FF
	dc.b	"care about than a new",LF
	dc.b	"RK62 rifle.'",ETX

DialogTextFCBFishingStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Ice fishing season is",LF
	dc.b	"almost here. We have ^",FF
	dc.b	"everything you need",LF
	dc.b	"to catch a ton.'",ETX

DialogTextFCBCampingStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Oh hey. Yeah. Welcome",LF
	dc.b	"to the store I guess.^",FF
	dc.b	"How can I help you?'",ETX

DialogTextSouthCenterStaffDefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Good evening.'",ETX

DialogTextWorkshopStaff0DefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Sorry, only children",LF
	dc.b	"under 12 can take    ^",FF
	dc.b	"photos with Santa.'",ETX

DialogTextWorkshopStaff1DefaultTalk:
	;		"1234567890123456789012"
	dc.b	"`Aren't you supposed",LF
	dc.b	"to have a kid with   ^",FF
	dc.b	"you to visit Santa?'",ETX

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

InfoDeskMenu:
	;		"{1234567890{1234567890"
	dc.b	"`What do you want to",LF
	dc.b	"know about today?'   ^",FF
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
DialogTextDaniDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Yeah, whatever.'",ETX

DialogTextDBDefaultGive:
	;		"1234567890123456789012"
	dc.b	"He looks puzzled by",LF
	dc.b	"by this interaction.",ETX

DialogTextGreenbergDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`I don't need that.'",ETX

DialogTextNPCCenterStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Sorry, but the lost &",LF
	dc.b	"found is full.'",ETX

DialogTextNPCDenimCountryStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Huh? Why don't you",LF
	dc.b	"keep that.'",ETX

DialogTextNPCCheckersStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Dude, get that out",LF
	dc.b	"of here.'",ETX

DialogTextNPCTLodgeStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`I can't do anything",LF
	dc.b	"with that.'",ETX

DialogTextNPCCavernStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Not interested.'",ETX

DialogTextNPCSVideoStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`That's interesting",LF
	dc.b	"but you keep it.'",ETX

DialogTextNPCNShackStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`No thanks.'",ETX

DialogTextNPCPogoDawgStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"He isn't paying any",LF
	dc.b	"attention to you.",ETX

DialogTextNPCCPlanetStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`You're kinda weird.",LF
	dc.b	"You hang on to this.'",ETX

DialogTextNPCCNowStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Is this a gift?",LF
	dc.b	"I can't accept it.'",ETX

DialogTextNPCTBooksStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`No thanks, maybe",LF
	dc.b	"another time.'",ETX

DialogTextNPCFCBCheckoutStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Do you want me to",LF
	dc.b	"ring this up?        ^",FF
	dc.b	"Hold on a second, we",LF
	dc.b	"don't sell this.'",ETX

DialogTextNPCFCBFirearmsStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Best keep that to",LF
	dc.b	"yourself.'",ETX

DialogTextNPCFCBFishingStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`That's pretty neat",LF
	dc.b	"but I don't want it.'",ETX

DialogTextNPCFCBCampingStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Thanks but I don't",LF
	dc.b	"have room for this.'",ETX

DialogTextNPCSouthCenterStaffDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`It's nice to see you",LF
	dc.b	"in the giving spirit.^",FF
	dc.b	"But you should give",LF
	dc.b	"this to someone else.'",ETX

DialogTextNPCWorkshopStaff0DefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Sorry, we're not",LF
	dc.b	"taking donations now.'",ETX

DialogTextNPCWorkshopStaff1DefaultGive:
	;		"1234567890123456789012"
	dc.b	"`What do you want me",LF
	dc.b	"to do with that?'",ETX

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
	dc.b	"Mannequin",OBJNAMEEND

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
NPCNameDani:
	dc.b	"Dani",NPCNAMEEND

NPCNameDB:
	dc.b	"D.B.",NPCNAMEEND

NPCNameMapperShopper0:
	dc.b	"Business casual guy",NPCNAMEEND

NPCNameGreenberg:
	dc.b	"Greenberg",NPCNAMEEND

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
	dc.b	"Generic night guard",NPCNAMEEND

NPCNameTrendyGuy:
	;		"1234567890123456789012"
	dc.b	"Trendy guy",NPCNAMEEND

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
	dc.b	"November 26, 1989: Black Friday",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"How are all your friends handling",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"the busiest day of the year?",ETX

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
