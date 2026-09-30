package it.xpug.kata.birthday_greetings;

import com.icegreen.greenmail.util.GreenMail;
import com.icegreen.greenmail.util.GreenMailUtil;
import com.icegreen.greenmail.util.ServerSetup;
import jakarta.mail.internet.MimeMessage;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AcceptanceTest {

  private static final int NONSTANDARD_PORT = 9999;
  private BirthdayService birthdayService;
  private GreenMail mailServer;

  @BeforeEach
  void setUp() throws Exception {
    mailServer = new GreenMail(new ServerSetup(NONSTANDARD_PORT, null, ServerSetup.PROTOCOL_SMTP));
    mailServer.start();
    birthdayService =
        new BirthdayService(
            new EmployeeRepository("employee_data.txt"), "localhost", NONSTANDARD_PORT);
  }

  @AfterEach
  void tearDown() throws Exception {
    mailServer.stop();
  }

  @Test
  void willSendGreetings_whenItsSomebodysBirthday() throws Exception {
    birthdayService.sendGreetings(new XDate("2008/10/08"));

    Assertions.assertEquals(1, mailServer.getReceivedMessages().length);

    MimeMessage message = mailServer.getReceivedMessages()[0];
    Assertions.assertEquals("Happy Birthday, dear John!", GreenMailUtil.getBody(message));
    Assertions.assertEquals("Happy Birthday!", message.getSubject());
    Assertions.assertEquals(1, message.getAllRecipients().length);
    Assertions.assertEquals("john.doe@foobar.com", message.getAllRecipients()[0].toString());
  }

  @Test
  void willNotSendEmailsWhenNobodysBirthday() throws Exception {
    birthdayService.sendGreetings(new XDate("2008/01/01"));
    Assertions.assertEquals(0, mailServer.getReceivedMessages().length);
  }
}
