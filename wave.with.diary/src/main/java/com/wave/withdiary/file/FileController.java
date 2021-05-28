package com.wave.withdiary.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileController {
	
	private static String PROFILE_IMAGE_REPO = "C:\\WD\\profile_image";

	@RequestMapping("/download")
	protected void download(@RequestParam("profile_img") String profile_img,
			@RequestParam("email") String email,
			HttpServletResponse response)throws Exception {
		
		OutputStream out = response.getOutputStream();
		String downFile = PROFILE_IMAGE_REPO + "\\" +email+"\\"+ profile_img;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + profile_img);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

}
