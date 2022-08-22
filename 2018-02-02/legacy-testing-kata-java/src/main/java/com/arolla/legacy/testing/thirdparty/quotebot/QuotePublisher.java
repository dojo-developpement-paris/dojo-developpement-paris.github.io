package com.arolla.legacy.testing.thirdparty.quotebot;

import javax.swing.JOptionPane;

public class QuotePublisher {

	public static final QuotePublisher INSTANCE = new QuotePublisher();

	public void publish(double todayPrice) {
		JOptionPane
				.showMessageDialog(
						null,
						"You've pushed a dummy auction to a real ads platform, the business is upset!","Big fail!",
						JOptionPane.WARNING_MESSAGE);
	}
}
