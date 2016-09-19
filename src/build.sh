# build the collision data
cd collision-maps
echo "Building collision data..."
sh JBMP2ASM.sh store-512x512.bmp map_StoreCollision.X68
cd ..

# build the rom
echo "Building ROM..."
vasmm68k_mot -o RetailClerk89.bin -Fbin -no-opt -nosym RetailClerk89.X68
