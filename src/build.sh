# build the collision data
cd build-tools
echo "Building collision data..."
sh JBMP2ASM.sh ../collision-maps/store-512x512.bmp ../collision-maps/map_StoreCollision.X68
# build the memory map
echo "Building memory map..."
sh CSVMemoryMap.sh ../MemoryMap.csv ../const_MemoryMap.X68 FF00000
cd ..

# build the rom
echo "Building ROM..."
vasmm68k_mot -o RetailClerk89.bin -Fbin -no-opt -nosym RetailClerk89.X68
