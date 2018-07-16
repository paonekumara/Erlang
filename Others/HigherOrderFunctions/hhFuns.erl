-module(hhFuns).
-compile(export_all).
% -export([export_all]).


one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

increment([]) -> [];
increment([H|T]) -> [H + 1 | increment(T)].

decrement([]) -> [];
decrement([H|T]) -> [H - 1 | decrement(T)].

incr(X) -> X + 1.
decr(X) -> X - 1.
map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F, T)].

% hhFuns:map(fun(X) -> X + 1 end, L1).
% L1= [1, 2, 3, 4].
% hhFuns:map(fun hhFuns:incr/1, L1).
% A = hhFuns:map(fun hhFuns:decr/1, L1).
% A = hhFuns:map(fun hhFuns:decr/1, A).

base(A) -> 
    B = A + 1,
    F = fun() -> A + B end,
    F().


% base(A) -> 
%     B = A + 1,
%     F = fun() -> C = A + B end,
%     F(),
%     C.%C is unbound as it is not in the scope of child function....

a() -> 
    Secret = "Poney",
    fun() -> Secret end.

b(F) -> "a/0's password is"++F().
% hhFuns:b(hhFuns:a()).


%% only keep even numbers
even(L) -> lists:reverse(even(L,[])).

even([], Acc) -> Acc;
even([H|T], Acc) when H rem 2 == 0 ->
    even(T, [H|Acc]);
even([_|T], Acc) ->
    even(T, Acc).

%% only keep men older than 60
old_men(L) -> lists:reverse(old_men(L,[])).

old_men([], Acc) -> Acc;
old_men([Person = {male, Age}|People], Acc) when Age > 60 ->
    old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
    old_men(People, Acc).


filter(Pred, L) -> lists:reverse(filter(Pred, L,[])).

filter(_, [], Acc) -> Acc;
filter(Pred, [H|T], Acc) ->
    case Pred(H) of
        true  -> filter(Pred, T, [H|Acc]);
        false -> filter(Pred, T, Acc)
    end.

fold(_, Result, []) -> Result;
fold(F, Result, [H | T]) -> fold(F, F(H, Result), T).