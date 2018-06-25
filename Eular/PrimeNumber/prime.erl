% Find entered number is a prime number or not
-module(prime).
-export([isPrime/2, main/1]).

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

main(N) ->
    X = isPrime(N, 2),
    if
        X =:= 0 -> io:format("~w is not a Prime Number ~n", [N]);
        true -> io:format("~w is a Prime Number ~n", [N])
    end.