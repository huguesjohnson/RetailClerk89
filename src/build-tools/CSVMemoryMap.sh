if [ ! -e "CSVMemoryMap.class" ]; then
    echo "Compiling CSVMemoryMap"
	javac CSVMemoryMap.java
fi 
java -cp . CSVMemoryMap ${1} ${2} ${3}
