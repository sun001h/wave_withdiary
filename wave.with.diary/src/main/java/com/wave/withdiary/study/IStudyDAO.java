package com.wave.withdiary.study;

import java.util.List;

public interface IStudyDAO {
	
	public List<StudyDTO> listSch();
	public int insertSch(StudyDTO dto);
	public int updateSch(StudyDTO dto);
	public int deleteSch(int studyNO);
	public StudyDTO selectSch(int studyNO);

	
}
