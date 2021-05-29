package com.wave.withdiary.file;

import java.io.File;
import java.util.Iterator;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class WDFileUtils {
	
	public String PROFILE_IMAGE_REPO = "C:\\WD\\profile_image";
	public String WD_LOGO = "https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F36f8b563-690f-48ca-acfd-83ed511f3c5a%2Flogo_transparent.png?table=block&id=1c360f74-d1d2-4f8b-a1c3-6a83412eb0d8&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=2400&userId=&cache=v2";
	public String login_logo = "https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4fdf03a0-151a-4395-8691-56170ce26f19%2F___(3).png?table=block&id=f1ba2b23-7901-4f61-8d20-286c09e128c7&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=3600&userId=&cache=v2";
	
	
	
	public String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String profile_img= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			profile_img=mFile.getOriginalFilename();
			File file = new File(PROFILE_IMAGE_REPO +"\\"+ fileName);
			if(mFile.getSize()!=0){ 
				if(! file.exists()){ 
					if(file.getParentFile().mkdirs()){ 
						file.createNewFile(); 
					}
				}
				mFile.transferTo(new File(PROFILE_IMAGE_REPO +"\\"+"temp"+ "\\"+profile_img));
			}
		}
		return profile_img;
	}
}
