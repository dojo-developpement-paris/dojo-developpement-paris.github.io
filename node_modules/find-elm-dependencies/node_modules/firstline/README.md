# Firstline

[![Travis](https://img.shields.io/travis/pensierinmusica/firstline.svg)](https://travis-ci.org/pensierinmusica/firstline)
[![David](https://img.shields.io/david/pensierinmusica/firstline.svg)](https://www.npmjs.com/package/firstline)
[![npm](https://img.shields.io/npm/v/firstline.svg)](https://www.npmjs.com/package/firstline)

## Introduction

Firstline is a [npm](http://npmjs.org) async module for [NodeJS](http://nodejs.org/), that **reads and returns the first line of any file**. It uses native JS promises and streams (requires Node >= v4.0.0). It is well tested and built for high performance.

It is particularly suited when you need to programmatically access the first line of a large amount of files, while handling errors if they occur.

## Install

`npm install firstline`

(add "--save" if you want the module to be automatically added to your project's "package.json" dependencies)

`var firstline = require(firstline)`

## API

`firstline(filepath)`

Incrementally reads data from "filepath" until it reaches the end of the first line. Returns a promise, eventually fulfilled with a string.

```javascript
// Imagine the file content is:
// abc
// def
// ghi
//

firstline('./my-file.txt')
// -> Returns a promise that will be fulfilled with: 'abc'
```

***

MIT License