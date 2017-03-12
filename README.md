# Retail Clerk '89
Retail Clerk '89 is a personal exercise to learn Sega Genesis programming. This might even turn into a real game demo one day.

See http://HuguesJohnson.com/ for articles/devbloggy stuff about this project.

**Currently implemented**

Basic framework for:
* Drawing background graphics and sprites
* Capturing controller input and moving a sprite based on it
* Playing and pausing background music
* Sprite collision detection against scenery and other sprites
* Very simple game state management

**Not implemented**

Anything that would make this resemble an actual game

**Building**

I have only built this using vasm (http://sun.hasenbraten.de/vasm/) with the motorola syntax module. I have no reason to believe this won't work with any other 68000 assembler.
vasm command line that works: 
vasmm68k_mot -o RetailClerk89.bin -Fbin -no-opt -nosym -spaces RetailClerk89.X68
* no-opt is not used because I haven't tested if optimizations break anything
* the 'spaces' option was added to avoid headaches when linking to code from projects using an assembler that ignores spaces in statements

This has only ever been tested on Gens for Linux and Windows.
