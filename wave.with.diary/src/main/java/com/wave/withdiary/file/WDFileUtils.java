package com.wave.withdiary.file;

import java.io.File;
import java.util.Iterator;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class WDFileUtils {
	
	public String PROFILE_IMAGE_REPO = "C:\\WD\\profile_image";
	public String WD_LOGO = "https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F598cdcf9-faae-42e5-891b-5b721597677f%2F___(5).png?table=block&id=09c31b3c-86d3-49cc-99b4-8d187c966b37&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=1240&userId=&cache=v2";
	public String login_logo = "https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F4fdf03a0-151a-4395-8691-56170ce26f19%2F___(3).png?table=block&id=f1ba2b23-7901-4f61-8d20-286c09e128c7&spaceId=daff88ef-0086-4ee6-aed1-df9fa5e35f0d&width=3600&userId=&cache=v2";

	// 링크 수정해야함!!
	public String update_link = "member/updateForm2";
	public String diary_link = "board/list";
	public String cash_link = "cash/listpage";
	public String study_link = "study/list";
	
	
	
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
