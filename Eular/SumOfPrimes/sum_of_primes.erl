% The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
% Find the sum of all the primes below two million.

%c(sum_of_primes).
%sum_of_primes:sum_of_primes_below(2000000).                 Ans is: 142913828922

-module(sum_of_primes).
-export([sum_of_primes_below/1]).

sum_of_primes_below(MaxLimit) -> sum_of_primes_below(2, 0, MaxLimit).

sum_of_primes_below(ML, Sum, ML) -> io:format("The Sum of all primes below ~w is ~w. ~n", [ML, Sum]);
sum_of_primes_below(Num, Sum, MaxLimit) ->
    case is_prime(Num) of
        1 -> io:format("Prime Num:~w. ~n", [Num]), sum_of_primes_below(Num + 1, Sum + Num, MaxLimit);
        _ -> sum_of_primes_below(Num + 1, Sum, MaxLimit) end.
%----------------------------------------   Is Prime Number   ----------------------------------------%
is_prime(Num) -> is_prime(Num, 2).

is_prime(Num, Num) when Num > 0 -> 1;
is_prime(0, 0) -> 0;
is_prime(N, I) when (N div 2) >= I ->
    Rem = N rem I,
    case Rem > 0 of
        true when (I + 1) >= (N div 2) -> is_prime(1, 1);
        true -> is_prime(N, I+1);
        false -> is_prime(0, 0)
    end;
is_prime(_, _) -> is_prime(1, 1).