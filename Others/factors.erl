-module(factors).
-export([findFactors/2, main/1, num/2]).

num([H|T], Count) -> num(T, Count + 1);
num([], Count) -> Count.

findFactors(Num, I) ->          %when I < (Num / 2)
    Quotient = Num div 2,
    if
        I =< Quotient ->
            if
                Num rem I =:= 0 -> 
                    [I | findFactors(Num, I + 1)];
                true -> 
                    findFactors(Num, I + 1) end; %[1 | findFactors(Num, I + 1)] end;
        true -> [] end.
% findFactors(_, _) -> io:format("Empty Values"), [].

main(N) ->
    X = findFactors(N, 2),
    Length = num(X, 0),
    if
        Length =:= 0 -> io:format("Entered Number ~w is a prime number and the only factor is :~w. ~n", [N, N]);
        true -> io:format("Factors:~w ~n", [X]) end.
        





    % io:format("Factors:~w...Length::~w.~n", [X, Length]).
    % Y = lists:usort(X),
    % Z = lists:delete(1, Y),
    % io:format("Factors:~w...~n Y:~w ~nZ:~w", [X, Y, Z]).