package com.wave.withdiary.study;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wave.withdiary.friend.FriendService;
import com.wave.withdiary.member.MemberService;
import com.wave.withdiary.member.MemberVO;

@Controller
public class StudyController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);

	@Autowired
	private StudyService studyService;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private FriendService friendService;
	

	@RequestMapping(value = "/study/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("스터디 리스트 폼 {}.", locale);
		
		// 프로필 출력
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
		
		
		// 스터디 리스트를 부르는 부분
		List<StudyDTO> study_list = studyService.listSch();
		
		model.addAttribute("list", study_list);
		System.out.println("사이즈 :" + study_list.size());
		return "study_list2";
	}

	@RequestMapping(value = "/study/insertForm", method = RequestMethod.GET)
	public String insertForm(Locale locale, Model model ,HttpServletRequest request, HttpServletResponse response ) {
		logger.info("스터디 추가 입력폼 {}.", locale);
		
		// 프로필 출력
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
		
		return "study_insertForm2";
	}

	@RequestMapping(value = "/study/insertResult", method = RequestMethod.POST)
	public String insertResult(Locale locale, Model model, HttpServletRequest request, 
				HttpServletResponse response, StudyDTO dto) {

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		/* System.out.println(df.format(cal.getTime())); */
		
		// 프로필 출력
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		model.addAttribute("vo", vo);
		
		// 친구 목록 출력
		String memberCode = vo.getMemberCode();
		System.out.println("멤버코드" + memberCode);
		dto.setMemberCode(memberCode);
		dto.setStudyDate(df.format(cal.getTime()));
		// 특정 멤버코드의 친구들을 조회함
		List<String> friendList = friendService.friend(memberCode);
		
		// 그러고 나서 그 멤버코드들로 리스트를 불러옴
		List<MemberVO> list = new ArrayList<MemberVO>();
		for(int i=0; i<friendList.size(); i++) {
			MemberVO friend = new MemberVO();
			String friendCode = friendList.get(i);
			friend = service.selectMember(friendCode);
			list.add(i, friend);
		}
		
		
		model.addAttribute("friendList", list);
		
		studyService.insertSch(dto);
		return "redirect:list";
	}

	@RequestMapping(value = "/study/view", method = RequestMethod.GET)
	public String view(Locale locale, Model model, HttpServletRequest request, 
			HttpServletResponse response, int studyNO) {
		logger.info("스터디일정 상세보기 폼{}.", locale);
		
		// 프로필 출력
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

		StudyDTO dto = new StudyDTO();
		dto = studyService.selectSch(studyNO);

		model.addAttribute("dto", dto);

		return "study_view2";
	}

	@RequestMapping(value = "/study/delete", method = RequestMethod.POST)
	public String delete(Locale locale, Model model, StudyDTO dto) {
		logger.info("스터디일정 삭제{}.", locale);

		int studyNO = dto.getStudyNO();
		System.out.println(studyNO);
		studyService.deleteSch(studyNO);
		return "redirect:list";
	}

	@RequestMapping(value = "/study/updateForm", method = RequestMethod.GET)
	public String updateForm(Locale locale, Model model, HttpServletRequest request, 
			HttpServletResponse response, StudyDTO dto) {
		logger.info("스터디일정 수정 입력폼{}.", locale);
		
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
		int studyNO = dto.getStudyNO();
		System.out.println(studyNO);
		
		model.addAttribute("dto", dto);

		return "study_updateForm2";
	}

	@RequestMapping(value = "/study/update", method = RequestMethod.POST)
	public String update(Locale locale, Model model, HttpServletRequest request, 
			HttpServletResponse response, StudyDTO dto) {
		logger.info("스터디일정 수정완료{}.", locale);
		
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
		
		
		System.out.println(dto.toString());
		studyService.updateSch(dto);
		return "redirect:view?studyNO=" + dto.getStudyNO();
	}
}
