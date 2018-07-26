% The prime factors of 13195 are 5, 7, 13 and 29.

% What is the largest prime factor of the number 600851475143 ?
%prime_factor:main(600851475143).     Ans:6857

-module(prime_factor).
-export([main/1]).

main(N) ->
    X = find_factors(N, 2),
    ReverseSortedList = lists:reverse(lists:sort(X)),
    PHF = find_highest_prime_factorsInList(ReverseSortedList),
    io:format("Factors:~w...~n PrimeHighestFactor:~w ~n", [X, PHF]).

%----------------------------------------   To check Prime Number   ----------------------------------------%
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
%----------------------------------------   To find Factors   ----------------------------------------%
find_factors(Num, I) when I =< (Num div 2)-> 
    case (Num rem I) =:= 0 of
        true -> [I | find_factors(Num div I, 2)];
        false -> find_factors(Num, I + 1) end;
find_factors(Num, _) -> [Num].
%----------------------------------------   To find Prime Factors in a list   ----------------------------------------%
find_highest_prime_factorsInList([H | T]) -> 
    case is_prime(H) of
        1 -> H;
        _ -> find_highest_prime_factorsInList(T) end.





    % io:format("Factors:~w...~n PHF:~w ~n", [X, PHF]),
    % io:format("SortedList:~w...~n", [ReverseSortedList]),
    % Y = lists:usort(X),
    % Z = lists:delete(1, Y),
    % io:format("Prime Factors:~w...~n Y:~w ~nZ:~w", [X, Y, Z]).


% find_factors(Num, I) ->          %when I < (Num / 2)
%     Quotient = Num div 2,
%     io:format("Num::~w, I::~w Q::~w ~n", [Num, I, Quotient]),
%     if
%         I =< Quotient ->
%             if
%                 Num rem I =:= 0 -> 
%                     [I | find_factors(Num div I, 2)];
%                 true -> 
%                     find_factors(Num, I + 1) end; %[1 | find_factors(Num, I + 1)] end;
%         true -> [Num] end.