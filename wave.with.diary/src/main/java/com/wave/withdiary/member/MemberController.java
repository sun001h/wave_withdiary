package com.wave.withdiary.member;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wave.withdiary.file.WDFileUtils;
import com.wave.withdiary.friend.FriendService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private FriendService friendService;
	
	// 이미지 처리
	WDFileUtils wdfile = new WDFileUtils();
	String PROFILE_IMAGE_REPO = wdfile.PROFILE_IMAGE_REPO;
	

	// 매핑 /loginForm 에서 /로 수정
	// 최초페이지: 로그인창
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		logger.info("최초페이지/로그인창 {}.", locale);
		
		return "member_loginForm2";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
			RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		MemberVO vo = new MemberVO();
		vo = service.loginByEmail(member);
		
		if(vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", vo);
			session.setAttribute("isLogOn", true);
			System.out.println("세션 아이디: " + session.getId());
			System.out.println("최초 세션 생성 시각: " + new Date(session.getCreationTime()));
			System.out.println("최근 세션 접근 시각: " + new Date(session.getLastAccessedTime()));
			System.out.println("세션 유효 시간: " + session.getMaxInactiveInterval());
			if(session.isNew()) {
				System.out.println("새 세션이 만들어졌습니다.(로그인 세션 생성)");
			}
			// 로그인 성공시 프로필 조회로 이동
			mav.setViewName("redirect:main");
		} else {
			rAttr.addAttribute("result","loginFailed");
			mav.setViewName("redirect:loginForm");
		}
		
		// 세션유지
		model.addAttribute("mysession", vo);
		return mav;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Locale locale, Model model, 
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("로그아웃 {}.", locale);
		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:.";
	}
	
	
	@RequestMapping(value = "/member/updateForm", method = RequestMethod.GET)
	public String updateForm(Locale locale, Model model, String memberCode) {
		logger.info("회원 정보 수정폼 {}.", locale);
		
		MemberVO vo = new MemberVO();
		vo = service.selectMember(memberCode);
		
		model.addAttribute("vo", vo);
		
		return "member_updateForm";
	}
	
	@RequestMapping(value = "/member/updateForm2", method = RequestMethod.GET)
	public String updateForm2(Locale locale, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("회원 정보 수정폼2(레이아웃 입힘)", locale);
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		model.addAttribute("vo", vo);
		
		// 친구 목록 출력
		String memberCode = vo.getMemberCode();
		
		// 특정 멤버코드의 친구들을 조회함
		List<String> friendList = friendService.friend(memberCode);
		System.out.println(friendList);
		System.out.println(friendList.size());
		
		// 그러고 나서 그 멤버코드들로 리스트를 불러옴
		List<MemberVO> list = new ArrayList<MemberVO>();
		for(int i=0; i<friendList.size(); i++) {
			MemberVO friend = new MemberVO();
			String friendCode = friendList.get(i);
			friend = service.selectMember(friendCode);
			list.add(i, friend);
		}
		
		model.addAttribute("friendList", list);
		
		return "member_updateForm2";
	}
	
	
	@RequestMapping(value="/member/update" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity update(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response, String memberCode, String email) throws Exception {
		
		logger.info("수정완료 {}.");
		
		multipartRequest.setCharacterEncoding("utf-8");
		
		Map<String,String> map = new HashMap<String, String>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			map.put(name,value);
		}
		
		String profile_img= wdfile.upload(multipartRequest);
		map.put("profile_img", profile_img);

		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			service.update(map);
			if(profile_img!=null && profile_img.length()!=0) {
				File srcFile = new 
						File(PROFILE_IMAGE_REPO+"\\"+"temp"+"\\"+profile_img);
				File destDir = new File(PROFILE_IMAGE_REPO+"\\"+email);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				String originalFileName = (String)map.get("originalFileName");
				File oldFile = new File(PROFILE_IMAGE_REPO+"\\"+email+"\\"+originalFileName);
				oldFile.delete();
			}

			message = "<script>";
			message += " alert('수정완료');";
			message += " location.href='"+multipartRequest.getContextPath()+"/main?profile_img=" + profile_img +"'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			
		// srcFile의 파일명을 변경 profile_img -> originalFileName
		}catch(Exception e) {
			File srcFile = new File(PROFILE_IMAGE_REPO+"\\"+"temp"+"\\"+profile_img);
			srcFile.delete();
			//무슨 차이가 있는지 모르겠음....
			message = " <script>";
			message +="  alert('오류');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/main?profile_img=" + profile_img +"'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		
		return resEnt;

	}
	
	
	//프로필 사진 수정후, 프로필에서 vo를 세션에서 가져와서 그런지 사진 깨짐
	//(수정반영 되지 않음)
	// 다시 로그인하면 수정한 사진으로 뜸
	@RequestMapping(value = "/member/profile", method = RequestMethod.GET)
	public String profile(HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception{

		logger.info("로그인 프로필 조회 {}.");
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		model.addAttribute("vo", vo);
		
		return "member_profile";
	}
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request, HttpServletResponse response,
			Model model, String profile_img) throws Exception{

		logger.info("로그인 후 최초 페이지 {}.");
		// 프로필 출력
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("vo.getProfile_img()" + vo.getProfile_img());
		if(profile_img != null) {
			vo.setProfile_img(profile_img);
		}
		System.out.println(vo.getProfile_img());
		model.addAttribute("vo", vo);
		
		// 친구 목록 출력
		String memberCode = vo.getMemberCode();
		
		// 특정 멤버코드의 친구들을 조회함
		List<String> friendList = friendService.friend(memberCode);
		System.out.println(friendList);
		System.out.println(friendList.size());
		
		// 그러고 나서 그 멤버코드들로 리스트를 불러옴
		List<MemberVO> list = new ArrayList<MemberVO>();
		for(int i=0; i<friendList.size(); i++) {
			MemberVO friend = new MemberVO();
			String friendCode = friendList.get(i);
			friend = service.selectMember(friendCode);
			list.add(i, friend);
		}
		
		model.addAttribute("friendList", list);
		
		return "admin_main";
	}


}
