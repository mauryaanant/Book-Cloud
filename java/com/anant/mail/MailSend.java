package com.piyush.mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;


@Component
public class MailSend {
	@Autowired
	JavaMailSender mailSender;
	
	public String doMailSend(String remail,String sub,String body) {
		try {
			SimpleMailMessage mailMessage=new SimpleMailMessage();
			mailMessage.setTo(remail);
			mailMessage.setSubject(sub);
			mailMessage.setText(body);
			
			//JavaMailSender mailSender=new MailServerConfig().getMailConfig();
			
			mailSender.send(mailMessage);
			return "Mail Send Successfully!";
		}catch (Exception e) {
			e.printStackTrace();
			return "Mail Send Failed!";
		}
	}
}
