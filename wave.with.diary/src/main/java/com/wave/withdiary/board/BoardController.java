package com.wave.withdiary.board;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.wave.withdiary.friend.FriendService;
import com.wave.withdiary.member.MemberService;
import com.wave.withdiary.member.MemberVO;




@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private FriendService friendService;
	
	
	@RequestMapping(value = "/board/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		logger.info("글 작성 화면");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
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
		

		return "board_writeForm2";
	}

	@RequestMapping(value="/board/insert", method = RequestMethod.POST)
	public String insert(Model model, BoardVO vo) {
		//String membercode = (String) Session.getAttribute("MEMBERCODE");
		logger.info("글 작성하기");
		//vo.setMembercode(membercode);
		vo.setImgFileName("fileName");
		vo.setMap("map");
		vo.setScheduleDate("20210526");
		vo.setViewcnt(0);
		
		boardService.insert(vo);
		return "redirect:list";
	}
	
	@RequestMapping(value = "/board/view", method = RequestMethod.GET)
	public String view(Model model, int d_articlenumber, String clear) {
		
		logger.info("글 상세보기");

		BoardVO vo = boardService.read(d_articlenumber);
		model.addAttribute("vo", vo);

		return "board_view";
	}	
	
	@RequestMapping(value = "/board/updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, BoardVO vo) {
		logger.info("updateForm");
		
		model.addAttribute("update", boardService.read(vo.getd_articlenumber()));
		
		return "board_updateForm";
	}
	
	@RequestMapping(value = "/board/update", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Model model, BoardVO vo) {
		
		logger.info("글 수정하기");
		boardService.update(vo);
		return "redirect:view?d_articlenumber="+vo.getd_articlenumber()+"&clear=y";
	}	

	@RequestMapping(value = "/board/delete")
	public String delete(int d_articlenumber) {
		
		logger.info("글 삭제하기");

		boardService.delete(d_articlenumber);
		return "redirect:list";
	}	
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		logger.info("글 목록 조회");
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
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
		
		
		List<BoardVO> boardList = boardService.listAll(memberCode);
		model.addAttribute("list", boardList);

		return "board_list2";
	}
	
	
	
	
	
	
	

}
