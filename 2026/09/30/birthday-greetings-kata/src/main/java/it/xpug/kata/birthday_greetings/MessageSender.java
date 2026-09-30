package it.xpug.kata.birthday_greetings;

public interface MessageSender {
  void sendMessage(String subject, String body, Employee recipient);
}
