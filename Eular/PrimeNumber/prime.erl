-module(prime).
-export([isPrime/2, main/1]).

isPrime(N, I) when I < N/2 -> 
    io:format("::::: ~w iteration ~n", [I]),
    Temp = N/2,
    if 
        N rem I =/= 0 -> io:format(":::::~w rem ~w Temp::~w~n", [N, I, Temp]),
            if
                (I + 1) > Temp -> 1;
                true -> isPrime(N, I + 1) end;
        true -> isPrime(0, 0)
    end;
isPrime(2, 2) -> io:format("Entered Number is a prime number...~n"), 1;
isPrime(1, 1) -> io:format("Entered Number is a prime number...~n"), 1;
isPrime(0, 0) -> io:format("Entered Number is not a prime number...~n"), 0.

main(N) ->
    X = isPrime(N, 2),
    io:format("X::~w ~n", [X]),
    if
        X =:= 0 -> io:format("~w is not a Prime Number ~n", [N]);
        true -> io:format("~w is a Prime Number ~n", [N])
    end.