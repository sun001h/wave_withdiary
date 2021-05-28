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
	public int insertSch(StudyDTO vo) {
		return dao.insertSch(vo);
	}

	@Override
	public int updateSch(StudyDTO vo) {
		return dao.updateSch(vo);
	}

	@Override
	public StudyDTO selectSch(int studyNo) {
		// TODO Auto-generated method stub
		return dao.selectSch(studyNo);
	}

	@Override
	public int deleteSch(int studyNo) {
		// TODO Auto-generated method stub
		return dao.deleteSch(studyNo);
	}

}
