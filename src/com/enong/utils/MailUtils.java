package com.enong.utils;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class MailUtils {
	
	public static void SendMail(String subject, String sendTo, String msg) throws EmailException {
		HtmlEmail email = new HtmlEmail();
		email.setHostName(Configer.getConfigMapValue("MAIL", "hostName").toString());
		email.setCharset(Configer.getConfigMapValue("MAIL", "charset").toString());
		email.addTo(sendTo);
		email.setFrom(Configer.getConfigMapValue("MAIL", "from").toString(), Configer.getConfigMapValue("MAIL", "fromName").toString());
		email.setSubject(subject);
		email.setAuthenticator(new DefaultAuthenticator(Configer.getConfigMapValue("MAIL", "username").toString(), Configer.getConfigMapValue("MAIL", "password").toString()));
		email.setHtmlMsg(msg);
		email.send();
	}
	

}
