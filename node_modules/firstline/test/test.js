'use strict';

var promisify = require('js-promisify');
var chai = require('chai');
var chaiAsPromised = require("chai-as-promised");
var should = require('chai').should();
var fs = require('fs');
var path = require('path');
var rimraf = require('rimraf');

var firstline = require('../index.js');
var mocks = require('./mocks.js');

chai.use(chaiAsPromised);

describe('firstline', function () {

  var dirPath = path.join(__dirname, 'tmp/');
  var filePath = dirPath + 'test.txt';
  var wrongFilePath = dirPath + 'no-test.txt';

  before(function () {
    // Make "tmp" folder
    fs.mkdirSync(dirPath);
  });

  after(function () {
    // Delete "tmp" folder
    rimraf.sync(dirPath);
  });

  describe('#check', function () {

    afterEach(function () {
      // Delete mock CSV file
      return promisify(fs.unlink, [filePath]);
    });

    it('should reject if file does not exist', function () {
      return promisify(fs.writeFile, [filePath, mocks.shortLine])
      .then(function () {
        return firstline(wrongFilePath).should.be.rejected;
      });
    });

    it('should return the first short line of file', function () {
      return promisify(fs.writeFile, [filePath, mocks.shortLine])
      .then(function () {
        return firstline(filePath).should.eventually.equal('abc');
      });
    });

    it('should return the first long line of file', function () {
      return promisify(fs.writeFile, [filePath, mocks.longLine])
      .then(function () {
        return firstline(filePath).should.eventually.equal(mocks.longLine.split('\n')[0]);
      });
    });

    it('should return the first empty line of file', function () {
      return promisify(fs.writeFile, [filePath, ''])
      .then(function () {
        return firstline(filePath).should.eventually.equal('');
      });
    });

  });

});
