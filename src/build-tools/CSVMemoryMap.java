/*
 The MIT License(MIT)

Copyright(c) 2016 Hugues Johnson

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files(the "Software"), to deal in 
the Software without restriction, including without limitation the rights to 
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
of the Software, and to permit persons to whom the Software is furnished to do 
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
THE SOFTWARE.
*/

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.Reader;

public class CSVMemoryMap{
    private static final String newLine=System.lineSeparator();
    private static final String delimiter=",";

    public static void main(String[] args){
        String defaultBaseAddress="0FF00000";
        BufferedReader bufferedReader=null;
        OutputStreamWriter outputStreamWriter=null;
        int lineNumber=0;
        String currentLine=null;
        try{
            if(args.length<2){
                throw new Exception("Expecting two required arguments: sourcefile outputfile");
            }
            String sourceFile=args[0];
            String outputFile=args[1];
            String currentAddressHex=defaultBaseAddress;
            if(args.length>2){
                currentAddressHex=args[2];
            }
            int currentAddressInt=Integer.valueOf(currentAddressHex,16);
            bufferedReader=new BufferedReader(new InputStreamReader(new FileInputStream(sourceFile)));
            outputStreamWriter=new FileWriter(outputFile);
            while((currentLine=bufferedReader.readLine())!=null){
                lineNumber++;
                String[] split=currentLine.split(",");
                if(split.length!=3){
                    throw new Exception("Invalid length in line "+lineNumber+" expected 3 actual "+split.length);
                }
                StringBuffer stringBuffer=new StringBuffer();
                stringBuffer.append(split[0]);
                stringBuffer.append("=$");
                stringBuffer.append(Integer.toHexString(currentAddressInt).toUpperCase());
                stringBuffer.append("\t; ");
                stringBuffer.append(split[2]);
                stringBuffer.append(newLine);
                outputStreamWriter.write(stringBuffer.toString());
                int size=Integer.parseInt(split[1]);
                currentAddressInt+=size;
            }
        }
        catch(Exception x){
            if(lineNumber>0){
                System.out.println("Error in line: "+lineNumber);
            }
            if(currentLine!=null){
                System.out.println("Current line: "+currentLine);
            }
            x.printStackTrace();
        }
        finally{
            try{
                if(bufferedReader!=null){
                    bufferedReader.close();
                }
            }
            catch(Exception x){}
            try{
                if(outputStreamWriter!=null){
                    outputStreamWriter.flush();
                    outputStreamWriter.close();
                }
            }
            catch(Exception x){}
        }
    }
}

