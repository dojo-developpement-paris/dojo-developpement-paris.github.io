const { register } = require('ts-node')
const TSConsoleReporter = require("jasmine-ts-console-reporter");

register({
  project: '../../tsconfig.json'
});
jasmine.getEnv().clearReporter(); //Clear default console reporter
jasmine.getEnv().addReporter(new TSConsoleReporter());
