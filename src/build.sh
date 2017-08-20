# build the collision data
cd build-tools
echo "Building collision data..."
sh BMPtoCollisionData.sh ../collision-maps/store-00-512x512.bmp ../collision-maps/map_Store00Collision.X68
sh BMPtoCollisionData.sh ../collision-maps/store-01-512x512.bmp ../collision-maps/map_Store01Collision.X68
# build the memory map
echo "Building memory map..."
sh CSVMemoryMap.sh ../MemoryMap.csv ../const_MemoryMap.X68 FFFF0000
cd ..

# build the rom
echo "Building ROM..."
vasmm68k_mot -o RetailClerk89.bin -Fbin -no-opt -nosym -spaces RetailClerk89.X68
