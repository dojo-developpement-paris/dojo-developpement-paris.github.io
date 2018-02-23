var _ = require('lodash');
var murmur = require('./index');
var expect = require('chai').expect;
var data = require('./testData.json');

describe('murmur', function() {
  describe('murmur2', function() {
    it('should generate expected values', function() {
      _.each(data.murmur2, function(value, key) {
        expect(murmur.murmur2(key)).to.equal(value);
      });
    });
  });
  describe('murmur3', function() {
    it('should generate expected values', function() {
      _.each(data.murmur3, function(value, key) {
        expect(murmur.murmur3(key)).to.equal(value);
      });
    });
  });
});
