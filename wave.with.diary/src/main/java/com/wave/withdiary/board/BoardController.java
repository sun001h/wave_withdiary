package com.wave.withdiary.board;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	
	@RequestMapping(value = "/boardwriteForm", method = RequestMethod.GET)
	public String boardwrite(Model model, BoardVO vo) {
		
		logger.info("글 작성 화면");


		return "boardwrite";
	}

	@RequestMapping(value="/boardinsert", method = RequestMethod.POST)
	public String boardinsert(Model model, BoardVO vo) {
		//String membercode = (String) Session.getAttribute("MEMBERCODE");
		logger.info("글 작성하기");
		//vo.setMembercode(membercode);
		vo.setImgFileName("fileName");
		vo.setMap("map");
		vo.setScheduleDate("20210526");
		vo.setViewcnt(0);
		
		service.insert(vo);
		return "redirect:boardlist";
	}
	
	@RequestMapping(value = "/boardview", method = RequestMethod.GET)
	public String boardview(Model model, int d_articlenumber, String clear) {
		
		logger.info("글 상세보기");

		BoardVO vo = service.read(d_articlenumber);
		model.addAttribute("vo", vo);

		return "boardview";
	}	
	
	@RequestMapping(value = "/boardupdateView", method = RequestMethod.GET)
	public String updateView(Model model, BoardVO vo) {
		logger.info("updateView");
		
		model.addAttribute("update", service.read(vo.getd_articlenumber()));
		
		return "boardupdateView";
	}
	
	@RequestMapping(value = "/boardupdate", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Model model, BoardVO vo) {
		
		logger.info("글 수정하기");
		service.update(vo);
		return "redirect:boardview?d_articlenumber="+vo.getd_articlenumber()+"&clear=y";
	}	

	@RequestMapping(value = "/boarddelete")
	public String boarddelete(int d_articlenumber) {
		
		logger.info("글 삭제하기");

		service.delete(d_articlenumber);
		return "redirect:boardlist";
	}	
	
	@RequestMapping(value = "/boardlist", method = RequestMethod.GET)
	public String boardlist(Model model) {
		
		logger.info("글 목록 조회");

		List<BoardVO> list = service.listAll();
		model.addAttribute("list", list);

		return "boardlist";
	}
	
	
	
	
	
	
	

}
