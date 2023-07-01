package com.arolla.legacy.testing.thirdparty.quotebot;

import java.util.Random;

import javax.swing.JOptionPane;

public class MarketStudyVendor {

	public double averagePrice(String blog) {
		if (System.getenv("license") == null) {
			JOptionPane.showMessageDialog(null, "Missing license !",
					"Stupid license", JOptionPane.WARNING_MESSAGE);
			throw new RuntimeException("");
		}
		return ((double) blog.hashCode() * (new Random()).nextDouble());
	}

}
