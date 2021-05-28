package com.wave.withdiary.member;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements IMemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "wave.withdiary.member.";

	@Override
	public List<MemberVO> listMembers() {
		return sqlSession.selectList(nameSpace + "listMembers");
	}

	@Override
	public MemberVO selectMember(String memberCode) {
		return sqlSession.selectOne(nameSpace + "selectMember", memberCode);
	}

	@Override
	public int addMember(MemberVO vo) {
		return sqlSession.insert(nameSpace + "addMember", vo);

	}

	@Override
	public int update(Map<String, String> map) {
		return sqlSession.update(nameSpace + "update", map);
	}

	@Override
	public int delete(String memberCode) {
		return 0;
	}

	@Override
	public MemberVO loginByEmail(MemberVO vo) {
		return sqlSession.selectOne(nameSpace + "loginByEmail", vo);
	}

	
}
