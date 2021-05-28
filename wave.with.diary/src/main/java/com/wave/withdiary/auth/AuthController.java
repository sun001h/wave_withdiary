package com.wave.withdiary.auth;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.wave.withdiary.auth.mail.MailSendService;
import com.wave.withdiary.file.WDFileUtils;
import com.wave.withdiary.member.MemberService;
import com.wave.withdiary.member.MemberVO;

@Controller
public class AuthController {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	@Autowired
	private AuthService authService;
	
	@Autowired
	private MailSendService mailService;
	
	@Autowired
	private MemberService memberService;
	
	// 이미지 처리
	WDFileUtils wdfile = new WDFileUtils();
	String PROFILE_IMAGE_REPO = wdfile.PROFILE_IMAGE_REPO;
	 
	
	@RequestMapping(value = "/auth/addByMapForm", method = RequestMethod.GET)
	public String addByMapForm(Locale locale, Model model) {
		logger.info("회원가입 폼 {}.", locale);
		
		return "auth_addByMapForm";
	}
	
	
	@RequestMapping(value="/auth/addByMap" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addByMap(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response, String bday, String email) throws Exception {
		
		logger.info("회원가입 폼 완료 및 이메일 인증 요청 {}.");
		
		multipartRequest.setCharacterEncoding("utf-8");
		
		// 생년월일을 DB와 맞춰 변환
		System.out.println(bday);
		String birthyear = bday.substring(0, 4);
		String birthday = bday.substring(5, 7) + bday.substring(8);
		System.out.println("birthyear: "+ birthyear);
		System.out.println("birthday: "+ birthday);
		
		Map<String,String> map = new HashMap<String, String>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			map.put(name,value);
		}
		
		map.put("birthyear", birthyear);
		map.put("birthday", birthday);
		
		// 임의의 authKey 생성 & 이메일 발송
		String authKey = mailService.sendAuthMail(email);
		map.put("authKey", authKey);
		
		String profile_img= wdfile.upload(multipartRequest);
		map.put("profile_img", profile_img);

		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			authService.addMemberByMap(map);
			if(profile_img!=null && profile_img.length()!=0) {
				File srcFile = new 
						File(PROFILE_IMAGE_REPO+"\\"+"temp"+"\\"+profile_img);
				File destDir = new File(PROFILE_IMAGE_REPO+"\\"+email);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += " alert('회원 추가');";
			message += " location.href='"+multipartRequest.getContextPath()+"/sendMail'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		}catch(Exception e) {
			File srcFile = new File(PROFILE_IMAGE_REPO+"\\"+"temp"+"\\"+profile_img);
			srcFile.delete();

			message = " <script>";
			message +="  alert('오류');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/addByMapForm'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;

	}
	
	@RequestMapping(value="/overlapped" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("email") String email, 
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ResponseEntity resEntity = null;
		String result = authService.overlapped(email);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public String sendMail(Locale locale, Model model) {
		logger.info("회원 가입 완료 및 이메일 인증 안내창 {}.", locale);
		
		return "sendMail";
	}
	
	@RequestMapping(value = "/signUpConfirm", method = RequestMethod.GET)
	public String signUpConfirm(Locale locale, Model model, String email, String authKey) {
		logger.info("이메일 인증 완료 {}.", locale);

		//email, authKey 가 일치할경우 authStatus 업데이트
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("authKey", authKey);
		map.put("authStatus", "1");
		System.out.println(map);
		authService.updateAuthStatus(map);
		// 실패의 경우도 만들어야함!!
		// 그리고 여기까지가 인증
		// 인증되면 이메일로 dto를 불러와 멤버코드를 만들고 DB에 저장
		// 인증까지는 성공(일단은 성공의 경우만 작성함)
		
		// dto 불러옴
		AuthDTO dto = new AuthDTO();
		dto = authService.selectMember(email);
		
		// 멤버코드 만들기
		String memberCode = authService.createCode(email);
		
		// vo에 저장하기
		MemberVO vo = new MemberVO();
		vo.setMemberCode(memberCode);
		vo.setEmail(dto.getEmail());
		vo.setPwd(dto.getPwd());
		vo.setBirthyear(dto.getBirthyear());
		vo.setBirthday(dto.getBirthday());
		vo.setNickname(dto.getNickname());
		vo.setProfile_img(dto.getProfile_img());
		vo.setGender(dto.getGender());
		vo.setProfile(dto.getProfile());
		System.out.println(vo.toString());
		
		// 멤버테이블에 insert하기
		memberService.addMember(vo);
		
		return "main";
	}
	
	

}
