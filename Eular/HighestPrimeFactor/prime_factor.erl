% The prime factors of 13195 are 5, 7, 13 and 29.

% What is the largest prime factor of the number 600851475143 ?
%       Ans:6857

-module(prime_factor).
-export([isPrime/2, findFactors/2, findHighestPrimeFactorsInList/1, main/1]).

%%%%%   %%%%%   %%%%%   %%%%%   %%%%%  To check Prime  %%%%%   %%%%%   %%%%%   %%%%%   %%%%%
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
%%%%%   %%%%%   %%%%%   %%%%%   %%%%%   To find Factors   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%
findFactors(Num, I) ->          %when I < (Num / 2)
    Quotient = Num div 2,
    io:format("Num::~w, I::~w Q::~w ~n", [Num, I, Quotient]),
    if
        I =< Quotient ->
            if
                Num rem I =:= 0 -> 
                    [I | findFactors(Num div I, 2)];
                true -> 
                    findFactors(Num, I + 1) end; %[1 | findFactors(Num, I + 1)] end;
        true -> [Num] end.

%%%%%   %%%%%   %%%%%   %%%%%   %%%%%   To find Prime Factors in a list   %%%%%   %%%%%   %%%%%   %%%%%   %%%%% 

findHighestPrimeFactorsInList([H | T]) -> 
    IsPrime = isPrime(H, 2),
    if
        IsPrime =:= 1 -> H;
        true -> findHighestPrimeFactorsInList(T) end.

%%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%   %%%%%
main(N) ->
    X = findFactors(N, 2),
    ReverseSortedList = lists:reverse(lists:sort(X)),
    PHF = findHighestPrimeFactorsInList(ReverseSortedList),
    io:format("Factors:~w...~n PrimeHighestFactor:~w ~n", [X, PHF]).






    % io:format("Factors:~w...~n PHF:~w ~n", [X, PHF]),
    % io:format("SortedList:~w...~n", [ReverseSortedList]),
    % Y = lists:usort(X),
    % Z = lists:delete(1, Y),
    % io:format("Prime Factors:~w...~n Y:~w ~nZ:~w", [X, Y, Z]).