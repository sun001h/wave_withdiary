package com.wave.withdiary.friend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wave.withdiary.member.MemberVO;

@Service
public class FriendService implements IFriendService {

	@Autowired
	private IFriendDAO dao;
	
	@Override
	public List<String> friend(String memberCode) {
		return dao.friend(memberCode);
	}

	@Override
	public int addFriend(FriendDTO friendDTO) {
		return dao.addFriend(friendDTO);
	}

	@Override
	public MemberVO selectByEmail(String email) {
		return dao.selectByEmail(email);
	}

}
