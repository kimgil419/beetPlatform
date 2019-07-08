package com.beetoffice.mail;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/mail")
	public String mailForm() {
		System.out.println(">> Controller: mailForm");
		
		return "/mail/mailForm";
	}
	
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(HttpServletRequest request) {
		System.out.println(">> Controller: mailSending");
		
		String setfrom = request.getParameter("setFrom");
		String tomail = request.getParameter("tomail");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mail";
	}
}
































