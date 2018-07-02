% 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
% What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

%Ans%
%%c(lcm).
%%lcm:lcmOfSeriesFrom(1, 10).       Ans::2520
%%lcm:lcmOfSeriesFrom(1, 20).       Ans::232792560

-module(lcm).
-export([gcd/2, lcm/2, lcmOfSeriesFrom/2]).

lcmOfSeriesFrom(I, J) -> lcmOfASeries(I, J, 1).

gcd(A, A) -> A;
gcd(A, B) -> 
    if
        A > B -> gcd(A - B, B);
        true -> gcd(A, B - A) end.

lcm(A, B) ->
    (A * B) div gcd(A, B).

lcmOfASeries(X, X, LCM) -> LCM;
lcmOfASeries(X, Y, LCM) -> 
    % io:format("x:::~w......y:::~w ~n", [X, Y]),
    Temp = lcm(LCM, Y),
    lcmOfASeries(X, Y - 1, Temp).
