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
; title screen
;-------------------------------------------------------------------------------
TitleScreenTextNewGame:
	dc.b	"New Game",ETX

TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	"Unstable Winter/Spring 2018 WIP Build ",ETX

;-------------------------------------------------------------------------------
; end screen
;-------------------------------------------------------------------------------
EndScreenTextLine1:
	dc.b	"Thank you for trying this little demo.",ETX

EndScreenTextLine2:
	dc.b	"Follow the progress of this project at:",ETX

EndScreenTextLine3:
	dc.b	"http://HuguesJohnson.com/",ETX

EndScreenTextLine4:
	dc.b	"Look for the final game in stores",ETX

EndScreenTextLine5:
	dc.b	"sometime around Xmas 2040.",ETX

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

DialogTextCantLeaveStoreUnattended:
	;		"1234567890123456789012"
	dc.b	"You can't leave the",LF
	dc.b	"store unattended.",ETX

DialogTextStoreClosing:
	;		"1234567890123456789012"
	dc.b	"It looks like they are",LF
	dc.b	"closing for the night.",ETX

DialogTextLongWalk:
	;		"1234567890123456789012"
	dc.b	"It's an awful long way",LF
	dc.b	"to walk home.",ETX

;-------------------------------------------------------------------------------
; dialog text
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
	dc.b	"Just get in the car.'",ETX

DialogTextGreenbergScene00Day00Exit:
	;		"1234567890123456789012"
	dc.b	"`Did I just",LF
	dc.b	"see a guy walking out^",FF
	dc.b	"with a copy of Baby",LF
	dc.b	"Boomer? You're the   ^",FF
	dc.b	"best sales person I",LF
	dc.b	"hired this season.   ^",FF
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
	dc.b	"waiting. I sure",LF
	dc.b	"wouldn't.'",ETX

DialogTextGreenbergScene00Day00Give:
	;		"1234567890123456789012"
	dc.b	"`You're not",LF
	dc.b	"stealing either?     ^",FF
	dc.b	"You're the model",LF
	dc.b	"employee today.'",ETX

DialogTextScene00Day00Event0D0:
	;		"1234567890123456789012"
	dc.b	"Dani:`This is taking",LF
	dc.b	"forever.'            ^",ETX

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

DialogTextDaniDefaultGive:
	;		"1234567890123456789012"
	dc.b	"`Yeah, whatever.'",ETX

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
	dc.b	"`Did you even listen",LF
	dc.b	"to me?'",ETX

DialogTextMaleShopperDefaultGive:
	;		"1234567890123456789012"
	dc.b	"He accepts it with a",LF
	dc.b	"look of confusion.",ETX

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
	dc.b	"Staring too long will",LF
	dc.b	"get you kicked out.",ETX

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
	dc.b	"This year's hot xmas",LF
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
	dc.b	"trendy releases.",ETX

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
	dc.b	"Too bad the car only",LF
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
	dc.b	"line1",LF
	dc.b	"line2.",ETX

DialogTextArcade1:
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2.",ETX

DialogTextArcade2:
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2.",ETX

DialogTextArcade3:
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2.",ETX

DialogTextArcade4:
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2.",ETX

DialogTextArcade5:
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2.",ETX

DialogTextArcade6:
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2.",ETX

DialogTextArcade7:
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2.",ETX

DialogTextArcade8:
	;		"1234567890123456789012"
	dc.b	"line1",LF
	dc.b	"line2.",ETX

DialogTextFence:
	;		"1234567890123456789012"
	dc.b	"It's lined with many",LF
	dc.b	"wreathes.",ETX

DialogTextPole:
	;		"1234567890123456789012"
	dc.b	"Festive candy cane",LF
	dc.b	"xmas pole.",ETX

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

DialogTextDaniDefaultLook:
	;		"1234567890123456789012"
	dc.b	"She seems moderately",LF
	dc.b	"annoyed with you.",ETX

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
	dc.b	"`So what's your deal?'",LF
	dc.b	" ",ETX

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
	dc.b	"Arcade game 0",OBJNAMEEND

ObjectNameArcade1:
	dc.b	"Arcade game 1",OBJNAMEEND

ObjectNameArcade2:
	dc.b	"Arcade game 2",OBJNAMEEND

ObjectNameArcade3:
	dc.b	"Arcade game 3",OBJNAMEEND

ObjectNameArcade4:
	dc.b	"Arcade game 4",OBJNAMEEND

ObjectNameArcade5:
	dc.b	"Arcade game 5",OBJNAMEEND

ObjectNameArcade6:
	dc.b	"Arcade game 6",OBJNAMEEND

ObjectNameArcade7:
	dc.b	"Arcade game 7",OBJNAMEEND

ObjectNameArcade8:
	dc.b	"Arcade game 8",OBJNAMEEND

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

;-------------------------------------------------------------------------------
; item names
;-------------------------------------------------------------------------------
ItemNameNothing:
	;		"1234567890"
	dc.b	"Nothing",ITEMNAMEEND

ItemNameMagGamePro:
	;		"1234567890"
	dc.b	"GamePro",ITEMNAMEEND

ItemNameMagEGM:
	;		"1234567890"
	dc.b	"EGM",ITEMNAMEEND

ItemNameMagAntic:
	;		"1234567890"
	dc.b	"Antic",ITEMNAMEEND

ItemNameMagAnalog:
	;		"1234567890"
	dc.b	"Analog",ITEMNAMEEND

ItemName8BitMegaMan2:
	;		"1234567890"
	dc.b	"Mega Man 2",ITEMNAMEEND

ItemName8BitShadowgate:
	;		"1234567890"
	dc.b	"Shadowgate",ITEMNAMEEND

ItemName8BitBayouBilly:
	;		"1234567890"
	dc.b	"BayouBilly",ITEMNAMEEND

ItemName8BitTMNT:
	;		"1234567890"
	dc.b	"TMNT",ITEMNAMEEND

ItemName16BitGoldenAxe:
	;		"1234567890"
	dc.b	"Golden Axe",ITEMNAMEEND

ItemName16BitLastBattle:
	;		"1234567890"
	dc.b	"LastBattle",ITEMNAMEEND

ItemName16BitGalaga90:
	;		"1234567890"
	dc.b	"Galaga '90",ITEMNAMEEND

ItemName16BitVigilante:
	;		"1234567890"
	dc.b	"Vigilante",ITEMNAMEEND

ItemNameHWSBlaster:
	;		"1234567890"
	dc.b	"SndBlaster",ITEMNAMEEND

ItemNameHWProdigy:
	;		"1234567890"
	dc.b	"Prodigy",ITEMNAMEEND

ItemName35Disks:
	;		"123  4            567890"
	dc.b	"3.5",CHAR_DQUOTE," disks",ITEMNAMEEND

ItemNameHWPrintRibbon:
	;		"1234567890"
	dc.b	"PrntRibbon",ITEMNAMEEND

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
	dc.b	"Instructions",ETX

Day00IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"D-Pad=Move Player,change menu selection",ETX

Day00IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"A=Interact with people & objects",ETX

Day00IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"A,C=Confirm menu selection",ETX


Day00IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"B=Cancel menu",ETX


Day00IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Start=Pause",ETX

;-------------------------------------------------------------------------------
; end
;-------------------------------------------------------------------------------
	align 2
