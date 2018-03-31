if [ ! -e "BuildSpriteTiles.class" ]; then
    echo "Compiling BuildSpriteTiles"
	javac BuildSpriteTiles.java
fi 

java -cp . BuildSpriteTiles SpriteTiles.list
