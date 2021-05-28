package com.wave.withdiary.auth;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuthService implements IAuthService {
	
	@Autowired
	private IAuthDAO dao;

	@Override
	public List<AuthDTO> listMembers() {
		return dao.listMembers();
	}

	@Override
	public String overlapped(String email) {
		return dao.overlapped(email);
	}

	@Override
	public int addMemberByMap(Map<String, String> map) {
		return dao.addMemberByMap(map);
	}

	@Override
	public int updateAuthStatus(Map<String, String> map) {
		return dao.updateAuthStatus(map);
	}

	@Override
	public AuthDTO selectMember(String email) {
		return dao.selectMember(email);
	}

	@Override
	public String createCode(String email) {
		return dao.createCode(email);
	}

}
