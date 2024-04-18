% [facts].
% [rules].

mycompare(X, 'eq', Y) :- X =:= Y.
mycompare(X, 'ne', Y) :- X =\= Y.
mycompare(X, 'gt', Y) :- X > Y.
mycompare(X, 'ge', Y) :- X >= Y.
mycompare(X, 'lt', Y) :- X < Y.
mycompare(X, 'le', Y) :- X =< Y. % Less than or equal operation is flipped.

list(Op, Ref, List) :-
    % findall(Template, Goal, List) 
    % Template: This is the structure of the elements that will be included in the output list.
    % Goal: This is the condition that needs to be satisfied for an element to be included in the output list.
    % List: This is the output list that will contain all the elements that satisfy the condition.
    findall([First, Last, Pay], (pay(First, Last, Pay), mycompare(Pay, Op, Ref)), List).
    % pay(First, Last, Pay),
    % mycompare(Pay, Op, Ref), 
    % append([First], [Last], List1),
    % append(List1, [Pay], List).

count(Op, Ref, Count) :-
    list(Op, Ref, List),
    length(List, Count).

max(Op, Ref, Max) :-
    findall(Pay, (pay(First, Last, Pay), mycompare(Pay, Op, Ref)), List),
    max_list(List, Max).

min(Op, Ref, Min) :-
    findall(Pay, (pay(First, Last, Pay), mycompare(Pay, Op, Ref)), List),
    min_list(List, Min).

total(Op, Ref, Sum) :-
    findall(Pay, (pay(First, Last, Pay), mycompare(Pay, Op, Ref)), List),
    sum_list(List, Sum).

avg(Op, Ref, Avg) :-
    total(Op, Ref, Sum),
    count(Op, Ref, Count),
    Avg is Sum / Count.
