import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;

import javax.imageio.ImageIO;

//code to read bmp pixels is from: http://stackoverflow.com/questions/17015340/how-to-read-a-bmp-file-identify-which-pixels-are-black-in-java
//everything else by Hugues Johnson (http://HuguesJohnson.com/)
//the entire contents of this file are licensed under cc by-sa 3.0 https://creativecommons.org/licenses/by-sa/3.0/
public class JBMP2ASM{
	private final static String newLine=System.lineSeparator();

	//arg[0]=source file (bitmap)
	//arg[1]=output file (text)
	//if the width of the image isn't a multiple of 32 then bad times
	public static void main(String[] args){
		FileWriter writer=null;
		try{
			if(args.length!=2){throw(new Exception("Expecting two arguments: sourcefile outputfile"));}
			String sourceFilePath=args[0];
			String outputFilePath=args[1];
			File sourceFile=new File(sourceFilePath);
			BufferedImage image=ImageIO.read(sourceFile);
			int width=image.getWidth();
			if(width%32!=0){throw(new Exception("Image width must be a multiple of 32"));}
			int height=image.getHeight();
			int rowCounter=0;
			int colCounter=0;
			writer=new FileWriter(outputFilePath);
		    for(int y=0;y<height;y++){
		    	long longValue=0;
		    	int power=0;
			    for(int x=0;x<width;x++){
			    	int color=image.getRGB(x,y);
			    	if (color!=Color.WHITE.getRGB()){
	                    longValue+=Math.pow(2,power);
			    	}
			    	if(power==31){
			    		StringBuffer hexValue=new StringBuffer(Long.toHexString(longValue).toUpperCase());
			    		int pad=8-hexValue.length();
			    		for(int i=0;i<pad;i++){hexValue.insert(0,'0');}
			    		hexValue.insert(0,"\tdc.l\t$");
						hexValue.append("\t; ");
						hexValue.append("row[");
						hexValue.append(rowCounter);
						hexValue.append("] col[");
						hexValue.append(colCounter);
						hexValue.append("]");
						if(colCounter==0){
							colCounter++;
						}else{
							colCounter=0;
							rowCounter++;
						}
						hexValue.append(newLine);
						writer.write(hexValue.toString());
				    	longValue=0;
				    	power=0;
			    	}else{
			    		power++;
			    	}
			    }
		    }
		    System.out.println("Successfully wrote "+outputFilePath);
		}catch(Exception x){
			x.printStackTrace();			
		}finally{
			try{if(writer!=null){writer.flush(); writer.close();}}catch(Exception x){ }
		}
	}
}
