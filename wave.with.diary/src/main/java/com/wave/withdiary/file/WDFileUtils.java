package com.wave.withdiary.file;

import java.io.File;
import java.util.Iterator;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class WDFileUtils {
	
	public String PROFILE_IMAGE_REPO = "C:\\WD\\profile_image";
	
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
