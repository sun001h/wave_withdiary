package com.wave.withdiary.study;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAO implements IStudyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<StudyDTO> listSch() {
		return sqlSession.selectList("com.wave.schedule.listSch", "listSch");
	}

	@Override
	public int insertSch(StudyDTO vo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.wave.schedule.insertSch", vo);
	}

	@Override
	public int updateSch(StudyDTO vo) {
		// TODO Auto-generated method stub
		return sqlSession.update("com.wave.schedule.updateSch", vo);
	}

	@Override
	public int deleteSch(int studyNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.wave.schedule.deleteSch", studyNo);
	}

	@Override
	public StudyDTO selectSch(int studyNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.wave.schedule.selectSch", studyNo);
	}
	
}
