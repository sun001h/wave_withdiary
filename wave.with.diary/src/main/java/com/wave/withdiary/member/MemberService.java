package com.wave.withdiary.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDAO dao;

	@Override
	public List<MemberVO> listMembers() {
		return dao.listMembers();
	}

	@Override
	public MemberVO selectMember(String memberCode) {
		return dao.selectMember(memberCode);
	}

	@Override
	public int addMember(MemberVO vo) {
		return dao.addMember(vo);
	}

	@Override
	public int update(Map<String, String> map) {
		return dao.update(map);
	}

	@Override
	public int delete(String memberCode) {
		return dao.delete(memberCode);
	}

	@Override
	public MemberVO loginByEmail(MemberVO vo) {
		return dao.loginByEmail(vo);
	}
	
}
