/* 
the purpose of this is to extract 8x8 tiles from a bmp
the dimensions of the bmp must be a multiple of 8
if the bmp has more than 16 colors something bad will happen

this is not called from the build script but is being included in the off chance it's helpful to anyone

code to read bmp pixels is from: http://stackoverflow.com/questions/17015340/how-to-read-a-bmp-file-identify-which-pixels-are-black-in-java

everything else by Hugues Johnson (http://HuguesJohnson.com/)

the entire contents of this file are licensed under cc by-sa 3.0 https://creativecommons.org/licenses/by-sa/3.0/
*/
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;

import javax.imageio.ImageIO;

public class BMPtoTiles{
	private final static String newLine=System.lineSeparator();

	//arg[0]=source file (bitmap)
	//arg[1]=output file (text)
	//arg[n]=initial colors to add to the array - i.e.  transparency color in entry 0
	//if the width of the image isn't a multiple of 32 then bad times
	public static void main(String[] args){
		FileWriter writer=null;
		try{
			if(args.length<2){throw(new Exception("Expecting two arguments: sourcefile outputfile"));}
			String sourceFilePath=args[0];
			String outputFilePath=args[1];
			//initialize array to store colors
			ArrayList<String> colors=new ArrayList<String>();
			int argIndex=2;
			while(argIndex<args.length){
				colors.add(args[argIndex]);
				argIndex++;
			}
			//open the image
			File sourceFile=new File(sourceFilePath);
			BufferedImage image=ImageIO.read(sourceFile);
			//get & test image width
			int width=image.getWidth();
			if(width%8!=0){throw(new Exception("Image width must be a multiple of 8"));}
			//get & test image height
			int height=image.getHeight();
			if(height%8!=0){throw(new Exception("Image width must be a multiple of 8"));}
			//setup variables used to track reading the image
			int row=0;
			//open the output file
			writer=new FileWriter(outputFilePath);
			while(row<height){
				int col=0;
				while(col<width){
					//loop through each pixel of the next 8x8 cell
					for(int y=row;y<(row+8);y++){
						StringBuffer line=new StringBuffer();
						line.append("\tdc.l\t$");
						for(int x=col;x<(col+8);x++){
							int color=image.getRGB(x,y);
							String hexString=Integer.toHexString(color);
							int index=colors.indexOf(hexString);
							if(index<0){
								colors.add(hexString);
								index=colors.size()-1;
							}
							line.append(Integer.toHexString(index).toUpperCase());
						}
						line.append(newLine);
						writer.write(line.toString());
					}
					col+=8;
					writer.write(newLine);
				}
				row+=8;
			}
		    System.out.println("Successfully wrote "+outputFilePath);
		    System.out.println("Color list:");
		    for(int i=0;i<colors.size();i++){
		    	System.out.println(colors.get(i));
		    }
		}catch(Exception x){
			x.printStackTrace();			
		}finally{
			try{if(writer!=null){writer.flush(); writer.close();}}catch(Exception x){x.printStackTrace();}
		}
	}
}
