///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package study;
//import java.util.Properties;
//
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
///**
// *
// * @author Nirash
// */
//
//    
//
//public class SendMailTLS {
//
//	public static void main(String[] args) {
//
//		final String username = "helloworldh48@gmail.com";
//		final String password = "123bumblebee";
//
//		Properties props = new Properties();
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.host", "smtp.gmail.com");
//		props.put("mail.smtp.port", "587");
//
//		Session session = Session.getInstance(props,
//		  new javax.mail.Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(username, password);
//			}
//		  });
//
//		try {
//
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress("helloworldh48@gmail.com"));
//			message.setRecipients(Message.RecipientType.TO,
//				InternetAddress.parse("newtestt0@gmail.com"));
//			message.setSubject("Testing Subject");
//			message.setText("Dear Mail Crawler,"
//				+ "\n\n No spam to my email, please!");
//
//			Transport.send(message);
//
//			System.out.println("Done");
//
//		} catch (MessagingException e) {
////			throw new RuntimeException(e);
//                        e.printStackTrace();
//		}
//	}
//}
//
//
