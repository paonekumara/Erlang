-module(prime).
-export([isPrime/2, main/1]).

isPrime(N, I) when I < N/2 -> 
    io:format("::::: ~w iteration ~n", [I]),
    if 
        N rem I =/= 0 -> io:format(":::::~w rem ~w ~n", [N, I]), isPrime(N, I+1);
        true -> isPrime(0, 0)
    end;
isPrime(_, _) -> io:format("Entered Number is not a prime number...~n"), 0.

main(N) ->
    X = isPrime(N, 2),
    io:format("X::~w ~n", [X]),
    if
        X =:= 0 -> io:format("~w is not a Prime Number ~n", [N]);
        true -> io:format("~w is a Prime Number ~n", [N])
    end.