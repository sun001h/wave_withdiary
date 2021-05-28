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
	private BoardService boardService;
	
	
	@RequestMapping(value = "/board/writeForm", method = RequestMethod.GET)
	public String writeForm(Model model, BoardVO vo) {
		
		logger.info("글 작성 화면");


		return "board_writeForm";
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
		return "redirect:board_list";
	}
	
	@RequestMapping(value = "/board/view", method = RequestMethod.GET)
	public String view(Model model, int d_articlenumber, String clear) {
		
		logger.info("글 상세보기");

		BoardVO vo = boardService.read(d_articlenumber);
		model.addAttribute("vo", vo);

		return "board_view";
	}	
	
	@RequestMapping(value = "/board/updateView", method = RequestMethod.GET)
	public String updateView(Model model, BoardVO vo) {
		logger.info("updateView");
		
		model.addAttribute("update", boardService.read(vo.getd_articlenumber()));
		
		return "board_updateView";
	}
	
	@RequestMapping(value = "/board/update", method = {RequestMethod.GET,RequestMethod.POST})
	public String update(Model model, BoardVO vo) {
		
		logger.info("글 수정하기");
		boardService.update(vo);
		return "redirect:board_view?d_articlenumber="+vo.getd_articlenumber()+"&clear=y";
	}	

	@RequestMapping(value = "/board/delete")
	public String delete(int d_articlenumber) {
		
		logger.info("글 삭제하기");

		boardService.delete(d_articlenumber);
		return "redirect:board_list";
	}	
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String list(Model model) {
		
		logger.info("글 목록 조회");

		List<BoardVO> list = boardService.listAll();
		model.addAttribute("list", list);

		return "board_list";
	}
	
	
	
	
	
	
	

}
