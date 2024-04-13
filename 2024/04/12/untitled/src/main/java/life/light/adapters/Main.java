package life.light.adapters;

import life.light.EnvController;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
       Termometer termometer = new Termometer();
       EnvController envController = new EnvController(new PhilipsEngine());

       while (true) {
           //  wait some time
           envController.handleTemperature(termometer.getTemperature());
       }
    }
}
