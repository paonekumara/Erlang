% The prime factors of 13195 are 5, 7, 13 and 29.

% What is the largest prime factor of the number 600851475143 ?


-module(prime_factor).
-export([findPrimeFactors/3, main/1]).

%%%%%   %%%%%   %%%%%   %%%%%   %%%%%  To check Prime  %%%%%   %%%%%   %%%%%   %%%%%   %%%%%
isPrime(N, I) when I < N/2 -> 
    Temp = N div I,
    io:format("::::: ~w iteration N::~w  Temp::~w ~n", [I, N, Temp]),
    if 
        N rem I =/= 0 -> io:format(":::::~w rem ~w Temp::~w~n", [N, I, Temp]),
            if
                (I + 1) > Temp -> 1;
                true -> isPrime(N, I + 1) end;
        true -> isPrime(0, 0)
    end;
isPrime(3, 2) -> io:format("Entered Number is a prime number...~n"), 1;
isPrime(2, 2) -> io:format("Entered Number is a prime number...~n"), 1;
isPrime(1, 1) -> io:format("Entered Number is a prime number...~n"), 1;
isPrime(0, 0) -> io:format("Entered Number is not a prime number...~n"), 0.
%%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%

%%%%%   %%%%%   %%%%%   %%%%%   %%%%%   To find Factors   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%
findPrimeFactors(Num, Q, I) when I < (Q / 2) ->
io:format("Num:::~w Q:::~w I is:~w ~n", [Num, Q, I]),
Remainder = Q rem I,
    if
        Remainder =:= 0 ->
            Devidend = Q div I,
            IsPrimeNumber = isPrime(Devidend, 2),
            io:format("Dividend:~w:::::isPrime::~w ~n", [Devidend, IsPrimeNumber]),
            if 
                IsPrimeNumber =:= 1 -> [Devidend];
                true -> 
                    io:format("rem:::~w  I is:~w:::Q::~w ~n", [Remainder, I, Q]),
                    [I | findPrimeFactors(Num, Devidend, 2)] end;
        true -> 
            io:format("rem:::~w  I :~w is not a factor... ~n", [Num rem I, I]),
            [1 | findPrimeFactors(Num, Q, I + 1)] %findPrimeFactors(Num, I + 1)
     end;
findPrimeFactors(_, _, _) -> io:format("~n ...Empty... ~n"),[].
%%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%
main(N) ->
    X = findPrimeFactors(N, N, 2),
    Y = lists:usort(X),
    Z = lists:delete(1, Y),
    io:format("Prime Factors:~w...~n Y:~w ~nZ:~w", [X, Y, Z]).