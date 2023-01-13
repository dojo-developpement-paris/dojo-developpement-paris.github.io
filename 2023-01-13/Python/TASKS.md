# TASKS

At LAGS (Louez votre Avion et Gagnez des Sous), we have an airplane that we offer to air companies. 
Mr. Robinson, the CEO of our company, uses a special program that was made for him a long time ago to predict the company's revenue for a specific list of orders.
This program used to work perfectly well until last week when some change in the way are to be represented has been made. So the program had to evolve.
Unfortunately, the author of this program is no longer with us, as he retired some 15 years ago.
So Mr. Robinson asked his nephew, who is currently an intern at the company, to see if could change the program and make it work with the new order file format.
His nephew said repairing the program was hopeless, as it was too badly designed, but he proposed to do a rewrite. 
That's the program you have on this repository.

Where's David you ask ? Hmm I think he's on vacation with his uncle. For all I know they are probably sailing somewhere between Ionan Sea and Corsica, not sure.

Do we have the previous version of the program ? Ah there's a problem with that : David says he deleted it. That was the day before their going on vacation..

## 1) Explain what the code does

We think it's time we invest a bit on this program and maybe document it. It's important after all. Also we think that having some tests would be good. David thinks otherwise, but we are sure he will be please to have them when he's back.

## 2) Can you fix a bug?
The initial program, given the `ORDERS.TXT`, would output _15801153_, which is known to be the correct result for that set of orders.
The current program, given the same file, outputs _15801048_. It's not a big difference, but still.
Given another set of orders, like in the file `SMALL.TXT`, though, both programs output the same result, so there is hope.

## 3) Please make the program run faster

I'm sure you've noticed it, but David's program is awfully slow. Taking several dozens of seconds to compute 30000 orders is unacceptable. The initial program was blazingly fast, but also it was impossible to adapt it  to the new format, so what do I know.

Should we expect larger sets of orders in the future ? I don't think so. The business is a bit on the decline, sadly. 

## 4) We need a new feature

Mr. Robinson likes to have this program available, but he would be really pleased if instead of just predicting the total revenue for the given set of orders, the program could tell us which orders in the set are contributing to the revenue. Mr. Robinson used to give this example where he used a small set -- I believe they are in the file named `SAMPLE.TXT` -- and I took note of it :

Given the orders:
- `FOO` from 0 to 10 at price 100, 
- `BAR` from 3 to 12 at price 140,
- `QUX` from 10 to 15 at price 70,
- `BAZ` from 11 to 17 at price 80

not only the program should output : 180, which is the correct revenue we expect from such a set, but also the orders to accept, like this:

```
FOO   : 100
BAZ   :  80
total : 180
```
 

