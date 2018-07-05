% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
% Find the sum of all the primes below two million.

%c(sumOfPrimes).
%sumOfPrimes:sumOfPrimesBelow(2000000).                 Ans is: 142913828922

-module(sumOfPrimes).
-export([sumOfPrimesBelow/1]).

sumOfPrimesBelow(MaxLimit) -> sumOfPrimesBelow(2, 0, MaxLimit).

sumOfPrimesBelow(ML, Sum, ML) -> io:format("The Sum of all primes below ~w is ~w. ~n", [ML, Sum]);
sumOfPrimesBelow(Num, Sum, MaxLimit) ->
    PrimeCheck = isPrime(Num),
    if
        PrimeCheck =:= 1 -> io:format("Prime Num:~w. ~n", [Num]), sumOfPrimesBelow(Num + 1, Sum + Num, MaxLimit);
        true -> sumOfPrimesBelow(Num + 1, Sum, MaxLimit) end.

%%%%%  %%%%%  %%%%%  %%%%%  %%%%%  Is Prime Number %%%%%  %%%%%  %%%%%  %%%%%  %%%%%
isPrime(Num) -> isPrime(Num, 2).
isPrime(Num, Num) when Num > 0 -> 1;
isPrime(0, 0) -> 0;
isPrime(N, I) ->        %when I =< (N div 2)
    Quotient = N div 2,
    if
        I =< Quotient ->
            if
                N rem I =/= 0 ->
                    if
                        (I + 1) >= (N div 2) -> isPrime(1, 1);
                        true -> isPrime(N, I+1) end;
                true -> isPrime(0, 0) end;
        true -> isPrime(1, 1) end.
%%%%%  %%%%%  %%%%%  %%%%%  %%%%%  Find Nth Prime Prime Number %%%%%  %%%%%  %%%%%  %%%%%  %%%%%