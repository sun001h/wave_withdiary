package com.wave.withdiary.friend;

import java.util.List;

import com.wave.withdiary.member.MemberVO;

public interface IFriendDAO {
	
	// 친구목록조회
	public List<String> friend(String memberCode);
	// 친구 추가
	public int addFriend(FriendDTO friendDTO);
	// 친구 프로필 불러오기
	public MemberVO selectByEmail(String email);

}
