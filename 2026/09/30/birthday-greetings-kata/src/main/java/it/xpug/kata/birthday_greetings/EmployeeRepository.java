package it.xpug.kata.birthday_greetings;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

class EmployeeRepository {
  private final BufferedReader in;

  EmployeeRepository(String fileName) throws IOException {
    in = new BufferedReader(new FileReader(fileName));
  }

  List<Employee> readAll() throws IOException, ParseException {
    String str = "";
    str = in.readLine(); // skip header
    List<Employee> employees = new ArrayList<>();
    while ((str = in.readLine()) != null) {
      String[] employeeData = str.split(", ");
      employees.add(
          new Employee(employeeData[1], employeeData[0], employeeData[2], employeeData[3]));
    }
    return employees;
  }
}
