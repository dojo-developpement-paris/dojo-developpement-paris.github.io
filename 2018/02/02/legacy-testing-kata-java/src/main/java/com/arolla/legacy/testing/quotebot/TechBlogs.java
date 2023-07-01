package com.arolla.legacy.testing.quotebot;

import java.util.Arrays;
import java.util.Collection;

import javax.swing.JOptionPane;

public class TechBlogs {

	public static Collection<String> listAllBlogs() {
		try {
			Thread.sleep(5000);// Access to DB are very slow
		} catch (InterruptedException e) {
			JOptionPane.showMessageDialog(null, e.getMessage(),
					"Unxepceted ecxeptoin", JOptionPane.WARNING_MESSAGE);
		}
		return Arrays.asList("HackerNews", "Reddit", "TechCrunch", "BuzzFeed",
				"TMZ", "TheHuffPost", "GigaOM");
	}
}
