if [ ! -e "BMPtoCollisionData.class" ]; then
    echo "Compiling BMPtoCollisionData"
	javac BMPtoCollisionData.java
fi 
java -cp . BMPtoCollisionData ${1} ${2}
