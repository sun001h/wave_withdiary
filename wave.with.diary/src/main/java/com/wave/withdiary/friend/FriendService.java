package com.wave.withdiary.friend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FriendService implements IFriendService {

	@Autowired
	private IFriendDAO dao;
	
	@Override
	public List<String> friend(String memberCode) {
		return dao.friend(memberCode);
	}


}
