package com.wave.withdiary.study;

import java.util.List;

public interface IStudyService {
	
	public List<StudyDTO> listSch();
	public int insertSch(StudyDTO vo);
	public int updateSch(StudyDTO vo);
	public int deleteSch(int studyNo);
	public StudyDTO selectSch(int studyNo);
}
