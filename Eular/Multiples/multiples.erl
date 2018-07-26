% If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
% Find the sum of all the multiples of 3 or 5 below 1000.

-module(multiples).
-export([sum_of_multiples3and5/1]).

sum_of_multiples3and5(Temp) -> 
   Q = for(Temp, []),
   TotalSum = sum_of_elements_in_list(Q),
   io:format("Q:::~p sum::: ~p. ~n", [Q, TotalSum]).

%----------------------------------------   Sum of elements in list   ----------------------------------------%
sum_of_elements_in_list(L) -> sum_of_elements_in_list(L, 0).

sum_of_elements_in_list([H|T], Acc) -> sum_of_elements_in_list(T, H+Acc);
sum_of_elements_in_list([], Acc) -> Acc.
%----------------------------------------   Mod of X, Y   ----------------------------------------%
mod(X, Y) when X > 0 -> X rem Y;
mod(X, Y) when X < 0 -> Y+X rem Y;
mod(0,_) -> 0.

%---------------------------------------   Finding multiple of 3 or 5 below N   ---------------------------------------%
for(0, Acc) -> Acc;
for(N, Acc) when N > 0 ->
    X = mod(N, 3),
    Y = mod(N, 5),
    if
            X =:= 0 -> for(N - 1, [N | Acc]);
            Y =:= 0 -> for(N - 1, [N | Acc]);
            true -> for(N - 1, Acc)
    end.