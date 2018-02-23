/**
 * JS Implementation of MurmurHash2
 * 
 * @author <a href="mailto:gary.court@gmail.com">Gary Court</a>
 * @see http://github.com/garycourt/murmurhash-js
 * @author <a href="mailto:aappleby@gmail.com">Austin Appleby</a>
 * @see http://sites.google.com/site/murmurhash/
 * 
 * @param {string}|{Buffer} key
 * @param {number} seed Positive integer only
 * @return {number} 32-bit positive integer hash
 */

function murmurhash2_32_gc(key, seed) {
  seed = seed || 0x01234567;
  var l = key.length;
  var h = seed ^ l;
  var i = 0;
  var k;
  
  if (!Buffer.isBuffer(key)) {
    key = new Buffer(key);
  }

  while (l >= 4) {
    k = key.readInt32LE(i, i + 4);
    k = (((k & 0xffff) * 0x5bd1e995) + ((((k >>> 16) * 0x5bd1e995) & 0xffff) << 16));
    k ^= k >>> 24;
    k = (((k & 0xffff) * 0x5bd1e995) + ((((k >>> 16) * 0x5bd1e995) & 0xffff) << 16));
    h = (((h & 0xffff) * 0x5bd1e995) + ((((h >>> 16) * 0x5bd1e995) & 0xffff) << 16)) ^ k;
    l -= 4;
    i += 4;
  }
  
  switch (l) {
  case 3: h ^= (key[i + 2] & 0xff) << 16;
  case 2: h ^= (key[i + 1] & 0xff) << 8;
  case 1: h ^= (key[i] & 0xff);
          h = (((h & 0xffff) * 0x5bd1e995) + ((((h >>> 16) * 0x5bd1e995) & 0xffff) << 16));
  }

  h ^= h >>> 13;
  h = (((h & 0xffff) * 0x5bd1e995) + ((((h >>> 16) * 0x5bd1e995) & 0xffff) << 16));
  h ^= h >>> 15;

  return h >>> 0;
}

module.exports = murmurhash2_32_gc
