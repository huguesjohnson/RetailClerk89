/* 
rewrite of BMPtoTiles.java to work with sprite sheets

this exists entirely because of my short-sightedness and inability to create more effective tooling

code to read bmp pixels is from: http://stackoverflow.com/questions/17015340/how-to-read-a-bmp-file-identify-which-pixels-are-black-in-java

everything else by Hugues Johnson (http://HuguesJohnson.com/)

the entire contents of this file are licensed under cc by-sa 3.0 https://creativecommons.org/licenses/by-sa/3.0/
*/
import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

import javax.imageio.ImageIO;

public class BuildSpriteTiles{
	private final static String newLine=System.lineSeparator();

	//arg[0]=file list
	public static void main(String[] args){
		FileWriter writer=null;
		BufferedReader listReader=null;
		try{
			if(args.length!=1){throw(new Exception("Expecting one argument: filelist"));}
			File listFile=new File(args[0]);
			listReader=new BufferedReader(new FileReader(listFile));
    		String currentLine;
    		while((currentLine=listReader.readLine())!=null){
				String[] split=currentLine.split(",");
				String sourceFilePath=split[0];
				String outputFilePath=split[1];
				//initialize array to store colors
				ArrayList<String> colors=new ArrayList<String>();
				colors.add("ffe000e0");//00
				colors.add("ff000000");//01
				colors.add("ff806440");//02
				colors.add("ffe0c8a0");//03
				colors.add("ff80a8c0");//04		
				colors.add("ff604020");//05
				colors.add("ffc0a880");//06
				colors.add("ffa06420");//07
				colors.add("ff608440");//08
				colors.add("ff802080");//09
				colors.add("ffc0c8c0");//0A
				colors.add("ffc06420");//0B
				colors.add("ffc00000");//0C
				colors.add("ffe0e8e0");//0D
				colors.add("ffe0c820");//0E
				colors.add("ff6084a0");//0F
				//get the name of the sprite - used to label frames later on
				String spriteName=outputFilePath.substring((outputFilePath.lastIndexOf('/')+1),outputFilePath.lastIndexOf('.'));
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
				int totalFrames=12;
				int currentFrame=0;
				writer=new FileWriter(outputFilePath);
				//loop through sprite sheet
				while(currentFrame<totalFrames){
					writer.write(newLine);
					writer.write(spriteName+"_Frame"+currentFrame+"Start:");
					writer.write(newLine);
					writer.write(newLine);
					for(int col=0;col<=1;col++){
						for(int row=0;row<=3;row++){
							//loop through each pixel of the next 8x8 cell
							for(int y=0;y<8;y++){
								StringBuffer line=new StringBuffer();
								line.append("\tdc.l\t$");
								for(int x=0;x<8;x++){
									int pixelX=(col*8)+x;
									int pixelY=(row*8)+(currentFrame*32)+y;
									int color=image.getRGB(pixelX,pixelY); 
									String hexString=Integer.toHexString(color);
									int index=colors.indexOf(hexString);
									if(index<0){
										//for debugging
										System.out.println("New color "+hexString+"found at:"+y+" "+x);
										colors.add(hexString);
										index=colors.size()-1;
									}
									line.append(Integer.toHexString(index).toUpperCase());
								}
								line.append(newLine);
								writer.write(line.toString());
							}
							writer.write(newLine);
						}
					}
					writer.write(spriteName+"_Frame"+currentFrame+"End:");
					writer.write(newLine);
					currentFrame++;
				}
			    System.out.println("Successfully wrote "+outputFilePath);
				writer.flush();
				writer.close();
		    }
		}catch(Exception x){
			x.printStackTrace();			
		}finally{
			try{if(listReader!=null){listReader.close();}}catch(Exception x){}
			try{if(writer!=null){writer.flush(); writer.close();}}catch(Exception x){}
		}
	}	
	
}
