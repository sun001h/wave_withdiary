package com.wave.withdiary.auth;

import java.util.List;
import java.util.Map;

public interface IAuthDAO {

	// 가입 대기 리스트
	public List<AuthDTO> listMembers();
	// 이메일 중복 확인
	public String overlapped(String email);
	// 이메일 승인 전 가입
	public int addMemberByMap(Map<String, String> map);
	// 이메일 승인 절차
	public int updateAuthStatus(Map<String, String> map);
	// 이메일로 회원 검색
	public AuthDTO selectMember(String email);
	// 멤버코드 만들기
	public String createCode(String email);


}
