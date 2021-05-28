package com.wave.withdiary.auth.mail;

public interface IMailSendDAO {

	//인증키 생성
	public String getKey(int size);
	//인증코드 난수 발생
	public String getAuthCode(int size);
	//인증메일 보내기
	public String sendAuthMail(String email);

}
