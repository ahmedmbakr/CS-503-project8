% [facts].
use_module(facts).
pay(First, Last, Pay) :-
    salaried(First, Last, Pay).

pay(First, Last, Pay) :- 
    hourly(First, Last, Hours, Rate),
    between(0, 40, Hours),
    Pay is Hours * Rate.

pay(First, Last, Pay) :-
    hourly(First, Last, Hours, Rate),
    between(41, 50, Hours),
    Pay is (40 * Rate) + ((Hours - 40) * Rate * 1.5).

pay(First, Last, Pay) :-
    hourly(First, Last, Hours, Rate),
    Hours > 50,
    Pay is (40 * Rate) + (10 * Rate * 1.5) + ((Hours - 50) * Rate * 2).

pay(First, Last, Pay) :-
    commission(First, Last, Base, Sales, CommissionRate),
    Pay1 is (Sales * CommissionRate),
    Pay2 is Base,
    Pay is max(Pay1, Pay2).
