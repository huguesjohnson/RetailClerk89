# Retail Clerk '89
Retail Clerk '89 started as a personal exercise to learn Sega Genesis programming. It's now a complete, albeit short, demo. Although originally inspired by Phantasy Star II and III it morphed into more of an interactive fiction / casual adventure game. It's not especially fun but has a complete story. 

**Things implemented in this demo**

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
* Main story that spans 8 in-game days over the 1989 Xmas season
* Three possible endings

**Building**

I have only ever built this using vasm (http://sun.hasenbraten.de/vasm/) with the motorola syntax module. I have no reason to believe this won't work with any other 68000 assembler.
vasm command line that works: 
vasmm68k_mot -o RetailClerk89.bin -Fbin -spaces RetailClerk89.X68
* the 'spaces' option was added to avoid headaches when linking to code from projects using an assembler that ignores spaces in statements

In const\_GameSettings.X68 there are flags that change the behavior of the demo. The most useful one is \_DEBUG\_ - setting it to $1 adds the debug menu and the speeds up the game. Setting \_ATGAMES\_HACKS to $1 fixes the audio on AtGames clone machines but breaks the demo on real hardware and some emulators. At some point I'll be smart enough to make those command-line arguments instead.

There are additional build tools that require Java 8+ in the /build-tools/ folder. These are not needed to compile the demo from source. However, they are needed if you want to customize sprites, collision maps, or change the memory map. 

This has been fully tested on Gens and BlastEm for Linux. It has also been fully tested on real Genesis model 1 hardware using an Everdrive. It has been minimally tested on Genecyst for DOS, Gens for Windows, and Genesis Plus on Android. It runs on the AtGames Firecore (AKA 'Sega Ultimate Portable Game Player') and is likely to run on other AtGames clones but only the Firecore has been explicitly tested.

**Links**

Project page - http://www.huguesjohnson.com/rc89/

Builds that mostly work - http://www.huguesjohnson.com/rc89/releases.html

**Disclaimers**

This demo is (obviously) not licensed by Sega, there is no relationship between the author of this demo and Sega.

Although this demo is inspired by late 80s mall culture all locations, characters, and events are fictitious. 

