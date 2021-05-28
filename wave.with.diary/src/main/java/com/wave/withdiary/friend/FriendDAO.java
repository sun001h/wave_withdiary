package com.wave.withdiary.friend;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FriendDAO implements IFriendDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "wave.withdiary.friend.";
	
	@Override
	public List<String> friend(String memberCode) {
		return sqlSession.selectList(nameSpace + "friendList", memberCode);
	}

}
