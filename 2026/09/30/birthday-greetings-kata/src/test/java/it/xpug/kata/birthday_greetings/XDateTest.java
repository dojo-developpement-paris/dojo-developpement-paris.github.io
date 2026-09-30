package it.xpug.kata.birthday_greetings;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class XDateTest {
  @Test
  void getters() throws Exception {
    XDate date = new XDate("1789/01/24");

    Assertions.assertEquals(1, date.getMonth());
    Assertions.assertEquals(24, date.getDay());
  }

  @Test
  void isSameDate() throws Exception {
    XDate date = new XDate("1789/01/24");
    XDate sameDay = new XDate("2001/01/24");
    XDate notSameDay = new XDate("1789/01/25");
    XDate notSameMonth = new XDate("1789/02/25");

    Assertions.assertTrue(date.isSameDay(sameDay));
    Assertions.assertFalse(date.isSameDay(notSameDay));
    Assertions.assertFalse(date.isSameDay(notSameMonth));
  }

  // No need for equality test - records handle it automatically!
}
