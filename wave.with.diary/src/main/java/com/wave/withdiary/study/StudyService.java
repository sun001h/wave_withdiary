package com.wave.withdiary.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudyService implements IStudyService {

	@Autowired
	private IStudyDAO dao;
	
	@Override
	public List<StudyDTO> listSch() {
		return dao.listSch();
	}
	
	@Override
	public int insertSch(StudyDTO dto) {
		return dao.insertSch(dto);
	}

	@Override
	public int updateSch(StudyDTO dto) {
		return dao.updateSch(dto);
	}

	@Override
	public StudyDTO selectSch(int studyNO) {
		return dao.selectSch(studyNO);
	}

	@Override
	public int deleteSch(int studyNO) {
		return dao.deleteSch(studyNO);
	}

}
