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
	
	
	
	


}
