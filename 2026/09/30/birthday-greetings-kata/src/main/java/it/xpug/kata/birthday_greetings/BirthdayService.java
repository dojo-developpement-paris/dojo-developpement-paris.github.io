package it.xpug.kata.birthday_greetings;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;

public class BirthdayService {
  public BirthdayService() {}

  public void sendGreetings(String fileName, XDate xDate, String smtpHost, int smtpPort)
      throws IOException, ParseException, AddressException, MessagingException {
    var repository = new EmployeeRepository(fileName);
    repository.readAll().forEach(employee -> {
      if (employee.isBirthday(xDate)) {
        String recipient = employee.getEmail();
        String body = "Happy Birthday, dear %NAME%!".replace("%NAME%", employee.getFirstName());
        String subject = "Happy Birthday!";
        try {
			sendMessage(smtpHost, smtpPort, "sender@here.com", subject, body, recipient);
		} catch (MessagingException e) {
		}
      }
    });
  }

  private void sendMessage(
      String smtpHost, int smtpPort, String sender, String subject, String body, String recipient)
      throws AddressException, MessagingException {
    // Create a mail session
    java.util.Properties props = new java.util.Properties();
    props.put("mail.smtp.host", smtpHost);
    props.put("mail.smtp.port", "" + smtpPort);
    Session session = Session.getInstance(props, null);

    // Construct the message
    Message msg = new MimeMessage(session);
    msg.setFrom(new InternetAddress(sender));
    msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
    msg.setSubject(subject);
    msg.setText(body);

    // Send the message
    Transport.send(msg);
  }
}
