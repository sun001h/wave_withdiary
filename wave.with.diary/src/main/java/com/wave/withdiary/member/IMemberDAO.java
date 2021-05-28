package com.wave.withdiary.member;

import java.util.List;
import java.util.Map;

public interface IMemberDAO {
	
	// 멤버 리스트(관리목적)
	public List<MemberVO> listMembers();
	// 프로필 조회
	public MemberVO selectMember(String memberCode); 
	// 가입
	public int addMember(MemberVO vo);
	// 정보 수정
	public int update(Map<String, String> map);
	// 탈퇴
	public int delete(String memberCode);
	// 로그인
	public MemberVO loginByEmail(MemberVO vo);

}
