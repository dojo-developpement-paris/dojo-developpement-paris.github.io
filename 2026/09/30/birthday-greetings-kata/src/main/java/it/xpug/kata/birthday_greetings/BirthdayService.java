package it.xpug.kata.birthday_greetings;

public class BirthdayService {
  private final EmployeeRepository repository;
  private final MailSender messageSender;

  public BirthdayService(EmployeeRepository repository, MailSender messageSender) {
    this.repository = repository;
    this.messageSender = messageSender;
  }

  public void sendGreetings(XDate xDate) {
    repository
        .readAll()
        .forEach(
            employee -> {
              if (employee.isBirthday(xDate)) {
                String body =
                    "Happy Birthday, dear %NAME%!".replace("%NAME%", employee.getFirstName());
                String subject = "Happy Birthday!";
                messageSender.sendMessage(subject, body, employee);
              }
            });
  }
}
