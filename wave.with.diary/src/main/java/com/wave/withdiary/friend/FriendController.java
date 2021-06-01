package com.wave.withdiary.friend;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.wave.withdiary.board.BoardService;
import com.wave.withdiary.board.BoardVO;
import com.wave.withdiary.member.MemberService;
import com.wave.withdiary.member.MemberVO;
 

@Controller
@SessionAttributes("mysession")
public class FriendController {
	
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private MemberService service;
	
	@Autowired	
	private FriendService friendService;
	
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping(value = "/friend/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, Locale locale, Model model) {
		logger.info("친구목록 {}.", locale);
		
		HttpSession session = request.getSession();
		MemberVO vo =(MemberVO) session.getAttribute("member");

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
		
		model.addAttribute("list", list);
		
		return "friend_list";
	}
	
	
	
	@RequestMapping(value = "/friend/diary", method = RequestMethod.GET)
	public String friendDiary(HttpServletRequest request, Locale locale, Model model, String fcode) {
		logger.info("친구의 다이어리 페이지{}.", locale);
		
		HttpSession session = request.getSession();
		MemberVO vo =(MemberVO) session.getAttribute("member");
		System.out.println(vo);
		String memberCode = vo.getMemberCode();
		model.addAttribute("vo", vo);
		
		// 특정 멤버코드의 친구들을 조회함
		List<String> friendList = friendService.friend(memberCode);
		System.out.println(friendList);
		System.out.println(friendList.size());
		
		// 그러고 나서 그 멤버코드들로 리스트를 불러옴
		List<MemberVO> friendVOList = new ArrayList<MemberVO>();
		for(int i=0; i<friendList.size(); i++) {
			MemberVO friend = new MemberVO();
			String friendCode = friendList.get(i);
			friend = service.selectMember(friendCode);
			friendVOList.add(i, friend);
		}
		
		model.addAttribute("friendList", friendVOList);
		
		MemberVO fvo = service.selectMember(fcode);
		List<BoardVO> friendBoard = boardService.listAll(fcode);
		model.addAttribute("friendBoard", friendBoard);
		
		return "friend_board";
	}
	
	
	@RequestMapping(value = "/friend/addForm", method = RequestMethod.GET)
	public String addFriendForm(HttpServletRequest request, Locale locale, Model model, String fcode) {
		logger.info("친구추가{}.", locale);
		
		// 프로필 출력
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("vo.getProfile_img()" + vo.getProfile_img());
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
		
		return "friend_add";
	}
	
	@RequestMapping(value = "/friend/add", method = RequestMethod.POST)
	public String addFriend(HttpServletRequest request, Locale locale, Model model, String email) {
		logger.info("친구추가 완료{}.", locale);
		
		// 프로필 출력
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("vo.getProfile_img()" + vo.getProfile_img());
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
		
		MemberVO friendvo = friendService.selectByEmail(email);
		FriendDTO dto = new FriendDTO();
		dto.setMemberCode(memberCode);
		dto.setFriendCode(friendvo.getMemberCode());
		friendService.addFriend(dto);
		// 실패 처리 안함
		
		return "redirect:/main";
	}


}
