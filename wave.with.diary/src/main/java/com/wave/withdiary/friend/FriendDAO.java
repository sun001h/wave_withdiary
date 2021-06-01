package com.wave.withdiary.friend;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wave.withdiary.member.MemberVO;

@Repository
public class FriendDAO implements IFriendDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "wave.withdiary.friend.";
	
	@Override
	public List<String> friend(String memberCode) {
		return sqlSession.selectList(nameSpace + "friendList", memberCode);
	}

	@Override
	public int addFriend(FriendDTO friendDTO) {
		return sqlSession.insert(nameSpace + "addFriend", friendDTO);
	}

	@Override
	public MemberVO selectByEmail(String email) {
		return sqlSession.selectOne(nameSpace + "selectByEmail", email);
	}



}
