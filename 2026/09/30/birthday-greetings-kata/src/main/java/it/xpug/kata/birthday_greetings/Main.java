package it.xpug.kata.birthday_greetings;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.io.*;
import java.text.ParseException;

public class Main {

  public static void main(String[] args)
      throws AddressException, IOException, ParseException, MessagingException {
    BirthdayService service = new BirthdayService(new EmployeeRepository("employee_data.txt"));
    service.sendGreetings(new XDate(), "localhost", 25);
  }
}
