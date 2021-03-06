package com.wave.withdiary.cash;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wave.withdiary.friend.FriendService;
import com.wave.withdiary.member.MemberService;
import com.wave.withdiary.member.MemberVO;

@Controller
@SessionAttributes("mysession")
public class CashController {

	private static final Logger logger = LoggerFactory.getLogger(CashController.class);

	@Autowired
	private IAccountService acService;
	@Autowired
	private FriendService friendService;
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/cash/listpage", method = { RequestMethod.GET, RequestMethod.POST })
	public String listpage(HttpServletRequest request, @ModelAttribute("cri") Criteria cri, Locale locale,
			Model model) {
		logger.info("가계부목록 페이징 {}.", locale);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("session_ID: " + vo);
		cri.setMemberCode(vo.getMemberCode());

		// 날짜 별 조회
		// 시작일
		String fchdate = request.getParameter("fchdate");
		// 마지막 일
		String tchdate = request.getParameter("tchdate");
		// 맵으로 묶기
		Map<String, Object> map = new HashMap<>();
		// 날짜
		map.put("fchdate", fchdate);
		map.put("tchdate", tchdate);
		// 페이징
		map.put("rowStart", cri.getRowStart());
		map.put("rowEnd", cri.getRowEnd());
		// 멤버 별 코드
		map.put("memberCode", vo.getMemberCode());
		System.out.println(vo.getMemberCode());

		// map으로 묶어서 리스트 전달
		List<AccountDTO> list = acService.getAllListPage(map);
		model.addAttribute("list", list);
		System.out.println("사이즈:" + list.size());

		// 차트CT
		List<ChartCT> clist = acService.chartCount(map);
		model.addAttribute("clist", clist);
		System.out.println("clist : " + clist.size());
		// 차트Money
		List<ChartMoney> mlist = acService.chartMoney(map);
		model.addAttribute("mlist", mlist);
		System.out.println("mlist : " + mlist.size());

		// 페이징
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("listCount : " + acService.listCount(map));
		pageMaker.setTotalCount(acService.listCount(map));
		model.addAttribute("pageMaker", pageMaker);

		// 세션유지
		model.addAttribute("mysession", vo);

		// 회원프로필 출력
		model.addAttribute("vo", vo);

		// 친구 목록 출력
		String memberCode = vo.getMemberCode();

		// 특정 멤버코드의 친구들을 조회함
		List<String> friendList = friendService.friend(memberCode);
		System.out.println(friendList);
		System.out.println(friendList.size());

		// 그러고 나서 그 멤버코드들로 리스트를 불러옴
		List<MemberVO> friendvo = new ArrayList<MemberVO>();
		for (int i = 0; i < friendList.size(); i++) {
			MemberVO friend = new MemberVO();
			String friendCode = friendList.get(i);
			friend = service.selectMember(friendCode);
			friendvo.add(i, friend);
		}

		model.addAttribute("friendList", friendvo);

		return "cash_listpage";
	}

	@RequestMapping(value = "/cash/insertForm", method = RequestMethod.GET)
	public String insertForm(HttpServletRequest request, Locale locale, Model model) {
		logger.info("가계부 쓰기폼 이동 {}.", locale);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("session_ID : " + vo);
		vo.setMemberCode(vo.getMemberCode());

		List<CategoryDTO> category = null;
		List<CategoryCtDTO> categoryct = null;
		category = acService.category();
		categoryct = acService.categoryct();
		System.out.println("category:" + category.size());
		System.out.println("categoryct:" + categoryct.size());
		model.addAttribute("category", category);
		System.out.println(category);
		System.out.println(categoryct);
		model.addAttribute("categoryct", categoryct);

		// 세션유지
		model.addAttribute("mysession", vo);

		// 회원프로필 출력
		model.addAttribute("vo", vo);

		// 친구 목록 출력
		String memberCode = vo.getMemberCode();

		// 특정 멤버코드의 친구들을 조회함
		List<String> friendList = friendService.friend(memberCode);
		System.out.println(friendList);
		System.out.println(friendList.size());

		// 그러고 나서 그 멤버코드들로 리스트를 불러옴
		List<MemberVO> friendvo = new ArrayList<MemberVO>();
		for (int i = 0; i < friendList.size(); i++) {
			MemberVO friend = new MemberVO();
			String friendCode = friendList.get(i);
			friend = service.selectMember(friendCode);
			friendvo.add(i, friend);
		}

		model.addAttribute("friendList", friendvo);

		return "cash_insertForm";
	}

	@RequestMapping(value = "/cash/insert", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, Locale locale, Model model, AccountDTO dto) {
		logger.info("가계부 추가하기 {}.", locale);
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("session_ID : " + vo);
		System.out.println(dto);
		dto.setMemberCode(vo.getMemberCode());
		boolean isS = acService.insertAccount(dto);
		if (isS) {
			return "redirect:listpage";
		} else {
			model.addAttribute("msg", "가계부 추가실패");
			return "error";
		}
	}

	@RequestMapping(value = "/cash/detail", method = { RequestMethod.GET, RequestMethod.POST })
	public String detail(HttpServletRequest request, @RequestParam("num") int num, @ModelAttribute("cri") Criteria cri,
			Locale locale, Model model) {
		logger.info("가계부 상세 조회하기 {}.", locale);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("session_ID" + vo);

		AccountDTO dto = acService.getAccount(num);
		model.addAttribute("dto", dto);
		model.addAttribute("cri" + cri);
		// + 가 맞나?????

		// 세션유지
		model.addAttribute("mysession", dto);

		// 회원프로필 출력
		model.addAttribute("vo", vo);

		// 친구 목록 출력
		String memberCode = vo.getMemberCode();

		// 특정 멤버코드의 친구들을 조회함
		List<String> friendList = friendService.friend(memberCode);
		System.out.println(friendList);
		System.out.println(friendList.size());

		// 그러고 나서 그 멤버코드들로 리스트를 불러옴
		List<MemberVO> friendvo = new ArrayList<MemberVO>();
		for (int i = 0; i < friendList.size(); i++) {
			MemberVO friend = new MemberVO();
			String friendCode = friendList.get(i);
			friend = service.selectMember(friendCode);
			friendvo.add(i, friend);
		}

		model.addAttribute("friendList", friendvo);

		return "cash_detail";
	}

	@RequestMapping(value = "/cash/updateForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateForm(HttpServletRequest request, @RequestParam("num") int num, Locale locale, Model model) {
		logger.info("가계부 수정하기 폼이동 {}.", locale);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("session_ID" + vo);

		AccountDTO dto = acService.getAccount(num);
		model.addAttribute("dto", dto);
		List<CategoryDTO> category = null;
		List<CategoryCtDTO> categoryct = null;
		category = acService.category();
		categoryct = acService.categoryct();
		System.out.println("category:" + category.size());
		System.out.println("categoryct:" + categoryct.size());
		model.addAttribute("category", category);
		model.addAttribute("categoryct", categoryct);

		// 세션유지
		model.addAttribute("mysession", dto);

		// 회원프로필 출력
		model.addAttribute("vo", vo);

		// 친구 목록 출력
		String memberCode = vo.getMemberCode();

		// 특정 멤버코드의 친구들을 조회함
		List<String> friendList = friendService.friend(memberCode);
		System.out.println(friendList);
		System.out.println(friendList.size());

		// 그러고 나서 그 멤버코드들로 리스트를 불러옴
		List<MemberVO> friendvo = new ArrayList<MemberVO>();
		for (int i = 0; i < friendList.size(); i++) {
			MemberVO friend = new MemberVO();
			String friendCode = friendList.get(i);
			friend = service.selectMember(friendCode);
			friendvo.add(i, friend);
		}

		model.addAttribute("friendList", friendvo);

		return "cash_updateForm";
	}

	@RequestMapping(value = "/cash/update", method = { RequestMethod.GET, RequestMethod.POST })
	public String update(@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, AccountDTO dto, Locale locale,
			Model model) {
		logger.info("가계부 수정하기  {}.", locale);

		// 수정하기 페이징 유지(디테일 안에서 하는 것이라 상관무
		// acService.updateAccount(dto);
		//
		// rttr.addAttribute("page",cri.getPage());
		// rttr.addAttribute("perPageNum", cri.getPerPageNum());

		boolean isS = acService.updateAccount(dto);
		if (isS) {
			return "redirect:detail?num=" + dto.getNum();
		} else {
			model.addAttribute("msg", "가계부 수정실패");
			return "error";
		}

	}

	@RequestMapping(value = "/cash/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String delete(@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, AccountDTO dto, Locale locale,
			Model model) {
		logger.info("가계부 삭제하기  {}.", locale);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		boolean isS = acService.deleteAccount(dto.getNum());
		if (isS) {
			return "redirect:listpage";
		} else {
			model.addAttribute("msg", "가계부 삭제실패");
			return "error";
		}
	}

}
