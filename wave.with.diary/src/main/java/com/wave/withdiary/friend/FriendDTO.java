package com.wave.withdiary.friend;

public class FriendDTO {
	
	private int f_seq;
	private String memberCode;
	private String friendCode;
	
	public int getF_seq() {
		return f_seq;
	}
	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getFriendCode() {
		return friendCode;
	}
	public void setFriendCode(String friendCode) {
		this.friendCode = friendCode;
	}
	
	@Override
	public String toString() {
		return "FriendDTO [f_seq=" + f_seq + ", memberCode=" + memberCode + ", friendCode=" + friendCode + "]";
	}
	
}
