flight((af514, 0, 5, 10)).
flight((co5, 3, 7, 14)).
flight((af515, 5, 9, 7)).
flight((ba01, 6, 9, 8)).
flight((ba02, 20, 22, 1)).

schedulable(Flights) :-
  Flights = [];

  Flights = [ F | []],
  flight(F);

  Flights = [First | Rest],
  flight(First),
  Rest = [Next | _],
  Next = (_, StartNext, _, _),
  flight(Next),
  First = (_, _, EndFirst, _),
  StartNext >= EndFirst,
  schedulable(Rest).

value(Sum, Schedule) :-
  Schedule = [],
  Sum = 0;

  schedulable(Schedule),
  Schedule = [(_, _, _, Money) | Rest],
  value(RestOfMoney, Rest),
  Sum is Money + RestOfMoney.

mostBenefits(Profit, Schedules) :-
  Schedules = [],
  Profit = 0;

  Schedules = [Schedule | Rest],
  value(Value, Schedule),
  mostBenefits(OtherBenefits, Rest),
  Value > OtherBenefits,
  Profit = Value.
