package com.wave.withdiary.friend;

public class AddFriendDTO {
	
	private int af_seq;
	private String fromCode;
	private String toCode;
	
	public int getAf_seq() {
		return af_seq;
	}
	public void setAf_seq(int af_seq) {
		this.af_seq = af_seq;
	}
	public String getFromCode() {
		return fromCode;
	}
	public void setFromCode(String fromCode) {
		this.fromCode = fromCode;
	}
	public String getToCode() {
		return toCode;
	}
	public void setToCode(String toCode) {
		this.toCode = toCode;
	}
	
	
	@Override
	public String toString() {
		return "AddFriendDTO [af_seq=" + af_seq + ", fromCode=" + fromCode + ", toCode=" + toCode + "]";
	}


}
