'use strict';

var fs = require('fs');

module.exports = function (path) {
  return new Promise(function (resolve, reject) {
    var rs = fs.createReadStream(path, {encoding: 'utf8'});
    var acc = '';
    var pos = 0;
    var index;
    rs
      .on('data', function (chunk) {
        index = chunk.indexOf('\n');
        acc += chunk;
        if (index === -1) {
          pos += chunk.length;
        } else {
          pos += index;
          rs.close();
        }
      })
      .on('close', function () {
        resolve(acc.slice(0, pos));
      })
      .on('error', function (err) {
        reject(err);
      })
  });
};
