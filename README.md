# Retail Clerk '89
Retail Clerk '89 is a personal exercise to learn Sega Genesis programming. This might even turn into a real game demo one day.

See http://HuguesJohnson.com/ for articles/devbloggy stuff about this project.

**Currently implemented**

Basic framework for:
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
* Short demo used to test all this stuff

**Not implemented**

* Fully scripted game - the wiki page here in Github has more information about the roadmap

**Building**

I have only ever built this using vasm (http://sun.hasenbraten.de/vasm/) with the motorola syntax module. I have no reason to believe this won't work with any other 68000 assembler.
vasm command line that works: 
vasmm68k_mot -o RetailClerk89.bin -Fbin -spaces RetailClerk89.X68
* the 'spaces' option was added to avoid headaches when linking to code from projects using an assembler that ignores spaces in statements

This has been fully tested on Gens and BlastEm for Linux. It has been minimally tested on Genecyst and Gens for Windows. The latest build has issues on Genesis Plus and derivatives.

**Disclaimers**

This demo is (obviously) not licensed by Sega, there is no relationship between the author of this demo and Sega.

Although this demo is inspired by late 80s mall culture all locations, characters, and events are fictitious. 

