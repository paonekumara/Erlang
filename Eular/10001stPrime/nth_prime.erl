% By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
% What is the 10,001st prime number?

%Ans::      nth_prime:find_nth_prime(10001).        %%:::104743

-module(nth_prime).
-export([find_nth_prime/1]).
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

%----------------------------------------   Find Nth Prime Number   ----------------------------------------%
find_nth_prime(NthPNum) -> find_nth_prime(2, NthPNum, 0).

find_nth_prime(Num, X, X) -> (Num - 1);
find_nth_prime(Num, Nth, PrimeNumberCount) -> 
    case is_prime(Num) of
        1 -> find_nth_prime(Num + 1, Nth, PrimeNumberCount + 1);
        _ -> find_nth_prime(Num + 1, Nth, PrimeNumberCount) end.






%----------------------------------------   Using If   ----------------------------------------%
% is_prime(N, I) ->        %when I =< (N div 2)
%     Quotient = N div 2,
%     if
%         I =< Quotient ->
%             if
%                 N rem I =/= 0 ->
%                     if
%                         (I + 1) >= (N div 2) -> is_prime(1, 1);
%                         true -> is_prime(N, I+1) end;
%                 true -> is_prime(0, 0) end;
%         true -> is_prime(1, 1) end.

% find_nth_prime(Num, Nth, PrimeNumberCount) -> 
%     CheckPrime = is_prime(Num),
%     if 
%         CheckPrime =:= 1 -> find_nth_prime(Num + 1, Nth, PrimeNumberCount + 1);
%         true -> find_nth_prime(Num + 1, Nth, PrimeNumberCount) end.
