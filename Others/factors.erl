-module(factors).
-export([findFactors/2, main/1]).

findFactors(Num, I) when I < (Num / 2) ->
    if
        Num rem I =:= 0 -> 
            [I | findFactors(Num, I + 1)];
        true -> 
            [1 | findFactors(Num, I + 1)]
     end;
findFactors(_, _) -> [].

main(N) ->
    X = findFactors(N, 2),
    Y = lists:usort(X),
    Z = lists:delete(1, Y),
    io:format("Factors:~w...~n Y:~w ~nZ:~w", [X, Y, Z]).