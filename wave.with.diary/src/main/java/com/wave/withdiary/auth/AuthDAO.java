package com.wave.withdiary.auth;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuthDAO implements IAuthDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "wave.withdiary.auth.";
	
	@Override
	public List<AuthDTO> listMembers() {
		return null;
	}

	@Override
	public String overlapped(String email) {
		String result = sqlSession.selectOne(nameSpace+ "overlapped", email);
		return result;
	}

	@Override
	public int addMemberByMap(Map<String, String> map) {
		return sqlSession.insert(nameSpace+ "addMemberByMap", map);
	}

	@Override
	public int updateAuthStatus(Map<String, String> map) {
		return sqlSession.update(nameSpace+ "updateAuthStatus", map);
	}

	@Override
	public AuthDTO selectMember(String email) {
		return sqlSession.selectOne(nameSpace+ "selectMember", email);
	}

	@Override
	public String createCode(String email) {
		return sqlSession.selectOne(nameSpace+ "createCode", email);
	}

}
