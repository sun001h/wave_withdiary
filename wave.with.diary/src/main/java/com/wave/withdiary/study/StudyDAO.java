package com.wave.withdiary.study;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAO implements IStudyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "wave.withdiary.study.";
	
	@Override
	public List<StudyDTO> listSch() {
		return sqlSession.selectList(nameSpace + "listSch", "listSch");
	}

	@Override
	public int insertSch(StudyDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + "insertSch", dto);
	}

	@Override
	public int updateSch(StudyDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + "updateSch", dto);
	}

	@Override
	public int deleteSch(int studyNO) {
		// TODO Auto-generated method stub
		return sqlSession.delete(nameSpace + "deleteSch", studyNO);
	}

	@Override
	public StudyDTO selectSch(int studyNO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + "selectSch", studyNO);
	}
	
}
