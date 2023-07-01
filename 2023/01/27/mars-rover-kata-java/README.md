Mars Rover Kata
===============

This code is a part of the [Java Tutorial Through Katas: Mars Rover](http://technologyconversations.com/2014/10/17/java-tutorial-through-katas-mars-rover/) article published on [Technology Conversations](http://technologyconversations.com/) article.

Description
-----------

Develop an api that moves a rover around on a grid.

* You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
* The rover receives a character array of commands.
* Implement commands that move the rover forward/backward (f,b).
* Implement commands that turn the rover left/right (l,r).
* Implement wrapping from one edge of the grid to another. (planets are spheres after all)
* Implement obstacle detection before each move to a new square. 
If a given sequence of commands encounters an obstacle, the rover moves up to the last possible point and reports the obstacle.

Source: [Dallas Hack Club](http://dallashackclub.com/rover).

Implementation
--------------

Recommended approach to solve this kata is by using [TDD](http://technologyconversations.com/2014/09/30/test-driven-development-tdd/).
Code in this repo is written in Java 7 with [AssertJ](http://joel-costigliola.github.io/assertj/) for tests.
Tasks execution (compile, test, etc) is done with [Gradle](http://www.gradle.org/).

Running
-------

To run all tests:

```bash
gradle test
```

For more details please visit the [Java Tutorial Through Katas: Mars Rover](http://technologyconversations.com/2014/10/17/java-tutorial-through-katas-mars-rover/) article published on [Technology Conversations](http://technologyconversations.com/) article.