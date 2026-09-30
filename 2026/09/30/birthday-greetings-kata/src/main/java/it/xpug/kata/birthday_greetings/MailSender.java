package it.xpug.kata.birthday_greetings;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

class MailSender implements MessageSender {
  private final String smtpHost;
  private final int smtpPort;
  private final String sender;

  MailSender(String sender, String smtpHost, int smtpPort) {
    this.smtpHost = smtpHost;
    this.smtpPort = smtpPort;
    this.sender = sender;
  }

  @Override
  public void sendMessage(String subject, String body, Employee recipient) {
    // Create a mail session
    java.util.Properties props = new java.util.Properties();
    props.put("mail.smtp.host", smtpHost);
    props.put("mail.smtp.port", "" + smtpPort);
    Session session = Session.getInstance(props, null);

    // Construct the message
    Message msg = new MimeMessage(session);
    try {
      msg.setFrom(new InternetAddress(sender));
      msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient.getEmail()));
      msg.setSubject(subject);
      msg.setText(body);

      // Send the message
      Transport.send(msg);
    } catch (MessagingException e) {
      throw new RuntimeException(e);
    }
  }
}
