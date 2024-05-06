# Movie Rental

This source code follows Martin Fowler's book "Refactoring, Improving the Design of Existing Code".

When you find you have to add a feature to a program, and the program's code is not
structured in a convenient way to add the feature, first refactor the program to make it
easy to add the feature, then add the feature.

Whenever you do refactoring, the first step is always the same.
You need to build a solid set of tests for that section of code. The tests are essential because even
though you follow refactorings structured to avoid most of the opportunities for introducing bugs,
you are still human and still make mistakes. Thus you need solid tests.

Actualy the `statement` method prints out a simple text output of a rental statement
```
Rental Record for martin
  Ran 3.5
  Trois Couleurs: Bleu 2
Amount owed is 5.5
You earned 2 frequent renter points
```
We want to write an HTML version of the statement method :
```
<h1>Rental Record for <em>martin</em></h1>
<table>
  <tr><td>Ran</td><td>3.5</td></tr>
  <tr><td>Trois Couleurs: Bleu</td><td>2</td></tr>
</table>
<p>Amount owed is <em>5.5</em></p>
<p>You earned <em>2</em> frequent renter points</p>
```

## Usage

The purpose of this is to provide good examples for the refactoring workshop.

## Build

All you need to build this project is nodejs.

## Testing

Unit tests can be run using npm:

    $ npm test

or 

    $ npm test -- --watchAll

Tests are located in the src directory and run using jest.
