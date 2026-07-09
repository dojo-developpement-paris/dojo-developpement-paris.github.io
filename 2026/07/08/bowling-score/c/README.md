# The bowling score kata -- C

A game of bowling consists of ten frames. In each frame, the bowler will have two chances to knock down as many pins as possible with their bowling ball. In games with more than one bowler, as is common, every bowler will take their frame in a predetermined order before the next frame begins. If a bowler is able to knock down all ten pins with their first ball, he is awarded a strike. If the bowler is able to knock down all 10 pins with the two balls of a frame, it is known as a spare. Bonus points are awarded for both of these, depending on what is scored in the next 2 balls (for a strike) or 1 ball (for a spare). If the bowler knocks down all 10 pins in the tenth frame, the bowler is allowed to throw 3 balls for that frame. This allows for a potential of 12 strikes in a single game, and a maximum score of 300 points, a perfect game.

## Specifications
To make the expected behavior of the program clearer, here are some specs, in the format usually displayed on the SPOJ online judge. The program will read the input stream and print results on the output stream.

### Input
- t – the number of test cases, then t test cases follows.
- each test case consists in 2 lines:
    - n - the number of rolls delivered, ( 0 < n ≤ 21 )
    - r1,..rn - the rolls delivered ( 0 ≤ r ≤ 10 )

### Output
For each test case output one integer: the score made by the player after they played all the rolls in the test case.

## Example
### Input
    3
    2
    4 6
    4
    10 7 3 5
    12
    10 10 10 10 10 10 10 10 10 10 10 10
### Output
    10
    40
    300


