package com.wave.withdiary.auth.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Repository;

@Repository
public class MailSendDAO implements IMailSendDAO {
	
	@Autowired
	private JavaMailSenderImpl jms;

	@Override
	public String getKey(int size) {
        return getAuthCode(size);
	}

	@Override
	public String getAuthCode(int size) {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;
		while(buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}
		return buffer.toString();
	}

	@Override
	public String sendAuthMail(String email) {
		
		//6자리 난수 인증번호 생성
		String authKey = getKey(6);
		
		//인증메일 보내기
		try {
			MailUtils sendMail = new MailUtils(jms);
			sendMail.setSubject("WITH DIARY 회원가입 이메일 인증");
			sendMail.setText(new StringBuffer().append("<h1>이메일 인증</h1>")
			.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
			.append("<a href='http://localhost:8888/withdiary/auth/signUpConfirm?email=")
			.append(email)
			.append("&authKey=")
			.append(authKey)
			.append("' target='_blenk'>이메일 인증 확인</a>")
			.toString());
			sendMail.setFrom("wave.withdiary@gmail.com", "WITH DIARY");
			sendMail.setTo(email);
			sendMail.send();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return authKey;
		
	}

}
