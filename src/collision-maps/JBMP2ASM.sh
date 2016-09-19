if [ ! -e "JBMP2ASM.class" ]; then
    echo "Compiling JBMP2ASM"
	javac JBMP2ASM.java
fi 
java -cp . JBMP2ASM ${1} ${2}
