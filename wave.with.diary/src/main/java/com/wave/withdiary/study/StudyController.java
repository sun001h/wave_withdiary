package com.wave.withdiary.study;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StudyController {

	private static final Logger logger = LoggerFactory.getLogger(StudyController.class);

	@Autowired
	private StudyService studyService;

	@RequestMapping(value = "/study/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {
		logger.info("스터디 리스트 폼 {}.", locale);

		List<StudyDTO> list = studyService.listSch();

		model.addAttribute("list", list);
		System.out.println("사이즈 :" + list.size());
		return "study_list";
	}

	@RequestMapping(value = "/study/insertForm", method = RequestMethod.GET)
	public String insertForm(Locale locale, Model model) {
		logger.info("스터디 추가 입력폼 {}.", locale);

		return "study_insertForm";
	}

	@RequestMapping(value = "/study/insertResult", method = RequestMethod.GET)
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

		StudyDTO dto = new StudyDTO();
		dto.setContent(content);
		dto.setMemberCode(memberCode);
		dto.setStudyDate(df.format(cal.getTime()));
		dto.setStudyTime(studyTime);
		dto.setSubject(subject);
		dto.setWriter("test");
		System.out.println(dto.toString());

		studyService.insertSch(dto);
		return "redirect:study_list";
	}

	@RequestMapping(value = "/study/view", method = RequestMethod.GET)
	public String view(Locale locale, Model model, int studyNO) {
		logger.info("스터디일정 상세보기 폼{}.", locale);

		System.out.println(studyNO);

		StudyDTO dto = new StudyDTO();
		dto = studyService.selectSch(studyNO);

		model.addAttribute("dto", dto);

		return "study_view";
	}

	@RequestMapping(value = "/study/delete", method = RequestMethod.POST)
	public String delete(Locale locale, Model model, int studyNO) {
		logger.info("스터디일정 삭제{}.", locale);

		studyService.deleteSch(studyNO);

		return "redirect:study_list";
	}

	@RequestMapping(value = "/study/updateForm", method = RequestMethod.GET)
	public String updateForm(Locale locale, Model model, int studyNO) {
		logger.info("스터디일정 수정 입력{}.", locale);

		StudyDTO dto = new StudyDTO();
		dto = studyService.selectSch(studyNO);

		/* System.out.println(dto.toString()); */

		model.addAttribute("dto", dto);

		return "study_updateForm";
	}

	@RequestMapping(value = "/study/update", method = RequestMethod.POST)
	public String update(Locale locale, Model model, StudyDTO dto) {
		logger.info("스터디일정 수정완료{}.", locale);

		System.out.println(dto.toString());
		studyService.updateSch(dto);
		return "redirect:study_view?studyNO=" + dto.getStudyNO();
	}
}
