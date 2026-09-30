package it.xpug.kata.birthday_greetings;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class EmployeeTest {

  @Test
  void testBirthday() throws Exception {
    Employee employee = new Employee("foo", "bar", "1990/01/31", "a@b.c");

    Assertions.assertFalse(employee.isBirthday(new XDate("2008/01/30")));
    Assertions.assertTrue(employee.isBirthday(new XDate("2008/01/31")));
  }
}
