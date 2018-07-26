% 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
% What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

%Ans%
%%c(lcm).
%%lcm:lcmOfSeriesFrom(1, 10).       Ans::2520
%%lcm:lcmOfSeriesFrom(1, 20).       Ans::232792560

-module(lcm).
-export([lcmOfSeriesFrom/2]).

lcmOfSeriesFrom(I, J) -> lcmOfASeries(I, J, 1).

%----------------------------------------   To find GCD of 2 numbers   ----------------------------------------%
gcd(A, A) -> A;
gcd(A, B) when A > B -> gcd(A - B, B);
gcd(A, B) -> gcd(A, B - A).
%----------------------------------------   To find LCM of 2 numbers   ----------------------------------------%
lcm(A, B) -> (A * B) div gcd(A, B).
%----------------------------------------   LCM of a Series   ----------------------------------------%
lcmOfASeries(X, X, LCM) -> LCM;
lcmOfASeries(X, Y, LCM) -> 
    Temp = lcm(LCM, Y),
    lcmOfASeries(X, Y - 1, Temp).
