package com.arolla.legacy.testing.quotebot;

public class Application {
	public static void main(String[] args) {
		AutomaticQuoteBot bot = new AutomaticQuoteBot();
		bot.sendAllQuotes("FAST");
	}

}
