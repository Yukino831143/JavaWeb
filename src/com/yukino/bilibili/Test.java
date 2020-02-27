package com.yukino.bilibili;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;

public class Test {
public int writeJson2file(String filepath,String keyword) throws UnsupportedEncodingException,IOException{
		
		System.out.println("filepath="+filepath+" "+"keyword="+keyword);
		File jsonFile = new File(filepath);
		System.out.println(jsonFile.getAbsolutePath());
		if(!jsonFile.exists()) {
			jsonFile.createNewFile();
		}
		FileOutputStream fos = new FileOutputStream(jsonFile);
		OutputStreamWriter osw = new OutputStreamWriter(fos,"UTF-8");
		String jsonStr = "{\"keyword\":"+keyword+"}";
		osw.write(jsonStr);
		//fos.close();
		osw.close();
		return 0;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Test test = new Test();
		String keyword = "雪之下";
		String filepath = "WebContent/json/Java2python.json";//路径是基于JavaWeb目录
		try {
			test.writeJson2file(filepath, keyword);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
