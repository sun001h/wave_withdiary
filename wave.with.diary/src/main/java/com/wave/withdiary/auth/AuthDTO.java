package com.wave.withdiary.auth;

import java.util.Date;

public class AuthDTO {
	
	private String email;
	private String joinType;
	private Date joinDate;
	private int mc_seq;
	private String pwd;
	private String birthyear;
	private String birthday;
	private String nickname;
	private String profile_img;
	private String gender;
	private String profile;
	private String authKey;
	private String authStatus;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoinType() {
		return joinType;
	}
	public void setJoinType(String joinType) {
		this.joinType = joinType;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public int getMc_seq() {
		return mc_seq;
	}
	public void setMc_seq(int mc_seq) {
		this.mc_seq = mc_seq;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getBirthyear() {
		return birthyear;
	}
	public void setBirthyear(String birthyear) {
		this.birthyear = birthyear;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getAuthKey() {
		return authKey;
	}
	public void setAuthKey(String authKey) {
		this.authKey = authKey;
	}
	public String getAuthStatus() {
		return authStatus;
	}
	public void setAuthStatus(String authStatus) {
		this.authStatus = authStatus;
	}
	
	@Override
	public String toString() {
		return "AuthDTO [email=" + email + ", joinType=" + joinType + ", joinDate=" + joinDate + ", mc_seq=" + mc_seq
				+ ", pwd=" + pwd + ", birthyear=" + birthyear + ", birthday=" + birthday + ", nickname=" + nickname
				+ ", profile_img=" + profile_img + ", gender=" + gender + ", profile=" + profile + ", authKey="
				+ authKey + ", authStatus=" + authStatus + "]";
	}
	
}
