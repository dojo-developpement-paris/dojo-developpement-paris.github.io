package it.xpug.kata.birthday_greetings;

class MessageSender {
  private final String smtpHost;
  private final int smtpPort;

  MessageSender(String smtpHost, int smtpPort) {
    this.smtpHost = smtpHost;
    this.smtpPort = smtpPort;
  }
}
