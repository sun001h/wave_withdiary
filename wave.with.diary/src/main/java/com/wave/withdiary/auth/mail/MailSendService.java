package com.wave.withdiary.auth.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MailSendService implements IMailSendService {

	@Autowired
	private IMailSendDAO dao;

	@Override
	public String getKey(int size) {
		return dao.getKey(size);
	}

	@Override
	public String getAuthCode(int size) {
		return dao.getAuthCode(size);
	}

	@Override
	public String sendAuthMail(String email) {
		return dao.sendAuthMail(email);
	}
	
}
