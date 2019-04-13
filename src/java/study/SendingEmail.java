/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package study;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.PasswordAuthentication;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transaction;

/**
 *
 * @author Nirash
 */
public class SendingEmail {

    private String userEmail;
    private String myHash;

    public SendingEmail(String userEmail, String myHash) {
        this.userEmail = userEmail;
        this.myHash = myHash;
    }

    public void sendEmail() {

        String email = "helloworldh48@gmail.com";
        String pword = "123bumblebee";

        Properties properties = new Properties();

        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, pword);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
            message.setSubject("Email Verification Link::::>>>>...");
            message.setText("Your Verification Link ::::: " + " http://localhost:8080/IMS_Progress_V_3/ActivateAccount?key1=" + userEmail + "&key2=" + myHash);
            Transport.send(message);

        } catch (Exception e) {

            System.out.println("Sending Email Exception" + e);
        }
    }
//    
//    public static void main(String[] args) {
//        String uEmail = "helloworldh48@gmail.com";
//        String myHash = null;
//      String email = "helloworldh48@gmail.com";
//    String pword = "123bumblebee";
//    
//    Properties properties = new Properties();
//    
//    properties.put("mail.smtp.auth", "true");
//     properties.put("mail.smtp.starttls.enable", "true");
//     properties.put("mail.smtp.host", "smtp.gmail.com");
//      properties.put("mail.smtp.port", 587);
//      
//      properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
//properties.setProperty("mail.smtp.socketFactory.fallback", "false");   
//properties.setProperty("mail.smtp.port", "465");   
//properties.setProperty("mail.smtp.socketFactory.port", "587"); 
//      
//      
//      Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
//          
//          protected PasswordAuthentication getPasswordAuthentication(){
//              return new PasswordAuthentication(email, pword);
//          }
//});
//    
//        try {
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(email));
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress(uEmail));
//            message.setSubject("Email Verification Link::::>>>>...");
//            message.setText("Your Verification Link ::::: "+" http://localhost:8080/Sending_Emails/ActivateAccount?key1= " +uEmail);
//            Transport.send(message);
//            
//        } catch (Exception e) {
//            e.printStackTrace();
//            //System.out.println("Sending Email Exception" + e);
//        }  
//    }

}
