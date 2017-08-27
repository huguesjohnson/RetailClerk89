# build the collision data
cd build-tools
echo "Building collision data..."
sh BMPtoCollisionData.sh
# build the memory map
echo "Building memory map..."
sh CSVMemoryMap.sh ../MemoryMap.csv ../const_MemoryMap.X68 FFFF0000
cd ..

# build the rom
echo "Building ROM..."
vasmm68k_mot -o RetailClerk89.bin -Fbin -no-opt -nosym -spaces RetailClerk89.X68
