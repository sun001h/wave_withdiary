package com.wave.withdiary.auth.mail;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailUtils {
	
	private JavaMailSender jms;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public MailUtils(JavaMailSender jms) throws MessagingException {
		this.jms = jms;
		message = this.jms.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}
	
	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}
	
	public void setText(String htmlContent) throws MessagingException {
		messageHelper.setText(htmlContent, true);
	}
	
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		messageHelper.setFrom(email, name);
	}
	
	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}
	
	public void send() {
		jms.send(message);
	}

}
