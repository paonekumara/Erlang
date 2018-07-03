% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
% What is the 10,001st prime number?


-module(nThPrime).
-export([findNthPrime/1]).
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
findNthPrime(NthPNum) -> findNthPrimeNumber(2, NthPNum, 0).

findNthPrimeNumber(Num, X, X) -> (Num - 1);
findNthPrimeNumber(Num, Nth, PrimeNumberCount) -> 
    CheckPrime = isPrime(Num),
    if 
        CheckPrime =:= 1 -> findNthPrimeNumber(Num + 1, Nth, PrimeNumberCount + 1);
        true -> findNthPrimeNumber(Num + 1, Nth, PrimeNumberCount) end.


