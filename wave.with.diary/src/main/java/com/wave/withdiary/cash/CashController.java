package com.wave.withdiary.cash;

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

import com.wave.withdiary.member.MemberVO;

@Controller
@SessionAttributes("mysession")
public class CashController {


	private static final Logger logger = LoggerFactory.getLogger(CashController.class);

	@Autowired
	private IAccountService acService;

	@RequestMapping(value = "/accountlistpage", method = {RequestMethod.GET,RequestMethod.POST})
	public String accountlistpage(HttpServletRequest request , @ModelAttribute("cri") Criteria cri, Locale locale, Model model) {
		logger.info("가계부목록 페이징 {}.", locale);

		HttpSession session = request.getSession();
		MemberVO vo =(MemberVO) session.getAttribute("member");
		System.out.println("session_ID: "+ vo);
		cri.setMemberCode(vo.getMemberCode());

		//날짜 별 조회
		// 시작일
		String fchdate= request.getParameter("fchdate");
		// 마지막 일
		String tchdate= request.getParameter("tchdate");
		// 맵으로 묶기
		Map<String, Object> map = new HashMap<>();
		// 날짜
		map.put("fchdate",fchdate);
		map.put("tchdate",tchdate);
		// 페이징
		map.put("rowStart",cri.getRowStart());
		map.put("rowEnd",cri.getRowEnd());
		// 멤버 별 코드
		map.put("memberCode", vo.getMemberCode());
		System.out.println(vo.getMemberCode());

		List<AccountDTO> list=acService.getAllListPage(map);
		model.addAttribute("list", list);
		System.out.println("사이즈:"+list.size());

		// 차트CT
		List<ChartCT> clist=acService.chartCount(map);
		model.addAttribute("clist",clist);
		System.out.println("clist : "+clist.size());
		// 차트Money
		List<ChartMoney> mlist=acService.chartMoney(map);
		model.addAttribute("mlist",mlist);
		System.out.println("mlist : "+mlist.size());

		// 페이징
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println("listCount : "+acService.listCount(map));
		pageMaker.setTotalCount(acService.listCount(map));
		model.addAttribute("pageMaker", pageMaker);

		// 세션유지
		model.addAttribute("mysession",vo);

		return "accountlistpage";
	}

	@RequestMapping(value = "/insertaccount", method = RequestMethod.GET)
	public String insertaccount(HttpServletRequest request ,Locale locale, Model model) {
		logger.info("가계부 쓰기폼 이동 {}.", locale);

		HttpSession session = request.getSession();
		MemberVO vo =(MemberVO) session.getAttribute("member");
		System.out.println("session_ID : "+ vo);
		vo.setMemberCode(vo.getMemberCode());

		List<CategoryDTO> category = null;
		List<CategoryCtDTO> categoryct = null;
		category = acService.category();
		categoryct = acService.categoryct();
		System.out.println("category:"+category.size());
		System.out.println("categoryct:"+categoryct.size());
		model.addAttribute("category", category);
		System.out.println(category);
		System.out.println(categoryct);
		model.addAttribute("categoryct", categoryct);

		// 세션유지
		model.addAttribute("mysession", vo);

		return "insertaccount";
	}


	@RequestMapping(value = "/insertaccount1", method = RequestMethod.POST)
	public String insert(HttpServletRequest request, Locale locale, Model model, AccountDTO dto) {
		logger.info("가계부 추가하기 {}.", locale);
		HttpSession session = request.getSession();
		MemberVO vo =(MemberVO) session.getAttribute("member");
		System.out.println("session_ID : "+vo);
		System.out.println(dto);
		dto.setMemberCode(vo.getMemberCode());
		boolean isS=acService.insertAccount(dto);
		if(isS) {
			return "redirect:accountlistpage";
		} else {
			model.addAttribute("msg","가계부 추가실패");
			return "error";
		}

	}

	@RequestMapping(value = "/detailaccount", method = {RequestMethod.GET,RequestMethod.POST})
	public String detailaccount(HttpServletRequest request, @RequestParam("num")int num, @ModelAttribute("cri") Criteria cri, Locale locale, Model model) {
		logger.info("가계부 상세 조회하기 {}.", locale);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("session_ID" + vo);

		AccountDTO dto=acService.getAccount(num); 
		model.addAttribute("dto", dto);
		model.addAttribute("cri"+cri);
		// + 가 맞나?????
            
		// 세션유지
		model.addAttribute("mysession", dto);

		return "detailaccount";
	}

	@RequestMapping(value = "/cashUpdateForm", method = {RequestMethod.GET,RequestMethod.POST})
	public String cashUpdateForm(HttpServletRequest request, @RequestParam("num")int num, Locale locale, Model model) {
		logger.info("가계부 수정하기 폼이동 {}.", locale);

		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		System.out.println("session_ID" + vo);

		AccountDTO dto=acService.getAccount(num);
		model.addAttribute("dto", dto);
		List<CategoryDTO> category = null;
		List<CategoryCtDTO> categoryct = null;
		category = acService.category();
		categoryct = acService.categoryct();
		System.out.println("category:"+category.size());
		System.out.println("categoryct:"+categoryct.size());
		model.addAttribute("category", category);
		model.addAttribute("categoryct", categoryct);

		// 세션유지
		model.addAttribute("mysession",dto);
		return "cashUpdateForm";
	}

	@RequestMapping(value = "/cashUpdate", method = {RequestMethod.GET,RequestMethod.POST})
	public String cashUpdate(@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr,AccountDTO dto, Locale locale, Model model) {
		logger.info("가계부 수정하기  {}.", locale);

		// 수정하기 페이징 유지(디테일 안에서 하는 것이라 상관무
		//		acService.updateAccount(dto);
		//		
		//		rttr.addAttribute("page",cri.getPage());
		//		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		boolean isS=acService.updateAccount(dto);
		if(isS) {
			return "redirect:detailaccount?num="+dto.getNum();
		} else {
			model.addAttribute("msg","가계부 수정실패");
			return "error";
		}

	}

	@RequestMapping(value = "/deleteaccount", method = {RequestMethod.GET,RequestMethod.POST})
	public String delete(@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr, AccountDTO dto, Locale locale, Model model) {
		logger.info("가계부 삭제하기  {}.", locale);

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());

		boolean isS=acService.deleteAccount(dto.getNum());
		if(isS) {
			return "redirect:accountlistpage";
		} else {
			model.addAttribute("msg","가계부 삭제실패");
			return "error";
		}
	}


}
