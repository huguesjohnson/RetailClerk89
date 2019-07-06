# Retail Clerk '89
Retail Clerk '89 started as a personal exercise to learn Sega Genesis programming. It's now a nearly finished game demo. Although originally inspired by Phantasy Star II and III it morphed into more of an interactive fiction game. It's not especially fun but has a complete story. 

**Currently implemented**

* Drawing background graphics and sprites
* Capturing controller input and moving a sprite based on it
* Playing and pausing background music
* Collision detection
* Game state management
* Game script and event processing
* Dialog between characters
* Branching dialog based on player choices
* Transition between main playable characters
* Title screens, intro screens, and ending screens
* Saving and loading
* Story demo with three possible endings

**Not implemented**

* At this point.. just the fully debugged game. The current plan is to have v1.0 of the game released by Black Friday 2019, likely sooner.

**Building**

I have only ever built this using vasm (http://sun.hasenbraten.de/vasm/) with the motorola syntax module. I have no reason to believe this won't work with any other 68000 assembler.
vasm command line that works: 
vasmm68k_mot -o RetailClerk89.bin -Fbin -spaces RetailClerk89.X68
* the 'spaces' option was added to avoid headaches when linking to code from projects using an assembler that ignores spaces in statements

You'll probably want to go into const\_GameSettings.X68 and set \_DEBUG\_ to $0. Also setting \_ATGAMES\_HACKS to $0 is required if you want to run this on real hardware. At some point I'll be smart enough to make those command-line arguments instead.

There are additional build tools that require Java 8+ in the /build-tools/ folder. These are not needed to compile the demo from source. However, they are needed if you want to customize sprites, collision maps, or change the memory map. 

This has been fully tested on Gens and BlastEm for Linux. It has also been fully tested on real Genesis model 1 hardware using an Everdrive. It has been minimally tested on Genecyst for DOS, Gens for Windows, and Genesis Plus on Android. After wrestling with the AtGames Firecore it runs on that too if \_ATGAMES\_HACKS are enabled. This makes it likely to run on other AtGames clones but only the Firecore has been explicitly tested. Enabling \_ATGAMES\_HACKS breaks the demo on actual Genesis hardware and Genesis Plus.

**Links**

Project page - http://www.huguesjohnson.com/rc89/

Builds that mostly work - http://www.huguesjohnson.com/rc89/releases.html

**Disclaimers**

This demo is (obviously) not licensed by Sega, there is no relationship between the author of this demo and Sega.

Although this demo is inspired by late 80s mall culture all locations, characters, and events are fictitious. 

