package com.wave.withdiary.study;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudyController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);

	@Autowired
	private IStudyService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {
		logger.info("스터디 리스트 폼 {}.", locale);

		List<StudyDTO> list = service.listSch();

		model.addAttribute("list", list);
		System.out.println("사이즈 :" + list.size());
		return "list";
	}

	@RequestMapping(value = "/insertForm", method = RequestMethod.GET)
	public String insertForm(Locale locale, Model model) {
		logger.info("스터디 추가 입력폼 {}.", locale);

		return "insertForm";
	}

	@RequestMapping(value = "/insertResult", method = RequestMethod.GET)
	public String insertResult(Locale locale, Model model, String memberCode, String subject, String content,
			String studyTime) {
		// insertForm에서 멤버코드 , 과목 , 내용 , 공부시간(분단위)을 받아온 상태.

		// 입력받은 시간을 타입변경후 실제 공부시간만 계산하여 다시 String 타입으로 타입변환
		// System.out.println("studySTime =" + studySTime);
		// 16:29 로 넘어오나 변환이 불가 , 분으로 환산후 계산하여 다시 받는 방법
		// calender api 를 통하여 가능한 방법이 있음 , 특정날짜로 설정(s: 5월 26일 3:30 // e:5월 29일 4:32 으로
		// 하여 경과시간을 계산할수있음 // s~e 까지의 경과시간)

		/*
		 * int s = Integer.parseInt(studySTime); int e = Integer.parseInt(studyETime);
		 */

		/*
		 * System.out.println(s); System.out.println(e);
		 * 
		 * int result = e-s; System.out.println(result);
		 * 
		 * String lastResult = String.valueOf(result); System.out.println(lastResult);
		 */

		// 입력받지 않은 것만 set 메서드로 처리 및 계산한 값 studyTime에 set

		System.out.println("studyTime = " + studyTime);

		Calendar cal = Calendar.getInstance();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		System.out.println(df.format(cal.getTime()));

		StudyDTO vo = new StudyDTO();
		vo.setContent(content);
		vo.setMemberCode(memberCode);
		vo.setStudyDate(df.format(cal.getTime()));
		vo.setStudyTime(studyTime);
		vo.setSubject(subject);
		vo.setWriter("test");
		System.out.println(vo.toString());

		service.insertSch(vo);
		return "redirect:list";
	}

	@RequestMapping(value = "/scheduleView", method = RequestMethod.GET)
	public String scheduleView(Locale locale, Model model, int studyNO) {
		logger.info("스터디일정 상세보기 폼{}.", locale);

		System.out.println(studyNO);

		StudyDTO vo = new StudyDTO();
		vo = service.selectSch(studyNO);

		model.addAttribute("vo", vo);

		return "scheduleView";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Locale locale, Model model, int studyNO) {
		logger.info("스터디일정 삭제{}.", locale);

		service.deleteSch(studyNO);

		return "redirect:list";
	}

	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String updateForm(Locale locale, Model model, int studyNO) {
		logger.info("스터디일정 수정 입력{}.", locale);

		StudyDTO vo = new StudyDTO();
		vo = service.selectSch(studyNO);

		/* System.out.println(vo.toString()); */

		model.addAttribute("vo", vo);

		return "updateForm";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(Locale locale, Model model, StudyDTO vo) {
		logger.info("스터디일정 수정완료{}.", locale);

		System.out.println(vo.toString());
		service.updateSch(vo);
		return "redirect:scheduleView?studyNO=" + vo.getStudyNO();
	}
}
